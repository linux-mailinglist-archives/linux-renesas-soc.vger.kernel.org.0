Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 987104FDB74
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Apr 2022 12:57:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354593AbiDLKD7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Apr 2022 06:03:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1391578AbiDLJaZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Apr 2022 05:30:25 -0400
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B7A55C856;
        Tue, 12 Apr 2022 01:43:51 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id ke15so15605949qvb.11;
        Tue, 12 Apr 2022 01:43:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SMgJTejebzSsoCA0bmYeszZ3G1uAWNOffFqDWqFqdBk=;
        b=Uo8uFuFYUk/Wpd4clANKUu85Npy6Zi3JXKfGsXRE2r39/cV+JDaACkAoITqXpZNB+L
         M3jn4KuV9OUUeTxhxdmXQgEVyuL0d7OPk3+nwWx8TQ1xDUrvUzJmCizJSeAr9BQc2Ro1
         4MedUE5LGnDCXK6sskmQJp6Ok7iR1epyhNeTKWztCuqHMozR1AYIPUDRmQ+FAiszT69n
         YJy0y+OXp6fWh3mlKbucu9IDNWct5R9fTr/0XTw+DkQAY2HSehE26fgY4QTYZ3SMGhW5
         dkDvuNvy9IGET9tNqMFhi0NQo7DEqYWdy/DpHup5nui2EeftfMyMNNB32lQQhSSmn98k
         VMCA==
X-Gm-Message-State: AOAM532qvZZL8eGeeFolYGLkxug8iIPntsaFQ7LOT+6wOtWfhlSNZ4Jw
        OA3buYfPFBbnsQupqkdoPrYzse2BKCuw0Tn9
X-Google-Smtp-Source: ABdhPJwBYN4U7vve6hoCYi85lACXgLhRbRxvfmm82QH2fafnTD2aH7kjmqN7mEz2SPEq/NGs3SAz9Q==
X-Received: by 2002:a05:6214:e4c:b0:444:4ce3:890a with SMTP id o12-20020a0562140e4c00b004444ce3890amr2699457qvc.72.1649753030186;
        Tue, 12 Apr 2022 01:43:50 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id h27-20020ac8777b000000b002eff87a2c42sm1645348qtu.4.2022.04.12.01.43.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 01:43:49 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-2ebf4b91212so94998927b3.8;
        Tue, 12 Apr 2022 01:43:49 -0700 (PDT)
X-Received: by 2002:a81:c703:0:b0:2d0:cc6b:3092 with SMTP id
 m3-20020a81c703000000b002d0cc6b3092mr29042137ywi.449.1649753029692; Tue, 12
 Apr 2022 01:43:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220322095512.4707-1-wsa+renesas@sang-engineering.com> <20220322095512.4707-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220322095512.4707-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Apr 2022 10:43:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXdj1RvH3SOvqh+Lu89ze=KNNVsvYt2wmGty-d8Z+VAjA@mail.gmail.com>
Message-ID: <CAMuHMdXdj1RvH3SOvqh+Lu89ze=KNNVsvYt2wmGty-d8Z+VAjA@mail.gmail.com>
Subject: Re: [PATCH 1/5] ARM: dts: rcar-gen2: add interrupt property to the
 watchdog node
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
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

On Tue, Mar 22, 2022 at 11:22 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Driver doesn't use it yet, but let's describe the HW properly.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
