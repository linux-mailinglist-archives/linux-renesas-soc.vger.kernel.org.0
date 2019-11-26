Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92DAE109C81
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2019 11:48:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727820AbfKZKsh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Nov 2019 05:48:37 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.25]:27643 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727793AbfKZKsh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Nov 2019 05:48:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1574765314;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=WBTa2nqaXxnIW/qCIryRXieIwxFrKtJlAkZEffV7fBM=;
        b=hOskqq8wHefl9SPNW9NwXs8dQVTu5qxBowggflhp+5apmpqQcG5q074TF97jJ7JZoV
        5rBsz39T4g5cJcV5uyKRYUu6Bt9YveMSd0dr7mRrK55OVLlhbUGVlm8D+jiVABU8nU22
        yixyZpgTjENd/JF7Hxe2K+m9d0aecfgKzyvx9/FAuyMULU3Njcd0cXzh7y3YZbyQZnrx
        J6o5deV2MLkiiRfP7BnEjT09vvNUhWcx4nW+NKr9bI6sW+e9Uq1r43s8mxc/3HpfZr0N
        2K1EkQQTywVgpcdmJN2l9+ruzElhwpQJ0/xYuGiPp8+g2aIxb7mkyEjufUnVYtaUiWAf
        g1lA==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp04-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 45.0.2 AUTH)
        with ESMTPSA id k05717vAQAjY4OF
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 26 Nov 2019 11:45:34 +0100 (CET)
Date:   Tue, 26 Nov 2019 11:45:34 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Message-ID: <1345223652.1354141.1574765134840@webmail.strato.com>
In-Reply-To: <1574403231-18512-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1574403231-18512-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1574403231-18512-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH RFC 1/4] mmc: host: renesas_sdhi_sys_dmac: Use
 dma_buswidth instead of hardcoded value
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
> This patch uses dma_buswidth instread of hardcoded value of
> TMIO_MMC_MIN_DMA_LEN (8) for increasing the buswidth in the future.
> Note that, since the dma_buswidth is 4 and the align is 2,
> when the sg_tmp->length is 6, it cannot transfer correcly.
> So, this patch changes the conditions.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> index 13ff023..30f34a3 100644
> --- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> @@ -23,8 +23,6 @@
>  #include "renesas_sdhi.h"
>  #include "tmio_mmc.h"
>  
> -#define TMIO_MMC_MIN_DMA_LEN 8
> -
>  static const struct renesas_sdhi_of_data of_default_cfg = {
>  	.tmio_flags = TMIO_MMC_HAS_IDLE_WAIT,
>  };
> @@ -159,11 +157,12 @@ static void renesas_sdhi_sys_dmac_start_dma_rx(struct tmio_mmc_host *host)
>  	int ret, i;
>  	bool aligned = true, multiple = true;
>  	unsigned int align = (1 << host->pdata->alignment_shift) - 1;
> +	unsigned int min_len = priv->dma_priv.dma_buswidth ? : align + 1;
>  
>  	for_each_sg(sg, sg_tmp, host->sg_len, i) {
>  		if (sg_tmp->offset & align)
>  			aligned = false;
> -		if (sg_tmp->length & align) {
> +		if (sg_tmp->length % min_len) {
>  			multiple = false;
>  			break;
>  		}
> @@ -175,7 +174,7 @@ static void renesas_sdhi_sys_dmac_start_dma_rx(struct tmio_mmc_host *host)
>  		goto pio;
>  	}
>  
> -	if (sg->length < TMIO_MMC_MIN_DMA_LEN)
> +	if (sg->length < min_len)
>  		return;
>  
>  	/* The only sg element can be unaligned, use our bounce buffer then */
> @@ -231,11 +230,12 @@ static void renesas_sdhi_sys_dmac_start_dma_tx(struct tmio_mmc_host *host)
>  	int ret, i;
>  	bool aligned = true, multiple = true;
>  	unsigned int align = (1 << host->pdata->alignment_shift) - 1;
> +	unsigned int min_len = priv->dma_priv.dma_buswidth ? : align + 1;
>  
>  	for_each_sg(sg, sg_tmp, host->sg_len, i) {
>  		if (sg_tmp->offset & align)
>  			aligned = false;
> -		if (sg_tmp->length & align) {
> +		if (sg_tmp->length % min_len) {
>  			multiple = false;
>  			break;
>  		}
> @@ -247,7 +247,7 @@ static void renesas_sdhi_sys_dmac_start_dma_tx(struct tmio_mmc_host *host)
>  		goto pio;
>  	}
>  
> -	if (sg->length < TMIO_MMC_MIN_DMA_LEN)
> +	if (sg->length < min_len)
>  		return;
>  
>  	/* The only sg element can be unaligned, use our bounce buffer then */
> -- 
> 2.7.4

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
