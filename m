Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54F693B0913
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jun 2021 17:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231968AbhFVPcJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 11:32:09 -0400
Received: from mail-vs1-f46.google.com ([209.85.217.46]:39569 "EHLO
        mail-vs1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232400AbhFVPbo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 11:31:44 -0400
Received: by mail-vs1-f46.google.com with SMTP id 68so11434906vsu.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jun 2021 08:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oR+1qeM4yz7ph3in4Jquwe9LUDQzHsO3jz9ugdHNBCw=;
        b=mc2Zag1CMzuAZG58ynZypTR4d3LcPdw94bwN1OvxWfULyR9tfGlMxfkpM3gJUeP56v
         n3QS2+yBhuyDUzFQQcILO/vXGvXt7W6nxow+uGkQNYIRswEPqTntyuvl4MwXmc8a1MUh
         oYToSBK2SZDS3GiSs9wmQeq406sWFtyi9RKwEHQi8tt/XPHaqIvzFwDMxGz0bBpkhj6a
         xjzd7fCfYzzEpPnMF7MPztw5Yedbp7iUnSW6HUX5WaSeP4cuGB2CctHKP1N7+CkzHZ7J
         VIghwA2jwK6zkPOUfXsUxlb33MI/19ZRd10CPAvoGLLHKt0+Xz9scYfSdCdqebOeM5sT
         KPTw==
X-Gm-Message-State: AOAM5310+UKuWmaDina/+PCW8LJWm3LvCRckXKm7uuNZ9Qebu8Xi3meL
        Gr5m3A2zpsBbtu3PwSKV4xKoCpMICk5zk3HnhC9wSMnv/1mhHA==
X-Google-Smtp-Source: ABdhPJxovc3MSMTFO9B7wNWHgdk24OK3b3PqHEQTaFud5hGpMHrs/G+v3UNehI1zUzxKGbybo+p4Uxox2Au39zS80xc=
X-Received: by 2002:a67:3c2:: with SMTP id 185mr23400349vsd.42.1624375766450;
 Tue, 22 Jun 2021 08:29:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210621093943.12143-1-biju.das.jz@bp.renesas.com> <20210621093943.12143-11-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210621093943.12143-11-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Jun 2021 17:29:15 +0200
Message-ID: <CAMuHMdVHFaM+SAEBLyV0HOoFLpZgJ5PrJXx4vxQ8fsaopEAm9g@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] phy: renesas: phy-rcar-gen3-usb2: Add OTG
 support for RZ/G2L
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-phy@lists.infradead.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thanks for your patch!

On Mon, Jun 21, 2021 at 11:40 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> This patch adds OTG support for RZ/G2L SoC.
>
> RZ/G2L USB2.0 phy is compatible with rcar gen3, but it uses
> line ctrl register for OTG_ID pin changes. Apart from this
> it uses a different OTG-BC interrupt bit for device recognition.

So it is not compatible? ;-)

> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -535,6 +555,11 @@ static const struct phy_ops rz_g1c_phy_usb2_ops = {
>         .owner          = THIS_MODULE,
>  };
>
> +static const struct soc_device_attribute soc_no_adp_ctrl[] = {
> +       { .soc_id = "r9a07g044", .data = (void *)true },
> +       { /* Sentinel */ }
> +};
> +
>  static const struct of_device_id rcar_gen3_phy_usb2_match_table[] = {
>         {
>                 .compatible = "renesas,usb2-phy-r8a77470",
> @@ -613,6 +638,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>         struct phy_provider *provider;
>         const struct phy_ops *phy_usb2_ops;
>         int ret = 0, i;
> +       const struct soc_device_attribute *attr;
>
>         if (!dev->of_node) {
>                 dev_err(dev, "This driver needs device tree\n");
> @@ -627,6 +653,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>         if (IS_ERR(channel->base))
>                 return PTR_ERR(channel->base);
>
> +       channel->obint_enable_bits = USB2_OBINT_SESSVLDCHG | USB2_OBINT_IDDIGCHG;
>         /* get irq number here and request_irq for OTG in phy_init */
>         channel->irq = platform_get_irq_optional(pdev, 0);
>         channel->dr_mode = rcar_gen3_get_dr_mode(dev->of_node);
> @@ -634,6 +661,12 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>                 int ret;
>
>                 channel->is_otg_channel = true;
> +               attr = soc_device_match(soc_no_adp_ctrl);
> +               if (attr) {
> +                       channel->soc_no_adp_ctrl = attr->data;
> +                       channel->obint_enable_bits = USB2_OBINT_IDCHG_EN;
> +               }

Please don't abuse soc_device_match() for matching with a different
variant that uses a different compatible value.  Just add an entry
to rcar_gen3_phy_usb2_match_table[] instead.
I don't know if you can handle RZ/G2L just using a different phy_ops,
or need to extend rcar_gen3_phy_usb2_match_table[].data.

> +
>                 channel->uses_otg_pins = !of_property_read_bool(dev->of_node,
>                                                         "renesas,no-otg-pins");
>                 channel->extcon = devm_extcon_dev_allocate(dev,

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
