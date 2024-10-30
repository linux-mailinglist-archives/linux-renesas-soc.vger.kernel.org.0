Return-Path: <linux-renesas-soc+bounces-10224-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF87C9B6A25
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Oct 2024 18:06:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05B661C2436C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Oct 2024 17:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F77216E18;
	Wed, 30 Oct 2024 16:56:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67128215C62;
	Wed, 30 Oct 2024 16:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730307419; cv=none; b=PWBwbwnBRXwyIOxCTzfVonrHQ143LvjKN5+wl6tZch9h0NgOySj3tIxpDC9yzExFW0hlIoLNtBSb7fa9PhMlgadsVX9G9go0gZzgDPUfV/ozqTBFYcOUXU3DHuQHpzVCZgc+LW6oEwKiV4XrP0PsXlpdWpx2ggw18gfurRaUASY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730307419; c=relaxed/simple;
	bh=6K6R9YZvsQL/qm8wODAofMqLrq4Rb8KfF38XG3WGzIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E8WzBVoG70mS/oXbCl2orpF2Di6QZ65B5mBNMRuFnFNRSSn/+yJISjk/1uL0i/fkDXFvJh8o3SrBsVGWlhlo9mDmFGIfo8x8tTyL20CLXxEdZ3reu5dOUGbf3QbwlRhQ9PaiwT5k/yu05jWVPTfUqPTqm3y1tS6M6i8H3OQtjQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e35bf59cf6so11330757b3.0;
        Wed, 30 Oct 2024 09:56:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730307415; x=1730912215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoBhxRjPZOSuryftpDOWxoWQRJSFaXktv0yeUySNygo=;
        b=m7SPZhlTrhdxLHMaNXvMTrnWgtBwSCFCdYZQ243SHDujuznlPFeY2Cr4AzyyRGfyH0
         f+EUSbM9+IcaMqZC93oHN1qQeXknx7aO/lvXJmqBncuKcxJIRVZwf5Myx6QtydYMN137
         KjgBgygAKrqCDMNiX54wSvtyB54xlGlKHruVd+ImJcsncBKP+npdspG/hUNdcfsXVYu3
         28V/6NlS88UhTSfIEX6FK0pcp5gHP1PKJciF4EIsHobxsACAcdoCVFpVQlfnsa25C28b
         M41i61NMfZL206inmh57iSlGSOvNX052CvrsTNkJkpWsftRncG8IX8NrUfLPGyiYsOo5
         GvIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBcP5XODj06XSbcGTolDULQjGWs4WxZSs/sg0DDd7u/bIh6VpQve5teRzQxP+Xdd8LuTzK+Ziqe0llCOsE@vger.kernel.org, AJvYcCVSPdKvmlk2W7D2NH+RpaDPdxD9zhXsqvKOYZ+mD5QmvU+/879FL5tX641yEt41ExB/IxUlJsY3J+Y=@vger.kernel.org, AJvYcCXwqKWnBgKo7I6uENhEaM1tA2L3jfxTd+ZAQIuUo1s781yxOy/cZlftJkJrj70Pp0VHhEnKmSqVAiRbr4gQSNRqmf8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzc2KZA8Na9mFtEt14+W3cw9lj1C/ASIv0hYkM7w3x6Dat8qNX
	dvXnTPsMGf1HdzEjplhRI+NkCwxVnRkaFPp+QKSgoqeIcpdwvbxG3G8Xx77P
X-Google-Smtp-Source: AGHT+IEfEIqfzXO9oUGhLSGK9IB1/aF1LeQBC4CfIMJDOh4oq5mB7pBqiFUu6gO/hy5IiuPEbrpyjw==
X-Received: by 2002:a05:690c:60c7:b0:6e5:2adf:d584 with SMTP id 00721157ae682-6ea2bfc47e8mr42108997b3.14.1730307415575;
        Wed, 30 Oct 2024 09:56:55 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea3c566898sm4869487b3.52.2024.10.30.09.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 09:56:55 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e29047bec8fso960150276.0;
        Wed, 30 Oct 2024 09:56:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVd/UkOCDmJMR81EGEhJ2Y0zFIyZGnEZjXHA0aHhPJRAWWKU8qSe19iSL1oD3jMFM+xiPMoeI6hsL/TA1OB@vger.kernel.org, AJvYcCWSt7+ctal3dkIxHIHzvUko/xvF2drXl5UfRMYeFOF5A3rOMMUtQqih2REUj1s6T1qukzaKksXgf38=@vger.kernel.org, AJvYcCX9xfihVCDp4He8szBcipB6/H0m/9CCkiYw4GPrwG7b3W/G4MB+y4lp5cc+9msWGlIqd+FYuk1fW3WtI1RgiqoYkgE=@vger.kernel.org
