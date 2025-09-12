Return-Path: <linux-renesas-soc+bounces-21792-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C46AB5440F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 09:38:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C0EB7B585A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 07:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB332D3EF6;
	Fri, 12 Sep 2025 07:37:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E2D2D0C92
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Sep 2025 07:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757662664; cv=none; b=RndIyTCEh/h2YuyLCYkPl5nld4cO3cX2IlhmmMlA7ZnMGfer4NsGFc1V/08ZlVdpSmjMA7Kme4Kxl6qRnQeLsfQiS7CO3nUjNd7di+Ps9Ugg6m3wysiz6nqQqZuBEQLxFIqfyj6oCxsHCDtbePMPIGHsyodDuThn6Pvmpx40Q9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757662664; c=relaxed/simple;
	bh=PiktLEImYkgXUvH87G3NyjdiYfU4aHi90F2MtNsUp3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V67MDifGntMmhqTKaWiAZrYc+Mm3I9L0s6VpVzHlB7kIz75RaWLZ6z3168mlOrAQUBjhlLCKZsYAt9eplfQunbvymmgc16KHKESW9K53+SRllxbC8yatLay9G9wxvje4a1oo+x63oOhN49oJwF6xn61Dzr74BapmXxVAiT7zcEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-52a4e220b9bso237617137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Sep 2025 00:37:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757662662; x=1758267462;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRW2V83MklnBniZBmB0Qehe2sLfJWCfmncqnDf+8mVQ=;
        b=KR7WNnbx+LZhNmOHeC7Db4jCOYgkBP8E7qF59v4t6NIX4VLnpncOQ/3h8172nBeDgV
         FDMACfP80jg894WB2zEApV3Us8gp1ktXQDeOaQ3kgoew1+gE1gRKzHpjCK7Ytg+utkEt
         h906B5gxWdqF/hsM9tpjDs6+3pW2I/uT9t48JPiRRRxvjBXnzcquHKE/g1nANwywDzx/
         Wpa+7MJaSJEnsA0976qdvty3FTcerLU3fqUzwnTdDsvGkTNXnz4glT6YIGDTXVLD+k5j
         ykF/ltwCC+PKmq45Dn7Gsg0jZg15JyvxA5JzzfZ22wSPWRqw21Et3fr5AP9Ykcks2FVq
         XGow==
X-Forwarded-Encrypted: i=1; AJvYcCUhikXD07Rcz/WyCbgzxwRciK9PLnEDDQ+VOgLheMPOAg/mxI7CuxvnpmLL8yOlMonxrgc5heolHWPu8ws4UZW0RA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZYSDXcHclFalDcZlQw8lJSj/pUCEesRwNzGoC6Ng/W84eJ2Yn
	iig4VHnpyeH+fRqJYWcmdJT7IL7OLgdTyZeJklXPr9vhlkN3x3QEs5QXt2vVHGdb
X-Gm-Gg: ASbGncsK25DCXMOmPKuuZgNUQvdd6f42gZC/6/1KZKIUdOW9IjXVlj0JUZ1c2m/Xal/
	yLUVyTow3DYL90nKpVre4a/kzBhn2msqVMMZMgFg8LltvQG68Wyqp7TQdMTiDjzxVQJJbdv9zFn
	UIkxNadWZjO5AiyrKQ9eb+tFFZN1jG3xLputX6hOdYXgX7ixdxr91+cePInHa2oqQA+8LQjIeoP
	8rLu4v5WXtehy7aoIsWZ0gzq4dQrQBMLb7tMgkOiaZ34fpGWTvcaDc18Uo8WHFnyyYQ3XnCr53B
	o67RcS8TvivgAcwHSbKbUwWVe/OFwENpk/kB49xS1gnXFJO8M9i/oRDbvKf4me5xV/oxBjWn+yM
	YF2RVLoA0/BjxGTuRP3tuqsPObvgw+3JaV5NDR/x9dTSeGlUdeIuUlGQOhh7d
X-Google-Smtp-Source: AGHT+IGv+XgkVKtOfnjy3fF+ux34U5T1vftovuaJ73DTkLT6YzswRqNnipFrftfABZ39gk+NxMmocg==
X-Received: by 2002:a05:6102:f0f:b0:4f6:25fd:7ed3 with SMTP id ada2fe7eead31-5560ef965b5mr727381137.22.1757662661763;
        Fri, 12 Sep 2025 00:37:41 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5536f7c6aafsm847233137.3.2025.09.12.00.37.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 00:37:41 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-55784771e9dso111422137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Sep 2025 00:37:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUMkpDMXFXHaml8dTOS30VmZ4HXf7qIYfMrFgF9uQuhhT8DC5wbu73Qig9pN18GEPun3mnhjZvqInjBrja+nSiFbg==@vger.kernel.org
