Return-Path: <linux-renesas-soc+bounces-17008-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B7FAB4421
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 20:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE7AB19E4F75
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 18:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 895562528E6;
	Mon, 12 May 2025 18:56:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8547244C63;
	Mon, 12 May 2025 18:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747076167; cv=none; b=bs10oU3HLTUS6pnFrHwM+0LemdvbATHI1HHoVoL2dmY+O2M/umG58JIcErmb0lM3EJ9nU1k8cjAhIHhT7lqX44ZDNbbws2VXzM3NZNpCnf/bDZGBfH4s2BCJZEMM0czXuMreXAGRlkvG5a4jnM0/KzYFYs7/Pky3ckYQhDn1MI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747076167; c=relaxed/simple;
	bh=wJ6+3T7Q+uG5JmIHX7L5AXYzO/d2+il64qc+8I4gyg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qei6l7+iOuXuLq7945IFKaGmFArIxDgNV54d2vz26LGubwaPPQk+WZppfGJOy4HhYXQ+NSikKiopPWlUIE7UxbHrR7wTgdY3dkxa9p46XZF4RNu/3jYX7dzfW9DJQP93w4p2FQgMgcOdi82JRscVtdo7dvMsadswjCJ52fXwjhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-879ed601971so1137442241.1;
        Mon, 12 May 2025 11:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747076163; x=1747680963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sQvaydtGe1SmxEZ4Zfc6DqWwo3SafcHmz1OjMvOZMDs=;
        b=aXCDuRSNwVkjiAKMXUfIFQLIELaeCm0GRhT0eX+4UHkqA5Zm8r98/4rYPBwjjD30xe
         U+gAIlFwZMNUu/Ytj7vgvD1dUVgLmF1QGUhFbF/BMV3f8WNFdKRCLGrTO0hoTPzWvuq4
         /AcROcVYMhvuWhiVj9TzGhc8U8ZqephhZFHLLEaMg0DzfWKBPNl3KHWhOgpbdGRE0V3d
         wJwpmt2tZ64U+0EDidXqL2lPAmIPDBM/k/UU2cpxN7QIUFglkd9k2sMEi0/TUSnN3iqM
         70kjyfsTzNvoqV+VA/c71XMH0SLdRorha20fR9kLyZl0iPYBcWqJbxJ9K18+rVk3khpd
         CdEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXZDtT0SfQf+YS8N04C6F32mYX5rFX/mQtfSY+M3c849GMu6ezTQcnHTzomY0SYMxts4YBMdeZy/Gt+KDe@vger.kernel.org, AJvYcCVjBA1IkRJP6PFyE5VM8e3YMkIROH3gIVokti2qG5jRcRHb7AzXHuQFKfN2JKTznPgdEXOQcPD10MY=@vger.kernel.org, AJvYcCXzL7B8g8MC/iiSWzHnGVqd0fU904CHwtAR8G8//Ij5G9ZlvItlGE7T1F9wru+7jsvwzgEIcKS5y+pfdkHrLH7gpuM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH69H0YXaF6KT1wQLdVmYANhRJbJGui1bBp/z0EKnK1tMP+z/i
	yyZYD6GyeVriFBiXB6//5YDGKsmcpNEY/oZ7wqJlPCcB+zuAjAO2Iww3kiHn
X-Gm-Gg: ASbGncsQvzNUt4XkX4gh4B1j9Y6sCpsWDfQmwLt8YZ0L03jPhdbD6tbslHzyaJ2yxqZ
	Pi3Y/Wm3ryxCPwURtfggcJvruwk5URJUAe+G1dzJ4/5Dn9ERqB4fpv0ZD3648sONdoTiRBHZsFO
	rOCZoZnjT8X3O3SJJMk/KNWuJvi3im70JkZkGBUEQrPddzpKOnVszWf8MVPhn2YTlJtaioHIouW
	Wq/NiV/TgXAYjVsTS+FAq1d+KP8Wt+8wArEsL95Uv9YqRv/buGbHOKnHH6Kk94RLNBsQcfEJbDc
	koe8x+D3Kn8dMWRrgU5l4GgbOGvJhNVwR0ARrBHmAvNmsR8SB1O0vnBDc5l+EHnXZibb+5eCLi8
	mCQKPIAlytG3Nkg==
X-Google-Smtp-Source: AGHT+IEqVmRIAuzTPJFv68SCEYqLYQIunEo2GwPaze02sN7O/P0Q3d7nnz3ajQBbWlyY1rEIanE4uw==
X-Received: by 2002:a05:6102:4b19:b0:4c1:76a4:aee4 with SMTP id ada2fe7eead31-4deed3d366fmr12686803137.19.1747076163471;
        Mon, 12 May 2025 11:56:03 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4dea85df68fsm5478536137.18.2025.05.12.11.56.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 11:56:02 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-87843c435f3so1314116241.3;
        Mon, 12 May 2025 11:56:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWhv0r6U7jZJh1L9MqK7jRvejB0iXaksak2G8+tN+9qC1pPZpPK4TcBXEckAm44DeSTNR51frCrqEce9xA1w9c3jvc=@vger.kernel.org, AJvYcCXLHSs7cG3khjl/RwLyf3fSNIa6sJ+Iu4KbOh0R6CebD12VHqP8C9N+9LckIVQoSSJ3d35q/q4xCFlumsO+@vger.kernel.org, AJvYcCXf5elQriUTTk5OO+bQiCI+VC7+FShyt2x1PQ+zFEjtl5V+3A4+efdF5Lyt2pZJfZpegbV+Gcl9lzE=@vger.kernel.org
