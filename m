Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ACB56402EB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Dec 2022 10:08:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232447AbiLBJIC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Dec 2022 04:08:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231578AbiLBJIB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2022 04:08:01 -0500
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A19D26553;
        Fri,  2 Dec 2022 01:07:59 -0800 (PST)
Received: by mail-qt1-f179.google.com with SMTP id fp23so4013007qtb.0;
        Fri, 02 Dec 2022 01:07:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gkq8gm4i4xZkLA4MVRTzs1sMbjnqWTqoXozuI3cJQZo=;
        b=CPYDzBdbdFs6DprO/9/7W1rChcIrDjShyXPobNsucZIbmicRnggMFywszP6GwF1qZ6
         bv8Psp0q9l34lMYWf093kkuLg6FjdH2ur9gb8c308SktXTegbxckh/LB7mhRCHfmk8lA
         itcN6ydiNGqHGbu8B8MMO9a0HfaE94c1FkYvn3VbCaR3SqenGpocJuyGVc99z6QzcjUP
         +sHD3OW6wIUa9B0+0jt+QiyO36wq23OXON06UyS1Xx6TCc673llxx5cVRO2FVNybN0Ld
         QXhvhUp2kN12ao/YT+HWrk6zipm7ZJgBZ2L3COha0BBG8PiUodvwjZtPCFEu4enWTYDD
         BSrg==
X-Gm-Message-State: ANoB5pkE4OBOEagyz82TYOa4kLEnR+EIHUY4kR+V7NWs4VFDA6Aewbz1
        GBUv9VAueD506VHj7cahSRQOVKN/Ibiesg==
X-Google-Smtp-Source: AA0mqf7Q0Cwe63hLZHd1tevzhct+6m1CNbgqJ9O7lP16oTnzLOOlKpVjLiBp49oyznILIDfT7c6AfA==
X-Received: by 2002:ac8:1416:0:b0:3a5:6822:1a42 with SMTP id k22-20020ac81416000000b003a568221a42mr51978506qtj.174.1669972078276;
        Fri, 02 Dec 2022 01:07:58 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id x10-20020a05620a258a00b006bb82221013sm5209178qko.0.2022.12.02.01.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 01:07:57 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-3876f88d320so42541777b3.6;
        Fri, 02 Dec 2022 01:07:57 -0800 (PST)
X-Received: by 2002:a81:1486:0:b0:36b:56d3:71b8 with SMTP id
 128-20020a811486000000b0036b56d371b8mr959913ywu.384.1669972077269; Fri, 02
 Dec 2022 01:07:57 -0800 (PST)
MIME-Version: 1.0
References: <20221122213529.2103849-1-biju.das.jz@bp.renesas.com> <20221122213529.2103849-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20221122213529.2103849-8-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 2 Dec 2022 10:07:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVwFJd0M19BBH7oFdCFV1Wg2+xuN_MACX4j9fXtdvFSsA@mail.gmail.com>
Message-ID: <CAMuHMdVwFJd0M19BBH7oFdCFV1Wg2+xuN_MACX4j9fXtdvFSsA@mail.gmail.com>
Subject: Re: [PATCH 7/7] arm64: dts: renesas: rzg2l-smarc: Enable DSI and link
 with ADV7535
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
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

On Tue, Nov 22, 2022 at 10:36 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable DSI and link with ADV7535 on RZ/G2L SMARC EVK.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Note:
>  This patch depen upon patch [1]
>  [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20221122185802.1853648-1-biju.das.jz@bp.renesas.com/

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> Will link DSI port@0 with DU, once we have DU node is ready.

Looking forward to that.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
