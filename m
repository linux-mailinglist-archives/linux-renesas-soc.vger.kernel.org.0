Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 779A741ABC3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Sep 2021 11:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239573AbhI1J2j (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Sep 2021 05:28:39 -0400
Received: from mail-vs1-f49.google.com ([209.85.217.49]:44995 "EHLO
        mail-vs1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239770AbhI1J2j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 05:28:39 -0400
Received: by mail-vs1-f49.google.com with SMTP id 66so17316571vsd.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Sep 2021 02:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dNSOV5EzmL01cJYTTRhp2q472YbR03LIPSVLD9ki/Yw=;
        b=yc76pDL1//QIIgmniDNMHl0KO+AXvpKD89dYzuKcsop2buIDAKPxHJd32mLqIMC3ai
         V9lSX2raNQ6yVpRE45jwW2HVuawHJRf3Q37mpSd+qx57QWqVXTaB70mseMqUn1dqvX9p
         1OJUCjZdRAfH64CcEwUjmwKYv6xkgbrrxzMXmzZDiNBZpQtd9WQ002SR1H4gm8vwlk9K
         InGL9Zu/xofUMbILldK8maIxpS9pNQlT3YoL5JsngmdepW9T1NKMYMM2oYVV1BCFQheZ
         fdItxOi2L+aMzeStM2bdSRyOze5Jz2KYpPKi1S5mwVxiSq9xCdKh/pzn3zDDmAB0J1es
         T/+A==
X-Gm-Message-State: AOAM533RUfFc8bUS6HJc6/n8sH977E910UIMR+Amow8L0soQy0YxUcBW
        baluszxeowNqd2xmmarJCxkp1mjGiIkxWTroc3Cmtl6H6AU=
X-Google-Smtp-Source: ABdhPJzvgR3lT7xHR3ZbRbMdmHRuKD4bH/k1rBzz1rtpJGaWUDXVUGYgwhpS8xhlLalCN1tYpltOY49wA+i824MWHZQ=
X-Received: by 2002:a05:6102:21d4:: with SMTP id r20mr528485vsg.50.1632821219901;
 Tue, 28 Sep 2021 02:26:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210913065317.2297-1-wsa+renesas@sang-engineering.com> <20210913065317.2297-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210913065317.2297-5-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 28 Sep 2021 11:26:48 +0200
Message-ID: <CAMuHMdWf0KpbNsFJqL81o6-Cpu1nn5ZFDEVdy7iPLkrMuXjGNw@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] arm64: dts: renesas: falcon-cpu: add SPI flash
 via RPC
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Mon, Sep 13, 2021 at 8:53 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> --- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi

> @@ -177,6 +182,34 @@ scif_clk_pins: scif_clk {
>         };
>  };
>
> +&rpc {
> +       pinctrl-0 = <&qspi0_pins>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +
> +       flash@0 {
> +               compatible = "spansion,s25fs512s", "jedec,spi-nor";
> +               reg = <0>;
> +               spi-max-frequency = <50000000>;
> +               spi-rx-bus-width = <4>;
> +
> +               partitions {
> +                       compatible = "fixed-partitions";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +
> +                       boot_partition@0 {
> +                               reg = <0x00000000 0xc40000>;
> +                               read-only;
> +                       };
> +                       user@00c40000 {

Warning (unit_address_format):
/soc/spi@ee200000/flash@0/partitions/user@00c40000: unit name should
not have leading 0s

> +                               reg = <0x00c40000 0x33c0000>;
> +                       };
> +               };
> +       };
> +};
> +
>  &rwdt {
>         timeout-sec = <60>;
>         status = "okay";
> --
> 2.30.2

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
