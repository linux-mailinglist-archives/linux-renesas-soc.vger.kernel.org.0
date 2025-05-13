Return-Path: <linux-renesas-soc+bounces-17030-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2036AB4E5E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 10:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45368863525
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 08:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B1301E9B0B;
	Tue, 13 May 2025 08:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3iw4ppW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF0E20E70E;
	Tue, 13 May 2025 08:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747125846; cv=none; b=t9idT65QM1VdxyU8JgplQtARlIY6uNSOMUu5UNvpkPUf1XqEmQt7se18tVc8bmabmbxKK7B1FcrOUX7D5fbGP1hFuZAzhDiaar5p0W+Q3VaeJJmZvj4XzUxAaIPeCcahhG+Ni8OVPbbM8kILvINF8kD1crz2xQi6WMDV4jJMymU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747125846; c=relaxed/simple;
	bh=L9yaJend7sBXzFCyTLUiQsHuLZXpzB/FkXWfDJaUbj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=en2qzt/5k1wL9fRI5qHQsnlnx+8AzTt0acpa93prvD2FWe96S5XV0uZ+Yma48g5qHwZ8AwuxtxdBzO3wDaqkxfGvnwR5ZghhxQgw8+HcDy8EYixfOZOtl3NvDnNtLcQbeZkzy0R4i9jBvyfkv5bqEuYWb7H3ys3TNm4MYwEZ3sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3iw4ppW; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso34030495e9.0;
        Tue, 13 May 2025 01:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747125843; x=1747730643; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=suJ5Bx35Oi4iLpMJiTea+mMElTP1j3KCM6w4EvztQoQ=;
        b=i3iw4ppW0zYBllMjix3k/j6KHbqsiLOwg+DPcmcRX14d9jxMUQSAKkGRvcGFhaAYB3
         BlIu347PtbLe0sc5yUtkvGLF+gszY1ZrcuiCamhOlQs+ZaFD68HxlUY/i1TmihoDQKkk
         F/dwgVfCxaefvNvWtBxIpyGZw/7C8W1cJgNhL/nnH35k4jIUltfBnfCkzOp4Icy7HYXY
         P2kj7ZG4I+7UtuRuL4j7TyBfVmph7JZO8cHptqv6ifS48NkHG+GyPx9kUWDYSkNhjbak
         32vuuZBu19ipmUZfozm51qa0uu+5F1zzwNhKOUSFsa1bfDRSoyXqjAKNRNpLKAHjNqNS
         fhhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747125843; x=1747730643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=suJ5Bx35Oi4iLpMJiTea+mMElTP1j3KCM6w4EvztQoQ=;
        b=gQzL2HxiXe4MFz3gfc/Pv5tuIdDrtpbtzyd5AuH3s3q2zDJe59g/R2NCjHARF5dQS/
         Jaj8+KN03IcuRJfl3hzxk/hdPTkxjDO4CyM1izdGaF+JhQwF4H2TL5rKjyQW0qG4Cx5j
         vbCp9NKB6YrR8y992kXZtXODIcUCRek4q55isgV9BZ7AOL0MybgBtVR/BYjlCNaEt3Mn
         SZyqG5CjFO/+TiSZucC/pSbUAFtQgpZ7ZAepULGkXzXHIU/jtbnflNdHBwGEQenW9Xod
         Nlar1Bqw+jTE36MQRW2B92veFWGgO+IYEDX7rCQAxjvx5SOV3A653eAWMPo0tv443AGz
         432w==
X-Forwarded-Encrypted: i=1; AJvYcCUBKV9f4fgL72m/5FL2mJjCzR4YSEUgUDFOD7vNJp8oqukq269z+jMoozWPTqDO7LohylU3AUxZOL+ALQd1I1qsSWY=@vger.kernel.org, AJvYcCX3I7hwhMSccCVJPLFUdZ2r28Yf5EbteuXVZ5sY1nkKvbZcMkYGzCW8h3ugI948JAiKQ/m5OmtGBNo=@vger.kernel.org, AJvYcCXfJSrqClzK4+aEdZr+0ViW9G+XtsUxRamYQxXoBnBXhoExj+keOIdwXc8OOOrVF4tWXppIb/IPtKv3FLLG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0o6Ovm3N91UNGg3bUyV+UdIpyTaITcW/m7vHiKVWQeLjxk63L
	+t8Bdvfsz2nxeEMZ4W3QuH6CcRBHWcAVr8rN/UkZBWoyQb3fWl6aSl2KhoaKqJwl6eG02NodQ55
	lfEnjvW1VTG746uFPfrcYftUyrK/79qts7bE=
X-Gm-Gg: ASbGncvy34IxkDeSRsVGygWfbk+yKTSdIDHOclDflpJAhzIMKOKuSiEr68cptlG3Vji
	+p3xg+BD9/4qlbChSr4DchVcjfG91qjEbIs76xysONDMVywrbjXYyJRRVafouI5gDnveb+2iuot
	+8MacaZbBxhmd/+F8pYaQh+W2PLfrWWB8=
