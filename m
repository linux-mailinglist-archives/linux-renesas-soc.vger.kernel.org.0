Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D53662847B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Nov 2022 16:57:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237175AbiKNP52 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Nov 2022 10:57:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237271AbiKNP51 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2022 10:57:27 -0500
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE2AA2DAB5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 07:57:26 -0800 (PST)
Received: by mail-qt1-f173.google.com with SMTP id c15so6998904qtw.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 07:57:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TH8O07ed2ZFX7CQqXW3MHKi1VKuMPjoymNIf8uXDqdo=;
        b=AMOI23tLIq1bgkON7TLRu4vSs2CqSDTb7/i7gh4FSjufFE1EuZfkzrZaxN6w1pTh19
         dkwzLdobKLTnj1B9h8ySSP2Ktels0HBCKOGB+kBsEScB+yVDvrF3gRZJbg3rRfxcAfvN
         buD1v0vkDAyc6UjEy7Ogew2wvSGAZvab5gV6qPFpODLNcwNcxv9i2lKTfaNvOIHTnc3A
         VKBdrCAZ/kD+nu4IjVDwankHDdt7cd0caIicxShEuceOIfXc0027k57BUxAqY7+xiBys
         yjiu5jwt9W/VErYbGexJPi8lAz5qqMW+5INIBLIX9eQAj4bfDr7kD+vhRy5V5i7jQ5n3
         aAGA==
X-Gm-Message-State: ANoB5pnxSdmPqPJgJC+yVr1YoDeS10WacEb5eIMLfPllDFrIo3YY4UPV
        0AqA1HZFmPc1D03nyi1F4UQaH7cUfIwxYw==
X-Google-Smtp-Source: AA0mqf73hBfeYIgx2902ls1Bk0gMYzD04DvEuBbgiQL5QF99PUzeWBxqQPfGW0jPnnbLVK0EI/KX5Q==
X-Received: by 2002:ac8:5982:0:b0:35c:ea7a:fcac with SMTP id e2-20020ac85982000000b0035cea7afcacmr12983568qte.172.1668441445808;
        Mon, 14 Nov 2022 07:57:25 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id x1-20020a05620a448100b006cec8001bf4sm6817983qkp.26.2022.11.14.07.57.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 07:57:25 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-369426664f9so110314147b3.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 07:57:25 -0800 (PST)
X-Received: by 2002:a81:7506:0:b0:36b:56d3:71b8 with SMTP id
 q6-20020a817506000000b0036b56d371b8mr13292330ywc.384.1668441445152; Mon, 14
 Nov 2022 07:57:25 -0800 (PST)
MIME-Version: 1.0
References: <20221110131630.3814538-1-yoshihiro.shimoda.uh@renesas.com> <20221110131630.3814538-3-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20221110131630.3814538-3-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Nov 2022 16:57:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWsZrhZMkN3ybv+vEaBmtwSkVVADLbot-MTn3F_q6PV=g@mail.gmail.com>
Message-ID: <CAMuHMdWsZrhZMkN3ybv+vEaBmtwSkVVADLbot-MTn3F_q6PV=g@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] arm64: dts: renesas: r8a779f0: spider: Enable
 Ethernet Switch and SERDES
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Thu, Nov 10, 2022 at 2:16 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Enable Ethernet Switch and SERDES for R-Car S4-8 (r8a779f0).
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
> @@ -13,3 +17,76 @@ eeprom@52 {
>                 pagesize = <8>;
>         };
>  };
> +
> +&pfc {
> +       tsn0_pins: tsn0 {
> +               groups = "tsn0_mdio_b", "tsn0_link_b";
> +               function = "tsn0";
> +               power-source = <1800>;
> +       };
> +
> +       tsn1_pins: tsn1 {
> +               groups = "tsn1_mdio_b", "tsn1_link_b";
> +               function = "tsn1";
> +               power-source = <1800>;
> +       };
> +
> +       tsn2_pins: tsn2 {
> +               groups = "tsn2_mdio_b", "tsn2_link_b";
> +               function = "tsn2";
> +               power-source = <1800>;
> +       };
> +};
> +
> +&rswitch {
> +       pinctrl-0 = <&tsn0_pins>, <&tsn1_pins>, <&tsn2_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +
> +       ethernet-ports {
> +               #address-cells = <1>;
> +               #size-cells = <0>;

Please insert a blank line between properties and subnodes (everywhere).

> +               port@0 {
> +                       reg = <0>;
> +                       phy-handle = <&u101>;
> +                       phy-mode = "sgmii";
> +                       phys = <&eth_serdes 0>;
> +                       mdio {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               u101: ethernet-phy@1 {
> +                                       reg = <1>;
> +                                       compatible = "ethernet-phy-ieee802.3-c45";

Missing PHY interrupt:

    interrupt-parent = <&gpio3>;
    interrupts = <10 IRQ_TYPE_LEVEL_LOW>;

> +                               };
> +                       };
> +               };
> +               port@1 {
> +                       reg = <1>;
> +                       phy-handle = <&u201>;
> +                       phy-mode = "sgmii";
> +                       phys = <&eth_serdes 1>;
> +                       mdio {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               u201: ethernet-phy@2 {
> +                                       reg = <2>;
> +                                       compatible = "ethernet-phy-ieee802.3-c45";

    interrupt-parent = <&gpio3>;
    interrupts = <11 IRQ_TYPE_LEVEL_LOW>;

> +                               };
> +                       };
> +               };
> +               port@2 {
> +                       reg = <2>;
> +                       phy-handle = <&u301>;
> +                       phy-mode = "sgmii";
> +                       phys = <&eth_serdes 2>;
> +                       mdio {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               u301: ethernet-phy@3 {
> +                                       reg = <3>;
> +                                       compatible = "ethernet-phy-ieee802.3-c45";

    interrupt-parent = <&gpio3>;
    interrupts = <9 IRQ_TYPE_LEVEL_LOW>;

> +                               };
> +                       };
> +               };
> +       };
> +};

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
