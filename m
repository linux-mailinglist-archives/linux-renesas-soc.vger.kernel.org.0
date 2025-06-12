Return-Path: <linux-renesas-soc+bounces-18196-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF49DAD744F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 16:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6482B188B3B9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 14:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E995924DCF0;
	Thu, 12 Jun 2025 14:38:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE5C24DCE4;
	Thu, 12 Jun 2025 14:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749739089; cv=none; b=UAwRMNdbDTxZnoBxUpcdN6bTPaaLpyc7f9OBrVGFbTxztBPk17ffOGyR97WE/OQakcrgjV6swCM4VXUHcUKN3ivOcGcSyZ2fvVgZPYwMFTc8A9Ysd1gs2618PiEcFr5njOXYYiI/FqsRWzkaWWZwj49E2tyGSU6WpE52FHn+nfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749739089; c=relaxed/simple;
	bh=d57bO7+sI3f5axm470jL8jsx7sU3KPfN5AVP2Vsa9o8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jcROjtD+kvay7IPO90NlVciQ3vRZgvimXdD0szIOrCeZgd44qAi7GMSGzI57kxaVRiKGKOVvcQlQC463192kBkSnjFzNDv4Hfb8ENTU6v2lw0fdNIBW4L94RLNAbkqim2p5eKRvGibhQAlhJtyUA+NmAmWGfRE3OMZxZtniPUSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6fac1c60e19so23984206d6.1;
        Thu, 12 Jun 2025 07:38:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749739087; x=1750343887;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8KRrsnoLIUPr6EswSfiL1UFN7UpyDrO5Rx9RE3EdW4w=;
        b=FaJY4j9TuQl5RG2FsFXE+Gk4nXLH9rrv/KZO70nr6tyZOq5XPS4yY+CvLpTgA8pN29
         Gj+8hCc8fad1LY517/pSUzUEu16G2hVAeZW0djYZnZfFH2ywcCY1qUQ0RmtbiJPys/zx
         zgkUv24AsSRZWvLyNYPZ/5rAIu46Y6Z6gF4jLGiyJvMejgYZF4vBrx6emsm3+MNnS68V
         9ZNKMUMWe4uub5EpkviehTcAQjdldsXn+H/2PytRzCQHsX5N4x53PWueJT00ww/rCCgB
         JYRop1XjDNJqhLsqqxsNpmuPbAMLTX/jIFyB6ERdx59rJxcjxUhIdn8Jjkxrsjyumepz
         eBhA==
X-Forwarded-Encrypted: i=1; AJvYcCU4Ik9lLWWf7hmNo9wirgUg3NQPmb7virRDWMOQv02XRpSpNrl3Ah8LQasMZSeCaVdTX/AaWgiqvxck9S+J8hcxesc=@vger.kernel.org, AJvYcCU6NpJKvyxUKmhE3MY2UnKEIAeDA4FgMatochB2jqapMnxel2NQ6SX8BRSbxB3UrdoJs7G/fN0hTU8v@vger.kernel.org, AJvYcCVKKk8y3gMbohjlZ3NR1PnEA848g0mhsVwIutstCDIyuFsl/IdXiLubVYto3t09H873gT7Czk4jG63kNAdj@vger.kernel.org, AJvYcCWEzqmu+9QyS37iDhJtC5F+nAdJiR/B+dtxSK4LylWBoi1NtyZkHbOqyZgM+0JSqPdSXS13sr4Bwtpa@vger.kernel.org
X-Gm-Message-State: AOJu0YziSjuURUImuf73GtfgGq5IZXffzhYPkW/gPdyrnV9P2z7txTxJ
	V6b2ldTVcM0DpU2tG3a9Ymi/3Ei1qqxNalvZcVMbSX3cOI/VqSRP15BllcVe9Jp8
X-Gm-Gg: ASbGncuZtegOeVDTKVxDT17ruKk/ps93iPtfuriduwNA3gaXuUO5pzo3k2sUPI+ZRNm
	3aX3F3CxTQREQNCuxZ+1+7kRJrNk0tlW1jsCoUlisC1a4TKKNXY9AjbTJY5VXF1qlqz2NK9WXc1
	5wFTj47QBq+o1rYIUW76LSNqEKwX2W0ce5k+VIsssxcOi96YGyNtF/n9isWlu/NzGfex0t0U1oN
	D9CffnqxRPk0EIUQ7ckWjwc/lmMneVAX3BmSAXa0wy5oQyf+bBpuXf2mDpiI4MZynnDyELpVoPu
	TK/q1JbZHxONcurqDSie7674SeHEFqlXUcOuQOeYtD2tVr5dsefbgaPcbG5/rnIAwTWcp9V06gp
	Z0klhaB5FQOjGQqfnT1DrAhVT8YcK
