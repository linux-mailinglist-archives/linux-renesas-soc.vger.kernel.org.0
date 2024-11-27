Return-Path: <linux-renesas-soc+bounces-10719-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 328339DA533
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 10:54:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71A0DB24CA5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 09:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15924194A63;
	Wed, 27 Nov 2024 09:54:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FE818FC81;
	Wed, 27 Nov 2024 09:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732701246; cv=none; b=jrlc/WGceXz3MqWZtkNZTfE5CTGfaUlS4qGNWvvYQbiGPMcizTgzMdv+21vnDPF/P227szWwVl6gSturseOZF5pr9XMSLcXJzlbCaX6QJBt/WnzENEwVWlF1D/3Zc0KZhh9fdfRtmiq8/TnKOT/mFg8DF8LKDwBJ6QvIDmNyOSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732701246; c=relaxed/simple;
	bh=xgynu+dnij/Ap4H8Z6VToiH02SriDSYtiIh9IuHQf6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ICHbOfVuAtnu0y81LcW/dhDH/qYEUkFLkBqsyd5/YUlS6lCX95xtyx7KwS6w5IbtH2Xex/AWmGPJNeBAzWzSz7IyHQrTh1kJsv4XG+GmUoEYsRjslrTmbPAMnGmyDWLC8xEU+PPistfxw11fNWYzY3EBnbY/rOXZ34XSyIHhaNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5cfd3a7e377so8421681a12.2;
        Wed, 27 Nov 2024 01:54:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732701241; x=1733306041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFNxczP+b5V8JKJ5O2vCYbJjZZHSVrsWR+o7WcAs32s=;
        b=oDc7FnlUqG3bexzIgW3O/GKsPqgDb7e+rOSakbZjxeikmihRiXjfbT4Od/mRGpi3an
         D09IQo9Dy4DsJGWhjdiLQF7x44KGJaFLeVQSGc5buSKQpz8ov1yk+88RVzRqzJkJElOf
         fFSaDQraZex2KLvkYNM4gsbTiCjheQALDK6KKcFeY3Tq4UaNqS/i16JzG390W8+eepwS
         ZfqYGq5BuZUiQYImY2nqg0PpzYxvys2fOC9cr5IF3eE6Nir59s/ELDFaSqCCGCqad+HO
         omuXfX+3QHXfCsyx8IugTdUy/sK4kFh8ngI4m+Q17hslC3aAjaelORLchw+spF8wjlES
         0hvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh3RLN6+BUf0+3UWj0gTMWH6cEtkg3ItTQBUhD1qYa4Nejs4Vtuo3ZrrvAwZ1pUmC36Dn8LdlyTyMvQ9erynvAHr8=@vger.kernel.org, AJvYcCVXAO9L/yUa8X7BAPFD1RDK5HGQ8QHmKM3D6WG3HB8+3rsc266EWV7KnIYINQyRbqBO3MQozPnmySc=@vger.kernel.org, AJvYcCW3XsFmXukRR9FxgGIoC7cFaUW8akZSssFYa8Kql9wVjtWI616/mciD6DYAY/H7BT+6vIPDchvLhNsYGqla@vger.kernel.org
X-Gm-Message-State: AOJu0YxFF6/cQwbnXSXVZJy1RrxXJXHsBbSm1sRCIJs/FYP5EzDAU4CD
	TDHk5EBP677WzPz5mQ6DABqnxKp+80zCB+F+WNA+KHYy2ngXs7GVDkJkLUH7yHo=
X-Gm-Gg: ASbGncu7ca8xDYNoxMPHCebKh5XlTVVy1xot2c0UoS0GnUEHkxUMc69urVuQZr516wm
	HiqiyOzab4wsBSGsBuBpCkq8qp66kBBc6ntFxhUmmiRil9LWwsnrxrUp1HjB9H2eHDHssFBE4yA
	Ye6A0UJfS5wWpzuWIcLUWnCIaIBeDjf2z3ytSTbaBQBRNiLw4MSKNYcVjgNOuEhYr0guyarl0X0
	7qVTbOXmIn25AqSBY0p9viHowdSIRvIE/fjJZdAxda1i+4pc9/HP/QCH3QnVa9GcJ09VViXCY8f
	UKH8FvnL0Jzt
X-Google-Smtp-Source: AGHT+IHmH3ImqJXE6O3fZkkabRKi4GRR/5G27AvOFYyipk2/zPz9Vt/gKSDyxRiTPadJTEJfFyCNlA==
X-Received: by 2002:a17:906:328d:b0:aa5:1d08:dad0 with SMTP id a640c23a62f3a-aa580ede47cmr164258366b.1.1732701240895;
        Wed, 27 Nov 2024 01:54:00 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b57bf82sm688603866b.147.2024.11.27.01.54.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 01:54:00 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a9f1c590ecdso1055061866b.1;
        Wed, 27 Nov 2024 01:54:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUA4hz8j2X4DQxTbw2gfla42wKVeO0I6xLeMEYTq3+1GGN+GfzoK27+suC/H52fx8d6vVp2KsVeGNalcMnf/RWh910=@vger.kernel.org, AJvYcCXi1N7YGPxVPQWx+0fI6ouce1qMY3lh6zvuN/gkvRf26pPAR2139DSORPxAn5E6iokwSKyX7o7FvU5NYlT4@vger.kernel.org, AJvYcCXzVz3Z2r215lFtN+PjTHWG2THt2BYvU2MIhMVsxcmsskEp2lSrA064qveiZ4CUapofOhsjU7WMX5Y=@vger.kernel.org
