<template>
    <div>
        <ul class="list-group" v-if="projects.length > 0">
            <posted-project-item v-for="project in projects" :project="project" :key="project.id" @project-deleted="reloadProjects" />
        </ul>
        <p v-else>No projects posted!</p>
    </div>
</template>

<script>
export default {
    data() {
        return {
            projects: [],
        };
    },
    created() {
        this.reloadProjects();
    },
    methods: {
        reloadProjects() {
            axios.get('/projects/owned')
                .then(response => {
                    this.projects = response.data;
                })
                .catch(error => {
                    console.log(error);
                });
        },
    },
}
</script>
