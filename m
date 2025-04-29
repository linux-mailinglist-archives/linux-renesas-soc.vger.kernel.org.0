Return-Path: <linux-renesas-soc+bounces-16459-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C38B3AA0743
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Apr 2025 11:31:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 070AE7AF655
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Apr 2025 09:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ED832BD598;
	Tue, 29 Apr 2025 09:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jg+2Ryxa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C978F27BF78
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Apr 2025 09:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918930; cv=none; b=uG0VZlrrGJGmODskfh5wDf6fJ4CFjlAavNQw/BcNosyLkfusW/xjuaIbmZQnit3gijgwx1ZkDfi9yPrZLfuEF3cMPcG620INxhzFS9GVyD95c9xXb8ct+LVfxz5Ua4s5g/APTtfHZpKL8b1hH6DMQpBNdVTrzGp6jsJhYfo5D8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918930; c=relaxed/simple;
	bh=rz7GEU+cLgkTuSJ7/jJk4YnGG3C+NyOdb2kkdvOKqoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NU2d4VRqNrp9ZXimia6LFJe61rdh20QDzvo5DJKI6JVRJNHdiLrjgW+gQOe5QnFvxw6HpB7oTzZ3zZLYKCMSX4S4Kd5WZMFjHJ4OEu/864kpkBfdtenS8TMbnwbx61KgTogN+qP+WQMohsyiINOll9LXb2Exl+IAwKx6Q9frNT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jg+2Ryxa; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-70821dba48eso44573767b3.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Apr 2025 02:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745918928; x=1746523728; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rfeG3dd0iHg4ZedR6tUQEk3LD+qMPNa78G6OKmslOhw=;
        b=jg+2RyxaUusP3lqtdJDfxgTskd2m9gt+J4D5jf3VmZ7wcu70DqNlwsXl/ieVmE+BCi
         jrFn08X+Umw6fS43ItgMnqc19ppRjrgmd1A52CnFP9QjoddsXfrazZVhNiqXR2ZVSQ+R
         pSmUkLhixX17hkKZw7NVepQpG6ixkxFa4IJeuhXE/lydqvghtCrSPTaIJMPXmMroN9ZL
         pto9RQD2u0+sHEgnYIPCHQs6xERs4r+FIpXRIzuusi+u6hniGHT3O1HpZGUce+tt9yqE
         O7oY1VluOLJgIfmw5sIfv007JTMyEtLfLTmNy3cj5ZBxcX6AErS6H8dX5U68ob/Njl0O
         Q1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745918928; x=1746523728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rfeG3dd0iHg4ZedR6tUQEk3LD+qMPNa78G6OKmslOhw=;
        b=vM7s4927cl5WFv2mXZL4rPHnyjsoXUOP5inQBCPafUyzcfa3IeoBWBJkpLqBB0QvXH
         FWQ5CkVeMpjp6WtAgin6WNVWESZmT2g+9IKaC7jaOi6cNARO8GVQUr+SXQgLjFQBobVt
         OMSPEBFfrXl1ACcr8qhs4BUg97w9WcUGpnTMyMRA2nA1OxDkYoj8N+srTOqCIX6uvaIR
         vcCm+j5AnusNfPM/gpvNDT/duFSB4ze2wI/fKbHseIzfNb7kqKRYiXmo5kPQNWj4gDQV
         wohiNdbp5aflYgsrwifL89g6P5jpi/cu3pZZcVKp2CfbU9g66No1NFsTPgKlDu42ael6
         LNQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPISDSssvbxGZRJoxyUOrYeUULrrfYhuYtIk8st04w/ON94BRrb/G7CjqebI3jgMBPIxkZp+DVBtk93DMvd5z7BQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1bh3vFT8c7XGtdntzFc6AzK8+cYV1doR7qo7iZMpO1KthUGf4
	nftJ0mPRKC+MayZD5KFBbV9EaeTkSLjTi4tc2rkf6gShXdHMMDzdO75iZ83ODEsrtJZ0Luk6MCl
	wu5W9QJDjtkFwHhCPnPpTBWWkuWF4tbnF8NFKVq2qWPStk4Ic
