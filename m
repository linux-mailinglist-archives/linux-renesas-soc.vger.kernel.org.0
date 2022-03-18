Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FD324DDA43
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Mar 2022 14:14:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236572AbiCRNP3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Mar 2022 09:15:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236570AbiCRNP2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Mar 2022 09:15:28 -0400
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C2EB1FCD13;
        Fri, 18 Mar 2022 06:14:08 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id y15so6747671qta.13;
        Fri, 18 Mar 2022 06:14:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BJOZHIJQrV/9BB3b6r8Vb4r4Czq93oY8xRxP8ZLlv0A=;
        b=cIX7wk7hEQy2XkutW6oifzvXo7WLCLyHb3NxW7bqMMDOhHcTloKclpucNsLwhiD4GJ
         XlVOWb6SiA7oWyzKiH/ieq5+ynBkQCJBirCUktmxh3dAEmuJGYdddHFFfK8NkqYBE/wt
         J3pszigjcYdCX85/KmpVhbaHNzuUpIwnsHqXr9VtXbgEZQv2KtzNEU984ZajtVDpF5Dp
         MfPxI6hgjqUzgAU3cao5a3Dev1g7nkiuLQO/QD8Nu2Q0b70d1IWxUy/zOnBC51EtOQCs
         ENOJvL/qxeZVK4vlIs9boMsta0idiRCi6zBnt+QidjJtvMdrcU1o3E1bb6B53sh9nlaJ
         Uu+w==
X-Gm-Message-State: AOAM533MAjNxv29Hiz/J462E76a1CwxXG71FVxyzHs6/Xq4c0YCKE9ZU
        0ADoMoFP3KYhMJJ23rWH5bQMJQA/X9+GhEJi
X-Google-Smtp-Source: ABdhPJyBu73dv3gtxLLcVKxgZnophTK6VESoFjlM2dEr7dM10YdytX7Hl5v5ZJbOEn5OfDZJXOVJCA==
X-Received: by 2002:ac8:5910:0:b0:2e1:a132:e11b with SMTP id 16-20020ac85910000000b002e1a132e11bmr7131060qty.27.1647609247241;
        Fri, 18 Mar 2022 06:14:07 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id d82-20020a376855000000b0067dacb03b6esm3795764qkc.130.2022.03.18.06.14.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 06:14:07 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-2db2add4516so90932307b3.1;
        Fri, 18 Mar 2022 06:14:06 -0700 (PDT)
X-Received: by 2002:a81:6d02:0:b0:2e5:df3c:dcd4 with SMTP id
 i2-20020a816d02000000b002e5df3cdcd4mr2494300ywc.479.1647609246506; Fri, 18
 Mar 2022 06:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220303164155.7706-1-biju.das.jz@bp.renesas.com> <20220303164155.7706-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220303164155.7706-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Mar 2022 14:13:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWkjcd30eqvSYxYJpQ=bnGEj6s27SMwOkepdU5Bw7Gdvg@mail.gmail.com>
Message-ID: <CAMuHMdWkjcd30eqvSYxYJpQ=bnGEj6s27SMwOkepdU5Bw7Gdvg@mail.gmail.com>
Subject: Re: [PATCH V2 4/4] arm64: dts: renesas: rzg2lc-smarc: Enable Audio
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Mar 3, 2022 at 5:42 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable Audio on RZ/G2LC SMARC EVK by deleting ssi0 entries from
> board DT and adding pincontrol entries to the soc-pinctrl dtsi,
> so that entries from common dtsi kick in and make audio functionality
> operational.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
>  * No change.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
