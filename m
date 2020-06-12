Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 567571F7B00
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2020 17:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbgFLPgW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Jun 2020 11:36:22 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:46235 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbgFLPgW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jun 2020 11:36:22 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 86DF73C04C1;
        Fri, 12 Jun 2020 17:36:18 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id yz9nHupVRJU1; Fri, 12 Jun 2020 17:36:13 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 5FC0B3C00BB;
        Fri, 12 Jun 2020 17:36:13 +0200 (CEST)
Received: from lxhi-065.adit-jv.com (10.72.94.12) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 12 Jun
 2020 17:36:13 +0200
Date:   Fri, 12 Jun 2020 17:36:07 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        <kieran.bingham+renesas@ideasonboard.com>, <geert@linux-m68k.org>,
        <horms@verge.net.au>, <uli+renesas@fpond.eu>,
        <VenkataRajesh.Kalakodima@in.bosch.com>, <airlied@linux.ie>,
        <daniel@ffwll.ch>, <koji.matsuoka.xm@renesas.com>,
        <muroya@ksk.co.jp>, <Harsha.ManjulaMallikarjun@in.bosch.com>,
        <ezequiel@collabora.com>, <seanpaul@chromium.org>,
        <linux-renesas-soc@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <michael.dege@renesas.com>, <gotthard.voellmeke@renesas.com>,
        <efriedrich@de.adit-jv.com>, <mrodin@de.adit-jv.com>,
        <ChaitanyaKumar.Borah@in.bosch.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v5 0/8] drm: rcar-du: Add Color Management Module (CMM)
Message-ID: <20200612153607.GA23962@lxhi-065.adit-jv.com>
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
 <20200527071555.GA23912@lxhi-065.adit-jv.com>
 <20200605132900.on527xcggg6f6pil@uno.localdomain>
 <20200605134124.GA28734@lxhi-065.adit-jv.com>
 <20200605135315.xlph44pl7kvmt23a@uno.localdomain>
 <20200607024158.GD7339@pendragon.ideasonboard.com>
 <20200609142959.GA621@lxhi-065.adit-jv.com>
 <20200612150032.pnqaqip54qfrbqst@uno.localdomain>
 <20200612151005.GA28336@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200612151005.GA28336@pendragon.ideasonboard.com>
X-Originating-IP: [10.72.94.12]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Fri, Jun 12, 2020 at 06:10:05PM +0300, Laurent Pinchart wrote:
> On Fri, Jun 12, 2020 at 05:00:32PM +0200, Jacopo Mondi wrote:
> > On Tue, Jun 09, 2020 at 04:29:59PM +0200, Eugeniu Rosca wrote:
> > > On Sun, Jun 07, 2020 at 05:41:58AM +0300, Laurent Pinchart wrote:
> > > > Note that the CMM driver is controlled by the DU driver. As the DU
> > > > driver will reenable the display during resume, it will call
> > > > rcar_du_cmm_setup() at resume time, which will reprogram the CMM. There
> > > > should thus be no need for manual suspend/resume handling in the CMM as
> > > > far as I can tell, but we need to ensure that the CMM is suspended
> > > > before and resumed after the DU. I believe this could be implemented
> > > > using device links.
> > >
> > > Based on below quote [*] from Jacopo's commit [**], isn't the device
> > > link relationship already in place?
> > 
> > Yes, it's in place already.
> > 
> > I added pm_ops to cmm just to be able to printout when suspend/resume
> > happens and the sequence is what comment [*] reports
> > 
> > [  222.909002] rcar_du_pm_suspend:505
> > [  223.145497] rcar_cmm_pm_suspend:193
> > 
> > [  223.208053] rcar_cmm_pm_resume:200
> > [  223.460094] rcar_du_pm_resume:513
> > 
> > However, Laurent mentioned that in his comment here that he expects
> > the opposite sequence to happen (CMM to suspend before and resume after
> > DU).
> > 
> > I still think what is implemented is correct:
> > - CMM is suspended after DU: when CMM is suspended, DU is not feeding
> >   it with data
> > - CMM is resumed before: once DU restart operations CMM is ready to
> >   receive data.
> > 
> > Laurent, what do you think ?
> 
> I think I shouldn't have written the previous e-mail in the middle of
> the night :-) Suspending CMM after DU is obviously correct.

Thanks to Renesas team (kudos to Gotthard and Michael), we've
figured out that below sequence of clock handling (happening during
concurrent suspend and HDMI display unplug) leads to SoC lockup:

cmm1 OFF 	(caused by HDMI unplug)
x21-clock OFF 	(caused by HDMI unplug)
du1 OFF 	(caused by HDMI unplug)
cmm1 ON (caused by suspend to ram, as preparation for CMM register save)
# Freeze happens

That seems to be explained by Chapter 35A.4.3 "Restriction of enabling
clock signal of the CMM" of HW User's manual (Rev.2.00 Jul 2019):

 -----8<-----
 When the clock signal of the CMM is enabled (RMSTPCR7.CMMn or
 SMSTPCR7.CMMn = 0), the clock signal of the DU should be also enabled
 (RMSTPCR7.DUn or SMSTPCR7.DUn = 0).
 -----8<-----

So, the lesson learned from the above is: do not enable the CMMi clock
while the DUi clock is disabled. I expect this to also potentially
give some input w.r.t. what to suspend/resume first, CMM or DU.

> 
> > > [*] Quote from commit [**]
> > >    Enforce the probe and suspend/resume ordering of DU and CMM by
> > >    creating a stateless device link between the two.
> > >
> > > [**] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8de707aeb45241
> > >     ("drm: rcar-du: kms: Initialize CMM instances")

-- 
Best regards,
Eugeniu Rosca
