Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FFED50A545
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 18:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbiDUQ1f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 12:27:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbiDUQP5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 12:15:57 -0400
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD2442B241
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Apr 2022 09:13:06 -0700 (PDT)
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 9F9F43C001F;
        Thu, 21 Apr 2022 18:13:04 +0200 (CEST)
Received: from lxhi-065 (10.72.94.3) by hi2exch02.adit-jv.com (10.72.92.28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Thu, 21 Apr
 2022 18:13:04 +0200
Date:   Thu, 21 Apr 2022 18:12:59 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        <laurent.pinchart@ideasonboard.com>,
        <linux-renesas-soc@vger.kernel.org>
CC:     <geert@linux-m68k.org>, <kuninori.morimoto.gx@renesas.com>,
        <dri-devel@lists.freedesktop.org>, <architt@codeaurora.org>,
        <vz@mleia.com>, <koji.matsuoka.xm@renesas.com>,
        Takashi Saito <takashi.saitou.ry@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Rodin <mrodin@de.adit-jv.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [RFC 14/21] v4l: vsp1: Change VSP1 LIF linebuffer FIFO
Message-ID: <20220421161259.GA2660@lxhi-065>
References: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1464624020-27709-15-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1464624020-27709-15-git-send-email-ulrich.hecht+renesas@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.94.3]
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear Uli,
Dear Laurent,
Dear Renesas community,

On Mo, Mai 30, 2016 at 06:00:13 +0200, Ulrich Hecht wrote:
> This patch changes to VSPD hardware recommended value.
> Purpose is highest pixel clock without underruns.
> In the default R-Car Linux BSP config this value is
> wrong and therefore there are many underruns.
> 
> Signed-off-by: Takashi Saito <takashi.saitou.ry@renesas.com>
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/media/platform/vsp1/vsp1_lif.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Apologize for reviving this very old thread.

We've been struggling with very rare and difficult to reproduce
display flickering occurrences and, after significant amount of
troubleshooting and debugging, with some support from Renesas,
we've been able to identify that those flicker issues are caused
by VSPD underruns.

What we've also learned is that one possible root-cause for seeing
VSPD underruns is having wrong QoS settings in DBSC (set in ATF).

What was particularly helpful in identifying the underruns themselves
is Renesas BSP commit [1], whose discussions we were unable to track
on linux-renesas-soc LKML.

My question is very simple. Since the meat of the Renesas patch [1]
is basically a printk in the interrupt context and an array storing
the total number of underruns occurred since startup, would you be
willing to review the refactored version of this patch on LKML?

In that case, we'll definitely invest some time to upstream it.

Thank you for your attention and feedback.

[1] https://github.com/renesas-rcar/linux-bsp/commit/12ea79975a10f
    ("v4l: vsp1: Add underrun debug messege option")

Best regards,
Eugeniu
