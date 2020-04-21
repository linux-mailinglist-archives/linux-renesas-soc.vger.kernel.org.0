Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A9E01B2719
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2020 15:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728783AbgDUNFl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Apr 2020 09:05:41 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:42738 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726628AbgDUNFk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Apr 2020 09:05:40 -0400
Received: by mail-ot1-f65.google.com with SMTP id m18so11074930otq.9;
        Tue, 21 Apr 2020 06:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u5DExvBo38G1l7CS3d07O9ASSufA0ikjOsEXh8v/aIk=;
        b=IjQB80TUX4pH/0hHI1RDU962k17+b8PJgW4LPGbjjM0E6SmWE8QAyplDYh9rVRTZKj
         K8/oYAsjOJwJp0M65cs7pINKtJqYsT++ktZItioAJwiJjsHMGhzT5lO3FA9nd7iExMei
         rmXEBdeGeGRSljmup/sMh6N4q8l6dslrrq9RoelAneZC56/6FH+jP2/s2pzfbrCs/dYL
         JaAuw6XaPD3WRLIGaqQ5IqE35aj+0X68pfjsG7kwe9jwrgtLo2I9Wmc9M5yC38lbJ34j
         NdkcbakbN9drQx1/Lq9C0BS9KQHwDkZHxPmICetLIiSDpou834nM/FRlsE7Z9dAsFpND
         Ko5A==
X-Gm-Message-State: AGi0PuYGxHAm29TnkGIhFSBlV4A6ti65NfCksHNoFyqRHSFltnRK9ZNR
        9B0tobWSCeYms3XpU8TeaRao0BCMVqHtrFHQSwY=
X-Google-Smtp-Source: APiQypKHoIJ8hh2h9TD+sqqQnfOcTdFsBjWGnrF00NrCj6XZCItuYtEcKwSNqrUTPczYowDOJRtqwjDo9MFkZ5zQETs=
X-Received: by 2002:a9d:76c7:: with SMTP id p7mr13163470otl.145.1587474337810;
 Tue, 21 Apr 2020 06:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200417155553.675905-1-arnd@arndb.de> <20200417171453.GS3456981@phenom.ffwll.local>
 <20200417190854.GI26002@ziepe.ca> <87y2qq1smt.fsf@intel.com>
 <CAK8P3a0eSHg6Hx-FqpEF-N4LhZjv4o3PooK2eKw7KTntoKKckQ@mail.gmail.com>
 <20200421122726.GW3456981@phenom.ffwll.local> <87a735yp0f.fsf@intel.com>
In-Reply-To: <87a735yp0f.fsf@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 21 Apr 2020 15:05:26 +0200
Message-ID: <CAMuHMdXRwRe5p65+YM69HDM4BhW+ZuHUju9B9083+=HdCotsqw@mail.gmail.com>
Subject: Re: [PATCH 0/8] drm, fbdev: rework dependencies
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>,
        Jason Gunthorpe <jgg@ziepe.ca>,
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
        dsd@laptop.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jani,

On Tue, Apr 21, 2020 at 2:58 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Tue, 21 Apr 2020, Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Mon, Apr 20, 2020 at 04:03:23PM +0200, Arnd Bergmann wrote:
> >> On Mon, Apr 20, 2020 at 10:14 AM Jani Nikula
> >> <jani.nikula@linux.intel.com> wrote:
> >> > On Fri, 17 Apr 2020, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >> > > On Fri, Apr 17, 2020 at 07:14:53PM +0200, Daniel Vetter wrote:
> >> > >> On Fri, Apr 17, 2020 at 05:55:45PM +0200, Arnd Bergmann wrote:
> >> > >> >
> >> > >> > If we can agree on these changes, maybe someone can merge them
> >> > >> > through the drm-misc tree.
> >> > >> >
> >> > >> > Please review
> >> > >>
> >> > >> Biggest concern I have is that usability of make menuconfig is horrible,
> >>
> >> No doubt about that, but that seems to be unrelated to the cleanup.
> >>
> >> > >> and it's very hard to find options that are hidden by depends on. You can
> >> > >> use the search interface, if you happen to know the option.
> >> > >>
> >> > >> Once you've surmounted that bar, the next one is trying to find what
> >> > >> exactly you need to enable. Which again means endless of recursive
> >> > >> screaming at Kconfig files, since make menuconfig doesn't help you at all.
> >>
> >> The changes I'm doing are mostly for fbdev, which is currently the
> >> odd one out. Most kernel subsystems today follow the documented
> >> recommendations and only use 'depends on' for things they
> >> depend on.
> >>
> >> Having fbdev be the exception causes two problems:
> >>
> >> - It does not make kconfig any easier to use overall, just less consistent
> >>   when it is the only thing that implicitly turns on dependencies and
> >>   for everything else one still has to look up what the dependencies are.
> >>
> >> - Most of the problems with circular dependencies come from mixing
> >>   the two methods, and most of the cases where they have caused
> >>   problems in the past involve fbdev in some way.
> >>
> >> I also doubt switching lots of 'depends on' to 'select' all over Kconfig
> >> would improve the situation on a global level. It would simplify the
> >> problem of turning something on without understanding the what it
> >> does, but in turn it makes it harder to turn off something else.
> >>
> >> E.g. today it is hard to turn off fbdev because that is selected by a
> >> number of (partly unrelated) options, but there was a recent discussion
> >> about getting distros to stop enabling fbdev out of security concerns.
> >
> > I've done some history digging, this is the patch that started this all:
> >
> > commit d2f59357700487a8b944f4f7777d1e97cf5ea2ed
> > Author: Ingo Molnar <mingo@elte.hu>
> > Date:   Thu Feb 5 16:03:34 2009 +0100
> >
> >     drm/i915: select framebuffer support automatically
> >
> > I.e. driver gets disabled because a new config is added which isn't
> > enabled. System doesn't boot, maintainer gets angry regression report,
> > select hack gets added.
>
> Gotta love a good commit message from a decade ago.
>
> First, it says it's a migration helper. And that the problem
> specifically is that the user has a working config *without* FB enabled
> as a starting point.
>
> Now, if the starting point for a new config *now* is less than ten years
> old, and it had i915 enabled, it'll also have FB enabled. Because
> select. The migration part has done its job, and I think we should be
> good to make some progress.

It will indeed work with "make oldconfig", as an old config with
CONFIG_DRM_I915 enabled will have CONFIG_FB set.

However, that is not true when starting with a defconfig that has
CONFIG_DRM_I915 enabled: such a defconfig will not have CONFIG_FB set,
due to the trimming process when creating a minimal defconfig.

Hence when making the change from "select FB" to "depends on FB", you
have to make sure to update the affected defconfigs, too:

$ git grep CONFIG_DRM_I915 -- "*defconfig*"
arch/x86/configs/i386_defconfig:CONFIG_DRM_I915=y
arch/x86/configs/x86_64_defconfig:CONFIG_DRM_I915=y

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
