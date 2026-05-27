Return-Path: <linux-renesas-soc+bounces-33214-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLaTECMHF2qn1gcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33214-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 17:00:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4FF5E66F5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 17:00:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C44D8302794D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 14:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D8E34E764;
	Wed, 27 May 2026 14:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RbtrT937"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D7941325B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 14:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779893532; cv=none; b=NbL2f8TB2OeWqJF/9w8eVCZ7eJ6E7z1O3ZiluX1TbWWCbyLHEJeG0KCtbb6RKdm8UZYgKNHUR8GfIzankJI6kr4VGkwwJRAyNEzfoVEwBfZTkSqugqXybnZz8li+VANnMaYR3NT3pbboVImeB/cxv1trXb/Dymv68w2tvCWWKuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779893532; c=relaxed/simple;
	bh=Ob2DpnxEGRjh+H4R/5aZy/JVZltd6gqSjnffSViWHnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lk1ZLT3icTx8NWyQAV2PSg4hKq01uMiUCOQYExWamMeJNI4mIa/XPJlQXpDgl7Qnlx72X5m8g0Ztcwak4aqSJSUXVAMG7ZNQgoxcXefp03Cg3xOjtlD92fUC/q9Dni+o5ZmNDMGb+CyfajbizTL5Gm6jPt+aalobsktPrDp2p+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RbtrT937; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36622412e97so8947842a91.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 07:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779893530; x=1780498330; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GysSj+xcxKb96SCtQcauT9ZCA24G3J8cy9Fr5XJtfec=;
        b=RbtrT937oiIsRMQHMBmBSKZU4qirFVpwSXx73n0CWi2DcC9PHEttwyH9KBZVBHt+Xp
         iGR3s6ldGvR8P6tQN4EHV5iPiIFTetR2pcl1K9FqvNapChmPk0ZGF3g73QzusQaXvVzC
         BWaw+d/PN/WKCHkBmCtfwhfQiDRrNZUKEIkbamkRnor1xfht8sUzXNxZGBfAmKVmp8Tp
         IgmYZpBVq+7ntR4oAkPhrunuc0jkY+UjGN5CjQ1+eWqpFsMuIYp92xWCvgh/tce9Jd+x
         Y1/o/g/OGFJ7JdBE8G4aN6ZcZ5TVsDIXpmsFfvFr8o5q2OZwKSr3FiXTpScCUZzbZktf
         zQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779893530; x=1780498330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GysSj+xcxKb96SCtQcauT9ZCA24G3J8cy9Fr5XJtfec=;
        b=bUfgguyHZCqqm8wNsYFjBplsCUYJlurmNT6qvSw2fymZ0huSk50OtOK5ABYnhX+uyx
         Ucf5W9YzpQAFm/duM6AIdmX/EzErn6MepVnWGa2U3GuzsIhQUNoMkozyiXPLwGA695e9
         GYabeB6R8XKBbNVHS+ubCAD9Isg7aQ82j9vdg3g43313340RjwgZQc60h/6UaIFG580Y
         HNAmJKlRfWw1TQADAAobDuSs2jAfNEg+SIjhcUX5h8To2vN9FrxycsVDCOuOKGCGBh3c
         hBMeMrOiIVVDnJzEXPkzw6N+b43KKPCy+6r2QikobTgh0XOQvlACh4sb1Iqg6osev+Kj
         yoSg==
X-Forwarded-Encrypted: i=1; AFNElJ+yDcuMjvhZaFiLbgO4GHrse6l+u2ksCNtsKE6aUY+igoRhy3cmp04n+cSDz4DDoUchPxVOlwrxqYD3v2zLB1lvjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQlgIVsVyXLUrYbMrENL5GwWdV7q50c60acDGb6M9fidDCZgyr
	NtRjGPtHpaRry0tHNF8LtksQ6uMB6Q0f5x4EjXO9OkILC1RUfKm//bc1BQkUWnpwvnw=
