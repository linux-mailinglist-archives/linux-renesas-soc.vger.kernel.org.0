Return-Path: <linux-renesas-soc+bounces-29060-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBJCCTvirmmoJgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29060-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 16:07:39 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CF223B452
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 16:07:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 957AE3026926
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Mar 2026 15:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD163D7D6A;
	Mon,  9 Mar 2026 15:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SXZj1J7d"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33DB3D75BA
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Mar 2026 15:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773068831; cv=pass; b=KI0hRpcStcRTJkVWHJ/SLwygHg1X6F+lA2mthn3vPfhxzPyrJrk2XAHqHK3OaxU/7rJgB37U/mU2Z+NRHlm4gnfOWjKlqi03/rxtjJLiXAgm6Vjb/qblYf7Ydwo7+4TtSJgvABApG0fR9an02qVEDmEV2V6EgOo18vvRQ1YbZL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773068831; c=relaxed/simple;
	bh=esAbUIkFlHla0v0stivh1D9fNdDowuTHXrGsgEy9vs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WZlDAOQ9w+GuSaXUVOWGGLZA4Rk78YFjBDqENKskLJsb6ZMm4IPxr3NGq0Ly/Q0vjHiyZRkpYuyqkmyMoosv5J1DlZ3Ermsb2mMDsYgB2AfvfiNXz0s7c854w1D2qBBjvFp8u1mkVyIFpWlFVgtbNhWHMbGlk6XH4D4Etp5SHOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SXZj1J7d; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a12c19affeso5431767e87.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Mar 2026 08:07:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773068828; cv=none;
        d=google.com; s=arc-20240605;
        b=Y27E+JBFLOfQemo/wMfEepcAVagme8Nau5GdnrJPwcx3+JIpnhA7wHILUYHsJPVKX0
         BMij9QUVazXM6n48mbZHPjIoA9SOwopLOe+cTSjEzgevZAvykBzN99Hx+twNSk1TuNTA
         eJy54ANfL4D4xpjbFK7O9hOaBQonEKIeUutlrCUbMIumOA30um0aZDMMeZWszrA8XNe7
         lLyy+g4tFHHL5rPMr41psQP1B0qJw8LlJhq23QvQnWYxi5XREX7uJWQ7vculSge3KD+e
         co+csG45S6OWl4QHLtOnWKh1t6a68x8M3i00NuYRJubAbLyXYWGpUAZxxTf4vfhdRn3/
         i16Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pFl2mL9rWXv78CsIkv+Buf2pk8K49GTmcLThRUwuW3c=;
        fh=nE17D1NFWmIvJscUnV577NJ7flR7yDi6sVi3bsLOtkg=;
        b=PHGFCAyJwU5d+OewZCovMWITnn0gxXg2/AuSNPVonlIc5soi44AitgRsfIG4PG0Od3
         CKbZjzmLutOMS9tjuaf8Zl2IBzUdBdXyAC+cZAUg/M56Z58HR5KOPfW6VxTAtIaSdWKa
         VTgZRPb3+6dzP2+tawsZy89Mrcy8YkuDmYRQ6y5GmzUwgwG4dq2mTFA1Sfn1r7pm7cIY
         QQUQtUjqZu3OWR4ohWtTR4/BmOLQiM0xzt7ZOSl8spJtJbyKCBESVztoXUV94Hd6haIh
         X7Cp1tDrE1HPwJXG2h0X7ybOgA/0fHLw2sa0LFPyESQdfn847Abx7tc7ezlTsqNpE2o+
         aSGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773068828; x=1773673628; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pFl2mL9rWXv78CsIkv+Buf2pk8K49GTmcLThRUwuW3c=;
        b=SXZj1J7dVMBOmAo2tCAp4rI2IeJKgDp+QRPPCa7pmAQuodJ7H/QJpoZrj9zDCNy//z
         PZ1DOCib3bQVmJG2+vc319IokvxeQEmiQFiaB3u8v7+5LhEAwpbWEeypJfbG8Pp1mYtI
         q3wm8xehKYdYYp1I9pukygoaRHlHR8tQC4+8ACf2cmY/LVJpYaM0Z5W9pFZlXx0CnO69
         HNvQJhYOuAP/MFLGjMEAH3g8o6PDx96V1yM28ZKNZU8BpJA3IDRUAsJYr2Yv+nNxyehO
         4gyTTfNeHypJBDM6SwvdMk4Vla8UHtmgdax2sDv3u1S3jegXDXHU6LT0896CcNn6Q1MY
         JkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773068828; x=1773673628;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFl2mL9rWXv78CsIkv+Buf2pk8K49GTmcLThRUwuW3c=;
        b=Lg0ZNl1RBErsjmsWoPgWsisBXgn7cqxsWwSqSDpqsj8ReZsevsPOPb00MnzY9F1Qbm
         oqj95Nrzy9+SpQ3+PwhXFrwUUf4Gm7al9yfGI40jQpI/0BMZLP4Y3F1iKu8JdW5xlPLT
         CZmEviNla30bemqgRqxmGx9B8dgGHKG0x/0E4cHcsObfpLPc2iildDqN8Y1ovvCTdS7J
         rYDLWKNUITNx8WuW5ziIkzqx93Tw0GGkG7HqvRuDJyQfNvuxfwNOZhyfuwXckRBlXPuW
         jdNL+BPzwwm8nHbKoj1wJvxoHhmfCxdCujAPD3Jm9i0CpbBxmGXEHJOWEC66uT1g1Y4k
         ItaA==
