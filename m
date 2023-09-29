Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F37597B386B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Sep 2023 19:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233215AbjI2RPf convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Sep 2023 13:15:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232748AbjI2RPe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Sep 2023 13:15:34 -0400
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71F07B4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Sep 2023 10:15:30 -0700 (PDT)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-57b64731334so7127734eaf.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Sep 2023 10:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696007729; x=1696612529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T3GrWsKT62t8ZHp8gNjNZD66yghxPUTl2jqVpJFUm3g=;
        b=SIRrZ4DfsXgTSs9tmjaSBXdQN5VlBEd9/7le4sYxg5Fk5GpZIh6otKue3vGpuQuhc1
         q+pkPgnYDA98IGSgRljoRFrtav5QLBoV73XUS+y2QdINWT6yzxnkOvFJeuUxqwJtUqKG
         /2c+7o2cunodjr5PaTSoCjEWDP/pH1Ar5GrpLyYHBD9JEk0RkaG6DY93LCJ1Mzf5YMoT
         49dg0/GrfFvDPY34FMg388VUQHYbzWznLSgpyP2Cchp8cjbNfjLdqTJtc9jtTLs8o/qO
         eGV27mHmkXZGCTFTvIsJjuLZyCWU0VIvSCABdu/5KTqJBVuHHHJCXIOVmtO2Wg5UtqgB
         +5Eg==
X-Gm-Message-State: AOJu0YzagDwfXVTDtfJb2C5+/nIeAIYyZS9kJJzNk4QE+eU4y7/gE7tB
        72FZ+5lJibMOKt7SanHdggvlb8faIibhBU3r
X-Google-Smtp-Source: AGHT+IH6j9T3/QrO4jXpeyVFtSWD9p/Gt0DEh2WROL+l7VWQm0EsSTVq6IylNQkQFNBZiUfIkrDcrA==
X-Received: by 2002:a05:6358:7250:b0:13a:a85b:d024 with SMTP id i16-20020a056358725000b0013aa85bd024mr5311843rwa.30.1696007728559;
        Fri, 29 Sep 2023 10:15:28 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id v16-20020a056902029000b00d746487d6f7sm4971800ybh.35.2023.09.29.10.15.27
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 10:15:27 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-59c0b9ad491so176228077b3.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Sep 2023 10:15:27 -0700 (PDT)
X-Received: by 2002:a81:6588:0:b0:59f:4ef0:b4b6 with SMTP id
 z130-20020a816588000000b0059f4ef0b4b6mr5270640ywb.26.1696007727509; Fri, 29
 Sep 2023 10:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <87pm25im9q.wl-kuninori.morimoto.gx@renesas.com> <87jzsdim7m.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87jzsdim7m.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 29 Sep 2023 19:15:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUY94ypdTy7osywQESayxP_wP5M7B2QEceuy8HZPskEzw@mail.gmail.com>
Message-ID: <CAMuHMdUY94ypdTy7osywQESayxP_wP5M7B2QEceuy8HZPskEzw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: renesas: Add R-Car S4 Starter Kit support
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Hai Pham <hai.pham.ud@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Tue, Sep 26, 2023 at 6:37 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Add initial support for the R-Car S4 Starter Kit support
> with R8A779F4 SoC. Based on a patch in the BSP.

Thanks for your patch!

> Signed-off-by: Michael Dege <michael.dege@renesas.com>
> Signed-off-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
> Signed-off-by: Tam Nguyen <tam.nguyen.xa@renesas.com>
> Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Just as with "[PATCH v2 2/4]", please consider the transfer chain,
and add Co-developed-by when needed.

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
> @@ -0,0 +1,243 @@
> +// SPDX-License-Identifier: (GPL-2.0 or MIT)

