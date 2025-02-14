Return-Path: <linux-renesas-soc+bounces-13164-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C556DA35C83
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Feb 2025 12:27:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28C5B3AE281
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Feb 2025 11:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3774C261595;
	Fri, 14 Feb 2025 11:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jTFlee+/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A372263C63
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Feb 2025 11:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739532401; cv=none; b=LbEUk3Jeg7A6H6j9BaZIoSGa6ZdEGvgCAzlMIVVMFRIVTWd6/5XirkuVn3oh0Fn8pUU88a97mRBqtkfVMdaspAnuewtFhAI+F0A/RVVEuKC5xOSz6l/N+Avic0Dk74sXbF3k83hrgs1r9ZAzzMkvklVNCr12CvbbRyoAlFWDz+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739532401; c=relaxed/simple;
	bh=9CFmR3NtOILyiu4Bu+g3fs7HgLLo6IFCFDt9ttxv4TY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CTLMfCGQXPTs+ThWmtv8Cl31kEd4uaCFzPpKlyPDtuEIzU7OnIxLGJO7jXLgWF6sCjNC7E5ji/RZNQokkQvaysIGWxHbIEV/aRBTIXlzRoQoW8KGhJrxDNnSq1vICC46u0FaqJPYEuRp9k2Vp+7aPTkg5vZJJEAs2u2GAQl9oxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jTFlee+/; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e53c9035003so1521763276.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Feb 2025 03:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739532398; x=1740137198; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NewR8BVnLAvb+QHkWMp14O+AvzFEsqhZDEpEAFt1rM0=;
        b=jTFlee+/f9TVv2DoWD+zvahsgmXyLxLv+CGARzJoBaY+haN96p8CSKap6H/8kFKmVi
         8PBn+EGSWWrNqvgwQy/22zKvnGxJ4BN01GzVQC0uf6NR7eSUza4MsoGlgPn6YlwxURyP
         LJUw+EC5ZwZpDDm7Kmrj2ePnKOFEkpBVHIHl0UlbLnqW6XGmOIB0y6mXhXImJ5tWu0MO
         RLyqVuPYuZbqSnQ/vUyQz7Q7DD8Ul79CkJV5s0QORh9r0fDudVe5F9SwfGcItCa2uwwb
         jjBxr3Jre7cNOX1QFLe4uzsOEwQ/+12+4O6wUcJGCl7RbRIPuWIg8DRDAbC0bzQ1TJmN
         kLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739532398; x=1740137198;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NewR8BVnLAvb+QHkWMp14O+AvzFEsqhZDEpEAFt1rM0=;
        b=sNNKTqYlbHkC9d2Z3gVvRIFXxEI4am4HGiE/7aVQzriKw3HL22IPSzCbZoGw7e6c0M
         qrzoveYPQqi+4UWYTZpI0CYHBDYsZmAqQ3g87rILEGJ48E9N/jayQrsOaUjLAX73Byoa
         GL6doDJuJwsDc074CbY01hyoiVOpQ/Lki8NDZcqGaUMERy6dUSB6NbUMSYgj8NvXo8SE
         Ovj3nHeVG9JPFJzcP/FUaiCAy1uvvA+Mspgddsg/U6W8MPngG/pghgBQQLUUo22La2oW
         7SsL8zji+jjnwsKItJdwUKdNfOSYV82NBTQM98eMGlcHzao/IrttSMhsa7k+m2pZ2lKi
         hDCA==
X-Gm-Message-State: AOJu0YyfMwIPBQDNycFX7TvR6iiKAvIghmKGOee5vj5pZT38q0YlOjRs
	vCghu/gki5I8hmqEZyc72lfuqn7HdFkW5KTekJClbh9EWMjr59nmOnwmuCfVJwynvMYj1oNpCeM
	Yfoly/XdjnBISXiFjbC24DpxmfKYT1d4O7eWJ6Q==
X-Gm-Gg: ASbGncuUwu0cIwxL8qapUeXlTUeqeMflZM+2+tdDSJqOfw++eJ7RJl+mJ8XbWKse7xP
	81p14jigjKoK9h2+Fgh4bsJHztqRnzCtPsZyAbLej/+igxpiEFurkfdIjJVIr21VhCYD2HrSzrA
	==
X-Google-Smtp-Source: AGHT+IFDX2eFmViL+5OfSdYQnUicI9/siMdarIoycTUrSgGa7HJlcc6AqAWw01jHHuRRs9G125oUVvKi+mqUSg2uSFo=
X-Received: by 2002:a05:6902:2b8b:b0:e58:32b4:4868 with SMTP id
 3f1490d57ef6-e5da8102cedmr6577945276.3.1739532398616; Fri, 14 Feb 2025
 03:26:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <05c2ef630694a28b560426d8c426881cc14e8f7c.1738748678.git.geert+renesas@glider.be>
In-Reply-To: <05c2ef630694a28b560426d8c426881cc14e8f7c.1738748678.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 14 Feb 2025 12:26:02 +0100
X-Gm-Features: AWEUYZkIpsTyC0FKSztaRjDkRsJdclXeZO3ETJo0ehA80cyTKZy1G6MUW_Wd4yU
Message-ID: <CAPDyKFouXuTZCqHUBwzg=BU7CbFJLa_Cd7q3Bs1wc-xzruMCfQ@mail.gmail.com>
Subject: Re: [PATCH v2] pmdomain: renesas: rcar-sysc: Drop fwnode_dev_initialized()
 call
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	Saravana Kannan <saravanak@google.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Feb 2025 at 10:45, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>
> As of commit bab2d712eeaf9d60 ("PM: domains: Mark fwnodes when their
> powerdomain is added/removed") in v5.12, the pmdomain core takes care of
> marking the fwnode initialized, so there is no need to repeat it.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Saravana Kannan <saravanak@google.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> v2:
>   - Add Acked-by.
> ---
>  drivers/pmdomain/renesas/rcar-sysc.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/pmdomain/renesas/rcar-sysc.c b/drivers/pmdomain/renesas/rcar-sysc.c
> index b99326917330f5f1..dce1a6d37e80127d 100644
> --- a/drivers/pmdomain/renesas/rcar-sysc.c
> +++ b/drivers/pmdomain/renesas/rcar-sysc.c
> @@ -434,8 +434,6 @@ static int __init rcar_sysc_pd_init(void)
>         }
>
>         error = of_genpd_add_provider_onecell(np, &domains->onecell_data);
> -       if (!error)
> -               fwnode_dev_initialized(of_fwnode_handle(np), true);
>
>  out_put:
>         of_node_put(np);
> --
> 2.43.0
>