X-Received: by 2002:a05:6102:fa8:b0:4ba:95f1:cc83 with SMTP id
 ada2fe7eead31-4deed3d3845mr9932241137.16.1747076162395; Mon, 12 May 2025
 11:56:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428184152.428908-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250428184152.428908-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWUpJHB_NsBqdvyD6=dDnZXQMr-=0aOpW0OutN9hSA5=A@mail.gmail.com> <CA+V-a8ukvn_K69h_COXS6JCqZbqXPQG1L9UAnm-gYQk7PTzb_g@mail.gmail.com>
In-Reply-To: <CA+V-a8ukvn_K69h_COXS6JCqZbqXPQG1L9UAnm-gYQk7PTzb_g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 May 2025 20:55:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXws+KBurR+x=vpLBtgY5yBKabJRadgBU1oPMWTwi0vNA@mail.gmail.com>
X-Gm-Features: AX0GCFsM1Y3g7ywasa4OoV3R8ypgjEoWGyMcRjYmyFXY9nLqMNXUy2UnYQ83DwM
Message-ID: <CAMuHMdXws+KBurR+x=vpLBtgY5yBKabJRadgBU1oPMWTwi0vNA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] clk: renesas: r9a09g057: Add clock and reset
 entries for GBETH0/1
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Fri, 9 May 2025 at 15:29, Lad, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> On Thu, May 8, 2025 at 5:13=E2=80=AFPM Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
> > On Mon, 28 Apr 2025 at 20:42, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add clock and reset entries for GBETH instances. Include core clocks =
for
> > > PTP, sourced from PLLETH, and add PLLs, dividers, and static mux cloc=
ks
> > > used as clock sources for the GBETH IP.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> > > ---
> > > v2->v3:
> > > - Used DEF_MOD_MUX_EXTERNAL() macro for external MUX clocks.
> > > - Renamed gbe0/1 external mux clock names
> >
> > Thanks for the update!
> >
> > > --- a/drivers/clk/renesas/r9a09g057-cpg.c
> > > +++ b/drivers/clk/renesas/r9a09g057-cpg.c
> > > @@ -78,6 +87,19 @@ static const struct clk_div_table dtable_2_64[] =
=3D {
> > >         {0, 0},
> > >  };
> > >
> > > +static const struct clk_div_table dtable_2_100[] =3D {
> > > +       {0, 2},
> > > +       {1, 10},
> > > +       {2, 100},
> > > +       {0, 0},
> > > +};
> > > +
> > > +/* Mux clock tables */
> > > +static const char * const smux2_gbe0_rxclk[] =3D { ".plleth_gbe0", "=
et0_rxclk" };
> > > +static const char * const smux2_gbe0_txclk[] =3D { ".plleth_gbe0", "=
et0_txclk" };
> > > +static const char * const smux2_gbe1_rxclk[] =3D { ".plleth_gbe1", "=
et1_rxclk" };
> > > +static const char * const smux2_gbe1_txclk[] =3D { ".plleth_gbe1", "=
et1_txclk" };
> > > +
> > >  static const struct cpg_core_clk r9a09g057_core_clks[] __initconst =
=3D {
> > >         /* External Clock Inputs */
> > >         DEF_INPUT("audio_extal", CLK_AUDIO_EXTAL),
> >
> > This patch starts to LGTM.  The only outstanding issue is how the
> > et*_[rt]xclk will be provided.  I have read your comments on v2,
> > and am eagerly awaiting the full patch set (CPG binding update, PHY
> > updates, ...) to get this all to work.
> >
> My intention here is to get these initial patches in so that we have
> Ethernet working on RZ/V2H (G3E/V2N) so that we have these boards on
> LAVA and tackle et*_[rt]xclk clocks for the next cycle as this will
> have to be discussed the -net maintainers. Are you OK with this
> approach.

You mean that (1) Ethernet works with just series
  - "[PATCH v4 0/2] clk: renesas: Skip monitor checks for external
     clocks and add clocks for GBETH"[1] and
  - "[PATCH v2 0/2] arm64: dts: renesas: Add GBETH support to R9A09G057
     SoC[2]"
applied, without any extra additions to define the et*_[rt]xclk clocks,
and (2) you see a clear path forward that can stay backwards compatible
with the DTS from [2]?

If that is the case, then I think we can move forward with these series.
Thanks!

[1] https://lore.kernel.org/20250509160121.331073-1-prabhakar.mahadev-lad.r=
j@bp.renesas.com/
[2] https://lore.kernel.org/20250509153559.326603-1-prabhakar.mahadev-lad.r=
j@bp.renesas.com/


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

