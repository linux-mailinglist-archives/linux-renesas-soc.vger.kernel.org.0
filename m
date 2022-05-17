Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B944F52A4A9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 May 2022 16:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348810AbiEQOVh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 May 2022 10:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348815AbiEQOVb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 May 2022 10:21:31 -0400
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1AA33D1C3;
        Tue, 17 May 2022 07:21:30 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id m1so14628393qkn.10;
        Tue, 17 May 2022 07:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=i8yO9kHwhygBJ9j9PsAS6OuX3WjdjaQdW8IPhRNoDhQ=;
        b=EybXetboA+aa2776vTWK97MW9tAsyUmA0MyaMl07PQHlbtEIUlBeJO7zpgHfejHh9T
         IzxeSjddzesC3E+ZbIrh/gQpFf7AMOinwgZiV+h9cjS9wXhBVJc7AAzbOMf2BRhWrmc6
         3hOVtOqGv6N0pJMPrwyE1wqD90Sc7UiP6giLrlL6Pv9MnDFydLgSfV7zmBnLd0yATLL+
         JsTYZm5LU9/jBLjEKu+MtHOKlVS12eWi1T3scyKBhDLgpXjIGnOevfhvY+JY6crEseR4
         GqCQdL4yNIr2fBoyvymFMLE2TEq9xGc5gd+Bnkj2NY7CiNJoxLhVGhqtic0HlBqlBu2D
         DBjw==
X-Gm-Message-State: AOAM530pgvKPJQLzxB8j8Nj8doq0yBSd1I85cqouYurFJ5e4EesKqoCi
        iT1V534YyWeKa+cdB2oc9siHdi8XUmRcRg==
X-Google-Smtp-Source: ABdhPJwJj4NtGolE2WheDERACBEETH74B2FXsOGaiJmPOnQY592Ojn5XkMh178UnQFsonprcddUcMA==
X-Received: by 2002:a05:620a:10:b0:69e:5d4c:149a with SMTP id j16-20020a05620a001000b0069e5d4c149amr16588025qki.488.1652797289684;
        Tue, 17 May 2022 07:21:29 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id f6-20020a05622a114600b002f39b99f69esm7754478qty.56.2022.05.17.07.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 May 2022 07:21:29 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id o80so12911285ybg.1;
        Tue, 17 May 2022 07:21:29 -0700 (PDT)
X-Received: by 2002:a05:6902:389:b0:633:31c1:d0f7 with SMTP id
 f9-20020a056902038900b0063331c1d0f7mr22854661ybs.543.1652797288944; Tue, 17
 May 2022 07:21:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220504184406.93788-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdUh69grzYVsMwdZLgv=KLy5-_FVjeMWx37qGsqCxz9Y6g@mail.gmail.com>
 <OS0PR01MB59224D1908A7DBB08DAF444986C29@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdVqj6nr5h5G9w3wTDHCDbDK_9fJW4d7cvc1c1LC9D2roA@mail.gmail.com> <OS0PR01MB592211288197B1923D452B3986CE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB592211288197B1923D452B3986CE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 May 2022 16:21:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUAmrnWaCMxeqByU2E7y6S1dr8VStkfhUdkziF5sOmCpw@mail.gmail.com>
Message-ID: <CAMuHMdUAmrnWaCMxeqByU2E7y6S1dr8VStkfhUdkziF5sOmCpw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Add a delay after deassert
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Tue, May 17, 2022 at 3:36 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH] clk: renesas: cpg-mssr: Add a delay after deassert
> > On Thu, May 5, 2022 at 12:01 PM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > > Subject: Re: [PATCH] clk: renesas: cpg-mssr: Add a delay after
> > > > deassert On Wed, May 4, 2022 at 8:44 PM Biju Das
> > <biju.das.jz@bp.renesas.com> wrote:
> > > > > After adding reset support to vsp, it needs a delay of 32
> > > > > microseconds after reset operation, otherwise system hangs(due to
> > > > > register
> > > > read/write).
> > > > > This patch fixes the system hang issue by adding delay after
> > > > > deassert operation.
> > > > >
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > >
> > > > > After adding reset/deassert support for vsp based on [1], RZ/G1N
> > > > > board hangs. On debugging it found that it needs a delay of 35
> > > > > microseconds after deasserint reset. Wthout delay if there is any
> > > > > register read/write will lead to hang.
> > > > >
> > > > > This 35 microseconds value is  picked from the reset().
> > > >
> > > > The 35 µs comes from the Hardware User's Manual: there should be at
> > > > least 1 RCLK cycle _in between_ asserting and deasserting reset.
> > > > The manual doesn't say anything about delays _after_ deasserting
> > reset.
> > > >
> > > > Could it be that the VSP1 driver is actually deasserting reset too
> > early?
> > >
> > > My test results on RZ/G1N shows, it needs 35 micro seconds after
> > deasserting reset.
> >
> > I can confirm that accessing the VSP registers without the delay causes a
> > lock-up on R-Car M2-W, too.
> > I see no such lock-up on R-Car Gen3, but I cannot rule out that it is
> > mitigated by a handler in secure mode, and that VSP initialization may
> > actually fail (accessing registers of non-clocked modules usually causes
> > an imprecise external abort, which is caught by Linux on R-Car Gen2, but
> > turned into a no-op by secure firmware on R-Car Gen3).
> >
> > Instead of adding the explicit delay, I tried added a polling loop after
> > the call to reset_control_deassert() in the vsp1 driver, to wait until the
> > reset is cleared, like is done in the i2c-rcar driver:
> >
> >         ret = read_poll_timeout_atomic(reset_control_status, ret, ret ==
> > 0, 1,
> >                                        100, false, vsp1->rstc);
> >         if (ret < 0) {
> >                 ...
> >         }
> >
> > This also fixes the issue for me.
>
> Yes, It is better fix than the explicit delay.
>
> > Adding more debug code shows that reset_control_status() is called only
> > once (both for i2c and vsp1), so the polling completes before any call to
> > udelay().
>
> >
> > Note that at that time[1], we added the delay to the i2c-rcar driver
> > instead of the CPG/MSSR driver, as we were told that i2c reset was
> > special, and other modules do not need this.
> > Perhaps vsp reset is special, too?
> > Or perhaps it is time to revisit this, and add the polling to both
> > cpg_mssr_reset() and cpg_mssr_deassert(), so it can be removed from the
> > drivers?
>
> I feel adding poll in VSP driver is better compared to cpg driver, as
> it reduces wakeup time after "Suspend to RAM" operation.
>
> How do we proceed here? Do you want me to add as part of RZ/G2L patch series? Or you will post separately.

Feel free to incorporate it into v11 of "[2/5] media: renesas: vsp1:
Add support to deassert/assert reset line".

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
