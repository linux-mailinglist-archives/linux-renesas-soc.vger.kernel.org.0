Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD3D6B40A0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Mar 2023 14:39:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbjCJNj4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Mar 2023 08:39:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230274AbjCJNjy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Mar 2023 08:39:54 -0500
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49F9584809
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Mar 2023 05:39:51 -0800 (PST)
Received: by mail-qv1-f45.google.com with SMTP id g9so3581284qvt.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Mar 2023 05:39:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678455590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lH9G3FZCdw8CBlhJ5gStJjoGgKYZe8e/V6+MwMZJz7s=;
        b=5oN8BBJePrHOTo8GyocFpHQbDYdM5oUSEGSONKbYzDnDIQwHFkqEWURu2Eq3vZUbTS
         XMhiIa7nJh216JG2CWalMXj7IqW1+vykV17WvnapvQPfue98Ov1JHQFF2p+baimOOmSt
         3JGi0YXo36rA/4aX1LW9wVUeau25jb4gfdVxZkZxyJJFITPm0tJdBUC5BHVg4XJLntGG
         EeucRHUfaE1pc1duZnStInMHepoSU7yjgKV6YlZHgLKHI7ATYK0u0268sch7dlQT6te9
         6cX3mM9FM9jLN6IvFOYpQnSZLCSyr1uE6JODsX1UsmuZ16aZXcZjfkRbONTtLcEGpnKt
         gFQg==
X-Gm-Message-State: AO0yUKVhTGeJTqlspel+RWzEOzWi04NC2fcS62kGQcrU6AQkr7WWJHdb
        b3xzlwhqMZZU57UJ3SzfuIlvOhof0t/PmA==
X-Google-Smtp-Source: AK7set/hWOGKkcGoNeExnpt0NL4DTCtx15gPAWX/QzGtXnPtDtxTcsvFuKW6OV+hner9czguY08Iyg==
X-Received: by 2002:a05:6214:20c4:b0:56e:a4c5:9da5 with SMTP id 4-20020a05621420c400b0056ea4c59da5mr51400747qve.6.1678455590254;
        Fri, 10 Mar 2023 05:39:50 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 26-20020a05620a041a00b00742562938cfsm1299111qkp.107.2023.03.10.05.39.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 05:39:50 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-536bbef1c5eso97789757b3.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Mar 2023 05:39:49 -0800 (PST)
X-Received: by 2002:a81:ad14:0:b0:538:112b:67a0 with SMTP id
 l20-20020a81ad14000000b00538112b67a0mr16735195ywh.5.1678455589683; Fri, 10
 Mar 2023 05:39:49 -0800 (PST)
MIME-Version: 1.0
References: <87r0u1l9vc.wl-kuninori.morimoto.gx@renesas.com> <87lek9l9st.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87lek9l9st.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 10 Mar 2023 14:39:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU3F60ZYa4nxXB3a86C6CcZD2bFQUqyZhxrBG6mSi=74w@mail.gmail.com>
Message-ID: <CAMuHMdU3F60ZYa4nxXB3a86C6CcZD2bFQUqyZhxrBG6mSi=74w@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: renesas_defconfig: Enable DA7213/COMMON_CLK_PWM
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

On Tue, Mar 7, 2023 at 12:49 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> This patch enables DA7213 Codec and COMMON_CLK_PWM to
> enable ARD-AUDIO-DA7212 support on R-Car V4H White Hawk
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will apply to my topic/renesas-defconfig branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
