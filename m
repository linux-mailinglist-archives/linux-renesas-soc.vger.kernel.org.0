Return-Path: <linux-renesas-soc+bounces-33235-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAYCHQ0uF2rd7wcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33235-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 19:46:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AD95E87A3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 19:46:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A127230684CB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 17:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41D73BFAD4;
	Wed, 27 May 2026 17:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TrPimqHr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D105144E05B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 17:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779903899; cv=none; b=VsNKps/0aYXwKgmigVv5OkRkSRgobDL8sh3q/MJpRP1f+DaWWFw5PYnBuBH1J0GqkNI2PD2bUH5B/lYu5OV1qCZ8suAZ2b2lh6n1g/52hIpE+PJb8xXfNnw6SmjC3mPnEy+SGJC450aO04pnLHobfcR96Wt9GaGCmI5WsbGtWlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779903899; c=relaxed/simple;
	bh=jBmdo4bcjh9mnyHZBBkbap2F8RO/hTqf9vQEwCpOR8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=acnrlD2+xzHTWEGrH7mvGQVIMGwpiHNgmMY+iz8J2RAOfQ4/2IsVj6tIskrbWYW5+OADbo7nmEFLv2pZvpsnHSvh0nJm7omwEaElJNJnDgNpaIJWwSF3cCTu748uvsj5qsRp9VgMavSMfIkuMVkTdySm2BRIqKyOA7885gpAxXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TrPimqHr; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c801b30188dso5298972a12.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 10:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779903897; x=1780508697; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+IIwHB4tc8Zk/JmkEkdDm+906F5b3wX8vQAJk7Bu7kM=;
        b=TrPimqHrZS4dJoYA0aK6lobj/s3eZeCM3IuRVS61BRZFpQTQ7zgHjYtY8+6wxW0viK
         ntu784AqgXYAU6AU0Em3/kXYKYhsuq+Henii/uBqygq5TMjWDY4a8H/jUmLLurosUxxG
         63MfPuCT9gLaPtsZ//+iksfMFRpXiwZaLomDcfPFZQVWasLlFBn2uSY4q0qUrOuLrBYY
         dHRYyN1lE/4a4kJJvygfkF6UxSIfao4Vbx0GC2DCulHmOmNcYoA7OTd+dKXYAGx3ndYq
         YsDJXXdxz1jNmGNZPSjjLoD0jxiozkkVYQeGY3+gNrlfUSg8rmpzjFeFehbTkcLb3kML
         UrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779903897; x=1780508697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+IIwHB4tc8Zk/JmkEkdDm+906F5b3wX8vQAJk7Bu7kM=;
        b=NVpH8BlfWtwxdNoccVojeczcheDGrzPSAZ1k8v5CooM94uHkeDG2lCw9LEnL3FfB31
         /wAYf6wtjbFbVFPieXWsffLGnvKAvM58clpfgVmWEYMrqU5mMVy5i1zNNYijynrGzsxc
         GrRsQEOOzWvivFwdoanX/GbOv0ZvKEa9Ufq0mxdA657aKtAUDqvF1zCaEzU6jG2ak3f2
         jE3QP8zugYd1K7gv8ncEFfUjejpJn34+d1c3DXg8feXvwvCUam1hMkfNgN1XYyQ8hkLo
         NI4e5UigXD18PiivS8v4BUagTpgKfSRez9R2UWyVJ+PeWOYVasaUKw6XYGREqOdUaU5o
         dtbA==
X-Forwarded-Encrypted: i=1; AFNElJ9NvamllVTnQD0wnj/mVUqBQwWB/z1RSFGZ5W0YSgTHpyF1On4XGCDbEHIq3G38OOUpPD3iq1uDcY02Z/P4PnwksQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmOYl4mNr/uj305A9nERNJHHwhTpwA9O8BBRxxftL6S7iPe3rb
	rTguCzheRhTNLOi2euDITCyoOSQ4Kleajt5PWn5ZPvTmLLBtPrYehkQwv7mmiHFQl2I=
X-Gm-Gg: Acq92OEyKNqXmlpk4IZ9ONq1vXaFdaG5VPwhRRBbv7vnEPjR2OuZqEmsoS58RU0L4km
	7EUHquiFSoJuqKKYuiuTbzTmBM65zvC7YckgkfiWm+7ifQ3iVO8j+6fOhR3oDaBfs/NXS0ivm1H
	PLWvu9YmcnrGnmRgmCfjsjs7k/Ie8L1WMoN0N9+rlDN3AVtZbfRA7Yw5eAFnVMtl2o94R3exMTg
	8EuJZIP7w6wG8HFxO87Kv6nSpXvPT6bfjgFPx67GyOVN5K95FJQJ4iltZXCEyPDvGlAgbRes0LT
	aniLF2kuTi+HB3qpSZGFZ6i76Na2Y3TEw/VLJTlxkAKvB3GjTWnqBbwfAKOg2mWqSBdymkyiJEl
	lXvERedLtsCkUL1mHSAjZDeoKUAxcjgqEW5iHUL2Zvtb8D3G4Rm6WfmNjZgn7KK4jxNSyO5+rZ4
	s4/m9KZLw1s0c+gADacVvPMjzLNY8=
