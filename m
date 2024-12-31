Return-Path: <linux-renesas-soc+bounces-11751-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EDD9FEF5D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Dec 2024 13:53:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 509321621F9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Dec 2024 12:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14ED2199230;
	Tue, 31 Dec 2024 12:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7YbN/7v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97CB1925AC;
	Tue, 31 Dec 2024 12:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735649597; cv=none; b=Gi4C5wn8XFnI4aIIn+J20WyXiKuuZgPs6cEFAgdqBKGwBy8SvhwCPdakm4SpC2wGtnGJI0Bnb+fw8Wx+zMP/S+yNNuaFC599uXbyU+H8h4j5PGZxgsUKxGnq/xq4a9zO47jK00zf5kicq4jjQwZi+imY970VV/4bI7t+r9V14Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735649597; c=relaxed/simple;
	bh=bkBwdWCAEl4OGynwIsymHqUCihBkdGW2DuvoxEI1JU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pRcyNR+ZDIkCyOs+s0WjLgWAKzv83qsW90gaeRgwAs43X/aiBAnYjwEoEeYgxbU7300T5S1Ue+keX+xoWxrlvK2IduS5rllQ8q3jvOB8asdlGvpuBafPQMkgpEd594m6yUzqHbX0yO3lGPNCrxZFt6qZprqZojegjeDOgaidsGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W7YbN/7v; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-517aea3ee2aso5314402e0c.2;
        Tue, 31 Dec 2024 04:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735649594; x=1736254394; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WThxzEW0uPA5fa6ffycWub+Cm0rWO1k9NsrPTfbs7s=;
        b=W7YbN/7ve5z+zlQ5HNJyBEF7GdIwyemuQuInTz6uDNTwM8skBNd7PdjFFuqynP9/q9
         /y/ANDfstPgkVlQAG769H5oOGQ9Q7UjTRS7Hdw0Qe9g8XTuRL9xMhE3X2DB6qF9prQkf
         H683HRyjPRdQtCx2mr+vDVWJK6lp8J+nmN+gpOPRIdEg3E2MVXve+/gRP3zxMaqBNijc
         JSbOicsDnQsIZAg8R73rttpDWbD1n3KVAJGwgFcwrtRhe59+90Ih+vasMgVqc+DipAkR
         l3gMwwJirFPbq60An4QTxQQwGWM4RSnr3XGcoreF1VfekbZ/BuQYc4zxRWtSYcDMMfNe
         r29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735649594; x=1736254394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WThxzEW0uPA5fa6ffycWub+Cm0rWO1k9NsrPTfbs7s=;
        b=UDRdQQzNfbrXJaZhgkOTlMUy5QBSIlYLTDMFeiC/63Gq63VG8TtBoG22ZBwyNKBuZf
         CipX1X29L0CCIU6RHL5m1nueuwT9Xbb2EbLKrUxNjTRnn5rOzcBbfwYJooLNLTFXv5je
         oesQegH1MgRdIBVfK6EoCggSFDS2C/mMIxhfinMIXuNC+QCAihdMsOhL3rpdumD5XwQT
         UEQK5WQaoaQ8HMw5MZMQdeXDm2riD/yc3IHpyRxVLeMC7m8Kt64L7oTfLD70araqJBQq
         x0cQ7BDZIjv+a1fpoWXo54fylk3AUyApDrfvQPBD+q62exHhtYtR+XDC8hDpClWKAF5w
         ukKg==
X-Forwarded-Encrypted: i=1; AJvYcCUlOqOXGn8Bhfs7/6NjKlOn1CTveSsoqxp/5E+CUrFMTRuqjxhpDinmurrkSDoPXxR2/m2Ju8mBwBplTD+9wtsEwDs=@vger.kernel.org, AJvYcCV0gaFwZ7aL8o51BMi+inUs00APyKUiiaypg1KKjPQcezJIXBoUug27otxb5PMxNwivv0F/zqizF1zP/aUr@vger.kernel.org, AJvYcCVw10PQtpAFFMLdL7lVdi6ptpW1laElphvio7DSHFi8GkbY8BsaMLt0cBRdDWuWVyhlTCuQTY9I6es=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhIsfi+OHpbqEDaAWu6Ffx9vyOctsZUgA2wxKv+bZmnGBl0Rrm
	MVqRMm4wm2PLZmwM9dqLFXlY2WOg//68UIxaZaLwACyL7eWXs19bFttDchzVmraHUTqCR+CGwcI
	vUUXVc3SWuu46xhtWDrn7uSixgto=
