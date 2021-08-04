Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD08A3E0A4E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Aug 2021 00:23:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233809AbhHDWYL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Aug 2021 18:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233262AbhHDWYK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Aug 2021 18:24:10 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8818C061799
        for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Aug 2021 15:23:57 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id z6-20020a0568302906b02904f268d34f86so2824926otu.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Aug 2021 15:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=P0CPMUoEGq9kX0RjyLZJhNu8qld5+9Q37QY3TTkajhU=;
        b=RKgpdrx6mJl0U7X86Kem7vK58ksGiKltCbcIDfvTfll0rVb9LvwSaP8XMpHHSqFCtR
         BoCFo6mB0rSnIHWAoNl4jWBkDYn5ymiczVJwtElEXZX0u1M2CXnSpNYC2TXmTsbC5l1P
         ++6ZUVngztxFgANTywsu6fuirozS07dfGW09c3fzLWlIVwRZk50xgcdfFXPO52ejA3Wd
         6AnVgpEFDtmnA3kH9DzFYl42FGS989LVxHmVRey1Ea4r+tW/P6iYqVnYfT72HG9W8sOv
         ZdEvq76a6FeKmWpReWSum3YXP6cnPp/uhoyXuWaQWduOMRfZktqsOnW89TU8QuJ9+ZRk
         p+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P0CPMUoEGq9kX0RjyLZJhNu8qld5+9Q37QY3TTkajhU=;
        b=g6pO4uBHklDzvFIvXuKq91CR7lkIu746cgA8/lsWUObvwJD4YlXWRXsbAlU7+QTsnM
         Z/o0rlBBFW6W7w8SgHfKYEVF9OfdTpPnYTFykh4ddlZRfupmBHEdoPyUGtggSR68SFOt
         HX54Hzce9gyOGdWrbdLsAPa4Ogr6TIq6BYTUWXtFEBMCZKZtQLxo4P0UCRD7E3b3fo4w
         H/oZI5tnLPDNDL11OLZS5XyiKtdqRz94cVBD6d1IJlwVtgra/5IJcttKR1Eou5cwhxlq
         GD6pSgB7l3Ms6Lqbh/e3tf67fWVKmfTv6UHPhz4SnwnUp2eEXeuKejuGYLIlHbmKRM1c
         C+pQ==
X-Gm-Message-State: AOAM531jnXiRQVDstZmexaqv+XRR3mFXflR7FDeAtjnszXPRpxuOo+4C
        qWtchJUIaGiik1JHFISlBfoOpw==
X-Google-Smtp-Source: ABdhPJy8yLBbnn0sqDPowy4CJHcQSoKCKptt0aGcYQHL01ibu3htRaVO8hHifHBmycXOD+iZlETZ1A==
X-Received: by 2002:a9d:3e08:: with SMTP id a8mr1366425otd.91.1628115836969;
        Wed, 04 Aug 2021 15:23:56 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a19sm696197oic.38.2021.08.04.15.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 15:23:56 -0700 (PDT)
Date:   Wed, 4 Aug 2021 17:23:54 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Len Baker <len.baker@gmx.com>
Cc:     Kees Cook <keescook@chromium.org>, Andy Gross <agross@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        David Laight <David.Laight@aculab.com>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-hardening@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] drivers/soc: Remove all strcpy() uses
Message-ID: <YQsTesvLfAwd8z5B@builder.lan>
References: <20210801131958.6144-1-len.baker@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210801131958.6144-1-len.baker@gmx.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun 01 Aug 08:19 CDT 2021, Len Baker wrote:

> strcpy() performs no bounds checking on the destination buffer. This
> could result in linear overflows beyond the end of the buffer, leading
> to all kinds of misbehaviors. The safe replacement is strscpy().
> 

While this is true, are any of these uses of strcpy affected by its
shortcomings?

> Moreover, when the size of the destination buffer cannot be obtained
> using "sizeof", use the memcpy function instead of strscpy.
> 

This is not why you're using memcpy, you're using it because you _know_
how many bytes should be copied - because you just did a strlen() and
allocated that amount of space.

