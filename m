Return-Path: <linux-renesas-soc+bounces-26600-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAACD12D62
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 14:35:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C1A43003FBF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 13:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 128D333CE86;
	Mon, 12 Jan 2026 13:34:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0119230E84F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jan 2026 13:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768224850; cv=none; b=M+rs7xaGRpcx1/WBlri1KekweT/33Cyx6l58VWub/Yw0SU4Kp8UFeT20xey2mcD83HdYCaWk8cCGlS/ngBhkZ2Po4ErvrtedW8qqQxkgNGQPseL05IinRA559Nif2zZ9SuENbf1K0hfD5Y8kIChSZsKJUv+co/R5kSU89Ol+ijo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768224850; c=relaxed/simple;
	bh=9yBqdyrTqxi+3IyjZow+5t2Zev5EGWYpylLGOmF6JTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rBx/+laIoIBqvTeLcxxUBe6xhN7Uonvw8HWlNwNohUVt8t+nWSwt7y274fQoCLmDING4sZ9OfhSIrjnODTT59RqzYgMVqaBE8KzIrKvli6mor9AqRsNr0WRtWAQFXx6yNc8kcEKUJ/XNF8WsQj0HKA6U+UM77nBTdVTd74Ao5sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5eea2b345fbso1349086137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jan 2026 05:34:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768224846; x=1768829646;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mw1aKltaSTC5rf8Ujw6cZSHrtgE4MMBQjtQaAe26qy0=;
        b=FiHpf+BCyyj6gXYiIajJN1kGEdMB0tJgAxxIrvzRXhLcs53G03QXV9L5IuGDUMhGar
         74NC8NrNCqX3bSSQ39ddztnCZS/Vuc5pGxJRINs3lTCA43uxJ6KXW6rOkXvwC/+wfFS6
         Sj+1/0ADxSD36iP8T8Dd5C63c9KVHFXG42uIp5FoJSg6FhxWONPF0tzBhTY9bEJMYgEz
         TY6lesh/BcWj1qqZd9/igUsOufzj/0JLuWwiGBshglsQqt9gMFdX82Lze8ooivTdTmq7
         zYoFbdyj3yWresGCYpIxWpEDWBNsKs64y260mInxx80fBuBj/ABY3VnPG1qeikENO2Nq
         mtsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWExkHZMeQW+vDFPb7woJre8Q3u7zTVcwVubaCO/ZkosApPIVRnnhTCYNz/jntIk2i+vzVI0JSYeDT25bmFAC6LMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwP6YSTnfLuve5xDcGzxv0TfsRNFSEnHND/TDIdkG4W05xHxA0l
	klKafZiGkZA+AEm6vcnUWbmJjm/jm3XRxO2pRcN3QgsVE32AZXhlwzjjy73+tDIg
X-Gm-Gg: AY/fxX4LwSnISQMCVeO1zfNkLGs4eVtCdn3prsyt5D7S7AXlRdDzDNnVC9ZJImcqkvM
	6ezcqs3Kmr5XIvxhszlEJai6p/+Ew/s4nNHjWvG5Dz/OKSbQESI/0TuPGiUjATkewzW9UqUWzQJ
	GTWyzt6bK7ac+ANW7CLzR3kR0nJBGeDTKM+IUVeZSE5k4YWTMt9ADNfkco8Uxviw1UrPV+im3oN
	yspnOaQoeMIYKB/y/R1kMCFl+9KSsaZGjgPkKxZYG970pY099KMkavxP04sOWVJarT1KDa1Ayl+
	Thv9LKCaLShSG2GxKHx4QDvfn/BsIy8GUd3e3UJVrui+3kGKTxDM+Wb1d48KfNiJeOVhDmSlOwu
	0VwpMcDRBGxn8PpiFDn9cH4iJ3AfRwjSg70kvIbuQnXWY6TBqMns4jtoIbj7dKDepPsUqYq0uRX
	KUnomIKfLZlBuKQE23SCluF6YxMytd/R+X/POtiIVmE9f57JgN
X-Google-Smtp-Source: AGHT+IF7M45Vs9lgu3H7Mlnr6wCGFurvyAwsKCIgivrl2ECH5oOiJK2oiVNvhe19A5OLrtrW/dCeRQ==
X-Received: by 2002:a05:6102:3e1b:b0:5ef:49d0:6912 with SMTP id ada2fe7eead31-5ef49d07884mr4566890137.11.1768224846129;
        Mon, 12 Jan 2026 05:34:06 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5efb5bb6d11sm5922122137.4.2026.01.12.05.34.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 05:34:05 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-93f5b804d4aso2574870241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jan 2026 05:34:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVtudVREvj5IjR8QR3QZkbaYCX6oN8ys4mIzwGQOQ84ZcOQXAERX4WSHVyqnnLTWJ8hhi9M9Gl/KmgUKyNGGreiBA==@vger.kernel.org
X-Received: by 2002:a67:e716:0:b0:5db:f615:1819 with SMTP id
 ada2fe7eead31-5ecb5cbba6cmr5928342137.3.1768224845221; Mon, 12 Jan 2026
 05:34:05 -0800 (PST)
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
 <aWTYS9BjWn2bY5Lz@tom-desktop> <CAMuHMdVdntJrcT8d4sCBXdnYr1m3X7s-_58KBiEDV5+GAW353A@mail.gmail.com>
 <aWTiKQFBZT4hpaG_@tom-desktop>
