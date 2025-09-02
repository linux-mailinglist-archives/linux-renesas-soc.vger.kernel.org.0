Return-Path: <linux-renesas-soc+bounces-21186-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB91DB40209
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 15:08:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A1591739E7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 13:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E107E2D9ED1;
	Tue,  2 Sep 2025 13:02:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2497238FA6;
	Tue,  2 Sep 2025 13:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756818177; cv=none; b=X5IxC9NtNkf10D0c2kO5oPIbuIuIkYfpXT5YVmBUtuf4RucpA0LPJoJrmfMMzt/xWLrgAndPtCP9m/Kz8bY1BQx7S+pOU61WQSZaRdqr5jRMZ5S9O7GTptW8flPbH9HADv7cSeo7uttkZIp5fcUHMP9YQ78cjLB3QMblx94ZFH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756818177; c=relaxed/simple;
	bh=MuBxV9sKtB/8vb8uYwlVydDSgGxeEPQ1TwxOMOMQf8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qgVvzqgBiGt+IQW3k3zCFsaXRc21qdl6iFn6wGnpAbHDHLibps8zUyXNUtoN8HgaJWlhWk33gb53Xp/X/HM62qkyLchzTLj+shj29LGkma2RrrPBSpqYkHaYmVYz2+vKLPYUsRpG2wljGQ0w5hH0cP2gt0pF670q/1LL9dOY1mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5330fdb9723so36884137.0;
        Tue, 02 Sep 2025 06:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756818175; x=1757422975;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6X0paR8Rp+yYuxy0aU4aiHawkab2fveX+z4P4W+un3k=;
        b=b1Fy/uGJRpnb8qJoAjqtnAnFLrVqePK1sq9fltJ3RuDQVGXpABcziL16yl+tY658D5
         S8H7TYm28G0SSIk0PrzmoHooFtQGfkEie02qhkH1CK14MwtflGGOSsvHJ6e+Ek63zniJ
         j7J/CQH19ulg4o/IOhBD1xzS51+V1cp+D4f/C++kIqNSyzQwmihGSPxmlB82QamhTUzR
         GimKU3alq29yHzTPQ45f1pgxwkW+xL9xviYVHbTTfkKCoQQUHVMRcUQnbmkCr4POI/T+
         ARC/Lh8ehSoV05/hQXIYLp/Oi8WgT/V0Rir4pL+uML94MC5eoF2K6tJUcJ4UAuqWXeKQ
         mQ6A==
X-Forwarded-Encrypted: i=1; AJvYcCV4lXYZ/TqxbmTF9/XnZlJ727ogDTWJ0v1WrXLJDjAxBOeT260TKfVIJWd+aGsz3qr+8xOGaFl1YGx8kNEL@vger.kernel.org, AJvYcCWWJVy2UmeT2FvrfZP2G1/ToEUlPxu7JMHiIGl+CQvHWsxJsB0/0fs6Bc2bzSpMi+LNGFjKBom+94Uw@vger.kernel.org, AJvYcCWtX6gUimaXXA4u28fqL5A7l9T2/NRlIi1Si7ktfZHcB74/m1FRK6yDBQxctdYQH5IZ1/ABcAhie23yNUYnpL3zub0=@vger.kernel.org, AJvYcCX5MGGakK3O1mf5Oz/92WKBuJzJfqcltTZX+yk7nrd+Q1iORQNthl0ocRAShOST6Ar31czg/PtERDan@vger.kernel.org
X-Gm-Message-State: AOJu0YwhBdT4874zADwHRnfaD80w/fAfOqOADCDuGiwSFsADRZVv5xnd
	/p4UpeUZ9cWHgbGCDsdP3PsU+k9oss+Jyfw8Oj4a2py96OUrlr+jyrN/A35FnrzW
