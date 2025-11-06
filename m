Return-Path: <linux-renesas-soc+bounces-24254-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1138CC3BC16
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 15:32:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5C4644FCB3F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 14:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC3A32E728;
	Thu,  6 Nov 2025 14:28:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A851DA60D
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Nov 2025 14:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762439324; cv=none; b=oHC9B6cOoyYX6OApwEjxvDXrmlsonsjgAJPRLm16lXU0QVu5K0jtb0nPfaEHzruYnZulOBe1sUOuCG52u0qK2rAbbLyTGesX9SMCveGwS7cE7ragh/z65CxD3aqFIjeGFepjeQbgKx+5AV5Sib/SQPwmWwp8f4lTjHZnW0l9ICI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762439324; c=relaxed/simple;
	bh=3lgjqrw9oTLBZNzeCWRnYqfLBcostxc+8B8DcxRaSTo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jCbg6VDpMMMXSrLcW39jwEtJRqyMgdxZuBixUOVtSETclynS70ZXLJf4mzCksMDDT4raG4kODzLBDGMOB08owesXC+ZovifGankDByKmWaQIOwPXjih50tNWp2JBDF2B5CQiwjAoqyXgRBiSeZCazg7c4aiQG7YqZRx1bZAorzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-640f8a7aba2so1509592a12.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Nov 2025 06:28:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762439318; x=1763044118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aFuhrM5Zx5faMXjiCvShw5ZF0br2pRJWjGUrf3CbngU=;
        b=wTqN5ZAHN/Xd+CySfxnd7wQ926MZq/nE9U+/uH6Pe7n84RJTWy0uKbuNIfvblkhSLe
         iNlkjF6JvMbZC2EYTlP4UaoxVWxhfwCmx6CMSARdZWoFZz2eEbHLc+IpGm8NKTl2z5vl
         4mMN4qZpxxJB/7KHIzzlUTJcKkmMhkpRx6mIflkEaEprDUFZhWtAeX4NO+ktnTccbZ+s
         t8+YWK7mna8XmE/ZTuwSPHljO7a3D64ro0DmMtQ6U2TmiNHNDZaiDB0XOf8Dk5wXHFTf
         fFFxuU5QYxdZOm0T0vx9bzpmGSFBzTzSKvcbsQfO3WYkIxYiN8S4Xn54wUPRWwnsC35X
         Yo4g==
X-Forwarded-Encrypted: i=1; AJvYcCXA26f8el5ANf3wT/rmxgNbFBv7u8xYEIhucobUgJSRkKPwCBuMC80n1z56YYRvT+X06gPGRVdCrt5hYi02CUuU9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxK5Vj4nyfC1vwMwM1J6WowQfMDX4WRnfbi4jUCGgs0pWOlhM9O
	MC+GS4TEJ3YT2BRco795PjJgM4ScPrYF+W4iskYuCMm5yDFiEQCyfbJ1sh3OesmhtjI=
X-Gm-Gg: ASbGncvhjMLLjxWdAZgMBuGZZB09RiZvdFaTJ/UnDfbLb0ykkcWmoIH1g7PUQQkhwtP
	Yw80W36r3o5Tjbg/NDp4UbVhcSz3PN7AkH2WnuuebIrZOuIH6BJrNUBk7ft4cGFW4EwZnK8jnLx
	300wRZ78Wn9v7FaJfcGqyj66Acr02L3IiwHa3RhRn9VlJ1ArPvHb+za4z/kgJ4slC3ZKX5KMEP6
	oheevDlXZFfg1pG+C8e00Saa6IBNVI6LXDDoC1OsYIXXrj+tFyAMm+r83xjfzteW6qRwP0KAmof
	23F923j0KzyRC6VT2lqOGgTg/S2FgU6p9FHMIFFCWDQEK4WAq4ZFsMTwFMBSdJQ6HTSu6q80qy6
	mHwiax/b5ZUxEeXIvfBsJH5N/IwSKCfHRTXt/BYUTPoG/Wfl5oA/TRLC5F9VtoAlCYwSpzlxs5+
	7YecBsC5KrlsomEqWiRIWjFb+PLz8qx5QcGxJ9wg==
