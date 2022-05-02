Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05D225173F8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 May 2022 18:14:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385269AbiEBQRu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 May 2022 12:17:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357459AbiEBQRr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 May 2022 12:17:47 -0400
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E57B1DF15;
        Mon,  2 May 2022 09:14:17 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id o18so11431843qtk.7;
        Mon, 02 May 2022 09:14:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0hqgqEu5aJRzgUMQaVoNip5QQc2c2ZvmWoCn1B6VpAY=;
        b=d6LjphT/YzeC1I+HVytlakLXPCv1THSH206yEEEAiuX2+K0bMBxkMCdffDdNCSeQVB
         cS4ph3cJngJ2P0lqu0qhNADUHA1bH1FedOdXpEQwKbTFPG0/nkXL0HwO/vF6iwK6rW3F
         7z0FoQli3tvlbB7ehM6Sb2q1zRCBIYh4e6JkWKNaPpPTswi2t+9pOeaZbuaaBYxyPwzc
         FpQRyct7zUBDfE7IdlQ0ULTIml4tD6pyLg+kWri97aIMKMGxFs2j4xIHqQrlNBeACP4c
         ZbMeKy5Ooy1hTNSitExZpk/vlkr03J1rIpCFep+ix2QD1ZsxmadZ3kgKa3voCXVctV07
         i7VA==
X-Gm-Message-State: AOAM532a0bLCKmcJBs29XlH89Qp2Rm4YgT0YjYiv239Y5NY3PGyi3fmW
        8PAqn8/PxZRIN+v7KcHk45CnPEMO6KbCfA==
X-Google-Smtp-Source: ABdhPJzgdvSdDZFl+lCu0pCk/vob5EsY3oOIFR7nioEJcoiQxqdoF7kOoGemWehLjRNHMfgt1gbQZA==
X-Received: by 2002:ac8:598a:0:b0:2f3:637b:e4a with SMTP id e10-20020ac8598a000000b002f3637b0e4amr10814805qte.389.1651508056937;
        Mon, 02 May 2022 09:14:16 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id b20-20020ac84f14000000b002f39b99f6bfsm4280166qte.89.2022.05.02.09.14.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 09:14:16 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-2f7b815ac06so153268087b3.3;
        Mon, 02 May 2022 09:14:16 -0700 (PDT)
X-Received: by 2002:a0d:d953:0:b0:2f7:d5ce:f204 with SMTP id
 b80-20020a0dd953000000b002f7d5cef204mr11551364ywe.502.1651508056101; Mon, 02
 May 2022 09:14:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220501112926.47024-1-biju.das.jz@bp.renesas.com> <20220501112926.47024-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220501112926.47024-6-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 May 2022 18:14:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXhiREfd2VUNAbLUdHz7aRz2LuuXwUdh6HK7Lu=GtS7jw@mail.gmail.com>
Message-ID: <CAMuHMdXhiREfd2VUNAbLUdHz7aRz2LuuXwUdh6HK7Lu=GtS7jw@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: renesas: r9a07g043: Create thermal zone
 to support IPA
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Sun, May 1, 2022 at 1:29 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Setup a thermal zone driven by SoC temperature sensor.
> Create passive trip points and bind them to CPUFreq cooling
> device that supports power extension.
>
> Based on the work done by Dien Pham <dien.pham.ry@renesas.com>
> and others for r8a77990 SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