X-Gm-Gg: Acq92OG5wmU2c/DZWnzuXfqzh3dKm8ItiXptpE6AFKNuYAEE2twtenTrtT2cM3hTCRc
	ZO4yWYpi1NKwZk+qGXvCBL+MYnCYX1YWKXllHrMs1CAILbSGU1vdSDfpEUv8AhtCrNZCSDb0/DS
	h48t6oAFw581zVGdmPd+/i2Qirc92cnoqiAk1fTiJ2JCWuAW09BgRchqMqmuj9ovo9ZUR0UCEZZ
	qXUj26GrBRR4GiyqMS4RyUyg1ev9qlAFix0WLGNZLeNgsez5i0hOSYj9w6DwBRRzgFzlfse7YB1
	uqaM284cDT8abjz0hjSv0OBQiJ0l1x0TZ2nz7lCoKk4mK5kAMM1xxMRRegqrNQTTrQq39pLRLNX
	YQqhXQj9lJYCXPUCMx9QbHadkPn8U4H445shg0UVw9BUd1iqpJqF8nUJ5ZZ4RpysmUhalmp3lDV
	DOSrgfL2pITLbySE0wYmUo2YBGWoy0fNNkhH5G7A==
X-Received: by 2002:a17:90b:3fcb:b0:367:c442:3f20 with SMTP id 98e67ed59e1d1-36a6762cebdmr25100604a91.19.1779893529666;
        Wed, 27 May 2026 07:52:09 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9466:b49b:cd0e:2dac])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a721c7baasm19906738a91.9.2026.05.27.07.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 07:52:08 -0700 (PDT)
Date: Wed, 27 May 2026 08:52:06 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, geert+renesas@glider.be, magnus.damm@gmail.com,
	patrice.chotard@foss.st.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, arnaud.pouliquen@foss.st.com,
	daniel.baluta@nxp.com, tanmay.shah@amd.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 2/5] remoteproc: switch exact-match drivers to
 wc-ioremap callbacks
Message-ID: <ahcFFkc2b0Pq9icR@p14s>
References: <20260514162129.1504162-1-ben.levinsky@amd.com>
 <20260514162129.1504162-3-ben.levinsky@amd.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514162129.1504162-3-ben.levinsky@amd.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33214-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,nxp.com,pengutronix.de,gmail.com,glider.be,foss.st.com,amd.com,lists.linux.dev,lists.infradead.org,st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[st.com:query timed out,res.name:query timed out];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RSPAMD_EMAILBL_FAIL(0.00)[ludovic.barre.st.com:query timed out,fabien.dessenne.st.com:query timed out];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathieu.poirier@linaro.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: DA4FF5E66F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 14, 2026 at 09:21:26AM -0700, Ben Levinsky wrote:
