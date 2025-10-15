Return-Path: <linux-renesas-soc+bounces-23078-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4E4BDF35F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 16:58:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04F9A3E6674
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 14:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D2A22EDD60;
	Wed, 15 Oct 2025 14:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfiKFUsF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F562D6E4D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 14:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760540190; cv=none; b=ebPDMMRU4BOy9z0oS+bn04ngiGsQEOR7MbucbKmqggi7rhEtD2Csz37FNXNQ6On83XddU/2/Zyq7+HmCNZWMkT/bwCDcRcF0/G3RTUnNpVh1uo8crm7YGEGpNBqf3SGVGZUqNNOl6C/brEJB+MkszBnfjgOFLgzD5nKbcGBg2J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760540190; c=relaxed/simple;
	bh=cAVu1Ez4yYUTuEc8XdVelIPzH5j9qezO1CIAHTlUR1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YaJtcSXi6INL74z1psAR3ldJrQ0vteAC8fQjxEkOYvlrmTOqo1VYluqFneGb1N0oUyejyVdURKRvgysk+hVVtRyB0pSe/lXYzjgGvfh9oYUniTpvDee6to5GfkhtqgNkFm6M/zf0eaeO89HIlEbgboBIyMMsqDMN7p6kYsLoBHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DfiKFUsF; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3ee12807d97so4971701f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 07:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760540185; x=1761144985; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GI9CaA/4ITOkaOZyH+29H11i4BVtBD/Oo8oTodLjamo=;
        b=DfiKFUsFIHEIez+fvibFeKf7Yqv2B/m5F9vC5tRPDAc5mQSJpdrniDg8Z018NIc/S3
         ybkZ4hBUnrJi1euEjkQfiXh6olXVMR7rBRGvuQnS9VUdArqEEZVVxCUkmcjE229PZnPE
         RiDLmVdHKFs5UK0P+HJ+RGRE7NMyD+PFnmZus52WMzZy7bebO6NuwPLQSPPm8exZihfw
         Aa4cNhqUcQhDJpR/6KI5t7r5WpfkVzhvbW4e+h4FPzUWuu9xDmXdXTBnVZBF6UG5DyuP
         9O9gYlVHwb70omAZoKcXzQTHJAv0CkD0Y4Lvgy7nfLZvrra7ebvJwcXJkaowJq6XWiQp
         +jiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760540185; x=1761144985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GI9CaA/4ITOkaOZyH+29H11i4BVtBD/Oo8oTodLjamo=;
        b=oxZlKdP4xdiJYXPJ/TP1Z/C/fhRvVYe1o4zH5tXJYnB37/A4zePEGtfHnIUhMHFl/k
         gZp+TuVFkrtO8sg62m8Tqfd6xCe0E0nLk+C6Ha9Xi2essY0zjsd2appR1kTrzj69HK3M
         +fhyaO7tTX3+1HC3nqEYVjt+GdMdb+4l0HVZRE6BvFvZLuNzyyxHC45LTbDoSehh1uqR
         0iJ+rP0zdiNULGWy+knqXRZztralcM877QmkODTz5F7QSpJGJtcTbiSHsFxvF3I1D6wf
         5P8hSsrOe9YQIzNJBd1ipB27GrdSgT23+XIE3USkKNHB/jXdTLeyAbJ/0TEif30i0Du9
         uF6A==
X-Forwarded-Encrypted: i=1; AJvYcCVDi5CgtSaNxxc9gYHz1iiRKnVGADaIoMIgQkY/AIV2C+4VmX9bEXf1FSneDZxSj3SB2EeZgpDDgPsPFHWAwRdJpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAKJNQSP7IfcVgdJTtUeVrt9kkvQlaOyHyUnQwuo1zQlgM4eu/
	rQU2OAr7/CVL5K3nzWi21hUUMp3XbU/E7ybW10SMUET7V4MezJEZV8Mbv9hrBQU4sUlY6Ar9SHe
	cuRBatsxO00hvcenejDk35MxrvfK2wSs=
X-Gm-Gg: ASbGncvQAdnlbesxX/9y4T+DJCawxAI6AnITuN2hkH4sf0X4uEkG1zyNeZ+riZvv9mP
	6HQdIiSWa0GtcdKIinMQCboonkXowy53K1Py+EYngu36bg1B3sXsFzw2VPTOMarYCYu4nen07Os
	+NIjGDgWIhXzK5qolfFTGQzmIW1YuKZz+NNGPdgFL4OO7eodN5df/lc9iqVSAFO9UPsjlST1oJp
	zJUeuz92PmlqjqbmD9TsGGFqyUzelA2XZbZJmgY4KFU40vg3sNUEF5d6n7e
X-Google-Smtp-Source: AGHT+IH5L1Mo7xLa57k+5KugvuK+N+9eSJpkUwgo4LQeKXBhJMy9CjFuhGIGVQ+i6zqQoqwOUPriVfL9xrycTyM9beg=
X-Received: by 2002:a05:6000:43d6:20b0:426:f391:1968 with SMTP id
 ffacd0b85a97d-426f3911a30mr3441482f8f.35.1760540185079; Wed, 15 Oct 2025
 07:56:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251009160732.1623262-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251009160732.1623262-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdV2-YrktT+=D2LVFw5oR+6EOLcPB_Yuh5wnos099W9YHQ@mail.gmail.com>
