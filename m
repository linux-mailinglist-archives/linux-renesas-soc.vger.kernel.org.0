Return-Path: <linux-renesas-soc+bounces-7312-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0209A92FD53
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 17:14:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 820FD1F21281
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 15:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46ACB173320;
	Fri, 12 Jul 2024 15:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CxjAhFr7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2A91094E;
	Fri, 12 Jul 2024 15:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720797284; cv=none; b=eDFjBmWHVVq1QvM8K++zSW5i3XuYhr1W++TxSdQB80E8SF57VS+1SuILcevxMZ1WhlGQbPyk2G+wAG37Ons3GTvZvmzPFacezmakDx6Pr3nDFfUOq2hVTeQAtgj7zqM2pgtjRT6Ksfzb6pQMt8teWxDK1k7X65XlxsoBl9wYWfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720797284; c=relaxed/simple;
	bh=BuRuxbp1j4lIF3rtudJiZ1PZKRLDEWAvMXu1lcTHuBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nfa9nHjjE/jgsyt4rEiXjAhzaJe8UpZcTBsVyk7LpwF0/DZmoqBNZif/BJzS0m52fwoGpTjJ4Q5klzHrm1JVJW8JDtnO5rG3feMopxo79ccluwMCcQImgRR/u8w58UvBm0Es96OqitwMzkkK8uj2kmJtetQqYbwbUTLPu9DyKN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CxjAhFr7; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-4f2fcaa2a3aso732236e0c.0;
        Fri, 12 Jul 2024 08:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720797281; x=1721402081; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEBYznYNSb51V+MSGkUWIxYPLdRWDRMJsAQfhGOICts=;
        b=CxjAhFr7PHz+dAxrdl77F9KQr+fj1OJd+EAkiyuM+ad9L3buXiZWgUhjX04ZzB3HzY
         0dIWX9Brby2g6C9+jikkohQAJ6BX/jMe1nz9Umw0YMKD7x0pYx8GnX3Y3tc0c/5qsqn6
         EEwpMCfj2fJvpAF3ojE9L/1b+rCSDbFvA8WClWUykl4CEcqUuQXBpbQnnW5hzCg8xmKf
         Ahi/Yroykjpn0Y9oK65ZicE9gwGqR0t/cROeHRToKh9WJpUaTfku06mHwPaLr+OZRFtO
         EPy3Woum9H7GgrYxHv7flZg12NdGpQVA0BkW4ZjvF3WQd8Zj7mmRepiE3lvH/NBzKfMg
         AkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720797281; x=1721402081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CEBYznYNSb51V+MSGkUWIxYPLdRWDRMJsAQfhGOICts=;
        b=MAHEAaYvb7IRTEMczEd9RxvCye+TzNuCnaIrpwNBOL6d8LVUlIFFspALNCs8cC1pmo
         PHEvcxhgSjMz0SP6ZyduIUQIp4nHLbtk/IOfp4LHF4v576zP4mkYOagsoRybAuEQJyWk
         /VF/2pLpBNicKiwZSfZX5KP07OZMlLrE8SOle7zYhPFXWRBmwtQJv/E0e7RLLjLyWpgl
         kwhXnMSyQ+p6q7tUxS9S5px++T69koo3TeRN0wyVefinVICe3P5T+lUHvWuS1PAgj+Cm
         CR2tUUWde6JcLh7CY+DH6U730hSHLZqpR8gFPYcZoUPHIvCAfTE5ygAvN2XBdbCYEKBa
         zO8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWwYkt/4iRJslJOKU9WIJsEXB9doyCHw8SlbfWuxT+HQkDS4zLTegrGQQD34gymJ8YDXLsKi4E2ABsvg9YqAPwsW5oATYqlJU9wi4pGCmMJzUvgaCbvY8teEdHh1aQvp7IAJQ1xC9UMmU7sFblU9/Qu0+lXHnoUL6+TgUCUS5/q3x7kZ9wcQw+vjvIyqn6RoeijGgHi+8IYmfE0Gv0WP9RTTxOBlrHR
X-Gm-Message-State: AOJu0YxAgwUcEdBAxHAH8FrfvX3yrx5KY+BURyQiPEPt5FN1pWDFTu0K
	10t2az+sAjVID7FOxJuUikrDaGMme3RRYaNJTCxoc535t1x78usS74P4rYGGLLqwUK7q9pCAaSv
	zvyO/lzYbpCsEW8H60nne2tR+jNA=
X-Google-Smtp-Source: AGHT+IHQ6IpoHvKkeEH62ea/1TZE+/IXyIUpQ/aXUL1PycE6cUD6mYEhLLA4N/tmpGBWaQwn7Ug6D9KxPBXweK2A13I=
X-Received: by 2002:a05:6122:2026:b0:4ef:630f:d579 with SMTP id
 71dfb90a1353d-4f33f29a48bmr14472986e0c.8.1720797279917; Fri, 12 Jul 2024
 08:14:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240627161315.98143-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240627161315.98143-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVLSpaUtdXFv3VXFc5G61dmRX2C1iW9C+km23g6EgZJOg@mail.gmail.com>
