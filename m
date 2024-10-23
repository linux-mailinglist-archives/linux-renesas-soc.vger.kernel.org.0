Return-Path: <linux-renesas-soc+bounces-9997-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 361219ACA5E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2024 14:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 569D41C21507
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2024 12:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EF8F1ABEA7;
	Wed, 23 Oct 2024 12:44:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43C91AB539;
	Wed, 23 Oct 2024 12:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729687449; cv=none; b=j943Uy+Zm5swlLTlrYy+JiizBs+NxSTwRjOjzlIseOhkYaTyeF6WzqxHSgwv/9K+s8mcdXgi7QtJ1WYj7zV5M3RdodteIkwtH/yZtSVCL8XDNxSE/N5WpbQgHXZYMzcwUi9RdJRUnj4LCVrYVponzfn4ged3b52rgQDoWlYz9dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729687449; c=relaxed/simple;
	bh=zRiiMfd6Xcoo1LMFv0np0QQYsp5hLvrBYxzxTP2GrXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mfHT+rVRHBK/JQLqv1z90cs1D9QFCAlpR3C2IuzmTRev5d+yBmz7EB6MY/9+i3+bU4BxdFotUevKtKxrrmSx95D0V5lidvsFu09EbAJ1oy1Ywwo6814u6yjIQ47KVVNsnC66ohXwhfSGLStD84GJwJkrMr+BVrUXBXM8Q+AArBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e7e1232648so16410197b3.0;
        Wed, 23 Oct 2024 05:44:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729687446; x=1730292246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=inaV9taw8T4njvzxlHAZ1EG3WYPL67iLOevVu66/Zqk=;
        b=rUDIkEJP8gtYd771ndwCXpCM2YUPzfBNuLnHO4Pp2TLvn2I9WePR+ljIRfyR8XEWfP
         d1LO8ZnVOu3qQp8oYYhuJVHVUJfSeMi+4Qt9wq9QSUoNVRXu4gFp2Aep75aJB4u4url+
         0nhnV7EivFavwDqGlsJ4G+e3E+/kurv2bt1Zl92xFMWeneAA1AQ/B77QhfO+agBajQdZ
         QLWyRx+AOil3nE7r6AMYsdbjPmjqVlcXLpNlEKk996ZwB67RqRkj9B4QXafcbr+ByADr
         mttvxUJlSI7/wNklPqrouIcAAmxLJR5ue64BdxOKECf2WbHsX+EHhkvCIt4U0JF4Gjlk
         KpAw==
X-Forwarded-Encrypted: i=1; AJvYcCXPN+RdWbiFQG+U+dYiVNCfeHCGLSlnC7WsrQiJSitAaAnPSKFIoQe7YoFewL5lbqTPdsnn4iixiC0W4HbdqjZxkeI=@vger.kernel.org, AJvYcCXvXW0JzGi1ej9h4zAqC+yz+AhpSdAGSWeE8eyzehJYwDctp/Ain3W9UQ4ABmZ7xXhdsuFF5knJzkm/@vger.kernel.org
X-Gm-Message-State: AOJu0YxDXp3WQcH7HPg+SvwW8CZ/any8T4Ivqdyay1XgYoKXNcQ4CxuU
	ZefkB78Jh5Yj58TXIno1mllTzWByeWXI0BZ1nZRPBUa/Ocu/gfpTsgG3350n
X-Google-Smtp-Source: AGHT+IFWV5hIjk7NZRh6t0jYY8Ds0rcF+RHKyiu7+4RIDQMlJP2GklpQ8TUUCq8+Zdw6AC1x8YU6mw==
X-Received: by 2002:a05:690c:7009:b0:6dd:b983:8563 with SMTP id 00721157ae682-6e7f0df5025mr27499347b3.14.1729687446249;
        Wed, 23 Oct 2024 05:44:06 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e7e59e9db0sm5650187b3.96.2024.10.23.05.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 05:44:06 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e2e427b07dso57181957b3.1;
        Wed, 23 Oct 2024 05:44:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXFbZSlcWnKtsZLYLDt+IL8RP679lQy1iR58uoiYEU5FPXLkCfro0K8fgCjpgOTKA+3DjQyXg1SHe1t@vger.kernel.org, AJvYcCXXPBiCk8obByOg7g4cMS8t7v9T6D2K7MH5XegUyJkH8HVii9ae5JqfDMRswDB1jJbKYRjGTQ42kI797fcerOWMqws=@vger.kernel.org