X-Google-Smtp-Source: AGHT+IG/d0dfnrxjFx/+i7VjgWim97+G8JofXIPz4wTVbi8KVr7lRH6HnFwiY5ePZ3D9D7BZTBb+xA==
X-Received: by 2002:a05:6402:1472:b0:63e:7149:5155 with SMTP id 4fb4d7f45d1cf-6410588c724mr6381437a12.2.1762439318226;
        Thu, 06 Nov 2025 06:28:38 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f862cbesm1910709a12.31.2025.11.06.06.28.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 06:28:36 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-640bd9039fbso1741457a12.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Nov 2025 06:28:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVWm4406lx+8jhu1DkQsM/zvI1WAHrObbJkr2Z06rY83mByAb/xJ+r6V0cMOYDMXuO+jiMZRk4hZFEGZQTV3GROTQ==@vger.kernel.org
X-Received: by 2002:a05:6402:510a:b0:640:c918:e3b with SMTP id
 4fb4d7f45d1cf-64105a58158mr7216116a12.26.1762439315884; Thu, 06 Nov 2025
 06:28:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251105231815.1927239-1-niklas.soderlund+renesas@ragnatech.se> <20251105231815.1927239-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20251105231815.1927239-2-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Nov 2025 15:28:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUZCakYhCCZGW5Z8-GrfNR5QYAGHSEZD1PvkBt+5SjbLg@mail.gmail.com>
X-Gm-Features: AWmQ_bmsJvzm6kKqBB7MkT_bl8ohnK3R2hPjSvFu5w5eS7KUaBTh6zw_38RYicg
Message-ID: <CAMuHMdUZCakYhCCZGW5Z8-GrfNR5QYAGHSEZD1PvkBt+5SjbLg@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: r8a779a0: Add ZG Core clock
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Thu, 6 Nov 2025 at 00:18, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Describe the ZG Core clock needed to operate the PowerVR GPU.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

> --- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c

> @@ -35,6 +35,7 @@ enum clk_ids {
>         /* Internal Core Clocks */
>         CLK_MAIN,
>         CLK_PLL1,
> +       CLK_PLL4,

Please preserve sort order (see CLK_PLL5 below, out of context).

>         CLK_PLL20,
>         CLK_PLL21,
>         CLK_PLL30,

> @@ -98,6 +103,7 @@ static const struct cpg_core_clk r8a779a0_core_clks[] =
__initconst =3D {
>         /* Core Clock Outputs */
>         DEF_GEN4_Z("z0",        R8A779A0_CLK_Z0,        CLK_TYPE_GEN4_Z, =
       CLK_PLL20,      2, 0),
>         DEF_GEN4_Z("z1",        R8A779A0_CLK_Z1,        CLK_TYPE_GEN4_Z, =
       CLK_PLL21,      2, 8),
> +       DEF_FIXED("zg",         R8A779A0_CLK_ZG,        CLK_PLL4_DIV2,  2=
, 1),

ZG is not a fixed clock, but has a programmable divider through the
FRQCRB.ZGFC register field.  Hence it should use CLK_TYPE_GEN4_Z.
As currently drivers/clk/renesas/rcar-gen4-cpg.c:cpg_z_clk_register()
supports only the FRQCRC(0) and FRQCRC1 registers, you will have to
extend the offset-to-register mapping support for that, too.

>         DEF_FIXED("zx",         R8A779A0_CLK_ZX,        CLK_PLL20_DIV2, 2=
, 1),
>         DEF_FIXED("s1d1",       R8A779A0_CLK_S1D1,      CLK_S1,         1=
, 1),
>         DEF_FIXED("s1d2",       R8A779A0_CLK_S1D2,      CLK_S1,         2=
, 1),

> --- a/include/dt-bindings/clock/r8a779a0-cpg-mssr.h
> +++ b/include/dt-bindings/clock/r8a779a0-cpg-mssr.h
> @@ -51,5 +51,6 @@
>  #define R8A779A0_CLK_CBFUSA            40
>  #define R8A779A0_CLK_R                 41
>  #define R8A779A0_CLK_OSC               42
> +#define R8A779A0_CLK_ZG                        43
>
>  #endif /* __DT_BINDINGS_CLOCK_R8A779A0_CPG_MSSR_H__ */

This should be a separate patch, so I can queue it in a branch shared
by clock driver and DT source files.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

