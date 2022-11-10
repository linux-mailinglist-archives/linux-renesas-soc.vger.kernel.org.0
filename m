Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A75262445A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Nov 2022 15:33:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbiKJOdV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Nov 2022 09:33:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiKJOdU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Nov 2022 09:33:20 -0500
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 530CD54B18
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Nov 2022 06:33:19 -0800 (PST)
Received: by mail-qk1-f177.google.com with SMTP id k4so1149338qkj.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Nov 2022 06:33:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ZD1XIiSOnzqwLvedal49IcBOHAtFvP8svKlIj70YGc=;
        b=l10eShXibJpwaWS1Qv9ho1ORNSE3zooHoPiSzsAiIjxfvDPWHBBfjzEyLehO+jR88B
         EULpbOGnRSFqufvzv2djIangTuglOPnM0vOKsOPGV2de6e6HNAbQN3AVegjZ6DcywthG
         vimdh7BAUYS3TZ/VnW9pWHssqboJdfmRMZKYcz5iOzCe6jRbRFI7A2tGJJwb0gqKuWij
         QwjB9udcgM/2oemtA3eG2UN55NzNONIbt0tWuo1HKvlVntnJM/cJxiSXG5dSLuA9HY48
         dMAUwPive/00X8hVf9GmLSqT44E4Nd4iZEmf8Hdt16sOqqH37A/G8zrWIuoWkg8YYJO9
         LKAQ==
X-Gm-Message-State: ACrzQf1nWJ40MKGfIJdgcZHxb1tu0/uRkBt30H2fduc9f457HnVI65Cs
        aEdn6PpIweS8vd6gs2bF6mJi0afRIdGZWw==
X-Google-Smtp-Source: AMsMyM44HA/QrQ2dI/RA/stTz1+q2nOWM2G6dl5lM+TV19IIMmo4f3fUN+dl9b8KGGVidNdvfEX7eA==
X-Received: by 2002:a37:9a95:0:b0:6fa:da8:ac7b with SMTP id c143-20020a379a95000000b006fa0da8ac7bmr46637834qke.448.1668090798114;
        Thu, 10 Nov 2022 06:33:18 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id az8-20020a05620a170800b006bb87c4833asm12848786qkb.109.2022.11.10.06.33.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 06:33:17 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id 63so2511978ybq.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Nov 2022 06:33:17 -0800 (PST)
X-Received: by 2002:a25:6b07:0:b0:6cd:3a43:bfe5 with SMTP id
 g7-20020a256b07000000b006cd3a43bfe5mr51727324ybc.89.1668090797360; Thu, 10
 Nov 2022 06:33:17 -0800 (PST)
MIME-Version: 1.0
References: <20221110131630.3814538-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20221110131630.3814538-1-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Nov 2022 15:33:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWA-bO9wu4Opp2t=KGdBBgutwd45Q1UAErV7kefkQuSGw@mail.gmail.com>
Message-ID: <CAMuHMdWA-bO9wu4Opp2t=KGdBBgutwd45Q1UAErV7kefkQuSGw@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] arm64: dts: renesas: r8a779f0: Add/Enable Ethernet
 Switch and SERDES nodes
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
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

Hi Shimoda-san,

On Thu, Nov 10, 2022 at 2:16 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add/enable Ethernet Switch and SERDES for R-Car S4-8 (r8a779f0).

Thanks for the update!

> Notes that we need to modify Marvell 10G PHY driver for Spider board. I have
> local patches to use the Marvell 10G driver on the Spider board. But, it needs
> to update for upstraming.
>
> JFYI, if we don't modify the Marvell 10G PHY driver, the ethernet device cannot
> work correctly with the following error messages:
>
> [    2.137800] phy phy-e6444000.phy.0: phy init failed --> -110
> [    2.148809] renesas_eth_sw: probe of e6880000.ethernet failed with error -110

Yes, I had noticed that failure ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
