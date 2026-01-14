Return-Path: <linux-renesas-soc+bounces-26749-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 10631D1FAF2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 16:18:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D39683050CD4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 15:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEDCC225397;
	Wed, 14 Jan 2026 15:17:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADA0320385
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 15:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768403837; cv=none; b=aQVzUVfcY+HQN18GiL2bbklnUBmkmhBYfc/zlh5NCiXqh4Kvil+MILBZgictDFUPh0PgbMyqnSVM/xABW2xBqNvURFVH63kO9v0tZAS+ckWGcQJliYCq/ESk6PD5ap1YnVVAdE/aeuLO9n8galwY9Xx1imL4WJGaxEhxnGpV3yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768403837; c=relaxed/simple;
	bh=FVp9JszAvDPklWiBOZYNfZx5aTGhTO2ByBB8fUsE2hA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pU4tet0MF7wseK/zpgMAeBV9e2tJIyyYG4Nr0i8lULaSfgCDH47DTVf5RE5Sl7Wwei6n8ZXs/PbhjZ5vgcAkP8/z3i9Tg6bIEe5Q025AjCe3jfM0dY4TpkvnGmLgBc38AAZhUweID3BpwLOniRZ5ExbCvYDRcAAYLf9Tm1sghrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5ecb1d9ac1dso5643998137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 07:17:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768403834; x=1769008634;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKv1ovepy8byUAHhXrIcegwAZXFuolP4bDoWHXlYmv4=;
        b=aOGMMsSpMX5S/PX9TgHuZSqykcTK1yv7IJt6dzQAOSc8pl7HS5OjugihfvzK76oHj6
         2vMlm+IhBlnHnyljDpHnWZ3Id3LPs34ZLpamMWF/QZWGC7md5qHMxAv34FKyWM8pP+Py
         /V0O2bkBWTG6O2CHLQYdgIt+aUqAzffdhdnJ9zJrxO4EOGdxgLYf8w8G6O57NgGL0HdD
         rn1slcmFKRl+8m9uqQn+Cym0JEqYDOWxyaDc48qXXdZfxodo9vh03zcsmwuxe0+7brQe
         cN/M5BP1jKszM78GuhlpDmrCVBPsHqyyo0Kq+EDZUO67DQ2ucVHAjNkoX0V2Gil5rAG2
         7fsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkYVi+KTYevWhfGoId+JfWdL7CdBBE/WMP6JwqnzCc4Ok5k6ILFkLiIzrL0euFGf5jrY9f3gNduyku3ErHhfZfwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0b+ULhQcMbTO3HLAO4xp3Fui0ahYOYQl62/HGD+Sxib+sjbD3
	izsdltqaO785bEvPOE4n1hfVSG22X1zpn1a/x3tdqsYz8fOIIIZXO2Lw9JmCkUSc
X-Gm-Gg: AY/fxX5LZi7cKjwvW00A2OAD9OMCxqXJ9xIr2GUTNc4ZqPIM2aVathJu5eEGDFbZAzo
	p9wOjtQ2PR/MS+VqyWvId/pQXqjX8alfIexWOU2dg4bBSl2Yk7NGWYSz9890HVyHuElb95SzHID
	tYEzZ8LJjtK4++t45cxpz9kcQShMnirWQhxLMtoLhkxxKUdqX6qT4kipEclzXBUhL9/yD6n5drm
	1LDy1ejGCN5jnDshC/uAy3Ogxa+y6TWHDrVI12w9kCnUPQJxHsUZo5N2GMwf2MC2UMFAuw72OG5
	oe2z3u5KCPYEDayRZsjSuAiXRMEh5OJ2PZ/LBDMg7X4+XC0DhIFTP23gL+HSUMQ/2wQX5wikPnR
	4FuiCDrY1cNYUJSX7fMd19iYhzjy9D6H1dt9CydG8bljS6wwbbvkBnsD8tHASvLOfpmRCgrUvTW
	308I0Gnuxe4BNacUx7HpEwCpxtUQ/n/lk1fYkOHGhy3RffSnDVaq6Z
X-Received: by 2002:a05:6102:948:b0:5ee:a04c:7ea8 with SMTP id ada2fe7eead31-5f1838c258emr1179840137.11.1768403834253;
        Wed, 14 Jan 2026 07:17:14 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5efaf4b2963sm13118894137.13.2026.01.14.07.17.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 07:17:11 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5634feea416so5339502e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 07:17:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVIOV6fplto0yTIdJW1Rg3K87HhfN9kN9CzSLq3LSlG6KBkorWjkb1Qq903yv405U6u1EZ8FLtl+RMSoA4RjcuXGA==@vger.kernel.org
X-Received: by 2002:a05:6122:130c:b0:55a:be72:7588 with SMTP id
 71dfb90a1353d-563a21caaf3mr947121e0c.11.1768403830849; Wed, 14 Jan 2026
 07:17:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com> <554850e7cc0ed99ea2a0d47840fbd249d17faf6d.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <554850e7cc0ed99ea2a0d47840fbd249d17faf6d.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 16:16:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW6rsfeYjdqnxZxFrPe22aboPMwgzDVMtrfso5D3m4GhQ@mail.gmail.com>
X-Gm-Features: AZwV_QglkbidH76AuWe3Sfdqyn2BD0tJQEne_GsvUMV72nBp7iQEpygHJH5KiHg
Message-ID: <CAMuHMdW6rsfeYjdqnxZxFrPe22aboPMwgzDVMtrfso5D3m4GhQ@mail.gmail.com>
Subject: Re: [PATCH 20/22] arm64: dts: renesas: r9a09g047: Add vspd1 node
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
> Add vspd1 node to RZ/G3E SoC DTSI.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

Please merge this with "[PATCH 18/22] arm64: dts: renesas: r9a09g047:
Add vspd0 node", i.e. add all VSPD instances in one shot.

> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -1219,6 +1219,20 @@ fcpvd1: fcp@164a0000 {
>                         resets = <&cpg 0x11e>;
>                         power-domains = <&cpg>;
>                 };
> +
> +               vspd1: vsp@164b0000 {

Please move this just below vsp@16480000, to preserve sort order
(by unit address, grouped per device type).

> +                       compatible = "renesas,r9a09g047-vsp2",
> +                                    "renesas,r9a07g044-vsp2";
> +                       reg = <0 0x164b0000 0 0x10000>;
> +                       interrupts = <GIC_SPI 921 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 0x1a8>,
> +                                <&cpg CPG_MOD 0x1a9>,
> +                                <&cpg CPG_MOD 0x1aa>;
> +                       clock-names = "aclk", "pclk", "vclk";
> +                       resets = <&cpg 0x11e>;
> +                       power-domains = <&cpg>;
> +                       renesas,fcp = <&fcpvd1>;
> +               };
>         };
>
>         stmmac_axi_setup: stmmac-axi-config {

For the contents:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

