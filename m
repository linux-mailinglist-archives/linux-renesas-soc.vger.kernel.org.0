Return-Path: <linux-renesas-soc+bounces-15791-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EACA84985
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 18:25:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4436E7A715D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 16:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C3B11EFF80;
	Thu, 10 Apr 2025 16:25:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443BB1EE031;
	Thu, 10 Apr 2025 16:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744302332; cv=none; b=jpylWSqJ9vjwt2jG5cAwBrjfmedsR6lm7PC9qSGcB5Jag107iBAwbEO+MhTNNAJpjDnxurpwjxSY+fX8GL+1qUK2xQjrkOYvXo+rA0095/ZYZe+OOoiN1yhowi+HxzDLy0qM8VSsruBAt8CHPrEMFQVrXYOzWYiu1SxYLdEFfdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744302332; c=relaxed/simple;
	bh=lykLsCueFpXf3nA5FB3qabRR6p+XCyjF3DtVPfyIVz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xffy+SgU8tHrIPQy7OjipGTAvTGWNsfr5EmbmZxvmx4vRP7kz55+CwUQVhiFt1F7URWxrPoLRYYPfJ8NvQp00UZXCssaPDPLSBkJKt2TNwhlJR5y0bI3mj9DISpYu4WbfpX9WdICSJA7Vmx/DCpQjT7WEnfbTpQQSPxc6Uy75CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-86feb848764so406374241.0;
        Thu, 10 Apr 2025 09:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744302327; x=1744907127;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=78W5qKZnlTfZQHkWBjobZ2XI6psT4APTbxKfnxPmKTg=;
        b=YF/kyiE/XJ71egv2wmaPSFv56mRX4av9h4ssCrU/1T86eTViTyqVrWm9nHxU+IIBju
         lAXhJhcui8+F2RVU0CjASJ4GfNgNl2HvUELdC7KfeCF0CZjWssRXdOj3KNCmZmXsRZw5
         oP/+HYS/Rv0jQ3WqzLMgjYaNBxHw+aCHi+nk3k3AUW0LxYYopyEiqMRRIktwq/1e7Cq2
         p1I55jCje/VNNQtS4yLj9g6l6gYN4C6QbQ26cD4fCmpMMT4KOjm3dnJM+V1kdTpmCRm+
         8wHnmdN1SUS34h6rJDCSuLQPUIZxq68N8JCNhdFyJpfyb8lprknoB4S6t05JuQ4RR9OX
         X6/A==
X-Forwarded-Encrypted: i=1; AJvYcCUNKGCGf83kYBaCjDiz4Y1/f/LmVnGMFcOF3XfrT/0bZAk3h8pihhU6tq7yoR7g1yGtxMazSgFFlPI+NyjT@vger.kernel.org, AJvYcCWmK//E5y0fw4dWVsQJ/jZpEYrvZTCsgAqoYZ49B/kgfOXZlmJd2PY0m1nvxSruTv0QyT5Ay2MDCeHd@vger.kernel.org, AJvYcCXDE0fpTlaYe31+f3CtBw7PcU61SiuAJu1RxfQTjfyPISoFMQFgl/IqPiH/RKqCQWYEAc/fTrcnjqun@vger.kernel.org, AJvYcCXnUQBWjAHs83bEt2G3B61qj/dQTNvDHo9Vc8let3iO6ouhOI++09HmT9vxndQb3Xea3iaPzI9YzARzP+chCcACHgM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzgATcKdDbX1ZTFS8iXtEefLU+uTqy8w6LoL9MBnkFkX5FxH3n
	v+C8samdB2KilEvC4yo3VHSv8PsatKTNJLyiJwY5Jjkc9lwQ53np4S8NVLnRXwA=
X-Gm-Gg: ASbGncvExIYLK/1XkHbWXOpRFCLm//J81pbWEhPXp24SMgQ91H5ENvWyVJCaan5oQX2
	iMGVkuESxNkGLKlRBMaD7dYWeifeDQXWfIRtluk+PJbbmOsYouVZZzWvduUBjC94hdyjLLafCBt
	Z6rpRNC2mIPmYCD20rlLUjES69wo2/V3iZv4F7YqDvrQEfTbU2PzKI+Ji5A+am+Ar9HL4yenBnO
	ZamqWlo/qbBHdCWu5YzZXxRENNLqEAlhTaq8mGF5lSucyLgYcxXdC/XdQ7vSVfs8CUNT3h0KykE
	p/253vsAzTT0COCebgv3Ajtytc8/nK081dUMfIrAwd2Y3UjXShCGo/JkDJ8Y4penokuqwjw5vnG
	B+VM=
