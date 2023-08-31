Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E2D078EEF3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Aug 2023 15:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229909AbjHaNs3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Aug 2023 09:48:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237312AbjHaNs2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2023 09:48:28 -0400
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEADAE49
        for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Aug 2023 06:48:23 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5921a962adfso9727617b3.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Aug 2023 06:48:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693489703; x=1694094503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=huob+juk1MvDlKb3P76j6Egm5eBBLMovT0B1mKB2U/E=;
        b=YMIchB76nMejeIsm6/J0XULJLvUAx9STMwaXwkgZfu+ne6PmyLnw/+FJ+RiBnL33vz
         pxjBV8D75IKpvwc3e7MgTZOk0EwFP17MaskGbMeq1AOTuDbFZL0BtTvvNkQr6q6pQJpp
         5MsL6RrwfHQhX/GR7OLNGKRAcQ4Zw3d/vc2JniV/yDOMbGM6byx8wGC7oyaCUAXyUmyx
         J97JIeujaI7nvyyHoxTl5Ojt5/1NOpir967sMKiwz3j0VcSYUGRMRwx/8fUB7TdIFWra
         KOFRUXJ/HpAvsM6me66szSaxRoIwgLXlF9uskbJTGRoHnYjfge8do7ft//bHf4FRbCuP
         bqOg==
X-Gm-Message-State: AOJu0YxOVAKUKV3K13lH4i1o6Y7jLuklzov8jvLyDtNOw38WwZjNOx8X
        rMrrYmGxUvCIHFTeknuhu8aJ573P7Gzu9g==
X-Google-Smtp-Source: AGHT+IFuQvYqNFMM10EaIZeF8voHqO2JrNGFWD1WduJv5gLJwdVlM+Ed3saCwTuEi23fb22Oe2kzcA==
X-Received: by 2002:a0d:cc8e:0:b0:561:206a:ee52 with SMTP id o136-20020a0dcc8e000000b00561206aee52mr5565403ywd.24.1693489702793;
        Thu, 31 Aug 2023 06:48:22 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id i185-20020a8191c2000000b00583e52232f1sm416748ywg.112.2023.08.31.06.48.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Aug 2023 06:48:22 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d7bb34576b9so576760276.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Aug 2023 06:48:22 -0700 (PDT)
X-Received: by 2002:a25:cc85:0:b0:d1a:c21:3bcf with SMTP id
 l127-20020a25cc85000000b00d1a0c213bcfmr5842790ybf.55.1693489702226; Thu, 31
 Aug 2023 06:48:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230828041434.2747699-1-yoshihiro.shimoda.uh@renesas.com> <20230828041434.2747699-3-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20230828041434.2747699-3-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 31 Aug 2023 15:48:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXAF4m7sHiPRDCnbAGd2yh9cVzgw_p=vXaVjVHpeLNEGA@mail.gmail.com>
Message-ID: <CAMuHMdXAF4m7sHiPRDCnbAGd2yh9cVzgw_p=vXaVjVHpeLNEGA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: r8a779f0: spider: Enable PCIe
 Host ch0
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     geert+renesas@glider.be, magnus.damm@gmail.com,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Mon, Aug 28, 2023 at 6:14 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Enable PCIe Host controller channel 0 on R-Car S4-8 Spider board.
>
> Since this board has an Oculink connector, CLKREQ# pin of PFC for PCIe
> should not be used. So, using a GPIO is used to output the clock instead.
> Otherwise the controller cannot detect a PCIe device.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi

> @@ -145,6 +157,11 @@ &mmc0 {
>         status = "okay";
>  };
>
> +&pciec0 {
> +       reset-gpio = <&gpio_exp_20 0 GPIO_ACTIVE_LOW>;
> +       status = "okay";
> +};
> +
>  &pfc {
>         pinctrl-0 = <&scif_clk_pins>;
>         pinctrl-names = "default";
> @@ -202,6 +219,13 @@ &ufs {
>         status = "okay";
>  };
>
> +&pcie0_clkref {

Please move this node up to preserve alphabetical sort order.

> +       compatible = "gpio-gate-clock";
> +       clocks = <&rc21012_pci>;
> +       enable-gpios = <&gpio2 15 GPIO_ACTIVE_LOW>;
> +       /delete-property/ clock-frequency;
> +};
> +
>  &ufs30_clk {
>         compatible = "gpio-gate-clock";
>         clocks = <&rc21012_ufs>;

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
