Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF9FA4A0B4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 14:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbfFRMYT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 08:24:19 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:57838 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729167AbfFRMYS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 08:24:18 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 9078925BE52;
        Tue, 18 Jun 2019 22:24:16 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 8D8C09408C4; Tue, 18 Jun 2019 14:24:14 +0200 (CEST)
Date:   Tue, 18 Jun 2019 14:24:14 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 0/3] clocksource/drivers/sh_cmt: Minor DT compat string
 update
Message-ID: <20190618122411.htkjfpdhrg7sut3y@verge.net.au>
References: <156076560641.6960.5508309411424406087.sendpatchset@octo>
 <20190618103109.pdhlhnz623ypqrju@verge.net.au>
 <CANqRtoSspY_ccm+g0BFXt8VpQ9O-7Ta_rose+KVDOGjeX4VQ_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANqRtoSspY_ccm+g0BFXt8VpQ9O-7Ta_rose+KVDOGjeX4VQ_A@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jun 18, 2019 at 09:14:51PM +0900, Magnus Damm wrote:
> On Tue, Jun 18, 2019 at 7:31 PM Simon Horman <horms@verge.net.au> wrote:
> >
> > On Mon, Jun 17, 2019 at 07:00:06PM +0900, Magnus Damm wrote:
> > > clocksource/drivers/sh_cmt: Minor DT compat string update
> > >
> > > [PATCH 1/3] clocksource/drivers/sh_cmt: SoC-specific match for CMT1 on r8a7740 and sh73a0
> > > [PATCH 2/3] clocksource/drivers/sh_cmt: Remove "cmt-48-gen2" support
> > > [PATCH 3/3] clocksource/drivers/sh_cmt: Document "cmt-48" as deprecated
> > >
> > > Move over to new CMT1 bindings on r8a7740 and sh73a0 and get rid of old
> > > stale stuff such as "cmt-48-gen2" while keeping "cmt-48" around but document
> > > it as deprecated.
> > >
> > > Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> >
> >
> > Hi Magnus,
> >
> > I think this series should include the Clocksource maintainers as
> > recipients:
> >
> > Daniel Lezcano <daniel.lezcano@linaro.org>
> > Thomas Gleixner <tglx@linutronix.de>
> >
> > And LKML for good measure.
> 
> Hi Simon,
> 
> I totally agree. I was suspecting some opinions might come out about
> the CMT compat string changes in the DT binding document. I'll repost
> this series and include the above folks/ML once the CMT compat string
> changes in DT binding document are agreed.

Great, thanks!
