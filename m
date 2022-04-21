Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBC7D50A5CD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 18:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbiDUQgL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 12:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230172AbiDUQgK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 12:36:10 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 409CE2623
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Apr 2022 09:33:20 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9983C492;
        Thu, 21 Apr 2022 18:33:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650558797;
        bh=AauU9WrhhXKScaTW7AXxEi8Y94P2YaLkB6BMWmhdKhE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=morH0nAoZec7svutx3+tJyN2p220P++lm7hFZ5aO/FAoKCACrQaySbTc4YOD3Qr3z
         8EtY4U0YG1/+tpU1rEgZqdLkvrkpCDMjvNfhKUevyS4CfFZEIzZ8Ka9IKrCBN8udNI
         acHwKK2vVCldK6H4IHgduKKzAin4FzFTJ7rxMqMs=
Date:   Thu, 21 Apr 2022 19:33:18 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        kuninori.morimoto.gx@renesas.com, dri-devel@lists.freedesktop.org,
        architt@codeaurora.org, vz@mleia.com, koji.matsuoka.xm@renesas.com,
        Takashi Saito <takashi.saitou.ry@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Rodin <mrodin@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [RFC 14/21] v4l: vsp1: Change VSP1 LIF linebuffer FIFO
Message-ID: <YmGHTgrKf6MZ28P3@pendragon.ideasonboard.com>
References: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1464624020-27709-15-git-send-email-ulrich.hecht+renesas@gmail.com>
 <20220421161259.GA2660@lxhi-065>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220421161259.GA2660@lxhi-065>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Eugeniu,

On Thu, Apr 21, 2022 at 06:12:59PM +0200, Eugeniu Rosca wrote:
> Dear Uli,
> Dear Laurent,
> Dear Renesas community,
> 
> On Mo, Mai 30, 2016 at 06:00:13 +0200, Ulrich Hecht wrote:
> > This patch changes to VSPD hardware recommended value.
> > Purpose is highest pixel clock without underruns.
> > In the default R-Car Linux BSP config this value is
> > wrong and therefore there are many underruns.
> > 
> > Signed-off-by: Takashi Saito <takashi.saitou.ry@renesas.com>
> > Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> > Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  drivers/media/platform/vsp1/vsp1_lif.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> Apologize for reviving this very old thread.
> 
> We've been struggling with very rare and difficult to reproduce
> display flickering occurrences and, after significant amount of
> troubleshooting and debugging, with some support from Renesas,
> we've been able to identify that those flicker issues are caused
> by VSPD underruns.
> 
> What we've also learned is that one possible root-cause for seeing
> VSPD underruns is having wrong QoS settings in DBSC (set in ATF).
> 
> What was particularly helpful in identifying the underruns themselves
> is Renesas BSP commit [1], whose discussions we were unable to track
> on linux-renesas-soc LKML.
> 
> My question is very simple. Since the meat of the Renesas patch [1]
> is basically a printk in the interrupt context and an array storing
> the total number of underruns occurred since startup, would you be
> willing to review the refactored version of this patch on LKML?
> 
> In that case, we'll definitely invest some time to upstream it.

Absolutely ! I'm all for helping debugging.

> Thank you for your attention and feedback.
> 
> [1] https://github.com/renesas-rcar/linux-bsp/commit/12ea79975a10f
>     ("v4l: vsp1: Add underrun debug messege option")

-- 
Regards,

Laurent Pinchart