X-Google-Smtp-Source: AGHT+IFAbSRD4ctDa/bn2QZINraMletm8pvh1kXfdlGwsKgIpRgPo2AMChUTHar1yJdSy/J4W1ZRMXsoAtBBI54qNis=
X-Received: by 2002:a05:6000:2ab:b0:38f:2678:d790 with SMTP id
 ffacd0b85a97d-3a1f643eaf6mr14541572f8f.33.1747125842610; Tue, 13 May 2025
 01:44:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509160121.331073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250509160121.331073-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVpWxVDOXHGhRqHPTjG6_z3XVqT7ZdJGz7Axk8Rut3Lsw@mail.gmail.com>
In-Reply-To: <CAMuHMdVpWxVDOXHGhRqHPTjG6_z3XVqT7ZdJGz7Axk8Rut3Lsw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 13 May 2025 09:43:36 +0100
X-Gm-Features: AX0GCFsoijlVjM5vNAtkxqALz4rLq9y3wkt2SkYGFeOT7rOBfMeMTu0M2P8S9pg
Message-ID: <CA+V-a8uLE52th_u+ODF+LEAZuS=X9WyyBGg0G6xOdH-xm+EkFQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] clk: renesas: rzv2h-cpg: Skip monitor checks for
 external clocks
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

On Tue, May 13, 2025 at 9:03=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, 9 May 2025 at 18:01, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > For module clocks whose parent mux may select an external source, bypas=
s
> > the normal monitor (CLK_MON) register check when the external clock is
> > active. Introduce a new `ext_clk_mux_index` in `struct rzv2h_mod_clk` a=
nd
> > `struct mod_clock`, and detect the current mux index in
> > `rzv2h_mod_clock_is_enabled()` to disable monitoring if it matches the
> > external source index.
> >
> > Provide the `DEF_MOD_MUX_EXTERNAL()` macro for declaring external-sourc=
e
> > module clocks, and populate the `ext_clk_mux_index` field in
> > `rzv2h_cpg_register_mod_clk()`.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v3->v4:
> > - Dropped external_clk_mux_index and external_clk and introduced
> >   ext_clk_mux_index.
> > - Updated DEF_MOD_*() macros to include ext_clk_mux_index.
> > - Added a new helper function `rzv2h_clk_mux_to_index()` to get the
> >   current mux index.
> > - Dropped IS_ERR() check for parent_clk in `rzv2h_clk_mux_to_index()`.
> > - Updated commit description to clarify the purpose of the patch.
>
> Thanks for the update!
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> > @@ -563,14 +565,38 @@ static void rzv2h_mod_clock_mstop_disable(struct =
rzv2h_cpg_priv *priv,
> >         spin_unlock_irqrestore(&priv->rmw_lock, flags);
> >  }
> >
> > +static int rzv2h_clk_mux_to_index(struct clk_hw *hw)
>
> Renaming to rzv2h_parent_clk_mux_to_index(), as it operates on the parent=
...
>
Agreed, it makes sense.

> > +{
> > +       struct clk_hw *parent_hw;
> > +       struct clk *parent_clk;
> > +       struct clk_mux *mux;
> > +       u32 val;
> > +
> > +       /* This will always succeed, so no need to check for IS_ERR() *=
/
> > +       parent_clk =3D clk_get_parent(hw->clk);
> > +
> > +       parent_hw =3D __clk_get_hw(parent_clk);
> > +       mux =3D to_clk_mux(parent_hw);
> > +
> > +       val =3D readl(mux->reg) >> mux->shift;
> > +       val &=3D mux->mask;
> > +       return clk_mux_val_to_index(parent_hw, mux->table, 0, val);
> > +}
> > +
> >  static int rzv2h_mod_clock_is_enabled(struct clk_hw *hw)
> >  {
> >         struct mod_clock *clock =3D to_mod_clock(hw);
> >         struct rzv2h_cpg_priv *priv =3D clock->priv;
> > +       int mon_index =3D clock->mon_index;
> >         u32 bitmask;
> >         u32 offset;
> >
> > -       if (clock->mon_index >=3D 0) {
> > +       if (clock->ext_clk_mux_index >=3D 0) {
> > +               if (rzv2h_clk_mux_to_index(hw) =3D=3D clock->ext_clk_mu=
x_index)
>
> Collapsing into a single if-statement...
>
Thanks, makes sense.

> > +                       mon_index =3D -1;
> > +       }
> > +
> > +       if (mon_index >=3D 0) {
> >                 offset =3D GET_CLK_MON_OFFSET(clock->mon_index);
>
> Dropping "clock->"...
>
Thanks, makes sense.

Cheers,
Prabhakar

> >                 bitmask =3D BIT(clock->mon_bit);
> >
> >
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk for v6.17 with the above changes.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
>

