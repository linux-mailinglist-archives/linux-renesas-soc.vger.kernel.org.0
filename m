Return-Path: <linux-renesas-soc+bounces-5925-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B838FE64E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 14:17:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97F9D1C2590E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 12:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F39195B0A;
	Thu,  6 Jun 2024 12:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0a6jw42"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1967413C67A;
	Thu,  6 Jun 2024 12:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717676159; cv=none; b=gdADjOK6Yvp38h/1RGFGWYYrb61ZfCWVqUO3zwiw+IbzGQYdwATiUTgffLOwiSkIYDqBT7OLbxvG1AC3zmn1YvVQb33NB6gqIB+Th1AnaFTd1FSYulLDLVm7C+ii3gANr8YmmLsxF0NxTGVNRif0pAg2IxN/d9WVM8QkYtiCXbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717676159; c=relaxed/simple;
	bh=/ILD+yysd96LQOcdo8q6ydbBw8MiIr1yxbmz97h7ldI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=mpdWH7gLl+lhvbFjNsL2BQmCdnULx7J/0HVk8Rz8+4PTJZHXEUl5h6CezXjXIrV3F8sF1I3rrj1ZgwHSGULRVY1NdnQV96iKoC5uDuogx2MBBKp4ZEPo6WZ3SP7K0cFNJPTJ2P0+g0lSSK4Q6z7bw+rA1KrJ3RzoylaQN5IMRRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0a6jw42; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-48bc50d1e12so269244137.2;
        Thu, 06 Jun 2024 05:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717676157; x=1718280957; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2+uhi1v2SZXqGXEnTfx34Wm9MPbbIaEgx51pK2VeTM=;
        b=d0a6jw42Zzn3ZHLtQsNkNkVXIbr6NsGYdn4LIwysfm3s3rRsJwLGeQ9N4cT38yu7ba
         8hTIWLTkqamQ6ZHbOs7rFGWWUIfza/q5N2707+gDVlw2Tzagw65huufKv4T5lioVIJAi
         js8ZF0m7PO+IkZ+valXWNll+kgvc4v3vMARzEh3gvlCoLHdJCvr07kVo0Z1abr1lCnZ2
         BmVhz+ISZ7EayMjvU7H7wA8aBUAVRvaCALpQomkvx2Hs/lFJxf0V1RLIL2Nmc2tkrF6K
         0LWbwDg0c/d2cmpRgsJz/XVSHneJtnKKaZTz5a9wgYnXjkbKFnZiRYHyCHwGarU7dC5v
         hs7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717676157; x=1718280957;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2+uhi1v2SZXqGXEnTfx34Wm9MPbbIaEgx51pK2VeTM=;
        b=e81p4hILlXuHxq1cZ9Uj19Dg0/wVUOcWXIcaO/HXx/r4/p8k/WIJ23MLwS5Ebh+Dow
         Plu+n2901jFIZDSKpX5iZ9k+naW6fjG9ZV4q5CynsaOc9bue9ZL+ht/z2wwRf9jURJ3R
         KuWlrMapiSmuRFmSCg6eqDKS6NgUJnN6PKaaRAetCOdTwaIZQwx4LiWRyDHol7g6Dptp
         NnQ0UbEyK6VksI0gWYgK3Ne06EaUnbEVaru1jE53yMFIO9HyJT0s3W6LA3Cvjay4mvs6
         uLC70G9WvXi7YX9xh8qhnyqMLAnJmlCfSSz7vxIRsYW7dhG3wb1sJwvpbTyA1Jz/3lth
         ZRdw==
X-Forwarded-Encrypted: i=1; AJvYcCX3KcaqVM79QSeggliMrEGDMjMWN0olQBdLL4YAlCrlk+DQ/c0fgtzowyS9HIYfu2FyEVFCZjqhBi2eDwpnMlDRIxWDGgfD1Oc7htty5MCNU53aZiSuBuI8Uq+KHD0LyqYRQ8icKr5ctZ/7Uyy0Mb2Rg/gJx+v46/T7t6b9t/SUkmG2PxzLW7vXOgqO+Biw7kyIkLqsFJBNMjEFjddl6ZbFkB1oJazJ
X-Gm-Message-State: AOJu0YxkDXGGoC5bOVOVJxa2g8/aXIB6tlFa/InvMAwmj2Q3qxwOn9PR
	+YHh8xn8GEz88v6l7HEuA+WLY9hC8RY2/v+3MKWi84O4uZf7gl1EpF3X7ESzfvyjTfb8YGw0JIA
	fOdgzZNUnqPUlsVf6Is9OG0tAIac=
X-Google-Smtp-Source: AGHT+IEtT47JTlx6jnMKU9PXVq/XptLMk/6ncO97G9msW7yyL8oVjf2Amhz+iTjNnA5sPFxNzXv+hmIiZfcH5rDBR/o=
X-Received: by 2002:a05:6122:2010:b0:4e9:7e39:cc9e with SMTP id
 71dfb90a1353d-4eb3a4dc39bmr6795855e0c.10.1717676156610; Thu, 06 Jun 2024
 05:15:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605074936.578687-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240605074936.578687-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240606100810.eskr7bd3oqpphaxh@ninjato>
In-Reply-To: <20240606100810.eskr7bd3oqpphaxh@ninjato>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 6 Jun 2024 13:15:30 +0100
Message-ID: <CA+V-a8vAkuHN8_4w5QJ-V_ehnmWrto=Ox2A7D6Wrr7bnaf=t9A@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Prabhakar <prabhakar.csengg@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Thu, Jun 6, 2024 at 11:08=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Prabhakar,
>
> thanks for this series!
>
> On Wed, Jun 05, 2024 at 08:49:36AM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The SDHI/eMMC IPs found in the RZ/V2H(P) (a.k.a. r9a09g057) are very
> > similar to those found in R-Car Gen3. However, they are not identical,
> > necessitating an SoC-specific compatible string for fine-tuning driver
> > support.
> >
> > Key features of the RZ/V2H(P) SDHI/eMMC IPs include:
> > - Voltage level control via the IOVS bit.
> > - PWEN pin support via SD_STATUS register.
> > - Lack of HS400 support.
> > - Fixed address mode operation.
> >
> > sd_iovs and sd_pwen quirks are introduced for SoCs supporting this bit
> > to handle voltage level control and power enable via SD_STATUS register=
.
>
> Two high-level questions:
>
> - can't we use .enable/.disable in regulator_ops for handling pwen?
>   Then we could simply use regulator_en/disable in the code and be future
>   proof when other SDHI instances have other kinds of regulators (unless
>   I am mising something)
>
Ok let me check on this and get back.

> - what about not using regmap and use set/get_voltage and friends? My
>   concern is that other "new" registers might appear in the future and
>   it will be cumbersome to handle the scattered IO regions.
>
I'll have to do some reading on this. Can you please point me to any
example driver which does not use regmap.

> That said, having a regulator is not a quirk in my book. I'd think
> 'struct renesas_sdhi' is the proper place. Or?
>
Ok, I will move them out of quirks.

Cheers,
Prabhakar

