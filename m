Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1222A466495
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Dec 2021 14:40:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346913AbhLBNnj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 Dec 2021 08:43:39 -0500
Received: from mail-vk1-f172.google.com ([209.85.221.172]:46754 "EHLO
        mail-vk1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346862AbhLBNnj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Dec 2021 08:43:39 -0500
Received: by mail-vk1-f172.google.com with SMTP id m16so17395666vkl.13;
        Thu, 02 Dec 2021 05:40:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6C7tzHiNqdZmcbaR+YpGU48hqqWnnAvvAKRYXamfGgo=;
        b=uzwdoJtGvRpi4JICLVoU9pz6P6imj2GhjvMP39FU0d4AgmbGDg8Zqy7U+vxac7Hq4D
         P4+fE+p4e18Tdv9iA6vFjV5jw/+AqvHUeipjbQNDFoIbr8v4TAeaJChmgn5tTuYGm0sY
         Anv6a/6sRvBZSAVSZdQz0eOSk341+tPmtU4rR+VxFm4fiucqEmueFpDKoKlzeaFa3T+W
         14d0tDvUS2fzxg22fn/6uPaomFzmndKiFy8H2oFwtRb2Gp+Ouqu40esGK20hcdqKTEBy
         Mk10pM2W3BCwCaSt5XAuGqReWLtU1JBfOWuBNSJinUnKAGSl85OG2hua/5/jkAVKOZIX
         w5tQ==
X-Gm-Message-State: AOAM533+0tE/p1m1N9n/CBTIpOloSn35iFs+gPl4FGLflK9xER4wIIrm
        kBG0/dyCzvmN3upfpRjLfV3CFYfwWMp7FA==
X-Google-Smtp-Source: ABdhPJw+cmQRlgVlaOywteQ8ysbsaQhyQ9B6I+uUGRpPaMrKZmovSuHiUOXQJqWQL2wSS7QOgyIeaw==
X-Received: by 2002:a05:6122:a03:: with SMTP id 3mr15787831vkn.8.1638452416151;
        Thu, 02 Dec 2021 05:40:16 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id l7sm963506vsi.20.2021.12.02.05.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Dec 2021 05:40:15 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id ay21so55864999uab.12;
        Thu, 02 Dec 2021 05:40:15 -0800 (PST)
X-Received: by 2002:a05:6102:c89:: with SMTP id f9mr14768022vst.68.1638452415333;
 Thu, 02 Dec 2021 05:40:15 -0800 (PST)
MIME-Version: 1.0
References: <20211130100049.129418-1-julien.massot@iot.bzh> <20211130100049.129418-3-julien.massot@iot.bzh>
In-Reply-To: <20211130100049.129418-3-julien.massot@iot.bzh>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 2 Dec 2021 14:40:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUuYHxNe_XOBGt+6cdB49zF5W0p25DbQJ0CZ7A=dE8pyg@mail.gmail.com>
Message-ID: <CAMuHMdUuYHxNe_XOBGt+6cdB49zF5W0p25DbQJ0CZ7A=dE8pyg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] remoteproc: Add Renesas rcar driver
To:     Julien Massot <julien.massot@iot.bzh>
Cc:     =?UTF-8?Q?Bj=C3=B6rn_Andersson?= <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Julien,

Thanks for your patch!

On Tue, Nov 30, 2021 at 11:01 AM Julien Massot <julien.massot@iot.bzh> wrote:
> Renesas Gen3 platform includes a Cortex-r7 processor.
>
> Both: the application cores (A5x) and the realtime core (CR7)
> share access to the RAM and devices with the same address map,
> so device addresses are equal to the Linux physical addresses.
>
> In order to initialize this remote processor we need to:
> - power on the realtime core
> - put the firmware in a ram area

RAM

> - set the boot address for this firmware (reset vector)
> - Deassert the reset
>
> This initial driver allows to start and stop the Cortex R7
> processor.
>
> Signed-off-by: Julien Massot <julien.massot@iot.bzh>

> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -283,6 +283,17 @@ config QCOM_WCNSS_PIL
>           verified and booted with the help of the Peripheral Authentication
>           System (PAS) in TrustZone.
>
> +config RCAR_REMOTEPROC
> +       tristate "Renesas R-CAR Gen3 remoteproc support"

R-Car

> +       depends on ARCH_RENESAS

|| COMPILE_TEST?