X-Received: by 2002:a05:6a21:a06:b0:3a5:8542:61a4 with SMTP id adf61e73a8af0-3b329340e22mr25394375637.25.1779903896893;
        Wed, 27 May 2026 10:44:56 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9466:b49b:cd0e:2dac])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d70f17cbsm2814639b3a.45.2026.05.27.10.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 10:44:56 -0700 (PDT)
Date: Wed, 27 May 2026 11:44:53 -0600
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
Subject: Re: [PATCH v2 5/5] remoteproc: switch drivers to optional
 resource-table helper
Message-ID: <ahctlW_4AKS6IHYt@p14s>
References: <20260514162129.1504162-1-ben.levinsky@amd.com>
 <20260514162129.1504162-6-ben.levinsky@amd.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514162129.1504162-6-ben.levinsky@amd.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33235-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,nxp.com,pengutronix.de,gmail.com,glider.be,foss.st.com,amd.com,lists.linux.dev,lists.infradead.org,st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathieu.poirier@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,amd.com:email,linaro.org:dkim]
X-Rspamd-Queue-Id: 27AD95E87A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 14, 2026 at 09:21:29AM -0700, Ben Levinsky wrote:
> Use the shared optional resource-table helper in the remoteproc
> drivers that already treat a missing resource table as non-fatal:
> xlnx_r5_remoteproc, rcar_rproc, stm32_rproc, imx_rproc, and
> imx_dsp_rproc.
> 
> Keep thin local parse_fw() wrappers in each driver so the helper only
> centralizes the return-value handling. That lets each platform retain
> control over whether the missing-table case is logged and at what
> severity, while other parsing failures continue to propagate to the
> caller.
> 
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c      | 24 ++++++++++-----
>  drivers/remoteproc/imx_rproc.c          | 25 ++++++++-------
>  drivers/remoteproc/rcar_rproc.c         | 25 ++++++++-------
>  drivers/remoteproc/stm32_rproc.c        | 23 +++++++++-----
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 41 +++++++++----------------
>  5 files changed, 73 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 2d9f14fbef1d..2ff74f7938f6 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -954,14 +954,6 @@ static int imx_dsp_rproc_elf_load_segments(struct rproc *rproc, const struct fir
>  	return ret;
>  }
>  
> -static int imx_dsp_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> -{
> -	if (rproc_elf_load_rsc_table(rproc, fw))
> -		dev_warn(&rproc->dev, "no resource table found for this firmware\n");
> -
> -	return 0;
> -}
> -

Why is this getting moved after imx_dsp_rproc_load()?


>  static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct imx_dsp_rproc *priv = rproc->priv;
> @@ -990,6 +982,22 @@ static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
>  	return 0;
>  }
>  
> +static int imx_dsp_rproc_parse_fw(struct rproc *rproc,
> +				  const struct firmware *fw)
> +{
> +	int ret;
> +
> +	ret = rproc_elf_load_rsc_table_optional(rproc, fw);
> +	if (ret)
> +		return ret;
> +
> +	if (!rproc->table_ptr)
> +		dev_warn(&rproc->dev,
> +			 "no resource table found for this firmware\n");
> +
> +	return 0;
> +}
> +

I am not overly fond of having to check rproc->table_ptr for the printout.  How
about:

