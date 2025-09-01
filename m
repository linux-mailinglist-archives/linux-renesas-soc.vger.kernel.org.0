Return-Path: <linux-renesas-soc+bounces-21114-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0501B3E00B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 12:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A45D717E9C2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 10:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DCA530DEB1;
	Mon,  1 Sep 2025 10:24:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780D330DD25;
	Mon,  1 Sep 2025 10:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756722263; cv=none; b=ZdKHRWNKcVX435sz3saXqcbKxym5UHrC12d3KxuEKtBDRF3qJRkkWiZJtkkRUreIrL/TOjU6LuEW2dKrA7xtGWMhOaDOOg9c6bgZ5vWcpxHBiefeaGCJZeZrcW3dku7zwcZNmyPu0jiPieQLyOAQnopok1/lAD3h7+Ie2aZTKiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756722263; c=relaxed/simple;
	bh=6N+Y7Cksp0D/Eiu0Qce4aqd4koAZl1uGH9suRCNzyCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HWxq/88kYXY9lAMTlFIC829OY14+KzCgCwBPa7PEziQSCt5CG7mOIUBCANgIpUQb2enuZs+5zTF6loFTTICv8kx1k53PoyvzQGqlRRXLIu3faUYsu/fQa5YPtsakoEXsl9XQcQG8CPNvSj9RdEU7EjQWgW5YWlRhVu+PGHsyEjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-89018ec3597so2888626241.0;
        Mon, 01 Sep 2025 03:24:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756722260; x=1757327060;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xbig3sYpsCW5jX98QE66Dn4cyGatDq9arGsShyCh+3Y=;
        b=gqyAjnzUZLqbaK4TdRTgj2m3AU/f1DkZEtvWQX+JuLARTiINYCabgduE0Zg+oM6BYK
         QbhP+O0oWojL5VI7/3+aqnIDSj+PZiuwkfX5PSpF+qyAw0WOXvstGDvS1uF+srupLMFC
         kPot0/+CPtAVWDKO33PZa0vyDDOyNDDGgQMcQRlMU0lE0bJtrtZ+s/ey2cu3H7WT6EzI
         YxWaq2Et/pEGYAEUwdY7xfWlfhvux885dzjQTvQVxGrrovuFIJRX5couojZiNqOicO3s
         GnMr1ob+ZLBf/2NTzPdNlPmCjt5t0skFbrc3ToHeLVQAS6LDt4uLV5U9xmWVwTSuTnj/
         ciYw==
X-Forwarded-Encrypted: i=1; AJvYcCVo6Qf84psuXG+Y4NhKxjatoX28oXPSMVRl/+DpZCSYXb9RAJLuyFN327UIMTJc2InWAOWn7EFdllfB@vger.kernel.org, AJvYcCXK6J8J0JhEki55B2S8YkM1aZkE2Dbvj8wI3tN5eGauZRgmiq1r/zdzuVq959mQ/8MLNCxA1w4jzbwwRKDmgjptbRM=@vger.kernel.org, AJvYcCXv6Y2ywuHTFcnmw+r/+nI2J4zuZ5ll2FyYOdsCGw3E3YPVUKBp2kYQTw01tUIIgC47jIJGnxsOYBa3iDXN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9FlJjoVJITkz80mab7R+aAWtQkkg9V9BoOu/nnUS0eSLePbLw
	hK38icZ3gbjjIbcEPQAw4jyIGP9UP34Ax4FD3vEPlJ4z5Z0rKl10vLecmvILHPwD
X-Gm-Gg: ASbGnctt/JXItvXrKSv/XgGWX6jfAgxWDmDdQjcw9Q8f0tqVkebgbVdb1ervqSTLlZG
	xb84AH5XcMju5sTkACBARrJdVO0f0C6qVoWRvy0bDOJVh2FCKiSmwtEgq+vkWhN7KSAH6/6SEAI
	I9qz+5WW48JdgLVszPQ3/ADUOyCdpUNk/xemykdyD/uoXBOHizZ6upPgWhO2sVmSmKxaFxgChtL
	aazgGMBuabQnc7ytTtMTnThcnanz42IeTuuBq3JRtjyO6aq+LbKk+CzAX58+kzB7LpMcECvc7W7
	GmdWVXtZt4+qUSudn+/igP8PYEiH9fF5yp3yf3e/lYLa41XiZRIqqCqdbOBMT6LQCav7WoSJy1b
	j7zr3a588KvUaCO/+u7zq8P1ruv8PL/CBfDmGrsUuwR1d8bkL4GF3aKu6+WXdkfLu2v5zcOw=
