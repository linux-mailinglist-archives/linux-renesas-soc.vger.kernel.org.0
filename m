Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55F777AD1E6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Sep 2023 09:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231666AbjIYHkf convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Sep 2023 03:40:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232251AbjIYHke (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Sep 2023 03:40:34 -0400
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36F0BD3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Sep 2023 00:40:28 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-59f4bc88f9fso41173417b3.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Sep 2023 00:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695627627; x=1696232427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMuGQHUUNiSikNxGn4O9hRRxJFnH7Taw0NZCj7fUOBc=;
        b=bHYPm15ao24aDZnvtS+gPyecERFhZIFHoGY7GT4v018IwR4jdVZTx9ATBAR/2cTay6
         Qn4q26gtzSg64MrkJQqN7i7lkj0O9+RM7fZmfuxE2RQRBy174pmPELh1/J461QoBDyCa
         t+3nd3enSVTtCReemgJnqJMPkShQjhoP4mn/OOCM6v237bc4RyQoyDrFrNn6/ymn5bim
         3MLoYGzrhboVTmsAs0RsEf0bAtTlvTSehgNrVt3rkGwHOCV6HQRin/pRiGlJXZg7So0e
         d4fmXZhrS8MhtgMudz+/K5G9AB6jCUsLWpsXtOW39njFUPZITEmwZZZ0B2BMvPx79gI6
         ZzCw==
X-Gm-Message-State: AOJu0Ywqpnix6QsbvRKny7L/EkhdcqCIo2In7XmCHFBfgQ76TEqX6us5
        naoReXMQ3NmIVFn0Wd/kJug4iRiSTeZh5Q==
X-Google-Smtp-Source: AGHT+IGFD16/aXm6hhHGK41JWN3emGc6z6OAj13dXnq/TeRkKccvNV+NJraTyuOqCa1Ifc1e1XMHQQ==
X-Received: by 2002:a25:ec0c:0:b0:d7e:add7:4de5 with SMTP id j12-20020a25ec0c000000b00d7eadd74de5mr4977303ybh.1.1695627627198;
        Mon, 25 Sep 2023 00:40:27 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 204-20020a2501d5000000b00d816fa23bd4sm2093698ybb.26.2023.09.25.00.40.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 00:40:26 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-59f7f46b326so13087777b3.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Sep 2023 00:40:26 -0700 (PDT)
X-Received: by 2002:a81:b1c1:0:b0:59f:4ee0:26e8 with SMTP id
 p184-20020a81b1c1000000b0059f4ee026e8mr4745752ywh.21.1695627626776; Mon, 25
 Sep 2023 00:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693481518.git.geert+renesas@glider.be>
In-Reply-To: <cover.1693481518.git.geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 Sep 2023 09:40:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUrswehsNECqo9T_r7y7naAOhxA6SPxR-1Nc8RzJwy4Cg@mail.gmail.com>
Message-ID: <CAMuHMdUrswehsNECqo9T_r7y7naAOhxA6SPxR-1Nc8RzJwy4Cg@mail.gmail.com>
Subject: Re: [PATCH 00/13] ARM: dts: renesas: LBSC and FLASH improvements
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Aug 31, 2023 at 1:52 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> This patch series adds support for various FLASH devices on the Blanche,
> Genmai, Marzen, and RSK+RZA1 development boards.  As several of these
> FLASH devices reside in the external address space of a (Local) Bus
> State Controller, the current (too) minimal support for (L)BSC is
> improved first.  All of this is preceded by two small fixes.
>
> As FLASH on Blanche and Marzen conflicts with SMP, the last two patches
> depend on [1], so I marked them RFC.
>
> This has been tested on the APE6-EVM, Blanche, Genmai, Marzen, and
> RSK+RZA1 development boards.
>
> Thanks for your comments!
>
> [1] "[PATCH/RFC 0/4] ARM: shmobile: Reserve boot area when SMP is
>      enabled"
>     https://lore.kernel.org/all/cover.1693409184.git.geert+renesas@glider.be
>
> Geert Uytterhoeven (13):
>   ARM: dts: renesas: ape6evm: Drop bogus "mtd-rom" compatible value
>   ARM: dts: renesas: gr-peach: Remove unneeded probe-type property
>   ARM: dts: renesas: Remove unused LBSC nodes from board DTS
>   ARM: dts: renesas: r7s72100: Add BSC node
>   ARM: dts: renesas: r8a7779: Add LBSC node
>   ARM: dts: renesas: r8a7792: Add LBSC node
>   ARM: dts: renesas: marzen: Move Ethernet node to LBSC
>   ARM: dts: renesas: blanche: Move Ethernet node to LBSC
>   ARM: dts: renesas: wheat: Move Ethernet node to LBSC
>   ARM: dts: renesas: genmai: Add FLASH nodes
>   ARM: dts: renesas: rskrza1: Add FLASH nodes

Thanks, queuing 1-11 in renesas-devel for v6.7.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
