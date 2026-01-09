Return-Path: <linux-renesas-soc+bounces-26548-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A6009D0BC5A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 19:00:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 486C83006A74
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 17:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00BAB310636;
	Fri,  9 Jan 2026 17:59:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D1426ED3D
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jan 2026 17:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767981567; cv=none; b=RwBSGsgXgZ8/Rn7VHHQu5aWFcWEelsJCSwZStrts+Rv88oGBkGah61UMd3U9+FDo8yBDQ51vz0VjVYrFESLj90NI0TS3BKEqRzC1EgYBsjo+ZfYKi9ytteUktg0FsUfYTWzJktnKgp3eu/KLBAAcOJIEgRHqI+hJ9IWUjUOyL0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767981567; c=relaxed/simple;
	bh=aoZqnjQwng885dzaO4ZMxyctN6RO9r34MuHFdtOF6zQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dmq5QOV45FSs67NTvOMhOBLC0yjuj3MUGKDnw4y8hTX9lGJx7d85PXLc/R7hOqJS/CYDTptE0sy1Xu15gbhZmQ3nLUo/aIx7PUDNBwEO2CGK/iDlQwqDHBFbZEOOdf2QQyp9aL3O86B/oNTE6+/IxKM9ZRSSeq3JI8V/kcdkhEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-563686df549so616123e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 09:59:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767981565; x=1768586365;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0SQS2qWJh+KMy2hwJnXtSg0hFzLccGsX0DfWg2V7M8U=;
        b=vQx5JWCqvo3YsXgteaZni1FXR2WXSUvTJ323hp2vl7xw+lIe/eKH6GmKArBb0/5L5r
         2RirbZKyB6kbvd9i07rEUTxW+lBFTUZDkUXvAVZJyDfOxeu4ay7rUcc7aMt+kHscnY3F
         N9I++C2it68z52cymU2g0ZswHXDYl1ARN0agPq5pPjdqQqxxOLLxHMtv+kKDcW+l3eRJ
         Yit9UIJqQhpAu22RLVq+6dkGcWZr5zIaz3TBmCvPidarSqq4AUcZ8MZfSWbzoSCEV4cv
         w/nOYxRxhHGCj1dh/8Jo5Z3Y5lRNPiFK5Ntao/EgKu4+wYzYFiAcBZEOzO0eiJC3TjQG
         MSGA==
X-Forwarded-Encrypted: i=1; AJvYcCUaj7esHMcy96fj76tCTAvz+kRbToAKeTFO4dRzBcVp7lASvDpk1hsxhLZ+CC7YGIIjuRD6hkPnBi2Hq5uppQvi/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRMGfSiwi4m8BD1of/ZZ8igUmNYLP/XwSUXglo9Ib2gCqK2SXD
	Uvgw7nJWPXgwsb0+3tyqfg/rXhLQ9CIyicKlnrj8grtDcQ7wM8OtsPR2VlBYOK4K
X-Gm-Gg: AY/fxX5dOlU8kq54HWaNXqXflry1KX978iPndXnSRA1bB4EaW4lkoV/VASkOLev0iqm
	p7xGg+IMnZsnMq/oRBzZJfbsM+xnUnHZ6f3yKPdlxOcM8CKE9aEyJrtjYXHCFtPKJZDtxAIZQV7
	2U3x07wiFqEeQ813oWSEbyt5HM1YWhB0bBQLdWxtg3sApwxuCsp/ZZ2nhwRmWA8KrWu30oFGaGp
	KhJLdqv57ttnDPM1TS0TQdh4R1oQTOC0bjGHmcdT7ae8luF2xUspAz5rlsz9+qzEH0kpto5Waq+
	7QMeG1hIIoSmtVU3pCGri/Xon/A/Za3pKFiSzPNum0imVTn/0BG+yukF+nvHrmWX8xBbRJgAXhi
	nlrn+sVCehT5+p3aOnnRslistj92CdGyyDrdd2dY1KhyPKwDdWjyA63qREdRF4KonlfjsV55gbB
	pfvJ5U1hZxvtoL607FctpdBRfSuf/ketDwSUQHGZBccw01DJompqck
X-Google-Smtp-Source: AGHT+IGdegoT8h8yC83UlSXvQtTrew+hxOBX2L2SSGnz0mwZeMXGEegms9ampPLO/+6yQR+oxcXvaA==
X-Received: by 2002:a05:6122:32cb:b0:544:c8bf:6509 with SMTP id 71dfb90a1353d-56347d369demr4095169e0c.4.1767981564827;
        Fri, 09 Jan 2026 09:59:24 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a20a183sm9751494e0c.9.2026.01.09.09.59.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 09:59:24 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-55b24eedd37so3365925e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 09:59:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU0xqkBsnUGQRkGZgcCmkjjwXD9YMl4uZQGNQfLp8FlWeDDkEDqx9pWiAJCezqw3s6s3rtJxqKzTH38rJy1y+o5jA==@vger.kernel.org