#define rproc_elf_load_rsc_table_optional(rproc, fw, dev_func, fmt, ...)        \
        ({                                                                      \
                int ret = rproc_elf_load_rsc_table(rproc, fw);                  \
                if (ret == -EINVAL) {                                           \
                        dev_func(&rproc->dev, fmt, ##__VA_ARGS__);              \
                        return 0;                                               \
                } else {                                                        \
                        return ret;                                             \
                }                                                               \
        })

in remoteproc_internal.h and something like:

static int imx_dsp_rproc_parse_fw(struct rproc *rproc,
                                  const struct firmware *fw)
{
        rproc_elf_load_rsc_table_optional(rproc, fw, dev_warn,
                "no resource table found for this firmware\n");
}

in the clients?

>  static const struct rproc_ops imx_dsp_rproc_ops = {
>  	.prepare	= imx_dsp_rproc_prepare,
>  	.unprepare	= imx_dsp_rproc_unprepare,
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 6249815b54d8..58c63f97ebf7 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -680,17 +680,6 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  	return 0;
>  }
>  
> -static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> -{
> -	int ret;
> -
> -	ret = rproc_elf_load_rsc_table(rproc, fw);
> -	if (ret)
> -		dev_info(&rproc->dev, "No resource table in elf\n");
> -
> -	return 0;
> -}
> -
>  static void imx_rproc_kick(struct rproc *rproc, int vqid)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -768,6 +757,20 @@ imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *
>  	return rproc_elf_find_loaded_rsc_table(rproc, fw);
>  }
>  
> +static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	int ret;
> +
> +	ret = rproc_elf_load_rsc_table_optional(rproc, fw);
> +	if (ret)
> +		return ret;
> +
> +	if (!rproc->table_ptr)
> +		dev_info(&rproc->dev, "No resource table in elf\n");
> +
> +	return 0;
> +}
> +
>  static const struct rproc_ops imx_rproc_ops = {
>  	.prepare	= imx_rproc_prepare,
>  	.attach		= imx_rproc_attach,
> diff --git a/drivers/remoteproc/rcar_rproc.c b/drivers/remoteproc/rcar_rproc.c
> index e3121fadd292..b7a39014b6bb 100644
> --- a/drivers/remoteproc/rcar_rproc.c
> +++ b/drivers/remoteproc/rcar_rproc.c
> @@ -55,17 +55,6 @@ static int rcar_rproc_prepare(struct rproc *rproc)
>  	}
>  }
>  
> -static int rcar_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> -{
> -	int ret;
> -
> -	ret = rproc_elf_load_rsc_table(rproc, fw);
> -	if (ret)
> -		dev_info(&rproc->dev, "No resource table in elf\n");
> -
> -	return 0;
> -}
> -
>  static int rcar_rproc_start(struct rproc *rproc)
>  {
>  	struct rcar_rproc *priv = rproc->priv;
> @@ -99,6 +88,20 @@ static int rcar_rproc_stop(struct rproc *rproc)
>  	return err;
>  }
>  
> +static int rcar_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	int ret;
> +
> +	ret = rproc_elf_load_rsc_table_optional(rproc, fw);
> +	if (ret)
> +		return ret;
> +
> +	if (!rproc->table_ptr)
> +		dev_info(&rproc->dev, "No resource table in elf\n");
> +
> +	return 0;
> +}
> +
>  static struct rproc_ops rcar_rproc_ops = {
>  	.prepare	= rcar_rproc_prepare,
>  	.start		= rcar_rproc_start,
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 7ac8265b60ac..a4d42b755c74 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -232,14 +232,6 @@ static int stm32_rproc_prepare(struct rproc *rproc)
>  	}
>  }
>  
> -static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> -{
> -	if (rproc_elf_load_rsc_table(rproc, fw))
> -		dev_warn(&rproc->dev, "no resource table found for this firmware\n");
> -
> -	return 0;
> -}
> -
>  static irqreturn_t stm32_rproc_wdg(int irq, void *data)
>  {
>  	struct platform_device *pdev = data;
> @@ -623,6 +615,21 @@ stm32_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
>  	return (__force struct resource_table *)ddata->rsc_va;
>  }
>  
> +static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	int ret;
> +
> +	ret = rproc_elf_load_rsc_table_optional(rproc, fw);
> +	if (ret)
> +		return ret;
> +
> +	if (!rproc->table_ptr)
> +		dev_warn(&rproc->dev,
> +			 "no resource table found for this firmware\n");
> +
> +	return 0;
> +}
> +
>  static const struct rproc_ops st_rproc_ops = {
>  	.prepare	= stm32_rproc_prepare,
>  	.start		= stm32_rproc_start,
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index e5d1903c9636..9b9f07d152e6 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -664,33 +664,6 @@ static int add_tcm_banks(struct rproc *rproc)
>  	return ret;
>  }
>  
> -/*
> - * zynqmp_r5_parse_fw()
> - * @rproc: single R5 core's corresponding rproc instance
> - * @fw: ptr to firmware to be loaded onto r5 core
> - *
> - * get resource table if available
> - *
> - * return 0 on success, otherwise non-zero value on failure
> - */
> -static int zynqmp_r5_parse_fw(struct rproc *rproc, const struct firmware *fw)
> -{
> -	int ret;
> -
> -	ret = rproc_elf_load_rsc_table(rproc, fw);
> -	if (ret == -EINVAL) {
> -		/*
> -		 * resource table only required for IPC.
> -		 * if not present, this is not necessarily an error;
> -		 * for example, loading r5 hello world application
> -		 * so simply inform user and keep going.
> -		 */
> -		dev_info(&rproc->dev, "no resource table found.\n");
> -		ret = 0;
> -	}
> -	return ret;
> -}
> -
>  /**
>   * zynqmp_r5_rproc_prepare() - prepare core to boot/attach
>   * adds carveouts for TCM bank and reserved memory regions
> @@ -843,6 +816,20 @@ static int zynqmp_r5_detach(struct rproc *rproc)
>  	return 0;
>  }
>  
> +static int zynqmp_r5_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	int ret;
> +
> +	ret = rproc_elf_load_rsc_table_optional(rproc, fw);
> +	if (ret)
> +		return ret;
> +
> +	if (!rproc->table_ptr)
> +		dev_info(&rproc->dev, "no resource table found.\n");
> +
> +	return 0;
> +}
> +
>  static const struct rproc_ops zynqmp_r5_rproc_ops = {
>  	.prepare	= zynqmp_r5_rproc_prepare,
>  	.unprepare	= zynqmp_r5_rproc_unprepare,
> -- 
> 2.34.1
> 

