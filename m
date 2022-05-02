Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6051F517224
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 May 2022 17:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385653AbiEBPH0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 May 2022 11:07:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235195AbiEBPHY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 May 2022 11:07:24 -0400
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DFED10FFC;
        Mon,  2 May 2022 08:03:55 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id c1so11507342qkf.13;
        Mon, 02 May 2022 08:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wpkWBnUm+tMNXEdU7dKMrLB1fKI4P20T5F+R3AcKCzs=;
        b=xXjpkNbgZtc+HkIJ6v7m0YqnKw2lfPfitWvD0A/k+5hwzbPChMjx0vFdnoCh5hldvL
         itqS3HooqpMaNd832qwSVPWYKs3EJsIbLUmMw7UrbcHb4pUe1I+yxRz7pua8+XuKkFPh
         s40nn5HhVZ6XSZ9Qeg8xkfnLr1T2Pwfwkdzd0IXqLu8roK4ShgbXdlcj6FkwRUylgvdT
         E/kuwX6jY8+V6s2lnq2w8lTd5G8sB/HmWY1V0BooDUmwlevYojK6XIcYbzzgy5RYaud0
         EeKV0Ab+iV0QLeL4/oZNHOpy83Zsfs53pTi/nsEuz5sh0ChMJHZ0956FmKuraCAxeS77
         4Emw==
X-Gm-Message-State: AOAM532PSFeKP0rwIdjchyo2BMe3kl2qZSlkXlZ7j3Ww9oPaY4G6im3h
        kJWh1W7g/z3+6Fe9zh+ghXca/WHpSvJotw==
X-Google-Smtp-Source: ABdhPJxLOjB9SDUD5whn4d7o/eDaFFzOpu8LvLoOR9GAGYONE9On1ONxfgQYdslf+a7YRvh/AL6mhQ==
X-Received: by 2002:a05:620a:2a06:b0:69f:f8f5:fdba with SMTP id o6-20020a05620a2a0600b0069ff8f5fdbamr993854qkp.110.1651503833925;
        Mon, 02 May 2022 08:03:53 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id 18-20020ac85652000000b002f39b99f66dsm4262063qtt.7.2022.05.02.08.03.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 08:03:53 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id y76so26539023ybe.1;
        Mon, 02 May 2022 08:03:53 -0700 (PDT)
X-Received: by 2002:a25:6157:0:b0:645:8d0e:f782 with SMTP id
 v84-20020a256157000000b006458d0ef782mr11274573ybb.36.1651503832314; Mon, 02
 May 2022 08:03:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220501082508.25511-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220501082508.25511-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 May 2022 17:03:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV07CHm3NE9YUTMqp-ZNkWoJyR6CFU9PA0heK+9G6NDxw@mail.gmail.com>
Message-ID: <CAMuHMdV07CHm3NE9YUTMqp-ZNkWoJyR6CFU9PA0heK+9G6NDxw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: memory: renesas,rpc-if: Document RZ/G2UL SoC
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

On Sun, May 1, 2022 at 10:25 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Document RZ/G2UL RPC-IF bindings. RZ/G2UL RPC-IF is identical to one found
> on the RZ/G2L SoC. No driver changes are required as generic compatible
> string "renesas,rzg2l-rpc-if" will be used as a fallback.
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
