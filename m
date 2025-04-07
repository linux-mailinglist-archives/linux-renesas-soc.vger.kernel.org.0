Return-Path: <linux-renesas-soc+bounces-15495-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A97A7E5F1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 18:16:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DF3D4451D6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 16:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7433209F4D;
	Mon,  7 Apr 2025 16:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mDrUICLP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4AB20CCC4
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Apr 2025 16:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041933; cv=none; b=kMFtbSSCi0jn0UDIvB7h5n5jbLE1u1EmCgNiyZu2GWjtFDtd70spXcDpE3zj/nJsgtNjrZPxxZPSe2D7gM5pLWzTL0a0JbIlCWiFdlipfeycpCpDOo/BuVe9VRgaZQ3Fck0OMQAo+TVtdCCMeRvhaxFlAHyb6E4BXqN44m6G6As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041933; c=relaxed/simple;
	bh=zaIj6bf60mYQTXK0HVRjO1dYSIbBBHmtY9FFgcvGbo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lddBq13pQBvRofTNvtOugmodBvzi67c5/rLim9zwKf/t0GB6okdzc/0u4qSVp0UKQAQsUN2b3lC+Piv8727WpknL7m/N+Yfnijr87LiiA4+dg8ZwLxOlSQLM1c+JIic+4++41VWhtsIcIheMp5JZmDwzkRQPiw3JarearSNVqjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mDrUICLP; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-70427fb838cso4658857b3.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Apr 2025 09:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744041931; x=1744646731; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iyMXJxNU8APh7FepAd2LYAIeH/3a57mIaJumXNTEoaA=;
        b=mDrUICLPrqvFpUD1L0lkc4goXFB/5JVCBd+tqksExz2wxw5nc4+YXqcfgARDQ/pmPV
         o3qMUtWKYTgs1WNfZaEa362T8Oij5Kkhska+BseTv/9x+VM//jqT8WyWEB578en5p1mF
         0u5zXc/Xw8R52EsJNaKlVEZSJZYWlauZhS6eCWboYuKKKH8HvvX9b1k3r9wdviSEeJs6
         PKJcsRnmmkuyA4YbY4m2lurdmO+s3un/NerKAfZQXTifXbw1zNWulzXaNa2lqDpGGqOF
         cWCqc/bbHyG9Mi+S77+kqezOwkYYVuaTrroV1ZgYxh/u7eOdpmejVHhD2+tDiX8SfxO7
         3GMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744041931; x=1744646731;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iyMXJxNU8APh7FepAd2LYAIeH/3a57mIaJumXNTEoaA=;
        b=O03eRHh8SM1S9HR7XeF0vVcPROUTZLFNIVR92v/4fiA8SnacVkn3fDg7lrVoDzTMMf
         5GFXrZYsc/j4jBgBx0DGTk9HDEriJHy7icnMK0bz8bpmAIz2ZplSB8JjSwaU/EVcwt/F
         Fm1TGDK00N8YR2WmMJnbtyc2GuNMSb04lV49oVCYYWbo1mkRIaGHxAA+AnBMax+K7j+D
         MkqgVi/WGDx2gR6QdKLGzS7QOrYtnT9UivDuwdgrcFaziIHMTs2mBu9ahZhZ45xRViwN
         y8fh6QqzXS5U+nr+H/6AFXDN7THmu4zpS1Qbj9ok/W6Rzu1x4F02RvJMQYSf/2XZ0y/t
         eWGQ==
X-Gm-Message-State: AOJu0YxaA8nnbUdymF6KE+ikPn8jSvJVwwbOYLo6vpvbViSwv29FwKUp
	myi5cwuS4W91lWUkjBXPKTs80GDliKktmKsEw7G3rXa59LKIMGZuRoYU9ZF2brglLOb2NNHTP7h
	zgvzpV18GibJeG5L89LTZIiRmMfPK7tmZ8Cfbnw==
X-Gm-Gg: ASbGncu9zk5WVG9EC/Cn9H1jIVAWxUIYlRVIgrhKjCNwLZhoi/2Sqg9irDNRhLPySPa
	98pRVLj7QzkGIzsCSqMg2/HINAtSRdMJ4/qiNibOKiFxarKIOTC+9iCQfqABrfpECPPqbQAK71o
	9PDqaHs66gzcRKWoAjgpGYVwfKBMo=
X-Google-Smtp-Source: AGHT+IFOHXrnkpBrQieKVZtIVdGZ28aD/0/BwHgFx8drk8Z2Zph8fJ0SKnIaOVRyh9bmDUc1XD5U19PreZpfxaF6YFQ=
X-Received: by 2002:a05:690c:b13:b0:6ef:6f24:d093 with SMTP id
 00721157ae682-703e14f5f9emr226254967b3.6.1744041931060; Mon, 07 Apr 2025
 09:05:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330221732.56072-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250330221732.56072-2-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 7 Apr 2025 18:04:55 +0200
X-Gm-Features: ATxdqUHTMeuPepFJsQ2xSTB0Ac9B1r0lgCNmw4z146LWlOQ_Pb00QDY0YlXE9_Y
Message-ID: <CAPDyKFr5xP5=Xo54Z9WgHuCegeUbfHo4HVn8du+SXRoghHAMAw@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: disable clocks if registering
 regulator failed
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Mar 2025 at 00:18, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Because the clocks were just enabled, bail out to the proper target if
> there are problems with the regulator.
>
> Fixes: fae80a99dc03 ("mmc: renesas_sdhi: Add support for RZ/G3E SoC")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index cea6af5daf99..8c83e203c516 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -1179,7 +1179,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>                 if (IS_ERR(rdev)) {
>                         dev_err(dev, "regulator register failed err=%ld", PTR_ERR(rdev));
>                         ret = PTR_ERR(rdev);
> -                       goto efree;
> +                       goto edisclk;
>                 }
>                 priv->rdev = rdev;
>         }
> --
> 2.47.2
>

