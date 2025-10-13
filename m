Return-Path: <linux-renesas-soc+bounces-22955-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A22BBD5017
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 18:26:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D736483E73
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 16:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1DBD30E0CD;
	Mon, 13 Oct 2025 15:46:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED375272805
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 15:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760370415; cv=none; b=tKaGlNI2IArqP8Pht4Xzg9ucAeY7/BKR7qHgKCdWAHIZJPjMh+nYEALf72bljHZ9lsWbgF/vOs1CSeSpmCfklfffo0B4qhllzv1zkIwOQU2d52ZKJZbwsevlQ5RDvD91+jkdch/I1WXGqs9zyN32xIeCWUS1yPaYgZ4RYkBU9ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760370415; c=relaxed/simple;
	bh=UlmRHBnP3MpiQ+OwZRY1Jv/J/gbcIYNu5Xl0caw6270=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OOjikUjZyGpucykY5pVuKOu1SDP3RtUKOKg5WjsoJrFDyFA1Yf+N9GINTsVKJ3TXKq2VWGDgZPeVhk4pPU71MGJcw8l06yqvrC67Aa1aWltrSg9q+oUFshPtV0CptGQj/JFaC/gSss4Xf5St8LEivwe296hokng7OvT5bc6qANg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9231a251c01so1026508241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 08:46:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760370412; x=1760975212;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PtJsWdibGOFQ5FzXb1Mac56uXQ5iFDLzA2u7VIR4IYY=;
        b=XqcJfRBrgq5M86cpURGWpG06aYzxE7hXlQUaSvtMoAat7+9y9WZ2mQeGoIWg+wZFwu
         Ef7BLJnJemUYpmZuxzlPPzDWiqTEQdX+xeK3UT5W6Tw5TBbgFeqZyzLVk12UFiuUPTn4
         IKZkZlZRW2J3znWdYBJHFFtz1a1OM4B3l1RTAR0YD1uKGrBde7Y20p3zYiOgtLxNS71q
         ZfxoEuEfh0bFRE5TkD0AxCTKgRYweq2igjhNxKUe65/jrwotHSJ1BuN60F6M/QVVtxF+
         86nS5ovqH1cBHUjD59p8BBdZNQCGdgdQAvcufX7fyIIWpDvPsgEQ8cJhl4A6hUs14X6K
         UbNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe5dlyfzaMFyXnUbIj+M7rMvg4f10+ek0yahVyYb29XZdooVPWRrPM/nrNQv9u/AWzOACvRETJzuDTXMmGC0NAsw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5yRDteQqrySO4hzeCUE+skoWwCNeUR9aubWsPY+F9UraumjyR
	E4uCpBAbanEodxUyBBXA+aLw4ro4htDvJ0tkh8lf0Jj4BwaFEsCd97ooFsxHo8BK
X-Gm-Gg: ASbGncuEoD/i+Pqd+h4zi0gX6g1Afj3yK4ObsqR3lCZLWmpiaPcC5i8O7AADpgiSRgR
	RVPTBv8VMVoiFuOzlkHtwjd3M3OpUvqWcbwH+7W8T6KXAPjlS/GQQv39P3n6i8KJ/otGXn/cCyP
	8fVEbjKZgbkJtryVijKIJs/t5SrULlTA30NvrEQ6H1b2PP5uQXEWU5BvZ+CWAeVe9CMsXejlJcy
	CFxYSk+Pzviy8gEDDoU6mm+k7LRszm2CUylar7zw+H6evVkWE1cE+EPTw2VbVoqxowf8pIYemdE
	S49QtTNg6lPS5vluYHaZJiVt0PCe1Cvt/E7ksNF0n9xbQXNRPdTGmYIgI7z4HTdxmyh3VRBKhVH
	Mb6G/eNzyGr06UsgrcmCjKQezQ+Np329FbYM12g7scDJTnjnnmbu8MleGZOx7L6W8hEM7vpQzDH
	+1ITa3Fc5hW6JaNQ==
X-Google-Smtp-Source: AGHT+IEiKcR9nqELcQA3IFyKObeFU+qu1CB8GPtmnb2EJFa8w6OGpB+GP4eFhyvP/1BBwaSOoW8y/Q==
X-Received: by 2002:a05:6102:c89:b0:569:93c9:b572 with SMTP id ada2fe7eead31-5d5e224f425mr7867564137.9.1760370412431;
        Mon, 13 Oct 2025 08:46:52 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-930bf7ad6f3sm2743625241.17.2025.10.13.08.46.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 08:46:51 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-55784771e9dso1954559137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 08:46:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWG5NgDlyuKvXM5oOxBj/fmAbZBxZpPq3RZjvbmX2UGvBMY5pZPl24uvY/FJSM9DwVvrSYGROpptMuGc49ckjeZKg==@vger.kernel.org
