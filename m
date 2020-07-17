Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E736223F0C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jul 2020 17:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbgGQPCo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jul 2020 11:02:44 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:34851 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbgGQPCn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jul 2020 11:02:43 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 21AD3C000F;
        Fri, 17 Jul 2020 15:02:32 +0000 (UTC)
Date:   Fri, 17 Jul 2020 17:06:05 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hien.dang.eb@renesas.com, michael.klein@renesas.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli+renesas@fpond.eu,
        VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        Harsha.ManjulaMallikarjun@in.bosch.com, ezequiel@collabora.com,
        seanpaul@chromium.org, linux-renesas-soc@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        michael.dege@renesas.com, gotthard.voellmeke@renesas.com,
        efriedrich@de.adit-jv.com, mrodin@de.adit-jv.com,
        ChaitanyaKumar.Borah@in.bosch.com,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v5 0/8] drm: rcar-du: Add Color Management Module (CMM)
Message-ID: <20200717150605.e46btmozsbavmfdd@uno.localdomain>
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
 <20200527071555.GA23912@lxhi-065.adit-jv.com>
 <20200605132900.on527xcggg6f6pil@uno.localdomain>
 <20200605134124.GA28734@lxhi-065.adit-jv.com>
 <20200605135315.xlph44pl7kvmt23a@uno.localdomain>
 <20200607024158.GD7339@pendragon.ideasonboard.com>
 <20200608094432.GA27063@lxhi-065.adit-jv.com>
 <20200612151209.xdaqimvpq7ysvu2q@uno.localdomain>
 <20200615141723.GA22692@lxhi-065.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200615141723.GA22692@lxhi-065.adit-jv.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Eugeniu,

On Mon, Jun 15, 2020 at 04:17:23PM +0200, Eugeniu Rosca wrote:
> Hi Jacopo,
>
> On Fri, Jun 12, 2020 at 05:12:09PM +0200, Jacopo Mondi wrote:
> > On Mon, Jun 08, 2020 at 11:44:32AM +0200, Eugeniu Rosca wrote:
> > > FWIW, I seem to hit pre-existing issues in vanilla rcar-du,
> > > while unplugging HDMI cable during a cyclic suspend-resume:
> > >
> > > HW: H3 ES2.0 Salvator-X
> > > SW: renesas-drivers-2020-06-02-v5.7
> > > .config: renesas_defconfig +CONFIG_PM_DEBUG +CONFIG_PM_ADVANCED_DEBUG
> > > Use-case:
> > >
> > >   --------8<---------
> > > $ cat s2ram.sh
> > > modprobe i2c-dev
> > > echo 9 > /proc/sys/kernel/printk
> > > i2cset -f -y 7 0x30 0x20 0x0F
> >
> > According to
> > https://elinux.org/R-Car/Boards/Salvator-X#Suspend-to-RAM
> > this is not needed anymore
>
> Good to know. Thanks for the useful remark.
>
> > > echo 0 > /sys/module/suspend/parameters/pm_test_delay
> > > echo core  > /sys/power/pm_test
> > > echo deep > /sys/power/mem_sleep
> > > echo 1 > /sys/power/pm_debug_messages
> > > echo 0 > /sys/power/pm_print_times
> > > echo mem > /sys/power/state
> > >
> > > $ while true; do sh s2ram.sh ; done
> > > $ # unplug HDMI cable several times
> >
> > I tried unplugging an plugging the cable while the system was
> > suspended and after resume but I was not able to reproduce anything.
>
> Your comment sounds like you suspended the system once and resumed it
> afterwards, while my description mentions "cyclic" :), meaning:
>
> $ while true; do sh s2ram.sh; done
> $ # connect-disconnect the hdmi display a couple of times
> $ # NOTE: to avoid this manual step, I am thinking of a USB-controlled
>     HDMI switcher long-term
>
> >
> > Could you provide more precise instructions on how to reproduce this ?
> > I.e. when to disconnect the cable to trigger the below error.
>
> See above :)
>
> BTW, using renesas-drivers-2020-06-02-v5.7 as base and performing the
> use-case just described, I got today (with minimal effort):
>
> [  459.321733] Enabling non-boot CPUs ...
> [  459.331132] Detected PIPT I-cache on CPU1
> [  459.331189] CPU1: Booted secondary processor 0x0000000001 [0x411fd073]
> [  459.332312] CPU1 is up
> [  459.345635] Detected PIPT I-cache on CPU2
> [  459.345671] CPU2: Booted secondary processor 0x0000000002 [0x411fd073]
> [  459.346624] CPU2 is up
> [  459.359912] Detected PIPT I-cache on CPU3
> [  459.359942] CPU3: Booted secondary processor 0x0000000003 [0x411fd073]
> [  459.360918] CPU3 is up
> [  459.374183] Detected VIPT I-cache on CPU4
> [  459.374252] CPU4: Booted secondary processor 0x0000000100 [0x410fd034]
> [  459.375875] cpufreq: cpufreq_online: CPU4: Running at unlisted freq: 1199999 KHz
> [  459.394204] cpufreq: cpufreq_online: CPU4: Unlisted initial frequency changed to: 1200000 KHz
> [  459.403879] CPU4 is up
> [  459.406469] Detected VIPT I-cache on CPU5
> [  459.406519] CPU5: Booted secondary processor 0x0000000101 [0x410fd034]
> [  459.408520] CPU5 is up
> [  459.421762] Detected VIPT I-cache on CPU6
> [  459.421810] CPU6: Booted secondary processor 0x0000000102 [0x410fd034]
> [  459.423831] CPU6 is up
> [  459.437114] Detected VIPT I-cache on CPU7
> [  459.437164] CPU7: Booted secondary processor 0x0000000103 [0x410fd034]
> [  459.439258] CPU7 is up
> [  459.456217] PM: noirq resume of devices complete after 3.878 msecs
> [  459.471529] PM: early resume of devices complete after 8.590 msecs
> [  469.726906] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CRTC:76:crtc-3] flip_done timed out

I've been able to reproduce this same issue, but I see that errors in
drm_atomic_helper_wait_for_dependencies always follow a first failure
in drm_atomic_helper_wait_for_flip_done

Looking at the log what I see is that
[  160.488762] PM: late suspend of devices complete after 10.509 msecs
[  171.235584] [drm:drm_atomic_helper_wait_for_flip_done] *ERROR* [CRTC:75:crtc-1] flip_done timed out

The 10 second elapsed there matches the timout in
drm_atomic_helper_wait_for_flip_done and it seems the issue is related
to the first atomic commit after resume not being able to succesfully
receive a flip_done event, possibly as the HDMI connector has been
disconnected while the system was suspending or suspended and the DRM
state was not updated.

Can you confirm you see the same failure sequence ?

Thanks
  j