X-Google-Smtp-Source: AGHT+IE+UigPIYi2OHpeTgeGxruFKeQhlp3/ftbE22toZemUTKcKUJn3QdmBOx7KwWu43AASG1QWbw==
X-Received: by 2002:a05:6102:4b0b:b0:4c1:9159:859c with SMTP id ada2fe7eead31-4c9d629a1c2mr2770331137.15.1744302327229;
        Thu, 10 Apr 2025 09:25:27 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c9c9738859sm664436137.3.2025.04.10.09.25.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 09:25:26 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-86feb848764so406346241.0;
        Thu, 10 Apr 2025 09:25:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0NXYBbPemKC1+0zaGvVQkXHEpS8SywT9okI3gLc9X/Z1gYKimG+3lvidLiuUFL+8WiMGQalpPleD5@vger.kernel.org, AJvYcCVKqOwm/CIKcNTkWalrnegsCSqbGlzVl8lluoNtvpNfU6gMxh9uAw6rj+YZq4d8w8NbBYNwSowj2S1h@vger.kernel.org, AJvYcCVctAeC39ziWuPSYPYWplW1BgBslxYYHWKeWeg5zZBMqB4T8Y0KTkapXDUWUdeSG03hnAmLS+YWRtdTPzTm@vger.kernel.org, AJvYcCXPFXEX82yMVXU/9Qi1X29Gk3MVAEFPOy90R1CBSR4FzOYfKsOZsQzKh9vCSWxuomT4jujUQJ1trqYEi/7fdCjbeAU=@vger.kernel.org
X-Received: by 2002:a05:6102:5690:b0:4c1:9738:820d with SMTP id
 ada2fe7eead31-4c9d6259cd8mr2433189137.6.1744302326277; Thu, 10 Apr 2025
 09:25:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317083213.371614-1-tommaso.merciai.xr@bp.renesas.com> <20250317083213.371614-4-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250317083213.371614-4-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Apr 2025 18:25:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJqtLKBK6hf0iGGHcPaTdZm10GiiqcBpkPrJSq=KL-cw@mail.gmail.com>
X-Gm-Features: ATxdqUFwVh-lZqZBAQbhJWNemTgyfpBfQYsBr5BBAUZXUYi1SFARuyVahDZ8WAE
Message-ID: <CAMuHMdVJqtLKBK6hf0iGGHcPaTdZm10GiiqcBpkPrJSq=KL-cw@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: renesas: rzv2h: Simplify rzv2h_cpg_assert()/rzv2h_cpg_deassert()
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Pavel Machek <pavel@denx.de>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Mon, 17 Mar 2025 at 09:33, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> rzv2h_cpg_assert() and rzv2h_cpg_deassert() functions are similar. Share
> this code via __rzv2h_cpg_assert(). This avoid code duplication.
>
> Reported-by: Pavel Machek <pavel@denx.de>
> Closes: https://lore.kernel.org/cip-dev/Z9QA9rwuXCuVbOXp@duo.ucw.cz/
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.16.

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -652,16 +652,17 @@ rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
>                 mod->name, PTR_ERR(clk));
>  }
>
> -static int rzv2h_cpg_assert(struct reset_controller_dev *rcdev,
> -                           unsigned long id)
> +static int __rzv2h_cpg_assert(struct reset_controller_dev *rcdev,
> +                             unsigned long id, bool assert)
>  {
>         struct rzv2h_cpg_priv *priv = rcdev_to_priv(rcdev);
>         unsigned int reg = GET_RST_OFFSET(priv->resets[id].reset_index);
>         u32 mask = BIT(priv->resets[id].reset_bit);
>         u8 monbit = priv->resets[id].mon_bit;
> -       u32 value = mask << 16;
> +       u32 value = assert ? (mask << 16) : ((mask << 16) | mask);

Do you mind if I change this to

    u32 value = mask << 16;

    if (!assert)
            value |= mask;

while applying?

>
> -       dev_dbg(rcdev->dev, "assert id:%ld offset:0x%x\n", id, reg);
> +       dev_dbg(rcdev->dev, "%s id:%ld offset:0x%x\n",
> +               assert ? "assert" : "deassert", id, reg);
>
>         writel(value, priv->base + reg);
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

