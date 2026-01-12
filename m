Return-Path: <linux-renesas-soc+bounces-26590-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 772F7D12552
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 12:35:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8577E30021C2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 11:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57838356A0B;
	Mon, 12 Jan 2026 11:35:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C2E2C21EF
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jan 2026 11:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768217729; cv=none; b=TW/x/un+FYtPe8HIOyWwzeGtn9Qy64t0YjbAuKvKn8vSLYYlQZGT+pQaV0nH+3YxoeFSJeSUB0J4hhnitR6m/GcierJA/J6bCGscj77xAGVCuW6Kvjj/Bnq+e+QSnn/OUgxgRWMw922DcKmcD8JrfAZQy6lcjnI3Xt22E8nyZ0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768217729; c=relaxed/simple;
	bh=e8sL06nXoNEupuikp31TvXrN3i392xMPCHbyF8xMO04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P3i/QtDkaTmB3kqYcL5xf/LVn5/LVil1GnZmOul3Iuu6GEfjTyKK/7avDN8Vh0l+zwGuLyA3BTR/YDdHfLd937fy/PI9olfUGlBIfIZtWcGnKlIvbKJpdivRIsCdanWDKUOI2XPCn7ya0TcPss0ec7mMd5lo0XhD6Q2+a56L5Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5636274b362so882898e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jan 2026 03:35:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768217726; x=1768822526;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCwZy8nplNPe4SBnl4QbdPCHxaIVjw84NdLZ03XKiqs=;
        b=VHFoyJzqR7rlhQ2/vCwIjmo6Co5IxoFHRGsTPvX5HsS2V/2GNXtso/yGI5lmsoq6VD
         c5VeLTZc0vDKMM7z+/rY4IHe2Yz/45pcCDJYwwGJUQido4bblsFJMzCAkRmok1/vwWST
         vvQCQrIogXCjTHn1Wc+ZI1qfdp6ytYVpL/8tDkvNggXuB+y1FjYO/8pTCAz5p+rd7xgN
         daEVpseX4mbXd1zBiUjmF5rIVupu+mbNcOhmKSYokUCfHazSTS8gLQlbCseblPZdb6/7
         j0BOVfONYxNzZH8QwI0r1cx7b9ysJnzjRQLtLLKFVRPhk0Xtz3l2JN7AMnFhI9RA5k0k
         8/xg==
X-Forwarded-Encrypted: i=1; AJvYcCWElKRCz3LAdN7MUewBxWG0UQL9tai3Gd19s09VTPVSv2GrOiVSYRJshCbd80WYcIzSMWGJ2lUInWvS/vrzomd1TA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzySC7isZ/oPZjmh8xJixYh55otfdIzJQX74b8KC8CjyxLStVhT
	N6w//EqS+fEZFBR48ODoLDl40hvTAE6UeTuVLzhMOnhZKYo/X7mthYNnwyg+nOwM
X-Gm-Gg: AY/fxX4Kbp327OmbQY0O3lxSaaJg78LrthRhaxOljGoq0AAsq/w+Bn55Be0myB5oN0k
	NyDG6BTudvZ8rr109qFUpFMAsdUkGjXmbf6OHgkcxCmAIbtHMGL0BJLqJXdWH13dlzN8FsYA3tX
	z4ib2NxZkoKXbCJmqzfw//qLPkVRjUEfJtgC4ir5dIA/zT9XzoRtA6LCh6BZnBPKu/p8p3jmAsj
	3eRmFowY1fqFgNnRtRHwinz/fqhJuEf17gw3yqcHGAc7c/5Hpr08C90HDa1R5qZ3vNi6hOcheDT
	P3sqMFgq8EfKaCydr2EZt4RfwUwQUiWjQWsb+mkXvWHha9e3mZjOG5EKTHSNEtUIaKnfmLwh5gu
	7R5YBPdREnhbi6t2hSr8DToCTIA6nwIJbYx3NZ1LDJv8AfT/CctbE6lN0Dimqw7w9tKkcDtf4VA
	BRiFUv5t9u8YW0AnxizD5hQU3jBLNBF0/2HTtsnKR9mzC2ZJ3l
X-Google-Smtp-Source: AGHT+IGjTdDSQJVSePvxO1p0Kb9lFMhuuU9MRo6h79vU+xhG5ol/+4JOZX+jGtAwbf6kJ/tRY/sK5w==
X-Received: by 2002:a05:6122:8b18:b0:559:eef7:39f with SMTP id 71dfb90a1353d-56347fc97ffmr5125760e0c.12.1768217726367;
        Mon, 12 Jan 2026 03:35:26 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5636134be9fsm10672578e0c.16.2026.01.12.03.35.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 03:35:26 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-941275fece4so1547224241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jan 2026 03:35:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX6GFL6vTXcLtNfAiLBfYMsenG0vfMCohmlwhIfrJ1aaZ0rHIYMGI1ThhsQJGF5yYov3g/dcuex0xn2ZffU1GnrFw==@vger.kernel.org
X-Received: by 2002:a05:6102:6058:b0:5ec:c528:4dd3 with SMTP id
 ada2fe7eead31-5ecc5284f7amr6284383137.42.1768217726081; Mon, 12 Jan 2026
 03:35:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <1c7657d6c06d99bc2f90251995ad272b5704717d.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <42bbdec7-ce6d-417c-a13d-ce0a6782bc9a@kernel.org> <aWEnfJonv4egKhXo@tom-desktop>
 <CAMuHMdUm-yHkRw0k42pfq9BD8urLO7rqF2yD7s2JbkMFpRTQwQ@mail.gmail.com>
 <aWE8ikhsthB_0VQV@tom-desktop> <CAMuHMdWGf7MgFzxjuea8agZgSyAMzXwFYO22NmRZ7i1-VPzqFw@mail.gmail.com>
 <aWTYS9BjWn2bY5Lz@tom-desktop>
