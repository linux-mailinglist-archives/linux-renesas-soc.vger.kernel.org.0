Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3CB41B040C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2020 10:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbgDTIOP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Apr 2020 04:14:15 -0400
Received: from mga11.intel.com ([192.55.52.93]:51570 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726200AbgDTION (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Apr 2020 04:14:13 -0400
IronPort-SDR: uyGw6ozG7EF01H2yT+BKAJLWcQpA0dM+s347lXYgIi7fkCsgPSbXt1LBYsMWpcRaczlfQXDPOi
 qakC0amIpUaw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2020 01:14:13 -0700
IronPort-SDR: GQi+lZ63AuQCCQCozaTBET02e0q31aTNZ8Mhwo8nHFR6eJJau/IulOjjXySYruUpzlKYn8Glfu
 dahNvYB8YH7A==
X-IronPort-AV: E=Sophos;i="5.72,406,1580803200"; 
   d="scan'208";a="429039579"
Received: from iastakh-mobl.ccr.corp.intel.com (HELO localhost) ([10.252.63.229])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2020 01:14:05 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Jason Gunthorpe <jgg@ziepe.ca>, Daniel Vetter <daniel@ffwll.ch>
Cc:     Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Saeed Mahameed <saeedm@mellanox.com>, masahiroy@kernel.org,
        Laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@zonque.org, haojian.zhuang@gmail.com,
        robert.jarzmik@free.fr, marex@denx.de, stefan@agner.ch,
        linux-graphics-maintainer@vmware.com, thellstrom@vmware.com,
        jfrederich@gmail.com, dsd@laptop.org, geert@linux-m68k.org
Subject: Re: [PATCH 0/8] drm, fbdev: rework dependencies
In-Reply-To: <20200417190854.GI26002@ziepe.ca>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200417155553.675905-1-arnd@arndb.de> <20200417171453.GS3456981@phenom.ffwll.local> <20200417190854.GI26002@ziepe.ca>
Date:   Mon, 20 Apr 2020 11:14:02 +0300
Message-ID: <87y2qq1smt.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 17 Apr 2020, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> On Fri, Apr 17, 2020 at 07:14:53PM +0200, Daniel Vetter wrote:
>> On Fri, Apr 17, 2020 at 05:55:45PM +0200, Arnd Bergmann wrote:
>> > I tried to fix up some dependencies after the sii8620 "imply EXTCON"
>> > statementn broke, trying a few things but in the backing out a
>> > change that would completely reverse the LEDS_CLASS selects into
>> > a 'depends on'. 
>> > 
>> > However, what I got now are multiple changes that remove gratious
>> > "selects" that lead to circular dependencies for sii8620 and others:
>> > 
>> > - Anything doing "select FB" is now gone, or becomes "depends on FB",
>> > 
>> > - DDC support depends on I2C instead of selecting it
>> > 
>> > - backlight class device support is never selected by framebuffer
>> >   drivers but has proper dependencies
>> > 
>> > I have done thousands of randconfig build tests on this, but no
>> > runtime tests.
>> > 
>> > Some of the 'depends on FOO || !FOO' statements could be simplified
>> > into a new 'uses FOO' syntax based on a patch from Saeed Mahameed,
>> > but I would for the moment treat that as a cleanup that can be done
>> > later.
>> > 
>> > If we can agree on these changes, maybe someone can merge them
>> > through the drm-misc tree.
>> > 
>> > Please review
>> 
>> Biggest concern I have is that usability of make menuconfig is horrible,
>> and it's very hard to find options that are hidden by depends on. You can
>> use the search interface, if you happen to know the option.
>> 
>> Once you've surmounted that bar, the next one is trying to find what
>> exactly you need to enable. Which again means endless of recursive
>> screaming at Kconfig files, since make menuconfig doesn't help you at all.
>
> +1 on this. But this is a general kconfig problem, and not unique to
> DRM, I've done this screaming for many different things now.. eg to
> turn on every single RDMA driver.
>
> I hackily delt with it by creating this rather insane script based on
> the python kconfiglib to try and sort things out mostly automatically:
>
> https://github.com/jgunthorpe/Kernel-Maintainer-Tools/blob/master/gj_tools/cmd_kconfig.py
>
> It would be great if menuconfig had a key to say 'hey, really, turn
> this on and everything it depends on, recursively'

I'm really all for switching to using depends when that is the
semantically right thing to do. In many places using select is a hack to
make the UI simpler, and that's just plain wrong. We'll be doomed to
perpetual randconfig build failures and duct tape fixes.

I'm pretty tired of this, and I regularly ignore those duct tape fixes
to i915 backlight build issues on some bizarre configs that nobody will
ever use, and would not exist if depends were used throughout.

I'm fine with select but only when it's restricted to symbols that have
no dependencies of their own and have no UI. This is in line with
Documentation/kbuild/kconfig-language.rst. Not enforcing this is another
Kconfig tool shortcoming.

See also my reply to Sam [1].

BR,
Jani.


[1] https://lore.kernel.org/dri-devel/871roi37qe.fsf@intel.com/


-- 
Jani Nikula, Intel Open Source Graphics Center