X-Gm-Gg: ASbGncuuy4oruyIS/Z34bzpsbApcxP1MC3Rd5ReRmIYBXYoXGNw93JWSVv1AaJfOG4q
	wE925Zl+d4G+8RMugkip5WWbyO5ygddliIksoxumvy37kOOdzF3CjAtm526NPFUXL7ZwtJ4QcgI
	ZVnbLEaGVgSyIRDkSrnsKXr33xFMDQDDL8E/HfHxKTizYeftHB5vM0BlNA24TQ6HwGpSlm/fWuv
	sbQN8ld1237j4A8IVamntDVE53ZZmC6LuL+30IbHunk/IADxtK2E6GO6NqMIGXgrFSox/T/sDw+
	ykCp56PGq61PHeuXnxphzTssgpEZatBr1xRmFPpoSM1kyltZRNFgjvRP60Hc6K2aKSQ5XPwhO5Q
	oZPky3UEhTzlee1xLD7JRdJ6yFBkOx6jEs92u7/Wz6xzPe1DqhmveivurXvw8
X-Google-Smtp-Source: AGHT+IHeFMlXSx46kgj2mGmm2s+FVZdUv75gpdRiI0G2qUg1TRfKpYHwTU1r8OpfxsBvl4z+bJ2c3A==
X-Received: by 2002:a05:6102:6897:b0:521:b9f2:a5dc with SMTP id ada2fe7eead31-52b1bd27db7mr4067499137.25.1756818173284;
        Tue, 02 Sep 2025 06:02:53 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-52af19156ecsm4330939137.12.2025.09.02.06.02.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 06:02:52 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-89948e581d5so370068241.3;
        Tue, 02 Sep 2025 06:02:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUcOuV4O+2j6E+Ji6deJa4YdV3OD5bwJfTb9oNHCW8In2PIBsV/hbch62LzXczOhrmhQqAz67P4ghZW@vger.kernel.org, AJvYcCUyTqxSF2jHHXqt7MZlYRkYVcR9yLz9zka12T/E3uCtrh+GXjXFcPunmtGyJz6L1xqheVoI5kI4JjVG4Cf/@vger.kernel.org, AJvYcCWh7sYoC1GK3+jrVfeWgDfwl0rIqjnQ45QpWF8Bo4BFXQr3jgIQkOg9KxYkjQzRmYUKsEuWjYzdgw65XcR4AdnEIIU=@vger.kernel.org, AJvYcCWrq3NjG8EN3Jf4/2ov73ajSEffx0/5PsrQSUsJLiJ/JE4zHzHzuGA7EGenrBAYsvdNINWhCJXLlo8E@vger.kernel.org
X-Received: by 2002:a05:6102:41a6:b0:524:4800:77a8 with SMTP id
 ada2fe7eead31-52b1974d764mr3460088137.5.1756818170746; Tue, 02 Sep 2025
 06:02:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250901183000.1357758-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250901183000.1357758-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250901183000.1357758-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Sep 2025 15:02:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV+-WK3KQNfwrN30LFCGaWgRuRH4QOpMMC_6cko1bz3uQ@mail.gmail.com>
X-Gm-Features: Ac12FXz5m2aZjbNWA9iFlD5vRjuo_z4r9CPeIEsqREYEwOuiZsjA8GsB3kDnOYk
Message-ID: <CAMuHMdV+-WK3KQNfwrN30LFCGaWgRuRH4QOpMMC_6cko1bz3uQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: renesas,r9a09g077/87: Add
 Ethernet and GMAC clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 1 Sept 2025 at 20:30, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clock definitions for Ethernet (ETCLK A-E) and GMAC (GMAC0-2)
> peripherals to both R9A09G077 and R9A09G087 SoCs. These definitions
> are required for describing Ethernet and GMAC devices in device trees.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your patch!

> --- a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
> +++ b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
> @@ -26,5 +26,14 @@
>  #define R9A09G077_CLK_PCLKL            14
>  #define R9A09G077_SDHI_CLKHS           15
>  #define R9A09G077_USB_CLK              16
> +#define R9A09G077_ETCLKA               17
> +#define R9A09G077_ETCLKB               18
> +#define R9A09G077_ETCLKC               19
> +#define R9A09G077_ETCLKD               20
> +#define R9A09G077_ETCLKE               21

These five LGTM.

> +#define R9A09G077_GMAC0_PCLKH          22
> +#define R9A09G077_GMAC1_PCLKAH         23
> +#define R9A09G077_GMAC2_PCLKAH         24

I doubt you really need these, cfr. my comments on [PATCH v2 2/2].

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

