Return-Path: <linux-renesas-soc+bounces-26546-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 06652D0B463
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 17:34:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 763C530080C9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 16:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E04E8329E79;
	Fri,  9 Jan 2026 16:30:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179B422B5A3
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jan 2026 16:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767976206; cv=none; b=QoRtSqd1dO4+lXJ8OLV4R4na2mbR2kVLeCt3YLBcVz1npnBAoJJzpyZIe0zm7duIL8tjXufyUjJIGc2l6uc+ziSHI1x32XGwrQpxzZWsLgC7VWK27/ky4F54EEo7/OyX5KF2EaWhs1cEAcONB4nUFtpewHNsoU8Kgiux4l0iNYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767976206; c=relaxed/simple;
	bh=q2Kww8jxXcJ9Zpyd/LZlLagNoFIlkoKqu9nlzf+mRgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dZk9MdAa9GBlHl+eAzQfY5R7U2H6nmwUKomK1lkfXxvsf7fLENHW/uwx3jjjmFj15/tScs8T/1OV04vkLHmZ6iNdLync5zRKZ0R0tOot2K4XvRVfLwb4lkhnQApQU/VjIfG0c9I73uGR/SWNWhW+2LM02M6g0wGzbif+IqYoWVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7caf5314847so2967667a34.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 08:30:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767976203; x=1768581003;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZubT71CRwOcTCIzcYS6e5AdXUs3dXA6+1fPYpwtqxhQ=;
        b=EPLKsYrfxDxO3NBaXDGKH65rrvKjiVUVHxyWxbJIvH9JzM3xn/x5HTSxfdx7mKZ3Qe
         M5jq7BAwvjY/66+M0x5BuLGTJYL2jGlTd7sSgEiAHamqpb26FgHsXfHuqO/WTBwI0FkF
         YLrMbGecZBMdjh3kB7M/HbKHaDUTyBVaCkRDnSPn0vNs4TNrUnspiHhHsGf19SDVi4mc
         IZ6zVTY+fa63if4L/mTRIcHvka2AJuQpU6Dz0hUuYiV52USfB8ukwD+nu0caPngKOVag
         fvpv/diINWjZJVtIL+Wcj4CjI1xbKQMQVZlWyqTmLdhgUxTZVugYFyAvkDuv5n2FvwWZ
         LyzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGb/y291MkNXznH3mGQAE5El9zJGnpPh28OkLw2KIFq+JrcFnSHMZFeCfVM+As5aeNRVuYSaVI16rP6Ng+FYeRhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIpuYoYmvFawDoXVrIqMgFXMIRG/SMGucpmnqWf42qVWrIA400
	J06L5S48iZ91nDcf7clISUaRbRQy+gHTRhKg730soHMNqAoz0l86m6MjWIPhlzC2
X-Gm-Gg: AY/fxX7x94/TeE9PMiHZk8MYyCmkEcPP9eOLzXXNWfsyontdxQ8n+wa9MP76VhR/YEI
	x6TJ98IC6vverYDfS9GOzarSYcnIFk4MX3xhohVk7s3Flu+WBBJ1tZ7IOokQ7g7UmOH0DhreSaA
	ACbSPgufqZ6+Tlob1OMliUjKpFwbEsd63/qjAkYnwsSm6A5OQgMxoc/smvdjxPogsrVOWdEkuDN
	LU54BMONkNWWlTUQxVxtVVfuMNLoPAftnBlcmtvRiA6M/iba9w1dJ6cHb9+Ke90ooLp/rZZ6pU1
	LDANesLN8fUK7mSIZ8zEkms0lAsAa6Mb7p7gfKhnDvyiCeB/JycHs9FzUuRWvxmn6eJatoWf3x1
	O/c9UpC8u3t6eLe434Sg5zsx5MVqOI53h/Z83GDHdbO7Mhbkprla0Bkva9k4NJwZXZhsxe+W5xs
	fn2MlsihpHZp22ccfHi1UZTVnM+XFYGqlX5ey3Upuz2VrMKZto
