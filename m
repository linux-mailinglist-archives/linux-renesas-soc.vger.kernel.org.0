Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E44350F97E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Apr 2022 12:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347967AbiDZKCl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Apr 2022 06:02:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348113AbiDZKBm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Apr 2022 06:01:42 -0400
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FDD05B3F9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Apr 2022 02:20:43 -0700 (PDT)
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id E70FC3C04C0;
        Tue, 26 Apr 2022 11:20:41 +0200 (CEST)
Received: from lxhi-065 (10.72.94.34) by hi2exch02.adit-jv.com (10.72.92.28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Tue, 26 Apr
 2022 11:20:41 +0200
Date:   Tue, 26 Apr 2022 11:20:36 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        <linux-renesas-soc@vger.kernel.org>, <geert@linux-m68k.org>,
        <kuninori.morimoto.gx@renesas.com>,
        <dri-devel@lists.freedesktop.org>, <architt@codeaurora.org>,
        <vz@mleia.com>, <koji.matsuoka.xm@renesas.com>,
        Takashi Saito <takashi.saitou.ry@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Rodin <mrodin@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [RFC 14/21] v4l: vsp1: Change VSP1 LIF linebuffer FIFO
Message-ID: <20220426092036.GA14417@lxhi-065>
References: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1464624020-27709-15-git-send-email-ulrich.hecht+renesas@gmail.com>
 <20220421161259.GA2660@lxhi-065>
 <YmGHTgrKf6MZ28P3@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YmGHTgrKf6MZ28P3@pendragon.ideasonboard.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.94.34]
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Do, Apr 21, 2022 at 07:33:18 +0300, Laurent Pinchart wrote:
> On Thu, Apr 21, 2022 at 06:12:59PM +0200, Eugeniu Rosca wrote:
> > Since the meat of the Renesas patch [1]
> > is basically a printk in the interrupt context and an array storing
> > the total number of underruns occurred since startup, would you be
> > willing to review the refactored version of this patch on LKML?
> > 
> > In that case, we'll definitely invest some time to upstream it.
> 
> Absolutely ! I'm all for helping debugging.

Thanks for the quick reply. I have submitted a proposal at [*] and
I look forward to any thoughts/criticism/counter-proposals. TIA.

[*] https://lore.kernel.org/linux-renesas-soc/1650962227-14281-1-git-send-email-erosca@de.adit-jv.com

Best Regards,
Eugeniu
