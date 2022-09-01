Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46DFE5A96A1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Sep 2022 14:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231700AbiIAMWW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Sep 2022 08:22:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232702AbiIAMWU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Sep 2022 08:22:20 -0400
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAE4411D933;
        Thu,  1 Sep 2022 05:22:17 -0700 (PDT)
Received: by mail-qk1-f179.google.com with SMTP id f4so13031606qkl.7;
        Thu, 01 Sep 2022 05:22:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=SmNWTeT08VNbE8tZJFw2sHkz/HBTChYPEEmpQQEBkUo=;
        b=qPJ2iTh/eI9pbEYU1Uq11S0oRK+eQS/MKAQUUXxCLke6o2/ktOlkQU7u/yatLwPV56
         9qNHUYGzablYHFQODXX5YYBCixuIHGHYWTy4bSY93LAru8IHfGKkL/IqHzQTaoHODXsB
         neK4XZ3a9RDVc3jKcBTUh+JF3/pMdYReTUWsTBTNBuoypVYK2J3W53xp2l5pbdA3L8Ro
         w5VFRjYUC5RRm0PTzT2ffYmdWpjoN3HpD/pA16P/URBYxlgBoESsZZ+otTmXZs9YbEoA
         7JE9fpxpKhe7W4G4AfBnvDamDQwedfQzGlpz2MMMl/p5WQfLeAYjzOCbzuX4QcUQweu4
         k2pA==
X-Gm-Message-State: ACgBeo27wPti6z/NiQvLsG3DYzTUwdZraKqoJZX21CaN1HmPGrgstJyt
        XcuUzR21nEfbAhnGEytP10ou7lb7GwrhbA==
X-Google-Smtp-Source: AA6agR747SSCnKDik9yjuczTGxUVAAHgG3Y6KwNudqSwXeL+kA9S3OpDgZhg+b4bFe5zLtNy7fA5mQ==
X-Received: by 2002:a05:620a:404d:b0:6be:9818:ea49 with SMTP id i13-20020a05620a404d00b006be9818ea49mr8941229qko.197.1662034936699;
        Thu, 01 Sep 2022 05:22:16 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id hf11-20020a05622a608b00b00344b807bb95sm9947340qtb.74.2022.09.01.05.22.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 05:22:16 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id g5so8328029ybg.11;
        Thu, 01 Sep 2022 05:22:16 -0700 (PDT)
X-Received: by 2002:a25:8e84:0:b0:696:466c:baa with SMTP id
 q4-20020a258e84000000b00696466c0baamr17235388ybl.604.1662034935947; Thu, 01
 Sep 2022 05:22:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220830164518.1381632-1-biju.das.jz@bp.renesas.com> <20220830164518.1381632-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220830164518.1381632-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 1 Sep 2022 14:22:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXJv80OM9w+euTt9OZvkxYg=1FLhXP_WStZzSrO3bB2bg@mail.gmail.com>
Message-ID: <CAMuHMdXJv80OM9w+euTt9OZvkxYg=1FLhXP_WStZzSrO3bB2bg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] ARM: dts: r9a06g032: Add CAN{0,1} nodes
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
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

On Tue, Aug 30, 2022 at 6:45 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add CAN{0,1} nodes to R9A06G032 (RZ/N1) SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Dropped clock-names property.
>  * Added power-domains property.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.1.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