> Signed-off-by: Len Baker <len.baker@gmx.com>
> ---
> This is a task of the KSPP [1]
> 
> [1] https://github.com/KSPP/linux/issues/88
> 
> Changelog v1 -> v2
> - Change the "area_name_size" variable for a shorter name (Geert
>   Uytterhoeven).
> - Add the "Reviewed-by: Geert Uytterhoeven" tag.
> - Use the memcpy function instead of strscpy function when the
>   size of the destination buffer cannot be obtained with "sizeof"
>   (David Laight, Robin Murphy).
> 
> Changelog v2 -> v3
> - Remove the "Reviewed-by: Geert Uytterhoeven" tag since the code
>   has changed after the v1 review (use of memcpy instead of
>   strscpy).
> 
>  drivers/soc/qcom/pdr_interface.c    | 13 +++++++------
>  drivers/soc/renesas/r8a779a0-sysc.c |  6 ++++--
>  drivers/soc/renesas/rcar-sysc.c     |  6 ++++--
>  drivers/soc/ti/knav_dma.c           |  2 +-
>  4 files changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
> index 915d5bc3d46e..cf119fde749d 100644
> --- a/drivers/soc/qcom/pdr_interface.c
> +++ b/drivers/soc/qcom/pdr_interface.c
> @@ -131,7 +131,7 @@ static int pdr_register_listener(struct pdr_handle *pdr,
>  		return ret;
> 
>  	req.enable = enable;
> -	strcpy(req.service_path, pds->service_path);
> +	strscpy(req.service_path, pds->service_path, sizeof(req.service_path));
> 
>  	ret = qmi_send_request(&pdr->notifier_hdl, &pds->addr,
>  			       &txn, SERVREG_REGISTER_LISTENER_REQ,
> @@ -257,7 +257,7 @@ static int pdr_send_indack_msg(struct pdr_handle *pdr, struct pdr_service *pds,
>  		return ret;
> 
>  	req.transaction_id = tid;
> -	strcpy(req.service_path, pds->service_path);
> +	strscpy(req.service_path, pds->service_path, sizeof(req.service_path));
> 
>  	ret = qmi_send_request(&pdr->notifier_hdl, &pds->addr,
>  			       &txn, SERVREG_SET_ACK_REQ,
> @@ -406,7 +406,7 @@ static int pdr_locate_service(struct pdr_handle *pdr, struct pdr_service *pds)
>  		return -ENOMEM;
> 
>  	/* Prepare req message */
> -	strcpy(req.service_name, pds->service_name);
> +	strscpy(req.service_name, pds->service_name, sizeof(req.service_name));
>  	req.domain_offset_valid = true;
>  	req.domain_offset = 0;
> 
> @@ -531,8 +531,8 @@ struct pdr_service *pdr_add_lookup(struct pdr_handle *pdr,
>  		return ERR_PTR(-ENOMEM);
> 
>  	pds->service = SERVREG_NOTIFIER_SERVICE;
> -	strcpy(pds->service_name, service_name);
> -	strcpy(pds->service_path, service_path);
> +	strscpy(pds->service_name, service_name, sizeof(pds->service_name));
> +	strscpy(pds->service_path, service_path, sizeof(pds->service_path));
>  	pds->need_locator_lookup = true;
> 
>  	mutex_lock(&pdr->list_lock);
> @@ -587,7 +587,8 @@ int pdr_restart_pd(struct pdr_handle *pdr, struct pdr_service *pds)
>  			break;
> 
>  		/* Prepare req message */
> -		strcpy(req.service_path, pds->service_path);
> +		strscpy(req.service_path, pds->service_path,
> +			sizeof(req.service_path));

There's no need to break this line.

Thanks,
Bjorn

>  		addr = pds->addr;
>  		break;
>  	}
> diff --git a/drivers/soc/renesas/r8a779a0-sysc.c b/drivers/soc/renesas/r8a779a0-sysc.c
> index d464ffa1be33..7410b9fa9846 100644
> --- a/drivers/soc/renesas/r8a779a0-sysc.c
> +++ b/drivers/soc/renesas/r8a779a0-sysc.c
> @@ -404,19 +404,21 @@ static int __init r8a779a0_sysc_pd_init(void)
>  	for (i = 0; i < info->num_areas; i++) {
>  		const struct r8a779a0_sysc_area *area = &info->areas[i];
>  		struct r8a779a0_sysc_pd *pd;
> +		size_t n;
> 
>  		if (!area->name) {
>  			/* Skip NULLified area */
>  			continue;
>  		}
> 
> -		pd = kzalloc(sizeof(*pd) + strlen(area->name) + 1, GFP_KERNEL);
> +		n = strlen(area->name) + 1;
> +		pd = kzalloc(sizeof(*pd) + n, GFP_KERNEL);
>  		if (!pd) {
>  			error = -ENOMEM;
>  			goto out_put;
>  		}
> 
> -		strcpy(pd->name, area->name);
> +		memcpy(pd->name, area->name, n);
>  		pd->genpd.name = pd->name;
>  		pd->pdr = area->pdr;
>  		pd->flags = area->flags;
> diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
> index 53387a72ca00..b0a80de34c98 100644
> --- a/drivers/soc/renesas/rcar-sysc.c
> +++ b/drivers/soc/renesas/rcar-sysc.c
> @@ -396,19 +396,21 @@ static int __init rcar_sysc_pd_init(void)
>  	for (i = 0; i < info->num_areas; i++) {
>  		const struct rcar_sysc_area *area = &info->areas[i];
>  		struct rcar_sysc_pd *pd;
> +		size_t n;
> 
>  		if (!area->name) {
>  			/* Skip NULLified area */
>  			continue;
>  		}
> 
> -		pd = kzalloc(sizeof(*pd) + strlen(area->name) + 1, GFP_KERNEL);
> +		n = strlen(area->name) + 1;
> +		pd = kzalloc(sizeof(*pd) + n, GFP_KERNEL);
>  		if (!pd) {
>  			error = -ENOMEM;
>  			goto out_put;
>  		}
> 
> -		strcpy(pd->name, area->name);
> +		memcpy(pd->name, area->name, n);
>  		pd->genpd.name = pd->name;
>  		pd->ch.chan_offs = area->chan_offs;
>  		pd->ch.chan_bit = area->chan_bit;
> diff --git a/drivers/soc/ti/knav_dma.c b/drivers/soc/ti/knav_dma.c
> index 591d14ebcb11..5f9816d317a5 100644
> --- a/drivers/soc/ti/knav_dma.c
> +++ b/drivers/soc/ti/knav_dma.c
> @@ -691,7 +691,7 @@ static int dma_init(struct device_node *cloud, struct device_node *dma_node)
>  	dma->max_rx_flow = max_rx_flow;
>  	dma->max_tx_chan = min(max_tx_chan, max_tx_sched);
>  	atomic_set(&dma->ref_count, 0);
> -	strcpy(dma->name, node->name);
> +	strscpy(dma->name, node->name, sizeof(dma->name));
>  	spin_lock_init(&dma->lock);
> 
>  	for (i = 0; i < dma->max_tx_chan; i++) {
> --
> 2.25.1
> 
