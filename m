Return-Path: <linux-renesas-soc+bounces-12599-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55370A1DA01
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 16:58:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB6603A3D02
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 15:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E6A14D6ED;
	Mon, 27 Jan 2025 15:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VjM9dDZA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A116660B8A;
	Mon, 27 Jan 2025 15:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737993508; cv=none; b=JnyaHaD+CQ3nMjwO8IrAPULbo3ereE/f3ICedrFw3pOj3nDcWFJ5fmFul5CigsHT/npaZ3myeqbgg/ZZyquSy2xmh5RgDzArdbe6ITqbF4dWYssFZMWqhH05afBy6UtOgjWTHW/uEyscEyh6gH+jXMFg3neqrQ/wkbR4fb+AMSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737993508; c=relaxed/simple;
	bh=sgn7B7gYKw4oRSChjpiRNU7Ip4Inh0W9b6zsPKwd9hM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FmHjj7ZQ5cpQzQuuIPt9jUHShjKeNdV3XGOopDxJQxeZhsTXMu1y9iZXBuLXjpbEnfP/cf4pf3ZEi9P/K6/70haoAnEy+wPWwoIth3eXY2u4lF28mnUQZg60WRHTWy9nQwUumTtmjVrjZoRX80sk2N+kqhVtp4i2pCXHMB6het8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VjM9dDZA; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5187f0b893dso1475020e0c.3;
        Mon, 27 Jan 2025 07:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737993505; x=1738598305; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrdPISaA88VM3tVAVhAjIRcAVMkAWcHxKvma6bQDGX4=;
        b=VjM9dDZAK1+BBRFhsdJWWajczpJelG7SJub4I950AQvniWCWM8Co655L6XdXeyMe0W
         ObdsLSvd6hSgbiYvEaBQvmFk2757SNW/c6zh71oPD0+36X0sh8t2OjE6Vo8A1CegM8ji
         NYqXby4lR+xknc0DadR7ieEK8cIVsVP27WbO6ik+VbErdInZ1VctiPvyQ+bRXSg1rwKF
         HY14h4ltunOYArXjzX196VxFSJPhda76tb95Fxjq33U+YD3lfAo3/Jh0JeAUS3ryr6dG
         rkLQuUvlaX3wOpGxvPyw9Tbibo+1P0ks81tUnXFaRE9Z90LENoOuES8mm2EYz9iKQYF8
         mFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737993505; x=1738598305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TrdPISaA88VM3tVAVhAjIRcAVMkAWcHxKvma6bQDGX4=;
        b=EtihSrBpVfrCctvtKKqak/HEMcvBNIioAfypS54yIZZCz9p7Dp1jszFGxyFbFjxQG7
         DddfHvVx8ezFRhvwGBy1Q/y5LdvCaYqZSNv0aDKVfkvTrj09IPCz6epbflI7z7O3n0a3
         wvJg3FM2dIee+TFM9EK882htlfDttuEhLzmbmor9lcUzI1qBYyFPmm1LUSQhDQQTInzL
         ZvIXzSDnzk2Gg+js0xPGEg1EgDvO32vALHalkdtyiTPEJkPfw5BuYhdf4TM9cSiB6a85
         j7BISonektttL0ou3cXWmc2qctwnWGF++DZ7t59GJwG2QOQkPVYT/CUw2dsDJ5ySiM5s
         A71w==
X-Forwarded-Encrypted: i=1; AJvYcCU2Hpef5jB+Ms0Fs7Myt4uAaz1/SvQjxlHWoSO/DH10E/kl5jcIFAvUZzkTITwlSbmT0RufBi/fm/A=@vger.kernel.org, AJvYcCU2shHMg+LMUh/ohxktnJSJEC/KDQesRvuncXiKeyrCr4h0i+pAlfCuKOaPM5/jVOTvNKZgsCLmz2Cnpu4n8pSYqjM=@vger.kernel.org, AJvYcCV2uTYtM6I+kmdT5oiADTw5tFJBV9PBq9zXCWnLGuI1W3N4699j0yRDoAEP7lnX0ddImuZskYapbhagye2g@vger.kernel.org, AJvYcCXsYmgH2qCn14HwbCb/LG9Qngm+ihr05ns7RRRhfncZse7vlM6vs1LFKTkMq4swAR6ufTB7l5+l@vger.kernel.org
X-Gm-Message-State: AOJu0YzvMhbYm26Q8rOY9+mD/hPGhV6QVKJJ4/8d7JsGIcH44UB9k2u2
	35Orzq0Ut0VsVCgLrJF3wkU6PjoJBYMRxvpffq8jZMZ7dydb+//9OMB9KQnnYCEgcKu/RUE21m1
	h5su4NalSdMEbKFZ6RloJWBXM4oU=
