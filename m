Return-Path: <linux-renesas-soc+bounces-19033-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04747AF583A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 15:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27C183AADCB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 13:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 219C327586B;
	Wed,  2 Jul 2025 13:13:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248C826658A;
	Wed,  2 Jul 2025 13:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751461982; cv=none; b=VgUNa99LsIydv2MEOAzOnRGheHd9iXQBF2NiGEhfoMFxHgk6Y22+SXssqLTkPiukoaIblZz7TuWkMLCsrnULDTxsfVwGoc58ktlS4JCRCr2P/4Ja/Ay8HmdKHhVpwdCKTo4J6Z/BzJtoL5Msq5fNXmWTSScm9EUvay0lPWCM4Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751461982; c=relaxed/simple;
	bh=G/X8FLYXIhm8Xtuy1bdv90EErCQcha2aru4EN9oN/OQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LoWjejih5Asbt2IPKU3YuOGblJpUxMVFjrsOKcAJTnQeav5n+Nrd7MA4K6Rs/gy3v9x3vNGE62I6dIkRv8NGdA+iMn/EiVPUCCm/QnqO7gVERXN8soSewL5iPAl2bBr/DJzX0EVEvc0v8N4n+q58qCW+VH47JggRgGaNSeeyTvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4a4bb155edeso79655281cf.2;
        Wed, 02 Jul 2025 06:12:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751461978; x=1752066778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8vJAeCiyCz2kQO3TB9Yq0+wZP0/k8LFuyb4YwCjLgw=;
        b=Bch8Jn+IbRfBkYwkDcpk75G4OqHGbYffm3dF/eqhRg7VOJam3v+fAawS5DzVML7Gd4
         DItIuJk5KYn7Or7tN8uvYqRzxNN7oGtgZBkg+k/Sl9j2HGkLdGorrKObcCncbINHYOUx
         y2idKTwzIclyv6Ym482uH/4tTyKpjEmYriNzgN8b/gRT1MXNEHNQUMDT038RZf+Yi74o
         XE2HDNjQncGGb7nYgMFor8woz6XEA/MxEDNnCE0kB7YoST69yKMOx2Xx8KLpFfHkxQkX
         6tE9LYql7lyv1j6cZZ9t+LnAtlJP32VMraL0JjOVJDrl8tUhK1Zqq58UwD0bs2CihWrJ
         gUXw==
X-Forwarded-Encrypted: i=1; AJvYcCUt2IXiJsGwm68OitJHxHLwOhglpLhipsY0Ets6Eq3tTURhLPH03LBOUByk6YanIdBtr9xubYrtgquF@vger.kernel.org, AJvYcCWXH67oYM3/s4rI5LpwlkfGm3mcowZr1/Jr82cXEwxwFWhIX5fiPxL+YwHQIR1cgzUrP1DIDiGZRTuOBvAeAKv6qLY=@vger.kernel.org, AJvYcCWmPO5QS2nhO7WsKNPQCeuG7bgCqEbV3HVrhrN3udVHZLy5+mSPpZGvrAlJTPEw/5uizODTumdo8ANqf25D@vger.kernel.org
X-Gm-Message-State: AOJu0YwS4IOEDQu3cEERVQnhSZ99P8C2n1gNKOB2+pxPr4taPrMIR4Ie
	IUkFFlmfgWxtQsHaHYFdP3rWcOTZn25IYrqcwhNrLOLUlCk09YAVYdDJlctm8CGf
X-Gm-Gg: ASbGncuz8lBvjOhAalgqIq3f8TqLY3h66BVbMzvqXftPU3ePsmkrkGApwXyE725abDL
	3BWofrg/jwtTWL2pNr7WPtW4CfPMdxPa1sBuDEMPlg+QVipFul+uIi6YwKUC9Xv3iKSkIAipk02
	SnNSRObnlKta5dFfT71cUMEMNU1wTHSh/gIFMET0kR2e1fu8JtZIRxqqeyBNvhdkO8FYv5DGIZM
	WPACY3iDQYQusZl+fFVIFH1aJnt8MNLp2Ym6MKGSuEDKG/v/ExyzXH4GNXOrOdwZxGarX934qgy
	zHLs3lBlO8ZWy8tL5gYKSyohJQPIq8tQgBsH3b/uTr8csGWuXzoAAHpTrekBIGbdT2VIAus9MYH
	MCHMllNubvwtQ0xxZcv30ZvLDY18p0p8Z8nC8Vcg=
X-Google-Smtp-Source: AGHT+IHgT57N6yqC7AunftHC3anA2jtFrHp4h0aNi/X1RpOnY3PMCb1mj8YAvpyW4SgfCIYgO7QKJw==
X-Received: by 2002:a05:622a:406:b0:4a5:a96d:6071 with SMTP id d75a77b69052e-4a9769e54a0mr49484121cf.38.1751461978242;
        Wed, 02 Jul 2025 06:12:58 -0700 (PDT)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com. [209.85.222.177])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc57d905sm90612731cf.64.2025.07.02.06.12.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 06:12:58 -0700 (PDT)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7d425fc4e5fso565024785a.0;
        Wed, 02 Jul 2025 06:12:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUBRHrpMDImFFfOtTr3JkM/5ebcpJZCokDAu7j0Vrwavxhas6jtgxGibpDD7WQ+lKW3ggcvoBhEIKoaQw4u@vger.kernel.org, AJvYcCV8vQjPShWSmc2qvrdRiF7xRFj25k3WuAX8lUf0im1Gra8AuLjAYkouJxxogA/5rah1jDzTdJpG06PIn9bohfzWQEE=@vger.kernel.org, AJvYcCVsU4P/v9IoCcIKocbfykYplLCMAgeFSUCA3OYN+U8LT01D/ACWj/yd5cbfEp8jyyLGqn7+nd+TJKy8@vger.kernel.org
