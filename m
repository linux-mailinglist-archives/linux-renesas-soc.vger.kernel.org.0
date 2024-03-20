Return-Path: <linux-renesas-soc+bounces-3938-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A986D880F4E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Mar 2024 11:07:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D91601C2161B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Mar 2024 10:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E0C3D97A;
	Wed, 20 Mar 2024 10:07:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7656A3D980
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Mar 2024 10:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710929232; cv=none; b=iBLA3mfMRFI8KldIs+aKfUhBEK0Scfi/Ajk2VEQtrc7eKCzDDje5KYUg6ZTn90ZImKtl8Rg2jnHXQGBiPTwZKPrCePSKz2pIuhl2v5BiIocOdOpG4CPwOP9RqsYCLZNq4nHYfMQ8XWkAZFUforUsc0CZnXeiXFtyCQwPx+Z5JYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710929232; c=relaxed/simple;
	bh=yFj574tlq7YFiCTNPKHv/jo8zeCSbfS4pUwH+mSz6e4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DAE0LqNIZB+xfDTL3l2sY4lcMDx2QSfcs0o6EPB29+yX+o+eDlaSiGwbQ4YAjSriuhATQ3MUtDAhUmmwRW4h5UtmZJh9gujgHG+qhaxmQtZg6TvTB57yVhcmacTmRLsDPijWAHdXVb05samAcV6geHMOnJSb7sucU9dZVweYris=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dcc80d6006aso6147972276.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Mar 2024 03:07:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710929229; x=1711534029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w4jsxh0mMrpskS3o6tIyEhxUJk7pnrbzIEz6f3B1s7w=;
        b=jT58eW2QlmakGeFDjDrwTgEBrIm5kkGvT/QVRGf4bWhE863+LkslShqWx7gLIIYy7J
         5ogLk49Sjre6C2obRSKJOxxfJVAWQHubkFlRfx+5bbDJlFpK6pbUVDfW+yJsUUT8X6to
         L2tea7fcXWnaI3c1KDaJQtL3CduKYE+gCprTTSCEXMLbiCHyikD45QX+MwnykxymH4kw
         XzX0fV4qY+KZwV5doJeYtg82FolhVUZNATQ21p3/H09waaSFPTVxho0Ut5aRklljbiNR
         /4miROEW95vrCas1R1vdcVQmEHFdrUYU0s9kRhLBG03M0bBZKplXZnYGUMXa/EuNRfRH
         k0bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb3//T1sYUQILyrvFrfuGs/Y56wXcI/kXELjjw4Dk19RzRpgt4SoCNzTKxDz9xDisVANMjA9F4YPMOGrx1udaX9V5mPY72f2NiscKXs7c+kjE=
X-Gm-Message-State: AOJu0Yzy+p0vPSADu1vCCx6OD9W+/nJM1GVHTlm7gzVJPgodVaq+xW3u
	oUxnOd2fmTc4y2FJqAijqyp0O6X7f5V2rvoWlB6SB9pGG026kdnieyTpo5v+6Uw=
X-Google-Smtp-Source: AGHT+IEmIIUxcDk3Z2g+j8DO2IFW+l9xikM7lNfCgOqgj5GULvbEF4ltCQApYkVoVVymx5e7e/V6eQ==
X-Received: by 2002:a25:ac47:0:b0:dcc:b719:4e4f with SMTP id r7-20020a25ac47000000b00dccb7194e4fmr12240027ybd.53.1710929228930;
        Wed, 20 Mar 2024 03:07:08 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id m1-20020a258001000000b00dce0f2db9acsm2465486ybk.34.2024.03.20.03.07.08
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 03:07:08 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dbed0710c74so5253711276.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Mar 2024 03:07:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWKk+HBmm4bP/rK9XSzYFTdVuaDxFL+y9hb50ogmtJRVjH2vYCf5bfi6gnE7LUK1TFkOyZumCJI4uLh58LzHrVehm/jOgEcxSKRiNrlZhI8gUw=
X-Received: by 2002:a25:688b:0:b0:dcf:c6d2:6c5f with SMTP id
 d133-20020a25688b000000b00dcfc6d26c5fmr12807429ybc.26.1710929227862; Wed, 20
 Mar 2024 03:07:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1710864964.git.geert+renesas@glider.be> <1a60832f3ba37afb4a5791f4e5db4610ab31beb3.1710864964.git.geert+renesas@glider.be>
 <20240319224223.GC3438308@ragnatech.se> <48276bf6-75d3-411e-b29a-2303e5d4bfbd@kernel.org>
In-Reply-To: <48276bf6-75d3-411e-b29a-2303e5d4bfbd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Mar 2024 11:06:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUk5RuhnkuX0=zdDSemZDe1F0icDE6ayioCujpgP4CYvg@mail.gmail.com>
Message-ID: <CAMuHMdUk5RuhnkuX0=zdDSemZDe1F0icDE6ayioCujpgP4CYvg@mail.gmail.com>
Subject: Re: [PATCH 1/3] ARM: dts: renesas: r8a73a4: Add TMU nodes
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Wed, Mar 20, 2024 at 10:33=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> On 19/03/2024 23:42, Niklas S=C3=B6derlund wrote:
> > On 2024-03-19 17:29:05 +0100, Geert Uytterhoeven wrote:
> >> Add device nodes for the Timer Units (TMU) on the R-Mobile APE6 SoC,
> >> and the clocks serving them.
> >>
> >> Note that TMU channels 1 and 2 are not added, as their interrupts are
> >> not wired to the interrupt controller for the AP-System Core (INTC-SYS=
),
> >> only to the interrupt controller for the AP-Realtime Core (INTC-RT).
> >>
> >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
>
> Please run scripts/checkpatch.pl and fix reported warnings. Some
> warnings can be ignored, but the code here looks like it needs a fix.
> Feel free to get in touch if the warning is not clear.
>
> DT bindings are separate patches.

Sorry, I don't see a point in making that a separate patch: the
clock-indices in the DT binding header are only used by the DTS.
R-Mobile APE6 still uses the legacy CPG/MSTP DT bindings. The DTS
for newer SoCs just hardcodes the indices (as part of the full module
clock number, straight from the hardware documentation).

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

