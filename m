Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5734640278
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Dec 2022 09:48:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231933AbiLBIsC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Dec 2022 03:48:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232226AbiLBIsA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2022 03:48:00 -0500
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46AE713E1F;
        Fri,  2 Dec 2022 00:47:59 -0800 (PST)
Received: by mail-qt1-f172.google.com with SMTP id x28so3136056qtv.13;
        Fri, 02 Dec 2022 00:47:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7bNc5uz7VY+zBJeLgRSqqRo5LBcpK3BCEiNB39wQ7gs=;
        b=ZEmpiVAFIY7LYUTUGjVnpouqfaIB99xy0iyuty5X9Ha10nk6ByEUhqhU3ZO+mB1FYe
         e1SPAP5tmRgM5cTRUqU5kF7Nw00OFOxhfy9sxDiBReZOPfgr+6/UUyfOQ1+cVdmIr+MT
         6quIzPJe80byVBX033KXCZsyu3T3BsvOgog42A04Tn5ybFn3KeGo9HhYFOXKX1TyZj99
         vGJhNbj2+AgW9I7ju6zOEeD5PSnSLQdwuuLZK6eFUI9HOBVHXzkNpNZpZAuJVuxK05PB
         TtrhMGULwicIDie+KTH/4pyiYv/geanx6+AN1117lk2SQFzGmG62OJ3gpUXF53kl6nLp
         wOgA==
X-Gm-Message-State: ANoB5pkDLc18VxmpquXcLOImKvWpcG9kLRlCu5lynUfZNcfCjVl2Imln
        WAjOhcfMZFwDaKMJMEEugbbTHRJ8MzAUMA==
X-Google-Smtp-Source: AA0mqf5Orwd52xKQToXngqn477lUede2GHlpdbN+fxoLCMNAu9GR9vbxY8ifNI1ktNzYdven/9EMcg==
X-Received: by 2002:ac8:4b77:0:b0:3a6:6d6b:8fa7 with SMTP id g23-20020ac84b77000000b003a66d6b8fa7mr29959427qts.123.1669970878284;
        Fri, 02 Dec 2022 00:47:58 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id q23-20020a37f717000000b006cbc00db595sm4898220qkj.23.2022.12.02.00.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 00:47:58 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-3bf4ade3364so42237747b3.3;
        Fri, 02 Dec 2022 00:47:57 -0800 (PST)
X-Received: by 2002:a0d:e6d4:0:b0:3c0:5701:ceaf with SMTP id
 p203-20020a0de6d4000000b003c05701ceafmr27876887ywe.358.1669970877660; Fri, 02
 Dec 2022 00:47:57 -0800 (PST)
MIME-Version: 1.0
References: <20221122213529.2103849-1-biju.das.jz@bp.renesas.com> <20221122213529.2103849-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20221122213529.2103849-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 2 Dec 2022 09:47:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUEqppLo28DSPQynvJAWKhqxsd5NEFEJ7DCUoMQ=bgcAA@mail.gmail.com>
Message-ID: <CAMuHMdUEqppLo28DSPQynvJAWKhqxsd5NEFEJ7DCUoMQ=bgcAA@mail.gmail.com>
Subject: Re: [PATCH 3/7] arm64: dts: renesas: r9a07g044: Add DSI node
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Nov 22, 2022 at 10:35 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add DSI node to RZ/G2L SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
