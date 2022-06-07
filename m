Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C304653F79D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jun 2022 09:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237930AbiFGHtF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Jun 2022 03:49:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237932AbiFGHtE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 03:49:04 -0400
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B9AE6A438
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jun 2022 00:49:00 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id x7so12073103qta.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jun 2022 00:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WwkZjTKT24/QvKamHPhDckgQxV2ZnCcEeVpRT8SNhtA=;
        b=1F+9HiTB4ldQGkR6v8e840C+5vCXr1anL1MqiQkf0SSvjLyFlsR/v23f9YJhLxZKvn
         VcE11P2sHKlWpHsyc5wIawZBUwPeD2TetNiLL9OZXpX0ZfTNqG0Thu2vETYuKrKznJnU
         OO/Uj+nzjU6FJ0RUAzqngOIxQl7PkqYiNQMNKgbPkEGBNa1MVfQf5U3oC75ennYpjRvg
         MFnh+w4A2KPSE+rQaYVlb7AcXiHJZWjJi1PgUwsTGrx430Sk3M3oYEglWO5GsN3iOFBl
         i1+xNG6vEi976YTdMNbPhKgk9azgmu17sExIAwXuAAV7oyo1JmZhFLO1iH5oD1arkaOe
         VPrg==
X-Gm-Message-State: AOAM530+Xg2XropLLHdZF6nEOINmMn8U7vQ7D2cW9u83oXM5Ymw9g2GW
        gMHr6RN3M7uhxKt/GRExXgNBz5YEm/i1wg==
X-Google-Smtp-Source: ABdhPJypDnBNfwOnlk/0r9OQRuJGw7/WGxBcCfuTxAnjJSXdxnaZRGRHJ8UQKmgTQZYh0j2Qq8VLKA==
X-Received: by 2002:a05:622a:1a28:b0:304:ec1d:e8c3 with SMTP id f40-20020a05622a1a2800b00304ec1de8c3mr7398118qtb.175.1654588139330;
        Tue, 07 Jun 2022 00:48:59 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id z5-20020a05622a124500b00304efba3d84sm2770862qtx.25.2022.06.07.00.48.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 00:48:59 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-30fdbe7467cso131189557b3.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jun 2022 00:48:58 -0700 (PDT)
X-Received: by 2002:a81:f41:0:b0:313:4d6c:49db with SMTP id
 62-20020a810f41000000b003134d6c49dbmr265198ywp.384.1654588138597; Tue, 07 Jun
 2022 00:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220530024626.1870277-1-yoshihiro.shimoda.uh@renesas.com> <20220530024626.1870277-3-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220530024626.1870277-3-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Jun 2022 09:48:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUYsXiNE5-h0wgEfJxexEQ4Hdr6m5RbwMteRHPhv+ni0A@mail.gmail.com>
Message-ID: <CAMuHMdUYsXiNE5-h0wgEfJxexEQ4Hdr6m5RbwMteRHPhv+ni0A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: r8a779f0: Add iommus in dmac nodes
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

On Mon, May 30, 2022 at 4:46 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add iommus propaties in the dmac nodes for r8a779f0.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

My
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
on v1 is still valid, so will queue in renesas-devel for v5.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
