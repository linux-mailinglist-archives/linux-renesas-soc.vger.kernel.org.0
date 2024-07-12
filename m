Return-Path: <linux-renesas-soc+bounces-7303-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E658292FBFB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 15:59:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 086E51C21713
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 13:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE71171086;
	Fri, 12 Jul 2024 13:59:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD10B16FF48;
	Fri, 12 Jul 2024 13:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720792778; cv=none; b=aen9Ye7ZDljCJgGfZlraRIzRL22dLLb9X09hHgXOCHfvFUveccl3iKhJtC0CNuFdMwDGg7QSaZE9GxEgpOauwT04o+KhUGqWBC3xDcOsCfQCHO6cF1REdF5CiafSKpdvzPNP3xwWGSSKw6DQhD3UFSuXgqIA2NnvDDciZF4ArfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720792778; c=relaxed/simple;
	bh=3PJpSb7syoI8d0MnBStlZ7y6aXYPJZKQxMhWdXI/3cQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=plt1UQI8q6Ktv6liq4RXuIr2o9V6SDpmBgpJa4g31qz4ss/Z9psLMCz6gzu342UdJo89tB8RMZ6jDyLjuYxS+7LZCHKu0h9M7eC1nfeut8rRXAgzFu3Ivm2VX0bXXDcgDciqJwcexzTGDaPnYbRSYqovr4P9vHpmUohyx2UXHHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-64b3655297aso18930927b3.1;
        Fri, 12 Jul 2024 06:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720792775; x=1721397575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAqV2pI3+2hLKtYJunekzdt/QFbIQwqqn0RUxdKplAY=;
        b=cz4mSDFMc43i5+lvTgTOQMI78TKugfvjE/vRnptHFmn/GypUMrBMerGqLQPzTKs09X
         U9IvZfngWe0mpg9L++FCJBJqzBQ+iYZEKl/Ch/SNAFoAU2hSMW0KaY4Jj6Bsh3vBE9BF
         u1IgPmld9GWDs4O1e0eOpY8foS7KLlpGx+txoK3I94OS7xtqmxzj/HFSt5Hoak2/vFx3
         +KNCSUlylEsL61gEBCorB1h3Y4TQqRx1q6tiR0+5NlARgzAKX6pfsHSBEcCUwuo3Fzbb
         nSYjCBubAE+92CV5uTE+L1Ti+A5ZPkpAgr84SpfClhNbT8ooTOwduXTgxRkUdOWknkqW
         5eKw==
X-Forwarded-Encrypted: i=1; AJvYcCW/rMe2GzT+RAEBm4FXqIUVzFPM/q+LAmsY6v1GAoCtH3ocLYZoEnOgauwLS6iRJ899cLvWI24pew1x1zCcrqDyS+LF3J9q551MboKhU9ZMQ7aq8Bf7jnzs7JBTEevEamHf6xC06JiJP1ykFexgfU/FDprFiojp/vgmZjY4HJJrHAb5Gb+sN2ChGjA=
X-Gm-Message-State: AOJu0YxbRSlKyD1lsmVn6hDmEEYZgT1HuEXzIAEAXL4emX0nnnVRarXy
	9Z6QMF3Uj/s7LhjYnaE/MYJJuBpgVXfZfRDdSO34wOHo61YC/sMYHw4bLPPg
X-Google-Smtp-Source: AGHT+IHW1GiixNeOY5HxuG5NNPUzgcg+MnoZNcKuo6HjJKxZ0Szb/z9vXiXd8LQiXS7QewBeTYUoCA==
X-Received: by 2002:a81:8486:0:b0:649:8f00:5254 with SMTP id 00721157ae682-658ee791033mr116819027b3.1.1720792775565;
        Fri, 12 Jul 2024 06:59:35 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-658e69da06csm15102427b3.113.2024.07.12.06.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 06:59:35 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-64b3655297aso18930447b3.1;
        Fri, 12 Jul 2024 06:59:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWv2KVpWjJvOif7VZ5Y36dVIiTbK1PjkCBkvZ++iXdHaQNlZokC5mUOIWaf2ze2lXPTFjZC+UJ8MbLYUHQGdNxE8BqitdNSXmus72/wZY1L2Tpwv4qJvz4wEPmYnT7bTUIK4mWR9RpGcsaD8+xflClcp8Dq/MADNapk/m1bFU4qYG9+zlUq4PaMQvY=
X-Received: by 2002:a81:5cc6:0:b0:64b:13f6:46ea with SMTP id
 00721157ae682-658eef599cfmr114962707b3.22.1720792775195; Fri, 12 Jul 2024
 06:59:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628131021.177866-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240628131021.177866-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240628131021.177866-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jul 2024 15:59:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWEcVjPwnW+wXonv_Pt0jtXNnZSKp9wPY93GqeSugVC5Q@mail.gmail.com>
Message-ID: <CAMuHMdWEcVjPwnW+wXonv_Pt0jtXNnZSKp9wPY93GqeSugVC5Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: renesas: rzg2l-cpg: Simplify rzg3s_cpg_div_clk_register
 function
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Fri, Jun 28, 2024 at 3:11=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Refactor the `rzg3s_cpg_div_clk_register` function to eliminate the
> unnecessary `base` parameter and streamline parameter usage. The `base`
> pointer was unused, and the `clks` pointer can be accessed directly from
> the `priv` structure.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -339,9 +339,9 @@ static const struct clk_ops rzg3s_div_clk_ops =3D {
>  };
>
>  static struct clk * __init
> -rzg3s_cpg_div_clk_register(const struct cpg_core_clk *core, struct clk *=
*clks,
> -                          void __iomem *base, struct rzg2l_cpg_priv *pri=
v)
> +rzg3s_cpg_div_clk_register(const struct cpg_core_clk *core, struct rzg2l=
_cpg_priv *priv)
>  {
> +       struct clk **clks =3D priv->clks;

"clks" is used only once in this function, so I'd rather use priv->clks[...=
]
directly below instead of adding another local variable.

>         struct div_hw_data *div_hw_data;
>         struct clk_init_data init =3D {};
>         const struct clk_div_table *clkt;

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