X-Gm-Gg: ASbGncudEqGZaImrwc7Ym49lQdd8AIRLvEpUwpXwauwog2KZqVaUPuB2FX1x7t5Dlfx
	6NrcqrIQAwJWzrkp9nSRfhr4OZQLrGoBCGsGwTuMslcwtbkIll8tQKPXe9RLqLLFlvbKS
X-Google-Smtp-Source: AGHT+IHI7QIQRgov78DL23WX+5Lfyp/tDUIdvY84Gc15vNMeTZcFIm8u2fE0QfBZhFPg9pP482utVut1dFPz0M18foA=
X-Received: by 2002:a05:6122:88d:b0:50a:d1e3:82f7 with SMTP id
 71dfb90a1353d-51b75d32623mr31672201e0c.8.1735649593552; Tue, 31 Dec 2024
 04:53:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241223173708.384108-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241223173708.384108-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXHnnpNa7rzDcU706eQHeBw5c88P769zCcQXzUrkHdijA@mail.gmail.com>
In-Reply-To: <CAMuHMdXHnnpNa7rzDcU706eQHeBw5c88P769zCcQXzUrkHdijA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 31 Dec 2024 12:52:47 +0000
Message-ID: <CA+V-a8tWK+3ybxKYJguWpShYeiXF2MtJgoCA-o75KUrm1y8Atw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] clk: renesas: rzv2h: Switch MSTOP configuration to
 per-bit basis
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Fri, Dec 27, 2024 at 3:49=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, Dec 23, 2024 at 6:37=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Refactor MSTOP handling to switch from group-based to per-bit
> > configuration. Introduce atomic counters for each MSTOP bit and update
> > enable/disable logic.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/clk/renesas/r9a09g047-cpg.c
> > +++ b/drivers/clk/renesas/r9a09g047-cpg.c
> > @@ -145,4 +145,6 @@ const struct rzv2h_cpg_info r9a09g047_cpg_info __in=
itconst =3D {
> >         /* Resets */
> >         .resets =3D r9a09g047_resets,
> >         .num_resets =3D ARRAY_SIZE(r9a09g047_resets),
> > +
> > +       .num_mstop_bits =3D 208,
>
> Note to self: to be folded into commit 61302a455696728c ("clk: renesas:
> rzv2h: Add support for RZ/G3E SoC") in renesas-clk.
>
> >  };
> > diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/=
r9a09g057-cpg.c
> > index 59dadedb2217..a45b4020996b 100644
> > --- a/drivers/clk/renesas/r9a09g057-cpg.c
> > +++ b/drivers/clk/renesas/r9a09g057-cpg.c
> > @@ -275,4 +275,6 @@ const struct rzv2h_cpg_info r9a09g057_cpg_info __in=
itconst =3D {
> >         /* Resets */
> >         .resets =3D r9a09g057_resets,
> >         .num_resets =3D ARRAY_SIZE(r9a09g057_resets),
> > +
> > +       .num_mstop_bits =3D 192,
>
> Note to self: to be folded into commit 7bd4cb3d6b7c43f0 ("clk:
> renesas: rzv2h: Add MSTOP support") in renesas-clk, just like the
> rest below.
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> > @@ -43,6 +43,8 @@
> >
> >  #define CPG_BUS_1_MSTOP                (0xd00)
> >  #define CPG_BUS_MSTOP(m)       (CPG_BUS_1_MSTOP + ((m) - 1) * 4)
> > +/* On RZ/V2H(P) and RZ/G3E CPG_BUS_m_MSTOP starts from m =3D 1 */
>
> If you think you need this comment, please move it two lines up,
> as it also applies to those lines.
>
> > +#define GET_MSTOP_IDX(mask)    ((FIELD_GET(BUS_MSTOP_IDX_MASK, (mask))=
) - 1)
>
> I think subtracting one here is the wrong abstraction (see below)...
>
As agreed below, I'll get rid of this macro.

> >
> >  #define KDIV(val)              ((s16)FIELD_GET(GENMASK(31, 16), (val))=
)
> >  #define MDIV(val)              FIELD_GET(GENMASK(15, 6), (val))
> > @@ -68,6 +70,7 @@
> >   * @resets: Array of resets
> >   * @num_resets: Number of Module Resets in info->resets[]
> >   * @last_dt_core_clk: ID of the last Core Clock exported to DT
> > + * @mstop_count: Array of mstop
>
> Array of mstop values?
>
OK.