In-Reply-To: <aWTYS9BjWn2bY5Lz@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Jan 2026 12:35:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVdntJrcT8d4sCBXdnYr1m3X7s-_58KBiEDV5+GAW353A@mail.gmail.com>
X-Gm-Features: AZwV_QgqmWBfwmu_212Rxj3vjBBvkBDNMwpqCH0FZHQJKUGeDVAXwigjiGPPHlA
Message-ID: <CAMuHMdVdntJrcT8d4sCBXdnYr1m3X7s-_58KBiEDV5+GAW353A@mail.gmail.com>
Subject: Re: [PATCH 09/22] dt-bindings: display: bridge: renesas,dsi: Add
 support for RZ/G3E SoC
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, tomm.merciai@gmail.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Mon, 12 Jan 2026 at 12:18, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Fri, Jan 09, 2026 at 06:59:12PM +0100, Geert Uytterhoeven wrote:
> > On Fri, 9 Jan 2026 at 18:36, Tommaso Merciai
> > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > On Fri, Jan 09, 2026 at 05:22:02PM +0100, Geert Uytterhoeven wrote:
> > > > On Fri, 9 Jan 2026 at 17:06, Tommaso Merciai
> > > > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > > > On Sun, Nov 30, 2025 at 09:24:57AM +0100, Krzysztof Kozlowski wrote:
> > > > > > On 26/11/2025 15:07, Tommaso Merciai wrote:
> > > > > > > The MIPI DSI interface on the RZ/G3E SoC is nearly identical to that of
> > > > > > > the RZ/V2H(P) SoC, except that this have 2 input port and can use vclk1
> > > > > > > or vclk2 as DSI Video clock, depending on the selected port.
> > > > > > >
> > > > > > > To accommodate these differences, a SoC-specific
> > > > > > > `renesas,r9a09g047-mipi-dsi` compatible string has been added for the
> > > > > > > RZ/G3E SoC.
> > > > > > >
> > > > > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> > > > > > > --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > > > > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > > > > > @@ -28,6 +28,7 @@ properties:
> > > > > > >            - const: renesas,r9a09g057-mipi-dsi
> > > > > > >
> > > > > > >        - enum:
> > > > > > > +          - renesas,r9a09g047-mipi-dsi # RZ/G3E
> > > > > > >            - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
> > > > > > >
> > > > > > >    reg:
> > > > > > > @@ -84,6 +85,13 @@ properties:
> > > > > > >            - const: pclk
> > > > > > >            - const: vclk
> > > > > > >            - const: lpclk
> > > > > > > +      - items:
> > > > > > > +          - const: pllrefclk
> > > > > > > +          - const: aclk
> > > > > > > +          - const: pclk
> > > > > > > +          - const: vclk1
> > > > > > > +          - const: vclk2
> > > > > > > +          - const: lpclk
> > > > > >
> > > > > > Why are you creating completely new lists every time?
> > > > > >
> > > > > > No, come with unified approach.
> > > > >
> > > > > The intent is not to create a completely new clock list per IP, but to keep a
> > > > > unified clock definition that can scale with feature differences.
> > > > >
> > > > > The previous IP supports a single DSI input port, whereas this IP supports two
> > > > > DSI input ports.
> > > > >
> > > > > Because of this added capability, the hardware naturally introduced an
> > > > > additional clock.
> > > > >
> > > > > Can you please suggest how to handle it?
> > > >
> > > > Keep on calling the first vclk "vclk", and add "vclk2" at the end of the list?
> > > > Then RZ/V2H can specify the first 5 clocks, and RZ/G3E can specify all 6.
> > >
> > > Testing a bit your suggestion
> > > we can do:
> > >
> > >   clock-names:
> > >     oneOf:
> > >       - items:
> > >           - const: pllclk
> > >           - const: sysclk
> > >           - const: aclk
> > >           - const: pclk
> > >           - const: vclk
> > >           - const: lpclk
> > >       - minItems: 5
> > >         items:
> > >           - const: pllrefclk
> > >           - const: aclk
> > >           - const: pclk
> > >           - const: vclk
> > >           - const: lpclk
> > >           - const: vclk2
> > >
> > > Then later into the compatible if switch we can do:
> > >
> > >
> > >   - if:
> > >       properties:
> > >         compatible:
> > >           contains:
> > >             const: renesas,r9a09g047-mipi-dsi
> > >     then:
> > >       properties:
> > >         clocks:
> > >           items:
> > >             - description: DSI PLL reference input clock
> > >             - description: DSI AXI bus clock
> > >             - description: DSI Register access clock
> > >             - description: DSI Video clock
> > >             - description: DSI D-PHY Escape mode transmit clock
> > >             - description: DSI Video clock (2nd input clock)
> >
> > All descriptions belong at the top level. Just add the 6th one.
>
> Please correct me if I'm wrong but if we move up:
>
>         - description: DSI Video clock (2nd input clock)
>
> To the top level description we will have 6 clocks for G3E and 6 for
> RZ/G2L. With that I think dt_binding_check will fail ("is valid under
> each of") because of the oneOf.

RZ/G2L and RZ/V2H need "maxItems: 5" in their if-sections.

> > >         clock-names:
> > >           minItems: 6
> >
> > Exactly.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

