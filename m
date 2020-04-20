Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51F8D1B03B5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2020 10:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbgDTICo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Apr 2020 04:02:44 -0400
Received: from mga12.intel.com ([192.55.52.136]:20584 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726054AbgDTICo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Apr 2020 04:02:44 -0400
IronPort-SDR: ze4geTdS44okCkVgIqe855DrLf2g4FWNnOp/HXW5ilMw4RMJMEWmrOPTR1YJF0TszXZwk454bl
 TPN2MIBUtJJw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2020 01:02:43 -0700
IronPort-SDR: FuTeOBDq3EWzERLG+wP/aJ56TVYKzRwUG7FrNE48/EOgCU8Fu6TO3rHp5dk/b68TrPcF0uOuYK
 rKUR5Cm2VpCQ==
X-IronPort-AV: E=Sophos;i="5.72,406,1580803200"; 
   d="scan'208";a="429035397"
Received: from iastakh-mobl.ccr.corp.intel.com (HELO localhost) ([10.252.63.229])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2020 01:02:36 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        marex@denx.de, dsd@laptop.org, Andrzej Hajda <a.hajda@samsung.com>,
        airlied@linux.ie, masahiroy@kernel.org,
        Nicolas Pitre <nico@fluxnic.net>,
        Saeed Mahameed <saeedm@mellanox.com>, thellstrom@vmware.com,
        haojian.zhuang@gmail.com, geert@linux-m68k.org,
        linux-renesas-soc@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
        kieran.bingham+renesas@ideasonboard.com,
        linux-graphics-maintainer@vmware.com,
        Laurent.pinchart@ideasonboard.com, jfrederich@gmail.com,
        robert.jarzmik@free.fr, daniel@zonque.org
Subject: Re: [PATCH 7/8] fbdev: rework backlight dependencies
In-Reply-To: <20200417170444.GB30483@ravnborg.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200417155553.675905-1-arnd@arndb.de> <20200417155553.675905-8-arnd@arndb.de> <20200417170444.GB30483@ravnborg.org>
Date:   Mon, 20 Apr 2020 11:02:33 +0300
Message-ID: <871roi37qe.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 17 Apr 2020, Sam Ravnborg <sam@ravnborg.org> wrote:
> Hi Arnd.
>
> On Fri, Apr 17, 2020 at 05:55:52PM +0200, Arnd Bergmann wrote:
>> Rather than having CONFIG_FB_BACKLIGHT select CONFIG_BACKLIGHT_CLASS_DEVICE,
>> make any driver that needs it have a dependency on the class device
>> being available, to prevent circular dependencies.
>> 
>> This is the same way that the backlight is already treated for the DRM
>> subsystem.
>
> I am not happy with the direction of this patch.
> It is not easy to understand that one has to enable backlight to
> be allowed to select a display or an fbdev driver.

Arguably that is a problem in Kconfig, and that applies to *all*
dependencies everywhere. It isn't something new to this patch.

For example, in the context of this patch you have:

  config HT16K33
	 tristate "Holtek Ht16K33 LED controller with keyscan"
	 depends on FB && OF && I2C && INPUT
 +	depends on BACKLIGHT_CLASS_DEVICE

The same thing could be said about FB and OF and IC2 and INPUT for
HT16K33, right? Why would *backlight* be the tipping point that makes
this difficult to understand?

Yeah, I agree it's not straightforward, but I think depends is the right
choice, not select.

The effort for making this easier to understand should be directed at
the various menuconfig tools to better highlight the dependencies that
should be enabled to let you enable other options.

> How about somthing like this:

I think this is a hack in Kconfig files that should really be fixed in
the Kconfig tooling instead. IMHO Kconfig should be as simple a
description of the dependencies as possible, not so much a UI language.

FWIW the patch is

Acked-by: Jani Nikula <jani.nikula@intel.com>

BR,
Jani.



-- 
Jani Nikula, Intel Open Source Graphics Center
