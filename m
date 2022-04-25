Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ACFD50E123
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 15:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbiDYNI7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 09:08:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234626AbiDYNI7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 09:08:59 -0400
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D133E019;
        Mon, 25 Apr 2022 06:05:50 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id ay11so10196723qtb.4;
        Mon, 25 Apr 2022 06:05:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1VvLmkVL+3wDUefmPwUcJ515cWbEyJqZs+5o404eNoY=;
        b=zgtoQEMFRZw1TcO6jYTIALPTRwbn3zVe1/ANRdSAXm6EWC4ELjyD05g7uUHxRDtM0L
         iWojGD1TsnQogs4Ex5cH2/uIjzfB+bm8LT33VN4hw9QyJ5VVVsXdxJ/28yawXwO7pqym
         w9zWIPTczILbSWKXo31TVZ6tdRjMzwC3x9QS4/SlB2w7P1nrRsbBH/TdjVdQmYioiqPE
         UGPwvdTvDQZ7asiRz+QNftmDa1TvdKf3dli6NY04ehzZaNP3BB+OpvloYZUqik7WAsVN
         YeGuXBR4apRR9SLGMM4FZX2vhOaS14Dn9M4BdU0+KwOJzXqvC+c6u7QbBBYvcZ/ecoUl
         km8w==
X-Gm-Message-State: AOAM5315fzN4XW+Dd0i3cg7j6zd5Tq6O2PO++mmbwPllx9JyUlt/nQyi
        OjnRiaKTRo5YtWIEvWfkzDRT8UUptEhChQ==
X-Google-Smtp-Source: ABdhPJz4qeByIaDx3XqAMrAaGIccgabnUT3X8urVV4cSy3/Purs7lWw+KZfHjmHrzIdRV0ckYz/Ydg==
X-Received: by 2002:ac8:594c:0:b0:2f3:3fd2:3ccf with SMTP id 12-20020ac8594c000000b002f33fd23ccfmr11710592qtz.610.1650891949069;
        Mon, 25 Apr 2022 06:05:49 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id z8-20020ac87f88000000b002e1cecad0e4sm6213718qtj.33.2022.04.25.06.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 06:05:48 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-2f7c57ee6feso52496027b3.2;
        Mon, 25 Apr 2022 06:05:48 -0700 (PDT)
X-Received: by 2002:a81:618b:0:b0:2db:d952:8a39 with SMTP id
 v133-20020a81618b000000b002dbd9528a39mr16620681ywb.132.1650891947948; Mon, 25
 Apr 2022 06:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220423202452.148092-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220423202452.148092-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 Apr 2022 15:05:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQTV2i6_vetQbowRBLEp2fu+rCTMyT77wRngBowAPzfQ@mail.gmail.com>
Message-ID: <CAMuHMdXQTV2i6_vetQbowRBLEp2fu+rCTMyT77wRngBowAPzfQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: timer: renesas: ostm: Document Renesas
 RZ/G2UL OSTM
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Chris Brandt <chris.brandt@renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Sat, Apr 23, 2022 at 10:25 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Document the General Timer Module(a.k.a OSTM) found on the RZ/G2UL SoC.
> OSTM module is identical to one found RZ/G2L SoC. No driver changes are
> required as generic compatible string "renesas,ostm" will be used as a
> fallback.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
> +++ b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
> @@ -23,6 +23,7 @@ properties:
>        - enum:
>            - renesas,r7s72100-ostm  # RZ/A1H
>            - renesas,r7s9210-ostm   # RZ/A2M
> +          - renesas,r9a07g043-ostm # RZ/G2UL
>            - renesas,r9a07g044-ostm # RZ/G2{L,LC}
>            - renesas,r9a07g054-ostm # RZ/V2L
>        - const: renesas,ostm        # Generic

Please make the resets property required on RZ/G2UL.

With that fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
