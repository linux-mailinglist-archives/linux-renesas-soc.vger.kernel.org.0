Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A74AD1AE65C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2020 21:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730752AbgDQT4E (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Apr 2020 15:56:04 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:54607 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730573AbgDQT4D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Apr 2020 15:56:03 -0400
Received: from mail-qk1-f173.google.com ([209.85.222.173]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Mgvan-1ilG7o2WD7-00hPvt; Fri, 17 Apr 2020 21:56:01 +0200
Received: by mail-qk1-f173.google.com with SMTP id j4so3730547qkc.11;
        Fri, 17 Apr 2020 12:56:01 -0700 (PDT)
X-Gm-Message-State: AGi0Pua16TpO7IO6aBrjvnGtFOitDTsFXcn1ZnNWBBQVtfJRd9EU5xZ/
        IF+oN/2OWHtZzE8VRIW/X1jseRAtjEO4bCvl+7w=
X-Google-Smtp-Source: APiQypL/aYirBTw1joqQ0inaCArzn25FqAScTc6+QUlF+iqIJ3O0t/oDB2nctjg42E3+diNZLCqFSq8zjwVtRBsHEo8=
X-Received: by 2002:a37:63d0:: with SMTP id x199mr4824368qkb.3.1587153360346;
 Fri, 17 Apr 2020 12:56:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200417155553.675905-1-arnd@arndb.de> <20200417155553.675905-8-arnd@arndb.de>
 <20200417170444.GB30483@ravnborg.org>
In-Reply-To: <20200417170444.GB30483@ravnborg.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 17 Apr 2020 21:55:43 +0200
X-Gmail-Original-Message-ID: <CAK8P3a31OMHOycpGv5tjQXS=NBGw+OoFRGQ0Za7QWw9=EcwgZg@mail.gmail.com>
Message-ID: <CAK8P3a31OMHOycpGv5tjQXS=NBGw+OoFRGQ0Za7QWw9=EcwgZg@mail.gmail.com>
Subject: Re: [PATCH 7/8] fbdev: rework backlight dependencies
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Marek Vasut <marex@denx.de>, dsd@laptop.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        Saeed Mahameed <saeedm@mellanox.com>,
        Thomas Hellstrom <thellstrom@vmware.com>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        jfrederich@gmail.com, Robert Jarzmik <robert.jarzmik@free.fr>,
        Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:wEEJn7F99+OGlPxCflW+3YQOpHT6O8sphxwbvN+EIcmfQksbL0R
 rXJ9L1/4W5SsXyD4SSaUwlaonD6khiESS+6VTjB8QGvE37OYw/402duqmQQusz42znSlBnV
 3VeoqVV3SgmDmfmhivFtGM1wRJQmEHsHOc1uW2644iUOyaelJglcHzMARB4tt2A1aN8LB/Q
 CcxaWq6GXkJw8ljukFt8Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ei+2RXyWy+E=:6giwmE6ceHRnce5U3IYJUI
 LXkJ101pA0vADCeDvInrvMhoju2zzT4ZZ3g1tYDof+lc8y4It8tnBS/n7elJQVNYiQaMdDykU
 4JaMMfiuiavLmeEE0rG0cwffj2k8+S247EpjQMH32MmAHFjjgsFxshQC8F5kQ9QpPWr6MoGOK
 DXdQdUcFr++iSuiUlcypR/8TpgIMpmq+NlIq0/X8lmpPzRa4Iinpp57FDOFEkKY9Q4YeIOS7v
 MKnBiAhmSVAb129QD4EbGv62uuPC4sY9KVvWGA/SC08cuqtWiK1N/Cm5HuPlCK+YxSG+mqTut
 SllQT0NTUiHpdc7Ilfm1/ZjjQv7ul5SPmQ1ZVLuEfbDXAOYC3wktE9VHr3fzBUzhzecGqMrKk
 FCC/cbhjb8WYTRzqfEei996vTKT08E2eB7o0Tc6W+dyBmpJuwKd5U37ye3AzqDW42fSV6GTMa
 3DJJUJC9UrGGsOoqWgymFA+tyMDXCPD7IhMn9LoD+jTtclFa+x+bN33EqItMi2e+6/Sqi0jLk
 im4Oatop2LeRoyjpQHrAT0M2r6XslCd0bkdg20yi5oldPwy2DPyqMZ7xUD3MK5HwT1jjpY+vn
 xcAvre5ZCFLLqFLP5vAzjOKwDmPthHUJEQ37eFdRhGhVSDrLtdIsnTAwgs8fi4mrhRjxD15uS
 J2Wtra3zy0A4soNpRzWzc90JVhtdQaXSCkQ9dFaGtnqHi5rC8F1tlC7zMaEjcPxd4Er5WmeQm
 OLenxdwE1zwzJ61VREZHfsPsyh5LjWDwkh+rA+bwh55PgB8psXFQq6VkRzsJXN7DKx+1+8wwu
 dMv6FiQ+i+WrL0T+Tv3D3oiQoZ8LesLJtrRJYjPfSedEWqiAEE=
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 17, 2020 at 7:04 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Arnd.
>
> On Fri, Apr 17, 2020 at 05:55:52PM +0200, Arnd Bergmann wrote:
> > Rather than having CONFIG_FB_BACKLIGHT select CONFIG_BACKLIGHT_CLASS_DEVICE,
> > make any driver that needs it have a dependency on the class device
> > being available, to prevent circular dependencies.
> >
> > This is the same way that the backlight is already treated for the DRM
> > subsystem.
>
> I am not happy with the direction of this patch.
> It is not easy to understand that one has to enable backlight to
> be allowed to select a display or an fbdev driver.
>
>
> How about somthing like this:
>
> config BACKLIGHT_CLASS_DEVICE
>         tristate
>         # Will enable backlight module
>         # Has no dependencies
>
> config  BACKLIGHT
>         bool "Backlight drivers"
>         # Will make the backlight drivers visible - a visibility option
>         # only
>
> All drivers outside video/backlight/ can then select
> BACKLIGHT_CLASS_DEVICE to get the backlight core
> module.
> Or in other words BACKLIGHT_CLASS_DEVICE is used as a sort
> of library symbol that gices us access to backlight functionality.

Right, this could work as long as nobody puts back any "depends on
BACKLIGHT_CLASS_DEVICE, but it does cause another problem: There
are a couple of drivers that can optionally use backlight support
or just leave it out depending on CONFIG_BACKLIGHT_CLASS_DEVICE.

Changing them to select the class device support unconditionally
would make it impossible to build those drivers without it.
Instead we could all need an individual Kconfig symbol, or use
have "select BACKLIGHT_CLASS_DEVICE if BACKLIGHT"
in each case, but I'm not sure if that's still a win over having a
simple 'depends on BACKLIGHT_CLASS_DEVICE'.

On a related note, the NEW_LEDS/LEDS_CLASS option probably
falls into the same category, and could also be done as you suggest.
At the moment, this has the problem that both symbols are user
visible and also frequently selected by device drivers (but not others),
which is causing another set of dependency issues.

      Arnd
