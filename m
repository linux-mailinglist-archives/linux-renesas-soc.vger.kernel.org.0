Return-Path: <linux-renesas-soc+bounces-23702-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E22C11785
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 22:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D5E040243C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 21:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D9A325481;
	Mon, 27 Oct 2025 21:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghoEx6N+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C93328313D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Oct 2025 21:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761599115; cv=none; b=h1KMPliNrQS+e0i3mu3+pAwH45ODnpDSTCHONIhcNr5MOW0XNrXMP/84higEoI6tA/e3jU9kcI+bhG2+7J1BOgnc4Rj7hxj0raCwdCpxK/6zKNj5Yqey6AB2LzZ9T6zYEMx/Md7OwMYDMfCcm3kHW3jLXOlvFR8r+pcPzcsZ6MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761599115; c=relaxed/simple;
	bh=XIDl/ERO9aKNyZxFoRMGRXdIovseLN8Xy2xPzQVYRgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OqpfSjcqMHiuAnOvPVKhG49yE3XNMTbGnRzThiAGlDVXEg+Uep4ivm6LcIkdbSS4UXf+RUs5ja7u2fYlqyiNsmGic4Q1sRsg0kvZfgDGltjJkGzlsrESPbZmoSiU0qzYAC3BAOxrVaU02dir/gENwrabjRrbOEWDf4prjppG0EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghoEx6N+; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3ee64bc6b90so3824762f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Oct 2025 14:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761599111; x=1762203911; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BoP6sWXXFNGFX4Zpq9+V9L/LMjEEOr7rE32h6+1IRjs=;
        b=ghoEx6N+UTJ262ic2N/Gf8mx2wyMC1iHx3o3Wl14zxTLiw/ZdGXPNGh7R0Sbl6Mq3w
         WVxl89hJDpR3uL9qrAREUeV1PsUPryL5UKbsPrTqQfdyqkgQKAxGwr/8TFWJYoEemRg4
         wbCrdVEC9SER9akg8ocru8R2dLPNSPLU26v7N67U4S33wmVYHaJ8TH8J6wV4VgOMLlBZ
         PIaYaCtweQOKyC56/LRlRDVMZPCAGlbgxD1gcMgbrWGc4ehZuTpUwP41j23ijgB0sw54
         BcMaMxFz2ihBGuDSe6qusxVwE8wfdTF9d3Pz9Wlvr4CjbqOpVqh8z/MdDJ5xiGxQFucl
         Y4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761599111; x=1762203911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BoP6sWXXFNGFX4Zpq9+V9L/LMjEEOr7rE32h6+1IRjs=;
        b=k7bYWQDwfUjLcD+bh7HgYuCAT/Pf++Ovio/PkbZVsVhYubF1FeYmwNVtv8DJT2viiP
         xMb2OeU+IwQ525qZkpQVCFVGwIxd/JtYOV9XEvBgL39f1cg/Himt1bAfK4bsOXH5ZDvA
         L+HXH3urewqi7JyXsBoxO48Yr8eLZoGLyc8beKd+pZIzckhR0h1qfTMN1R3ReXshpnEh
         h6PJzLWd5/RRrso2J+FZGMM8N0FHZaIWsow6tjt85H1yD9s/EneU2QgEs8g9lr6nyxUa
         PlyO5dtC9ZCRHDNzIr3YmiByXqE8GGK8yRQ+7wfoF9ILpjy7jQUi4G21RzDTxnnJG5Us
         oujQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVWreyMfj7s+AobogMLLE07fKOgqHgsUdLkkIzdkarPqDqWcJFJgNCNQBytnctesGMqQu3yfy9EKf3KHR9wOzHpA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdi6Df9dzi5UPAniUjait0dFVXTrfTKZz/uiF6Q812tHlqEk3A
	AdxMf8+Um+vUo2dmfTMccNlhnoPFSKXomJnThipTr0RI2Nwif5VkMunpQUEnME+D4tzyxRJljYY
	VDVThXXaoITUGgX0uiSzMNDSXwTIvxTc=
X-Gm-Gg: ASbGncuqxImOBwfObPXMEuVfU1iShCtbRl98jbJHCZPLLfx/qhEPp8F7ZpSkiP36tr9
	KN0kBsFHSqTLncFNUlnJ21T3i81xwhN1PEucXRXU0792WIMLxRlFal0N6RcHyAEaUKkhFBp4z1o
	C+wfaIPt0g4fHdN77K9yKeV5xQSgAfvCaDj7u9tA4Z7u7shtiSJINXZIrSEQFNuUBMA6L0kdtxl
	+jdgKRGlKXKb6+Hb+1EKDKfyg4pUDCMz8xQLYfk+s3vrKsH9qu049xa/l1T
X-Google-Smtp-Source: AGHT+IHk2BlyZjRFVUILloQdhusl5C3XR9jf4ug3ST318DPm7lP7GrQepTteSylu4Lm1lrHkxRCafckMptsRpnQAp2c=
X-Received: by 2002:a5d:5c8a:0:b0:429:8d46:fc40 with SMTP id
 ffacd0b85a97d-429a7e4f541mr1140944f8f.25.1761599110650; Mon, 27 Oct 2025
 14:05:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014151325.160062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251014151325.160062-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXU_aOg+bfRBJ7UOQW59QUxqa4a7WXTj27RyCyiNHV8qA@mail.gmail.com>
