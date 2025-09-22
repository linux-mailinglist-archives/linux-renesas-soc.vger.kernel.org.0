Return-Path: <linux-renesas-soc+bounces-22136-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EED6B906D2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 13:36:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A23616A1D0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 11:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3F22FB967;
	Mon, 22 Sep 2025 11:35:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988622C2349
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 11:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758540917; cv=none; b=tDYetjr2l6uU26X9ezSYel9LmCsKsgy8Hhl7+jg4wrCW0ALXe2HgeSW9RjCQyEwur2VZe9nejgbiwR2r9HfQkChF+PanJbm21oMp5EGPzRP/z0vX+FUXQpK6cjP4fk0Cilpzy3hiwP9I7GXx0S/54Tu9jEiyHhRMqTV0HdMuaCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758540917; c=relaxed/simple;
	bh=pC2LETsInlFYWoF2ndCVBnfYZpgXuZph/Fs+0bvzz18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PA9IN3hI5+x1taL14qbMBMmlu7UuLexvcymS57EiYhh3kHJw3kvW5eLFi8qQbIAqIg6xWi8pwAXQIm8M7j1lZmztv9E+83r3pyC5BJ89N6yFDFH8k2lgBxLUr2bbCFpM0hPrY0QN7yCc22qoB+8+gk3Pn6MDvA4cbEFj5y5whAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-54bc08ef45dso236146e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 04:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758540914; x=1759145714;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MyqZ9tpDjoz0HB6ZaIemgMAwpqfH9pb6N4giUusI5MU=;
        b=AM6G/SaiADTlgYOHoJ6RO6imWbjWFmSXyp2+kte19bb4xzxOac5DOwF9FxEUVzp2hS
         pMVlluD810ee0yTmsB/LF3H8QcxiygbtyYp0IjuqKgQQZTFM4Z6QW+OSvhRDoTNr423U
         fJ66XHISl4dfJ5dPHpfMwU2of4Q073304MeQIDJvFB74+BiNKB/zHfvaU2aFIBHo2B3B
         0bIL2lgw8BZ9U77YSj8/HA25JOIRxtHykI8dBKoALyQaVP+ot+DOY0ID8kMNiF91oJl4
         G6QG3jwSvr23fpgNpSExSma9aRizke7bmzjypQynLDgFl9uRekl/mO2/ftOv7SoFVemL
         8tVw==
X-Forwarded-Encrypted: i=1; AJvYcCWQ356p45XTG+tF2z5lvJB0RlYmA6jR4UWY5v1pKPEei8a2XkwTtV9dryhDBYy/Mfb2g7P48KOcbLom5G4nGSucDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNZIQ3Z4Up2Obpv9ESJ8WSZFusYG9BGP7xnsYxwb3QloBnTSEm
	pnhw6kn56Zw70t5zLFoQ1txSfw0AvOEt5MWekpT5agJvnTJN+I/Pgf1b7yjyIz4U
X-Gm-Gg: ASbGnct8xTFFLUXIOq9LviiLdCvkRjtDdPkiK630xQF8sCQOaD6ns18Bt8gwzmIQbru
	GZUooqB3UsLOLkU6m3tQHp+SBMHLaqsUFZJzCr0fVNMVVOzqZSNSASleCtwbJSZvL+2x6aOscZ2
	nNEs1kyPySKcYU5ZvcR8F/v5YJdJJffM5qIK/2pMaCZqN7iPM5cdhqn3vwWRCRYbrBDSBpPkKJm
	Ytx+XF+eOI4PZ1mBxcOUj9qtx0v3TlBcSTV+qX3bW5jI/+QEFtt7RRZBhdA0pjrS9D5lq/F626A
	T0bELqabbaDCYShjJlpSXEMV/wDLi22xC13u7YxWCqd0qMR1nQBKJyekXvL7xnplhkONNpVdK5V
	1LFgqgn44rVYaHMt6dpdBPWu72Yd7Zd6rDMn2l5VaeZMwZFAV5uffiTE6AdB8
X-Google-Smtp-Source: AGHT+IHc3jmP1foScgzyyxeXFnAFrR3vjEFdO80QPL8KS7KC2Et7atiQILj7Y0XBh0Gr/z5ksmDFAw==
X-Received: by 2002:a05:6122:3183:b0:54a:71f6:d570 with SMTP id 71dfb90a1353d-54a8358b963mr3358747e0c.0.1758540914191;
        Mon, 22 Sep 2025 04:35:14 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a822372cesm2107980e0c.12.2025.09.22.04.35.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 04:35:13 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5300b29615cso3634195137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 04:35:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV8/PEaQChRUIsuD3PpmUCXUXEANKV74anpg2agnuBGFRq1CsvfwTlgtlMtGmGqL+3hKW9K5kynzWfTRkLUa/ljFg==@vger.kernel.org
