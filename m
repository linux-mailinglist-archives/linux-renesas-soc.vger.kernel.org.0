Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4265052A304
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 May 2022 15:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346044AbiEQNQy convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 May 2022 09:16:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347453AbiEQNQw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 May 2022 09:16:52 -0400
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8155C41FAA;
        Tue, 17 May 2022 06:16:47 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id l1so14338654qvh.1;
        Tue, 17 May 2022 06:16:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=72BItrONoo13B+XZUBS7ShowYY5fuE/yH1rhlY56Dls=;
        b=jjxzPnszt/tQgMF72XSQqEJB6V+o7anEQQpwtYejlzd9ZwkISQ/i4m2Yq9n4o6C61Q
         jQxEHLTmRn6kN27ogdn9b3bn+Wxf4/lyEO9iNm1BO/Dz4gy7OmhR18tDSntSwIUVcUQR
         FRLWGx7AYiBu0QTp6XEFWV/zuVrOA1gcCp/hTgohlYfL4ejM4oX2gHgREDI6KEN9jkkx
         53TAeoU74I4Sw5JPLAuh8XpGEraviQVHKe6IkL0zFJqX7HkY/vC62kArTtSPRbHmCqs0
         x9JUv+Cjxz9U1DIBBXj2ZHo3Fhd4Sudc9V/FpL7zB0wsMFJ6sIXTeC+waYSokuHEP8q3
         sntw==
X-Gm-Message-State: AOAM530Yc3U+Hi/p5EdZ6waKoeqgU5qI/TnSbDk9WoQcP0aJEhUkgzdt
        sZLsCPOTR1PbNqJ4i3AFWgmmJOQx8hJueA==
X-Google-Smtp-Source: ABdhPJyoGfcAMtQmPAa8oLWt2hinipfHFI82ZxVZGh+3Wd65Ajq6Qq7gcEc+KNtatrS8ja6KN3wmug==
X-Received: by 2002:a05:6214:e4c:b0:45a:fb3d:74bd with SMTP id o12-20020a0562140e4c00b0045afb3d74bdmr19626848qvc.11.1652793406461;
        Tue, 17 May 2022 06:16:46 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id d196-20020ae9efcd000000b006a09515d012sm7593313qkg.50.2022.05.17.06.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 May 2022 06:16:46 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id q135so13142396ybg.10;
        Tue, 17 May 2022 06:16:46 -0700 (PDT)
X-Received: by 2002:a05:6902:905:b0:64a:2089:f487 with SMTP id
 bu5-20020a056902090500b0064a2089f487mr23072467ybb.202.1652793405866; Tue, 17
 May 2022 06:16:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220504184406.93788-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdUh69grzYVsMwdZLgv=KLy5-_FVjeMWx37qGsqCxz9Y6g@mail.gmail.com> <OS0PR01MB59224D1908A7DBB08DAF444986C29@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59224D1908A7DBB08DAF444986C29@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 May 2022 15:16:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVqj6nr5h5G9w3wTDHCDbDK_9fJW4d7cvc1c1LC9D2roA@mail.gmail.com>
Message-ID: <CAMuHMdVqj6nr5h5G9w3wTDHCDbDK_9fJW4d7cvc1c1LC9D2roA@mail.gmail.com>
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

On Thu, May 5, 2022 at 12:01 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH] clk: renesas: cpg-mssr: Add a delay after deassert
> > On Wed, May 4, 2022 at 8:44 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > After adding reset support to vsp, it needs a delay of 32 microseconds
> > > after reset operation, otherwise system hangs(due to register
> > read/write).
> > > This patch fixes the system hang issue by adding delay after deassert
> > > operation.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > > After adding reset/deassert support for vsp based on [1], RZ/G1N board
> > > hangs. On debugging it found that it needs a delay of 35 microseconds
> > > after deasserint reset. Wthout delay if there is any register
> > > read/write will lead to hang.
> > >
> > > This 35 microseconds value is  picked from the reset().
> >
> > The 35 µs comes from the Hardware User's Manual: there should be at least 1
> > RCLK cycle _in between_ asserting and deasserting reset.
> > The manual doesn't say anything about delays _after_ deasserting reset.
> >
> > Could it be that the VSP1 driver is actually deasserting reset too early?
>
> My test results on RZ/G1N shows, it needs 35 micro seconds after deasserting reset.

I can confirm that accessing the VSP registers without the delay
causes a lock-up on R-Car M2-W, too.
I see no such lock-up on R-Car Gen3, but I cannot rule out that it
is mitigated by a handler in secure mode, and that VSP initialization
may actually fail (accessing registers of non-clocked modules usually
causes an imprecise external abort, which is caught by Linux on R-Car
Gen2, but turned into a no-op by secure firmware on R-Car Gen3).

Instead of adding the explicit delay, I tried added a polling loop
after the call to reset_control_deassert() in the vsp1 driver, to
wait until the reset is cleared, like is done in the i2c-rcar driver:

        ret = read_poll_timeout_atomic(reset_control_status, ret, ret == 0, 1,
                                       100, false, vsp1->rstc);
        if (ret < 0) {
                ...
        }

This also fixes the issue for me.
Adding more debug code shows that reset_control_status() is called
only once (both for i2c and vsp1), so the polling completes before
any call to udelay().

Note that at that time[1], we added the delay to the i2c-rcar driver
instead of the CPG/MSSR driver, as we were told that i2c reset was
special, and other modules do not need this.
Perhaps vsp reset is special, too?
Or perhaps it is time to revisit this, and add the polling to both
cpg_mssr_reset() and cpg_mssr_deassert(), so it can be removed from
the drivers?

[1] Commit 3b770017b03a4cdf ("i2c: rcar: handle RXDMA HW behaviour on Gen3").

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
