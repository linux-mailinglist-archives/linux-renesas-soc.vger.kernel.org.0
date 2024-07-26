Return-Path: <linux-renesas-soc+bounces-7558-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5174093D5B0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 17:09:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 068EA1F233C9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 15:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F41178393;
	Fri, 26 Jul 2024 15:09:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68946BA53;
	Fri, 26 Jul 2024 15:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722006567; cv=none; b=jtnTHehVS/Si3E+2Dzy4a8M2o5ahXLBS3HP5CJQSXhmgYjjRKaEQLlzPNQV8qVMgVw3wB+leFNniPMQS+XFkVe+qF4OLJBZn7nfnhx+KZRmh/7qR+dCpKiDf3cWgj8zXSmrylGhwHhA3ipUuBMFzQn01u37vX4L/86uGXOnAYak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722006567; c=relaxed/simple;
	bh=e0OL5lkdcWcPJB+5GQzMSYpaHEFhXbY8OwwjMmlkL2I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZuX7xbAMJpil+Y6PC0bj0+mgyWyPBlb7ILvnWTL5tJhr2Gdu1u+H0waVMhVreGPX+TBxyIacMpiBbfm5rDbWqZJFgsTAqarWMIiL1Y72u4i4sGkEvUrPFtgE/jiXQ01h4xm9RB7o7DXIyUFbKpA4xliaN43bXjC5HjH1+NWUmWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e05f25fb96eso2057785276.1;
        Fri, 26 Jul 2024 08:09:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722006564; x=1722611364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51U3hsefcTZAJFWhmTojZD3mhhLU9Ox+gLA2KWiuwNE=;
        b=WlSaABRr/4/ADZsHguDdD2oop3IWXdbLgUrWETnjGjHcM3OD9ykQ3B1Bch/+MlLVaM
         HTibUptCIWuQq3cfImeoFYRAbeh8/94pgGnT+Xe/hpCDk5txRi2vNTUHSzhq7dMuS6Iw
         d7faA2nS9VC415eGSYcvvoG+yJUeaMBk9iuyurN0DiepuUKwq2m9m1PrAwETkXdyveUC
         SoyiKdDg8R/j7ddWXNxndrF0rEBF2GGJ7u1vng6MadTptIt/9RDWMNt1Xj5lTfzn3jW8
         rGJmiqqCoe8HgWqnqpI8vfskNaGooFTgHpnY1mLSgqLT0W2PzSKqKS9oScT1OrC9zg0v
         lbRw==
X-Forwarded-Encrypted: i=1; AJvYcCWkufDn2PrdCskxOiAzL8znBca975HgpmKQKdf9fm+dDWm+mX/DcD8BPYwJey9DKNM9d7MUQpZiePKexwFCllfhO7HfYOBATQWR8nvL78gYMZV9/y33r+oZ5bmMK+KAOBLU+Yc/5rESWvMkg7KqC69bGUV3NKheaAinCyIqT/ZufIu55NzZk2wKhhw=
X-Gm-Message-State: AOJu0YykKDAQwZep5S4xPwQLt6NjMZBtq7eOcYJ05bI8moE3nJb9NRZJ
	Z05yGBs6cQHFrtNHUsD00BJD+Uw3Ikz64OSKDVI+z/w1gk90y0gFP1Ria1ZfukA=
X-Google-Smtp-Source: AGHT+IHt3F7QJTOwcT6Ci/V7+Ou+rYDczNolath92FY0ZtVEPoHyfaMcKqxRZBjEq/0Qix8NRDnnjQ==
X-Received: by 2002:a0d:eec2:0:b0:664:c24f:c249 with SMTP id 00721157ae682-67a08705720mr958407b3.27.1722006564054;
        Fri, 26 Jul 2024 08:09:24 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6756b024a32sm9151727b3.97.2024.07.26.08.09.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jul 2024 08:09:23 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-65cd720cee2so21791817b3.1;
        Fri, 26 Jul 2024 08:09:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWG3wvLKL+6U5YkUP/ZU0LfQj03OhDhr1xUgnEdBk0pjk7ODkLL9y2CzG49OwlRX++p2FifoU8vNHhvwyfGuLE3fXOzPvUO1wcNS8PCuzS099Uqjs0cOhdl9rhNLOB51vfxjfN2hMiLyBpM+I/Cd7y6GM3qsxV9fygRVt33N4fMdH3XgS1vqQsfbag=
X-Received: by 2002:a0d:c344:0:b0:64a:e220:bfbf with SMTP id
 00721157ae682-67a0813c74amr1123757b3.23.1722006563138; Fri, 26 Jul 2024
 08:09:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715103555.507767-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240715103555.507767-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240715103555.507767-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Jul 2024 17:09:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV+pk5RgLZV5BdjJ2TR0GkjTni2-ZcL1zA0yrJv3-vtYQ@mail.gmail.com>
Message-ID: <CAMuHMdV+pk5RgLZV5BdjJ2TR0GkjTni2-ZcL1zA0yrJv3-vtYQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: renesas: rzg2l-cpg: Use devres API to
 register clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Mon, Jul 15, 2024 at 12:37=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> We are using devres APIs for divider, mux and pll5 clocks so for
> consistency use the devres APIs for module, fixed factor and PLL clocks.
>
> While at it switched to clk_hw_register() instead of clk_register()
> as this has been marked as deprecated interface.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - Propagate error code from rzg2l_cpg_pll_clk_register() if
>   devm_clk_hw_register() fails
> - Used devm_clk_hw_register_fixed_factor() for fixed factor clock
> - Set error pointer in rzg2l_cpg_register_mod_clk() if
>   devm_clk_hw_register() failed

Thanks for the update!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -1116,6 +1121,8 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_c=
lk *core,
>                 clk =3D of_clk_get_by_name(priv->dev->of_node, core->name=
);
>                 break;
>         case CLK_TYPE_FF:
> +               struct clk_hw *clk_hw;

I will move this up while applying, to match the style of the rest of
the file.

> +
>                 WARN_DEBUG(core->parent >=3D priv->num_core_clks);
>                 parent =3D priv->clks[core->parent];
>                 if (IS_ERR(parent)) {

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.12.

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

