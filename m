Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A186628481
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Nov 2022 17:01:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236055AbiKNQBU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Nov 2022 11:01:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235591AbiKNQBT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2022 11:01:19 -0500
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 748F564C5;
        Mon, 14 Nov 2022 08:01:18 -0800 (PST)
Received: by mail-qk1-f181.google.com with SMTP id g10so7659225qkl.6;
        Mon, 14 Nov 2022 08:01:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZUnSJK/fsRsNB0D3yoZzXZNm+63Prf0gA3FnnEp1nQQ=;
        b=yGoUAPG89WrC/KgRMi6lwtackvwCx5JUVFHhUfy2NfvdUFcV8vPxuXzxxDuAXemPVG
         XTT1Zpr5tAacRaeT93gtZGhPYuDcsx3NwchNSJX40oxbgQ7vTqEJbWNdWiFSeLOl0wDf
         lIXFeEdt/zzdOjadUKDgjHZRiuHS1lrKeynxTn9tz4IG6ooOnFAIavxZPqsfW21S193n
         v4WMW85bd1I+FW3Ty9ysJkMFQvqZO0EQhO+r7a7S8On0AzR2dWchIeGHxFBRz5Y/nayW
         pXwSrM1VlfkCB6Fjia72ume1OPFGR5zU/AVRbQPoyECqTZ9n96OqKK5rsOrRUozIi6mI
         qpUQ==
X-Gm-Message-State: ANoB5pk28SJNNQsVOOugsQGpaO+s86ZogaH50LMASQkNRmxrRnbK/dlL
        z2e6UnHd7tZbVL2OUIxMOW3bPntaXHK6kg==
X-Google-Smtp-Source: AA0mqf5ZggB1OBrqzx6UnKzHzfIEXNiFaH/XBo5JVLS3XGZSx4SPvRHLXDgqydJeD8y6BpanhaAOvQ==
X-Received: by 2002:a05:620a:1442:b0:6fa:5257:9aa7 with SMTP id i2-20020a05620a144200b006fa52579aa7mr11622958qkl.150.1668441674804;
        Mon, 14 Nov 2022 08:01:14 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id w15-20020a05620a424f00b006fa4cac54a4sm6645499qko.133.2022.11.14.08.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 08:01:14 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-3691e040abaso110349047b3.9;
        Mon, 14 Nov 2022 08:01:14 -0800 (PST)
X-Received: by 2002:a81:4ed2:0:b0:370:202b:f085 with SMTP id
 c201-20020a814ed2000000b00370202bf085mr13249493ywb.502.1668441673867; Mon, 14
 Nov 2022 08:01:13 -0800 (PST)
MIME-Version: 1.0
References: <20221110160931.101539-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20221110160931.101539-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Nov 2022 17:01:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVseqcTR48=FaqbKGKpTrYs5fOXdjcxEV_c4FPSSPS8Kg@mail.gmail.com>
Message-ID: <CAMuHMdVseqcTR48=FaqbKGKpTrYs5fOXdjcxEV_c4FPSSPS8Kg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a09g011: Add L2 Cache node
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
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

On Thu, Nov 10, 2022 at 5:09 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The Cortex-A53 processor on RZ/V2M has 512 KB L2 Cache.
> Add L2 Cache node to SoC dtsi.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.2.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
