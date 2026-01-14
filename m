Return-Path: <linux-renesas-soc+bounces-26752-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 050D7D1FC3C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 16:32:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6E0C030514F4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 15:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A41B7392C42;
	Wed, 14 Jan 2026 15:23:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4709A39B4A5
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 15:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404203; cv=none; b=kt/hpEjnqnUORZyUM3IV5MAcmqalQOg3Po1A++46BPxpCEx24xwo2U+9l5HPat4yI2ObAs5PG3bWnaXYM3UYImBUDOscvzUwBcGQdlBHRxq/zUY82gmjPtNlXDsgjESN/LuqoMIjsZkgBBBWP8VGgsLDpBLnnezZTSjL+LGfHxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404203; c=relaxed/simple;
	bh=FbjFSImaY2k0aKJ3OzRfQKg0m0OC/lVVuYVOsRiP1wQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KcZK0VDWTpHv98Ew/sF8BzF9jDrVvLQxkgsmLQs16iEz1tA/JTaKvTlG7JloGCyLoImuQ8b5oRvNib0nIxNKK1ZYM+Ow8xSEL9S7aTUjq0jFw75W4DeXfO+uLgDiLpZBxt6Hl+Revs+4sW7JkzAhRnQtos/A3QmS+8kZ7MSAStY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5636470c344so4136344e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 07:23:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404201; x=1769009001;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9PHoycvBsjA0Sy0VbLTIHVLWHYGM3MD8TXsWVqyh2U=;
        b=j6J/b08emp1cFIFN9aS3rt6RM3T4z79WQvJUP06yJL/W0wABqiu7R55CJuIGISbqAW
         wK0KmQqLd06Vy5OfIjVXPlneokocFOwmBZa/UN7jyEGC3xFHI1/Oj7GiiVeBViz6cxzs
         MBMuPRXdIxIm3oWp4V4o4Ugmr7UVLDlKUWjVTVVBxF3k2fosCo7OcbU88Jg029OIWloV
         0eak8GxJYWy2ouMtS4CwmwDgDyFeiOWvXL21arY/ssglka0JIiGmi4Jnk7wlWxIGt0aB
         7zR3q4dhMAIS16TI7xkyFTAljFjDoyziBtZb5U/c54IiTYDaaZvw9haMb9FKlwKzV4Ar
         v7fw==
X-Forwarded-Encrypted: i=1; AJvYcCUUdoNpReEktFMwsezsEL9nibrn0dNPeC0bc97Sgg1ANpGLd82ysZr6EDSvSWD5KzgnD6OmhnRAk6JSWqRHuumFWA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6frWXXQ40GcOywErHFLK+/bytvAytksxzsT0fxuhGsQYZTdJi
	EJAqnLIik/qCt0PG8HGX7Wc0bs2AQyfSFwRFMJxqhqgkSDQ8tEFHC0ouYmVtyLyi
X-Gm-Gg: AY/fxX71EG0PtJG6rVdX6uJ6bqziUZMUZxEPNUxgtk0od78gM13+xflWyd5FPvO4A83
	6AJ3x4k1xyjfIAvzPobk4RPfEaijKEh1owGvPE8nx09HX4c8HyXr4x3KLq+qG66er8mzeVL0TpD
	mKmwsoEfK33USffjfLLZAWLOlz6vyE/0MRjhPUfurbU3n3sG/k0v9gaZH0kKJPDa3nqoKO/RLtp
	faYomLzBtuQP5SY0Hwv65ORinzcC4Sd2Pl3oo8Rq6ThOnlLkGgoU03UOxLe1cLvY5h0ZsJkS0G2
	wUQmnZq3pw5XFwMPNdIZW4SEbCtt4yk153W6uIFK1rLyeBjCHD4Cb1yIl6JSt6SdQW2hwy9sxMJ
	cxd2q+u1m2VOXFiIi5EwicmceMgjWcMtrec5J4lxYFjB3tXDiaoyhxvcVqmsZBecDifmBddfQ7f
	5Y+Z42TjVNHEZqXH3dYhnitEEeihxVfzzyXp47ndiBSnMERbZZ