X-Received: by 2002:a17:907:7616:b0:a9a:f0e:cd4 with SMTP id
 a640c23a62f3a-aa581066bb2mr149567166b.55.1732701239952; Wed, 27 Nov 2024
 01:53:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104232401.290423-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241104232401.290423-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241104232401.290423-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Nov 2024 10:53:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX0p4KhTNpNKMfZBjrCDxsyGO7sSwcJZWxBgxoHBZy9jQ@mail.gmail.com>
Message-ID: <CAMuHMdX0p4KhTNpNKMfZBjrCDxsyGO7sSwcJZWxBgxoHBZy9jQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: renesas: rzv2h-cpg: Add selective Runtime PM
 support for clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

Thanks for your patch!

s/rzv2h-cpg/rzv2h/

On Tue, Nov 5, 2024 at 12:24=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Update `rzv2h_cpg_attach_dev` to prevent external clocks not tied to the
> power domain from being managed by Runtime PM. This ensures that only
> clocks originating from the domain are controlled, thereby avoiding
> unintended handling of external clocks.
>
> Additionally, introduce a `no_pm` flag in `mod_clock` and `rzv2h_mod_clk`
> structures to exclude specific clocks from Runtime PM when needed. Some
> clocks, such as those in the CRU block, require unique enable/disable
> sequences that are incompatible with standard Runtime PM. For example,
> the CSI-2 D-PHY clock initialization requires toggling individual clocks,
> making Runtime PM unsuitable.
>
> The helper function `rzv2h_cpg_is_pm_clk()` checks whether a clock should
> be managed by Runtime PM based on this `no_pm` flag. New macros, such as
> `DEF_MOD_NO_PM`, allow straightforward declaration of clocks that bypass
> PM.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - Updated code to skip external clocks to be controlled from runtime PM
> - Updated id range check
> - Updated commit message

Thanks for the update!

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -668,8 +671,38 @@ struct rzv2h_cpg_pd {
>         struct generic_pm_domain genpd;
>  };
>
> +static bool rzv2h_cpg_is_pm_clk(struct rzv2h_cpg_pd *pd,
> +                               const struct of_phandle_args *clkspec)
> +{
> +       if (clkspec->np !=3D pd->genpd.dev.of_node || clkspec->args_count=
 !=3D 2)
> +               return false;
> +
> +       switch (clkspec->args[0]) {
> +       case CPG_MOD: {
> +               struct rzv2h_cpg_priv *priv =3D pd->priv;
> +               unsigned int id =3D clkspec->args[1];
> +               struct mod_clock *clock;
> +
> +               if (id >=3D priv->num_mod_clks)
> +                       return true;
> +
> +               if (priv->clks[priv->num_core_clks + id] =3D=3D ERR_PTR(-=
ENOENT))
> +                       return true;

Shouldn't this return false for the two invalid cases above?

> +
> +               clock =3D to_mod_clock(__clk_get_hw(priv->clks[priv->num_=
core_clks + id]));
> +
> +               return !clock->no_pm;
> +       }
> +
> +       case CPG_CORE:
> +       default:
> +               return true;

False? (I know the code treated it is a PM clock before)

> +       }
> +}
> +
>  static int rzv2h_cpg_attach_dev(struct generic_pm_domain *domain, struct=
 device *dev)
>  {
> +       struct rzv2h_cpg_pd *pd =3D container_of(domain, struct rzv2h_cpg=
_pd, genpd);
>         struct device_node *np =3D dev->of_node;
>         struct of_phandle_args clkspec;
>         bool once =3D true;
> @@ -679,6 +712,12 @@ static int rzv2h_cpg_attach_dev(struct generic_pm_do=
main *domain, struct device
>
>         while (!of_parse_phandle_with_args(np, "clocks", "#clock-cells", =
i,
>                                            &clkspec)) {
> +               if (!rzv2h_cpg_is_pm_clk(pd, &clkspec)) {
> +                       of_node_put(clkspec.np);
> +                       i++;
> +                       continue;

This loop may start to loop nicer using
"for (i =3D 0; !of_parse_phandle_with_args(...); i++)".

> +               }
> +
>                 if (once) {
>                         once =3D false;
>                         error =3D pm_clk_create(dev);
> diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-=
cpg.h
> index 819029c81904..0723df4c1134 100644
> --- a/drivers/clk/renesas/rzv2h-cpg.h
> +++ b/drivers/clk/renesas/rzv2h-cpg.h
> @@ -100,6 +100,7 @@ enum clk_types {
>   * @name: handle between common and hardware-specific interfaces
>   * @parent: id of parent clock
>   * @critical: flag to indicate the clock is critical
> + * @no_pm: flag to indicate PM is not supported
>   * @on_index: control register index
>   * @on_bit: ON bit
>   * @mon_index: monitor register index
> @@ -109,17 +110,19 @@ struct rzv2h_mod_clk {
>         const char *name;
>         u16 parent;
>         bool critical;
> +       bool no_pm;
>         u8 on_index;
>         u8 on_bit;
>         s8 mon_index;
>         u8 mon_bit;
>  };
>
> -#define DEF_MOD_BASE(_name, _parent, _critical, _onindex, _onbit, _monin=
dex, _monbit) \
> +#define DEF_MOD_BASE(_name, _parent, _critical, _no_pm, _onindex, _onbit=
, _monindex, _monbit) \

Note that this series conflicts with "[PATCH 00/12] Add support for
Renesas RZ/G3E SoC and SMARC-EVK platform", which you are probably
already aware of.

[1] https://lore.kernel.org/all/20241122124558.149827-1-biju.das.jz@bp.rene=
sas.com/

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