"OR", as per commit 05c618f39089d977 ("arm64: dts: use capital "OR"
for multiple licenses in SPDX") in v6.6-rc2.

> +/*
> + * Device Tree Source for the R-Car S4 Starter Kit board
> + *
> + * Copyright (C) 2023 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +#include <dt-bindings/gpio/gpio.h>
> +#include "r8a779f4.dtsi"
> +
> +/ {
> +       model = "R-Car S4 Starter Kit board";

Renesas R-Car ...

> +       compatible = "renesas,s4sk", "renesas,r8a779f4";

Missing "renesas,r8a779f0" fallback.

> +       vcc_sdhi: regulator-vcc-sdhi {
> +               compatible = "regulator-fixed";
> +               regulator-name = "SDHI Vcc";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;

It looks like this can switch between 1.8V and 3.3V using SDHI_PWR_SEL.
But that is controlled through the FPGA, and according to the docs,
only used for initialization.  So I guess hardcoding 3.3V is OK.

> +               gpio = <&gpio1 24 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +       };
> +};

> +&extalr_clk {
> +       clock-frequency = <32768>;
> +};

This clock (and scif_clk and ufs30_clk below) is generated by a
programmable clock generator.  Modelling it as a fixed-clock is fine
for now.  It can be replaced by an output of the clock generator later,
when Linux has gained support for it.

> +&i2c5 {
> +       pinctrl-0 = <&i2c5_pins>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +       clock-frequency = <400000>;
> +
> +       eeprom@50 {
> +               compatible = "atmel,24c16";

As the schematics say this is a genuine ST part:

    "st,24c16", "atmel,24c16";

> +               reg = <0x50>;
> +               pagesize = <16>;
> +       };
> +};
> +
> +&mmc0 {
> +       pinctrl-0 = <&sd_pins>;
> +       pinctrl-1 = <&sd_pins>;
> +       pinctrl-names = "default", "state_uhs";

Do you need two states if there is a single voltage?
AFAIK, UHS needs 1.8V.

> +
> +       vmmc-supply = <&vcc_sdhi>;
> +       vqmmc-supply = <&vcc_sdhi>;

Do you need vqmmc-supply if there is a single voltage?
I'm not sure about this one...

> +       cd-gpios = <&gpio1 23 GPIO_ACTIVE_LOW>;
> +       bus-width = <4>;
> +       status = "okay";
> +};
> +
> +&pfc {
> +       pinctrl-0 = <&scif_clk_pins>;
> +       pinctrl-names = "default";
> +
> +       i2c2_pins: i2c2 {
> +               groups = "i2c2";
> +               function = "i2c2";
> +       };
> +
> +       i2c4_pins: i2c4 {
> +               groups = "i2c4";
> +               function = "i2c4";
> +       };
> +
> +       i2c5_pins: i2c5 {
> +               groups = "i2c5";
> +               function = "i2c5";
> +       };
> +
> +       sd_pins: sd {

Please sort alphabetically (everywhere).

> +               groups = "mmc_data4", "mmc_ctrl";
> +               function = "mmc";
> +               power-source = <3300>;
> +       };
> +
> +       qspi0_pins: qspi0 {
> +               groups = "qspi0_ctrl", "qspi0_data4";
> +               function = "qspi0";
> +       };

There is no reference to qspi0_pins.

> +&rswitch {
> +       pinctrl-0 = <&tsn0_pins>, <&tsn1_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +
> +       ethernet-ports {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               port@0 {
> +                       reg = <0>;
> +                       phy-handle = <&u101>;
> +                       phy-mode = "sgmii";
> +                       phys = <&eth_serdes 0>;
> +
> +                       mdio {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               u101: ethernet-phy@1 {

This label seems to be copied from Spider?
On S4SK, the PHY is IC99, so perhaps "ic99"?
Although I'm open for a different name like "gbe_phy0"
or "sgmii_phy0"?

> +                                       reg = <1>;
> +                                       compatible = "ethernet-phy-ieee802.3-c45";

Missing interrupt (GP3_10).

> +                               };
> +                       };
> +               };
> +
> +               port@1 {
> +                       reg = <1>;
> +                       phy-handle = <&u201>;
> +                       phy-mode = "sgmii";
> +                       phys = <&eth_serdes 1>;
> +
> +                       mdio {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               u201: ethernet-phy@2 {

"ic102", or a better name...

> +                                       reg = <2>;
> +                                       compatible = "ethernet-phy-ieee802.3-c45";

Missing interrupt (GP3_11).

> +                               };
> +                       };
> +               };
> +
> +               port@2 {
> +                       status = "disabled";
> +               };
> +       };
> +};

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