X-Received: by 2002:a05:690c:dd2:b0:6e2:b263:1051 with SMTP id
 00721157ae682-6e7f0db1f05mr26567047b3.7.1729687445693; Wed, 23 Oct 2024
 05:44:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022184727.3206180-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdV+4PdxnRCzr7fnHnGYiuypem1hYMbXLac+x2db7yfpkA@mail.gmail.com> <20241023124134.GA1417003@ragnatech.se>
In-Reply-To: <20241023124134.GA1417003@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Oct 2024 14:43:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUK9ing+dCLxDxbpyD9BQeddP5eCoqgPrORRApD1-C5Ag@mail.gmail.com>
Message-ID: <CAMuHMdUK9ing+dCLxDxbpyD9BQeddP5eCoqgPrORRApD1-C5Ag@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: renesas: falcon: Wire-up Ethernet
 breakout board
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Wed, Oct 23, 2024 at 2:41=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2024-10-23 09:13:11 +0200, Geert Uytterhoeven wrote:
> > On Tue, Oct 22, 2024 at 8:48=E2=80=AFPM Niklas S=C3=B6derlund
> > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > This small series wires up the Marvell 88Q2110 PHYs found on the Falc=
on
> > > Ethernet breakout board. With this applied all five PHYs are probed
> > > correctly.
> > >
> > >     mv88q2110 e6810000.ethernet-ffffffff:07: attached PHY driver (mii=
_bus:phy_addr=3De6810000.ethernet-ffffffff:07, irq=3DPOLL)
> > >     mv88q2110 e6820000.ethernet-ffffffff:07: attached PHY driver (mii=
_bus:phy_addr=3De6820000.ethernet-ffffffff:07, irq=3DPOLL)
> > >     mv88q2110 e6830000.ethernet-ffffffff:07: attached PHY driver (mii=
_bus:phy_addr=3De6830000.ethernet-ffffffff:07, irq=3DPOLL)
> > >     mv88q2110 e6840000.ethernet-ffffffff:07: attached PHY driver (mii=
_bus:phy_addr=3De6840000.ethernet-ffffffff:07, irq=3DPOLL)
> > >     mv88q2110 e6850000.ethernet-ffffffff:07: attached PHY driver (mii=
_bus:phy_addr=3De6850000.ethernet-ffffffff:07, irq=3DPOLL)
> > >
> > > They can be auto detected with just the compatible
> > > "ethernet-phy-ieee802.3-c45", but to keep the style currently used I
> > > have added the specific compatible for the 88Q2110 as done for other
> > > SoCs.
> >
> > If the specific compatible values are not needed, I prefer not to add
> > them, as DT should describe only what cannot be auto-detected[1].
>
> Ok, I will post a v2 without the specific compatible value.
>
> > Have you tried kexec and/or unbinding/rebinding the AVB driver
> > (the latter is probably easiest)?
>
> I have tested unbinding/rebinding the driver both with and without a
> specific compatible value, both scenarios work.

Great!

> > > The primary issue we had with this in the past was due to an incorrec=
t
> > > PHY address. After studying the schematics (v100) I found the PHYs
> > > address pins are wired differently on Falcon compared to other Gen4
> > > boards. On Falcon they are pulled-down, while on other Gen4 boards th=
ey
> > > are left unconnected and subjected to the PHYs internal pull-ups. Thi=
s
> > > gives the PHY an address where the lower 3 bits of the address is
> > > inverted for Falcon.
> >
> > This was changed in v102 of the schematics (REV0043c vs. REV0043b of
> > the schematics for the Ethernet sub board): See "Changed Strap pin
> > settings =3D=3D> PHYAD=3D[0,0,0], pull-down removed" on page 1, and the
> > various PHY configuration notes...
> > Moreover, this might be different in other board revisions, as the
> > BSP uses PHY address 1 for RAVB1, address 2 for RAVB2, and so on...
> >
> > As I only had remote access to Falcon, I never knew the actual board
> > revision I was using.
>
> I could not find any revision markings on the board. But to the best of
> my ability (the markings are not super clear) I have identified that the
> pull-down resistors are indeed present on the board I have.
>
> > How to handle this (yet another DTS file)?
> > Are non-v100 variants widespread?
>
> As Wolfram points out, I don't think it's widespread. I think it's OK to
> move forward with this as all the V3U boards we have seen have this
> configuration. If one pops-up later we can solve it then right? As
> solving this properly would need ether a separate DTS source or at least
> an overlay anyhow.
>
> Is this acceptable for you? If so I will post a v2 with the change
> proposed above.

Yes, sounds good to me.
Thanks!

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

