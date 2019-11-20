Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 892621037A7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2019 11:36:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728467AbfKTKgQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Nov 2019 05:36:16 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:44472 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727659AbfKTKgQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Nov 2019 05:36:16 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id UAcC2100J5USYZQ06AcCJG; Wed, 20 Nov 2019 11:36:13 +0100
Received: from geert (helo=localhost)
        by ramsan with local-esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iXNLH-0007E4-Vq; Wed, 20 Nov 2019 11:36:12 +0100
Date:   Wed, 20 Nov 2019 11:36:11 +0100 (CET)
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
cc:     =?ISO-8859-15?Q?Marek_Beh=FAn?= <marek.behun@nic.cz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        David Bauer <mail@david-bauer.net>,
        "David S. Miller" <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net 1/1] mdio_bus: fix mdio_register_device when
 RESET_CONTROLLER is disabled
In-Reply-To: <20191119102744.GD32742@smile.fi.intel.com>
Message-ID: <alpine.DEB.2.21.1911201053330.25420@ramsan.of.borg>
References: <20191118181505.32298-1-marek.behun@nic.cz> <20191119102744.GD32742@smile.fi.intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1988560550-1574246171=:25420"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1988560550-1574246171=:25420
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT

 	Hi all,

On Tue, 19 Nov 2019, Andy Shevchenko wrote:
> On Mon, Nov 18, 2019 at 07:15:05PM +0100, Marek Beh�n wrote:
>> When CONFIG_RESET_CONTROLLER is disabled, the
>> devm_reset_control_get_exclusive function returns -ENOTSUPP. This is not
>> handled in subsequent check and then the mdio device fails to probe.
>>
>> When CONFIG_RESET_CONTROLLER is enabled, its code checks in OF for reset
>> device, and since it is not present, returns -ENOENT. -ENOENT is handled.
>> Add -ENOTSUPP also.
>>
>> This happened to me when upgrading kernel on Turris Omnia. You either
>> have to enable CONFIG_RESET_CONTROLLER or use this patch.
>
> In the long term prospective shouldn't it use
> reset_control_get_optional_exclusive() instead?

I was thinking the same, hence I tried.

Without a reset (i.e. the returned reset is now NULL instead of
-ENOENT):

     WARNING: CPU: 1 PID: 120 at drivers/base/dd.c:519 really_probe+0xb0/0x314
     Modules linked in:
     CPU: 1 PID: 120 Comm: kworker/1:2 Not tainted 5.4.0-rc8-koelsch-08348-gbc6931ed2139022b-dirty #615
     Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
     Workqueue: events deferred_probe_work_func
     [<c020e268>] (unwind_backtrace) from [<c020a428>] (show_stack+0x10/0x14)
     [<c020a428>] (show_stack) from [<c07a075c>] (dump_stack+0x88/0xa8)
     [<c07a075c>] (dump_stack) from [<c0220980>] (__warn+0xb8/0xd0)
     [<c0220980>] (__warn) from [<c0220a08>] (warn_slowpath_fmt+0x70/0x9c)
     [<c0220a08>] (warn_slowpath_fmt) from [<c05150b0>] (really_probe+0xb0/0x314)
     [<c05150b0>] (really_probe) from [<c0515598>] (driver_probe_device+0x13c/0x154)
     [<c0515598>] (driver_probe_device) from [<c0513784>] (bus_for_each_drv+0xa0/0xb4)
     [<c0513784>] (bus_for_each_drv) from [<c05153c0>] (__device_attach+0xac/0x124)
     [<c05153c0>] (__device_attach) from [<c05143f0>] (bus_probe_device+0x28/0x80)
     [<c05143f0>] (bus_probe_device) from [<c051227c>] (device_add+0x4d8/0x698)
     [<c051227c>] (device_add) from [<c0581110>] (phy_device_register+0x3c/0x74)
     [<c0581110>] (phy_device_register) from [<c0675efc>] (of_mdiobus_register_phy+0x144/0x17c)
     [<c0675efc>] (of_mdiobus_register_phy) from [<c06760f8>] (of_mdiobus_register+0x1c4/0x2d0)
     [<c06760f8>] (of_mdiobus_register) from [<c0589f18>] (sh_eth_drv_probe+0x778/0x8ac)
     [<c0589f18>] (sh_eth_drv_probe) from [<c0516ce8>] (platform_drv_probe+0x48/0x94)
     [<c0516ce8>] (platform_drv_probe) from [<c05151f8>] (really_probe+0x1f8/0x314)
     [<c05151f8>] (really_probe) from [<c0515598>] (driver_probe_device+0x13c/0x154)

The difference with the non-optional case is that
__devm_reset_control_get() registers a cleanup function if there's
no error condition, even for NULL (which is futile, will send a patch).

However, more importantly, mdiobus_register_reset() calls a devm_*()
function on "&mdiodev->dev" ("mdio_bus ee700000.ethernet-ffffffff:01"),
which is a different device than the one being probed
(("ee700000.ethernet"), see also the callstack below).
In fact "&mdiodev->dev" hasn't been probed yet, leading to the WARNING
when it is probed later.

     [<c0582de8>] (mdiobus_register_device) from [<c05810e0>] (phy_device_register+0xc/0x74)
     [<c05810e0>] (phy_device_register) from [<c0675ef4>] (of_mdiobus_register_phy+0x144/0x17c)
     [<c0675ef4>] (of_mdiobus_register_phy) from [<c06760f0>] (of_mdiobus_register+0x1c4/0x2d0)
     [<c06760f0>] (of_mdiobus_register) from [<c0589f0c>] (sh_eth_drv_probe+0x778/0x8ac)
     [<c0589f0c>] (sh_eth_drv_probe) from [<c0516ce8>] (platform_drv_probe+0x48/0x94)

Has commit 71dd6c0dff51b5f1 ("net: phy: add support for
reset-controller") been tested with an actual reset present?

Are Ethernet drivers not (no longer) allowed to register MDIO busses?

Thanks!

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds

--8323329-1988560550-1574246171=:25420--
