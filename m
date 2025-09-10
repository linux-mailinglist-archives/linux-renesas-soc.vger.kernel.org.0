Return-Path: <linux-renesas-soc+bounces-21725-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 532A3B51921
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 16:20:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 094E13AA0DD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 14:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD27B31B13F;
	Wed, 10 Sep 2025 14:20:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8F231C59E;
	Wed, 10 Sep 2025 14:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757514015; cv=none; b=H8wm9zizHgEMI4X0bRUXgdRVif3y1QufzMtthwe2sJkQBwtmMW8fvRcKoi6CZ7vqzr1KaM70bIkBRxm6am+5hEx84bwA11jX24RUogZiFHx0NvT3ykrizEppeGjkdsosUa0ACaOE8ey+HS8qa36QL5oDybPn8HHSEe4EVzjCLpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757514015; c=relaxed/simple;
	bh=Zsk49+TR4IX0J/4RQvmN8x2XdFlaFxI59Vpd2Df/bzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YHfs9OR9cvBSo9X5h8wHNW2hJvnk4+6PPlkW6knp8r51nlJQrjQ5BNUpvukmNHvHiqGq7lUmDd8Nknb0gvUoPsdwwdW344hpfyk9OKqgo+ucVsxYbceBSnf7aT3HEAk04ERuRYBWyXXfZWJyWrv6kmBCeeAahGhHceD6aCxGWyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-544c9efb743so2268886e0c.0;
        Wed, 10 Sep 2025 07:20:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757514012; x=1758118812;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x21yO8f8IRdOIk+Cj3v6ETy2MtoNPRdeWLKlu8lLo2A=;
        b=unPgLUBvCnQePXAMmkoeWD8c4rFrKFHSZAYxJksrDVpUzc9njdU8IYAjCGV8rIhTQ/
         M1b5A/ZSEafoayYF8z8Mp63fVeqSzIyOQACed308m9Vf5tjGisXDYTxSbpK8IAk3lmBC
         LIVq8FK12URYG3UABW2DaAsZV3HFBvXpT30O7tH4KuWxdES1fT4+b2K6FchSRmAlUq8j
         kkk06VgWFouYpWlPfFjhHKgpYK9NKq+4u2ZPFXLCaC1tphpXGLSICVZaSngRGRtjPLqK
         RVM92uF99KDL/4+5cqZj3gHpkQGlnC8vPtvltCo+UKJYxMd8JwIWuqpEVONPUtBTGbbP
         z0fw==
X-Forwarded-Encrypted: i=1; AJvYcCVJRmoOHnZve3OX/j/UfIUyHgZIZFXLGY5ovCAdTo0AUnvbBO3nz/Nb2sIEK4FGhefDJLTmFbfPPvWC8gkGl4WOHe8=@vger.kernel.org, AJvYcCXdsqUKoTZaUHzruE9kj5DLKrx62A3G0mIZV2TvGFdg87DRZufaTMICo4jyWXtocQGrW/IXU1o5dgnY@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsv5VAAJzD4WQdDc60FXARRkMouv/vScaBJcqv0e6l58d4nvHH
	HOb5654FNBcEVgva6k5cSn8klx8D3+GmQQ/R3SG9lGW7clKuOWF66Y8mjnHhSc8u
X-Gm-Gg: ASbGncs6nZjm3PIRliWt3GPTZt7SLgA4XevM+BHbXTSn9QwMiyvSWQMIx9ykzJnFG+5
	LU3wkxoz/MBTL4VK+f06llY3RC5C+lWAeh8Jbv3Qj6QKxil014d2BGUlX4y4hJMhNtYOF5H8/PC
	qSaglM7U1ODWtwidsWXx0xTx6Xvu2sAZfiVBeDS7lARlyECPbenatiGUGgGA0YTAHog+/P7FPw7
	53aXE02l+RpFVOVxY+Jy1u7ylNt1bgp/zv2DVeoZAJ+gbvFsCFdCm1Bl2rLTZ8rcb6bFQfXkQDI
	eksv/2vlu1wAGewzV4zi0Puhq3KNneZSvIybHV3Wquh81zyP3Ro8yrmU7kLk3C5fTLMixcqbIIB
	IPfFazoNrBSxHj2gbfxlOvOurSOjiy+NGQZvnQmkQQjtC8ojm304wLQR8bH8R
