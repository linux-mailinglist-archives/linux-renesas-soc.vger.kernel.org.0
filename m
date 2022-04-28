Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B24AE513668
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 16:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345498AbiD1OMj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 10:12:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbiD1OMj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 10:12:39 -0400
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98E0653724;
        Thu, 28 Apr 2022 07:09:24 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id i2so3632537qke.12;
        Thu, 28 Apr 2022 07:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2BSz5kgB090oebhz8CwKmhlxKNAlNHv3NnxN5wevvYk=;
        b=nC8/4IE0X5xsWZNFTRAMpuWFm5FYc3LD317xPxTgXg2ni5C5VemAuPQN8V1M5kV3cK
         u8CMnd5dbeIDCn8CmuU5m7MWcaJky1XzbuW9ghgk8p0gD3oeUML4mfCFcFahANeibrn6
         TANBATV7pJzrhar2V/Tuo38P9yBSVA+5ul69N0wPB+cFGoz1PFrZcm6Rrly2X+HnAGf8
         3E8CRQ5dgFOHHK1pKcxIjq8mNAXaA7tXrEHtfVn5c41H/soMeZe2HxI5CNqXHKHpncct
         F49ggPbnxSIMLnDT5JZhdRcUZSb81Cxdz4ssMIK8rGw6Q+kczE2HOsPVIvjRLNRs2o9y
         AQ3w==
X-Gm-Message-State: AOAM532k79M18nTM2BrCDhI36VehZ7W83AzFcpToTksv3bw4teUp+6WL
        Wkbf5U9jFh0k+VBD98Q0RW0BavUQAXRej3gN
X-Google-Smtp-Source: ABdhPJxbyeq5tJ7VHOUBeeDt1MGajGk9KPLHvlHZoyWPqCbdiv4RVMVoy1GNaWXCXzeaJ7YcpmP7eg==
X-Received: by 2002:a37:9243:0:b0:699:9012:df43 with SMTP id u64-20020a379243000000b006999012df43mr19555193qkd.424.1651154963331;
        Thu, 28 Apr 2022 07:09:23 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id g4-20020ac87d04000000b002e06b4674a1sm53751qtb.61.2022.04.28.07.09.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 07:09:23 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id g28so9204026ybj.10;
        Thu, 28 Apr 2022 07:09:22 -0700 (PDT)
X-Received: by 2002:a25:3492:0:b0:645:6f78:b3b4 with SMTP id
 b140-20020a253492000000b006456f78b3b4mr32343565yba.546.1651154962076; Thu, 28
 Apr 2022 07:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220425170530.200921-1-biju.das.jz@bp.renesas.com> <20220425170530.200921-12-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220425170530.200921-12-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Apr 2022 16:09:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU6KPKq5C-X1+A9-vTnDiQVUA7KWN=ZZpYd3p1V3DKFrQ@mail.gmail.com>
Message-ID: <CAMuHMdU6KPKq5C-X1+A9-vTnDiQVUA7KWN=ZZpYd3p1V3DKFrQ@mail.gmail.com>
Subject: Re: [PATCH 11/13] arm64: dts: renesas: rzg2ul-smarc: Enable CANFD
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 25, 2022 at 7:06 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable CANFD on RZ/G2UL SMARC platform.
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
