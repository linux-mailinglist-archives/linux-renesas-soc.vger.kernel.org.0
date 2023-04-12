Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 382F36DEBE5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Apr 2023 08:37:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbjDLGhn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Apr 2023 02:37:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbjDLGhm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Apr 2023 02:37:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A147D5BBD;
        Tue, 11 Apr 2023 23:37:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E4C6C62E84;
        Wed, 12 Apr 2023 06:37:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA6BDC433EF;
        Wed, 12 Apr 2023 06:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1681281452;
        bh=C08xlScrwcFLdBM4M2cjiejNGUOC2cBgygJXW4F0akQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OvPmm65tFUtKMb6uvKdWdj+CwHnU3HWMLPT3Jz6E92n9YwogMdR4ulZuq7okqBdT7
         Ffzjig8MFiNLWWQIW/VHk4EEiH38RDfTTckhEH97Sknhaf8qxgdKfAgBJ1vkBkVssg
         a3tVu+XhCbytOYlwY1MasJtSi0KC2KPJkv2UM58I=
Date:   Wed, 12 Apr 2023 08:37:29 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Jiri Slaby <jslaby@suse.com>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, stable <stable@kernel.org>
Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
Message-ID: <2023041214-epidural-overrate-3b81@gregkh>
References: <20230411100859.305617-1-biju.das.jz@bp.renesas.com>
 <2023041129-skeleton-nursery-f9b0@gregkh>
 <OS0PR01MB59225DFD2073B3A6C8249104869A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB59220D9E0C52F5413046CAFB869A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <2023041158-crisped-obtrusive-2309@gregkh>
 <TYCPR01MB5933C7188612037F0787A5E3869A9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCPR01MB5933C7188612037F0787A5E3869A9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Apr 11, 2023 at 03:36:04PM +0000, Biju Das wrote:
> 
> Hi Greg,
> 
> > Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
> > 
> > On Tue, Apr 11, 2023 at 02:40:52PM +0000, Biju Das wrote:
> > > Hi Greg,
> > >
> > > > Subject: RE: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt
> > > > handler
> > > >
> > > > Hi Greg,
> > > >
> > > > Thanks for the feedback.
> > > >
> > > > > Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end
> > > > > interrupt handler
> > > > >
> > > > > On Tue, Apr 11, 2023 at 11:08:59AM +0100, Biju Das wrote:
> > > > > > commit b43a18647f03c87e77d50d6fe74904b61b96323e upstream.
> > > > > >
> > > > > > The fourth interrupt on SCI port is transmit end interrupt
> > > > > > compared to the break interrupt on other port types. So, shuffle
> > > > > > the interrupts to fix the transmit end interrupt handler.
> > > > > >
> > > > > > Fixes: e1d0be616186 ("sh-sci: Add h8300 SCI")
> > > > > > Cc: stable <stable@kernel.org>
> > > > > > Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > > Link:
> > > > > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > > > [biju: manually fixed the conflicts]
> > > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > > ---
> > > > > > Resending to 4.14 with confilcts [1] fixed.
> > > > > > [1]
> > > > >
> > > > > You did not actually build your patch, as it breaks the build :(
> > > >
> > > > Actually, I build the patch, but did not test it on target as I
> > > > don't have the platform to test it.
> > > >
> > > > I got some issues while building modules which is unrelated to this
> > change.
> > > >
> > > > Anyway, I will double check again and confirm.
> > >
> > > I confirm, there is an issue with this patch.
> > >
> > > I disabled building modules from my build script and it showed the below
> > error.
> > > So I would like to drop this patch for 4.14 as this header file does not
> > exist for 4.14.
> > >
> > > drivers/tty/serial/sh-sci.c:40:10: fatal error: linux/minmax.h: No such
> > file or directory
> > >    40 | #include <linux/minmax.h>
> > >       |          ^~~~~~~~~~~~~~~~
> > 
> > Yes, minmax is not there, but the function needed by that is there (hint, I
> > had to remove that include in 4.19).  Remove it and see the next error you
> > get :)
> > 
> 
> OK got it, The SCIx_TEI_IRQ  is introduced after 4.18 by patch [1]. 
> 
> [1] 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/tty/serial/sh-sci.c?h=linux-5.4.y&id=628c534ae73581fd21a09a27b7a4222b01a44d64
> 
> So, 4.14 does not require this patch, as it have combined interrupt.

Great, thanks for checking, it turns out that the Fixes: tag was wrong :(
