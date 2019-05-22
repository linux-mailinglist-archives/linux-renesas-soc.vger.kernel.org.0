Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B902B2635A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 May 2019 14:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728450AbfEVMCI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 May 2019 08:02:08 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:35057 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727464AbfEVMCH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 May 2019 08:02:07 -0400
Received: by mail-vs1-f68.google.com with SMTP id q13so1235332vso.2;
        Wed, 22 May 2019 05:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KePk7BxEeBmUescRtgLbgAKoQJF6RzIgfNSFHJK5/y8=;
        b=eLNTguI8hp7921HNt8zymEmGkxCl1rEe5gjojMGHjPTDzkJq1e5zHmsCVb7+39OhVR
         uMoJyZW77rbrUT5uqM71/xg95pAyM8OGKMmUrFZGku1yr0NNWMRoSRW+x85y6C7JHcqr
         MOCw9uYlM+0PG+b6JrA1k/fafoHJA67cVLxe850NQ1GjEs4jvryAjQQRO1ZuXoEjo7qE
         2cTdfGkvRSYGM65j1VALL39HNfPSdhaKLNVHshfvlLi/OQBJFkp4BJufARPHv9xfFSgh
         6qiS0s0/m/3vvfUTuhLl4Fh+KCvQ22iMB5SI/z+TYE7gx+5ftm4MMS0/TzV7Vu/AUTNB
         OVlA==
X-Gm-Message-State: APjAAAWpC1I2S1XtiDY0dkfhT1s9AQ97TJvmJTaszsSP3xhER9yw5S/j
        /a5ZBOLyqjKBXfMX37lDQjMsNa/qObAXq4k/PUs=
X-Google-Smtp-Source: APXvYqwoH3E3qPmtK7oOXFar/xCNLEDWqr5sAN4KTZLD7szH09iRU5BhUo1+1byeNChLDfg9fNdDAR6WY6lKCv4z668=
X-Received: by 2002:a67:f589:: with SMTP id i9mr11868819vso.152.1558526525732;
 Wed, 22 May 2019 05:02:05 -0700 (PDT)
MIME-Version: 1.0
References: <1558442111-10599-1-git-send-email-gareth.williams.jx@renesas.com>
In-Reply-To: <1558442111-10599-1-git-send-email-gareth.williams.jx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 22 May 2019 14:01:54 +0200
Message-ID: <CAMuHMdWGwfDtRcfdzPCpQaM8X=x+s0uT7j+EnRP4Yta+4Nx9Gg@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: r9a06g032: Add clock domain support
To:     Gareth Williams <gareth.williams.jx@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Gareth,

On Tue, May 21, 2019 at 2:35 PM Gareth Williams
<gareth.williams.jx@renesas.com> wrote:
> There are several clocks on the r9ag032 which are currently not enabled
> in their drivers that can be delegated to clock domain system for power
> management. Therefore add support for clock domain functionality to the
> r9a06g032 clock driver.
>
> Signed-off-by: Gareth Williams <gareth.williams.jx@renesas.com>
> ---
> v2:
>  - Rebased onto kernel/git/geert/renesas-drivers.git

Thanks for the update!

>  drivers/clk/renesas/r9a06g032-clocks.c | 243 ++++++++++++++++++++++++---------
>  1 file changed, 176 insertions(+), 67 deletions(-)

Please also update
Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.txt,
to describe #power-domain-cells (must be 0), and to update the provider
and consumer examples.

> --- a/drivers/clk/renesas/r9a06g032-clocks.c
> +++ b/drivers/clk/renesas/r9a06g032-clocks.c