X-Received: by 2002:a05:6102:3e25:b0:521:b9f2:a5ca with SMTP id
 ada2fe7eead31-5d5e224f3c1mr7951324137.13.1760370410972; Mon, 13 Oct 2025
 08:46:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929112324.3622148-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250929112324.3622148-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Oct 2025 17:46:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXz0ThdhjeeurjE6TLXjVLXUy-ie-PqXHrTYExQ6TpeLA@mail.gmail.com>
X-Gm-Features: AS18NWCTwKq3E1BVZam3Q34YfaC1jIp6YPas2zUMEY6rkQoDMFp4o8_Br3H8oBc
Message-ID: <CAMuHMdXz0ThdhjeeurjE6TLXjVLXUy-ie-PqXHrTYExQ6TpeLA@mail.gmail.com>
Subject: Re: [PATCH v4] clk: renesas: cpg-mssr: Add module reset support for RZ/T2H
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 29 Sept 2025 at 13:23, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for module reset handling on the RZ/T2H SoC. Unlike earlier
> CPG/MSSR variants, RZ/T2H uses a unified set of Module Reset Control
> Registers (MRCR) where both reset and deassert actions are done via
> read-modify-write (RMW) to the same register.
>
> Introduce a new MRCR offset table (mrcr_for_rzt2h) for RZ/T2H and assign
> it to reset_regs. For this SoC, the number of resets is based on the
> number of MRCR registers rather than the number of module clocks. Also
> add cpg_mrcr_reset_ops to implement reset, assert, and deassert using RMW
> while holding the spinlock. This follows the RZ/T2H requirements, where
> processing after releasing a module reset must be secured by performing
> seven dummy reads of the same register, and where a module that is reset
> and released again must ensure the target bit in the Module Reset Control
> Register is set to 1.
>
> Update the reset controller registration to select cpg_mrcr_reset_ops for
> RZ/T2H, while keeping the existing cpg_mssr_reset_ops for other SoCs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4:
> - Renamed cpg_mrcr_set_bit() to cpg_mrcr_set_reset_state() for clarity.
> - Updated the parameters in cpg_mrcr_set_reset_state().

Thanks for the update!

> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -736,6 +754,72 @@ static int cpg_mssr_status(struct reset_controller_dev *rcdev,
>         return !!(readl(priv->pub.base0 + priv->reset_regs[reg]) & bitmask);
>  }
>
> +static int cpg_mrcr_set_reset_state(struct reset_controller_dev *rcdev,
> +                                   unsigned long id, bool set)
> +{
> +       struct cpg_mssr_priv *priv = rcdev_to_priv(rcdev);
> +       unsigned int reg = id / 32;
> +       unsigned int bit = id % 32;
> +       u32 bitmask = BIT(bit);
> +       void __iomem *reg_addr;
> +       unsigned long flags;
> +       unsigned int i;
> +       u32 val;
> +
> +       dev_dbg(priv->dev, "%s %u%02u\n", set ? "assert" : "deassert", reg, bit);
> +
> +       spin_lock_irqsave(&priv->pub.rmw_lock, flags);
> +
> +       reg_addr = priv->pub.base0 + priv->reset_regs[reg];
> +       /* Read current value and modify */
> +       val = readl(reg_addr);
> +       if (set)
> +               val |= bitmask;
> +       else
> +               val &= ~bitmask;
> +       writel(val, reg_addr);
> +
> +       /*
> +        * For secure processing after release from a module reset, dummy read
> +        * the same register at least seven times.

This comment is waiting to become out-of-sync with the actual value...

> +        */
> +       for (i = 0; !set && i < RZT2H_RESET_REG_READ_COUNT; i++)
> +               readl(reg_addr);
> +
> +       /* Verify the operation */
> +       val = readl(reg_addr);
> +       if ((set && !(bitmask & val)) || (!set && (bitmask & val))) {

Perhaps just "set == !(bitmask & val)"? Or is that too obscure?

> +               dev_err(priv->dev, "Reset register %u%02u operation failed\n", reg, bit);
> +               spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
> +               return -EIO;
> +       }
> +
> +       spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
> +
> +       return 0;
> +}

Regardless:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