X-Received: by 2002:a05:6102:4411:b0:523:863d:ecd1 with SMTP id
 ada2fe7eead31-5560a301b3amr693876137.9.1757662661033; Fri, 12 Sep 2025
 00:37:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87o6rjvzf4.wl-kuninori.morimoto.gx@renesas.com>
 <87jz27vzec.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdVVV5tY_iwb=Xn6XVY-Ai6spBY70yXhc5VRxwDva8BGng@mail.gmail.com>
 <87jz24fqrg.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87jz24fqrg.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Sep 2025 09:37:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX3cviP6xHnGP01kRDwuHRrHg0ZpNLV8Mf29MFS1B7S8g@mail.gmail.com>
X-Gm-Features: AS18NWD8o29J0vt7DW3b5lRRM8FrDoQH_WWuzAAAh--HlMV8yj9Iqvo9Z9bUafc
Message-ID: <CAMuHMdX3cviP6xHnGP01kRDwuHRrHg0ZpNLV8Mf29MFS1B7S8g@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: Add R8A78000 X5H DTs
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

CC maz

On Fri, 12 Sept 2025 at 02:39, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > > +               /* The Arm GIC-700AE - View 1 */
> >
> > s/700/720/
>
> Oops, thanks. Will fix
>
> > > +               gic: interrupt-controller@39000000 {
> > > +                       compatible = "arm,gic-v3";
> >
> > The documentation states it is compliant with GICv4.1?
>
> I'm not familiar with GIC. And I think there is no v4 support on Linux yet ?
> If my understanding was correct, GICv4 have GICv3 compatible.
> We can use v3 driver so far, and can be replaced to v4 driver if it was
> supported in Linux?

'git grep -i "\<gic.*v4.1"' does show support.

Marc?

> > > +                       #interrupt-cells = <3>;
> > > +                       #address-cells = <0>;
> > > +                       interrupt-controller;
> > > +                       redistributor-stride = <0x0 0x40000>;
> > > +                       #redistributor-regions = <32>;
> > > +                       reg = <0 0x39000000 0 0x20000>, // GICD
> >
> > The base address is 0x38000000, according to the docs?
>
> It is indicated in very deep place in datasheet. I will indicate
> detail in v2.
>
> > > +                             <0 0x397C0000 0 0x40000>, // GICR Core29
> > > +                             <0 0x39800000 0 0x40000>, // GICR Core30
> > > +                             <0 0x39840000 0 0x40000>; // GICR Core31
> >
> > No GICC, GICH, and GICV?
>
> will be added later ?

OK.

> > > +               scif0: serial@c0700000 {
> > > +                       compatible = "renesas,rcar-gen5-scif", "renesas,scif";
> >
> > Missing "renesas,scif-r8a78000" (everywhere)
> > ("make dtbs_check" would have told you).
>
> Grr, thank you for pointing it. will fix
>
> > > +                       reg = <0 0xc0700000 0 0x40>;
> > > +                       interrupts = <GIC_SPI 4074 IRQ_TYPE_LEVEL_HIGH>;
> > > +                       clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
> > > +                       clock-names = "fck", "brg_int", "scif_clk";
> >
> > "fck" on SCIF should be (derived from) SGASYNCD16 (66.666 MHz).
> (snip)
> > "fck" on HSCIF should be (derived from) SGASYNCD8 (133.33 MHz).
>
> In the early phase, there is no clock control support, so assume that
> the clocks are enabled by default. Therefore, dummy clocks are used.
> But indeed the naming seems strange. Will use just "dummy-clk".

I know.  But currently the clock rate for the dummy "fck" clocks does
not match reality.  As the SCIF driver tries hard to find the best
clock and divider for the requested transfer rate, it might pick "fck",
breaking serial communication.
So please add dummy clocks for SGASYNCD16 and SGASYNCD8, and use them as
"fck" clocks for SCIF resp. HSCIF.

> > According to the DT bindings, "power-domains" and "resets" are missing.
>
> Unfortunately, can't use for now. It needs SCP support but is under
> development. How should I do in this case ? Maybe use dummy device,
> but can we use it ??

Just leave them out for now, but be prepared to receive complaints
from the dtbs_check bots ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

