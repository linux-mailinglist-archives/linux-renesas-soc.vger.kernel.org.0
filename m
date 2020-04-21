Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9480A1B27BD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2020 15:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728676AbgDUNZV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Apr 2020 09:25:21 -0400
Received: from mga09.intel.com ([134.134.136.24]:12133 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728859AbgDUNZU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Apr 2020 09:25:20 -0400
IronPort-SDR: th4UfbIgN6s0lyCNYD7T2x7RoGrHRDIepbJmertGTqLxNBnDIQhJi8aGCcPPqyUTb+AyAaeTYR
 kLjgtvsGFjfA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2020 06:25:20 -0700
IronPort-SDR: Pxwk5F1PYhQkqNU/uoogRvppqsRUhmVhKkJjfu2H8Ed6nQ0Mx8DgDU3PKrjQOHXJK0ImGAfP4z
 hO+lxJVr2a8Q==
X-IronPort-AV: E=Sophos;i="5.72,410,1580803200"; 
   d="scan'208";a="429528579"
Received: from parkernx-mobl.ger.corp.intel.com (HELO localhost) ([10.249.46.80])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2020 06:25:12 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Daniel Vetter <daniel@ffwll.ch>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Jason Gunthorpe <jgg@ziepe.ca>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Saeed Mahameed <saeedm@mellanox.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Thomas Hellstrom <thellstrom@vmware.com>,
        Jens Frederich <jfrederich@gmail.com>,
        Daniel Drake <dsd@laptop.org>
Subject: Re: [PATCH 0/8] drm, fbdev: rework dependencies
In-Reply-To: <CAKMK7uE7y8TVbZ8ExpDEA2MuvhSDxKQ6y=eDXSbwgjUzsbm44A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200417155553.675905-1-arnd@arndb.de> <20200417171453.GS3456981@phenom.ffwll.local> <20200417190854.GI26002@ziepe.ca> <87y2qq1smt.fsf@intel.com> <CAK8P3a0eSHg6Hx-FqpEF-N4LhZjv4o3PooK2eKw7KTntoKKckQ@mail.gmail.com> <20200421122726.GW3456981@phenom.ffwll.local> <87a735yp0f.fsf@intel.com> <CAMuHMdXRwRe5p65+YM69HDM4BhW+ZuHUju9B9083+=HdCotsqw@mail.gmail.com> <CAKMK7uE7y8TVbZ8ExpDEA2MuvhSDxKQ6y=eDXSbwgjUzsbm44A@mail.gmail.com>
Date:   Tue, 21 Apr 2020 16:25:09 +0300
Message-ID: <877dy9ynre.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 21 Apr 2020, Daniel Vetter <daniel@ffwll.ch> wrote:
> To clarify what I was aiming for with my mail: I'm not worried about
> fbdev here, I'm just worried that this will come back, and we'll grow
> select somewhere else until it's become a big & totally horrible mess.
> I think a lot of the backlight selects have also grown because of
> this, so this isn't just a one-off I think.
>
> If Arnd is happy to play "Kconfig select" whack-a-mole ever once in a
> while (and deal with the intermediate compile horrors while everyone
> upgrades) I'm ok with this landing. Just not terribly happy if the
> underlying issue isn't fixed.

And I'll keep ignoring the IS_REACHABLE() patches that make i915 build
with a config that should not exist. ;)

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