X-Google-Smtp-Source: AGHT+IHzPTdplrTtjU9TSbhGlpRy+2YEoDevpL0myuyhGeQm3+sRjigNrrSXCV5Y1DkCQwJ1RDbgWQ==
X-Received: by 2002:a05:6102:dcb:b0:4fc:b033:cdc5 with SMTP id ada2fe7eead31-52b1b1f17a5mr1940791137.22.1756722260049;
        Mon, 01 Sep 2025 03:24:20 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-894e1d08c79sm3376765241.6.2025.09.01.03.24.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 03:24:19 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-529f4770585so1973801137.1;
        Mon, 01 Sep 2025 03:24:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVOdS+ao0Xr6LuaYTjfxZRG+jYzF/5Zvo6lQdZlRcpcnobCWjZhcKrQJMMEDljLd1diRbPHOO7gm9TIm/ZAqcyPQ78=@vger.kernel.org, AJvYcCW64RZiNK9PeOcUnDZzDq/CzSpI66yscPpVVSZ4Hslw9tgj+x3DIM3JIG/kloe8Ek14yaCcjU1BEE9I@vger.kernel.org, AJvYcCWho54Fmi2tZJYnJV/ra3kNPGnTjEh4a0ZR4aswa4WwnFRuDOmbvvTBIsOeOUUyReqiUF6Hwtd5Kie2KKRN@vger.kernel.org
X-Received: by 2002:a05:6102:3581:b0:521:412d:94ea with SMTP id
 ada2fe7eead31-52b1c144e1cmr2248444137.34.1756722259515; Mon, 01 Sep 2025
 03:24:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <OS7PR01MB137037775991BBBDB29E54105A77BA@OS7PR01MB13703.jpnprd01.prod.outlook.com>
 <87zfdw2wlt.wl-kuninori.morimoto.gx@renesas.com> <OS7PR01MB13703B662D2AE6ECB77F59584A77BA@OS7PR01MB13703.jpnprd01.prod.outlook.com>
 <877c0z2vz3.wl-kuninori.morimoto.gx@renesas.com> <OS7PR01MB13703654640293E4F1F95B694A730A@OS7PR01MB13703.jpnprd01.prod.outlook.com>
 <877byyzjcm.wl-kuninori.morimoto.gx@renesas.com> <OS7PR01MB137031EFD84919AA36666E1FAA732A@OS7PR01MB13703.jpnprd01.prod.outlook.com>
 <87bjo971ns.wl-kuninori.morimoto.gx@renesas.com> <OS7PR01MB13703647C4AABD03C6345F221A732A@OS7PR01MB13703.jpnprd01.prod.outlook.com>
 <87cy8k2uf1.wl-kuninori.morimoto.gx@renesas.com> <OS7PR01MB1370309A85A300195896C0619A73EA@OS7PR01MB13703.jpnprd01.prod.outlook.com>
In-Reply-To: <OS7PR01MB1370309A85A300195896C0619A73EA@OS7PR01MB13703.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Sep 2025 12:24:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXDW5=UCVRSq2DBks++YpyoJ9rtsdaKheYLv7foEZmg-A@mail.gmail.com>
X-Gm-Features: Ac12FXyv_fl_h6rLLtyWK7i32zlKJJX4i_uPJiy0GMGKWe6N6K6w3SWddDwtfg4
Message-ID: <CAMuHMdXDW5=UCVRSq2DBks++YpyoJ9rtsdaKheYLv7foEZmg-A@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: renesas: r8a779g0: Add new gsx node for V4H
To: Anh Nguyen <anh.nguyen.pv@renesas.com>
Cc: "magnus.damm" <magnus.damm@gmail.com>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Duy Dang <duy.dang.yw@renesas.com>, 
	Duy Nguyen <duy.nguyen.rh@renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Anh,

On Mon, 25 Aug 2025 at 06:37, Anh Nguyen <anh.nguyen.pv@renesas.com> wrote:
> From 8a8391bc4ceaac5248267851b71c9cce6b5c434a Mon Sep 17 00:00:00 2001
> From: Anh Nguyen <anh.nguyen.pv@renesas.com>
> Date: Thu, 21 Aug 2025 10:01:30 +0700
> Subject: [PATCH 2/2] arm64: dts: renesas: r8a779g0: Add new gsx node for V4H SoC
>
> Add new gsx node to enable GPU for V4H SoC
>
> Signed-off-by: Anh Nguyen <anh.nguyen.pv@renesas.com>
> Reviewed-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -2121,6 +2121,15 @@ gic: interrupt-controller@f1000000 {
>                         interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
> +               gsx: gsx@fd000000 {
> +                       compatible = "renesas,gsx";

This compatible value is not documented.  However, I don't think this
can be used as-is.  I think the property should look like:

    compatible = "renesas,r8a779g0-gpu", "img,img-axm-8-256".

The first step would be to add it to the DT bindings in
Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml.
Furthermore, support for this variant should be added to the driver
under drivers/gpu/drm/imagination/.
And where to get the firmware required to operate the GPU?

> +                       reg = <0 0xfd000000 0 0x800000>;
> +                       interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>;

According to the documentation, there are 8 interrupts?

> +                       clocks = <&cpg CPG_MOD 0>;
> +                       power-domains = <&sysc R8A779G0_PD_A23DGB>;
> +                       resets = <&cpg 0>;
> +               };
> +
>                 csi40: csi2@fe500000 {
>                         compatible = "renesas,r8a779g0-csi2";
>                         reg = <0 0xfe500000 0 0x40000>;

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