In-Reply-To: <CAMuHMdXU_aOg+bfRBJ7UOQW59QUxqa4a7WXTj27RyCyiNHV8qA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 27 Oct 2025 21:04:43 +0000
X-Gm-Features: AWmQ_bnLKxvnu2wt9shyDeaA5MSq9GtqCcfZY2URt6Hj7wb0HhH2yB8dTxpJ5hg
Message-ID: <CA+V-a8soq2HJD0dM8GPhprpd_tyW735MSC-FkHwrY6wb-dqTZQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g077: Add xSPI core and module clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Fri, Oct 24, 2025 at 11:08=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 14 Oct 2025 at 17:13, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add module and core clocks used by xSPI (Expanded SPI) IP on the
> > R9A09G077 SoC.
> >
> > The xSPI block uses PCLKH as its bus clock, while the operation clock
> > (XSPI_CLKn) is derived from PLL4. To support this, define new selectors
> > and dividers (FSELXSPI0/1 and DIVSEL_XSPI0/1) in SCKCR.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/clk/renesas/r9a09g077-cpg.c
> > +++ b/drivers/clk/renesas/r9a09g077-cpg.c
>
> > @@ -105,6 +113,15 @@ static const struct clk_div_table dtable_1_2[] =3D=
 {
> >         {0, 0},
> >  };
> >
> > +static const struct clk_div_table dtable_6_8_16_32_64[] =3D {
> > +       {6, 64},
> > +       {5, 32},
> > +       {4, 16},
> > +       {3, 8},
> > +       {2, 6},
> > +       {0, 0},
> > +};
> > +
> >  static const struct clk_div_table dtable_24_25_30_32[] =3D {
> >         {0, 32},
> >         {1, 30},
> > @@ -119,6 +136,7 @@ static const char * const sel_clk_pll0[] =3D { ".lo=
co", ".pll0" };
> >  static const char * const sel_clk_pll1[] =3D { ".loco", ".pll1" };
> >  static const char * const sel_clk_pll2[] =3D { ".loco", ".pll2" };
> >  static const char * const sel_clk_pll4[] =3D { ".loco", ".pll4" };
> > +static const char * const sel_clk_pll4d1_div3_div4[] =3D { ".pll4d1_di=
v3", ".pll4d1_div4" };
> >
> >  static const struct cpg_core_clk r9a09g077_core_clks[] __initconst =3D=
 {
> >         /* External Clock Inputs */
> > @@ -154,6 +172,15 @@ static const struct cpg_core_clk r9a09g077_core_cl=
ks[] __initconst =3D {
> >         DEF_DIV(".sci5async", CLK_SCI5ASYNC, CLK_PLL4D1, DIVSCI5ASYNC,
> >                 dtable_24_25_30_32),
> >
> > +       DEF_FIXED(".pll4d1_div3", CLK_PLL4D1_DIV3, CLK_PLL4D1, 3, 1),
> > +       DEF_FIXED(".pll4d1_div4", CLK_PLL4D1_DIV4, CLK_PLL4D1, 4, 1),
> > +       DEF_MUX(".divselxspi0", CLK_DIVSELXSPI0_SCKCR, DIVSEL_XSPI0,
> > +               sel_clk_pll4d1_div3_div4,
> > +               ARRAY_SIZE(sel_clk_pll4d1_div3_div4), CLK_MUX_HIWORD_MA=
SK),
> > +       DEF_MUX(".divselxspi1", CLK_DIVSELXSPI1_SCKCR, DIVSEL_XSPI1,
> > +               sel_clk_pll4d1_div3_div4,
> > +               ARRAY_SIZE(sel_clk_pll4d1_div3_div4), CLK_MUX_HIWORD_MA=
SK),
> > +
> >         /* Core output clk */
> >         DEF_DIV("CA55C0", R9A09G077_CLK_CA55C0, CLK_SEL_CLK_PLL0, DIVCA=
55C0,
> >                 dtable_1_2),
> > @@ -178,9 +205,15 @@ static const struct cpg_core_clk r9a09g077_core_cl=
ks[] __initconst =3D {
> >         DEF_FIXED("ETCLKC", R9A09G077_ETCLKC, CLK_SEL_CLK_PLL1, 10, 1),
> >         DEF_FIXED("ETCLKD", R9A09G077_ETCLKD, CLK_SEL_CLK_PLL1, 20, 1),
> >         DEF_FIXED("ETCLKE", R9A09G077_ETCLKE, CLK_SEL_CLK_PLL1, 40, 1),
> > +       DEF_DIV("XSPI_CLK0", R9A09G077_XSPI_CLK0, CLK_DIVSELXSPI0_SCKCR=
,
> > +               FSELXSPI0, dtable_6_8_16_32_64),
> > +       DEF_DIV("XSPI_CLK1", R9A09G077_XSPI_CLK1, CLK_DIVSELXSPI1_SCKCR=
,
> > +               FSELXSPI1, dtable_6_8_16_32_64),
> >  };
>
> Perhaps we need a custom clock for this?
> According to Section 7.3.1 "SCKCR : System Clock Control Register",
> some divider combinations are prohibited:
>   - 4 x 6,
>   - 4 x 32,
>   - 4 x 64.
> The last two are probably not an issue iff the xSPI driver never tries
> to set the corresponding clock rates.
> However, the first one may be an issue, as both 3 x 8 (valid) and 4 x 6
> (prohibited) yield the same resulting divider, and I believe we cannot
> be sure the clock core will never pick the prohibited combination.
>
Agreed, I think I will have to compose both MUX and the divider into a
single clock so that the dividers can be adjusted based on the MUX
value, or do you have any suggestion to just adjust the divider clocks
and leave the MUX clocks as is?

Cheers,
Prabhakar

