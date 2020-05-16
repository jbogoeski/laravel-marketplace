<template>
    <button class="btn btn-success" @click.prevent="claimProject">Claim Project</button>
</template>

<script>
export default {
    props: {
        projectId: {
            required: true,
            type: Number,
        },
    },
    methods: {
        claimProject() {
            axios.put('/projects/' + this.projectId + '/claim', {})
                .then(response => {
                    window.location.href = response.data.redirect;
                })
                .catch(error => {
                    console.log(error);
                });
        }
    },
}
</script>
