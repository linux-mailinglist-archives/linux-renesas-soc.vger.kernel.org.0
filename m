Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 334865173D4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 May 2022 18:09:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241460AbiEBQNA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 May 2022 12:13:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240612AbiEBQM7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 May 2022 12:12:59 -0400
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99598DEEF;
        Mon,  2 May 2022 09:09:30 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id h13so367687qvh.0;
        Mon, 02 May 2022 09:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kf6KW4S6YQWsX5TsEsk6lp3YPZEpQJi8AUa4UmH89BM=;
        b=LI0xjWE8saSUCqQzEpxmbhxlcaKpb42TA5e8pImjvH99bSvAXJEHTS5gfqHKtqGS/4
         jkRkQ+eiYIjcfMBoUG97MXbDN0bF5+lY0zcr2FWXWcrVHACQhzW9eOuGBz/m2r5c/qQM
         H1QerBe/YO+B5UTY/n4gJ/EYDl10qKN/uC0Wj5EBjQhQGapXNUz8wCOAYRNt5SVhpkyN
         zieSUjb5Wwx4fs3/F8RmmY82xL9ef+GRJp2DUYdaXvMtA43u32PKBEi1VjaByvwDRPPd
         yXqpYCajxJjPPGALS1vDPIS5LCPpxqbFqawnyrDPE4eSVKOLPdlJGvmnME0pl47C3NJ8
         Lljw==
X-Gm-Message-State: AOAM532tCsMSOv59VJ0HMXhKmRckC5pnroGZTdBcyGCvmPY+rEYUNmBT
        kJfHAC2XDlfvqsy8g/FXrpRM8BbAknyKjA==
X-Google-Smtp-Source: ABdhPJwolo74bSZmc3MtBo0s0ucoofegWJ5YPatSd62DbAEJgv1I3gpZ/6FbZPwlBeX97vgvo9zanA==
X-Received: by 2002:a0c:e393:0:b0:45a:8c08:a5e6 with SMTP id a19-20020a0ce393000000b0045a8c08a5e6mr4689034qvl.115.1651507769270;
        Mon, 02 May 2022 09:09:29 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id 5-20020a05620a048500b0069fd9de088esm2351046qkr.93.2022.05.02.09.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 09:09:28 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id s30so26822300ybi.8;
        Mon, 02 May 2022 09:09:28 -0700 (PDT)
X-Received: by 2002:a05:6902:389:b0:633:31c1:d0f7 with SMTP id
 f9-20020a056902038900b0063331c1d0f7mr10476491ybs.543.1651507768250; Mon, 02
 May 2022 09:09:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220501112926.47024-1-biju.das.jz@bp.renesas.com> <20220501112926.47024-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220501112926.47024-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 May 2022 18:09:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVp9ddi+JR3_tNZs1Km8Xu_++DGZFwtpHH6AjRb73rPKA@mail.gmail.com>
Message-ID: <CAMuHMdVp9ddi+JR3_tNZs1Km8Xu_++DGZFwtpHH6AjRb73rPKA@mail.gmail.com>
Subject: Re: [PATCH 2/6] arm64: dts: renesas: r9a07g043: Add RSPI{0,1,2} nodes
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
> Add RSPI{0,1,2} nodes to R9A07G043 (RZ/G2UL) SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
