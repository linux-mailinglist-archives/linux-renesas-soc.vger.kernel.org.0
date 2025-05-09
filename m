Return-Path: <linux-renesas-soc+bounces-16861-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 701B5AB152C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 15:30:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BF12A27E50
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 13:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E75291899;
	Fri,  9 May 2025 13:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="izd8avQd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18C3290BB5;
	Fri,  9 May 2025 13:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746797163; cv=none; b=EeMjiQeQt3xrkb5LL1WXCmzG/P+JoZJ+OmcOs9P4kHPplwrQnu1ZVavglLxobF8gkTPrU+48yBM0oWvzohdaNfmlAhacwhR1b1vOmw+37AAl1DH7K76Dq6RbbvcoTJ1FMDm9rM50ed57e1L7dpDwvGLWadFaFdzkXFUDlofuHF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746797163; c=relaxed/simple;
	bh=bmNKU6jDpBxyG754IarJ2AIwRbx4qNvPX8RXrF1dT/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JLqOL5DLKD1OEuttoHp8aeBilpTdMn3mXj8sKSb9mG+eW7B2KDngviJwCpY+WaIMtVSoUUOfwmBzlNhfVfYofOV+MnvdLcb6D2R2e1eFaoaZzK1Hxdq9iJfLJPKJKIFlSuAwR8T91LSe0AeRRxKF6tmsNYQd1+3Cr0/TapPBato=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=izd8avQd; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a0b9af89f2so1240006f8f.3;
        Fri, 09 May 2025 06:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746797160; x=1747401960; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fnh5skZT3IHgfxP2xQW8NE9ADgg9y7aWX7aWGzVV/kA=;
        b=izd8avQdsbxkoJcKJj88qk44Us8g2irOh8T8kRm9QBW91FCYd3I1z99k7dYOdQRM8T
         a9g8EcZoWEvB+yTuU/TXQ04gQ2fPzNU+CHr0aUKkUr47i/kPk1xPMZtlSEBceq1qamDr
         OVIpoLfXN1u1EYvCuQ8fRM4z0ja8wH6jDjz6BB/BK21beszEz1B9RvkjOK8ng3Ymexn0
         MkL5//FvMcYrZ6IIdhjRqv8GkMei55REPsRJfHlQIHeavnI+l6sxUibV+iG2Yxy9b0sh
         qxSh+WvqHz1ly4mh+G48gRYW5U1A60f917rxUCzEJtNYboTffczMjyEOgNXO7/WGsTGC
         A7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746797160; x=1747401960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fnh5skZT3IHgfxP2xQW8NE9ADgg9y7aWX7aWGzVV/kA=;
        b=fc94WaSGyu7ikGyE+KtLfpDunaQtdF2I0WgAm449vXBhm0S4yhDotbTfHjxwy4XNN+
         Y6NzE3GwpE6HMasGS34aLSsolNV5WucYjJtWl5Y9IBWYhz3x3M3+i4V20FIbyz1bkXX4
         nQcvZq7OaNINB7AN+CgxwG+ECWJkFYXHqKrVB7ZFIBF/1XsWXK83HWuUw65S9yjo/eOE
         HKEczbYlFuzrHijhMVoAcmqV4tqwvIdDOPHS2/257QBx2xvuTqDSdH4iAZBZlSZJTvUd
         miMm7uwFZemhMXVNvmsu8GWxEcJ1cXDKBulxoPfRF/Y4d5c8xTrQve4feDF+0XLNwVEf
         9SKA==
X-Forwarded-Encrypted: i=1; AJvYcCVouwat8OHNb/AHvc6xQ3pU5aL9m+c6R5mpeRQv+ltZLYx05xb378Zd9v+ieDSwfoNgD9eAhxQOjFHpRuuw@vger.kernel.org, AJvYcCWrEZmuw+k2qB5oqRGOXGkahDUmz1LQuSzLmZnrK+NEaVJYvIPsEVzz0SPgyIJh4Xs2ZKKXRLNsWnjCtYx0VmSIEVs=@vger.kernel.org, AJvYcCXTHOZVPkpe3vZGAxsQHuXXcQRyh5i0JurlOrVhs83bZunYnK1NW6xmIV9y7JNkUHFTBHWiFdrZS70=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPW+fvutrC3tdWRH3BGndrl/UWptaEinFR3MKJrHjqp1LxOJ1r
	+kXwFPzI+Jmcp09cBZfYdmw1m3cfZ6nTV5FIwRGe8y8gTD7zShF9m4PXkTOgDxx05JbnMgvvkAL
	7pJmvbzWKkDTg6cYAw4sk3tIHVBk=
