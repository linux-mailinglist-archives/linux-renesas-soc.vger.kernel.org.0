Return-Path: <linux-renesas-soc+bounces-5841-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 197DD8FC41B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 09:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A13A22870EA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 07:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9A2169381;
	Wed,  5 Jun 2024 07:06:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9275190490;
	Wed,  5 Jun 2024 07:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717571165; cv=none; b=YL0BaVK/Q8nMTXrN6HCOKPVvhUOiup+Ty1NxQ2PaqNNgl3YxyfrB9IiRzznVAotyw4j+7X3JnqTJw865rX1xLQpwARDNcWTcZ5OontRzlppqCM8+At+rJl9c5g5stdAvrahl9pibiYcOhXWFaSZnPja0Xm9DdsPKBhGf0SslohA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717571165; c=relaxed/simple;
	bh=3P3Z51rM5sKotlnemHyjU9DNykQ+aGDBrA2dU1YKqDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qRVJHf1k1seJPogzmdtZSTVxMAhrBTrVfMd+dl9qBftFEHlKwAlAGJYOCS7YNQYamgqpO/QzH9KtES/cVKyLdaK7wYiCN+/aBcOIHgxmPUCeucH4dSR3PMKLywC8rEHl1Ei3nmq53tLnCtHTlFHf62I4O1h5E9NbyUjoha2g5aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dfa7797e897so5234079276.2;
        Wed, 05 Jun 2024 00:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717571162; x=1718175962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+dVbe12Y5x6YayWqHWzVXsec7wdwRPrKL/OhcN1TqKU=;
        b=bz+vlxkH3AF+TzleYIRbaGLSQLhFmAm1YJxTYPRJx6t/MlwqPLwf0kzsMtJINjORyq
         19wxa6eGcnZGiR97R5lsxhD2j8RYRhklWCEIlmh5adIKl0kbXhjZbgpYkgMGB5rtYbcV
         JXO5EalkIorE+FUvsCdgaRHR77DzDSnHaO35iEkjbCIY+N/SJmwFokW+StULLOgt+SKQ
         Z/R7lfDRo3s0+1dnq9NQCY3Mwf7mAlwX9MaoViCgVVFq9QkwkHpWiNDvc6NeYunDk9fg
         46qsmzwzCEpmDQCfrcTECESgRNIwmBiOuxfBHrRRq18Cvuh1CHK7nXxa6gjs2rDx6/AJ
         gZzA==
X-Forwarded-Encrypted: i=1; AJvYcCX0Q6mdBHSzrRYTwuM9UksnTNGRBr5CEDKMbOp025z17g21YYDIy9KlLGPWW5S/+gsxyn93W+GOqAzg0RibbsO7ntK7NX46jxwJmBFRzKXbNV0oJHkyS648yc1/frl4qUoRdP376JfkYpbXPv2ZBNeNu3rBDb2z+MX19Menkf2C5Fa8pnROWeMME8SojSab0VfEh1J2vndOhcrmSYOqewb7WmqA5OKW
X-Gm-Message-State: AOJu0Yy6txdqmq09UN/deqeyBy52ZzG4rlUS7k6B8e70mYUKnNh0urmU
	PVaWu5haXWn/FGT+9PVtGKw3rYQnUHhXyrfCjkj7gn2D5gFH3KtCmzh/SiUO
X-Google-Smtp-Source: AGHT+IF+4K4GiD9FLrZDcO1EK7onQlPCjwzUpFPd/3a2hDmvd+glyho7/c9js2SholDtsaq9tedh5w==
X-Received: by 2002:a25:abae:0:b0:dfa:b351:bea5 with SMTP id 3f1490d57ef6-dfaca9b937fmr1687957276.21.1717571162201;
        Wed, 05 Jun 2024 00:06:02 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dfa6f11f7cdsm2459988276.46.2024.06.05.00.06.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 00:06:01 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dfa7faffa3aso4937853276.0;
        Wed, 05 Jun 2024 00:06:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWUkDMrfIMU/Q2R/g9xHfrRAc0s6e/EPOTrow6/z5RnvA33C1FnA2bNV5AW/1ElnfPq3FtVQ/u9RaOAsk9nko69tliXp+55+GJmcezdKxnHlwVIeY9GbB/rJ9olCZqr8CjMv/O36ZqUGQL+6bfYyLGBX9IG7HHHpHvRr4Ufo0uEbWoVrHdSVOIyjlOUXnE8QeHKh77kL0nx5KwcKbnHrFfg6fzU5X3k
X-Received: by 2002:a25:b8a:0:b0:dfa:49bc:6415 with SMTP id
 3f1490d57ef6-dfacac439b1mr1592412276.52.1717571161019; Wed, 05 Jun 2024
 00:06:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240524082800.333991-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240524082800.333991-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240524082800.333991-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Jun 2024 09:05:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXk+u0J9GQrGHa_yMgBtkrhCNtGXdWmfsmVt3UskNMMug@mail.gmail.com>
Message-ID: <CAMuHMdXk+u0J9GQrGHa_yMgBtkrhCNtGXdWmfsmVt3UskNMMug@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: renesas: Add RZ/V2H(P) CPG helper driver
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hii Prabhakar,

Thanks for your patch!

On Fri, May 24, 2024 at 10:29=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add RZ/V2H(P) CPG helper driver.

Drop "helper"?

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> --- /dev/null
> +++ b/drivers/clk/renesas/r9a09g057-cpg.c
> @@ -0,0 +1,112 @@

> +static int pll_clk1_offset[] =3D { -EINVAL, -EINVAL, -EINVAL, 0x64, -EIN=
VAL,
> +                              -EINVAL, 0xC4, -EINVAL, -EINVAL, 0x124, 0x=
144 };
> +static int pll_clk2_offset[] =3D { -EINVAL, -EINVAL, -EINVAL, 0x68, -EIN=
VAL,
> +                              -EINVAL, 0xC8, -EINVAL, -EINVAL, 0x128, 0x=
148 };

const (both)

Both arrays are very similar: all valid values differ by an offset of 4.
If that is universal, perhaps the second one can be dropped, and
the offset can be handled by the user?

> +static struct rzv2h_mod_clk r9a09g057_mod_clks[] =3D {

const

> +       DEF_MOD("scif_0_clk_pck",               R9A09G057_SCIF_0_CLK_PCK,=
 CLK_PLLCM33_DIV16,
> +                                               0x620, 15, 0x810, 15),
> +};
> +
> +static struct rzv2h_reset r9a09g057_resets[] =3D {

const

> +       DEF_RST(R9A09G057_SCIF_0_RST_SYSTEM_N,          0x924,  5, 0xA10,=
 6),
> +};


Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

