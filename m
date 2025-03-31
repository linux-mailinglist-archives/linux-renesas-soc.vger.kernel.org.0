Return-Path: <linux-renesas-soc+bounces-15213-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C60FA76D3B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 21:06:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45C11188CF6A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 19:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853C61E0E13;
	Mon, 31 Mar 2025 19:04:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73864219312;
	Mon, 31 Mar 2025 19:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743447890; cv=none; b=idLomM3WmAOEhbVD8PoUTLiQw5kghNd+FVACvExKnfZg9DLl8uRy2o52/UQWyrMOyWHqe9Ed0PIhcXonSRKyFP9mRK9/dtVMVICpZrB4NRU4t54gJHLO1kX2mDphV7GgFlFy8ct2URgZeOAHOFwcruxZYyeEuFv95TwJHz+oNOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743447890; c=relaxed/simple;
	bh=+q2jP3dA3VKzyABXTuBF1mbD3nM0+PnlxqtD9pv7Vhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=scJ7rjwyITAJEezuJrwJ2NVxJ0Ek8sJkqqfg8thfl3h758Hs5fVE179rtiIiBJMs2qoBNyoTS10JC0oD7wjsDvwjobC59KKy0KTfVE++mmzEehyKxJy1eK0+ntXrARSqFd7/DXDvmoNrF8Ah277LKAy/3PGabSb0dNdaknm5d68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c5b2472969so488014085a.1;
        Mon, 31 Mar 2025 12:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743447886; x=1744052686;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WGlH88loLOhaby14QKrsc+rUD7z6D+beYPeG7Yhhv3k=;
        b=tAX5XDPZPsOaLaHLOJEx2E+snbauVz0/AOCy0Up4EYCEh3Lvi2F4WFDVdtUVnz5SAP
         x9PC6DLXzzxcLWSefpb5zoj45G/B40CvHWC8PuzEOjm825cZ/G6R1G/v0cWuaa9DBzsm
         e3REIK7DKhYP9+OvAhCRf51gAsljHhUziQH+iJGWBvE/q44CRA7vz9yJJSNtZEkvIZz3
         mmDy3Im3bXOos6q9u52egyPn+jCRs03hkFMKdmVDuzy9ZMrm5PLIZIlEEXe50krAtUQX
         JBrg5jxke0Hw0SUZ0u/2dDlAnGJtuWJ11xuCnZDBiVjv2jyrzJfmBaHMYWYcvKesbuXC
         q2ug==
X-Forwarded-Encrypted: i=1; AJvYcCVYhiddu257aVSOo8n5jjRpC4s2UJLp0/jrofjM2dxyXtA/XXMMu1xn63JM/KxUpfD4QKjpyQzyWtdF4yBDC7JvLMo=@vger.kernel.org, AJvYcCVmCWjiFA7OrdflQd6MJPAHcuqZhgjoGKhoXfP+iaUUnGQIALQknj5NpVdFw5n9Vh79EaI3GttoE7rR@vger.kernel.org
X-Gm-Message-State: AOJu0YyzHLzZQuhl/dc5etyPfAtJDojKQtkqFz2h5UIAkHcEX/XBsXKT
	XTT47nSkW4n4gsliN+Zw86WG9A+cqs6tXjuM0bIdsGf0rbOzm1vVII77xg8U
X-Gm-Gg: ASbGncuBMmGr7/XvM8QojWall0I/BRWWASjNoEKApbQ8LMuIHXgOxmtqBSiqckYwx8T
	5Hj4aX7fa6UjQ0py6Xlf33dUq1M4sh7yN1JTCThks+dqmD1wc1EfoHy39QzcsJzs+EG6OtUqp1y
	tfixmH0/vzkr067ZQOWBaUKrCBg4NSwWk0E2z8wzHNfCu7Qp56YDILu2Vc5MggUxw0MPId9hgty
	k+bh8Q4dyWzSP3zHERaNG6H4WjH6e9xx+y7E+66soEqQtr/n9HxJXsHTQ9iV4usQpuLuQvtRL9v
	a4pQkoz7EV2+QLpmJgFY/zyjeGqS2H9ujhvawpanTN/2jteyi7G406ZjogqwmRemjNEut5691CJ
	4xvkHsdcQRdE=
X-Google-Smtp-Source: AGHT+IGJRadI9lopaJOrvSJ4d1UWNkz02xb97L37bUKZsAdkP4c4h/EEWTKiOzYFLhVDBTt3Fu4Hog==
X-Received: by 2002:a05:620a:40c6:b0:7c5:4b91:6a41 with SMTP id af79cd13be357-7c6908aef84mr1464849985a.42.1743447886545;
        Mon, 31 Mar 2025 12:04:46 -0700 (PDT)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com. [209.85.222.182])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f76abe42sm532266485a.52.2025.03.31.12.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 12:04:46 -0700 (PDT)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c55500d08cso430380285a.0;
        Mon, 31 Mar 2025 12:04:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV5YO+7W7Ahn0bGNDwOvmpGSSzp4Gi4+Q7J0R8tcXyPQp34ltn28j5TynEoFSlg3+8PCRZBlJtoaYtcUQdRIC6hBjw=@vger.kernel.org, AJvYcCXcvRpUZFOPmjYuE2/vr/Z1+8S9Psj3gSyZWqug8CSVZJG3U5/2KtSAh/KZ1xrt4G4i4tSgJNlCfBMk@vger.kernel.org
