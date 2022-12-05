Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 811406423F3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Dec 2022 09:00:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231806AbiLEIAn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Dec 2022 03:00:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231753AbiLEIAl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2022 03:00:41 -0500
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B965A11444;
        Mon,  5 Dec 2022 00:00:40 -0800 (PST)
Received: by mail-qk1-f172.google.com with SMTP id p18so4390568qkg.2;
        Mon, 05 Dec 2022 00:00:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=me207DjYqa1mkCSQToax0L6y51smuqPSYa6gnZpD/eg=;
        b=ETLhbJPpv5ToehAhMmot5DJ0W4To1huiMzJFO/U4Lck8O06PnteIi6zk0O1kRwSvmu
         bSp1CgadrIHazWhzjtP2OACu2wklPu51B+DCsTeNXvFnrOmzDjvZnDQTMU3S6+rpFv1p
         tQhYey6wmh1SKNDAt9vor+U9/7/v5eGOSegt+rn1P2PcOsSGGcLLE3202HW6adukYi4R
         roQ3+WPkph/rVuquYX3LNWBpbprD5OGxhimq2EBx2uW7m2Sz1tkCWbpa6iQdv5gdk0k7
         cKnAkl+qqyOmwvyTPjly0J6FP4P92rKt4yHvLOVQdSgZ541VS19n1vG3FfwLQlza3Zla
         GTDg==
X-Gm-Message-State: ANoB5pmKyJVAFY6HJkqwfOvclhSnfQIrs8VD3d4GBjnkwsCLUl7N3Q1L
        363/qostaMHC9Oa1F9wHKoWGU+g29wcrmQ==
X-Google-Smtp-Source: AA0mqf4tu2rW2G0wzhZzyMqnFvHdUxwxS6xmqv9/PLeYe+zY3/pmLKf/xXVPrwpVC7Gp6w1M0jrUpg==
X-Received: by 2002:a05:620a:1225:b0:6ed:28b:764d with SMTP id v5-20020a05620a122500b006ed028b764dmr71992855qkj.328.1670227239157;
        Mon, 05 Dec 2022 00:00:39 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id v15-20020a05620a440f00b006ecfb2c86d3sm12055311qkp.130.2022.12.05.00.00.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 00:00:38 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id n184so13239967yba.6;
        Mon, 05 Dec 2022 00:00:38 -0800 (PST)
X-Received: by 2002:a25:7204:0:b0:6f0:9ff5:1151 with SMTP id
 n4-20020a257204000000b006f09ff51151mr51193068ybc.543.1670227237838; Mon, 05
 Dec 2022 00:00:37 -0800 (PST)
MIME-Version: 1.0
References: <cover.1669980383.git.geert+renesas@glider.be> <9f2a2474ec71dcc2a76e868295202a8c425a5d41.1669980383.git.geert+renesas@glider.be>
 <b105572c-96fe-dbad-c435-43233cfb25a7@linaro.org>
In-Reply-To: <b105572c-96fe-dbad-c435-43233cfb25a7@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 5 Dec 2022 09:00:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXG39BoMScDpH_Cxc-BXBKZHxyQqe6MJMEhnerN3yU6Uw@mail.gmail.com>
Message-ID: <CAMuHMdXG39BoMScDpH_Cxc-BXBKZHxyQqe6MJMEhnerN3yU6Uw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: sound: ti,pcm3168a: Convert to json-schema
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Damien Horsley <Damien.Horsley@imgtec.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Krzysztof,

Thanks for your comments!

On Sat, Dec 3, 2022 at 1:13 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 02/12/2022 13:55, Geert Uytterhoeven wrote:
> > Convert the Texas Instruments PCM3168A Audio Codec Device Tree binding
> > documentation to json-schema.
> >
> > Add missing properties.
> > Drop unneeded pinctrl properties from example.
>
> Thank you for your patch. There is something to discuss/improve.
>
> > +description:
> > +  The Texas Instruments PCM3168A is a 24-bit Multi-channel Audio CODEC with
> > +  96/192kHz sampling rate, supporting both SPI and I2C bus access.
> > +
> > +properties:
> > +  compatible:
> > +    const: ti,pcm3168a
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: System clock input
> > +
> > +  clock-names:
> > +    items:
> > +      - const: scki
> > +
> > +  reset-gpios:
> > +    items:
> > +      - description: |
> > +          GPIO line connected to the active-low RST pin of the codec.
> > +            RST = low: device power-down
> > +            RST = high: device is enabled
> > +
> > +  "#sound-dai-cells":
> > +    enum: [0, 1]
>
> This is a bit unexpected. Looking at DTSes:
> 1. I see in ulcb-kf.dtsi with cells==0, but two endpoints. The dai cells
> seem unused? In such case shall dai-cells be skipped if we have endpoints?
>
> 2. in k3-j721e-common-proc-board.dts has cells=1, but user's phandle
> does not have an argument, so practically it is ==0? The user -
> sound/soc/ti/j721e-evm.c - just gets the node and does not use cells,
> right? So even though dai-cells==1, it does not matter, because user
> gets its own parsing?
>
> 3. The pcm3168a driver also does not have any xlate function, but it
> registers to DAIs, so all uses should be with cells==1 to select proper
> DAI...

I have no idea (DAI is magic to me), and hope the audio experts
can provide some input...
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
