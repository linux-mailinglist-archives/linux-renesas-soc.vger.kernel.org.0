Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22A2151344A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 14:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346739AbiD1NB3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 09:01:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231663AbiD1NB3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 09:01:29 -0400
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7E5167D26;
        Thu, 28 Apr 2022 05:58:14 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id kj18so3123599qvb.6;
        Thu, 28 Apr 2022 05:58:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2JKSK3fwJTG0Cl+viZ5u8R8HGsFZIqhqxJGYb5VEoHM=;
        b=RpsBsC3JZtZHGKYs7CMlN4J9URvQ12iCXPmAFvX5tt2LvgLjXq/aFU+u/TRJwVZMGG
         1CldRnuTB4KiUVpsjrCF4ChmwXe4xPsU7O/VPO46hedaFgtt9tQNjJZwigngRFHzvuRC
         wKFjWyeuY1wbZ5HqHKzOTsbbj2zBAZNPvMxTXv0xgEX7AUmgOvO2XF55IeHr2S1IxjWK
         MEmpykzKJmi8cH6GOQElrpoJi6wrr7eLHBTs9OFIQ5Jatbkv3vM0Vydd2o4Q7A+EZ1Ju
         bwe3pbctPwVMaf5Y5GYnR5Bn+Gigt+zbT2m8Ad7R/CF2VV782gjwcHUd3ffLy7a86aAW
         Swcg==
X-Gm-Message-State: AOAM533HiNNoMnstaONblLPXDCgKNh5Y1W/lqMMJvJJNWjgGe0NWoYG/
        qU/fvkOTD4/mFNzmJVjs4Zy9mke226SATA==
X-Google-Smtp-Source: ABdhPJxjsdA6OsOlvDzTmvfFxeGU9d/NNqXa6NszhSvzR4w6IxCknC5yOKUtkVym6KL7YuMErNiyWw==
X-Received: by 2002:a05:6214:29c4:b0:456:49e7:d75b with SMTP id gh4-20020a05621429c400b0045649e7d75bmr8653892qvb.30.1651150693648;
        Thu, 28 Apr 2022 05:58:13 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id d65-20020a37b444000000b0069e9f79795fsm9476594qkf.67.2022.04.28.05.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 05:58:13 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id e12so8813474ybc.11;
        Thu, 28 Apr 2022 05:58:13 -0700 (PDT)
X-Received: by 2002:a25:9e89:0:b0:63c:ad37:a5de with SMTP id
 p9-20020a259e89000000b0063cad37a5demr30555080ybq.342.1651150692961; Thu, 28
 Apr 2022 05:58:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220425170530.200921-1-biju.das.jz@bp.renesas.com> <20220425170530.200921-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220425170530.200921-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Apr 2022 14:58:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWwMF2wPoCfsgXBjEx2JikpJGwEaApb9V=mn-P6BZKhnA@mail.gmail.com>
Message-ID: <CAMuHMdWwMF2wPoCfsgXBjEx2JikpJGwEaApb9V=mn-P6BZKhnA@mail.gmail.com>
Subject: Re: [PATCH 02/13] arm64: dts: renesas: r9a07g043: Add SSI{1,2,3}
 nodes and fillup the SSI0 stub node
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
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 25, 2022 at 7:05 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add SSI{1,2,3} nodes and fillup the SSI0 stub node in RZ/G2UL
> (R9A07G043) SoC DTSI.
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