X-Gm-Gg: ASbGncsT3++CBnMOHpoBAb4CptXE2XzLgeFiwQ2V2pFHhy8awHD9ckDDK5krXjiJXW7
	jLnGM0Ab8roTT1RMQ6ye/nrxTRcVcDQ6FvBR9rSFBK5qmv6/roX53TwVU4dBOdQ==
X-Google-Smtp-Source: AGHT+IFewEgzh+navCckBdb7lL+wzy5gFVB2RdeBSc6PAtpESEp7ykvGRV8OwGhoOa5sYl9xq0BHhqbVkNkj6TSnp84=
X-Received: by 2002:a05:6122:4887:b0:51b:a11f:cbdb with SMTP id
 71dfb90a1353d-51d592bcc7amr39968496e0c.4.1737993505400; Mon, 27 Jan 2025
 07:58:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122100828.395091-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVP8LrqAYK7sPJqiB+Fagk=CrhSwX1CixKOxoiGgyDEoQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVP8LrqAYK7sPJqiB+Fagk=CrhSwX1CixKOxoiGgyDEoQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 27 Jan 2025 15:57:59 +0000
X-Gm-Features: AWEUYZn7naazeV0KeZB-JQnjTKvmJ64OyQblw-v_fwKe0kUX2om_A9-SNmN0UYk
Message-ID: <CA+V-a8tQOGeahv37ikq9Re6_4Hqdo5XbfQOv_KMf6pw9UsidZQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a07g043: Fix HP clock source for RZ/Five SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Thu, Jan 23, 2025 at 8:29=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> Thanks for your patch!
>
> On Wed, Jan 22, 2025 at 11:08=E2=80=AFAM Prabhakar <prabhakar.csengg@gmai=
l.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > According to the Rev.1.20 hardware manual for the RZ/Five SoC, the cloc=
k
> > source for HP is derived from PLL6 divided by 2. This patch corrects th=
e
> > implementation by configuring HP as a fixed clock source instead of a M=
UX.
> >
> > The `CPG_PL6_ETH_SSEL` register, which is available on the RZ/G2UL SoC,=
 is
> > not present on the RZ/Five SoC, necessitating this change.
>
> While the register is not documented to exist, it reads back the same
> default value as on RZ/G2UL, selecting the right parent that does exist.
>
Yep.

> > Fixes: 95d48d270305ad2c ("clk: renesas: r9a07g043: Add support for RZ/F=
ive SoC")
> > Cc: stable@vger.kernel.org
> > Reported-by: Hien Huynh <hien.huynh.px@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> > --- a/drivers/clk/renesas/r9a07g043-cpg.c
> > +++ b/drivers/clk/renesas/r9a07g043-cpg.c
> > @@ -138,7 +138,11 @@ static const struct cpg_core_clk r9a07g043_core_cl=
ks[] __initconst =3D {
> >         DEF_DIV("P2", R9A07G043_CLK_P2, CLK_PLL3_DIV2_4_2, DIVPL3A, dta=
ble_1_32),
> >         DEF_FIXED("M0", R9A07G043_CLK_M0, CLK_PLL3_DIV2_4, 1, 1),
> >         DEF_FIXED("ZT", R9A07G043_CLK_ZT, CLK_PLL3_DIV2_4_2, 1, 1),
> > +#ifdef CONFIG_ARM64
> >         DEF_MUX("HP", R9A07G043_CLK_HP, SEL_PLL6_2, sel_pll6_2),
>
> When building with W=3D1 on non-ARM64:
>
>     error: =E2=80=98sel_pll6_2=E2=80=99 defined but not used
>
> so sel_pll6_2 [] needs to be protected by an #ifdef too (or __maybe_unuse=
d,
> but the rest of the file uses __ifdef).
>
Agreed, I'll use #ifdef for consistency.

> > +#else
>
> The rest of the file uses:
>
>     #endif
>     #ifdef CONFIG_RISCV
>
> instead of #else, so please use the same construct for consistency.
>
Sure, I'll update it as mentioned above.

Cheers,
Prabhakar

