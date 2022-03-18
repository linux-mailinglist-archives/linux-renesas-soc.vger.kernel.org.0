Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 757B74DDA39
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Mar 2022 14:13:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233947AbiCRNPN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Mar 2022 09:15:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236475AbiCRNPM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Mar 2022 09:15:12 -0400
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B1BF19BE4F;
        Fri, 18 Mar 2022 06:13:49 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id g8so6699954qke.2;
        Fri, 18 Mar 2022 06:13:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I8RRrhJ/X2kMBWmamdIK7mZJoLlVgRV0dzKJA+6SxwU=;
        b=Xtuw9ZhNKUFXfSHRZzepV6/O+P9rmJbzodMRd4CB7k+2J4RZ//nTiDFO2cJ7MwzjTA
         DfdTPsoRv2y4Ji7x5icj76GWYDJxasoeNxw51/7WsSGddMNVdLUoOm/QJpVJNwVTMNSv
         UzmoNgJO4i7kaY9Z7ThFVF3ITn4KZHOp61UNi4heu6kOJKh7ZBmEFZgtPlFap7Sw8YYl
         b7E4grpzDAWvt4Jt/R73WDdISoLbFvLF3buksklmDmTOpHMXGAXreSVcheK+NEV8Xp2i
         4PEfNLAq2tqcvTOpyf7HP+wCt6mHUwuw2cOANeeY5zDYlYkHomg7kxIbOPzwbM1tR5+g
         DyKg==
X-Gm-Message-State: AOAM532yZqNjNS6Zb1iXOrGu3rNIKKgNb5ltem1YflSbCMbkwgTXyfde
        7MPnaLZjlqbcyJNipUhUz2qFySjOHdaKWKUX
X-Google-Smtp-Source: ABdhPJyVzCAY9L3Lcy00T5WGhlGF+tzT73+uADa5ATqS+JmXxcEZK6+S1TIwd6cuqB/FGReCfuRDPQ==
X-Received: by 2002:a05:620a:1539:b0:67d:45f2:f5bd with SMTP id n25-20020a05620a153900b0067d45f2f5bdmr5589683qkk.313.1647609228170;
        Fri, 18 Mar 2022 06:13:48 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id s131-20020a37a989000000b0067d2e3c51e8sm3893463qke.58.2022.03.18.06.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 06:13:47 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id t11so15764488ybi.6;
        Fri, 18 Mar 2022 06:13:47 -0700 (PDT)
X-Received: by 2002:a25:dfd3:0:b0:629:24ff:eab0 with SMTP id
 w202-20020a25dfd3000000b0062924ffeab0mr9513016ybg.613.1647609227009; Fri, 18
 Mar 2022 06:13:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220303164155.7706-1-biju.das.jz@bp.renesas.com> <20220303164155.7706-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220303164155.7706-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Mar 2022 14:13:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX6L9r0x7et+4OMYJ_KWZWF_E7tyufaK5bsPKc1RKAOfg@mail.gmail.com>
Message-ID: <CAMuHMdX6L9r0x7et+4OMYJ_KWZWF_E7tyufaK5bsPKc1RKAOfg@mail.gmail.com>
Subject: Re: [PATCH V2 1/4] arm64: dts: renesas: rzg2lc-smarc-pinfunction:
 Sort the nodes
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Mar 3, 2022 at 5:42 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Sort the pinctrl nodes alphabetically.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