> Replace the exact-match carveout map and unmap callbacks in the
> existing remoteproc drivers with the common wc-ioremap helpers. This
> covers xlnx_r5_remoteproc, rcar_rproc, st_remoteproc, stm32_rproc,
> imx_rproc, and imx_dsp_rproc.
> 
> Leave the zynqmp R5 TCM callbacks alone because they also clear the
> mapped memory and are therefore not exact matches for the shared
> helpers.
> 
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
> ---
>  drivers/remoteproc/imx_dsp_rproc.c      | 36 ++++---------------
>  drivers/remoteproc/imx_rproc.c          | 32 ++---------------
>  drivers/remoteproc/rcar_rproc.c         | 33 ++---------------
>  drivers/remoteproc/st_remoteproc.c      | 31 ++--------------
>  drivers/remoteproc/stm32_rproc.c        | 34 ++----------------
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 47 +++----------------------
>  6 files changed, 18 insertions(+), 195 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 008741af9f11..2d9f14fbef1d 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -644,32 +644,6 @@ static void imx_dsp_rproc_free_mbox(struct imx_dsp_rproc *priv)
>  	mbox_free_channel(priv->rxdb_ch);
>  }
>  
> -static int imx_dsp_rproc_mem_alloc(struct rproc *rproc,
> -				   struct rproc_mem_entry *mem)
> -{
> -	struct device *dev = rproc->dev.parent;
> -	void *va;
> -
> -	va = ioremap_wc(mem->dma, mem->len);
> -	if (!va) {
> -		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
> -			&mem->dma, mem->len);
> -		return -ENOMEM;
> -	}
> -
> -	mem->va = va;
> -
> -	return 0;
> -}
> -
> -static int imx_dsp_rproc_mem_release(struct rproc *rproc,
> -				     struct rproc_mem_entry *mem)
> -{
> -	iounmap(mem->va);
> -
> -	return 0;
> -}
> -
>  /**
>   * imx_dsp_rproc_add_carveout() - request mailbox channels
>   * @priv: private data pointer
> @@ -700,8 +674,10 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
>  
>  		/* Register memory region */
>  		mem = rproc_mem_entry_init(dev, NULL, (dma_addr_t)att->sa,
> -					   att->size, da, imx_dsp_rproc_mem_alloc,
> -					   imx_dsp_rproc_mem_release, "dsp_mem");
> +					   att->size, da,
> +					   rproc_mem_entry_ioremap_wc,
> +					   rproc_mem_entry_iounmap,
> +					   "dsp_mem");
>  
>  		if (mem)
>  			rproc_coredump_add_segment(rproc, da, att->size);
> @@ -732,8 +708,8 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
>  		/* Register memory region */
>  		mem = rproc_mem_entry_init(dev, NULL, (dma_addr_t)res.start,
>  					   resource_size(&res), da,
> -					    imx_dsp_rproc_mem_alloc,
> -					    imx_dsp_rproc_mem_release,
> +					   rproc_mem_entry_ioremap_wc,
> +					   rproc_mem_entry_iounmap,
>  					   "%.*s", strchrnul(res.name, '@') - res.name, res.name);
>  		if (!mem)
>  			return -ENOMEM;
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 7f54322244ac..6249815b54d8 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -600,35 +600,6 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *i
>  	return va;
>  }
>  
> -static int imx_rproc_mem_alloc(struct rproc *rproc,
> -			       struct rproc_mem_entry *mem)
> -{
> -	struct device *dev = rproc->dev.parent;
> -	void *va;
> -
> -	dev_dbg(dev, "map memory: %p+%zx\n", &mem->dma, mem->len);
> -	va = ioremap_wc(mem->dma, mem->len);
> -	if (IS_ERR_OR_NULL(va)) {
> -		dev_err(dev, "Unable to map memory region: %p+%zx\n",
> -			&mem->dma, mem->len);
> -		return -ENOMEM;
> -	}
> -
> -	/* Update memory entry va */
> -	mem->va = va;
> -
> -	return 0;
> -}
> -
> -static int imx_rproc_mem_release(struct rproc *rproc,
> -				 struct rproc_mem_entry *mem)
> -{
> -	dev_dbg(rproc->dev.parent, "unmap memory: %pa\n", &mem->dma);
> -	iounmap(mem->va);
> -
> -	return 0;
> -}
> -
>  static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -692,7 +663,8 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  		/* Register memory region */
>  		mem = rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)res.start,
>  					   resource_size(&res), da,
> -					   imx_rproc_mem_alloc, imx_rproc_mem_release,
> +					   rproc_mem_entry_ioremap_wc,
> +					   rproc_mem_entry_iounmap,
>  					   "%.*s", strchrnul(res.name, '@') - res.name,
>  					   res.name);
>  		if (!mem)
> diff --git a/drivers/remoteproc/rcar_rproc.c b/drivers/remoteproc/rcar_rproc.c
> index 3c25625f966d..e3121fadd292 100644
> --- a/drivers/remoteproc/rcar_rproc.c
> +++ b/drivers/remoteproc/rcar_rproc.c
> @@ -19,35 +19,6 @@ struct rcar_rproc {
>  	struct reset_control *rst;
>  };
>  
> -static int rcar_rproc_mem_alloc(struct rproc *rproc,
> -				 struct rproc_mem_entry *mem)
> -{
> -	struct device *dev = &rproc->dev;
> -	void *va;
> -
> -	dev_dbg(dev, "map memory: %pa+%zx\n", &mem->dma, mem->len);
> -	va = ioremap_wc(mem->dma, mem->len);
> -	if (!va) {
> -		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
> -			&mem->dma, mem->len);
> -		return -ENOMEM;
> -	}
> -
> -	/* Update memory entry va */
> -	mem->va = va;
> -
> -	return 0;
> -}
> -
> -static int rcar_rproc_mem_release(struct rproc *rproc,
> -				   struct rproc_mem_entry *mem)
> -{
> -	dev_dbg(&rproc->dev, "unmap memory: %pa\n", &mem->dma);
> -	iounmap(mem->va);
> -
> -	return 0;
> -}
> -
>  static int rcar_rproc_prepare(struct rproc *rproc)
>  {
>  	struct device *dev = rproc->dev.parent;
> @@ -73,8 +44,8 @@ static int rcar_rproc_prepare(struct rproc *rproc)
>  		mem = rproc_mem_entry_init(dev, NULL,
>  					   res.start,
>  					   resource_size(&res), da,
> -					   rcar_rproc_mem_alloc,
> -					   rcar_rproc_mem_release,
> +					   rproc_mem_entry_ioremap_wc,
> +					   rproc_mem_entry_iounmap,
>  					   res.name);
>  
>  		if (!mem)
> diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
> index a07edf7217d2..486180cdccb4 100644
> --- a/drivers/remoteproc/st_remoteproc.c
> +++ b/drivers/remoteproc/st_remoteproc.c
> @@ -88,33 +88,6 @@ static void st_rproc_kick(struct rproc *rproc, int vqid)
>  		dev_err(dev, "failed to send message via mbox: %d\n", ret);
>  }
>  
> -static int st_rproc_mem_alloc(struct rproc *rproc,
> -			      struct rproc_mem_entry *mem)
> -{
> -	struct device *dev = rproc->dev.parent;
> -	void *va;
> -
> -	va = ioremap_wc(mem->dma, mem->len);
> -	if (!va) {
> -		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
> -			&mem->dma, mem->len);
> -		return -ENOMEM;
> -	}
> -
> -	/* Update memory entry va */
> -	mem->va = va;
> -
> -	return 0;
> -}
> -
> -static int st_rproc_mem_release(struct rproc *rproc,
> -				struct rproc_mem_entry *mem)
> -{
> -	iounmap(mem->va);
> -
> -	return 0;
> -}
> -
>  static int st_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct device *dev = rproc->dev.parent;
> @@ -138,8 +111,8 @@ static int st_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  			mem = rproc_mem_entry_init(dev, NULL,
>  						   (dma_addr_t)res.start,
>  						   resource_size(&res), res.start,
> -						   st_rproc_mem_alloc,
> -						   st_rproc_mem_release,
> +						   rproc_mem_entry_ioremap_wc,
> +						   rproc_mem_entry_iounmap,
>  						   "%.*s",
>  						   strchrnul(res.name, '@') - res.name,
>  						   res.name);
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 632614013dc6..7ac8265b60ac 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -113,35 +113,6 @@ static int stm32_rproc_pa_to_da(struct rproc *rproc, phys_addr_t pa, u64 *da)
>  	return -EINVAL;
>  }
>  
> -static int stm32_rproc_mem_alloc(struct rproc *rproc,
> -				 struct rproc_mem_entry *mem)
> -{
> -	struct device *dev = rproc->dev.parent;
> -	void *va;
> -
> -	dev_dbg(dev, "map memory: %pad+%zx\n", &mem->dma, mem->len);
> -	va = (__force void *)ioremap_wc(mem->dma, mem->len);
> -	if (IS_ERR_OR_NULL(va)) {
> -		dev_err(dev, "Unable to map memory region: %pad+0x%zx\n",
> -			&mem->dma, mem->len);
> -		return -ENOMEM;
> -	}
> -
> -	/* Update memory entry va */
> -	mem->va = va;
> -
> -	return 0;
> -}
> -
> -static int stm32_rproc_mem_release(struct rproc *rproc,
> -				   struct rproc_mem_entry *mem)
> -{
> -	dev_dbg(rproc->dev.parent, "unmap memory: %pa\n", &mem->dma);
> -	iounmap((__force __iomem void *)mem->va);
> -
> -	return 0;
> -}
> -
>  static int stm32_rproc_of_memory_translations(struct platform_device *pdev,
>  					      struct stm32_rproc *ddata)
>  {
> @@ -237,8 +208,8 @@ static int stm32_rproc_prepare(struct rproc *rproc)
>  			mem = rproc_mem_entry_init(dev, NULL,
>  						   (dma_addr_t)res.start,
>  						   resource_size(&res), da,
> -						   stm32_rproc_mem_alloc,
> -						   stm32_rproc_mem_release,
> +						   rproc_mem_entry_ioremap_wc,
> +						   rproc_mem_entry_iounmap,
>  						   "%.*s", strchrnul(res.name, '@') - res.name,
>  						   res.name);
>  			if (mem)
> @@ -957,4 +928,3 @@ MODULE_DESCRIPTION("STM32 Remote Processor Control Driver");
>  MODULE_AUTHOR("Ludovic Barre <ludovic.barre@st.com>");
>  MODULE_AUTHOR("Fabien Dessenne <fabien.dessenne@st.com>");
>  MODULE_LICENSE("GPL v2");
> -

Spurious change.

> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 45a62cb98072..e5d1903c9636 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -447,45 +447,6 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
>  	return ret;
>  }
>  
> -/*
> - * zynqmp_r5_mem_region_map()
> - * @rproc: single R5 core's corresponding rproc instance
> - * @mem: mem descriptor to map reserved memory-regions
> - *
> - * Callback to map va for memory-region's carveout.
> - *
> - * return 0 on success, otherwise non-zero value on failure
> - */
> -static int zynqmp_r5_mem_region_map(struct rproc *rproc,
> -				    struct rproc_mem_entry *mem)
> -{
> -	void __iomem *va;
> -
> -	va = ioremap_wc(mem->dma, mem->len);
> -	if (IS_ERR_OR_NULL(va))
> -		return -ENOMEM;
> -
> -	mem->va = (void *)va;
> -
> -	return 0;
> -}
> -
> -/*
> - * zynqmp_r5_rproc_mem_unmap
> - * @rproc: single R5 core's corresponding rproc instance
> - * @mem: mem entry to unmap
> - *
> - * Unmap memory-region carveout
> - *
> - * return: always returns 0
> - */
> -static int zynqmp_r5_mem_region_unmap(struct rproc *rproc,
> -				      struct rproc_mem_entry *mem)
> -{
> -	iounmap((void __iomem *)mem->va);
> -	return 0;
> -}
> -
>  /*
>   * add_mem_regions_carveout()
>   * @rproc: single R5 core's corresponding rproc instance
> @@ -522,8 +483,8 @@ static int add_mem_regions_carveout(struct rproc *rproc)
>  			rproc_mem = rproc_mem_entry_init(&rproc->dev, NULL,
>  							 (dma_addr_t)res.start,
>  							 resource_size(&res), res.start,
> -							 zynqmp_r5_mem_region_map,
> -							 zynqmp_r5_mem_region_unmap,
> +							 rproc_mem_entry_ioremap_wc,
> +							 rproc_mem_entry_iounmap,
>  							 "%.*s",
>  							 strchrnul(res.name, '@') - res.name,
>  							 res.name);
> @@ -560,8 +521,8 @@ static int add_sram_carveouts(struct rproc *rproc)
>  		rproc_mem = rproc_mem_entry_init(&rproc->dev, NULL,
>  						 dma_addr,
>  						 len, da,
> -						 zynqmp_r5_mem_region_map,
> -						 zynqmp_r5_mem_region_unmap,
> +						 rproc_mem_entry_ioremap_wc,
> +						 rproc_mem_entry_iounmap,
>  						 sram->sram_res.name);
>  		if (!rproc_mem) {
>  			dev_err(&rproc->dev, "failed to add sram %s da=0x%x, size=0x%lx",
> -- 
> 2.34.1
> 