X-Forwarded-Encrypted: i=1; AJvYcCWaXyWWdm5+sKWDc5DrCiE6zwy6nkjkoVjXSFmXe+aF50eVGu31R4Jcsn4tyQRwGczVeJTqlXQHk8/F8GeiGV3kEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnPpTT3yJk/mmX8X0PhXsWqgVuGfKpHOsw4ycqM6e6HaCOA/5y
	qiGAtaWjKoM44NlGMpRyrXL4gCR5KQgZ72Qa23SX431dfcPs/HJHxnRVdKqgzHbotcxhDKGxWKJ
	K9oILGHVlD50eXlYpUgYcQa5ci74UrK2SbmflfvXFhodtRj/bwKZZQdU=
X-Gm-Gg: ATEYQzyk9s3801Byc0HjlDVs3k/zQlAK2mVRGVGVIMQ+elep62xpJHv3ms9S7o2zR++
	+7qINozYVVwjeK1udsQcXN7iiDI1TzufUV5JmY2Ibpe2TSRpjp8jmnLWboNkU9SZTM0k/tf1h65
	7vRpSnO0IMGNggnzJDulyMBL7nUOvb0enzptzaqRhIeuixRMwvPR8g5NG5eV/geOqre02pbIBlV
	jR/ecFOpbT73dDrg341DI+a2SJhtE8dV+rlsQ+urAhaF9TuqDzuuQy9/dPxL1z5swmmfOdNp/rs
	sjSqXdfe
X-Received: by 2002:a05:6512:3d9e:b0:5a1:18a7:e149 with SMTP id
 2adb3069b0e04-5a13c952547mr4753098e87.24.1773068827673; Mon, 09 Mar 2026
 08:07:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a72e532c7364cd64b5cb4fc63c94b2af6b22ad8b.1772701528.git.geert+renesas@glider.be>
In-Reply-To: <a72e532c7364cd64b5cb4fc63c94b2af6b22ad8b.1772701528.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 9 Mar 2026 16:06:31 +0100
X-Gm-Features: AaiRm52T8KFr-HTXEr-PkPGvgwN3Xf2zDZhhHyOAQZlnEOOFWEyg9Brrq9M5di8
Message-ID: <CAPDyKFoU4nCCikE2NA=Tghm9hOPwcPykKcVkB_jsEq+81t+bKQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi_sys_dmac: Convert to DEFINE_RUNTIME_DEV_PM_OPS()
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-mmc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 03CF223B452
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29060-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.967];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,glider.be:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Thu, 5 Mar 2026 at 10:08, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>
> Convert the Renesas SDHI SD/SDIO controller driver using SYS-DMAC from
> an open-coded dev_pm_ops structure to DEFINE_RUNTIME_DEV_PM_OPS() and
> pm_ptr().  This simplifies the code, and reduces kernel size in case
> CONFIG_PM is disabled.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> index 543ad1d0ed1cff95..9215600f03a2340e 100644
> --- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> @@ -456,19 +456,15 @@ static int renesas_sdhi_sys_dmac_probe(struct platform_device *pdev)
>                                   of_device_get_match_data(&pdev->dev), NULL);
>  }
>
> -static const struct dev_pm_ops renesas_sdhi_sys_dmac_dev_pm_ops = {
> -       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> -                               pm_runtime_force_resume)
> -       SET_RUNTIME_PM_OPS(tmio_mmc_host_runtime_suspend,
> -                          tmio_mmc_host_runtime_resume,
> -                          NULL)
> -};
> +static DEFINE_RUNTIME_DEV_PM_OPS(renesas_sdhi_sys_dmac_dev_pm_ops,
> +                                tmio_mmc_host_runtime_suspend,
> +                                tmio_mmc_host_runtime_resume, NULL);
>
>  static struct platform_driver renesas_sys_dmac_sdhi_driver = {
>         .driver         = {
>                 .name   = "sh_mobile_sdhi",
>                 .probe_type = PROBE_PREFER_ASYNCHRONOUS,
> -               .pm     = &renesas_sdhi_sys_dmac_dev_pm_ops,
> +               .pm     = pm_ptr(&renesas_sdhi_sys_dmac_dev_pm_ops),
>                 .of_match_table = renesas_sdhi_sys_dmac_of_match,
>         },
>         .probe          = renesas_sdhi_sys_dmac_probe,
> --
> 2.43.0
>

