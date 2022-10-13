Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5C215FD54B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Oct 2022 08:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbiJMG4i (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Oct 2022 02:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbiJMG4e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Oct 2022 02:56:34 -0400
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A3261162D5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Oct 2022 23:56:33 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id c23so481472qtw.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Oct 2022 23:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lf/1uO1R6pqNrUpFQ/pk4OR8tctH9f0cwIBfB3aGdO0=;
        b=4P7DgxohU4emYUfp/EbGYTBd2l7CCeRNhKr24uGsFx9SwNdHQu2ocx/XnMetnrtV6O
         4FjzjqoZuv2/OsoUlry8DoafKyEv/dFoFswG2iexPZFpsQNn4TF/5zrqyvg8PUNAQ39O
         cn2RV5y30Xuv6FZGhbgTiOrj3OZQN1STKZ/NMjc/IVjheSmLD0GbQhAgXZAv2wB87pBe
         kC9zjz5ixZlPiMEAQDHQSiYtcHEJKRJ0PAZBcQE4OwSX66aCUQ1m8eYIN9xhMyCET4Ue
         P84CSmgCYmlebKBa0/Ix9Aq0lypFFa43CQ8MOTdNWvU4s4s9aDJdBgp3aZES5hDnLW6c
         DXkg==
X-Gm-Message-State: ACrzQf0VQcCzFHIONaqIv+SLurRpSjKET0VffExkqkmBxC48SzXnt6O+
        m0Y1Sk4Xt4RyE9sxS4ZJlOcAxq0w3qJIJg==
X-Google-Smtp-Source: AMsMyM5h+PRVtKj8EWSzdk0Jd5LhRjZWFWRUendFlHSQ07r/3fdXODyUFz0GGSyECdeT1qZS7aWzAA==
X-Received: by 2002:a05:622a:450:b0:394:6aeb:832f with SMTP id o16-20020a05622a045000b003946aeb832fmr27019356qtx.398.1665644192441;
        Wed, 12 Oct 2022 23:56:32 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id do31-20020a05620a2b1f00b006ea5a9984d1sm15541171qkb.94.2022.10.12.23.56.31
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 23:56:31 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-3560e81aa1dso9465197b3.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Oct 2022 23:56:31 -0700 (PDT)
X-Received: by 2002:a81:848c:0:b0:356:e173:2c7a with SMTP id
 u134-20020a81848c000000b00356e1732c7amr29175104ywf.502.1665644190862; Wed, 12
 Oct 2022 23:56:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1665583435.git.geert+renesas@glider.be> <Y0cSlcx79NPbwM3x@shikoro>
In-Reply-To: <Y0cSlcx79NPbwM3x@shikoro>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 13 Oct 2022 08:56:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWC3ki_RiOgKvxZ53mVzzw9dK=Y=boo8c1e2OmA8NsH7g@mail.gmail.com>
Message-ID: <CAMuHMdWC3ki_RiOgKvxZ53mVzzw9dK=Y=boo8c1e2OmA8NsH7g@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: renesas: r8a779g0/white-hawk: Add RPC and
 QSPI FLASH support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Wed, Oct 12, 2022 at 9:16 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > This patch series adds SPI Multi I/O Bus Controller (RPC-IF) support for
> > the R-Car V4H SoC, and QSPI FLASH support for the White Hawk board.
>
> Did you need to alter the firmware to access it, or did it work out of
> the box?

It worked out of the box.
Note that the initial firmware that was on the board was newer, but
that was lost by installing a firmware stack that did include U-Boot.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