> +       help
> +         Say y here to support R-Car realtime processor via the
> +         remote processor framework. An elf firmware can be loaded

ELF

> +         thanks to sysfs remoteproc entries. The remote processor
> +         can be started and stopped.
> +         This can be either built-in or a loadable module.
> +         If compiled as module (M), the module name is rcar_rproc.
> +
>  config ST_REMOTEPROC
>         tristate "ST remoteproc support"
>         depends on ARCH_STI

> --- /dev/null
> +++ b/drivers/remoteproc/rcar_rproc.c

> +static int rcar_rproc_mem_alloc(struct rproc *rproc,
> +                                struct rproc_mem_entry *mem)
> +{
> +       struct device *dev = &rproc->dev;
> +       void *va;
> +
> +       dev_dbg(dev, "map memory: %pa+%zx\n", &mem->dma, mem->len);
> +       va = ioremap_wc(mem->dma, mem->len);
> +       if (IS_ERR_OR_NULL(va)) {

I think ioremap_*() never returns an error code, only NULL for failure.

> +               dev_err(dev, "Unable to map memory region: %pa+%zx\n",
> +                       &mem->dma, mem->len);
> +               return -ENOMEM;
> +       }
> +
> +       /* Update memory entry va */
> +       mem->va = va;
> +
> +       return 0;
> +}

> +static int rcar_rproc_prepare(struct rproc *rproc)
> +{
> +       struct device *dev = rproc->dev.parent;
> +       struct device_node *np = dev->of_node;
> +       struct of_phandle_iterator it;
> +       struct rproc_mem_entry *mem;
> +       struct reserved_mem *rmem;
> +       u64 da;
> +
> +       /* Register associated reserved memory regions */
> +       of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
> +       while (of_phandle_iterator_next(&it) == 0) {
> +
> +               rmem = of_reserved_mem_lookup(it.node);
> +               if (!rmem) {
> +                       dev_err(&rproc->dev,
> +                               "unable to acquire memory-region\n");
> +                       return -EINVAL;
> +               }
> +
> +               /* No need to translate pa to da, R-Car use same map */
> +               da = rmem->base;
> +
> +               mem = rproc_mem_entry_init(dev, NULL,
> +                                          (dma_addr_t)rmem->base,

Do you need this cast?

> +                                          rmem->size, da,

da is u64, and thus truncated to u32.

> +                                          rcar_rproc_mem_alloc,
> +                                          rcar_rproc_mem_release,
> +                                          it.node->name);
> +
> +               if (!mem)
> +                       return -ENOMEM;
> +
> +               rproc_add_carveout(rproc, mem);
> +       }
> +
> +       return 0;
> +}

> +static int rcar_rproc_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct device_node *np = dev->of_node;
> +       struct rcar_rproc *priv;
> +       struct rproc *rproc;
> +       int ret;
> +
> +       rproc = rproc_alloc(dev, np->name, &rcar_rproc_ops,
> +                           NULL, sizeof(*priv));

devm_rproc_alloc(), to simplify cleanup?

> +       if (!rproc)
> +               return -ENOMEM;
> +
> +       priv = rproc->priv;
> +
> +       priv->rst = devm_reset_control_get_exclusive(dev, NULL);
> +       if (IS_ERR(priv->rst)) {
> +               ret = PTR_ERR(priv->rst);
> +               dev_err(dev, "fail to acquire rproc reset\n");

dev_err_probe() (which handles -EPROBE_DEFER, too)

> +               goto free_rproc;
> +       }
> +
> +       pm_runtime_enable(dev);
> +       ret = pm_runtime_get_sync(dev);
> +       if (ret) {
> +               dev_err(dev, "failed to power up\n");
> +               goto free_rproc;
> +       }
> +
> +       dev_set_drvdata(dev, rproc);
> +
> +       /* Manually start the rproc */
> +       rproc->auto_boot = false;
> +
> +       ret = rproc_add(rproc);

devm_rproc_add()?

> +       if (ret) {
> +               dev_err(dev, "rproc_add failed\n");
> +               goto pm_disable;
> +       }
> +
> +       return 0;
> +
> +pm_disable:
> +       pm_runtime_disable(dev);
> +free_rproc:
> +       rproc_free(rproc);
> +
> +       return ret;
> +}

> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("Renesas Gen3 R-Car remote processor control driver");

R-Car Gen3

> +MODULE_AUTHOR("Julien Massot <julien.massot@iot.bzh>");

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
