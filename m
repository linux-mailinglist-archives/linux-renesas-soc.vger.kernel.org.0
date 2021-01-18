Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 776D22FAA37
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Jan 2021 20:31:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390430AbhARTa7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Jan 2021 14:30:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:46506 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437257AbhARTau (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Jan 2021 14:30:50 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9698A22252;
        Mon, 18 Jan 2021 19:30:09 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1l1aE3-008abD-Dx; Mon, 18 Jan 2021 19:30:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 18 Jan 2021 19:30:02 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Saravana Kannan <saravanak@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kevin Hilman <khilman@baylibre.com>,
        John Stultz <john.stultz@linaro.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v1 5/5] driver core: Set fw_devlink=on by default
In-Reply-To: <CAMuHMdUUX22D7gV-LtDJ4jcxD=TD6soWzP=gUy4EqdFFAntoGA@mail.gmail.com>
References: <20201218031703.3053753-1-saravanak@google.com>
 <20201218031703.3053753-6-saravanak@google.com>
 <CAMuHMdWDAg6+utMDLunPXmVtnP+13G2s0E-Fcnkc9bkNBs-cEg@mail.gmail.com>
 <86db7747ea6d48eebbf40a5855240d14@kernel.org>
 <CAMuHMdUUX22D7gV-LtDJ4jcxD=TD6soWzP=gUy4EqdFFAntoGA@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <9773fac5a4d142684ecc87341ebe0b5d@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: geert@linux-m68k.org, saravanak@google.com, gregkh@linuxfoundation.org, rafael@kernel.org, kernel-team@android.com, linux-kernel@vger.kernel.org, Jisheng.Zhang@synaptics.com, khilman@baylibre.com, john.stultz@linaro.org, nsaenzjulienne@suse.de, yoshihiro.shimoda.uh@renesas.com, linux-renesas-soc@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2021-01-18 19:16, Geert Uytterhoeven wrote:
> Hi Marc,
> 
> On Mon, Jan 18, 2021 at 6:59 PM Marc Zyngier <maz@kernel.org> wrote:
>> On 2021-01-18 17:39, Geert Uytterhoeven wrote:
>> > On Fri, Dec 18, 2020 at 4:34 AM Saravana Kannan <saravanak@google.com>
>> > wrote:
>> >> Cyclic dependencies in some firmware was one of the last remaining
>> >> reasons fw_devlink=on couldn't be set by default. Now that cyclic
>> >> dependencies don't block probing, set fw_devlink=on by default.
>> >>
>> >> Setting fw_devlink=on by default brings a bunch of benefits
>> >> (currently,
>> >> only for systems with device tree firmware):
>> >> * Significantly cuts down deferred probes.
>> >> * Device probe is effectively attempted in graph order.
>> >> * Makes it much easier to load drivers as modules without having to
>> >>   worry about functional dependencies between modules (depmod is still
>> >>   needed for symbol dependencies).
>> >>
>> >> If this patch prevents some devices from probing, it's very likely due
>> >> to the system having one or more device drivers that "probe"/set up a
>> >> device (DT node with compatible property) without creating a struct
>> >> device for it.  If we hit such cases, the device drivers need to be
>> >> fixed so that they populate struct devices and probe them like normal
>> >> device drivers so that the driver core is aware of the devices and
>> >> their
>> >> status. See [1] for an example of such a case.
>> >>
>> >> [1] -
>> >> https://lore.kernel.org/lkml/CAGETcx9PiX==mLxB9PO8Myyk6u2vhPVwTMsA5NkD-ywH5xhusw@mail.gmail.com/
>> >> Signed-off-by: Saravana Kannan <saravanak@google.com>
>> >
>> > Shimoda-san reported that next-20210111 and later fail to boot
>> > on Renesas R-Car Gen3 platforms. No output is seen, unless earlycon
>> > is enabled.
>> >
>> > I have bisected this to commit e590474768f1cc04 ("driver core: Set
>> > fw_devlink=on by default").
>> 
>> There is a tentative patch from Saravana here[1], which works around
>> some issues on my RK3399 platform, and it'd be interesting to find
>> out whether that helps on your system.
>> 
>> Thanks,
>> 
>>          M.
>> 
>> [1]
>> https://lore.kernel.org/r/20210116011412.3211292-1-saravanak@google.com
> 
> Thanks for the suggestion, but given no devices probe (incl. GPIO
> providers), I'm afraid it won't help. [testing] Indeed.
> 
> With the debug prints in device_links_check_suppliers enabled, and
> some postprocessing, I get:
> 
>     255 supplier e6180000.system-controller not ready
>       9 supplier fe990000.iommu not ready
>       9 supplier fe980000.iommu not ready
>       6 supplier febd0000.iommu not ready
>       6 supplier ec670000.iommu not ready
>       3 supplier febe0000.iommu not ready
>       3 supplier e7740000.iommu not ready
>       3 supplier e6740000.iommu not ready
>       3 supplier e65ee000.usb-phy not ready
>       3 supplier e6570000.iommu not ready
>       3 supplier e6054000.gpio not ready
>       3 supplier e6053000.gpio not ready
> 
> As everything is part of a PM Domain, the (lack of the) system 
> controller
> must be the culprit. What's wrong with it? It is registered very early 
> in
> the boot:
> 
> [    0.142096] rcar_sysc_pd_init:442: of_genpd_add_provider_onecell() 
> returned 0

Yeah, this looks like the exact same problem. The devlink stuff assumes
that because there is a "compatible" property, there will be a driver
directly associated with the node containing this property.

If any other node has a reference to that first node, the dependency
will only get resolved if/when that first node is bound to a driver.
Trouble is, there are *tons* of code in the tree that invalidate
this heuristic, and for each occurrence of this we get another failure.

The patch I referred to papers over it by registering a dummy driver,
but that doesn't scale easily...

         M.
-- 
Jazz is not dead. It just smells funny...
