Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 431B31B25F9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2020 14:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728677AbgDUM1d (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Apr 2020 08:27:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728422AbgDUM1c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Apr 2020 08:27:32 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08297C061A41
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Apr 2020 05:27:30 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id v8so2418560wma.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Apr 2020 05:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qmU6VDakv65FJJosETAWKCa3cyDJLx7WYQNvdAP44Tc=;
        b=EAg0osLEXbJbWQm56pz5XD/2fbzlf5SovRIg5pAvRfRyfFO2ffE2Lpu3rRDGKaDsxq
         jFGbPaQbuSXwz1XKPN9r2TKQ1/NSMgY3CmMa7vSSJc2p9+GrbpWtZ0iZN/lbzEmhq1oR
         Rau8FDs4Jhb1sQ3m3Ip5VwijA0ScmDaZRGUT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qmU6VDakv65FJJosETAWKCa3cyDJLx7WYQNvdAP44Tc=;
        b=Z1JMce7IxqvVCCrbFElOo677VC5fWCdJXjzdF5cRoNKPI98q4xq41CRnBb6Xkn7/xk
         9JUZ86v8ZMhWSMUM35pimdbc67QzMlT04PpoB0yaEw7QFc3DI+InYB0E1NkQZSBEjPfy
         8I3mKiW1UObl89xdQLze1JI8RsJJiF5+n2vh4XLRZDe3TbAG0EIuB+uIZOlat2eExEaN
         Dmdx8w/vk/woB2I3Y+fcp1Rce722cpfdq27oujpEJzWs2ZPeblzxfzUwXomDQ2KR9Tk5
         guIB7j15YmaUayKq/MtmHZR8aq1rxiowXWObcbax5ExtGm++MC08pHdj4T7QVAGYYb/a
         1M6A==
X-Gm-Message-State: AGi0PuYyO3isFSDkiRgSAwYdNhvcN35fJ9DwPv6z6xJKYWC/8BYi44ma
        IxrVjcWxsifk1pluCWAn4I1iAA==
X-Google-Smtp-Source: APiQypJU5xpo8/LAIgPDWow0ew55pmwU5prJYaxGXB+BkqZ9w31v+W9HGZG0ezIJsqD8WKBNwhKFfA==
X-Received: by 2002:a05:600c:4096:: with SMTP id k22mr4294659wmh.99.1587472049580;
        Tue, 21 Apr 2020 05:27:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id n6sm3734848wrs.81.2020.04.21.05.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 05:27:28 -0700 (PDT)
Date:   Tue, 21 Apr 2020 14:27:26 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Daniel Vetter <daniel@ffwll.ch>,
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
        Thomas Hellstrom <thellstrom@vmware.com>, jfrederich@gmail.com,
        dsd@laptop.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/8] drm, fbdev: rework dependencies
Message-ID: <20200421122726.GW3456981@phenom.ffwll.local>
References: <20200417155553.675905-1-arnd@arndb.de>
 <20200417171453.GS3456981@phenom.ffwll.local>
 <20200417190854.GI26002@ziepe.ca>
 <87y2qq1smt.fsf@intel.com>
 <CAK8P3a0eSHg6Hx-FqpEF-N4LhZjv4o3PooK2eKw7KTntoKKckQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0eSHg6Hx-FqpEF-N4LhZjv4o3PooK2eKw7KTntoKKckQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 20, 2020 at 04:03:23PM +0200, Arnd Bergmann wrote:
> On Mon, Apr 20, 2020 at 10:14 AM Jani Nikula
> <jani.nikula@linux.intel.com> wrote:
> > On Fri, 17 Apr 2020, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > On Fri, Apr 17, 2020 at 07:14:53PM +0200, Daniel Vetter wrote:
> > >> On Fri, Apr 17, 2020 at 05:55:45PM +0200, Arnd Bergmann wrote:
> > >> >
> > >> > If we can agree on these changes, maybe someone can merge them
> > >> > through the drm-misc tree.
> > >> >
> > >> > Please review
> > >>
> > >> Biggest concern I have is that usability of make menuconfig is horrible,
> 
> No doubt about that, but that seems to be unrelated to the cleanup.
> 
> > >> and it's very hard to find options that are hidden by depends on. You can
> > >> use the search interface, if you happen to know the option.
> > >>
> > >> Once you've surmounted that bar, the next one is trying to find what
> > >> exactly you need to enable. Which again means endless of recursive
> > >> screaming at Kconfig files, since make menuconfig doesn't help you at all.
> 
> The changes I'm doing are mostly for fbdev, which is currently the
> odd one out. Most kernel subsystems today follow the documented
> recommendations and only use 'depends on' for things they
> depend on.
> 
> Having fbdev be the exception causes two problems:
> 
> - It does not make kconfig any easier to use overall, just less consistent
>   when it is the only thing that implicitly turns on dependencies and
>   for everything else one still has to look up what the dependencies are.
> 
> - Most of the problems with circular dependencies come from mixing
>   the two methods, and most of the cases where they have caused
>   problems in the past involve fbdev in some way.
> 
> I also doubt switching lots of 'depends on' to 'select' all over Kconfig
> would improve the situation on a global level. It would simplify the
> problem of turning something on without understanding the what it
> does, but in turn it makes it harder to turn off something else.
> 
> E.g. today it is hard to turn off fbdev because that is selected by a
> number of (partly unrelated) options, but there was a recent discussion
> about getting distros to stop enabling fbdev out of security concerns.

I've done some history digging, this is the patch that started this all:

commit d2f59357700487a8b944f4f7777d1e97cf5ea2ed
Author: Ingo Molnar <mingo@elte.hu>
Date:   Thu Feb 5 16:03:34 2009 +0100

    drm/i915: select framebuffer support automatically

I.e. driver gets disabled because a new config is added which isn't
enabled. System doesn't boot, maintainer gets angry regression report,
select hack gets added.

Note on the specific example the code has been reworked enough that even
if you'd upgrade the kernel all that would get disabled now is the fbdev
emulation on top of drm drivers, not any of the drm drivers.

The above says we should have an automatic system for at least oldconfig
(but would be nice in menuconfig too), since "break user's kernel on
upgrade" isn't an option. And without that select is going to come back
somewhere and make a huge nasty mess: We're definitely not going to
fix Kconfig when fixing a regression in -rc kernels.

So in theory no need to convince me that select is terrible. Practice
disagrees unfortunately.
-Daniel

> 
> > I'm really all for switching to using depends when that is the
> > semantically right thing to do. In many places using select is a hack to
> > make the UI simpler, and that's just plain wrong. We'll be doomed to
> > perpetual randconfig build failures and duct tape fixes.
> >
> > I'm pretty tired of this, and I regularly ignore those duct tape fixes
> > to i915 backlight build issues on some bizarre configs that nobody will
> > ever use, and would not exist if depends were used throughout.
> >
> > I'm fine with select but only when it's restricted to symbols that have
> > no dependencies of their own and have no UI. This is in line with
> > Documentation/kbuild/kconfig-language.rst. Not enforcing this is another
> > Kconfig tool shortcoming.
> 
> Agreed, that is generally a good rule.
> 
>       Arnd

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