> @@ -28,6 +30,7 @@ struct r9a06g032_gate {
>  /* This is used to describe a clock for instantiation */
>  struct r9a06g032_clkdesc {
>         const char *name;
> +       bool managed;

This flag can be integrated into the bit field below, avoiding a size
increase.

>         uint32_t type: 3;
>         uint32_t index: 8;
>         uint32_t source : 8; /* source index + 1 (0 == none) */
> @@ -60,7 +63,11 @@ struct r9a06g032_clkdesc {
>  #define D_GATE(_idx, _n, _src, ...) \
>         { .type = K_GATE, .index = R9A06G032_##_idx, \
>                 .source = 1 + R9A06G032_##_src, .name = _n, \
> -               .gate = I_GATE(__VA_ARGS__), }
> +               .managed = 0, .gate = I_GATE(__VA_ARGS__) }

No need to initialize static variable fields to zero.

> +#define D_MODULE(_idx, _n, _src, ...) \
> +       { .type = K_GATE, .index = R9A06G032_##_idx, \
> +               .source = 1 + R9A06G032_##_src, .name = _n, \
> +               .managed = 1, .gate = I_GATE(__VA_ARGS__) }
>  #define D_ROOT(_idx, _n, _mul, _div) \
>         { .type = K_FFC, .index = R9A06G032_##_idx, .name = _n, \
>                 .div = _div, .mul = _mul }
> @@ -170,7 +177,7 @@ static const struct r9a06g032_clkdesc r9a06g032_clocks[] __initconst = {
>         D_GATE(CLK_P6_PG2, "clk_p6_pg2", DIV_P6_PG, 0x8a3, 0x8a4, 0x8a5, 0, 0xb61, 0, 0),
>         D_GATE(CLK_P6_PG3, "clk_p6_pg3", DIV_P6_PG, 0x8a6, 0x8a7, 0x8a8, 0, 0xb62, 0, 0),
>         D_GATE(CLK_P6_PG4, "clk_p6_pg4", DIV_P6_PG, 0x8a9, 0x8aa, 0x8ab, 0, 0xb63, 0, 0),
> -       D_GATE(CLK_PCI_USB, "clk_pci_usb", CLKOUT_D40, 0xe6, 0, 0, 0, 0, 0, 0),
> +       D_MODULE(CLK_PCI_USB, "clk_pci_usb", CLKOUT_D40, 0xe6, 0, 0, 0, 0, 0, 0),

Is this correct? All other module clocks are HCLK_*?
You do have separate module clocks for USB host/function/power management
below?

>         D_GATE(CLK_QSPI0, "clk_qspi0", DIV_QSPI0, 0x2a4, 0x2a5, 0, 0, 0, 0, 0),
>         D_GATE(CLK_QSPI1, "clk_qspi1", DIV_QSPI1, 0x484, 0x485, 0, 0, 0, 0, 0),
>         D_GATE(CLK_RGMII_REF, "clk_rgmii_ref", CLKOUT_D8, 0x340, 0, 0, 0, 0, 0, 0),
> @@ -187,17 +194,17 @@ static const struct r9a06g032_clkdesc r9a06g032_clocks[] __initconst = {
>         D_GATE(CLK_SPI5, "clk_spi5", DIV_P4_PG, 0x822, 0x823, 0, 0, 0, 0, 0),
>         D_GATE(CLK_SWITCH, "clk_switch", DIV_SWITCH, 0x982, 0x983, 0, 0, 0, 0, 0),
>         D_DIV(DIV_MOTOR, "div_motor", CLKOUT_D5, 84, 2, 8),
> -       D_GATE(HCLK_ECAT125, "hclk_ecat125", CLKOUT_D8, 0x400, 0x401, 0, 0x402, 0, 0x440, 0x441),
> -       D_GATE(HCLK_PINCONFIG, "hclk_pinconfig", CLKOUT_D40, 0x740, 0x741, 0x742, 0, 0xae0, 0, 0),
> -       D_GATE(HCLK_SERCOS, "hclk_sercos", CLKOUT_D10, 0x420, 0x422, 0, 0x421, 0, 0x460, 0x461),
> -       D_GATE(HCLK_SGPIO2, "hclk_sgpio2", DIV_P5_PG, 0x8c3, 0x8c4, 0x8c5, 0, 0xb41, 0, 0),
> -       D_GATE(HCLK_SGPIO3, "hclk_sgpio3", DIV_P5_PG, 0x8c6, 0x8c7, 0x8c8, 0, 0xb42, 0, 0),
> -       D_GATE(HCLK_SGPIO4, "hclk_sgpio4", DIV_P5_PG, 0x8c9, 0x8ca, 0x8cb, 0, 0xb43, 0, 0),
> -       D_GATE(HCLK_TIMER0, "hclk_timer0", CLKOUT_D40, 0x743, 0x744, 0x745, 0, 0xae1, 0, 0),
> -       D_GATE(HCLK_TIMER1, "hclk_timer1", CLKOUT_D40, 0x746, 0x747, 0x748, 0, 0xae2, 0, 0),
> -       D_GATE(HCLK_USBF, "hclk_usbf", CLKOUT_D8, 0xe3, 0, 0, 0xe4, 0, 0x102, 0x103),
> -       D_GATE(HCLK_USBH, "hclk_usbh", CLKOUT_D8, 0xe0, 0xe1, 0, 0xe2, 0, 0x100, 0x101),
> -       D_GATE(HCLK_USBPM, "hclk_usbpm", CLKOUT_D8, 0xe5, 0, 0, 0, 0, 0, 0),

... here.

> +       D_MODULE(HCLK_ECAT125, "hclk_ecat125", CLKOUT_D8, 0x400, 0x401, 0, 0x402, 0, 0x440, 0x441),
> +       D_MODULE(HCLK_PINCONFIG, "hclk_pinconfig", CLKOUT_D40, 0x740, 0x741, 0x742, 0, 0xae0, 0, 0),
> +       D_MODULE(HCLK_SERCOS, "hclk_sercos", CLKOUT_D10, 0x420, 0x422, 0, 0x421, 0, 0x460, 0x461),
> +       D_MODULE(HCLK_SGPIO2, "hclk_sgpio2", DIV_P5_PG, 0x8c3, 0x8c4, 0x8c5, 0, 0xb41, 0, 0),
> +       D_MODULE(HCLK_SGPIO3, "hclk_sgpio3", DIV_P5_PG, 0x8c6, 0x8c7, 0x8c8, 0, 0xb42, 0, 0),
> +       D_MODULE(HCLK_SGPIO4, "hclk_sgpio4", DIV_P5_PG, 0x8c9, 0x8ca, 0x8cb, 0, 0xb43, 0, 0),
> +       D_MODULE(HCLK_TIMER0, "hclk_timer0", CLKOUT_D40, 0x743, 0x744, 0x745, 0, 0xae1, 0, 0),
> +       D_MODULE(HCLK_TIMER1, "hclk_timer1", CLKOUT_D40, 0x746, 0x747, 0x748, 0, 0xae2, 0, 0),
> +       D_MODULE(HCLK_USBF, "hclk_usbf", CLKOUT_D8, 0xe3, 0, 0, 0xe4, 0, 0x102, 0x103),
> +       D_MODULE(HCLK_USBH, "hclk_usbh", CLKOUT_D8, 0xe0, 0xe1, 0, 0xe2, 0, 0x100, 0x101),
> +       D_MODULE(HCLK_USBPM, "hclk_usbpm", CLKOUT_D8, 0xe5, 0, 0, 0, 0, 0, 0),
>         D_GATE(CLK_48_PG_F, "clk_48_pg_f", CLK_48, 0x78c, 0x78d, 0, 0x78e, 0, 0xb04, 0xb05),
>         D_GATE(CLK_48_PG4, "clk_48_pg4", CLK_48, 0x789, 0x78a, 0x78b, 0, 0xb03, 0, 0),
>         D_FFC(CLK_DDRPHY_PLLCLK_D4, "clk_ddrphy_pllclk_d4", CLK_DDRPHY_PLLCLK, 4),

> @@ -344,6 +351,104 @@ struct r9a06g032_clk_gate {
>
>  #define to_r9a06g032_gate(_hw) container_of(_hw, struct r9a06g032_clk_gate, hw)
>
> +struct r9a06g032_clk_domain {
> +       struct generic_pm_domain genpd;
> +       struct device_node *np;

np is unused (but see below), and unneeded, as nowadays you can use
generic_pm_domain.dev.of_node instead.  Hence you can just use struct
generic_pm_domain directly, instead of wrapping it.

> +};
> +
> +static struct r9a06g032_clk_domain *r9a06g032_clk_domain;

I don't think this singleton is needed, as there's no interaction with a
second PM Domain driver (renesas-cpg-mssr interacts with rcar-sysc).

> +static int create_add_module_clock(struct of_phandle_args *clkspec,
> +                                  struct device *dev)
> +{
> +       struct clk *clk;
> +       int error = 0;
> +
> +       clk = of_clk_get_from_provider(clkspec);
> +

Please drop this blank line.

> +       if (IS_ERR(clk))
> +               return PTR_ERR(clk);
> +
> +       error = pm_clk_create(dev);
> +       if (error) {
> +               dev_err(dev, "pm_clk_create failed %d\n", error);

This can only happen when running out of memory, so no need to print a
message.

> +               clk_put(clk);
> +               return error;
> +       }
> +
> +       error = pm_clk_add_clk(dev, clk);
> +       if (error) {
> +               dev_err(dev, "pm_clk_add_clk %pC failed %d\n", clk, error);

Likewise, I think.

> +               pm_clk_destroy(dev);
> +               clk_put(clk);
> +       }
> +
> +       return error;
> +}
> +
> +int __init r9a06g032_attach_dev(struct generic_pm_domain *unused,

Missing static.
Please drop the __init, as devices can be attached anytime
(no section mismatch warnings?).

> +                               struct device *dev)
> +{
> +       struct r9a06g032_clk_domain *pd = r9a06g032_clk_domain;

You can just use the passed generic_pm_domain instead...

> +       struct device_node *np = dev->of_node;
> +       struct of_phandle_args clkspec;
> +       int i = 0;
> +       int error;
> +
> +       if (!pd) {

... and this check is no longer needed.

> +               dev_dbg(dev, "RZN1 clock domain not yet available\n");
> +               return -EPROBE_DEFER;


> +       }
> +
> +       while (!of_parse_phandle_with_args(np, "clocks", "#clock-cells", i,
> +                                          &clkspec)) {

As an entry in a clocks property may refer to a different type of clock
(e.g. an external crystal), you need to add a check here, to make sure
the clkspec refers to a clock handled by this driver:

    if (clkspec->np != pd->genpd.dev.of_node)
            continue

> +               int index = clkspec.args[0];
> +
> +               if (index < R9A06G032_CLOCK_COUNT &&
> +                   r9a06g032_clocks[index].managed) {
> +                       error = create_add_module_clock(&clkspec, dev);
> +
> +                       if (error)
> +                               return error;
> +
> +                       of_node_put(clkspec.np);

Please move this line up, before the error check, to avoid a reference leak.

> +               }
> +               i++;
> +       }
> +
> +       return 0;
> +}
> +
> +void r9a06g032_detach_dev(struct generic_pm_domain *unused, struct device *dev)

Missing static.

> +{
> +       if (!pm_clk_no_clocks(dev))
> +               pm_clk_destroy(dev);
> +}
> +
> +static int __init r9a06g032_add_clk_domain(struct device *dev)
> +{
> +       struct device_node *np = dev->of_node;
> +       struct generic_pm_domain *genpd;
> +       struct r9a06g032_clk_domain *pd;

Just struct generic_pm_domain *pd, and s/genpd/pd/ below.

> +
> +       pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
> +       if (!pd)
> +               return -ENOMEM;
> +
> +       pd->np = np;

Not needed.

> +
> +       genpd = &pd->genpd;

Not needed.

> +       genpd->name = np->name;
> +       genpd->flags = GENPD_FLAG_PM_CLK | GENPD_FLAG_ACTIVE_WAKEUP;
> +       genpd->attach_dev = r9a06g032_attach_dev;
> +       genpd->detach_dev = r9a06g032_detach_dev;
> +       pm_genpd_init(genpd, &pm_domain_always_on_gov, false);
> +       r9a06g032_clk_domain = pd;

Not needed.

> +
> +       of_genpd_add_provider_simple(np, genpd);
> +       return 0;
> +}
> +
>  static void
>  r9a06g032_clk_gate_set(struct r9a06g032_priv *clocks,
>                        struct r9a06g032_gate *g, int on)
> @@ -870,6 +975,10 @@ static int __init r9a06g032_clocks_probe(struct platform_device *pdev)
>         if (error)
>                 return error;
>
> +       error = r9a06g032_add_clk_domain(dev);

I would do this after the call to devm_add_action_or_reset() below.

> +       if (error)
> +               return error;
> +
>         return devm_add_action_or_reset(dev,
>                                         r9a06g032_clocks_del_clk_provider, np);
>  }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
