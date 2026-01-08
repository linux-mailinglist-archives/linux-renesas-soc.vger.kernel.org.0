Return-Path: <linux-renesas-soc+bounces-26468-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B8BD05BA0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 20:05:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5A70C301949C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 19:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2481328621;
	Thu,  8 Jan 2026 19:03:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E7C322A13
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 19:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767899039; cv=none; b=gWZ/40Rz6ik/wq4TLUfMAmbNS4IMmxMxgn0ljN69TsDlZSar4APeqnXtK84K/aIcJmKLr3wAzvcoVjGYLcLa3YmSqiaHGeCjkGOUVYRTXjVxip/9kK9jZ70HXrr5VjW1pNaTkrKQEZtImvoh5z0uWwH8YA8aHhkP7jfaCvVUPYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767899039; c=relaxed/simple;
	bh=xkdhuC4s+3mOYP0yOIF0uzVtjPP7M61rCMLgQ0C6+CE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ps4GnTMYLuq9Hd3OwgzwxLbj1w1UXceBN9lPaXP1s7gbEMyqBJMtkZb0CsfdTSseMt4hShPsZ2ZBIeAzEwNH4RcpleZ4H9jAAd/KBO+nogJpZVPAu+HF0Mcxf7rUXM0kKIVuzPX6NwojDAI5pfKPczCY6fVrEeoPZRsS/tbaZww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5eeaae02888so89224137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 11:03:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767899037; x=1768503837;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4POSF/G2AiiMzhu15VytRAuNKvteZUdBLrFSKMZB68=;
        b=oNWwZlql4GOrjKTxLBMYdTuT58QX37TI3HIfDJjV0nKJ9wRWguuFnjuvBReKqUwJBU
         daEO9XF054IujHrVjIV4D4Riv62UxZPdCE25yTecBTwzfiC3EV5jSGW/ZI+PprngPpgg
         x3OcIr/Edo5POTBCAx3oyCzEjAeI6mIvsydVxuSye9uRFkOz3ngZ5lu8MEA3wAo+YDSW
         bH+0ls9czH1ij5VixesoHm1UBl/l/seJCi9Y6gh8SXbbHFJ5D9YEd058VysOSibh+4GX
         frsJS9cP2MLfN83GdcwaI6EmAm3HQuAtc01Ll4qtWNTRnD/oF5LnIbqVW1U8/UAxXFdY
         lq9w==
X-Forwarded-Encrypted: i=1; AJvYcCVx8KfpsDkbesRuLfzjo4j1nSSmTJSLU+uUq20zSUu6T2R9LUR52e2weqZSk7NbawLXFZ/yOpaQHC5G1qJ0uUx3tg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzQ+L8xKpOPOrwtJpICdKbcP6KQ4dgC/vG0oYNJb3TFY8I3WPr
	AoPurXQYiLZjBD/ua1ezjjBdlxcb26nm9UYvD5cjUiufQ+4SQg+k6/de4NiXqtc2
X-Gm-Gg: AY/fxX4PEpjNaHcWrmAPnClCTLY6DVukjmC06rp3/bndv92jbiLMNfWA8guW7lDlxNx
	HpwrZKSkEi/pFCPsYRLNlFgL0XFUshvwp6tOHcAwnPEReQNmbrrtGgLU56YtY+mO5k8egDcwF2F
	0L4VfhYF6riQ2b42egkaTGPMhVeXuqeFLAWEHL2WdM/Lh7nOMTQ6+bvo1um48jK0lnwawj6NZPJ
	HqKgldvgxwb2sjTbetwBcd3ZQ7GXzaWOjteioaKkri3A1UgYd9pzziKFeg7Gxx9G9/J8Jvg4QJE
	KJQwVlgVSUZSvGsG3aBSzhkDes5ka7QFc7CYnQNPxttvNqte2zl8rBEjxp//KoIdDAE903zLcwS
	B3FJ3UyYjKo4k8TleVS+V4TSLm2UNDmfOFTsXR7m0twtDN515nGnP+PvjrVx/wnKFKl188IxS1M
	PhaxWlXKtGpiR8oShT09CuwdZLs9I5SathyK3rtvScAjKnbw+q
X-Google-Smtp-Source: AGHT+IEcvcDkWGolixo7S6kvTbmMndQPtQ8EstI365J8F3BQ6u/UJQjpJYoldOKf4oEe3K1yyJDl/w==
X-Received: by 2002:a05:6102:c09:b0:5ee:a309:6684 with SMTP id ada2fe7eead31-5eea30967a6mr877185137.10.1767899037313;
        Thu, 08 Jan 2026 11:03:57 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec772e322asm7406283137.13.2026.01.08.11.03.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 11:03:56 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5eea31b5cb7so248778137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 11:03:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWpb2SgAM4PxVQGtisDm4MHiToqEQGhwUBBT/90SeZOgzKByEMDV3p9NXt4gyGZxWUQjvKV2Z7e6EUhLTAT6e4kdw==@vger.kernel.org
X-Received: by 2002:a67:e115:0:b0:5ee:9df0:a5f4 with SMTP id
 ada2fe7eead31-5ee9df0a818mr1083422137.31.1767899035850; Thu, 08 Jan 2026
 11:03:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205150234.2958140-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20251205150234.2958140-8-cosmin-gabriel.tanislav.xa@renesas.com>
 <CAMuHMdWSB=9d7jwFcLjJY3zJjs7neFJ+tr+GtTDAU85=o8xK1A@mail.gmail.com> <TYRPR01MB156196B6A2C6808841B5BAF818585A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
In-Reply-To: <TYRPR01MB156196B6A2C6808841B5BAF818585A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 20:03:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXJ-zC0kWViGTbdyRifNKB5R1DRpLcgyk0_zr=XTjx9tA@mail.gmail.com>
X-Gm-Features: AZwV_QiG1FTx5__3lAFmUWj9TP06IZp1Z3Zx_MjG3bA3hF9KZ0sDQDS0nL8rtcc
Message-ID: <CAMuHMdXJ-zC0kWViGTbdyRifNKB5R1DRpLcgyk0_zr=XTjx9tA@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] arm64: dts: renesas: r9a09g077m44-rzt2h-evk: add
 GPIO keys
To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"magnus.damm" <magnus.damm@gmail.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Thu, 8 Jan 2026 at 19:28, Cosmin-Gabriel Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Fri, 5 Dec 2025 at 16:04, Cosmin Tanislav
> > <cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> > > The Renesas RZ/T2H Evaluation Kit has three user buttons connected to
> > > GPIOs that can be used as input keys.
> > >
> > > Add support for them.
> > >
> > > Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

> > > --- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> > > +++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> > > @@ -7,6 +7,8 @@
> > >
> > >  /dts-v1/;
> > >
> > > +#include <dt-bindings/input/input.h>
> > > +
> > >  #include "r9a09g077m44.dtsi"
> > >
> > >  /*
> > > @@ -60,6 +62,37 @@ / {
> > >         model = "Renesas RZ/T2H EVK Board based on r9a09g077m44";
> > >         compatible = "renesas,rzt2h-evk", "renesas,r9a09g077m44", "renesas,r9a09g077";
> > >
> > > +       keys {
> > > +               compatible = "gpio-keys";
> > > +
> > > +#if (!SD1_MICRO_SD)
> > > +               /* SW2-3: ON */
> >
> > Shouldn't that be OFF?
>
> Good catch! Yes, it should be OFF, as it's ON for SD Card.

Thanks for the confirmation, I will fix it why applyig.
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

> I will fix it for the next version.

Hence no need to resend.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

