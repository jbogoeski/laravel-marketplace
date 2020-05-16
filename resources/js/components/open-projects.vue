<template>
    <div>
        <ul class="list-group" v-if="projects.length > 0">
            <open-project-item v-for="project in projects" :project="project" :key="project.id" />
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
        this._showOpenProjects();

        Bus.$on('search-response', projects => {
            this.projects = projects;
        });

        Bus.$on('empty-search-term', () => {
            this._showOpenProjects();
        });
    },
    methods: {
        _showOpenProjects() {
            axios.get('/projects/list/open')
                .then(response => {
                    this.projects = response.data;
                })
                .catch(error => {
                    console.log(error);
                });
        }
    },
}
</script>
