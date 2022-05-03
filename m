Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F222517EDC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 May 2022 09:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231777AbiECH2Q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 May 2022 03:28:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231779AbiECH2P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 May 2022 03:28:15 -0400
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2850C25FF;
        Tue,  3 May 2022 00:24:44 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id o18so12780762qtk.7;
        Tue, 03 May 2022 00:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RQYOprqPZiG5gHI59nVhQvUNNhejNv4Flqvp6b5JG/0=;
        b=tyIsYpDJSdK6CD8ms0Y5wvwPcVa9E/g23UmjCmwmvv3Gbzr6hixWkjTuLS7PHzemFZ
         HDe1EAaUkbc/FCKglGNGl1DfxiLf/h3X+Sp8zp4cncsdovuur2T8BeDMgFI8mfAjs2qN
         MibvKoTWjROI6GRmqwNmhfxCgJd8SERhdhyW43SxnIfjHMR3B+hw3dwiX0AfkVPKxdE9
         tauqj6OeW07qA3JqGgFydhlHuHorCa0ToBGixBqJWI0OAVp9nxdzhG0cRMxqcRf1HDig
         BB4Woe/++e+uaifEYBgQBPFnu5Jsbp9Gtmis4CXe7be175X4tGLVcfKmPhEEPNPryxQm
         GDKA==
X-Gm-Message-State: AOAM532T8I2MzqRpyVY89HnxklR01oKEYjDi1TZ7y9FtbExp/eS7Aep9
        HmelboATrnDbdtKGdKsTvUN2uh7Bpd6/Qw==
X-Google-Smtp-Source: ABdhPJy7Ua+8zbQlQXlWgx+4Gwp0wVlEPmbOTEk47WUrbnZqs78allE89ddaVATDj5DylSsKQJ7TTA==
X-Received: by 2002:a05:622a:1a21:b0:2f1:f29e:40a with SMTP id f33-20020a05622a1a2100b002f1f29e040amr13329667qtb.235.1651562683186;
        Tue, 03 May 2022 00:24:43 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id c5-20020ac86605000000b002f39b99f6a0sm5440327qtp.58.2022.05.03.00.24.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 00:24:42 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-2f7d621d1caso170530497b3.11;
        Tue, 03 May 2022 00:24:42 -0700 (PDT)
X-Received: by 2002:a05:690c:84:b0:2f1:9caa:e4f7 with SMTP id
 be4-20020a05690c008400b002f19caae4f7mr15024691ywb.384.1651562682071; Tue, 03
 May 2022 00:24:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220502190155.84496-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220502190155.84496-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 3 May 2022 09:24:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV1WWFh1ckh-aEKqcRsGjQCQ=EsjomjLtQVWMOcwG=ZUg@mail.gmail.com>
Message-ID: <CAMuHMdV1WWFh1ckh-aEKqcRsGjQCQ=EsjomjLtQVWMOcwG=ZUg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r9a07g043: Add SPI Multi I/O Bus
 controller node
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, May 2, 2022 at 9:02 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add SPI Multi I/O Bus controller node to R9A07G043 (RZ/G2UL) SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> V1->v2:
>  * Removed interrupts property as interrupt is not supported on RZ/G2UL.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
