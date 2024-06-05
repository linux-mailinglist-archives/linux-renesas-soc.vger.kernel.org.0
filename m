Return-Path: <linux-renesas-soc+bounces-5856-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A46328FC875
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 11:58:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06E7AB2204E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 09:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CC9E18FDCB;
	Wed,  5 Jun 2024 09:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pg2ZQQSu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF4F19006E
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Jun 2024 09:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717581489; cv=none; b=KQHN/HuRI3cPzEsPj1hebUwLNlF4ujs4My1GoZvWpojepgUDRynMfgEUHGyeDal4nUcnXsfQ/FYba/+8bv/etfLp0RgHyhEM0pmFKNlCod5gGdD0d/ytaMZL82dFYUGRp+dSpHgp7WD0TDKixt1ckP/JN52BUo+A+zf3SHPR/jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717581489; c=relaxed/simple;
	bh=Tt2tgNpkn2du7bsn/n2t2j3ArXn3CGab9XDkz5yvA9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WYJk5bKMkW6ULiNNOdH41v1cCZvNejTNmtIiOuhFApsO0tlssw/cs6SsSAyopUc58ZZ82Cx8kXFsKUpJT2W5GgmqUNNi1Yuv+Zt7dz1C6JLiUL90o96+Imol1/Aeq0WcKkhKOrR5nK+6kILPnwiWumpRtiFvIaAV3mwDIYQVLvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pg2ZQQSu; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-df771959b5bso6417424276.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Jun 2024 02:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717581487; x=1718186287; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r+9F1BCoR5KjTer6dWZ2JEeUxzIQo5D1fqe1jFxzvAI=;
        b=Pg2ZQQSuycMcnB8D01ksAVgStixy+YthwF147zECK4WXB8CJc2oCjy6MWXD46IYCOk
         Z3+Zxd+Eg2+houXco8J63wZbDoLdzl4etzZU3dLtjfJ/c7Enku+JrFFT4WQEFOiIGVh7
         L736I0NE9N5W5iCupffZ99LNAMdrp4+q5Fy6AoNFByF4DoqXL5N1RaBhygMtcHsd9SnC
         DaTFEnGqGUl0BzpdFhuUQ+BkNsoVly+H3lDBpI/QxHiTL1CBTv4rEkTe8YVaXRWgaLS9
         NBhOm0EUO8p6LZYprnEf4HuE5ZneGi5bJCPb1hyCfyI6ey7QOV3hSkLIwPynkWrHSmbV
         bqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717581487; x=1718186287;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r+9F1BCoR5KjTer6dWZ2JEeUxzIQo5D1fqe1jFxzvAI=;
        b=BNdJ3wGdx/cIQmIvIMQjD8FS9hTpGCJpgfAqFCMcDC9sj7BDqXFbZSx45JZSTR1rbO
         Kxxru+zonwgRV2HoJ2OcYrF66t8mqvSP/XZAssme97Y9HRYDCadPtT7ZluqyEr3l4+P4
         5/3OZzxV1ttr22ohwrraKV3ZEm81tBFUSznEOD8nrGL1eSFMs4IflqqH8+sUh5Mh8seD
         YCm0m9eplZ0TcvRwfL2rdK8fzrVzoiVh/DnGoXcBFNSKdD2hViL+ElTsnl3Jf4m+bl43
         /9moG24VE0Dqko3pZff1jps5xqQE9rXlaZE3Ua1KCdfOBcygSXL8/8zq/j2tQ7EyZwZz
         tnow==
X-Forwarded-Encrypted: i=1; AJvYcCVY7nJ6oaYR8irmVLnOtj7S66DFSZbOEHb4CYHTk4NPmr2NqFDT2ggpgRy4Ckc07VaDjWdnvlnLw4sMcMC3HnesR7fL2NAWsfy+91it/29cc7A=
X-Gm-Message-State: AOJu0YyXhSsFf/Hd9xpb3QOpuuzHzLtiDHTQrd1ysenkVXNLNEQTmbPZ
	N5UDMFzHprwn+b2NiLo2p74zUNQYeAO4J5FNYEVto/uuimM0N7NS/zQaaZ/dI//AcROxxHjvbS5
	ku3rawKnqqZPTzL95dKJEgCyvtmseK8iWNbrmayJrAJiLAzgf
X-Google-Smtp-Source: AGHT+IE16F2JSKPh/JoHkBR3fjToIQEuSas1q7YcIfL6CuxcxUsrv2g6I96PRBF563ZyDJHB85oUxFS990MWpkQ8Y8k=
X-Received: by 2002:a25:868d:0:b0:dfa:c66c:e2e with SMTP id
 3f1490d57ef6-dfacab2c785mr1891853276.5.1717581486811; Wed, 05 Jun 2024
 02:58:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3cd8131b4f1284bdffa23a2b6a9a1e92fd17973e.1716973951.git.geert+renesas@glider.be>
In-Reply-To: <3cd8131b4f1284bdffa23a2b6a9a1e92fd17973e.1716973951.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 5 Jun 2024 11:57:30 +0200
Message-ID: <CAPDyKFq+gJXrR6xTWzzoDgkwrgg9XL7+ugDA=zjS1pEr5-xATg@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: core: Use genpd_is_irq_safe() helper
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Lina Iyer <lina.iyer@linaro.org>, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 May 2024 at 11:19, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Use the genpd_is_irq_safe() helper instead of open-coding the same
> operation.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 1eae7b2317897f0b..01cf17789621a04f 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -2082,7 +2082,7 @@ static void genpd_free_data(struct generic_pm_domain *genpd)
>
>  static void genpd_lock_init(struct generic_pm_domain *genpd)
>  {
> -       if (genpd->flags & GENPD_FLAG_IRQ_SAFE) {
> +       if (genpd_is_irq_safe(genpd)) {
>                 spin_lock_init(&genpd->slock);
>                 genpd->lock_ops = &genpd_spin_ops;
>         } else {
> --
> 2.34.1
>