X-Received: by 2002:a05:6102:c11:b0:5db:1fbc:4462 with SMTP id
 ada2fe7eead31-5ecb6904fc1mr4710351137.31.1767981564119; Fri, 09 Jan 2026
 09:59:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <1c7657d6c06d99bc2f90251995ad272b5704717d.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <42bbdec7-ce6d-417c-a13d-ce0a6782bc9a@kernel.org> <aWEnfJonv4egKhXo@tom-desktop>
 <CAMuHMdUm-yHkRw0k42pfq9BD8urLO7rqF2yD7s2JbkMFpRTQwQ@mail.gmail.com> <aWE8ikhsthB_0VQV@tom-desktop>
In-Reply-To: <aWE8ikhsthB_0VQV@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 18:59:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWGf7MgFzxjuea8agZgSyAMzXwFYO22NmRZ7i1-VPzqFw@mail.gmail.com>
X-Gm-Features: AZwV_QifanvuoW-_irwZsNnFdMvbLRSaB3vvL73nICwAcFv_-LTwhwad0tEOl0o
Message-ID: <CAMuHMdWGf7MgFzxjuea8agZgSyAMzXwFYO22NmRZ7i1-VPzqFw@mail.gmail.com>
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

On Fri, 9 Jan 2026 at 18:36, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Fri, Jan 09, 2026 at 05:22:02PM +0100, Geert Uytterhoeven wrote:
> > On Fri, 9 Jan 2026 at 17:06, Tommaso Merciai
> > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > On Sun, Nov 30, 2025 at 09:24:57AM +0100, Krzysztof Kozlowski wrote:
> > > > On 26/11/2025 15:07, Tommaso Merciai wrote:
> > > > > The MIPI DSI interface on the RZ/G3E SoC is nearly identical to that of
> > > > > the RZ/V2H(P) SoC, except that this have 2 input port and can use vclk1
> > > > > or vclk2 as DSI Video clock, depending on the selected port.
> > > > >
> > > > > To accommodate these differences, a SoC-specific
> > > > > `renesas,r9a09g047-mipi-dsi` compatible string has been added for the
> > > > > RZ/G3E SoC.
> > > > >
> > > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > > ---
> > > > >  .../bindings/display/bridge/renesas,dsi.yaml  | 120 +++++++++++++++---
> > > > >  1 file changed, 101 insertions(+), 19 deletions(-)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > > > index c20625b8425e..9917b494a9c9 100644
> > > > > --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > > > @@ -28,6 +28,7 @@ properties:
> > > > >            - const: renesas,r9a09g057-mipi-dsi
> > > > >
> > > > >        - enum:
> > > > > +          - renesas,r9a09g047-mipi-dsi # RZ/G3E
> > > > >            - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
> > > > >
> > > > >    reg:
> > > > > @@ -84,6 +85,13 @@ properties:
> > > > >            - const: pclk
> > > > >            - const: vclk
> > > > >            - const: lpclk
> > > > > +      - items:
> > > > > +          - const: pllrefclk
> > > > > +          - const: aclk
> > > > > +          - const: pclk
> > > > > +          - const: vclk1
> > > > > +          - const: vclk2
> > > > > +          - const: lpclk
> > > >
> > > > Why are you creating completely new lists every time?
> > > >
> > > > No, come with unified approach.
> > >
> > > The intent is not to create a completely new clock list per IP, but to keep a
> > > unified clock definition that can scale with feature differences.
> > >
> > > The previous IP supports a single DSI input port, whereas this IP supports two
> > > DSI input ports.
> > >
> > > Because of this added capability, the hardware naturally introduced an
> > > additional clock.
> > >
> > > Can you please suggest how to handle it?
> >
> > Keep on calling the first vclk "vclk", and add "vclk2" at the end of the list?
> > Then RZ/V2H can specify the first 5 clocks, and RZ/G3E can specify all 6.
>
> Testing a bit your suggestion
> we can do:
>
>   clock-names:
>     oneOf:
>       - items:
>           - const: pllclk
>           - const: sysclk
>           - const: aclk
>           - const: pclk
>           - const: vclk
>           - const: lpclk
>       - minItems: 5
>         items:
>           - const: pllrefclk
>           - const: aclk
>           - const: pclk
>           - const: vclk
>           - const: lpclk
>           - const: vclk2
>
> Then later into the compatible if switch we can do:
>
>
>   - if:
>       properties:
>         compatible:
>           contains:
>             const: renesas,r9a09g047-mipi-dsi
>     then:
>       properties:
>         clocks:
>           items:
>             - description: DSI PLL reference input clock
>             - description: DSI AXI bus clock
>             - description: DSI Register access clock
>             - description: DSI Video clock
>             - description: DSI D-PHY Escape mode transmit clock
>             - description: DSI Video clock (2nd input clock)

All descriptions belong at the top level. Just add the 6th one.

>         clock-names:
>           minItems: 6

Exactly.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

