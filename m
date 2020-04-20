Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD391B0DBB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2020 16:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729186AbgDTODq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Apr 2020 10:03:46 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:44553 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729232AbgDTODp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Apr 2020 10:03:45 -0400
Received: from mail-qt1-f170.google.com ([209.85.160.170]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MGgRW-1jVSgu3hEw-00DmBV; Mon, 20 Apr 2020 16:03:43 +0200
Received: by mail-qt1-f170.google.com with SMTP id i68so2759380qtb.5;
        Mon, 20 Apr 2020 07:03:42 -0700 (PDT)
X-Gm-Message-State: AGi0PubTsHfUJTGyjIQpGA68Zt1APy1DQvAqTx+ljchUJcREp2BiQAbI
        PmxM/3VOAj4zgjtUGQqIx48+Z0Cp6AY74GzFJvE=
X-Google-Smtp-Source: APiQypLgkJfmxem3QQ9mpbfFVWX2Eq7VL/YOi+A92q5vGjWEyme3hEEzHhZFQKp66z7ucvnd+DcBNLfbLLeJTWKGjvs=
X-Received: by 2002:ac8:4e2c:: with SMTP id d12mr15982609qtw.204.1587391419935;
 Mon, 20 Apr 2020 07:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200417155553.675905-1-arnd@arndb.de> <20200417171453.GS3456981@phenom.ffwll.local>
 <20200417190854.GI26002@ziepe.ca> <87y2qq1smt.fsf@intel.com>
In-Reply-To: <87y2qq1smt.fsf@intel.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 20 Apr 2020 16:03:23 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0eSHg6Hx-FqpEF-N4LhZjv4o3PooK2eKw7KTntoKKckQ@mail.gmail.com>
Message-ID: <CAK8P3a0eSHg6Hx-FqpEF-N4LhZjv4o3PooK2eKw7KTntoKKckQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] drm, fbdev: rework dependencies
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>, Daniel Vetter <daniel@ffwll.ch>,
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
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:XYpPEowGBic5ViFz4y/2vD4ZWnw0Bohpv+ZMeSM8zAlUYOuxUN8
 +0cV2i2oXElW6hYefOe1zr0UafbVM/VT2cFCq5Zzdm1URJ8lUF9ungPP0THbSxDKV8k0FnG
 EOHoMI5thdL/xSQkrqbntuL2JRA9MDYCNmoj7dh7M68rXyt1sGLfhRbY9ZVoxDLlse6eKZ3
 /LiB7eUiqw1rNO7PA+HrQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CKLnD3dRH2E=:IYTHOahRjPt6GZlkQr3kTo
 SupatZpq0gzaXs/xTBYYYLhj0ZmNxceljfaUuNHBSvbW6uXv6bIqZInP6HjTcDr7lRh5l7F67
 3VKaK79TlsjYzU1srQ1N21CB7D9QWGol/gbCuQ/olvnKZ/unsuz/zqs8KIvls15G5etNxqAaz
 eH6RcHsIVaY5QIACK9eonKHopOdSQnDjJycNtTZQccVTf15jJDUo6s6gla5Mi/F1AI+8FJeb1
 pV7Tn5xhEvO3rPQJbgDADOHiZDv5Gdc7honyDQzim31ZFB1x8+VtQTKIk0STD+UAqQoVZwra+
 sQdiic7iITgTqyAv8Wozt2ojGv4ym24L9vKPJaHizvb8u8Czx3/uPODztUUEh2752zrcxdIwg
 ZDxPrLmyYfOWRpivYso28aKg7CYGljl2EjsP/iA2ygerb7o8n7B0CdUIszfMHbjTbNEqW9WIo
 Yev3AwrjIsUKNG5c93O8YiyWfih452zEaXoU6tDbEGg0Fp9P61HxQ2UtH8x4ebLw/X4r53O2k
 QvLzSWW4qq38V3FwGhJ0c5Nbq74mjb0uanu37PgqT2VJma3zDRhubM6/rsF8VR7V1iFSx8CTV
 W095LsaQfuF1azVEz+XWas9ghpYgbXBfTFVqKIW9Yys0+POGoNvG3rAouBLqsvkqAolvNClxg
 AvEyBimpVJJxKwU0EWi5Q8FLeqUtI0t+L4VDiZrXQS6qjuyjTVeaiBOdKXovTnOUhBePqG47p
 Z2/+nc+rUj1Cq2GpF2Z7DwJ8u+ZP34mblQwlqNMTW4RD0z5TX+Prj5KEaPcbifCP4lSqarF97
 hHdN0ufuW1wlTUf0be7EfJrjRPTyqH/CSG/aHFWviByi9PRNQk=
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 20, 2020 at 10:14 AM Jani Nikula
<jani.nikula@linux.intel.com> wrote:
> On Fri, 17 Apr 2020, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > On Fri, Apr 17, 2020 at 07:14:53PM +0200, Daniel Vetter wrote:
> >> On Fri, Apr 17, 2020 at 05:55:45PM +0200, Arnd Bergmann wrote:
> >> >
> >> > If we can agree on these changes, maybe someone can merge them
> >> > through the drm-misc tree.
> >> >
> >> > Please review
> >>
> >> Biggest concern I have is that usability of make menuconfig is horrible,

No doubt about that, but that seems to be unrelated to the cleanup.

> >> and it's very hard to find options that are hidden by depends on. You can
> >> use the search interface, if you happen to know the option.
> >>
> >> Once you've surmounted that bar, the next one is trying to find what
> >> exactly you need to enable. Which again means endless of recursive
> >> screaming at Kconfig files, since make menuconfig doesn't help you at all.

The changes I'm doing are mostly for fbdev, which is currently the
odd one out. Most kernel subsystems today follow the documented
recommendations and only use 'depends on' for things they
depend on.

Having fbdev be the exception causes two problems:

- It does not make kconfig any easier to use overall, just less consistent
  when it is the only thing that implicitly turns on dependencies and
  for everything else one still has to look up what the dependencies are.

- Most of the problems with circular dependencies come from mixing
  the two methods, and most of the cases where they have caused
  problems in the past involve fbdev in some way.

I also doubt switching lots of 'depends on' to 'select' all over Kconfig
would improve the situation on a global level. It would simplify the
problem of turning something on without understanding the what it
does, but in turn it makes it harder to turn off something else.

E.g. today it is hard to turn off fbdev because that is selected by a
number of (partly unrelated) options, but there was a recent discussion
about getting distros to stop enabling fbdev out of security concerns.

> I'm really all for switching to using depends when that is the
> semantically right thing to do. In many places using select is a hack to
> make the UI simpler, and that's just plain wrong. We'll be doomed to
> perpetual randconfig build failures and duct tape fixes.
>
> I'm pretty tired of this, and I regularly ignore those duct tape fixes
> to i915 backlight build issues on some bizarre configs that nobody will
> ever use, and would not exist if depends were used throughout.
>
> I'm fine with select but only when it's restricted to symbols that have
> no dependencies of their own and have no UI. This is in line with
> Documentation/kbuild/kconfig-language.rst. Not enforcing this is another
> Kconfig tool shortcoming.

Agreed, that is generally a good rule.

      Arnd
