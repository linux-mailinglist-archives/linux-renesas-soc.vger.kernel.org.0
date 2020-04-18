Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAD951AEB9B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 Apr 2020 12:15:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725873AbgDRKPN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 18 Apr 2020 06:15:13 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:33803 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbgDRKPM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 18 Apr 2020 06:15:12 -0400
Received: from mail-qk1-f170.google.com ([209.85.222.170]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MGiAs-1jTc7A3CwE-00Dr3C; Sat, 18 Apr 2020 12:15:10 +0200
Received: by mail-qk1-f170.google.com with SMTP id o19so5242762qkk.5;
        Sat, 18 Apr 2020 03:15:10 -0700 (PDT)
X-Gm-Message-State: AGi0PuYtSHpzsDtVHvPiWaqh1v8gu4R4yZk0IXkC+HAjdPDN4SFBlYWx
        j1jueSmaH5kU7tlr8eoXGsWBb8ojTTCh6q/0VSw=
X-Google-Smtp-Source: APiQypL1jKipNiUeVhJwOl5M66Nh/Js4Ri2A5sesKsfarSq7XUVbX7iQCpooHjQjUDKJS1y25aYqQR4IWZNujIQYHPw=
X-Received: by 2002:a37:851:: with SMTP id 78mr7389692qki.352.1587204909605;
 Sat, 18 Apr 2020 03:15:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200417155553.675905-1-arnd@arndb.de> <20200417155553.675905-2-arnd@arndb.de>
 <877dydp0ih.fsf@belgarion.home>
In-Reply-To: <877dydp0ih.fsf@belgarion.home>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sat, 18 Apr 2020 12:14:52 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3DD3qy=SkZjy=X3+1ooHUcXEWu05JApeeyoQN4VOntCQ@mail.gmail.com>
Message-ID: <CAK8P3a3DD3qy=SkZjy=X3+1ooHUcXEWu05JApeeyoQN4VOntCQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] fbdev: w100fb: clean up mach-pxa compile-time dependency
To:     Robert Jarzmik <robert.jarzmik@free.fr>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Saeed Mahameed <saeedm@mellanox.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Marek Vasut <marex@denx.de>,
        Stefan Agner <stefan@agner.ch>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Thomas Hellstrom <thellstrom@vmware.com>, jfrederich@gmail.com,
        dsd@laptop.org, Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:C7LUWdDKE8i7k34GUv8ahQ5BlPV6VjKxXVVp40Iv4hchsC1zPN1
 tdeNOnBzfdebdCZfEW5PUe3eostBH+9P7Bk0BX8K+ShhVAApwz2yerMh/1A312UaKTni2wf
 rAE5VEL/Y/shh6g1tJxB6/KhwTuU7QeBffdqqctlJuWs9mEY1cLciTwbl44XO52aSrn5IqC
 wSov5S/bntWGlDiIHMvSA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HJZdkyWszkw=:VoM6+CIgxAyRTRyzNS3x9i
 DqhEZ/25ZJc1Q+iHOipUBQLJWgP0RiRooMz8317Fo8JTjWTmcKAbJ46twY5eqd7CwXyBI2tZi
 Ywrz7QO+PSgIaf0bCWqP8DfUgh5d/b0UiiKg/6dzkmkgRbA34WO1G55nt8LL2PfUQXcj8rN/M
 YCrcx8QGF+DM4gS0QHeVNe4kr7h3E1R1kt0k5oznKCyfPhqn0wYdon3fpPQz+SSvq3q9Hji4X
 Of9iJ6BV6xmxMjl/kad9IHN1DykeL6e5yQ6lm7ng6McKq5Nl6lNYOa7dylLwbYxOUVuGUgBAe
 Xx9Zh/8dRPpGU1eyUrRlb3PRYwa83mzms8T8vRN04z50ZeP81AGABTffaGAX+ApYSwQbcrDMd
 hkSlXhe/z9pjNtPXri3eaxJdFd235CSSaNxkRDu8eba7Ltrnve9ERl+9ToymaRURjI6HjDkGR
 QdNo39na8JhL0Xhdy/TOo9tMd2Y3a6NUsErtf6z08gVOBHKso4X5sgijWS2PNuqSnWtor94MO
 20P8Y0QiZgyzFuzyk8Bzs/Qi1aElY+J0SSEQiKJZQ2DnrDC+71S0wWxuzqZgjI6riRfZLHAcb
 r0fjP87W93d2J1lb3wbLsgtTstcjfuSsj1+ABEjhVit5+7LpiAZ6R5EPdGshs3mxcvYnpcGcC
 akR1GjbST7F2m4G28KtvZr1oBn82HN1SIpYchZkW95BTVRAEDg6ckiY4ec/PXDBRDK1kP+98R
 yQQvkIUsiPWynz8JL58Xwl3NDaJR4cEq39Z/KTDU3dxTIZ0B7QCyRxdXWORh0lgMfsgR9qhBx
 SFHWdZkxZ/fcqQx1HObwyCiJE1sTqqAbqWVkYJjS6/tVjpQtvU=
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Apr 18, 2020 at 12:11 PM Robert Jarzmik <robert.jarzmik@free.fr> wrote:
>
> Arnd Bergmann <arnd@arndb.de> writes:
>
> Hi Arnd,
>
> > diff --git a/arch/arm/mach-pxa/Kconfig b/arch/arm/mach-pxa/Kconfig
> > index f60bc29aef68..8444d40df1b3 100644
> > --- a/arch/arm/mach-pxa/Kconfig
> > +++ b/arch/arm/mach-pxa/Kconfig
> > @@ -549,9 +549,6 @@ config MACH_ICONTROL
> >
> >  config ARCH_PXA_ESERIES
> >       bool "PXA based Toshiba e-series PDAs"
> > -     select FB_W100
> > -     select FB
> > -     select PXA25x
> This last line puzzles me a bit in this patch. Why removing the PXA25x select ?

It's a mistake, fixed now. Thanks for taking a look!

      Arnd
