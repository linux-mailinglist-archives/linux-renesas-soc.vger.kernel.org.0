Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF895173DE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 May 2022 18:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242185AbiEBQO3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 May 2022 12:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386305AbiEBQOC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 May 2022 12:14:02 -0400
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC06A60F9;
        Mon,  2 May 2022 09:10:32 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id z126so11712957qkb.2;
        Mon, 02 May 2022 09:10:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wBmg3CyvSKwI958YNQCGcgh1Hij/CJA22lQwb8ggsrE=;
        b=Y69DGDtEn5VQSMtAWxOqXWeK7DQbZYu8ii24OpgX93FX91akSfM4vyYxBd6Rc/IK+P
         K39Ulz8KF8isupCJZa/6g9HhGCbslp+Y5rxWg/k420fSD05GIYGeklXprMYL8hUVnD80
         hIS994QcQeHbP6XuQ7eJDrEZzYTITosoPUSh0pAWjd6gzVMwYrX8Up8AHwokBMUqaGfX
         Z1g41ib6mUR/78+hGz5ezfAPcb2fQ5P3uYn+3TL/CO73qeQxL7rQCfPrwZeKUu7ytQfE
         qy/y8LdxjZYFuRW21zK0iwSkYuY/IKg+rSGH2mIKNJnphg8xzpDPpyZrvUBedprl74+J
         pr4g==
X-Gm-Message-State: AOAM532LQWOlA8j9G88mlKswRfdHtd3FgUvRiBPasLfMr0JTDPtdrxUB
        cKcQuQWRcnyeQvhrjUOc48ubfsxe4VfzUQ==
X-Google-Smtp-Source: ABdhPJxAJ4kw/RCWvFPnKhSndLf2sY3dDKOXZ80Grz2F+qr84om24bCpUt18zxKw3vBoQ549B5kmaw==
X-Received: by 2002:a05:620a:45aa:b0:69f:d228:6a71 with SMTP id bp42-20020a05620a45aa00b0069fd2286a71mr5335057qkb.590.1651507831551;
        Mon, 02 May 2022 09:10:31 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id g23-20020ac84817000000b002f39b99f693sm4303861qtq.45.2022.05.02.09.10.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 09:10:31 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id f38so26884604ybi.3;
        Mon, 02 May 2022 09:10:31 -0700 (PDT)
X-Received: by 2002:a05:6902:82:b0:649:d5a0:9edd with SMTP id
 h2-20020a056902008200b00649d5a09eddmr544832ybs.202.1651507830921; Mon, 02 May
 2022 09:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220501112926.47024-1-biju.das.jz@bp.renesas.com> <20220501112926.47024-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220501112926.47024-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 May 2022 18:10:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJtbx6yURj7ag65NqKTTy8JJbEpwgyiPAQYtcUmL6pEw@mail.gmail.com>
Message-ID: <CAMuHMdVJtbx6yURj7ag65NqKTTy8JJbEpwgyiPAQYtcUmL6pEw@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm64: dts: renesas: r9a07g043: Add TSU node
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
> Add TSU node to RZ/G2UL SoC DTSI.
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
