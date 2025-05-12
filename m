Return-Path: <linux-renesas-soc+bounces-17011-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF8BAB4520
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 21:43:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 793E77A5E14
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 19:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0482298CB7;
	Mon, 12 May 2025 19:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCISf7ai"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E260B1BD9C8;
	Mon, 12 May 2025 19:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747078970; cv=none; b=aLRnD9nZgHYicXBuQ2DPej7BnnoU1o5qt00mmxyCS4ZgW8WHJjoIJjjicWgj7iS4LuZ9t7QAcwFfxQ45s3e4KZO9buPGSlqQL6BA1YzL0jYCD0AMzUL9d5kTf9WtBTG3hF/utXsh0BXMuzzcYURSMtW1DWcSJghKY3PVSdGGBMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747078970; c=relaxed/simple;
	bh=zPb5+8or5zoOb+ewomGwUGQXBTSKvyDlnZuKLU6XRbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lpsmaZqmKsaPa61wpyr5S3EFFk12AQflLT0+efChpnhHyPcDMvA25OsNdLwyXu80/xrFSdc5UUazt/FBXWbGruL1fiZwhx3lGRKAr7Q1crBah2HQfYicf/KvMKlZSa+sBFhObVCtxr7VpA2tkcXaVLCKzdv9694IloJIJvIGUk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCISf7ai; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so35433195e9.1;
        Mon, 12 May 2025 12:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747078967; x=1747683767; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4Dt0G9oXD9O451YCJ8Zq0URpyG/3EkGmLwZSAm3O8U=;
        b=CCISf7ai+fa+kYi7UF4XCMwN/RYI4yJLcGbQy4Kfp3jeMTFsOZa/soHesXqMZt9Dz1
         mYDCRvpEUQPwybNfB5s3nvP3eJPSwFGU5bRJSmcdnS43PkQLnpP03ynyXSRFKoijeRXC
         5lTNT4N8KeHWNyBnHel0wE88F2ietN8bjUTztEikCpM+YHh+wDyKUdG82Ez5y7yJA52m
         KKsr/FwniaKkNj5Ya+u5XBU8Mpb/U21VWKDawK6bsPSuV9OJ0SmS5TkMkHKqLFUkkLl5
         p40UhqGxajw9pcFZ0lDZYjMfwJ2f9jyRT5PB7muS714oSi/dU+78TG9NNpzI8hBkcfDd
         TDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747078967; x=1747683767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q4Dt0G9oXD9O451YCJ8Zq0URpyG/3EkGmLwZSAm3O8U=;
        b=Q2aAcnDICJrCvpiK2n2WPOl9ZhlXtcCSPBFdGdg/6XTZlPXrT1pjaCrfT1KOJ0QS8G
         t6xBUKLo+VQ11rZyoJA6liokGwz0NovhQwrnlZaEaMfgubVrV+hkW7y9M+oTSqaBD/Mq
         n4EdfHOoibiPRgrlyJjyqo58fkABkoYZBaw3ZtK6Fx2p/JRP3DUfPpw57Z9WMfbVkxdc
         KinkbIFW1G+39fYskfsxYfxgMm9ZVxv2ZPykT3NzxFkDkIj/NSAQ3EDsJ1/cpsn9xRkz
         zgJiaHp5VSfYqldaO34cXg5z8CmeuobtWCxV3x1nLe12fiZnWp+9wJ0LMK1toukeMFdo
         2oIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8ciCqysvXZvkqsRdU/xDyD1AY534YMLmLtWQ4IkjIDlh3ZRlKRQl6ZWqQyJFQ5bzMlk95uRgcdME=@vger.kernel.org, AJvYcCUtiJ1r63u6/QcA4qKXmURGjwjpp1wwOAGMpQ2zNAvzktBj8mwp45/2R3BdpAtaIo+FIcpZbHl+ZcTZKQRTd5Nuu4o=@vger.kernel.org, AJvYcCW9FBgP24iFAfCZAiSULAkbGGHdeixYjcsCmS3v1dtO8Ngca+E4yPaICh4jPrBLq7iTSvi4sJZCDgYTksl+@vger.kernel.org
X-Gm-Message-State: AOJu0YzeLkz2MivBVXxa/3ynUHUfWo9xugYIInAGBk70gYamd2gYgQlz
	JsAL+GK/PjhPh4aJAQgR+PrOPb73pm+Njv9edTUST3q74QFvTvPVqutPfGWhqJSxxmg/EzQPk/3
	T6wSmOaQvQnX3a0mLHLcU0xpqyJo=
X-Gm-Gg: ASbGncsLztrWXtjmrGlT3lk7NhaJanLz/MfPz8IkxCwIAXBMqj3pTUV7rREJoXfK+Ih
	/0KXaMxiAv3ui7m3/GK830XTUp4bEbZCctVPnuC9BxTF/AQ15qhubtOhs6tfKYQ7UMaSnXf56zI
	9dWyo2Rw3nNFLEXim4UOPkzIM6upZg1UA=
