Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0080B109C83
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2019 11:48:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727856AbfKZKs6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Nov 2019 05:48:58 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.23]:23601 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727793AbfKZKs6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Nov 2019 05:48:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1574765336;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=5v709mZXVndS7gfDB+HEciS9CVpxllNCjcVbgiJWP18=;
        b=iv5wZUO5KiDKw1tGGCXFfh0Dz5zkqRvyIgHiN/pHLlFjO2rpUVKWjAu7UMWTGKQH5j
        dzcXashaJ1+cmSJJ3t///X3R97zDRrgZtY24smSoA0FzBXsCadYfdk2pH2WUhQ443QjC
        /laWt43wiQIQTZnWBTptg8QDsykn26CYXjhYD9Dl0vgL1LC5mewpTJs9VX1G/fiscdID
        2O4axNBZBHo+qttcvub2lPNgC0jbOGRzOTa63wp0Vh7lCwPew52qlSMnYrnYNwvrrAQo
        OMB71O2+2rqlZQ5cpDNeTXHWVY9SaTWsskfD/f8EPIm2KRjxMfnLEjCyz2R2WFQ/K0+o
        StYw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp04-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 45.0.2 AUTH)
        with ESMTPSA id k05717vAQAjr4OL
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 26 Nov 2019 11:45:53 +0100 (CET)
Date:   Tue, 26 Nov 2019 11:45:53 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Message-ID: <597439304.1354192.1574765153195@webmail.strato.com>
In-Reply-To: <1574403231-18512-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1574403231-18512-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1574403231-18512-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH RFC 2/4] mmc: host: renesas_sdhi_sys_dmac: Do not fall
 back to PIO
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.1-Rev22
X-Originating-IP: 112.198.74.215
X-Originating-Client: open-xchange-appsuite
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On November 22, 2019 at 7:13 AM Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> wrote:
> 
> 
> Falling back to PIO forever is not convenience if a buffer condition
> is not match with the hardware once. So, this patch removes it.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c | 35 +++++++-------------------------
>  1 file changed, 7 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> index 30f34a3..09137cc 100644
> --- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> @@ -175,7 +175,7 @@ static void renesas_sdhi_sys_dmac_start_dma_rx(struct tmio_mmc_host *host)
>  	}
>  
>  	if (sg->length < min_len)
> -		return;
> +		goto pio;
>  
>  	/* The only sg element can be unaligned, use our bounce buffer then */
>  	if (!aligned) {
> @@ -200,23 +200,13 @@ static void renesas_sdhi_sys_dmac_start_dma_rx(struct tmio_mmc_host *host)
>  			ret = cookie;
>  		}
>  		host->dma_on = true;
> +		renesas_sdhi_sys_dmac_enable_dma(host, true);
>  	}
>  pio:
>  	if (!desc) {
> -		/* DMA failed, fall back to PIO */
>  		renesas_sdhi_sys_dmac_enable_dma(host, false);
> -		if (ret >= 0)
> -			ret = -EIO;
> -		host->chan_rx = NULL;
> -		dma_release_channel(chan);
> -		/* Free the Tx channel too */
> -		chan = host->chan_tx;
> -		if (chan) {
> -			host->chan_tx = NULL;
> -			dma_release_channel(chan);
> -		}
> -		dev_warn(&host->pdev->dev,
> -			 "DMA failed: %d, falling back to PIO\n", ret);
> +		host->dma_on = false;
> +		dev_dbg(&host->pdev->dev, "DMA failed: %d\n", ret);
>  	}
>  }
>  
> @@ -248,7 +238,7 @@ static void renesas_sdhi_sys_dmac_start_dma_tx(struct tmio_mmc_host *host)
>  	}
>  
>  	if (sg->length < min_len)
> -		return;
> +		goto pio;
>  
>  	/* The only sg element can be unaligned, use our bounce buffer then */
>  	if (!aligned) {
> @@ -281,20 +271,9 @@ static void renesas_sdhi_sys_dmac_start_dma_tx(struct tmio_mmc_host *host)
>  	}
>  pio:
>  	if (!desc) {
> -		/* DMA failed, fall back to PIO */
>  		renesas_sdhi_sys_dmac_enable_dma(host, false);
> -		if (ret >= 0)
> -			ret = -EIO;
> -		host->chan_tx = NULL;
> -		dma_release_channel(chan);
> -		/* Free the Rx channel too */
> -		chan = host->chan_rx;
> -		if (chan) {
> -			host->chan_rx = NULL;
> -			dma_release_channel(chan);
> -		}
> -		dev_warn(&host->pdev->dev,
> -			 "DMA failed: %d, falling back to PIO\n", ret);
> +		host->dma_on = false;
> +		dev_dbg(&host->pdev->dev, "DMA failed: %d\n", ret);
>  	}
>  }
>  
> -- 
> 2.7.4

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
