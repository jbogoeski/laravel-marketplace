<template>
    <li class="list-group-item">
        <div class="row">
            <div class="col-md-8 d-flex">
                <h5 class="mb-0 align-self-center">{{ project.title }}</h5>
            </div>
            <div class="col-md-4 text-right">
                <a class="btn btn-primary" :href="'/projects/' + project.id + '/show'">View</a>
                <button class="btn btn-danger" @click.prevent="endProject">End Project</button>
            </div>
        </div>
    </li>
</template>

<script>
import Bus from '../bus';

export default {
    props: {
        project: {
            required: true,
            type: Object,
        },
    },
    methods: {
        endProject() {
            axios.put('/projects/' + this.project.id + '/end-project', {})
                .then(response => {
                    Bus.$emit('claimed-projects-changed');
                })
                .catch(error => {
                    console.log(error);
                });
        },
    },
}
</script>
