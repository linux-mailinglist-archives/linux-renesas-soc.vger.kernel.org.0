Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26FF06402E6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Dec 2022 10:05:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232901AbiLBJFB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Dec 2022 04:05:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233034AbiLBJEi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2022 04:04:38 -0500
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7402A7AAF;
        Fri,  2 Dec 2022 01:04:37 -0800 (PST)
Received: by mail-qt1-f176.google.com with SMTP id fz10so4293223qtb.3;
        Fri, 02 Dec 2022 01:04:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4FKRNf8D9AZLs4VrQo404Aizhhbhp6u+A0RBIlZl7BQ=;
        b=2v/RRppYTr/P+/3Tj8WBawNWV1hjxfmLCteFZsT5cXWym2wkfNy8xDdt5+2VexDmaU
         3SyKbYRHPtCzOJnuGGLi9v9kVA7CbdIwgZ2uUKekL/Frcm1PHY3bAYmyZmrAMGjB5Dio
         pWnH4W+kazi9UBZaek/cmSMGko1BV9JE13/fiG3WfNW5XuqBoSY7AjeDNp+RL3QtCW2t
         g4XHnf+weJuQ3h01B1SKsb4fT1dQMX6DvlqvMKKrWMGCk4+LfMMMfEAIGXE3DdFza7hI
         7JKcgmZ9eOnHybOKZhCx6il6GWWTsP9dZ+wPXR8STi5ySrg3JuPA6teO7Vhra1Gz1nRH
         C3RQ==
X-Gm-Message-State: ANoB5pmTy7grk9YqoeiDbSbz534+rSy72gYiqTZ8cvIX2xSpAG4ljrAk
        ZMGSxBa9hd6CMmnCwUFWm0aACl2REOicTw==
X-Google-Smtp-Source: AA0mqf7+bHdOL97adiWg3MH2V8Kto5p2Lwnhj/NfHv6bwqeGH5KGCbdq+OOEqI1jPFe4Ao7KbL62zA==
X-Received: by 2002:ac8:6b92:0:b0:3a6:8ed4:518b with SMTP id z18-20020ac86b92000000b003a68ed4518bmr9087396qts.287.1669971876613;
        Fri, 02 Dec 2022 01:04:36 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id u25-20020a37ab19000000b006eeca296c00sm4875709qke.104.2022.12.02.01.04.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 01:04:36 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-3b5d9050e48so42698837b3.2;
        Fri, 02 Dec 2022 01:04:35 -0800 (PST)
X-Received: by 2002:a05:690c:b81:b0:37e:6806:a5f9 with SMTP id
 ck1-20020a05690c0b8100b0037e6806a5f9mr50121424ywb.47.1669971875715; Fri, 02
 Dec 2022 01:04:35 -0800 (PST)
MIME-Version: 1.0
References: <20221122213529.2103849-1-biju.das.jz@bp.renesas.com> <20221122213529.2103849-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20221122213529.2103849-7-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 2 Dec 2022 10:04:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXDWdmHqVa50ON1s-op25Dk5XaNM3+HfOs9hCV+EPA6PA@mail.gmail.com>
Message-ID: <CAMuHMdXDWdmHqVa50ON1s-op25Dk5XaNM3+HfOs9hCV+EPA6PA@mail.gmail.com>
Subject: Re: [PATCH 6/7] arm64: dts: renesas: r9a07g054: Add vspd node
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
> Add vspd node to RZ/V2L SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Note:
>  This patch depen upon binding patch [1]
>  [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20221122193415.1873179-1-biju.das.jz@bp.renesas.com/

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
