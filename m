Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2A691A453A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2020 12:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbgDJK0B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Apr 2020 06:26:01 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:40748 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgDJK0A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Apr 2020 06:26:00 -0400
Received: by mail-lf1-f68.google.com with SMTP id 198so1043171lfo.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Apr 2020 03:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=5Ka1EBeOIBN7Xip1m/jcK1PNBiGzFSitTQ9/Dn9oVlk=;
        b=kiErzZW99ioUHOduilY5qDSzF6tnYhHFdkApTlIKgYV8GROump89AA8sK+PSW/Y9hj
         3PfXpfHuajUBIymxswOEwFfA/QKqQe6zJz9E/3do437YllZFMTTPNvTvcAplnqkonv8t
         KDV8qV1pZ09qppfRPbVBLGytyZkXIHeX57cw8DFR2SJhMAb9nUaeGzTyGRLV3XSF4vaH
         upUqtDUdpZEyRu58hBIzM9ZakH3hCaK92ACv6fl5xqSqKM8jbifG7Dggpr8KEfA9Hjmv
         gQZhmWLLPd84e1PIDhhPBvf9AgIA5H3KIZN4yAzX+STqhs0uoN9gC+ul/aVt6BOEOqgD
         TRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=5Ka1EBeOIBN7Xip1m/jcK1PNBiGzFSitTQ9/Dn9oVlk=;
        b=F1OkTaj90vsCRZ1pdDkOIapal0HI43bJGmYMSK8opE+jOAbq+Lko1PLoGJJuKc+DbZ
         tSueNBc0yyJH9Rd+OKDSUh9ndLd1ZwkLQc4KR5fY1oyRFrjInTJa3jqFlmiBxM4BtCPg
         SaaPM13Rk3tSdV7iXkaSPYnV30Y+IpfLKiLIVLO3LAH6zPp2ER+2U7KQe+zcTtRDO8rf
         x+9jRzdVrU63Qg1n440uU0Iiveb0y363HQ4JCzeVCmldZAFT+Rs5n5rD6G3dDXhoKHyU
         XJ5/vboqU0rBTf1cRN5jyuhC8DbhEPo9kZtPBkxDpvzg20cok+81LdjH7VYrPMa1F8WM
         z8Hg==
X-Gm-Message-State: AGi0PuZSBLU+p1scxX5CgHP0R9KQcsRVUVM8ydI2vQnMyIa7PBVL8qDX
        hJeGyyGTHVOYKsIMza+Tk7OYu6rEyFc=
X-Google-Smtp-Source: APiQypKOmEFYNGqJVIOi+A9sRZ1j6b/GL0bDuviFgNVIBdX7C2KnnFsZb6/2Om+IKofSECqsG1FS8g==
X-Received: by 2002:a05:6512:686:: with SMTP id t6mr2309630lfe.163.1586514357429;
        Fri, 10 Apr 2020 03:25:57 -0700 (PDT)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id q4sm1023321lfk.67.2020.04.10.03.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 03:25:56 -0700 (PDT)
Date:   Fri, 10 Apr 2020 12:25:56 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mmc: renesas_sdhi: simplify summary output
Message-ID: <20200410102556.GC2798828@oden.dyn.berto.se>
References: <20200408142252.21958-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200408142252.21958-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your work.

On 2020-04-08 16:22:52 +0200, Wolfram Sang wrote:
> No need to call platform_get_resource twice when we still have the
> pointer from before. Also, use '%pa' for a resource_size_t pointer.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index c002e9fb67fb..de7f4fc9bc21 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -933,10 +933,8 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>  			goto eirq;
>  	}
>  
> -	dev_info(&pdev->dev, "%s base at 0x%08lx max clock rate %u MHz\n",
> -		 mmc_hostname(host->mmc), (unsigned long)
> -		 (platform_get_resource(pdev, IORESOURCE_MEM, 0)->start),
> -		 host->mmc->f_max / 1000000);
> +	dev_info(&pdev->dev, "%s base at %pa, max clock rate %u MHz\n",
> +		 mmc_hostname(host->mmc), &res->start, host->mmc->f_max / 1000000);
>  
>  	return ret;
>  
> -- 
> 2.20.1
> 

-- 
Regards,
Niklas Söderlund
