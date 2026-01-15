Return-Path: <linux-renesas-soc+bounces-26805-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F48D23352
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 09:41:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23F2730EECC7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 08:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83FE3338F20;
	Thu, 15 Jan 2026 08:32:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A1E335098
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 08:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768465932; cv=none; b=dEWrAXdnjWm4/RonlIgz9P99TbCxuFH7HZKb3zZtN9DqBphBtz1M6kfsxRDw6YFax0l2jOsU9fVmxg7Vgzk+EeOUOBnj2O2oaZSt+dlWxLKqrt69wu8QQ48rFgt4GiXRJWRx06VXnyzydsb+7c027mtkFa0PDROH61btL7gY9Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768465932; c=relaxed/simple;
	bh=G+loJosCYPxM7dM+rE9X0eO2DVA5Iul/rElaBNI978A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=msJ3Iw+kc4hGkhe8zgwSET2PnUp3BIdI97h3o9dfyyEXSZZ96fB6DQuFuLv3K+1eIoeV0LGX8SSditekkrsdlz1xiOjB1j1mIMYIZZTWtSqwe2SBCYeASnif8DVyS8LQOHiN3NdC8RSoLtyMiQ69GhWYW+Zr+0TmNCHJhxr1LeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b2ed01b95dso81201185a.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 00:32:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768465928; x=1769070728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6hVlaltCoWANklzhMp5xvIF6YsYsDq1BU+u4OGSDZeY=;
        b=CdObLMt4uKb2Ea7Hsfco2UWjutnggPoBviX2Ur7bjyH9+ZtUce45u3OslelBQM2ANv
         f5h3q95HsqH7Tf0QH/fB9ZcPdtgI0/4m1vI1ULQmc43C6uh9rFBoC+uuqL0zCplJKnSz
         3JmiOP1KtahpGoepk1Z2z1xVMifmsrCgnOCFzOM7pAOIR6qCII7XhKtAd2NwP83nevkC
         Giz/fKlJeBM67bBZZ+HK8F42oSRGP1rQcRYioz/+aNv4UdGx+X/j9xwD0zeuk6Tjhvd2
         x+vsk1cXVW7OqCChOemqmIeEko176MM3P3UPi5BVx3BfJE7D9T4+rPYlCR91snvrgHoX
         7UnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwX3Z6vloFdT1tN1gRxxfY3E4Joatjim9vSrlY+a2NrgrRpkM2P12YPMLJktz17Ebr/593URijKlofAJkkEWvlMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzO4x9OyldEScgWTLI2/vtyN6NqFiX7BKc4hHE4v+8TIqCeDS4
	Kxz3S8+Qbp97/OMTdc0d+gUobGb618s6eCbowVAW75bzxm6QzghfgVir6+9YYUrQ
X-Gm-Gg: AY/fxX4bktrPBTt6439AhoPdUyf1GV6npYuy11P9bcEHRlCFeuNav/FNS5wYrkbxlQ0
	/USFwDPEP2zFGGg2WtE3WtZyYPaPk/XIUPs9yp/GaaZ2QTsCooPcy0YB95WNP9NfR1xILSYfoko
	n/9mtfmU10gQcU6UUTdk771Frcvvy09K4UPAOzr2X4uuxh+zhC4DtZqFs8TdpkM3Pw8XGUsZv+6
	4nR5vQdrOpBWBt0V3n8O8QAIcHo4B3AyuiKSUls4/KQ3pvTJ+Jbw9Sh4g74x33UUWBeoWeCqhBf
	WIRSOhS/Bokn9PsOaP6Dt2voMn2Be369wMiDQyCl3yYlM/D6WC2Tjx9kRdU7ZyIXexT1SFExEfI
	oT9sHphWQhcxfEGm6AowzfPwzeJvPBdSI4VPhixt9Tn9NYisNU+CRSbhimDb8Ix7IJv9O1FCmlv
	eB5TfjWo9nMF0fySHCD0wSHYcsgtW12OQxfLvJ++5lXPEeU9GOy0M6
X-Received: by 2002:a05:620a:4490:b0:8b2:7224:b254 with SMTP id af79cd13be357-8c53148d507mr645236985a.13.1768465927884;
        Thu, 15 Jan 2026 00:32:07 -0800 (PST)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com. [209.85.222.177])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530b77743sm339828585a.29.2026.01.15.00.32.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 00:32:07 -0800 (PST)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8c0f13e4424so76340385a.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 00:32:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUQ+y6zSycd4Uw1TJYoTc7NMzuMhsIZEIDDwiaez/FBCxlKEUj03F4qp/WI2YhNu+AfCQ5O2hsyJ7m0+4BrCryCfQ==@vger.kernel.org