X-Gm-Gg: ASbGncsM4hDf6oLXrNMpDHfMwppEPTlEHAjV1s4Fg1r5NNZMIXIFKAnL23X6HFhCmR/
	IMgIDjlMNqQgq0usuLfr5v263vN+uMmKsKNnm3XmRN9nyY3x38nuABbM/ROlP3csU10jXqftvL8
	wYgwTh8e/oEQ8HDAToQA9fNzI=
X-Google-Smtp-Source: AGHT+IGqaZACXqvr7JdmMVvJ8PR+gCTsx+pGcWiJ4NHfME0mBxihXmiMZvORJMcNAuMeeOrgqZTMEz2gRJvInQo+C+U=
X-Received: by 2002:a05:690c:4913:b0:706:b3c1:3d00 with SMTP id
 00721157ae682-7085f255a3bmr182926527b3.37.1745918927853; Tue, 29 Apr 2025
 02:28:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <107f2bf9f13b29f0f623d2959a5347ec151fb089.1745840768.git.geert+renesas@glider.be>
In-Reply-To: <107f2bf9f13b29f0f623d2959a5347ec151fb089.1745840768.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 29 Apr 2025 11:28:11 +0200
X-Gm-Features: ATxdqUHJBHA0aHhbwsDUsk737mmH_eoVJSA36tbcF6B9qrh4_o8nqg_lRGoC3LA
Message-ID: <CAPDyKFrvPub5qd3bnf5gmmgB59BjR6infOXcFibfxs2E7MnTLg@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: renesas: rcar: Remove obsolete nullify checks
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Apr 2025 at 13:56, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> All nullify users and helpers were removed, but the R-Car SYSC drivers
> still checked for nullified domains.  Remove the obsolete checks.
>
> Fixes: c8d87704444a8ac7 ("pmdomain: renesas: rcar-sysc: Remove rcar_sysc_nullify() helper")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied for fixes, thanks!

Kind regards
Uffe

> ---
>  drivers/pmdomain/renesas/rcar-gen4-sysc.c | 5 -----
>  drivers/pmdomain/renesas/rcar-sysc.c      | 5 -----
>  2 files changed, 10 deletions(-)
>
> diff --git a/drivers/pmdomain/renesas/rcar-gen4-sysc.c b/drivers/pmdomain/renesas/rcar-gen4-sysc.c
> index 66409cff2083fcd8..e001b5c25bed0051 100644
> --- a/drivers/pmdomain/renesas/rcar-gen4-sysc.c
> +++ b/drivers/pmdomain/renesas/rcar-gen4-sysc.c
> @@ -338,11 +338,6 @@ static int __init rcar_gen4_sysc_pd_init(void)
>                 struct rcar_gen4_sysc_pd *pd;
>                 size_t n;
>
> -               if (!area->name) {
> -                       /* Skip NULLified area */
> -                       continue;
> -               }
> -
>                 n = strlen(area->name) + 1;
>                 pd = kzalloc(sizeof(*pd) + n, GFP_KERNEL);
>                 if (!pd) {
> diff --git a/drivers/pmdomain/renesas/rcar-sysc.c b/drivers/pmdomain/renesas/rcar-sysc.c
> index dce1a6d37e80127d..047495f54e8adc0d 100644
> --- a/drivers/pmdomain/renesas/rcar-sysc.c
> +++ b/drivers/pmdomain/renesas/rcar-sysc.c
> @@ -396,11 +396,6 @@ static int __init rcar_sysc_pd_init(void)
>                 struct rcar_sysc_pd *pd;
>                 size_t n;
>
> -               if (!area->name) {
> -                       /* Skip NULLified area */
> -                       continue;
> -               }
> -
>                 n = strlen(area->name) + 1;
>                 pd = kzalloc(sizeof(*pd) + n, GFP_KERNEL);
>                 if (!pd) {
> --
> 2.43.0
>

