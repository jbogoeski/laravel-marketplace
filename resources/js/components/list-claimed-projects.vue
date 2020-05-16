<template>
    <div>
        <ul class="list-group" v-if="projects.length > 0">
            <claimed-project-item v-for="project in projects" :project="project" :key="project.id" />
        </ul>
        <p v-else>No projects to show!</p>
    </div>
</template>

<script>
import Bus from '../bus';

export default {
    data() {
        return {
            projects: [],
        };
    },
    created() {
        this._loadClaimedProjects();
        Bus.$on('claimed-projects-changed', this._loadClaimedProjects);
    },
    methods: {
        _loadClaimedProjects() {
            axios.get('/projects/claimed')
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
