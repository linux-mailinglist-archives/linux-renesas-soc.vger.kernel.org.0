Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD09C51856C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 May 2022 15:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236139AbiECNbP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 May 2022 09:31:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232840AbiECNbP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 May 2022 09:31:15 -0400
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F0175F76;
        Tue,  3 May 2022 06:27:43 -0700 (PDT)
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id EA4483C00BB;
        Tue,  3 May 2022 15:27:41 +0200 (CEST)
Received: from lxhi-065 (10.72.94.4) by hi2exch02.adit-jv.com (10.72.92.28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Tue, 3 May
 2022 15:27:41 +0200
Date:   Tue, 3 May 2022 15:27:36 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     <linux-media@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Michael Rodin <mrodin@de.adit-jv.com>,
        Eugen Friedrich <efriedrich@de.adit-jv.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [RFC] media: renesas: vsp1: Add VSPD underrun detection & tracing
Message-ID: <20220503132736.GA10237@lxhi-065>
References: <1650962227-14281-1-git-send-email-erosca@de.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1650962227-14281-1-git-send-email-erosca@de.adit-jv.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.94.4]
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Di, Apr 26, 2022 at 10:37:07 +0200, Eugeniu Rosca wrote:
> A barely noticeable (especially if hardly reproducible) display flicker
> may not be the biggest concern in the development environment. However,
> an automotive OEM will not only notice it, but will also be haunted by
> its phenomenon/nature till it is understood in the greatest detail and
> ultimately eradicated, to avoid impairing user experience.
> 
> Troubleshooting the above without the right tools becomes a nightmare.
> 
> Since VSPD underruns may indeed cause [1] display flicker, we believe
> that having a minimal/lightweight support for detecting and logging
> such events would be extremely beneficial. Obviously, this only applies
> to VSP2 modules having an interface to DU (i.e. not mem2mem).
> 
> This implementation is heavily inspired by Koji Matsuoka's work [2-3],
> but has been refactored to hopefully become production/mainline-friendly
> (the original feature is intended for the development environment only).
> 
> [1] https://lore.kernel.org/linux-renesas-soc/20220421161259.GA2660@lxhi-065
> [2] https://github.com/renesas-rcar/linux-bsp/commit/3469001c3098
>     ("v4l: vsp1: Add underrun hung-up workaround")
> [3] https://github.com/renesas-rcar/linux-bsp/commit/12ea79975a10
>     ("v4l: vsp1: Add underrun debug messege option")
> 
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Cc: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

Superseded by https://lore.kernel.org/linux-renesas-soc/1651584010-10156-1-git-send-email-erosca@de.adit-jv.com

Best regards,
Eugeniu