X-Gm-Gg: ASbGnctksFVk8KY1YrONEwmBfztNLp+2cyuZ+VzS1ShpNiNUWyGfKhWIrBz57XUDrDW
	QSG8IPX+5wVKi2KLktfuUOV4aRvdYZQxpiy+InBVv/FTDrzuvvK/ChXoTu27yNe+tkbWQOB9OZQ
	a92Wax+ECB8PYPnih5RMp3/w1GJk3eRKu9
X-Google-Smtp-Source: AGHT+IGguipPbGDs6MxNWP08TEDym5IQFlUgf8M0RYrcJaZSMMqBnIPVFMkGcdCp/haRy3/cHh5ys8NKzGRKRZNb7lU=
X-Received: by 2002:a5d:64ab:0:b0:3a1:f635:1133 with SMTP id
 ffacd0b85a97d-3a1f64220b7mr3284300f8f.7.1746797159776; Fri, 09 May 2025
 06:25:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428184152.428908-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250428184152.428908-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVtQEEW3SU+f7qTDq6NVhy3LhrrwOgECdrZMfUk6vWQ2A@mail.gmail.com>
In-Reply-To: <CAMuHMdVtQEEW3SU+f7qTDq6NVhy3LhrrwOgECdrZMfUk6vWQ2A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 9 May 2025 14:25:33 +0100
X-Gm-Features: AX0GCFtuHgsDcYGE3aQn_vsxP1O3iXGewdDE2kmkNyVKV-ApOaTxI-h9UngzpnI
Message-ID: <CA+V-a8uHMuj0uPrwBr9K3YeriBg6me+y7yyPEF1Vv4WXKc3+bQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] clk: renesas: rzv2h-cpg: Skip monitor checks for
 external clocks
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

Thank you for the review.

On Thu, May 8, 2025 at 5:06=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 28 Apr 2025 at 20:42, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Introduce support for module clocks that may be sourced from an externa=
l
> > clock rather than the on-chip PLL. Add two new fields `external_clk` an=
d
> > `external_clk_mux_index` to `struct rzv2h_mod_clk` and `struct mod_cloc=
k`
> > to mark such clocks and record the mux index corresponding to the exter=
nal
> > input.
> >
> > Provide a new helper macro `DEF_MOD_MUX_EXTERNAL()` for concise declara=
tion
> > of external-source module clocks.
> >
> > In `rzv2h_mod_clock_is_enabled()`, detect when the parent mux selects t=
he
> > external source (by comparing the current mux index against
> > `external_clk_mux_index`) and skip the normal CLK_MON register check in
> > that case. Update `rzv2h_cpg_register_mod_clk()` to populate the new fi=
elds
> > from the SoC info.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3:
> > - Renamed helper macro to `DEF_MOD_MUX_EXTERNAL()`.
> > - Added a new field `external_clk_mux_index` to `struct mod_clock` to
> >   store the mux index corresponding to the external input.
> > - Updated the `rzv2h_mod_clock_is_enabled()` function to check if the
> >   parent mux selects the external source by comparing the current mux
> >   index against `external_clk_mux_index`.
> > - Updated the `rzv2h_cpg_register_mod_clk()` function to populate the n=
ew
> >   fields from the SoC info.
> > - Updated commit description
>
> Thanks for the update!
>
> LGTM. But as I will not apply the second patch yet anyway, I am a
> little bit more pedantic with my comments below (no offense intended,
> though ;-)
>
No offense taken at all, I appreciate the thoroughness. I'll make the
suggested adjustments :)

> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> > @@ -119,6 +119,8 @@ struct pll_clk {
> >   * @on_bit: ON/MON bit
> >   * @mon_index: monitor register offset
> >   * @mon_bit: monitor bit
> > + * @external_clk: Boolean flag indicating whether the parent clock can=
 be an external clock
> > + * @external_clk_mux_index: Index of the clock mux selection when the =
source is an external clock
> >   */
> >  struct mod_clock {
> >         struct rzv2h_cpg_priv *priv;
> > @@ -129,6 +131,8 @@ struct mod_clock {
> >         u8 on_bit;
> >         s8 mon_index;
> >         u8 mon_bit;
> > +       bool external_clk;
> > +       u8 external_clk_mux_index;
>
> Perhaps combine these two fields into
>
>     s8 ext_clk_mux_index;
>
> with -1 indicating not valid, cfr. mon_bit?
>
Good point.

>
> >  };
> >
> >  #define to_mod_clock(_hw) container_of(_hw, struct mod_clock, hw)
> > @@ -567,10 +571,33 @@ static int rzv2h_mod_clock_is_enabled(struct clk_=
hw *hw)
> >  {
> >         struct mod_clock *clock =3D to_mod_clock(hw);
> >         struct rzv2h_cpg_priv *priv =3D clock->priv;
> > +       bool skip_mon =3D false;
> >         u32 bitmask;
> >         u32 offset;
> >
> > -       if (clock->mon_index >=3D 0) {
> > +       if (clock->mon_index >=3D 0 && clock->external_clk) {
>
> I think the first condition can be dropped, as clock->external_clk
> implies a valid mon_index.
>
Agreed.

> > +               struct clk_hw *parent_hw;
> > +               struct clk *parent_clk;
> > +               struct clk_mux *mux;
> > +               int index;
> > +               u32 val;
> > +
> > +               parent_clk =3D clk_get_parent(hw->clk);
> > +               if (IS_ERR(parent_clk))
>
> Can this actually happen?
>
No, I will drop this and add a comment.

> > +                       goto check_mon;
> > +
> > +               parent_hw =3D __clk_get_hw(parent_clk);
> > +               mux =3D to_clk_mux(parent_hw);
> > +
> > +               val =3D readl(mux->reg) >> mux->shift;
> > +               val &=3D mux->mask;
> > +               index =3D clk_mux_val_to_index(parent_hw, mux->table, 0=
, val);
> > +               if (index =3D=3D clock->external_clk_mux_index)
> > +                       skip_mon =3D true;
> > +       }
> > +
> > +check_mon:
> > +       if (clock->mon_index >=3D 0 && !skip_mon) {
> >                 offset =3D GET_CLK_MON_OFFSET(clock->mon_index);
> >                 bitmask =3D BIT(clock->mon_bit);
> >
>
> I am not so fond of the goto and the !skip_mon logic, and wonder
> if we can improve? Perhaps spin of the index obtaining logic into a
> parent_clk_mux_index() helper, and something like:
>
Ok, I'll add a helper rzv2h_clk_mux_to_index().

>     int mon_index =3D clock->mon_index;
>
>     if (clock->external_clk) {
>             if (parent_clk_mux_index(hw) =3D=3D clock->external_clk_mux_i=
ndex))
>                     mon_index =3D -1;
>     }
>
>     if (mon_index >=3D 0) {
>             // do it
>     }
>
Agreed, with this we can get rid of goto.

> > --- a/drivers/clk/renesas/rzv2h-cpg.h
> > +++ b/drivers/clk/renesas/rzv2h-cpg.h
> > @@ -192,6 +192,8 @@ enum clk_types {
> >   * @on_bit: ON bit
> >   * @mon_index: monitor register index
> >   * @mon_bit: monitor bit
> > + * @external_clk: Boolean flag indicating whether the parent clock can=
 be an external clock
> > + * @external_clk_mux_index: Index of the clock mux selection when the =
source is an external clock
> >   */
> >  struct rzv2h_mod_clk {
> >         const char *name;
> > @@ -203,9 +205,12 @@ struct rzv2h_mod_clk {
> >         u8 on_bit;
> >         s8 mon_index;
> >         u8 mon_bit;
> > +       bool external_clk;
> > +       u8 external_clk_mux_index;
>
> s8 ext_clk_mux_index
>
OK.

Cheers,
Prabhakar

