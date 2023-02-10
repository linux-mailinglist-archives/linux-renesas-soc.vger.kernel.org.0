Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAA52691FC7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 14:33:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231688AbjBJNd0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 08:33:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231846AbjBJNd0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 08:33:26 -0500
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F2FB735A1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Feb 2023 05:33:25 -0800 (PST)
Received: by mail-qv1-f53.google.com with SMTP id nd22so917121qvb.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Feb 2023 05:33:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pG2/LsTJqp91aFWrxoBqAZChmyV62Z3Up81nJrbFgIo=;
        b=39bVMRQlYwhJQ0x5UHTTBduOD3jXs3uP+Eh+USIasmUDm+lqIgrNfTMwOIxTGZtCKd
         LO077y3h83iAIhp8j5iF5T+ehe3gWbaDF10rNX0vSkjFvQgASTyGvNzghTf3yz/kJbU5
         LabcSiNM7NUMdTi1R8JIzfSGml/Ils/5qHWA8N1Xw/lKf98Z7krw8l1gd7SBg1LY2mAZ
         jK+22F9xh+aIGsBeSZaU8NzJdWi8rYoDXf41BQ1FlN8djikHu6m1TxLNIJ3sb3EMms0E
         IDfSnm/1GnGy0Wh1sVt3jCUPupi07piTcLXRqiUv+aQadOsvZAdegGt0bfsa+XwuN6Fr
         nkzQ==
X-Gm-Message-State: AO0yUKWUzSC6hjZsyWFFvVWt1wdm1M3BakLKuSEqenhudgKnkiSw8Bk+
        jOV0h6gQ7HNKQhJVb0vLvg+yfJQvyo6UqTFh
X-Google-Smtp-Source: AK7set80vGiVwsIZpcN9Aw8kMuGq9H9X8EC+qxHXXi/fZjwrTcwcR2kzBPubFIBtOvIbpl7xPfLMxw==
X-Received: by 2002:a05:6214:248d:b0:56e:912c:1b3a with SMTP id gi13-20020a056214248d00b0056e912c1b3amr5851510qvb.47.1676036003806;
        Fri, 10 Feb 2023 05:33:23 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id m2-20020a378a02000000b007090cad77c1sm3510463qkd.3.2023.02.10.05.33.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 05:33:23 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-4a263c4ddbaso68359087b3.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Feb 2023 05:33:23 -0800 (PST)
X-Received: by 2002:a0d:ca03:0:b0:506:6b5d:523c with SMTP id
 m3-20020a0dca03000000b005066b5d523cmr1214998ywd.283.1676036003187; Fri, 10
 Feb 2023 05:33:23 -0800 (PST)
MIME-Version: 1.0
References: <87edr8angv.wl-kuninori.morimoto.gx@renesas.com> <875yckands.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875yckands.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 10 Feb 2023 14:33:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXF8Udi7vk1oCNJN4bXh8fSxGB7N6NYAmzUKuT02MWCEg@mail.gmail.com>
Message-ID: <CAMuHMdXF8Udi7vk1oCNJN4bXh8fSxGB7N6NYAmzUKuT02MWCEg@mail.gmail.com>
Subject: Re: [PATCH 7/9] arm64: dts: renesas: r8a779g0: whitehawk: Add R-Car
 Sound support
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

Hi Morimoto-san,

On Thu, Feb 2, 2023 at 2:04 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> These adds R-Car Sound support for WhiteHawk board using ARD-AUDIO-DA7212
> external audio board.
>
> Signed-off-by: Linh Phung <linh.phung.jy@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dts
> @@ -0,0 +1,194 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the White Hawk boards with R-Car V4H + ARD-AUDIO-DA7212 Board
> + *
> + * You can find and buy "ARD-AUDIO-DA7212" at Digi-Key
> + *
> + *     https://www.digikey.jp/en/products/detail/ARD-AUDIO-DA7212/1564-1021-ND/5456357?curr=usd&utm_campaign=buynow&utm_medium=aggregator&utm_source=octopart

Please drop the question mark and everything after it from the URL.

> + * [Connection]
> + *
> + * White Hawk                          ARD-AUDIO-DA7212
> + * +----------------------------+
> + * |CPU board                  |
> + * |                           |
> + * |CN40 (IO PIN HEADER)       |
> + * |   AUDIO_CLKIN_V     pin1  |<--\   +---------------+
> + * |(*) GP1_25/SL_SW2_V          pin2  |<--/   |J2             |
> + * |   AUDIO_CLKOUT_V    pin5  |<----->| pin7  MCLK    |
> + * |   SSI_SCK_V         pin9  |<----->| pin1  BCLK    |
> + * |   SSI_WS_V          pin13 |<----->| pin3  WCLK    |
> + * |   SSI_SD_V          pin15 |<----->| pin5  DATIN   | (@)
> + * |                           |   \-->| pin15 DATOUT  | [CAPTURE]
> + * +----------------------------+      +---------------+
> + * (*) GP1_25/SL_SW2_V is used as TPU
> + * (@) Connect to pin5 (DATIN = playback) or pin15 (DATOUT = capture)
> + *
> + * +----------------------------+
> + * |Breakout board             |
> + * |                           |       +---------------+
> + * |CN34 (I2C CN)              |       |J1             |
> + * |   I2C0_SCL           pin3 |<----->| pin20 SCL     |
> + * |   I2C0_SDA           pin5 |<----->| pin18 SDA     |
> + * +----------------------------+  +--->| pin14 GND    |
> + *                                |    +---------------+
> + * +----------------------------+  |
> + * |Switch Board               |  |
> + * |                           |  |    +---------------+
> + * |CN5                            GND |<-+    |J7             |

Probably it would be more logical to wire GND to pin 14 of J7 (which
is the power connector) instead?
Doesn't matter much though, as all GND signals are connected to
each other.

> + * |                       3v3 |<----->| pin8  (+3.3v) |

Do you need the Switch Board?
GND and SPI_D1.8V/3.3V and I2C_D1.8V/3.3V  (which are 3.3V by default)
are available on CN40 and CN34 above, too.

> +/dts-v1/;
> +#include "r8a779g0-white-hawk.dts"

Please do not include "r8a779g0-white-hawk.dts", but make this file
a .dtso (DTS overlay) instead, cfr. salvator-panel-aa104xd12.dtso.

> +&i2c0 {
> +       da7212: codec@1a {
> +               compatible = "dlg,da7212";
> +
> +               #sound-dai-cells = <0>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               reg = <0x1a>;
> +
> +               clocks = <&rcar_sound>;
> +               clock-names = "mclk";
> +
> +               dlg,micbias1-lvl = <2500>;
> +               dlg,micbias2-lvl = <2500>;
> +               dlg,dmic-data-sel = "lrise_rfall";
> +               dlg,dmic-samplephase = "between_clkedge";
> +               dlg,dmic-clkrate = <3000000>;
> +
> +               VDDA-supply   = <&reg_1p8v>;
> +               VDDSP-supply  = <&reg_5p0v>;

As the wiring above does not provide VDD_SP (which is fine if the
speaker is not connected), you can drop VDDSP-supply, and [PATCH 6/9]
providing reg_5p0v.

FTR, "VDDSP-supply" is not documented in the DA7212 DT bindings.

> +               VDDMIC-supply = <&reg_3p3v>;
> +               VDDIO-supply  = <&reg_3p3v>;
> +
> +               port@0 {
> +                       da7212_endpoint: endpoint {
> +                               remote-endpoint = <&rsnd_endpoint>;
> +                       };
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
