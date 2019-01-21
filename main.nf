params.location = 's3://test_kub/ERR371809_1.fastq'
params.publish = 's3://test_kub/results1/'
Channel.fromPath(params.location).set{ch_fastqs1}

process run_fastqc {
    
    publishDir params.publish
    echo true
    
    input:
    	file f from ch_fastqs1

    output:
    	file '*'

    script:

    """
    	fastqc $f
    """

}