X-Google-Smtp-Source: AGHT+IG6+vNY+ubkPMACJinyBggXaxM/qRffhL70afwG33dCHN9HLRiN3vTVk+wBNEqvtldS7IF7Zg==
X-Received: by 2002:ad4:4eaf:0:b0:6f8:c53f:48e with SMTP id 6a1803df08f44-6fb346906ddmr64996546d6.0.1749739086605;
        Thu, 12 Jun 2025 07:38:06 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87f01243001sm313530241.5.2025.06.12.07.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 07:38:06 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-53125ca7837so607100e0c.0;
        Thu, 12 Jun 2025 07:38:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUk2cBh30rNZ5TY3d+F9W76ATjkt+PtZsQyUzJIv7xvVkvqe3XIr6aQXPJa7gL4cZqdl1UlIFGv/uXW7GPR@vger.kernel.org, AJvYcCV3x2KmbudnN3ecPGxDkVEfckjPBEtBJ4irxq4DchL6BWGQZURGAjvLFKwHRfvVLv6H1ZVrsWqOGGzi@vger.kernel.org, AJvYcCWmg3JkkY0CxRN5ua60pl6UxmG5+cf3Aam0Jp1tU525QfjzdDcKa/bGF73gfA1cpswiclgY6OO740AnejKYkN+w6NE=@vger.kernel.org, AJvYcCXp/nzy5AlKIraBSeS4xUUPUmxAUfH2fwbSQT54tKEHYz8tvL/MEr/1r4o4kU8fvzKDYOIyPN9Zgz+o@vger.kernel.org
X-Received: by 2002:a05:6122:10e8:b0:531:188b:c1a0 with SMTP id
 71dfb90a1353d-5312dbf04fdmr2459867e0c.4.1749739085776; Thu, 12 Jun 2025
 07:38:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609203656.333138-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250609203656.333138-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250609203656.333138-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jun 2025 16:37:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVvQEC9c9wHDrFiY6iixuP-JjOgHZQjfzOkAjvxs=LuqQ@mail.gmail.com>
X-Gm-Features: AX0GCFtXGUm6FdOJ-AEd9AVkQ_jS9IKzDw3GxgkbzroMqYUK_DU_l-DVn0YmK8w
Message-ID: <CAMuHMdVvQEC9c9wHDrFiY6iixuP-JjOgHZQjfzOkAjvxs=LuqQ@mail.gmail.com>
Subject: Re: [PATCH 3/8] dt-bindings: clock: renesas,cpg-mssr: Document RZ/N2H support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

Thanks for your patch!

On Mon, 9 Jun 2025 at 22:37, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document support for Module Standby and Software Reset found on the

the Clock Generator and Module Standby and Software Reset

> Renesas RZ/N2H (R9A09G087) SoC. The Module Standby and Software Reset IP

Clock Generator and ...

> is similar to that found on the RZ/T2H SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> --- /dev/null
> +++ b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + */
> +
> +#ifndef __DT_BINDINGS_CLOCK_RENESAS_R9A09G087_CPG_H__
> +#define __DT_BINDINGS_CLOCK_RENESAS_R9A09G087_CPG_H__
> +
> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> +
> +/* R9A09G087 CPG Core Clocks */
> +#define R9A09G087_CLK_CA55C0           0
> +#define R9A09G087_CLK_CA55C1           1
> +#define R9A09G087_CLK_CA55C2           2
> +#define R9A09G087_CLK_CA55C3           3
> +#define R9A09G087_CLK_CA55S            4
> +#define R9A09G087_CLK_CR52_CPU0                5
> +#define R9A09G087_CLK_CR52_CPU1                6
> +#define R9A09G087_CLK_CKIO             7
> +#define R9A09G087_CLK_PCLKAH           8
> +#define R9A09G087_CLK_PCLKAM           9
> +#define R9A09G087_CLK_PCLKAL           10
> +#define R9A09G087_CLK_PCLKGPTL         11
> +#define R9A09G087_CLK_PCLKH            12
> +#define R9A09G087_CLK_PCLKM            13
> +#define R9A09G087_CLK_PCLKL            14

The RZ/T2H DT bindings file lacks PCLKL, which was probably a harmless
oversight (it can always be added later), as it does exist on RZ/T2H,
too, according to the documentation.

However, given drivers/clk/renesas/r9a09g077-cpg.c has
LAST_DT_CORE_CLK = R9A09G077_CLK_PCLKM,
using R9A09G087_CLK_PCLKL will lead to wrong results.

So either you want to add R9A09G077_CLK_PCLKL and update
LAST_DT_CORE_CLK first, or set LAST_DT_CORE_CLK to R9A09G087_CLK_PCLKL
in this patch.

> +
> +#endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G087_CPG_H__ */

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