In-Reply-To: <CAMuHMdV2-YrktT+=D2LVFw5oR+6EOLcPB_Yuh5wnos099W9YHQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 15 Oct 2025 15:55:57 +0100
X-Gm-Features: AS18NWDborL4rX4hqJjZmtwrGarJ9O0NBNJ1OthS7bueNWRfQx925JxPvOSaoZs
Message-ID: <CA+V-a8s9v5QmU=vrHM6wkFbEwdzp_+eE6kxEN53JfhnpA2KOUg@mail.gmail.com>
Subject: Re: [PATCH v10 2/6] clk: renesas: rzv2h-cpg: Add support for DSI clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Mon, Oct 13, 2025 at 3:26=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> On Thu, 9 Oct 2025 at 18:07, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for PLLDSI and its post-dividers to the RZ/V2H CPG driver a=
nd
> > export a set of helper APIs to allow other consumers (notably the DSI
> > driver) to compute and select PLL parameter combinations.
> >
> > Introduce per-PLL-DSI state in the CPG private structure and implement
> > clk ops and registration for PLLDSI and PLLDSI divider clocks. Implemen=
t
> > rzv2h_cpg_plldsi_determine_rate and rzv2h_cpg_plldsi_set_rate to drive
> > PLL programming via the new per-PLL state and add a plldsi divider clk
> > with determine/set/recalc operations that cooperate with the PLL
> > algorithm.
> >
> > Centralize PLL parameter types and limits by moving definitions into a
> > shared header (include/linux/clk/renesas.h). Add struct rzv2h_pll_limit=
s,
> > struct rzv2h_pll_pars and struct rzv2h_pll_div_pars, plus the
> > RZV2H_CPG_PLL_DSI_LIMITS() macro to declare DSI PLL limits.
> >
> > Provide two exported helper functions, rzv2h_get_pll_pars() and
> > rzv2h_get_pll_divs_pars(), that perform iterative searches over PLL
> > parameters (M, K, P, S) and optional post-dividers to find the best (or
> > exact) match for a requested frequency. Export these helpers in the
> > "RZV2H_CPG" namespace for use by external drivers.
> >
> > This change centralizes DSI PLL rate selection logic, prevents duplicat=
e
> > implementations in multiple drivers, and enables the DSI driver to
> > request accurate PLL rates and program the hardware consistently.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v9->v10:
> > - Dropped rzv2h_get_pll_div_pars() helper and opencoded instead.
> > - Dropped rzv2h_get_pll_dtable_pars() helper and opencoded instead.
> > - Added dummy helpers rzv2h_get_pll_pars() and rzv2h_get_pll_divs_pars(=
)
> >   in renesas.h for !CONFIG_CLK_RZV2H case.
> > - Updated commit message.
>
> Thanks for the update!
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
>
> > +static int rzv2h_cpg_plldsi_div_determine_rate(struct clk_hw *hw,
> > +                                              struct clk_rate_request =
*req)
> > +{
> > +       struct rzv2h_plldsi_div_clk *dsi_div =3D to_plldsi_div_clk(hw);
> > +       struct pll_clk *pll_clk =3D to_pll(clk_hw_get_parent(hw));
> > +       struct rzv2h_cpg_priv *priv =3D dsi_div->priv;
> > +       u8 table[RZV2H_MAX_DIV_TABLES] =3D { 0 };
> > +       struct rzv2h_pll_div_pars *dsi_params;
> > +       struct rzv2h_pll_dsi_info *dsi_info;
> > +       const struct clk_div_table *div;
> > +       u64 rate_millihz;
> > +       unsigned int i;
> > +
> > +       dsi_info =3D &priv->pll_dsi_info[pll_clk->pll.instance];
> > +       dsi_params =3D &dsi_info->pll_dsi_parameters;
> > +
> > +       rate_millihz =3D mul_u32_u32(req->rate, MILLI);
> > +       if (rate_millihz =3D=3D dsi_params->div.error_millihz + dsi_par=
ams->div.freq_millihz)
> > +               goto exit_determine_rate;
> > +
> > +       div =3D dsi_div->dtable;
>
> This belongs inside the for-initializer below.
>
Agreed.

> > +       i =3D 0;
>
> Ditto; or better: in the variable declaration at the top of the function.
>
Ok, I will move to the top.

> > +       for (; div->div; div++) {
> > +               if (i >=3D RZV2H_MAX_DIV_TABLES)
> > +                       return -EINVAL;
> > +               table[i++] =3D div->div;
> > +       }
> > +
> > +       if (!rzv2h_get_pll_divs_pars(dsi_info->pll_dsi_limits, dsi_para=
ms, table, i,
> > +                                    rate_millihz)) {
> > +               dev_err(priv->dev, "failed to determine rate for req->r=
ate: %lu\n",
> > +                       req->rate);
> > +               return -EINVAL;
> > +       }
> > +
> > +exit_determine_rate:
> > +       req->rate =3D DIV_ROUND_CLOSEST_ULL(dsi_params->div.freq_millih=
z, MILLI);
> > +       req->best_parent_rate =3D req->rate * dsi_params->div.divider_v=
alue;
> > +       dsi_info->req_pll_dsi_rate =3D req->best_parent_rate;
> > +
> > +       return 0;
> > +}
>
> The rest LGTM, so with the above fixed, and the field changes factored
> out into a separate patch:
Ok, I will move the field changes into a separate patch.

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Cheers,
Prabhakar