In-Reply-To: <aWTiKQFBZT4hpaG_@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Jan 2026 14:33:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV4hkcU6v4v9kSddyOftZnExZ6B5Q9DykRig1rosDT8bQ@mail.gmail.com>
X-Gm-Features: AZwV_QipiAWkh5RwyVe2WxFleu8eNUYqxvAWPYb1wspLI2J-Wc5fAFHMdZBQFTI
Message-ID: <CAMuHMdV4hkcU6v4v9kSddyOftZnExZ6B5Q9DykRig1rosDT8bQ@mail.gmail.com>
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

On Mon, 12 Jan 2026 at 13:00, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Mon, Jan 12, 2026 at 12:35:15PM +0100, Geert Uytterhoeven wrote:
> > On Mon, 12 Jan 2026 at 12:18, Tommaso Merciai
> > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > On Fri, Jan 09, 2026 at 06:59:12PM +0100, Geert Uytterhoeven wrote:
> > > > On Fri, 9 Jan 2026 at 18:36, Tommaso Merciai
> > > > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > > > On Fri, Jan 09, 2026 at 05:22:02PM +0100, Geert Uytterhoeven wrote:
> > > > > > On Fri, 9 Jan 2026 at 17:06, Tommaso Merciai
> > > > > > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > > > > > On Sun, Nov 30, 2025 at 09:24:57AM +0100, Krzysztof Kozlowski wrote:
> > > > > > > > On 26/11/2025 15:07, Tommaso Merciai wrote:
> > > > > > > > > The MIPI DSI interface on the RZ/G3E SoC is nearly identical to that of
> > > > > > > > > the RZ/V2H(P) SoC, except that this have 2 input port and can use vclk1
> > > > > > > > > or vclk2 as DSI Video clock, depending on the selected port.
> > > > > > > > >
> > > > > > > > > To accommodate these differences, a SoC-specific
> > > > > > > > > `renesas,r9a09g047-mipi-dsi` compatible string has been added for the
> > > > > > > > > RZ/G3E SoC.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> >
> > > > > > > > > --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > > > > > > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > > > > > > > @@ -28,6 +28,7 @@ properties:
> > > > > > > > >            - const: renesas,r9a09g057-mipi-dsi
> > > > > > > > >
> > > > > > > > >        - enum:
> > > > > > > > > +          - renesas,r9a09g047-mipi-dsi # RZ/G3E
> > > > > > > > >            - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
> > > > > > > > >
> > > > > > > > >    reg:
> > > > > > > > > @@ -84,6 +85,13 @@ properties:
> > > > > > > > >            - const: pclk
> > > > > > > > >            - const: vclk
> > > > > > > > >            - const: lpclk
> > > > > > > > > +      - items:
> > > > > > > > > +          - const: pllrefclk
> > > > > > > > > +          - const: aclk
> > > > > > > > > +          - const: pclk
> > > > > > > > > +          - const: vclk1
> > > > > > > > > +          - const: vclk2
> > > > > > > > > +          - const: lpclk
> > > > > > > >
> > > > > > > > Why are you creating completely new lists every time?
> > > > > > > >
> > > > > > > > No, come with unified approach.
> > > > > > >
> > > > > > > The intent is not to create a completely new clock list per IP, but to keep a
> > > > > > > unified clock definition that can scale with feature differences.
> > > > > > >
> > > > > > > The previous IP supports a single DSI input port, whereas this IP supports two
> > > > > > > DSI input ports.
> > > > > > >
> > > > > > > Because of this added capability, the hardware naturally introduced an
> > > > > > > additional clock.
> > > > > > >
> > > > > > > Can you please suggest how to handle it?
> > > > > >
> > > > > > Keep on calling the first vclk "vclk", and add "vclk2" at the end of the list?
> > > > > > Then RZ/V2H can specify the first 5 clocks, and RZ/G3E can specify all 6.
> > > > >
> > > > > Testing a bit your suggestion
> > > > > we can do:
> > > > >
> > > > >   clock-names:
> > > > >     oneOf:
> > > > >       - items:
> > > > >           - const: pllclk
> > > > >           - const: sysclk
> > > > >           - const: aclk
> > > > >           - const: pclk
> > > > >           - const: vclk
> > > > >           - const: lpclk
> > > > >       - minItems: 5
> > > > >         items:
> > > > >           - const: pllrefclk
> > > > >           - const: aclk
> > > > >           - const: pclk
> > > > >           - const: vclk
> > > > >           - const: lpclk
> > > > >           - const: vclk2
> > > > >
> > > > > Then later into the compatible if switch we can do:
> > > > >
> > > > >
> > > > >   - if:
> > > > >       properties:
> > > > >         compatible:
> > > > >           contains:
> > > > >             const: renesas,r9a09g047-mipi-dsi
> > > > >     then:
> > > > >       properties:
> > > > >         clocks:
> > > > >           items:
> > > > >             - description: DSI PLL reference input clock
> > > > >             - description: DSI AXI bus clock
> > > > >             - description: DSI Register access clock
> > > > >             - description: DSI Video clock
> > > > >             - description: DSI D-PHY Escape mode transmit clock
> > > > >             - description: DSI Video clock (2nd input clock)
> > > >
> > > > All descriptions belong at the top level. Just add the 6th one.
> > >
> > > Please correct me if I'm wrong but if we move up:
> > >
> > >         - description: DSI Video clock (2nd input clock)
> > >
> > > To the top level description we will have 6 clocks for G3E and 6 for
> > > RZ/G2L. With that I think dt_binding_check will fail ("is valid under
> > > each of") because of the oneOf.
> >
> > RZ/G2L and RZ/V2H need "maxItems: 5" in their if-sections.
>
> RZ/V2H -> maxItems: 5 is fine.
> RZ/G2L -> needs 6 clocks no?
>
> Please correct me if I'm wrong.

Sorry, RZ/G2L indeed has 6 clocks, as it has sysclk.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

