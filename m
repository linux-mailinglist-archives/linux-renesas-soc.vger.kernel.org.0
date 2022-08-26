Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E55705A26DD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Aug 2022 13:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbiHZLaX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Aug 2022 07:30:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230167AbiHZLaW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Aug 2022 07:30:22 -0400
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 419004D819
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Aug 2022 04:30:20 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id c9so848715qkk.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Aug 2022 04:30:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=xYataQajHC/ZDBZLOTJIyTHf8SdG8tMCfFcPJXrEN40=;
        b=UgtqaHW9swPUnU4ES81Fm8xIWvYUXFlrqama46vcSn3y33If6OzIaYfpyS6LU1admP
         cnU2MYjVPSaLFVsSbjrQ2QtVNPl58A1agHMGBLAPt5QI6TF5dmO1InUBZUN9yDe+FmHY
         Twr59KhobYT7HFgJI2m3/klu9wEe6ESJr+yn7wVNmuL6xdDz4h8t4IgyB7pTgDEVLOFT
         Aj19nC8/W/7AVIvcX09JkbdtcLGrgrt/sqrpzroUu8H6R1jgHEYMjukeFggbWEaHzPXR
         dLxdDWLeJZeHVpRCwpVMAz5WzbUwvR3whPkwAXWr9WijftV23VtTPKtFyK9YH2nErEAp
         uqOQ==
X-Gm-Message-State: ACgBeo2/iNBmm+QgB8u7KYfe4zxsTlKO4wrmdHPDyEwoZ2Y0cVPGcuv1
        6tXruVZkNCi0Mj4+MQxIgJ291y/Iqyy8eA==
X-Google-Smtp-Source: AA6agR4VgNmirWOwtVI5iuQzoMpu74V44nGsHUoG5qaeGvErDhYposORrUocE6Lx4/6d3GWPcsBIhg==
X-Received: by 2002:a05:620a:4711:b0:6bb:7e1b:5f0b with SMTP id bs17-20020a05620a471100b006bb7e1b5f0bmr5915188qkb.127.1661513419107;
        Fri, 26 Aug 2022 04:30:19 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id v21-20020a05620a0f1500b006bbdcb3fff7sm1613591qkl.69.2022.08.26.04.30.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 04:30:18 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-324ec5a9e97so28320797b3.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Aug 2022 04:30:18 -0700 (PDT)
X-Received: by 2002:a81:6d53:0:b0:33d:bbf4:7582 with SMTP id
 i80-20020a816d53000000b0033dbbf47582mr6607604ywc.384.1661513418377; Fri, 26
 Aug 2022 04:30:18 -0700 (PDT)
MIME-Version: 1.0
References: <87y1vf92do.wl-kuninori.morimoto.gx@renesas.com> <87sfln92ch.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87sfln92ch.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 26 Aug 2022 13:30:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU2JzK+4VZxxs=BgsZTBKgJV2aepyH3oUM5jPR5Cfco3Q@mail.gmail.com>
Message-ID: <CAMuHMdU2JzK+4VZxxs=BgsZTBKgJV2aepyH3oUM5jPR5Cfco3Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] dt-bindings: arm: renesas: Document Renesas R-Car
 Gen3 V3H2 Condor-I board
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Andrey Dolnikov <andrey.dolnikov@cogentembedded.com>,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Tue, Aug 23, 2022 at 3:27 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds new R-Car Gen3 V3H2 Condor-I board.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> @@ -291,6 +291,15 @@ properties:
>                - renesas,v3hsk # V3HSK (Y-ASK-RCAR-V3H-WS10)
>            - const: renesas,r8a77980
>
> +      - description: R-Car V3H2 (R8A77980A)
> +        items:
> +          - enum:
> +              - renesas,condor-i # Condor-I (RTP0RC77980SEBS012SA01)
> +          - enum:
> +              - renesas,condor   # Condor

Given the changes in the PMIC and CAN transceiver department, I think
it would be prudent to drop the compatibility with "renesas,condor".

For similar reasons, the Salvator-XS board also doesn't declare
compatibility with "renesas,salvator-x".

> +          - const: renesas,r8a77980a
> +          - const: renesas,r8a77980
> +
>        - description: R-Car E3 (R8A77990)
>          items:
>            - enum:

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
