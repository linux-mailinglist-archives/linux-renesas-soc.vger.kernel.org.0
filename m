Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 654B11AE586
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2020 21:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729765AbgDQTI7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Apr 2020 15:08:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730191AbgDQTI4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Apr 2020 15:08:56 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 962D8C061A0F
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2020 12:08:56 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id l25so3625898qkk.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2020 12:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZQhy489OjssnVOvD6kvurmA3AIks5bQMEPnQ8xp2xFg=;
        b=pV+43fstjAtSTBJujlpMRb3PnaAdhK49JGeZx0mtsPWi0i5zyh/GIe07lQH636PX1h
         RIWPKiapAktc0jQ13zOFSG5h5Vu5T812FdS46BdspmXMV3vumTY7mMzYQrGq/QGjJHaj
         8I3kGiLdXDNidC3ZcSfGE4o+dTcl1qSgRhReF0w9RPtYx3SOyRj689V2lKNcpG164NFG
         YObWePcqJSeXel5QsVuD2l+dRSLbjvMjJj9eDGBIJ4J5ZHwCtOAtWEgOVdjfrzn0hdSN
         3ndnpfaaIt4YYrWhrybrpcRqKPWqDuR20RBEuyJZYSRcD/2I7Q607h7BQ21xVKN0uXCO
         wB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZQhy489OjssnVOvD6kvurmA3AIks5bQMEPnQ8xp2xFg=;
        b=Z/N0gTGyCq4B1klnMrfqC+vwXwjp4p6DY75DPxCrykn8TxfuuMmXSIrhhtDIHFf4BS
         9g2fcz+Cox1m0XxJvEm6qOG+LUHh2FE1JW7JRodfh4pfYeS6uCp/R7tZYSOFwIbLuCHT
         4wLSJd680hgOIiBbFA9f0uwTvgd/qTk2nh+kvUrZwtWFS9K6Pq6N/KNvCWjsVdEPHzzh
         8fUKPp8o0cKpmzjzc7XnS5zwHxWa4Tyox03cSNRsWXYzp+JmgNuxyRwrK8SATv7rkTSK
         AYDtmQhuRiAyCQNdnpBOXdV0niL8dmDxLEZss/K6njXE1pDzsLQg81D++jhaZAu3ntSY
         APIw==
X-Gm-Message-State: AGi0PuYJru1wkgRvj3KzYCPBrSMkdUduxE+661Y7gwHbO25bcwwa2bc9
        B/o9/+8gq5mN7s2uVRkmSuf0Rw==
X-Google-Smtp-Source: APiQypKA07MEDcxRiPNxIYGcNyFxt8xoAoygqSmYVhzwxCcBpIf9Uy0CgboqxeZKDdhDPJ7gd+xFoQ==
X-Received: by 2002:a37:44a:: with SMTP id 71mr4857241qke.114.1587150535689;
        Fri, 17 Apr 2020 12:08:55 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id j9sm766287qkk.99.2020.04.17.12.08.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Apr 2020 12:08:55 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jPWMA-0004ar-El; Fri, 17 Apr 2020 16:08:54 -0300
Date:   Fri, 17 Apr 2020 16:08:54 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
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
Message-ID: <20200417190854.GI26002@ziepe.ca>
References: <20200417155553.675905-1-arnd@arndb.de>
 <20200417171453.GS3456981@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417171453.GS3456981@phenom.ffwll.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 17, 2020 at 07:14:53PM +0200, Daniel Vetter wrote:
> On Fri, Apr 17, 2020 at 05:55:45PM +0200, Arnd Bergmann wrote:
> > I tried to fix up some dependencies after the sii8620 "imply EXTCON"
> > statementn broke, trying a few things but in the backing out a
> > change that would completely reverse the LEDS_CLASS selects into
> > a 'depends on'. 
> > 
> > However, what I got now are multiple changes that remove gratious
> > "selects" that lead to circular dependencies for sii8620 and others:
> > 
> > - Anything doing "select FB" is now gone, or becomes "depends on FB",
> > 
> > - DDC support depends on I2C instead of selecting it
> > 
> > - backlight class device support is never selected by framebuffer
> >   drivers but has proper dependencies
> > 
> > I have done thousands of randconfig build tests on this, but no
> > runtime tests.
> > 
> > Some of the 'depends on FOO || !FOO' statements could be simplified
> > into a new 'uses FOO' syntax based on a patch from Saeed Mahameed,
> > but I would for the moment treat that as a cleanup that can be done
> > later.
> > 
> > If we can agree on these changes, maybe someone can merge them
> > through the drm-misc tree.
> > 
> > Please review
> 
> Biggest concern I have is that usability of make menuconfig is horrible,
> and it's very hard to find options that are hidden by depends on. You can
> use the search interface, if you happen to know the option.
> 
> Once you've surmounted that bar, the next one is trying to find what
> exactly you need to enable. Which again means endless of recursive
> screaming at Kconfig files, since make menuconfig doesn't help you at all.

+1 on this. But this is a general kconfig problem, and not unique to
DRM, I've done this screaming for many different things now.. eg to
turn on every single RDMA driver.

I hackily delt with it by creating this rather insane script based on
the python kconfiglib to try and sort things out mostly automatically:

https://github.com/jgunthorpe/Kernel-Maintainer-Tools/blob/master/gj_tools/cmd_kconfig.py

It would be great if menuconfig had a key to say 'hey, really, turn
this on and everything it depends on, recursively'

Jason
