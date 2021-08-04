Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED3043E0A71
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Aug 2021 00:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbhHDWfA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Aug 2021 18:35:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbhHDWe7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Aug 2021 18:34:59 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71560C0613D5
        for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Aug 2021 15:34:46 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id t1-20020a4a54010000b02902638ef0f883so837452ooa.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Aug 2021 15:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UZJcNHJO4LQR36ixWf/ziwUjfQuMb7Mm0UXvd1Hg4gg=;
        b=tYW3NQDOaoOAmJhieZdnjoNjyaKSHVE6lyBu/OX7HVPsqfng6qLWGieMImgOnYOTJi
         cYngNaDNRi+IYluKEdjg2VZop0ieSPcf9B+mXmwNjeBrVp1v/38uzGbg7XC8EZm1aFpf
         tiFQ8nlYg0YZzyumw/O9+hiqvT0Jw8ihLS6nbGMrj7vqKue0Uq1+aldnBbWl7OoZPXuz
         kqWQZnQISxU2gZWw8cPt8ezEhjDk3bDetIIylfrpL7z3qftYHAcdSCW9pJSXTLw4UY2z
         6YacG1MWStILNWzVOCNFqRAS0EY3KK/v9lETqF5C99PjApimrc+i7Gj6c0v1XBuA8Z++
         0qYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UZJcNHJO4LQR36ixWf/ziwUjfQuMb7Mm0UXvd1Hg4gg=;
        b=tcr7+0Y1EEzml6FbF94PyoFnoiA824de4XuUknfDWu9amTPVLOJqFTXtzarpqyml0/
         AfUJNYz+qCNkcAMvG5lwm3mnxkeU3qL1Jz25tJLHaOrwO+AP7agDsUGEQVIi0AJdtYF4
         bTOiEnJWJhqqE8X2q9uDz7/CqoCKF4CKyWnIRyyoNDtgE9L91kb29xqPhojWNd8GNC9r
         WppLIemsIq3VeGkUqWCQwxckM8iHdddlBcgdWbYLsHd0z2wVIAmgCJV30zEJri/SmyVA
         WnuzOnsGUrq5rb+TWdCa6DJel2+r25wZj+aj/UlFfDqb7wbAtg4g8uZHBXE7Bt5hNry4
         uoDg==
X-Gm-Message-State: AOAM530D+g+2iLr+2K7fFxJYv8T9vJDOplHeERIYNKkYawndHuubfSbt
        Xqr1oZJna0fyd9ZEElt385nlOQ==
X-Google-Smtp-Source: ABdhPJzoI974+mp/rfGo+7Xq9nqrA8eJ6Be/tx/TkRzTQ2z3SwevKn0NJ4P732tpLcSoO/FyWG+urg==
X-Received: by 2002:a4a:d812:: with SMTP id f18mr1073419oov.50.1628116485417;
        Wed, 04 Aug 2021 15:34:45 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r15sm455538otn.33.2021.08.04.15.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 15:34:45 -0700 (PDT)
Date:   Wed, 4 Aug 2021 17:34:43 -0500
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
Message-ID: <YQsWA0iyol+EWoPd@builder.lan>
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
> Moreover, when the size of the destination buffer cannot be obtained
> using "sizeof", use the memcpy function instead of strscpy.
> 
> Signed-off-by: Len Baker <len.baker@gmx.com>

Forgot one thing, it's unclear who should pick this patch up and there's
definitely a chance that it will cause merge conflicts regardless of
whom of us end up picking it.

Could you please split it so that the qcom, renesas and ti pieces can be
picked up by respective maintainer?

Thanks,
Bjorn

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