X-Received: by 2002:a05:6102:c0b:b0:4fa:25a2:5804 with SMTP id
 ada2fe7eead31-588dada35dfmr4060461137.10.1758540913268; Mon, 22 Sep 2025
 04:35:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918134526.18929-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250918134526.18929-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Sep 2025 13:35:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWncCJQ_5uiATC+JhGr8K2ewO72L0DTWXtcx-OF-P=zVQ@mail.gmail.com>
X-Gm-Features: AS18NWA-wZX_6-T1SyUmh1jF7OGLy8IIlD-83kuaXAMxnaI4vnu46kVW6CwdYiw
Message-ID: <CAMuHMdWncCJQ_5uiATC+JhGr8K2ewO72L0DTWXtcx-OF-P=zVQ@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: cpg-mssr: Read back reset registers to
 assure values latched
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Thu, 18 Sept 2025 at 15:45, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> On R-Car V4H, the PCIEC controller DBI read would generate an SError
> in case the controller reset is released by writing SRSTCLR register
> first, and immediately afterward reading some PCIEC controller DBI
> register. The issue triggers in rcar_gen4_pcie_additional_common_init()
> on dw_pcie_readl_dbi(dw, PCIE_PORT_LANE_SKEW), which on V4H is the first
> read after reset_control_deassert(dw->core_rsts[DW_PCIE_PWR_RST].rstc).
>
> The reset controller which contains the SRSTCLR register and the PCIEC
> controller which contains the DBI register share the same root access
> bus, but the bus then splits into separate segments before reaching
> each IP. Even if the SRSTCLR write access was posted on the bus before
> the DBI read access, it seems the DBI read access may reach the PCIEC
> controller before the SRSTCLR write completed, and trigger the SError.
>
> Mitigate the issue by adding a dummy SRSTCLR read, which assures the
> SRSTCLR write completes fully and is latched into the reset controller,
> before the PCIEC DBI read access can occur.
>
> Fixes: 0ab55cf18341 ("clk: renesas: cpg-mssr: Add support for R-Car V4H")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch, which fixes the PCIe SError for me, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -676,18 +676,31 @@ static int __init cpg_mssr_add_clk_domain(struct device *dev,
>
>  #define rcdev_to_priv(x)       container_of(x, struct cpg_mssr_priv, rcdev)
>
> -static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
> -                         unsigned long id)
> +static int cpg_mssr_writel_with_latch(struct reset_controller_dev *rcdev,
> +                                     char *func, bool set, unsigned long id)

This function does a bit more than writel()-with-latch, so please find
a more suitable name. Or... continue reading.

>  {
>         struct cpg_mssr_priv *priv = rcdev_to_priv(rcdev);
>         unsigned int reg = id / 32;
>         unsigned int bit = id % 32;
> +       const u16 reset_reg = set ? priv->reset_regs[reg] : priv->reset_clear_regs[reg];
>         u32 bitmask = BIT(bit);
>
> -       dev_dbg(priv->dev, "reset %u%02u\n", reg, bit);
> +       if (func)
> +               dev_dbg(priv->dev, "%s %u%02u\n", func, reg, bit);
> +
> +       writel(bitmask, priv->pub.base0 + reset_reg);
> +       readl(priv->pub.base0 + reset_reg);
> +
> +       return 0;
> +}

Now, do we want a special de(reset)-with-latch() function (which does
reduce code duplication), or would a simpler variant be more useful?
After this, we have three different "dummy read" mechanisms in this
driver:

  1. Clock enable/disable and resume on RZ/A:

         writeb(value, priv->pub.base0 + priv->control_regs[reg]);

         /* dummy read to ensure write has completed */
         readb(priv->pub.base0 + priv->control_regs[reg]);
         barrier_data(priv->pub.base0 + priv->control_regs[reg]);

  2. Reset handling on R-Car:

         writel(bitmask, priv->pub.base0 + reset_reg);
         readl(priv->pub.base0 + reset_reg);

  3. Reset release on RZ/T2H and RZ/N2H:

         writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);

         /*
          * To secure processing after release from a module reset, dummy read
          * the same register at least seven times.
          */
         for (i = 0; i < 7; i++)
                 readl(priv->pub.base0 + priv->reset_regs[reg]);

So perhaps a simple helper like

    void writel_with_latch(u32 val, volatile void __iomem *addr, unsigned int n)
    {
            writel(val, addr);
            while (n-- > 0)
                    readl(addr);
    }

? Do we need barrier_data(), like on RZ/A?

Unfortunately RZ/A uses byte-wide registers, so that one needs another
copy.

> +
> +static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
> +                         unsigned long id)
> +{
> +       struct cpg_mssr_priv *priv = rcdev_to_priv(rcdev);

"priv" is unused (no compiler warning on your side?)

>
>         /* Reset module */
> -       writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
> +       cpg_mssr_writel_with_latch(rcdev, "reset", true, id);
>
>         /*
>          * On R-Car Gen4, delay after SRCR has been written is 1ms.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