X-Received: by 2002:a5b:64c:0:b0:e29:11c6:3c16 with SMTP id
 3f1490d57ef6-e30d5404b58mr2899098276.11.1730307414840; Wed, 30 Oct 2024
 09:56:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241028212914.1057715-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241028212914.1057715-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241028212914.1057715-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Oct 2024 17:56:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWFiaECzt88fuHVxV1du0i5+4ujs73QciMUszrkYP3Mzw@mail.gmail.com>
Message-ID: <CAMuHMdWFiaECzt88fuHVxV1du0i5+4ujs73QciMUszrkYP3Mzw@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: rzv2h-cpg: Add support for clocks
 without PM
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Mon, Oct 28, 2024 at 10:29=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Allow certain CPG_MOD clocks to be excluded from Runtime PM support. Some
> clocks, like those in the CRU block, require specific sequences for
> enabling/disabling, making them incompatible with standard Runtime PM
> handling. For instance, initializing the CSI-2 D-PHY involves toggling
> individual clocks, which prevents the use of Runtime PM.
>
> Introduce a `no_pm` flag in the `mod_clock` and `rzv2h_mod_clk` structure=
s
> to indicate clocks that do not support PM. Add a helper function
> `rzv2h_cpg_is_pm_clk()` to determine if a clock should be managed by
> Runtime PM based on this flag. Define new macros like `DEF_MOD_NO_PM` for
> easier specification of such clocks.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -658,6 +661,32 @@ static int rzv2h_cpg_reset_controller_register(struc=
t rzv2h_cpg_priv *priv)
>         return devm_reset_controller_register(priv->dev, &priv->rcdev);
>  }
>
> +static bool rzv2h_cpg_is_pm_clk(struct rzv2h_cpg_priv *priv,
> +                               const struct of_phandle_args *clkspec)
> +{
> +       struct mod_clock *clock;
> +       struct clk_hw *hw;
> +       unsigned int id;
> +

Forgot to check clkspec->np?
Ah, rzg2l_cpg_is_pm_clk() also lacks this.

> +       if (clkspec->args_count !=3D 2)
> +               return true;
> +
> +       id =3D clkspec->args[1];
> +       if (clkspec->args[0] !=3D CPG_MOD ||
> +           id >=3D priv->num_core_clks + priv->num_mod_clks)

Adding "priv->num_core_clks" looks wrong to me.

> +               return true;
> +
> +       if (priv->clks[priv->num_core_clks + id] =3D=3D ERR_PTR(-ENOENT))
> +               return true;
> +
> +       hw =3D __clk_get_hw(priv->clks[priv->num_core_clks + id]);
> +       clock =3D to_mod_clock(hw);
> +       if (clock->no_pm)
> +               return false;
> +
> +       return true;

return !clock->no_pm;

> +}
> +
>  /**
>   * struct rzv2h_cpg_pd - RZ/V2H power domain data structure
>   * @priv: pointer to CPG private data structure
> @@ -670,6 +699,8 @@ struct rzv2h_cpg_pd {
>
>  static int rzv2h_cpg_attach_dev(struct generic_pm_domain *domain, struct=
 device *dev)
>  {
> +       struct rzv2h_cpg_pd *pd =3D container_of(domain, struct rzv2h_cpg=
_pd, genpd);
> +       struct rzv2h_cpg_priv *priv =3D pd->priv;
>         struct device_node *np =3D dev->of_node;
>         struct of_phandle_args clkspec;
>         bool once =3D true;
> @@ -679,6 +710,12 @@ static int rzv2h_cpg_attach_dev(struct generic_pm_do=
main *domain, struct device
>
>         while (!of_parse_phandle_with_args(np, "clocks", "#clock-cells", =
i,
>                                            &clkspec)) {

So this should have checked that clkspec.np actually points to our
clock provider.  Else all clocks (e.g. the external CAN clock, or
external audio clocks) are controlled through Runtime PM.

> +               if (!rzv2h_cpg_is_pm_clk(priv, &clkspec)) {
> +                       of_node_put(clkspec.np);
> +                       i++;
> +                       continue;
> +               }
> +
>                 if (once) {
>                         once =3D false;
>                         error =3D pm_clk_create(dev);

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