In-Reply-To: <CAMuHMdVLSpaUtdXFv3VXFc5G61dmRX2C1iW9C+km23g6EgZJOg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 12 Jul 2024 16:13:10 +0100
Message-ID: <CA+V-a8vABF6vg+J7DAGzgnw8612oe6VfJkc5y-krySvnpAnPkQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] clk: renesas: Add family-specific clock driver for RZ/V2H(P)
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Fri, Jul 12, 2024 at 12:59=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, Jun 27, 2024 at 6:14=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add family-specific clock driver for RZ/V2H(P) SoCs.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3
> > - Dropped num_hw_resets from struct rzv2h_cpg_priv
> > - Dropped range_check for module clocks
> > - Made mon_index to s8 instead of u8 in struct rzv2h_mod_clk
> > - Added support for critical module clocks with DEF_MOD_CRITICAL
> > - Added check for mon_index in rzv2h_mod_clock_endisable and
> >   rzv2h_mod_clock_is_enabled()
>
> Thanks for the update!
>
> > --- /dev/null
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
>
> > +static struct clk * __init
> > +rzv2h_cpg_pll_clk_register(const struct cpg_core_clk *core,
> > +                          struct rzv2h_cpg_priv *priv,
> > +                          const struct clk_ops *ops)
> > +{
> > +       void __iomem *base =3D priv->base;
> > +       struct clk **clks =3D priv->clks;
> > +       struct device *dev =3D priv->dev;
> > +       struct clk_init_data init;
> > +       const struct clk *parent;
> > +       const char *parent_name;
> > +       struct pll_clk *pll_clk;
> > +
> > +       parent =3D clks[core->parent & 0xffff];
>
> No need to mask with 0xffff, as nothing is ever stored in the high bits.
>
OK, I will drop it.

> > +static void __init
> > +rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
> > +                          struct rzv2h_cpg_priv *priv)
> > +{
> > +       struct mod_clock *clock =3D NULL;
> > +       struct device *dev =3D priv->dev;
> > +       struct clk_init_data init;
> > +       unsigned int id =3D mod->id;
>
> This is the sole user of mod->id, which can be calculated easily from
> mod->on_index and mod->on_bit.
>
Agreed, I will drop id.

> > --- /dev/null
> > +++ b/drivers/clk/renesas/rzv2h-cpg.h
>
> > +/**
> > + * struct rzv2h_mod_clk - Module Clocks definitions
> > + *
> > + * @name: handle between common and hardware-specific interfaces
> > + * @parent: id of parent clock
> > + * @id: clock index in array containing all Core and Module Clocks
> > + * @critical: flag to indicate the clock is critical
> > + * @on_index: control register index
> > + * @on_bit: ON bit
> > + * @mon_index: monitor register index
> > + * @mon_bit: monitor bit
> > + */
> > +struct rzv2h_mod_clk {
> > +       const char *name;
> > +       unsigned int parent;
> > +       unsigned int id;
>
> No need to store the id, as it can be calculated when needed.
>
OK.

> > +       bool critical;
> > +       u8 on_index;
> > +       u8 on_bit;
> > +       s8 mon_index;
> > +       u8 mon_bit;
>
> That leaves us with 1 64-bit pointer, 1 32-bit integer, and 5 bytes.
> Using bitfields for the latter is complicated due to the mix of signed
> and unsigned values.
> However, parent can be reduced to u16, shaving off one 64-bit word
> from each entry.
>
Agreed, I will update parent to u16.

> > +};
>
> > +/**
> > + * struct rzv2h_reset - Reset definitions
> > + *
> > + * @reset_index: reset register index
> > + * @reset_bit: reset bit
> > + * @mon_index: monitor register index
> > + * @mon_bit: monitor bit
> > + */
> > +struct rzv2h_reset {
> > +       u8 reset_index;
> > +       u8 reset_bit;
> > +       u8 mon_index;
> > +       u8 mon_bit;
> > +};
> > +
> > +#define RST_ID(x, y)   ((((x) * 16)) + (y))
> > +
> > +#define DEF_RST_BASE(_id, _resindex, _resbit, _monindex, _monbit)     =
 \
> > +       [_id] =3D { \
>
> Indexing by _id means the reset array will be very sparse.  E.g. the
> innocent-looking r9a09g057_resets[] with only a single entry takes
> 600 bytes.
>
> If you do need the full array for indexing, please allocate and
> populate it at runtime.
>
OK, I will use the radix tree for resets (is that OK)?

> As a bonus, you would no longer need rzv2h_cpg_info.info, and
> r9a09g057_resets[] and r9a09g057_cpg_info[] can become __initconst.
>
Agreed (and also r9a09g057_mod_clks).

Cheers,
Prabhakar

