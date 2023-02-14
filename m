Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EBEF6967CE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Feb 2023 16:18:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233310AbjBNPSX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Feb 2023 10:18:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbjBNPSW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Feb 2023 10:18:22 -0500
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A85FF196A0;
        Tue, 14 Feb 2023 07:18:21 -0800 (PST)
Received: by mail-qv1-f54.google.com with SMTP id o42so8202807qvo.13;
        Tue, 14 Feb 2023 07:18:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zY95o9hR+FHt7VaLDalawdnwRg09yLL2kCdEHErgR9Q=;
        b=TQa6sQrn6RxJNn8K6XMR8j41anH/A8NYIy8s9yObS7XU4DuWE9+nzR5XeD722yCxAB
         mU2q3zuDYsPvvMaOQkPRUeWhcIwNib9fXW5G0lz4DsJagXvFxV1Zd/l2MhOEmBJ1qk13
         yBKN84NO1RPvgDCpbd2aDjt+OLbOcIjyxS4qO0n3jmQOZfpwz3uDSNfOzjw8xl9EbeVH
         QJgG8UnnkBjTrYV1xl2nqB/tUO07ZR7HhJDU1MKFx8wmpVclm+gs4vSDTqbOXJ+Xp7hl
         O6JfPYeqINVhVqBg/nnSt4pcpq5XPrxd7ks4vkGLVIOCQeSBz7TcQg9tbDHkWntRPQV8
         ktVw==
X-Gm-Message-State: AO0yUKX6ewF3ef6jCN4r6Yv1eeQCuM70Txs2lIA7DKKCpwBUXSXjOaPJ
        4K1RYBu6Qjx9rLE3EU99fNNyI1RQLgdE7KjO
X-Google-Smtp-Source: AK7set9gC2I2vqSQA+CSBPaDsy6dOsRwbqMwINuJ3CenoAKr5UhzledFpGoFiIIpMlGaSvLDBUfb+w==
X-Received: by 2002:a05:6214:2466:b0:56e:a6f1:8cf with SMTP id im6-20020a056214246600b0056ea6f108cfmr6159973qvb.6.1676387900250;
        Tue, 14 Feb 2023 07:18:20 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 191-20020a370bc8000000b0071a291f0a4asm12015238qkl.27.2023.02.14.07.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 07:18:19 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-52ec329dc01so191357517b3.10;
        Tue, 14 Feb 2023 07:18:19 -0800 (PST)
X-Received: by 2002:a0d:e841:0:b0:52e:ec16:6f19 with SMTP id
 r62-20020a0de841000000b0052eec166f19mr349281ywe.33.1676387899322; Tue, 14 Feb
 2023 07:18:19 -0800 (PST)
MIME-Version: 1.0
References: <20230121145853.4792-1-biju.das.jz@bp.renesas.com> <20230121145853.4792-12-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230121145853.4792-12-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 14 Feb 2023 16:18:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWU313k9114c123ZmzY+HFmMO+TgUgYVkbuS3EP3hTKwA@mail.gmail.com>
Message-ID: <CAMuHMdWU313k9114c123ZmzY+HFmMO+TgUgYVkbuS3EP3hTKwA@mail.gmail.com>
Subject: Re: [PATCH v3 11/12] arm64: dts: renesas: rzv2mevk2: Enable USB3 DRD,
 Peripheral and Host
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
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

On Sat, Jan 21, 2023 at 3:59 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable USB3 Host, Peripheral and DRD modules on RZ/V2M EVK.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * No change.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.4.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
