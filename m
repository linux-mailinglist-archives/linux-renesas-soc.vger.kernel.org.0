Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9508A23244
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 May 2019 13:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732708AbfETLZ2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 May 2019 07:25:28 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:60410 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732609AbfETLZ2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 May 2019 07:25:28 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id D1FF325AD7A;
        Mon, 20 May 2019 21:25:25 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id C18E19404D4; Mon, 20 May 2019 13:25:22 +0200 (CEST)
Date:   Mon, 20 May 2019 13:25:22 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH] ARM: shmobile: Remove GENERIC_PHY from shmobile_defconfig
Message-ID: <20190520112522.7u5g24nxm4g66yiw@verge.net.au>
References: <1556025203-59961-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdVzMt0Bq6Nyky2sSRKn8pB7srG1BTeweERFNJtrTUj+ow@mail.gmail.com>
 <20190424093315.6jg7muf56d2toxl5@verge.net.au>
 <OSBPR01MB210316C686F7DFABE8013357B83C0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20190424110700.4q7ymsj6y62pvbji@verge.net.au>
 <OSBPR01MB2103E36FDF7A5A38F93D37B9B83C0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20190426101239.syq534l5awlinzb2@verge.net.au>
 <OSBPR01MB21030095151CBAD62DF6F7F7B83E0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB21030095151CBAD62DF6F7F7B83E0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 26, 2019 at 10:14:26AM +0000, Biju Das wrote:
> > Subject: Re: [PATCH] ARM: shmobile: Remove GENERIC_PHY from
> > shmobile_defconfig
> > 
> > On Wed, Apr 24, 2019 at 11:11:43AM +0000, Biju Das wrote:
> > > Hi Simon,
> > >
> > > Thanks for the feedback.
> > >
> > > > Subject: Re: [PATCH] ARM: shmobile: Remove GENERIC_PHY from
> > > > shmobile_defconfig
> > > >
> > > > On Wed, Apr 24, 2019 at 09:44:11AM +0000, Biju Das wrote:
> > > > > Hi Simon,
> > > > >
> > > > > Thanks for the feedback.
> > > > >
> > > > > I missed to add the dependency for this patch.
> > > > >
> > > > > This patch has dependency on
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.gi
> > > > > t/co
> > > > > mmit/?h=next-
> > 20190424&id=5d8042e95fd471d0e342cf14f127194f1a867a01
> > > >
> > > > Thanks, but I see the same result with this patch applied on top of
> > > >
> > > > 5d8042e95fd4 phy: rcar-gen3-usb2: Add support for r8a77470
> > >
> > > That is strange.  Have you ran make shmobile_defconfig after applying the
> > patch?
> > >
> > > I get the following result with renesas- devel-20190423-v5.1-rc5.
> > 
> > Thanks, I also see things working fine with both
> > * [PATCH] ARM: shmobile: Remove GENERIC_PHY from shmobile_defconfig
> > * 5d8042e95fd4 phy: rcar-gen3-usb2: Add support for r8a77470 applied on
> > top of renesas-devel-20190423-v5.1-rc5
> > 
> > I think I can go ahead and apply
> > [PATCH] ARM: shmobile: Remove GENERIC_PHY from shmobile_defconfig
> > once I rebase my branches on v5.2-rc1, agter it has been release and
> > assuming it includes
> > 5d8042e95fd4 phy: rcar-gen3-usb2: Add support for r8a77470
> 
> Thanks Simon.

Likewise, thanks.

Now that v5.2-rc1 is available I have applied this patch for inclusion
in v5.3.
