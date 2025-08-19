Return-Path: <linux-renesas-soc+bounces-20701-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3734B2C3B4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 14:34:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A0C05A5F95
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 12:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A27221CC4F;
	Tue, 19 Aug 2025 12:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KXQc1kGa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B7B2C11C3
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 12:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755606473; cv=none; b=fLwY7pgKwjQLiB46+kk46cyPAcFdFpBQgl0g2hXRVdIvw/iuvG++gOn3hfKu2/7mOoPq1nAZPXgsC1aXdWP2lyBkn1GNZcAv9nlI/daMyrdzaEL0lUQwwki2a8r8SiNLrvnzKkZyul7iN2FLy4ncYGn6ggen1GyxqWtE+r5ladY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755606473; c=relaxed/simple;
	bh=k99S63QCRzZoP1ZaMEnQIp3VzaYggU4rcNVg75AvI78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c3OkcFP1SSi3ss1M+iGg2ZBTvlfMNRwMYYwcOioI+GP3kfBb5PBLSv6TVVyboh36PcN5AuDfTCESPmFHRjuOrKsWYD6HyooLSu/Kyb6y8mQMuoLmpXDO5Y6gluJOtYFjjLoy5IbG8XIyNqOfzyIpSHzgEQGtaj3KTDrZph+wNUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KXQc1kGa; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-71d6059643eso38482047b3.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 05:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755606470; x=1756211270; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=30nUsnIu2R5PS4c+QL/2794svCv7EFufX5d71BpQ5pU=;
        b=KXQc1kGa48m76RQAB4BAzKAWTyjUPiWKqOs+ROgONgJdZZpQBIvDT1IPz2b+yINUFp
         LgEvq/S+jq8MNTqUOk2JWatPXU9cKjfBdImFxMz9T4LeMf/rxzHaRD4Fz4qh2yz0Bq/T
         2WN1X9DNsl9rExq+PFbPTvOpUnGhGzi2kjyAy9fxbux3UbP4YnJ06njzwhcczDgjSPn5
         wGAOpimXtWdq7o5OPNqBzT4kYbFibVjlE1iqo7UtLBTLMaCvJw0nWDZPKlW1sNqzwQ8l
         j41nOUi1vjj3PIzKshGJAMYrkNGZXf51i/8v1IgU8pzij7COTe59zR6Q4JKyrRWurBqO
         YSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755606470; x=1756211270;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30nUsnIu2R5PS4c+QL/2794svCv7EFufX5d71BpQ5pU=;
        b=QBi9+8GIeFQpomkYDC32Ta4T8evM9dMz1D01w2Xw8NHFbymrjX3HggXgigtcimmbDU
         b5NyObYhg/Zi0FCmYQjtJItNKHsI7hede90Cpxp38pp2DfG+mhbNehLE5ApMyL9MeYNo
         uFACNJwNqTp55DmVFhpzryAzr7M2xSi/K1nxKJPuR3NiHetwSqDwcG9AmnGpZcjUBYSr
         mfp8AiZdgjWN+TPoV9qbrEBeoXcKu2puhDVV5sXOCFX9kSLrVEruCBl0LFWXh/9nCLwS
         yYTASmOwPPQ7CvuPJb42jQ6bq5JL3QJPzd5ESE0AOjc8iG3V7Z+cDtZRwuC7/6rrN2WU
         B7hQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrZmczXV3U+Fw7tXrFAl5lmlFtrLR4vlbxqZBydOxpNilD6YsEplitbHhH3fFO5zufXLfdrVfTp5xVbqdLPh2q3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBkx2D+7gf1E5W4rKLDfmn3wT7Ci6VSsSrStgxqbPu6DDISSxg
	TLFARV7jGFkHIj2WsCVjT5rzhaD53+/yvXBtk67lP6JYwMsMOiqjHA6/5ABsB1zkOFwYnW5Uzth
	6zRwmOP5CRUXl/A7bosUHMCEsxmAHydX0WCzOdV8M7D9PJ0HdPSzQ
X-Gm-Gg: ASbGncuUACU9NVXabGZPx/phGmLUxa52j93eud/bvt/jILGY0mYhZi8Zy1f7Y6YmyQA
	rQcaLOYSJC2f/h1hHX91FQOSWxNYoISaMeD1L9clm9iXF9ilNxepRO1UcL1ELLSgRZ4E74jsDhE
	GokRB36h06BvYWQCsdsAjummU+nz21lbz1chhWsbIVBJdZhzAL1GMWBKHKuMQKNYZ8J3rl4LPrU
	G9nqZ0=
X-Google-Smtp-Source: AGHT+IGfDXEyqGZ2yk5Zk824iuEnMM0uBoW4+7wt5FpLmAKH0r7pvkne05EuTyUcsvubCLbiyzB9XLvDYUFajcw1C7s=
X-Received: by 2002:a05:690c:6486:b0:71a:2dab:74de with SMTP id
 00721157ae682-71f9d626cffmr24199107b3.35.1755606470316; Tue, 19 Aug 2025
 05:27:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e20a848ff952924f8f58c335f9a0242cb2565921.1755090234.git.geert+renesas@glider.be>
In-Reply-To: <e20a848ff952924f8f58c335f9a0242cb2565921.1755090234.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 19 Aug 2025 14:27:13 +0200
X-Gm-Features: Ac12FXwM5RUCs41V6tWdH0EeOe0d76VH5WvCQDgCbQsRgUF8Qlfnpu0pJ7izSHg
Message-ID: <CAPDyKFqjBZQY97uFOyWofOOxNW2TmLgyTy4v4RsTNE65+2Texg@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: renesas: rcar-sysc: Make rcar_sysc_onecell_np __initdata
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 Aug 2025 at 15:04, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> rcar_sysc_onecell_np() is only used by functions marked __init, so it
> can be freed when init memory is freed.
>
> Fixes: c5ae5a0c61120d0c ("pmdomain: renesas: rcar-sysc: Add genpd OF provider at postcore_initcall")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/renesas/rcar-sysc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/renesas/rcar-sysc.c b/drivers/pmdomain/renesas/rcar-sysc.c
> index 4b310c1d35fa6bb5..2d4161170c63d07b 100644
> --- a/drivers/pmdomain/renesas/rcar-sysc.c
> +++ b/drivers/pmdomain/renesas/rcar-sysc.c
> @@ -342,7 +342,7 @@ struct rcar_pm_domains {
>  };
>
>  static struct genpd_onecell_data *rcar_sysc_onecell_data;
> -static struct device_node *rcar_sysc_onecell_np;
> +static struct device_node *rcar_sysc_onecell_np __initdata = NULL;
>
>  static int __init rcar_sysc_pd_init(void)
>  {
> --
> 2.43.0
>