X-Received: by 2002:a05:6122:8c1a:b0:55b:f45:1874 with SMTP id 71dfb90a1353d-563a09cfde2mr1159399e0c.11.1768404200811;
        Wed, 14 Jan 2026 07:23:20 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a1ea810sm22746168e0c.5.2026.01.14.07.23.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 07:23:19 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5eea31b5c48so4613782137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 07:23:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWEDlPZ3ZFT6vZgngYxLQF6QxoRrSB4XtFnH4oIeucjrnNBlwBEy838UXgb8PszA7bYclwqlkPRhhlBQ7uaKbVQmA==@vger.kernel.org
X-Received: by 2002:a05:6102:c05:b0:5f1:5c43:936a with SMTP id
 ada2fe7eead31-5f17f5b855bmr1345435137.25.1768404199242; Wed, 14 Jan 2026
 07:23:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com> <9188e9aca69fb0076941bd1cd62693b381cf6f00.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <9188e9aca69fb0076941bd1cd62693b381cf6f00.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 16:23:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW+ZvuJg0ivCM2CHJkRBdx8sgiku1jGgrD_mcO4yV9vHg@mail.gmail.com>
X-Gm-Features: AZwV_QheoOAURJQgELAszsWwxDhSryviUTqnKNYp1N8Uc4IoJlBrWL72cLThIqU
Message-ID: <CAMuHMdW+ZvuJg0ivCM2CHJkRBdx8sgiku1jGgrD_mcO4yV9vHg@mail.gmail.com>
Subject: Re: [PATCH 21/22] arm64: dts: renesas: r9a09g047: Add DU{0,1} and DSI nodes
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Wed, 26 Nov 2025 at 15:11, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add DU0, DU1, DSI nodes to RZ/RZG3E SoC DTSI.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi

> +
> +               du0: du0@16460000 {

display@

> +                       compatible = "renesas,r9a09g047-du0";

I doubt this compatible value will survive review...

> +                       reg = <0 0x16460000 0 0x10000>;
> +                       interrupts = <GIC_SPI 882 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 0xed>,
> +                                <&cpg CPG_MOD 0xee>,
> +                                <&cpg CPG_MOD 0xef>;
> +                       clock-names = "aclk", "pclk", "vclk";
> +                       power-domains = <&cpg>;
> +                       resets = <&cpg 0xdc>;
> +                       renesas,vsps = <&vspd0 0>;
> +                       status = "disabled";
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@0 {
> +                                       reg = <0>;
> +                                       du0_out_dsi0: endpoint {
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg = <1>;
> +                                       du0_out_lvds0: endpoint {
> +                                       };
> +                               };
> +
> +                               port@2 {
> +                                       reg = <2>;
> +                                       du0_out_lvds1: endpoint {
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               du1: du1@16490000 {

display@

> +                       compatible = "renesas,r9a09g047-du1";

I doubt this compatible value will survive review...

> +                       reg = <0 0x16490000 0 0x10000>;
> +                       interrupts = <GIC_SPI 922 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 0x1a8>,
> +                                <&cpg CPG_MOD 0x1a9>,
> +                                <&cpg CPG_MOD 0x1aa>;
> +                       clock-names = "aclk", "pclk", "vclk";
> +                       power-domains = <&cpg>;
> +                       resets = <&cpg 0x11e>;
> +                       renesas,vsps = <&vspd1 0>;
> +                       status = "disabled";
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@0 {
> +                                       reg = <0>;
> +                                       du1_out_dsi0: endpoint {
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg = <1>;
> +                                       du1_out_lvds0: endpoint {
> +                                       };
> +                               };
> +
> +                               port@2 {
> +                                       reg = <2>;

I expect this will become "port@3" and "reg = <3>" with a unified compatible
value?

> +                                       du1_out_rgb0: endpoint {
> +                                       };
> +                               };
> +
> +                       };
> +               };
> +
>                 fcpvd0: fcp@16470000 {
>                         compatible = "renesas,r9a09g047-fcpvd",
>                                      "renesas,fcpv";

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