X-Received: by 2002:a05:620a:4392:b0:7d4:dce:5f5d with SMTP id
 af79cd13be357-7d5c4718813mr355226985a.38.1751461976712; Wed, 02 Jul 2025
 06:12:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627193742.110818-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250627193742.110818-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Jul 2025 15:12:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWaoToq0ZHx5_nFCx0iL4B2PUHRkegm5Vy3K+5MG2YSrg@mail.gmail.com>
X-Gm-Features: Ac12FXyyu7nDvYgvHQb8BzoWhr6k4DDH67v3mSfFK_-ePILOH8E1-RslKsIyuio
Message-ID: <CAMuHMdWaoToq0ZHx5_nFCx0iL4B2PUHRkegm5Vy3K+5MG2YSrg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: Add CN15 eMMC and SD overlays for
 RZ/V2H and RZ/V2N EVKs
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Fri, 27 Jun 2025 at 21:37, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Introduce device tree overlays for supporting the eMMC (RTK0EF0186B02000BJ)
> and microSD (RTK0EF0186B01000BJ) sub-boards connected via the CN15
> connector on the RZ/V2H and RZ/V2N evaluation kits.
>
> These overlays enable SDHI0 with appropriate pin control settings, power
> regulators, and GPIO handling. Both sub-boards are supported using shared
> overlay files that can be applied to either EVK due to their identical
> connector layout and interface support.
>
> To support this, new DT overlay files are added:
> - `rzv2-evk-cn15-emmc.dtso` for eMMC
> - `rzv2-evk-cn15-sd.dtso` for microSD
>
> Additionally, the base DTS files for both EVKs are updated to include a
> fixed 1.8V regulator (`reg_1p8v`) needed by the eMMC sub-board and
> potential future use cases such as HDMI output.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Dropped patch 2/3 from previous series as that has been merged.
> - Dropped adding alias in base DTS instead added in overlay.
> - Switched to using single overlay files for both RZ/V2H and RZ/V2N EVKs
>   instead of separate overlays for each EVK.
> - Used RZG2L_GPIO and RZG2L_PORT_PINMUX to avoid using SoC specific
>   macros.

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -161,8 +161,16 @@ r9a09g047e57-smarc-cru-csi-ov5645-dtbs := r9a09g047e57-smarc.dtb r9a09g047e57-sm
>  dtb-$(CONFIG_ARCH_R9A09G047) += r9a09g047e57-smarc-cru-csi-ov5645.dtb
>
>  dtb-$(CONFIG_ARCH_R9A09G056) += r9a09g056n48-rzv2n-evk.dtb
> +dtb-$(CONFIG_ARCH_R9A09G056) += rzv2-evk-cn15-emmc.dtbo
> +r9a09g056n48-rzv2-evk-cn15-emmc.dts := r9a09g056n48-rzv2n-evk.dtb rzv2-evk-cn15-emmc.dtbo

.dts?

I take it you meant:

    +r9a09g056n48-rzv2n-evk-cn15-emmc-dtbs :=
r9a09g056n48-rzv2n-evk.dtb rzv2-evk-cn15-emmc.dtbo
    +dtb-$(CONFIG_ARCH_R9A09G056) += r9a09g056n48-rzv2n-evk-cn15-emmc.dtb

> +dtb-$(CONFIG_ARCH_R9A09G056) += rzv2-evk-cn15-sd.dtbo
> +r9a09g056n48-rzv2-evk-cn15-sd.dts := r9a09g056n48-rzv2n-evk.dtb rzv2-evk-cn15-sd.dtbo

    +r9a09g056n48-rzv2n-evk-cn15-sd-dtbs := r9a09g056n48-rzv2n-evk.dtb
rzv2-evk-cn15-sd.dtbo
    +dtb-$(CONFIG_ARCH_R9A09G056) += r9a09g056n48-rzv2n-evk-cn15-sd.dtb

>  dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h44-rzv2h-evk.dtb
> +dtb-$(CONFIG_ARCH_R9A09G057) += rzv2-evk-cn15-emmc.dtbo
> +r9a09g057h44-rzv2-evk-cn15-emmc.dts := r9a09g057h44-rzv2h-evk.dtb rzv2-evk-cn15-emmc.dtbo

    +r9a09g057h44-rzv2h-evk-cn15-emmc-dtbs :=
r9a09g057h44-rzv2h-evk.dtb rzv2-evk-cn15-emmc.dtbo
    +dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h44-rzv2h-evk-cn15-emmc.dtb

> +dtb-$(CONFIG_ARCH_R9A09G057) += rzv2-evk-cn15-sd.dtbo
> +r9a09g057h44-rzv2-evk-cn15-sd.dts := r9a09g057h44-rzv2h-evk.dtb rzv2-evk-cn15-sd.dtbo

    +r9a09g057h44-rzv2h-evk-cn15-sd-dtbs := r9a09g057h44-rzv2h-evk.dtb
rzv2-evk-cn15-sd.dtbo
    +dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h44-rzv2h-evk-cn15-sd.dtb

>  dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h48-kakip.dtb
>
>  dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-ebisu-panel-aa104xd12.dtbo

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