X-Received: by 2002:a05:6102:304b:b0:5ee:a6f8:f925 with SMTP id
 ada2fe7eead31-5f183897017mr1662832137.8.1768465478084; Thu, 15 Jan 2026
 00:24:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <fcfc4fc5123c2351d96ac102aa5081bd99c8a40e.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <20251203-shrew-of-original-tempering-8a8cfc@quoll> <aTA-Hj6DvjN4zeK6@tom-desktop>
 <CAMuHMdW=UkZxhf-pbtp6OBFd_3jPcjUaKFmH4piuc+P=kgxzGA@mail.gmail.com> <TY3PR01MB11346DF85F8F7EA9ADDED16EB868CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346DF85F8F7EA9ADDED16EB868CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Jan 2026 09:24:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUhke83ZVXxDQE_Dt1HRwyGeoMq1pYmEP47WOgR_vYNtA@mail.gmail.com>
X-Gm-Features: AZwV_Qgxwq_ugUrK3ifMblmAkyp8fbq-QzkWqQkuoZnCA8EiRq61e2GRJHn8aQo
Message-ID: <CAMuHMdUhke83ZVXxDQE_Dt1HRwyGeoMq1pYmEP47WOgR_vYNtA@mail.gmail.com>
Subject: Re: [PATCH 10/22] dt-bindings: display: renesas,rzg2l-du: Add support
 for RZ/G3E SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	"laurent.pinchart" <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	"magnus.damm" <magnus.damm@gmail.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 15 Jan 2026 at 08:48, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Wed, 3 Dec 2025 at 14:42, Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > On Wed, Dec 03, 2025 at 09:23:53AM +0100, Krzysztof Kozlowski wrote:
> > > > On Wed, Nov 26, 2025 at 03:07:22PM +0100, Tommaso Merciai wrote:
> > > > > The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame
> > > > > Compression Processor (FCPVD), a Video Signal Processor (VSPD),
> > > > > Video Signal Processor (VSPD), and Display Unit (DU).
> > > > >
> > > > >  - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
> > > > >  - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
> > > > >
> > > > > Add then two new SoC-specific compatible strings 'renesas,r9a09g047-du0'
> > > > > and 'renesas,r9a09g047-du1'.
> > > >
> > > > LCDC0/1 but compatibles du0/du1...
> > > >
> > > > What are the differences between DU0 and DU1? Just different
> > > > outputs? Is the programming model the same?
> > >
> > > The hardware configurations are different: these are two distinct hardware blocks.
> > >
> > > Based on the block diagrams shown in Figures 9.4-2 (LCDC1) and 9.4-1
> > > (LCDC0), the only difference concerns the output, but this variation
> > > is internal to the hardware blocks themselves.
> > > Therefore, LCDC0 and LCDC1 are not identical blocks, and their
> > > programming models differ as a result.
> > >
> > > In summary, although most of the internal functions are the same, the
> > > two blocks have output signals connected to different components within the SoC.
> > > This requires different hardware configurations and inevitably leads
> > > to different programming models for LCDC0 and LCDC1.
> >
> > Isn't that merely an SoC integration issue?
> > Are there any differences in programming LCDC0 or LCDC1 for the common output types supported by both
> > (single channel LVDS and 4-lane MIPI-DSI)?
>
> Dual LVDS case, dot clock from LCDC0 is used in both LCDC's.

For the single dual-channel LVDS output on LCDC0, or for using two
independent LVDS outputs on both instances? How is this handled?
Don't you need a companion property to link them together?

Is this similar to dual-channel LVDS on R-Car E3 and RZ/G2E?
On these SoCs we have a single combined device node for all DU instances
(which comes with its own set of issues, e.g. Runtime PM and Clock
Domain handling).

> Standalone LVDS and DSI the programming flow is same.

OK.

> > Of there are no such differences, both instances should use the same compatible value.
>
> Then we need to use a property called display-id, to describe the supported
> output types in bindings, right??
>
> Display-id=0 {LVDS, DSI)

LVDS twice?

> Display-id=1 {LVDS, DSI, DPI)

Not necessarily: if this is purely different SoC integration per
instance, describing all possible options is fine.

But I'd like to defer to Laurent for the details...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