X-Received: by 2002:a05:620a:17a9:b0:7c5:4caa:21af with SMTP id
 af79cd13be357-7c6908cf48amr1373243885a.53.1743447885917; Mon, 31 Mar 2025
 12:04:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311113620.4312-1-biju.das.jz@bp.renesas.com>
 <20250311113620.4312-2-biju.das.jz@bp.renesas.com> <TYCPR01MB11332F064115080582332B78986AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <CAMuHMdVy3B+i2p6unkX-n=7AYCfP5B8sW7F9GJi7URcvniGA2A@mail.gmail.com>
 <TYCPR01MB1133206083EC0249A827261EB86AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <CAMuHMdUyY8SsUQEZwxdCK-ggPuYy8L_WwnUgq3Cj7oYiTcyNTQ@mail.gmail.com>
 <TY3PR01MB11346123B74D86590C0F8B9CD86AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdWevyJ8Z4YWYx0rr=_TD0OTywbkPfNwRcw5k=yDV-i2Ow@mail.gmail.com> <TY3PR01MB11346E47B6455546AD1E6062886AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346E47B6455546AD1E6062886AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Mar 2025 21:04:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWucnfe_r63Bio0-k9nxzBEgpWHmatR8y8VEUHGzSe7MA@mail.gmail.com>
X-Gm-Features: AQ5f1Jp_imMhTENJdVUuLCYIlIinAm7qix1a9AudUDGdfJZbTJOZU3umRWXXPMU
Message-ID: <CAMuHMdWucnfe_r63Bio0-k9nxzBEgpWHmatR8y8VEUHGzSe7MA@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] dt-bindings: memory: Document RZ/G3E support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Stephen Boyd <sboyd@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 31 Mar 2025 at 20:29, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Mon, 31 Mar 2025 at 17:33, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > From: Geert Uytterhoeven <geert@linux-m68k.org> On Mon, 31 Mar 2025
> > > > at 16:34, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > > > From: Geert Uytterhoeven <geert@linux-m68k.org> On Mon, 31 Mar
> > > > > > 2025 at 15:54, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > > > > > From: Biju Das <biju.das.jz@bp.renesas.com> Document support
> > > > > > > > for the Expanded Serial Peripheral Interface (xSPI)
> > > > > > > > Controller in the Renesas RZ/G3E
> > > > > > > > (R9A09G047) SoC.
> > > > > > > >
> > > > > > > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > > > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > >
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/Documentation/devicetree/bindings/memory-controllers/r
> > > > > > > > +++ enes
> > > > > > > > +++ as,r
> > > > > > > > +++ zg3e
> > > > > > > > +++ -xspi.yaml
> > > > > >
> > > > > > > > +    spi@11030000 {
> > > > > > > > +        compatible = "renesas,r9a09g047-xspi";
> > > > > > > > +        reg = <0x11030000 0x10000>, <0x20000000 0x10000000>;
> > > > > > > > +        reg-names = "regs", "dirmap";
> > > > > > > > +        interrupts = <GIC_SPI 228 IRQ_TYPE_EDGE_RISING>,
> > > > > > > > +                     <GIC_SPI 229 IRQ_TYPE_EDGE_RISING>;
> > > > > > > > +        interrupt-names = "pulse", "err_pulse";
> > > > > > > > +        clocks = <&cpg CPG_MOD 0x9f>, <&cpg CPG_MOD 0xa0>,
> > > > > > > > +                 <&cpg CPG_MOD 0xa1>, <&cpg CPG_MOD 0xa1>;
> > > > > > >
> > > > > > > On the next version I am going to update spix2 clk as <&cpg
> > > > > > > CPG_CORE R9A09G047_SPI_CLK_SPIX2>
> >
> > According to the RZ/G3E clock system diagram, (the parent of) clk_spi is derived from (the parent of)
> > clk_spix2, not the other way around?
> > So you can model clk_spi as a fixed divider clock with parent clk_spix2 and factor two.  I.e. provide
> > a new core clock R9A09G047_SPI_CLK_SPI instead of your proposed R9A09G047_SPI_CLK_SPIX2?
    ^^^^

> > > > > > What's spix2 clk? Ah, re-adding dropped line:
> > > > > >
> > > > > > > > +        clock-names = "ahb", "axi", "spi", "spix2";

> Can you please share your thoughts to handle this?

See above ^^^^ ;-)

> 1) Gate only spi clk

Gate only clk_spix2, which is the parent of clk_spi.
So enabling any of them will (propagate to) enable clk_spix2,
which uses the hardware gate.

> 2) For monitoring use both clock

Check only clk_spix2 for monitoring.

> 3) Clock specifier needs two distinct entries. So that consumer will get
>    proper rates for both clocks.

clk_spi would be a separate fixed-divider clock.

Does that make sense?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

