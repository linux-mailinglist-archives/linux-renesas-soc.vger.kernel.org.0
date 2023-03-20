Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28AF86C2143
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Mar 2023 20:23:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbjCTTXp convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Mar 2023 15:23:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230368AbjCTTXZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2023 15:23:25 -0400
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FC0FBB82;
        Mon, 20 Mar 2023 12:15:40 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id bz27so2705385qtb.1;
        Mon, 20 Mar 2023 12:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679339692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gLrYVBZ/JL47Hc4gzY0cU/VlY4M0TqGjw22AJ3Xwse4=;
        b=X7f+gRsNeew36SyBXf52CvMxMJ9MXqtLI9iOIhtNsEBhkhnEbvtlun86016zYPhMQP
         27qUbWhSfqzRPm9IxB+TEsnBy0KVHJ/nnZGt2M5W1KVBMeP4+jcCaPlkUOdD23cw2tE2
         nn+az9JdenSf1OpqJt4j64gxI6TRt2OLLYMEGDKYeGQ0rFwOVj/R/JtBK38+ym05D5ot
         oc4qJpzHUSCvKzJsC+yUvpunqD/QnZDRLPQUGf/ST7hdI3sOFTWJxBy6u9Sm5gSxFmJA
         lnAGJ1ZTZN8yDcQ9Yl+kIUWy7qg70pg6JAoXJdmWs78Y+MKqAeqMVDiy9UwBl5L079C1
         z+Dw==
X-Gm-Message-State: AO0yUKUEUEc4L8mJ9AK4w9YMyem1UIA+mYSroytYm182OgWZucyJUbQc
        JTc5jHOx/H/P/c1iVaAwpDqFUW6dGxQm1w==
X-Google-Smtp-Source: AK7set+7XMCiHuoBSIHXVhosh9+u94jdD4Pf00MwlZ+k3m2Nu+qCenJUPTXyCmic7ih4tiYxsJ3OGA==
X-Received: by 2002:a05:622a:5d1:b0:3bf:e13e:30d2 with SMTP id d17-20020a05622a05d100b003bfe13e30d2mr255682qtb.67.1679339692317;
        Mon, 20 Mar 2023 12:14:52 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id d124-20020ae9ef82000000b007469587115dsm957174qkg.19.2023.03.20.12.14.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 12:14:51 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id i6so14472195ybu.8;
        Mon, 20 Mar 2023 12:14:51 -0700 (PDT)
X-Received: by 2002:a25:aac2:0:b0:b46:c5aa:86ef with SMTP id
 t60-20020a25aac2000000b00b46c5aa86efmr229267ybi.12.1679339691579; Mon, 20 Mar
 2023 12:14:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230320105339.236279-1-biju.das.jz@bp.renesas.com> <20230320105339.236279-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230320105339.236279-6-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 Mar 2023 20:14:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXJDeWko1W_OeaJn7Xrgo3nBVnKrD_Ce8Xd0foD1nRDWQ@mail.gmail.com>
Message-ID: <CAMuHMdXJDeWko1W_OeaJn7Xrgo3nBVnKrD_Ce8Xd0foD1nRDWQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] arm64: dts: renesas: r9a07g044: Enable sci0 nodes
 using dt overlay
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Mon, Mar 20, 2023 at 11:54 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable sci0 node using dt overlay and disable can{0,1}-stb-hog
> nodes in dt overlay as its pins are shared with sci0 pins.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3:
>  * New patch

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a07g043-smarc.dtso

Can you please come up with a better filename?
Perhaps r9a07g043-smarc-pmod.dtso?

> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the RZ/{G2UL, Five} SMARC EVK PMOD parts
> + *
> + * Copyright (C) 2023 Renesas Electronics Corp.
> + *
> + *
> + * [Connection]
> + *
> + * SMARC EVK                           PMOD USBUART
> + * +----------------------------+
> + * |CN7 (PMOD1 PIN HEADER)     |
> + * |   SCI0_TXD          pin7  |<----->| pin2  Tx      |
> + * |   SCI1_RXD          pin8  |<----->| pin3  Rx      |
> + * |   Gnd               pin11 |<----->| pin5  Gnd     |
> + * |   Vcc               pin12 |<----->| pin6  Vcc     |
> + * +----------------------------+      +---------------+

I don't think the right side of this diagram belongs here. The user
is not limited to a USB-UART bridge, but can connect whatever he wants
to the PMOD connector.

> + *
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +#include <dt-bindings/gpio/gpio.h>

Unused?

> +#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
> +
> +&pinctrl {
> +       can0-stb-hog {
> +               status = "disabled";
> +       };
> +
> +       can1-stb-hog {
> +               status = "disabled";
> +       };
> +
> +       sci0_pins: sci0-pins {
> +               pinmux = <RZG2L_PORT_PINMUX(2, 2, 5)>, /* TxD */
> +                        <RZG2L_PORT_PINMUX(2, 3, 5)>; /* RxD */
> +       };
> +};
> +
> +&sci0 {
> +       pinctrl-0 = <&sci0_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