X-Google-Smtp-Source: AGHT+IEnDOcAJjQPlqs64TvxInLM28hddlRaQxKFEH0AgnAz3WmuNgy8ruM5Lgyg52c/yQqB6cUm8YmfHZeFNIE+ohI=
X-Received: by 2002:adf:f7cf:0:b0:3a1:fc91:f784 with SMTP id
 ffacd0b85a97d-3a1fc91fafbmr7805795f8f.53.1747078967091; Mon, 12 May 2025
 12:42:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428184152.428908-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250428184152.428908-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWUpJHB_NsBqdvyD6=dDnZXQMr-=0aOpW0OutN9hSA5=A@mail.gmail.com>
 <CA+V-a8ukvn_K69h_COXS6JCqZbqXPQG1L9UAnm-gYQk7PTzb_g@mail.gmail.com> <CAMuHMdXws+KBurR+x=vpLBtgY5yBKabJRadgBU1oPMWTwi0vNA@mail.gmail.com>
In-Reply-To: <CAMuHMdXws+KBurR+x=vpLBtgY5yBKabJRadgBU1oPMWTwi0vNA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 12 May 2025 20:42:20 +0100
X-Gm-Features: AX0GCFsEsYF_emCYyhO-zhjsjFvr5i5g6OB4StsZ6uIbaw6Gs9MA79gHD-vEhQI
Message-ID: <CA+V-a8tA+dXMA-M7Dv=8-h7Q01wex_N1AtGPZoAzbOakO1fo_g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] clk: renesas: r9a09g057: Add clock and reset
 entries for GBETH0/1
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Mon, May 12, 2025 at 7:56=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, 9 May 2025 at 15:29, Lad, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > On Thu, May 8, 2025 at 5:13=E2=80=AFPM Geert Uytterhoeven <geert@linux-=
m68k.org> wrote:
> > > On Mon, 28 Apr 2025 at 20:42, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Add clock and reset entries for GBETH instances. Include core clock=
s for
> > > > PTP, sourced from PLLETH, and add PLLs, dividers, and static mux cl=
ocks
> > > > used as clock sources for the GBETH IP.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > > > ---
> > > > v2->v3:
> > > > - Used DEF_MOD_MUX_EXTERNAL() macro for external MUX clocks.
> > > > - Renamed gbe0/1 external mux clock names
> > >
> > > Thanks for the update!
> > >
> > > > --- a/drivers/clk/renesas/r9a09g057-cpg.c
> > > > +++ b/drivers/clk/renesas/r9a09g057-cpg.c
> > > > @@ -78,6 +87,19 @@ static const struct clk_div_table dtable_2_64[] =
=3D {
> > > >         {0, 0},
> > > >  };
> > > >
> > > > +static const struct clk_div_table dtable_2_100[] =3D {
> > > > +       {0, 2},
> > > > +       {1, 10},
> > > > +       {2, 100},
> > > > +       {0, 0},
> > > > +};
> > > > +
> > > > +/* Mux clock tables */
> > > > +static const char * const smux2_gbe0_rxclk[] =3D { ".plleth_gbe0",=
 "et0_rxclk" };
> > > > +static const char * const smux2_gbe0_txclk[] =3D { ".plleth_gbe0",=
 "et0_txclk" };
> > > > +static const char * const smux2_gbe1_rxclk[] =3D { ".plleth_gbe1",=
 "et1_rxclk" };
> > > > +static const char * const smux2_gbe1_txclk[] =3D { ".plleth_gbe1",=
 "et1_txclk" };
> > > > +
> > > >  static const struct cpg_core_clk r9a09g057_core_clks[] __initconst=
 =3D {
> > > >         /* External Clock Inputs */
> > > >         DEF_INPUT("audio_extal", CLK_AUDIO_EXTAL),
> > >
> > > This patch starts to LGTM.  The only outstanding issue is how the
> > > et*_[rt]xclk will be provided.  I have read your comments on v2,
> > > and am eagerly awaiting the full patch set (CPG binding update, PHY
> > > updates, ...) to get this all to work.
> > >
> > My intention here is to get these initial patches in so that we have
> > Ethernet working on RZ/V2H (G3E/V2N) so that we have these boards on
> > LAVA and tackle et*_[rt]xclk clocks for the next cycle as this will
> > have to be discussed the -net maintainers. Are you OK with this
> > approach.
>
> You mean that (1) Ethernet works with just series
>   - "[PATCH v4 0/2] clk: renesas: Skip monitor checks for external
>      clocks and add clocks for GBETH"[1] and
>   - "[PATCH v2 0/2] arm64: dts: renesas: Add GBETH support to R9A09G057
>      SoC[2]"
> applied, without any extra additions to define the et*_[rt]xclk clocks,
> and (2) you see a clear path forward that can stay backwards compatible
> with the DTS from [2]?
>
Yes, the Ethernet works with just the series [1] and [2] applied,
without any additional changes to define the et*_[rt]xclk clocks. I
also confirm that there's a clear path forward which remains fully
compatible with the DTS from [2].

> If that is the case, then I think we can move forward with these series.
Given that, I agree - we can move forward with these series.

>
> [1] https://lore.kernel.org/20250509160121.331073-1-prabhakar.mahadev-lad=
.rj@bp.renesas.com/
> [2] https://lore.kernel.org/20250509153559.326603-1-prabhakar.mahadev-lad=
.rj@bp.renesas.com/
>
>
Cheers,
Prabhakar

