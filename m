Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14E32614E08
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Nov 2022 16:14:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231524AbiKAPO0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Nov 2022 11:14:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231569AbiKAPOE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Nov 2022 11:14:04 -0400
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE19D1EED1
        for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Nov 2022 08:10:00 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id h24so9460760qta.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Nov 2022 08:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+FgWT/IDnOqMwq9/lA4XDqBJ33H9tbB/UBK/2jxe4Hg=;
        b=wMOxD+JC7xi+FJoII6YvvAOUGh1jm9eM4Yh0PwN05SmJJK793uZ3Fjrti+qt22MYNr
         KZzzrceOi1QUsXcPQNKMXWV4f4BiGMQJzSItllIAxdo3/fANTR8Pv5Z+d/dSHBwg1fe8
         v05p2kPRYe335kZ4q54Gz8SAHrSzyOCl9b7AJHhUcgw6mzylNniXI7YNNkzYdbEJSQmi
         qwOlgxybkf3qwaXu6/o5fBX6O0IuyoYNjyZuGkT/+Df+a9brJaqQnazWGvH5sm/Q9XLS
         8IuPRIBOwIMF/U7YOZHIuDvweB6la6b9uS9x76Q0IzOfCTZaSOOZWQMIjc4xXg6DyGSO
         i1pA==
X-Gm-Message-State: ACrzQf1AH+tQ3KJ/XVOuEH+TbHGnue81S+khBNGgZB/LAfM9Rk/+B+Mb
        7d4vy8fQFRHrC9VjGCEfmIaVy+oNS7jIPw==
X-Google-Smtp-Source: AMsMyM6euZYeOYbqKd6x4ZqJhAtLZHJhIC4yZkITje2p1IY8mznyLyz0w7IP1TaLCsMF15enRooCjw==
X-Received: by 2002:a05:622a:4a10:b0:3a5:25ad:118c with SMTP id fv16-20020a05622a4a1000b003a525ad118cmr9121522qtb.155.1667315399416;
        Tue, 01 Nov 2022 08:09:59 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id u17-20020ae9c011000000b006e16dcf99c8sm6622471qkk.71.2022.11.01.08.09.59
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 08:09:59 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 63so17659464ybq.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Nov 2022 08:09:59 -0700 (PDT)
X-Received: by 2002:a25:4fc2:0:b0:6be:afb4:d392 with SMTP id
 d185-20020a254fc2000000b006beafb4d392mr16999127ybb.604.1667315398820; Tue, 01
 Nov 2022 08:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <166729684941.22390.7627523146991171045.git-patchwork-summary@kernel.org>
 <CAMuHMdVMwy3_EmL2+smhDBDTtH=so-AHNuUP1nvPWy4JuhyRoA@mail.gmail.com>
In-Reply-To: <CAMuHMdVMwy3_EmL2+smhDBDTtH=so-AHNuUP1nvPWy4JuhyRoA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 1 Nov 2022 16:09:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUmekXgtFXvnhtb_39LeoDvmmRvJQAcTRMCMenN7zou5w@mail.gmail.com>
Message-ID: <CAMuHMdUmekXgtFXvnhtb_39LeoDvmmRvJQAcTRMCMenN7zou5w@mail.gmail.com>
Subject: Re: Patchwork summary for: linux-renesas-soc
To:     patchwork-bot+linux-renesas-soc@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
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

On Tue, Nov 1, 2022 at 3:47 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, Nov 1, 2022 at 11:05 AM
> <patchwork-bot+linux-renesas-soc@kernel.org> wrote:
> > The following patches were marked "mainlined", because they were applied to
> > geert/renesas-devel.git (master):
> >
> > Series: R-Car CANFD fixes
> >   Submitter: Biju Das <biju.das.jz@bp.renesas.com>
> >   Committer: Marc Kleine-Budde <mkl@pengutronix.de>
> >   Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=688725
> >   Lore link: https://lore.kernel.org/r/20221025155657.1426948-1-biju.das.jz@bp.renesas.com
> >     Patches: [v2,1/3] can: rcar_canfd: Fix IRQ storm on global fifo receive
> >              [v2,2/3] can: rcar_canfd: Fix channel specific IRQ handling for RZ/G2L
> >
> >
> > Total patches: 2
>
> No they weren't.

Oops, this one is, as it is part of v6.1-rc3.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
