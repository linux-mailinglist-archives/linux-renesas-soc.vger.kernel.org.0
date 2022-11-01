Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37788614D0E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Nov 2022 15:47:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbiKAOrz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Nov 2022 10:47:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230380AbiKAOry (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Nov 2022 10:47:54 -0400
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD57C193D4
        for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Nov 2022 07:47:53 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id 8so9678938qka.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Nov 2022 07:47:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2FY8jITvcx+cMyyAHnTM+uZAERSq0piUR08CFQlD830=;
        b=PaTyFaXJQf9fO2EnDyNM2VURCUdbVWGoi1Lz5K+NXKscHeHfvlYCDwepKhI8yFiDyw
         gYOsftmoUpxpQqVVz2ErvZAg2a1o/INWX60EP+8nmQwNuYf5h2qKL9OCeU3OLijcDbmF
         CPQDLHMpnscmYH1wX5fQlyp7zHX2k+gwcS7Gun/IOl7epMhBYvacq1Lf+Z7vDaOVXqCs
         R/0L/n/sCIBF4KfXn3z7MoTVxrUxhlpQSs5Tt7g14aFdwE9lleHQYdurp0nhQU2IQhpV
         lUcxyR567ZTupqnBx8w3gPL4vIoSAPczmfleOPFbwrG0cYHoCXPCEitr1qSmGQ2zfziF
         DLug==
X-Gm-Message-State: ACrzQf1r5BgZhdNk6dgyoElgpuDk3t70NblxCxNI+HuAKaDPHKSJ5BfA
        2mvi0UsQp7lbbrMV1T1miPqsmOF41a8pKg==
X-Google-Smtp-Source: AMsMyM4FI51z5ZLcp7utZLfKrdQd2qR/a9XKizu1d7M11NCe1nGmhogGYEmYkhTi55DBYt0m7w+QtA==
X-Received: by 2002:a37:68c7:0:b0:6fa:12a9:aa55 with SMTP id d190-20020a3768c7000000b006fa12a9aa55mr13031364qkc.583.1667314072664;
        Tue, 01 Nov 2022 07:47:52 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id bj41-20020a05620a192900b006f7ee901674sm6716605qkb.2.2022.11.01.07.47.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 07:47:52 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id j130so17550664ybj.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Nov 2022 07:47:52 -0700 (PDT)
X-Received: by 2002:a25:4fc2:0:b0:6be:afb4:d392 with SMTP id
 d185-20020a254fc2000000b006beafb4d392mr16904390ybb.604.1667314072002; Tue, 01
 Nov 2022 07:47:52 -0700 (PDT)
MIME-Version: 1.0
References: <166729684941.22390.7627523146991171045.git-patchwork-summary@kernel.org>
In-Reply-To: <166729684941.22390.7627523146991171045.git-patchwork-summary@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 1 Nov 2022 15:47:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVMwy3_EmL2+smhDBDTtH=so-AHNuUP1nvPWy4JuhyRoA@mail.gmail.com>
Message-ID: <CAMuHMdVMwy3_EmL2+smhDBDTtH=so-AHNuUP1nvPWy4JuhyRoA@mail.gmail.com>
Subject: Re: Patchwork summary for: linux-renesas-soc
To:     patchwork-bot+linux-renesas-soc@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Nov 1, 2022 at 11:05 AM
<patchwork-bot+linux-renesas-soc@kernel.org> wrote:
> The following patches were marked "mainlined", because they were applied to
> geert/renesas-devel.git (master):
>
> Series: R-Car CANFD fixes
>   Submitter: Biju Das <biju.das.jz@bp.renesas.com>
>   Committer: Marc Kleine-Budde <mkl@pengutronix.de>
>   Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=688725
>   Lore link: https://lore.kernel.org/r/20221025155657.1426948-1-biju.das.jz@bp.renesas.com
>     Patches: [v2,1/3] can: rcar_canfd: Fix IRQ storm on global fifo receive
>              [v2,2/3] can: rcar_canfd: Fix channel specific IRQ handling for RZ/G2L
>
>
> Total patches: 2

No they weren't.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
