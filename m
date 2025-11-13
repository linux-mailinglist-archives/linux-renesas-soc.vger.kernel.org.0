Return-Path: <linux-renesas-soc+bounces-24596-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A06FCC59BC0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 20:24:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7A2134EC0EB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 19:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C535E31A567;
	Thu, 13 Nov 2025 19:15:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108F930FF1C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 19:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763061332; cv=none; b=Y6bc8gjo1aMVRfYuBYQzr4xqlgDzUOWMN5yz0bB6z2LhSio43o6luqLGmwyv8onNQUfvLzU+OR4Y/S93wiOb0OwKDBAQf0j3NdQEHeqzOzbRyEafA7CnBWU2Ln3/lBID/YM+cSfueIsF72yD1XG2oAjhISXF9RTFE1Nr4nwqrg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763061332; c=relaxed/simple;
	bh=/M7N2B0FJzV8RGfkB71E3a5NRyA13r6fYibmBqpj6KQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bbWMDJqAXuD+Wkg3nr3qjhaehgoafZ96cGQKWxT0wGWCu3isn+7FEprnuK+VxhaRvumZ0MhlDz7CXdByJZMpmR5TljnbJbNhS4WQvd/J/0Dw9vNDYIyMEKLCsBHm808FFukygZUZli1msqXJptRcv0lkBdhbAE6FAoAvt2c2YHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5598942c187so1385785e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 11:15:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763061330; x=1763666130;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3hic+mCD7GbOskFopBa2RINZ7PmcY+d1bkfvC4aVN0=;
        b=oqlATq5QzQDCjWG0JhCR4q3MFryOTNBbcIhGEcumiabgd7mC/ljvNp1MIIMl9YnsjD
         HXKM7j4eBxe7t/zJ49f3LMhNhYAdlpd1G8QGXemMdGJpZPUUmv7rXUDltYztYj0omioy
         qlKqCBV9FKgPI4VKBW6qygG11TjWsowjDCIy2ACZeGKQPAX7fVF+QNTVoCxISWKz5M89
         g7ncGu55bn9z2kjzBnDaKKmF+JqtgrBL8P9X5/y/E64W54AMhBZqhbz5lYKtLuW29BAV
         HoCVXHgSaDPBGXNNmVYrvFYL9xNBE77hyaknjLY+ww7nfkJg6LgKhACACnwlBDBSUweA
         4cVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL1wTx9qNLj/W81qlHkmbCfoVkHetxvl3c5RUu7WdKxwCrTME0OiNqVb+2pSLKrybgLp8yYq9yJoFhs0ZydW6Y+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyQkWaWsUS4ay3+Qia3kTc4rQOG7FoJ19bSnfa06g63WyuSq8A
	Yd3FUF+ixyh5RDSo3TnIUPjqxOy2W/ETImxshORwMUrMamEfTjoQO8/j5XPqtBwqrUM=
X-Gm-Gg: ASbGncsyk8Bevpm0HYTOMz3HpUyiNHq2aY8caUR7lmQ/vjENOvQPKECAtWxpxzlpd92
	L0/KrbWL+KIGn/5zpSCzfoU38wFdBYXBArNhVxk64ykJdZuvysI9cMAnQ+eFFTywuaG+8Wtu0Yv
	l6I/Qinph5+rkthMCXes9NOFyQtCtuA8EGY3cFV9MyQ8h2SvTQgkfTgoG2LPGKQBV6mT95J6EyA
	bflpOejBtdtEXEeDD6PfnBZhojXFkgAVfhuhPWkhRNvBmj18j33I939aTr8DpEwvf8Wd+uIC82z
	JI4+VS+Nu3qT2t98SRQuhaJZlVtMlYqxmOKa0nvAGsmxU7N7+T7LwKgLAvNvJiwWc1r9FYxKJiM
	TruAC+rkCmZnVS/QH6JzTE0gX9eBkeHGIenNygsFHHehGBXBvnDTOB5+tbL8si/mUJaBnhVdI3I
	MlSuxuPyLrjSVzoTkJ98NE/irDSE1EYsKR8uvtBxFtAWoKQZta
X-Google-Smtp-Source: AGHT+IG811e2jP/K/Tj8NCTShoxvIfMtgCByqoPSQq7PK8UMyodD4PCaLYjg6ESKuxhXRZDN/OszUg==
X-Received: by 2002:a05:6122:20a0:b0:559:96be:fd8 with SMTP id 71dfb90a1353d-55b0d00afdamr1843186e0c.2.1763061329584;
        Thu, 13 Nov 2025 11:15:29 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f359fa2sm1064292e0c.8.2025.11.13.11.15.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 11:15:29 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5deb0b2f685so1300315137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 11:15:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUvMN5NGE752lRrHAjsWivp1hVtolqVVCNx0olZLlOuhjEEIFhypZZQAPZQ85Xkz77d4tTpgR+zIFqrlYYBpeU6vg==@vger.kernel.org