X-Google-Smtp-Source: AGHT+IE52lmECt8rakAgAMNv15KSwSimAezYYjF3BbUGKNjVv1ficSu+6vzfarTiE14I1wz9pT+UJg==
X-Received: by 2002:a05:6122:169b:b0:52f:47de:3700 with SMTP id 71dfb90a1353d-5472aaeafbdmr4325283e0c.5.1757514012237;
        Wed, 10 Sep 2025 07:20:12 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54493cf3f24sm13737032e0c.26.2025.09.10.07.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 07:20:11 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-53096b2c5c9so2207356137.0;
        Wed, 10 Sep 2025 07:20:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUr9oanFUwlmx6XMevtCgbZWrRXYhMhnD0bLAp4oEsBHFsr0/XPOMUKzsteyQeJQGeO0546UWOKW9SU@vger.kernel.org, AJvYcCXjY/C6UMrYfvco6ZXEWBVolskMoPkQumZV2blNGLfs42h3iqyTKYmCHWJKzgKwkFZMAO77ZpnEdTMKC4QO1fkNiIw=@vger.kernel.org
X-Received: by 2002:a05:6102:2c0f:b0:523:146a:f2b with SMTP id
 ada2fe7eead31-53d2490eb17mr4295862137.33.1757514011507; Wed, 10 Sep 2025
 07:20:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87o6rjvzf4.wl-kuninori.morimoto.gx@renesas.com> <87ikhrvze7.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ikhrvze7.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Sep 2025 16:19:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVsU0WVfsnVKjX54wBY4VU_rUwJE5r2gNtvuHNrgwC-qg@mail.gmail.com>
X-Gm-Features: AS18NWCvWZVtpzDfTFxkYEKnKltwZcxWhooFjeRCuM8L-5jS6BTyuZF5yYo0_mM
Message-ID: <CAMuHMdVsU0WVfsnVKjX54wBY4VU_rUwJE5r2gNtvuHNrgwC-qg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: renesas: Add R8A78000 Ironhide board code
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

Thanks for your patch!

One-line summary should be e.g. "arm64: dts: renesas: r8a78000: Add
initial Ironhide support".

On Wed, 10 Sept 2025 at 04:02, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Hai Pham <hai.pham.ud@renesas.com>
>
> Add the initial support for Renesas R8A7800 board code.

board code?

>
> [Kuninori: tidyup for upstreaming]
>
> Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
> Signed-off-by: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Khanh Le <khanh.le.xr@renesas.com>
> Signed-off-by: Huy Bui <huy.bui.wm@renesas.com>
> Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -182,3 +182,5 @@ dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h48-kakip.dtb
>
>  dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-ebisu-panel-aa104xd12.dtbo
>  dtb-$(CONFIG_ARCH_RCAR_GEN3) += salvator-panel-aa104xd12.dtbo
> +
> +dtb-$(CONFIG_ARCH_R8A78000) += r8a78000-ironhide.dtb

Please insert this after the last R8A77* line, and before the first
R9A* line.

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts

> +       chosen {
> +               bootargs = "maxcpus=1"; /* FIXME */

I'd rather drop all CPU nodes except for the first from r8a78000.dtsi.
They can be added later, when SMP works.

> +               stdout-path = "serial0:1843200n8";
> +       };
> +
> +       memory@60600000 {
> +               device_type = "memory";
> +               /* first 518MB is reserved for other purposes. */

MiB

(0x20600000 = ca. 543.2 MB ;-)

> +               reg = <0x0 0x60600000 0x0 0x5fa00000>;
> +       };

> +&extal_clk {
> +       clock-frequency = <16666666>;

Schematics says 16666600 Mhz (accuracy is only 50ppm anyway).

> +};

> +&hscif0 {
> +       uart-has-rtscts;
> +       /* Please use exclusively to the scif0 node */

Please drop this comment, as there is no scif0 node yet in this file.

> +       status = "okay";
> +};

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