X-Google-Smtp-Source: AGHT+IEHdySt9P27RfEQyWhwJPsfNj+j0YrsQ1yuKDAeh57RIhSr1+2rApkjXcPKbvRNk46VhwfxLA==
X-Received: by 2002:a05:6830:2706:b0:7cb:125d:2a47 with SMTP id 46e09a7af769-7ce50a0039bmr5800227a34.1.1767976203579;
        Fri, 09 Jan 2026 08:30:03 -0800 (PST)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com. [209.85.210.45])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478ede43sm7477136a34.27.2026.01.09.08.30.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 08:30:03 -0800 (PST)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7caf5314847so2967650a34.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 08:30:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVyUNUImYEaZtgYjLH5UNwnI0zKOjy03O7QIiC1JJqBwaUi6GaSNDL3jvK9XSKk9rd79r7t5sL55ZALOn5nGrq0lQ==@vger.kernel.org
X-Received: by 2002:a05:6102:161e:b0:5e5:5ed7:60af with SMTP id
 ada2fe7eead31-5ecb90b08d7mr4011067137.38.1767975733803; Fri, 09 Jan 2026
 08:22:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <1c7657d6c06d99bc2f90251995ad272b5704717d.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <42bbdec7-ce6d-417c-a13d-ce0a6782bc9a@kernel.org> <aWEnfJonv4egKhXo@tom-desktop>
In-Reply-To: <aWEnfJonv4egKhXo@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 17:22:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUm-yHkRw0k42pfq9BD8urLO7rqF2yD7s2JbkMFpRTQwQ@mail.gmail.com>
X-Gm-Features: AZwV_QiF7IGNds3nroCU8C4Y7nT5yUExjbtpCqViVpA_Mph5jGaVHbhMlWChdXg
Message-ID: <CAMuHMdUm-yHkRw0k42pfq9BD8urLO7rqF2yD7s2JbkMFpRTQwQ@mail.gmail.com>
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

On Fri, 9 Jan 2026 at 17:06, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Sun, Nov 30, 2025 at 09:24:57AM +0100, Krzysztof Kozlowski wrote:
> > On 26/11/2025 15:07, Tommaso Merciai wrote:
> > > The MIPI DSI interface on the RZ/G3E SoC is nearly identical to that of
> > > the RZ/V2H(P) SoC, except that this have 2 input port and can use vclk1
> > > or vclk2 as DSI Video clock, depending on the selected port.
> > >
> > > To accommodate these differences, a SoC-specific
> > > `renesas,r9a09g047-mipi-dsi` compatible string has been added for the
> > > RZ/G3E SoC.
> > >
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > ---
> > >  .../bindings/display/bridge/renesas,dsi.yaml  | 120 +++++++++++++++---
> > >  1 file changed, 101 insertions(+), 19 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > index c20625b8425e..9917b494a9c9 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > @@ -28,6 +28,7 @@ properties:
> > >            - const: renesas,r9a09g057-mipi-dsi
> > >
> > >        - enum:
> > > +          - renesas,r9a09g047-mipi-dsi # RZ/G3E
> > >            - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
> > >
> > >    reg:
> > > @@ -84,6 +85,13 @@ properties:
> > >            - const: pclk
> > >            - const: vclk
> > >            - const: lpclk
> > > +      - items:
> > > +          - const: pllrefclk
> > > +          - const: aclk
> > > +          - const: pclk
> > > +          - const: vclk1
> > > +          - const: vclk2
> > > +          - const: lpclk
> >
> > Why are you creating completely new lists every time?
> >
> > No, come with unified approach.
>
> The intent is not to create a completely new clock list per IP, but to keep a
> unified clock definition that can scale with feature differences.
>
> The previous IP supports a single DSI input port, whereas this IP supports two
> DSI input ports.
>
> Because of this added capability, the hardware naturally introduced an
> additional clock.
>
> Can you please suggest how to handle it?

Keep on calling the first vclk "vclk", and add "vclk2" at the end of the list?
Then RZ/V2H can specify the first 5 clocks, and RZ/G3E can specify all 6.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