> >   * @rcdev: Reset controller entity
> >   */
> >  struct rzv2h_cpg_priv {
> > @@ -82,17 +85,13 @@ struct rzv2h_cpg_priv {
> >         unsigned int num_resets;
> >         unsigned int last_dt_core_clk;
> >
> > +       atomic_t *mstop_count;
> > +
> >         struct reset_controller_dev rcdev;
> >  };
>
> > @@ -446,36 +445,65 @@ rzv2h_cpg_register_core_clk(const struct cpg_core=
_clk *core,
> >  }
> >
> >  static void rzv2h_mod_clock_mstop_enable(struct rzv2h_cpg_priv *priv,
> > -                                        struct mod_clock *clock)
> > +                                        u32 mstop_data)
> >  {
> > +       u16 mstop_mask =3D FIELD_GET(BUS_MSTOP_BITS_MASK, (mstop_data))=
;
>
> No need for parentheses around mstop_data.
>
OK.

> > +       u16 mstop_index =3D GET_MSTOP_IDX(mstop_data);
> > +       unsigned int index =3D mstop_index * 16;
>
> mstop_index already has one subtracted inside GET_MSTOP_IDX(),
> because you need that for indexing priv->mstop_count[]...
>
> >         unsigned long flags;
> > -       u32 val;
> > +       unsigned int i;
> > +       u32 val =3D 0;
> >
> >         spin_lock_irqsave(&priv->rmw_lock, flags);
> > -       if (!refcount_read(&clock->mstop->ref_cnt)) {
> > -               val =3D clock->mstop->mask << 16;
> > -               writel(val, priv->base + CPG_BUS_MSTOP(clock->mstop->id=
x));
> > -               refcount_set(&clock->mstop->ref_cnt, 1);
> > -       } else {
> > -               refcount_inc(&clock->mstop->ref_cnt);
> > +       for_each_set_bit(i, (unsigned long *)&mstop_mask, 16) {
>
> Please make mstop_mask unsigned long instead of using a
> non-portable cast.
>
OK.

> > +               if (!atomic_read(&priv->mstop_count[index + i]))
> > +                       val |=3D BIT(i) << 16;
> > +               atomic_inc(&priv->mstop_count[index + i]);
> >         }
> > +       if (val)
> > +               writel(val, priv->base + CPG_BUS_MSTOP(mstop_index + 1)=
);
>
> ... hence you have to re-add one here, which will be subtracted again
> inside CPG_BUS_MSTOP().
>
> So what about:
>   1. Dropping macro GET_MSTOP_IDX(),
>   2. Using mstop_index =3D FIELD_GET(BUS_MSTOP_BITS_MASK, mstop_data),
>      so you can call CPG_BUS_MSTOP(mstop_index) directly,
>   3. Letting priv->mstop_count point 16 entries before the allocated
>      array, so you can index it by the logical mstop number directly.
>
Something like below?

static void rzv2h_mod_clock_mstop_enable(struct rzv2h_cpg_priv *priv,
                     u32 mstop_data)
{
    unsigned long mstop_mask =3D FIELD_GET(BUS_MSTOP_BITS_MASK, mstop_data)=
;
    u16 mstop_index =3D FIELD_GET(BUS_MSTOP_IDX_MASK, mstop_data);
    unsigned int index =3D (mstop_index - 1) * 16;
    atomic_t *mstop =3D &priv->mstop_count[index];
    unsigned long flags;
    unsigned int i;
    u32 val =3D 0;

    spin_lock_irqsave(&priv->rmw_lock, flags);
    for_each_set_bit(i, &mstop_mask, 16) {
        if (!atomic_read(&mstop[i]))
            val |=3D BIT(i) << 16;
        atomic_inc(&mstop[i]);
    }
    if (val)
        writel(val, priv->base + CPG_BUS_MSTOP(mstop_index));
    spin_unlock_irqrestore(&priv->rmw_lock, flags);
}

static void rzv2h_mod_clock_mstop_disable(struct rzv2h_cpg_priv *priv,
                      u32 mstop_data)
{
    unsigned long mstop_mask =3D FIELD_GET(BUS_MSTOP_BITS_MASK, mstop_data)=
;
    u16 mstop_index =3D FIELD_GET(BUS_MSTOP_IDX_MASK, mstop_data);
    unsigned int index =3D (mstop_index - 1) * 16;
    atomic_t *mstop =3D &priv->mstop_count[index];
    unsigned long flags;
    unsigned int i;
    u32 val =3D 0;

    spin_lock_irqsave(&priv->rmw_lock, flags);
    for_each_set_bit(i, &mstop_mask, 16) {
        if (!atomic_read(&mstop[i]) ||
            atomic_dec_and_test(&mstop[i]))
            val |=3D BIT(i) << 16 | BIT(i);
    }
    if (val)
        writel(val, priv->base + CPG_BUS_MSTOP(mstop_index));
    spin_unlock_irqrestore(&priv->rmw_lock, flags);
}


>
> >         spin_unlock_irqrestore(&priv->rmw_lock, flags);
> >  }
> >
> >  static void rzv2h_mod_clock_mstop_disable(struct rzv2h_cpg_priv *priv,
> > -                                         struct mod_clock *clock)
> > +                                         u32 mstop_data)
> >  {
> > +       u16 mstop_mask =3D FIELD_GET(BUS_MSTOP_BITS_MASK, (mstop_data))=
;
> > +       u16 mstop_index =3D GET_MSTOP_IDX(mstop_data);
> > +       unsigned int index =3D mstop_index * 16;
> >         unsigned long flags;
> > -       u32 val;
> > +       unsigned int i;
> > +       u32 val =3D 0;
> >
> >         spin_lock_irqsave(&priv->rmw_lock, flags);
> > -       if (refcount_dec_and_test(&clock->mstop->ref_cnt)) {
> > -               val =3D clock->mstop->mask << 16 | clock->mstop->mask;
> > -               writel(val, priv->base + CPG_BUS_MSTOP(clock->mstop->id=
x));
> > +       for_each_set_bit(i, (unsigned long *)&mstop_mask, 16) {
> > +               if (!atomic_read(&priv->mstop_count[index + i]) ||
> > +                   atomic_dec_and_test(&priv->mstop_count[index + i]))
>
> Why the first part of the check?
> Because you only enable, and never disable, mstop bits in the initial
> synchronization in rzv2h_cpg_register_mod_clk()?
>
no, that's to avoid underflow.

> > +                       val |=3D BIT(i) << 16 | BIT(i);
> >         }
> > +       if (val)
> > +               writel(val, priv->base + CPG_BUS_MSTOP(mstop_index + 1)=
);
> >         spin_unlock_irqrestore(&priv->rmw_lock, flags);
> >  }
> >
> > +static int rzv2h_mod_clock_is_enabled(struct clk_hw *hw)
> > +{
> > +       struct mod_clock *clock =3D to_mod_clock(hw);
> > +       struct rzv2h_cpg_priv *priv =3D clock->priv;
> > +       u32 bitmask;
> > +       u32 offset;
> > +
> > +       if (clock->mon_index >=3D 0) {
> > +               offset =3D GET_CLK_MON_OFFSET(clock->mon_index);
> > +               bitmask =3D BIT(clock->mon_bit);
> > +       } else {
> > +               offset =3D GET_CLK_ON_OFFSET(clock->on_index);
> > +               bitmask =3D BIT(clock->on_bit);
> > +       }
> > +
> > +       return readl(priv->base + offset) & bitmask;
> > +}
> > +
> >  static int rzv2h_mod_clock_endisable(struct clk_hw *hw, bool enable)
> >  {
> >         struct mod_clock *clock =3D to_mod_clock(hw);
> > @@ -489,15 +517,19 @@ static int rzv2h_mod_clock_endisable(struct clk_h=
w *hw, bool enable)
> >         dev_dbg(dev, "CLK_ON 0x%x/%pC %s\n", reg, hw->clk,
> >                 enable ? "ON" : "OFF");
> >
> > +       if ((rzv2h_mod_clock_is_enabled(hw) && enable) ||
> > +           (!rzv2h_mod_clock_is_enabled(hw) && !enable))
> > +               return 0;
>
> This may call rzv2h_mod_clock_is_enabled() twice, as readl() is a
> compiler barrier.  You can avoid that using:
>
>     bool enabled =3D rzv2h_mod_clock_is_enabled(hw);
>     if (enabled =3D=3D enable)
>             return 0;
>
OK.

> > +
> >         value =3D bitmask << 16;
> >         if (enable) {
> >                 value |=3D bitmask;
> >                 writel(value, priv->base + reg);
> > -               if (clock->mstop)
> > -                       rzv2h_mod_clock_mstop_enable(priv, clock);
> > +               if (clock->mstop_data !=3D BUS_MSTOP_NONE)
> > +                       rzv2h_mod_clock_mstop_enable(priv, clock->mstop=
_data);
> >         } else {
> > -               if (clock->mstop)
> > -                       rzv2h_mod_clock_mstop_disable(priv, clock);
> > +               if (clock->mstop_data !=3D BUS_MSTOP_NONE)
> > +                       rzv2h_mod_clock_mstop_disable(priv, clock->msto=
p_data);
> >                 writel(value, priv->base + reg);
> >         }
> >
>
> > @@ -647,13 +619,16 @@ rzv2h_cpg_register_mod_clk(const struct rzv2h_mod=
_clk *mod,
> >
> >         priv->clks[id] =3D clock->hw.clk;
> >
> > -       if (mod->mstop_data !=3D BUS_MSTOP_NONE) {
> > -               clock->mstop =3D rzv2h_cpg_get_mstop(priv, clock, mod->=
mstop_data);
> > -               if (!clock->mstop) {
> > -                       clk =3D ERR_PTR(-ENOMEM);
> > -                       goto fail;
> > -               }
> > -       }
> > +       /*
> > +        * Ensure the module clocks and MSTOP bits are synchronized whe=
n they are
> > +        * turned ON by the bootloader. Enable MSTOP bits for module cl=
ocks that were
> > +        * turned ON in an earlier boot stage. Skip critical clocks, as=
 they will be
> > +        * turned ON immediately upon registration, and the MSTOP count=
er will be
> > +        * updated through the rzv2h_mod_clock_enable() path.
> > +        */
> > +       if (clock->mstop_data !=3D BUS_MSTOP_NONE &&
> > +           !mod->critical && rzv2h_mod_clock_is_enabled(&clock->hw))
> > +               rzv2h_mod_clock_mstop_enable(priv, clock->mstop_data);
> >
Ive updated this code, to handle a case where critical clocks are
turned ON by bootloader. Now updated code looks like below:

    /*
     * Ensure the module clocks and MSTOP bits are synchronized when they a=
re
     * turned ON by the bootloader. Enable MSTOP bits for module
clocks that were
     * turned ON in an earlier boot stage.
     */
    if (clock->mstop_data !=3D BUS_MSTOP_NONE &&
        !mod->critical && rzv2h_mod_clock_is_enabled(&clock->hw)) {
        rzv2h_mod_clock_mstop_enable(priv, clock->mstop_data);
    } else if (clock->mstop_data !=3D BUS_MSTOP_NONE && mod->critical) {
        unsigned long mstop_mask =3D FIELD_GET(BUS_MSTOP_BITS_MASK,
clock->mstop_data);
        u16 mstop_index =3D FIELD_GET(BUS_MSTOP_IDX_MASK, clock->mstop_data=
);
        unsigned int index =3D (mstop_index - 1) * 16;
        atomic_t *mstop =3D &priv->mstop_count[index];
        unsigned long flags;
        unsigned int i;
        u32 val =3D 0;

        /*
         * Critical clocks are turned ON immediately upon registration, and=
 the
         * MSTOP counter is updated through the rzv2h_mod_clock_enable() pa=
th.
         * However, if the critical clocks were already turned ON by the in=
itial
         * bootloader, synchronize the atomic counter here and clear
the MSTOP bit.
         */
        spin_lock_irqsave(&priv->rmw_lock, flags);
        for_each_set_bit(i, &mstop_mask, 16) {
            if (atomic_read(&mstop[i]))
                continue;
            val |=3D BIT(i) << 16;
            atomic_inc(&mstop[i]);
        }
        if (val)
            writel(val, priv->base + CPG_BUS_MSTOP(mstop_index));
        spin_unlock_irqrestore(&priv->rmw_lock, flags);
    }

> >         return;
> >
> > @@ -922,6 +897,13 @@ static int __init rzv2h_cpg_probe(struct platform_=
device *pdev)
> >         if (!clks)
> >                 return -ENOMEM;
> >
> > +       priv->mstop_count =3D devm_kmalloc_array(dev, info->num_mstop_b=
its,
> > +                                              sizeof(*priv->mstop_coun=
t), GFP_KERNEL);
>
> devm_kcalloc() ...
>
> > +       if (!priv->mstop_count)
> > +               return -ENOMEM;
> > +       for (i =3D 0; i < info->num_mstop_bits; i++)
> > +               atomic_set(&priv->mstop_count[i], 0);
>
> ... so you don't need to zero them.
>
OK.

Cheers,
Prabhakar