X-Received: by 2002:a05:6102:4487:b0:5d5:f6ae:3903 with SMTP id
 ada2fe7eead31-5dfb43a5a9fmr2175974137.20.1763061329231; Thu, 13 Nov 2025
 11:15:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251105070526.264445-1-claudiu.beznea.uj@bp.renesas.com> <20251105070526.264445-3-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20251105070526.264445-3-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 20:15:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUwVeLtyQ9X-Lz16W=KtbfjiPqsgWfuDc72B3u6OCtqgg@mail.gmail.com>
X-Gm-Features: AWmQ_bmP3UqPGBklX-H_xBoQGd0jPSB3ibHsJDk-_5_rvxom5WcQ03xsAM0GwXk
Message-ID: <CAMuHMdUwVeLtyQ9X-Lz16W=KtbfjiPqsgWfuDc72B3u6OCtqgg@mail.gmail.com>
Subject: Re: [PATCH 2/2] soc: renesas: rz-sysc: Populate readable_reg/writeable_reg
 in regmap config
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: magnus.damm@gmail.com, john.madieu.xa@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Wed, 5 Nov 2025 at 08:05, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Not all system controller registers are accessible from Linux. Accessing
> such registers generates synchronous external abort. Populate the
> readable_reg and writeable_reg members of the regmap config to inform the
> regmap core which registers can be accessed. The list will need to be
> updated whenever new system controller functionality is exported through
> regmap.
>
> Fixes: 2da2740fb9c8 ("soc: renesas: rz-sysc: Add syscon/regmap support")
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - added all SYSC registers IP specific, except the SPI
>   registers on RZ/V2H and RZ/V2N as these are accessible only from EL3

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19.

> --- a/drivers/soc/renesas/r9a08g045-sysc.c
> +++ b/drivers/soc/renesas/r9a08g045-sysc.c

> @@ -18,7 +37,57 @@ static const struct rz_sysc_soc_id_init_data rzg3s_sysc_soc_id_init_data __initc
>         .specific_id_mask = GENMASK(27, 0),
>  };
>
> +static bool rzg3s_regmap_readable_reg(struct device *dev, unsigned int reg)
> +{
> +       switch (reg) {
> +       case SYS_XSPI_MAP_STAADD_CS0:
> +       case SYS_XSPI_MAP_ENDADD_CS0:
> +       case SYS_XSPI_MAP_STAADD_CS1:
> +       case SYS_XSPI_MAP_ENDADD_CS1:
> +       case SYS_GETH0_CFG:
> +       case SYS_GETH1_CFG:
> +       case SYS_PCIE_CFG:
> +       case SYS_PCIE_MON:
> +       case SYS_PCIE_ERR_MON:
> +       case SYS_PCIE_PHY:
> +       case SYS_I2C0_CFG:
> +       case SYS_I2C1_CFG:
> +       case SYS_I2C2_CFG:
> +       case SYS_I2C3_CFG:
> +       case SYS_I3C_CFG:
> +       case SYS_USB_PWRRDY:
> +       case SYS_PCIE_RST_RSM_B:
> +               return true;
> +       default:
> +               return false;
> +       }
> +}
> +
> +static bool rzg3s_regmap_writeable_reg(struct device *dev, unsigned int reg)
> +{
> +       switch (reg) {
> +       case SYS_XSPI_MAP_STAADD_CS0:
> +       case SYS_XSPI_MAP_ENDADD_CS0:
> +       case SYS_XSPI_MAP_STAADD_CS1:
> +       case SYS_XSPI_MAP_ENDADD_CS1:
> +       case SYS_PCIE_CFG:
> +       case SYS_PCIE_PHY:
> +       case SYS_I2C0_CFG:
> +       case SYS_I2C1_CFG:
> +       case SYS_I2C2_CFG:
> +       case SYS_I2C3_CFG:
> +       case SYS_I3C_CFG:
> +       case SYS_USB_PWRRDY:
> +       case SYS_PCIE_RST_RSM_B:
> +               return true;
> +       default:
> +               return false;
> +       }
> +}

As all the writeable regs are a subset of the readable regs, do you
think it would be worthwhile to write e.g.

    static bool rzg3s_regmap_readable_reg(struct device *dev, unsigned int reg)
    {
            if (rzg3s_regmap_writeable_reg(dev, reg))
                    return true;

            switch (reg) {
            case SYS_GETH0_CFG:
            case SYS_GETH1_CFG:
            case SYS_PCIE_MON:
            case SYS_PCIE_ERR_MON:
                    return true;
            default:
                    return false;
            }
    }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

