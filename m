Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97EF957CA4E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Jul 2022 14:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233522AbiGUMKT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Jul 2022 08:10:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233543AbiGUMKR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Jul 2022 08:10:17 -0400
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0773C1A040;
        Thu, 21 Jul 2022 05:10:13 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id c24so1094523qkm.4;
        Thu, 21 Jul 2022 05:10:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iGAYUjyJIYxvuKom3Tjx0tb/s6EGWZtgmkTg3sHmN2o=;
        b=42RlOlDIwyJVOHyGzIICf23FBJIaRQYZCzjVcoYrOatrQDVyVT6A84jvWgdlqRvwjY
         TxQz/Job1sRQSqJSZaMY66iSTigNM3exRsTZ/MBo9MKUWxY9ijyEEqnhzfzyhCB1YOAO
         xHYMVjRZ5639+eLsY/jDr5KoeLMC9k6OpmwZ5ma2nsI+9dbpHvKAD77szetb6UBqVcy9
         TwTEg9iWYYLaQjqm74z10vnVXcktM8r8qgMjy7h3c2CZb84DSwkQH1FwUoY10E1b14tH
         LC8laLpuzSsLFh9umAURhTAcfhZs4AstFzptazdTqX3IvwPur7s0pXXgQVI9yT0kElvk
         CIdg==
X-Gm-Message-State: AJIora8391vLoIsGwi697JpbMWGMzI5kcorW9ICeWN/+hkxdfLwqccaN
        JtpEDkt5FJQD6IoG+5AyzDRAK8AKpNhBOA==
X-Google-Smtp-Source: AGRyM1sNZ1tYX1EgLzNLY7BUnLzws7CyncetxCSQSdELScgq3D7gLTSYNb+cJ0o8AOf6KqRrI7QQUQ==
X-Received: by 2002:ae9:eb0a:0:b0:6b5:ee4d:e500 with SMTP id b10-20020ae9eb0a000000b006b5ee4de500mr13137361qkg.333.1658405412429;
        Thu, 21 Jul 2022 05:10:12 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id v3-20020a05620a0f0300b006b5cdbbfccfsm1412192qkl.79.2022.07.21.05.10.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 05:10:11 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-31e7ca45091so14866727b3.3;
        Thu, 21 Jul 2022 05:10:11 -0700 (PDT)
X-Received: by 2002:a81:4f87:0:b0:31e:7122:16fb with SMTP id
 d129-20020a814f87000000b0031e712216fbmr6119621ywb.358.1658405411397; Thu, 21
 Jul 2022 05:10:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220718134458.19137-1-phil.edworthy@renesas.com> <20220718134458.19137-3-phil.edworthy@renesas.com>
In-Reply-To: <20220718134458.19137-3-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Jul 2022 14:10:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXuY_HOphyDtw4edZWu_D4QCi2hi-GWLF5R2jPNMHGcpg@mail.gmail.com>
Message-ID: <CAMuHMdXuY_HOphyDtw4edZWu_D4QCi2hi-GWLF5R2jPNMHGcpg@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: gadget: udc: renesas_usb3: Add support for RZ/V2M
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Adam Ford <aford173@gmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Phil,

On Mon, Jul 18, 2022 at 3:45 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> RZ/V2M (r9a09g011) has a few differences:
>  - The USB3_DRD_CON register has moved, its called USB_PERI_DRD_CON in
>    the RZ/V2M hardware manual.
>    It has additional bits for host and peripheral reset that need to
>    cleared to use usb host and peripheral respectively.
>  - The USB3_OTG_STA, USB3_OTG_INT_STA and USB3_OTG_INT_ENA registers
>    have been moved and renamed to USB_PERI_DRD_STA, USB_PERI_DRD_INT_STA
>    and USB_PERI_DRD_INT_E.
>  - The IDMON bit used in the above regs for role detection have moved
>    from bit 4 to bit 0.
>  - RZ/V2M has an separate interrupt for DRD, i.e. for changes to IDMON.
>  - There are reset lines for DRD and USBP
>  - There is another clock, managed by runtime PM.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/usb/gadget/udc/renesas_usb3.c
> +++ b/drivers/usb/gadget/udc/renesas_usb3.c

> @@ -363,6 +368,7 @@ struct renesas_usb3 {
>         bool forced_b_device;
>         bool start_to_connect;
>         bool role_sw_by_connector;
> +       bool r9a09g011;

Any better name for this feature flag?

>  };

> @@ -2707,6 +2733,12 @@ static const struct renesas_usb3_priv renesas_usb3_priv_r8a77990 = {
>         .workaround_for_vbus = true,
>  };
>
> +static const struct renesas_usb3_priv renesas_usb3_priv_r9a09g011 = {

renesas_usb3_priv_rzv2m?

> +       .ramsize_per_ramif = SZ_32K,
> +       .num_ramif = 1,
> +       .ramsize_per_pipe = SZ_4K,
> +};
> +
>  static const struct of_device_id usb3_of_match[] = {
>         {
>                 .compatible = "renesas,r8a774c0-usb3-peri",
> @@ -2717,6 +2749,9 @@ static const struct of_device_id usb3_of_match[] = {
>         }, {
>                 .compatible = "renesas,r8a77990-usb3-peri",
>                 .data = &renesas_usb3_priv_r8a77990,
> +       }, {
> +               .compatible = "renesas,r9a09g011-usb3-peri",

As the bindings include a family-specific compatible value, you should
use that ("renesas,rzv2m-usb3-peri") here.

> +               .data = &renesas_usb3_priv_r9a09g011,
>         }, {
>                 .compatible = "renesas,rcar-gen3-usb3-peri",
>                 .data = &renesas_usb3_priv_gen3,

> @@ -2758,13 +2793,22 @@ static int renesas_usb3_probe(struct platform_device *pdev)
>         else
>                 priv = of_device_get_match_data(&pdev->dev);
>
> +       usb3 = devm_kzalloc(&pdev->dev, sizeof(*usb3), GFP_KERNEL);
> +       if (!usb3)
> +               return -ENOMEM;
> +
> +       if (priv == &renesas_usb3_priv_r9a09g011)

Please store the feature flag in renesas_usb3_priv instead of doing an
explicit comparison.

> +               usb3->r9a09g011 = true;
> +

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
