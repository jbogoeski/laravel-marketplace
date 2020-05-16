<template>
    <li class="list-group-item">
        <div class="row">
            <div class="col-md-8 d-flex">
                <h5 class="mb-0 align-self-center">{{ project.title }}</h5>
            </div>
            <div class="col-md-4 text-right">
                <button
                    class="btn btn-secondary"
                    :class="{
                        'btn-secondary': !isActive,
                        'btn-success': isActive,
                    }"
                    @click.prevent="toggleActive"
                >{{ isActive ? 'Active' : 'Inactive' }}</button>
                <a class="btn btn-primary" :href="'/projects/' + project.id + '/update'">Edit</a>
                <button class="btn btn-danger" @click.prevent="deleteProject">Delete</button>
            </div>
        </div>
    </li>
</template>

<script>
export default {
    props: {
        project: {
            type: Object,
            required: true,
        },
    },
    data() {
        return {
            isActive: this.project.is_active,
        };
    },
    methods: {
        toggleActive() {
            axios.put('/projects/' + this.project.id + '/toggle-active')
                .then(response => {
                    this.isActive = response.data.is_active;
                })
                .catch(error => {
                    console.log(error);
                });
        },
        deleteProject() {
            axios.delete('/projects/' + this.project.id + '/delete')
                .then(response => {
                    this.$emit('project-deleted');
                })
                .catch(error => {
                    console.log(error);
                });
        },
    },
}
</script>
