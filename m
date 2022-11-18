Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA8AA62F9CC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Nov 2022 16:58:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240540AbiKRP6k (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Nov 2022 10:58:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241234AbiKRP6j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2022 10:58:39 -0500
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74310EBF
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 07:58:38 -0800 (PST)
Received: by mail-qt1-f177.google.com with SMTP id cg5so3350007qtb.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 07:58:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MCnJTbGP3Cwak/NkCOa9JAy4/itCAw2qSp02rUPfm94=;
        b=eWPMFYya7vjpCAlqaBFsvFHo40rskwTyBHYKWnMl0M9RsKWuAz7cbyZUQx0V6Z1/NH
         uODn+TXpBe+VUUUj82RUDRLbKmPOjXsbjoQetIPa5/qFp7hvAIp7vTBBDfJrS3gYB8Pk
         zyVzHWrHaDxObSgm8FAugg8PXsweZok+/yA1mydgEjvoe5/UvcFMAS2ZITHEEVc6E4ft
         T3fjLOQccAK5Do5OmGvQz7UZy9ijzDIcKq2Z+E0TIkymxtjSOiT+LolaFclPOswP8+5K
         mxyQWlm/wXSDw9usYoS76UnY4uS0NNkgKoPR1nvx2rciKTS2JkPawPhWsrdStj2NXe/L
         x6BA==
X-Gm-Message-State: ANoB5pl0xP68aUYznZTL4uKd7RjPBmxhGmMMZNUMQYRj4t9WLg3KuVJP
        uG9QXvZM282MBCvI0i/e0p3DQxda2MudWQ==
X-Google-Smtp-Source: AA0mqf6SVgQ4FB7V9aucyUp54Hy3kuv9lUQXmxJYF8J9Q5XxkaP5/0FnPLX/Osd2n2Jevx38C9OWJw==
X-Received: by 2002:ac8:4b47:0:b0:3a5:6373:f83a with SMTP id e7-20020ac84b47000000b003a56373f83amr7162473qts.506.1668787117512;
        Fri, 18 Nov 2022 07:58:37 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id 2-20020ac85642000000b003a5612c3f28sm2197754qtt.56.2022.11.18.07.58.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 07:58:37 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id b131so6101926yba.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 07:58:36 -0800 (PST)
X-Received: by 2002:a25:2d4e:0:b0:6dc:dc81:aaf4 with SMTP id
 s14-20020a252d4e000000b006dcdc81aaf4mr6452841ybe.365.1668787116555; Fri, 18
 Nov 2022 07:58:36 -0800 (PST)
MIME-Version: 1.0
References: <20221118120953.1186392-1-yoshihiro.shimoda.uh@renesas.com> <20221118120953.1186392-3-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20221118120953.1186392-3-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Nov 2022 16:58:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVVTtU1fCjGtSwX=2p2Y5gj5m_N+XSp=oqUV=u8uQtwfg@mail.gmail.com>
Message-ID: <CAMuHMdVVTtU1fCjGtSwX=2p2Y5gj5m_N+XSp=oqUV=u8uQtwfg@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] arm64: dts: renesas: r8a779f0: spider: Enable
 Ethernet Switch and SERDES
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Nov 18, 2022 at 1:10 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Enable Ethernet Switch and SERDES for R-Car S4-8 (r8a779f0).
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.2 with the other patches in
this series.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
