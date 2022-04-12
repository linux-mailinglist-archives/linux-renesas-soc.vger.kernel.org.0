Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 550E74FDEB0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Apr 2022 13:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344654AbiDLL6m (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Apr 2022 07:58:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351860AbiDLL6U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Apr 2022 07:58:20 -0400
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72F2563386;
        Tue, 12 Apr 2022 03:48:09 -0700 (PDT)
Received: by mail-qv1-f48.google.com with SMTP id n11so4983266qvl.0;
        Tue, 12 Apr 2022 03:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cmMr1t3KO1cqq+NQ7Llb8RhrxPtjgdQXmjqSwz4aJlY=;
        b=geTDtp9VWmjd3+A9a5/9fIE4pUcl2lcvKDPdmr64fw02cciwlmmd3PDkOS1zPs1C3Q
         kA1GYg14tv87TwaBqZ1SDYvpCACsK2mJEhiNsmoavfTCgcxmNReoetmdoeXVDbFwVt+R
         uvcYGysPMdL7/o4/3CUSoc8HCADam4rQ20HRr4cOCvSb7z80tVVKj7mRrZpm+qVm/a6y
         jFSyABZEYx1sq6afueeTr6ghgNiwOsxasYUR6+B111JKG1koRyE0INp2UBcr4hBA27S9
         E4oj5l4XzmIVmuzJ5BWaVJgNYb/G4CGcPR6gwuwXjD93jH9whX7+KEeqlzlH1zhb9Qgd
         QvsQ==
X-Gm-Message-State: AOAM5305tmrHEMWeu+3vpAgCIuqfVqt238egyX8IVr5S6y1ug+FtRMq0
        BhD56lLMsASMGRf0s9bgg3upINTNVsdNqA==
X-Google-Smtp-Source: ABdhPJy37H2eiD3NrvWDyYM8sBi5Uyao5KKmJWcEkTp01dRMFzdtfIMBVBQRSzlXDpmiUAVtJvjF9g==
X-Received: by 2002:a05:6214:5289:b0:443:a062:1b4 with SMTP id kj9-20020a056214528900b00443a06201b4mr3116940qvb.24.1649760488473;
        Tue, 12 Apr 2022 03:48:08 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id d11-20020a37680b000000b0069ab73d9981sm8599697qkc.38.2022.04.12.03.48.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 03:48:08 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-2ebf4b91212so98022197b3.8;
        Tue, 12 Apr 2022 03:48:08 -0700 (PDT)
X-Received: by 2002:a81:4782:0:b0:2eb:1cb1:5441 with SMTP id
 u124-20020a814782000000b002eb1cb15441mr28595696ywa.479.1649760487910; Tue, 12
 Apr 2022 03:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220402081328.26292-1-biju.das.jz@bp.renesas.com> <20220402081328.26292-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220402081328.26292-6-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Apr 2022 12:47:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXru-w+OFFnzq-kdW5JMb3mSf9Cm+3bzAF-sXtggQzQcQ@mail.gmail.com>
Message-ID: <CAMuHMdXru-w+OFFnzq-kdW5JMb3mSf9Cm+3bzAF-sXtggQzQcQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] arm64: dts: renesas: rzg2ul-smarc: Enable microSD
 on SMARC platform
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

On Sat, Apr 2, 2022 at 10:13 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable the microSD card slot connected to SDHI1 on the RZ/G2UL SMARC
> platform by removing the sdhi1 override which disabled it, and by adding
> the necessary pinmux required for SDHI1.
>
> This patch also adds gpios property to vccq_sdhi1 regulator.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
>  * Updated gpios property for vccq_sdhi1 regulator and removed
>    sdhi1 node as it is enabled in common.
>  * Updated commit description

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
