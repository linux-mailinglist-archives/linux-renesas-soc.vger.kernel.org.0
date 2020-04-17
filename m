Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FEF31AE66D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2020 22:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730714AbgDQUDn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Apr 2020 16:03:43 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:50301 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730573AbgDQUDm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Apr 2020 16:03:42 -0400
Received: from mail-qk1-f171.google.com ([209.85.222.171]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MLRDv-1jgvN811kZ-00IUBi; Fri, 17 Apr 2020 22:03:41 +0200
Received: by mail-qk1-f171.google.com with SMTP id 20so3758097qkl.10;
        Fri, 17 Apr 2020 13:03:40 -0700 (PDT)
X-Gm-Message-State: AGi0PubeYoSTSwzF+poNPihR3HrAtoSL5hFlcRuamLG+l6RR/VCa/59K
        u9yra79O4W44OF+HW0YZ9mo6M6BoqMwrwSjtxFE=
X-Google-Smtp-Source: APiQypLHfVPeC+1JXO+hQtzRoij/Dspk+56syykO4JIxxM0xU/k6yi10dsuOkecP305cfjfVJkIKTLwVZe6iZOZzqio=
X-Received: by 2002:a37:ba47:: with SMTP id k68mr5106432qkf.394.1587153820000;
 Fri, 17 Apr 2020 13:03:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200417155553.675905-1-arnd@arndb.de> <20200417155553.675905-7-arnd@arndb.de>
 <20200417165041.GA30483@ravnborg.org>
In-Reply-To: <20200417165041.GA30483@ravnborg.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 17 Apr 2020 22:03:23 +0200
X-Gmail-Original-Message-ID: <CAK8P3a14G=Mv3jpZRciTgsSDf4Bd3ZOAqFRN1cc2FLYbwZZcbw@mail.gmail.com>
Message-ID: <CAK8P3a14G=Mv3jpZRciTgsSDf4Bd3ZOAqFRN1cc2FLYbwZZcbw@mail.gmail.com>
Subject: Re: [PATCH 6/8] drm: decouple from CONFIG_FB
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
X-Provags-ID: V03:K1:TO6ODSgYwmb2Gu5VIv+AKB+yyA1Lkch8UNoH4UVa2ENF+Kf3E4e
 i7iMPOpG9/GleuAntxgzuU5bCtPxq+fIYGqnTRsm2fNIiFrnfmqCX00pIrVVO1IfCt1XZhn
 App+qPaosXrbe0C2wh3bglI+mJ8IfD8LgsKwlIFdoireiacUmCuAAmgiZxlZbQrXAjDlBys
 j7TAYbp4dUOCvwsftVNKA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9CZ3jjj3/HQ=:NfSaFCXKIKyHc1tbwbO/xt
 ExE1S/AfJkrL6WCNoppGEE3K5Hdf9HosMfCmABqd1/cNRevCSVNQR1rATW8miyrzvY2e2E+zr
 98V3LQwcec+Ot/nu4o0lGKKqtgYW/aZzymY64RcJbuHvGgJ3Np8zz6esBe1BxjePSyOn1GlJS
 3t8O+mxCqDNdMxJO+jA25Azle5mS8jsAcqSOO8tbwh7rF/72v7P2Z+Xgu66uk2Ts7lWiMNE0w
 3T/7w8C6Tay4h5IrRJ7YOv0I02mdgFaufI0cSFoe9QGZgKTRx0V9tqQcuVtM4jHUJiNx/iIhZ
 7KFPVAKnK+BPAsM+EXf6T2qeC8PVJVgecjBP6eIhvps6Q2IaUpqH7g6InF7MqjiHmrNnPENxA
 G+hf/VKv9Zzn6GijN3ZEfAHMVkZIKtBsrhcKV52GZPFtxG+T4zCPicjQ+03An3LoZSeods5jD
 5iIDWgTekKRwlv8zRWYZi82AaniBfGeHauYrevbLl/xBCH0L4WfwQGVslI7zR97r8MAb2Acsm
 1bcSjMp8P/Kg2szgcfyD0TwbDFpO0F9ysg0cyLKyO37r40yx5Je+iu6YIkwstfh7yJDFPM9T3
 7IpcuMjF8eNGovMODSwdUcEkY4WFLUxKbQd7W9Jnx+odJ5Gs7jLxwIzyBSJa6JcLfR9G2sefn
 wuK5vFZqL3jnddeZbdaeUgQfA9fY6TzbOgzLUM7d0szHQjHI8VwrBZr5WOY3LwZgs4jG4HNHR
 Z5RN+DmCo3WjlMWElffbsL/ssuqRfxOO9t52J5RKMQIV7+Smap/QLlykM6L7yCq17yiTIaA0r
 97j9T/YawK8x7k5wuHa7iAvI2gNUEs1OJMRwAqUkX0xGCZhye0=
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 17, 2020 at 6:50 PM Sam Ravnborg <sam@ravnborg.org> wrote:

>
> So what this try to say is that we cannot have FB a module while DRM is
> built-in (marked N in the above).

Correct

>
> Could you explain in the changelog why this combination is not good.
> (Or tell me if my analysis was flawed).

I agree in hindsight this was less obvious than I thought ;-)

Added this text to the changelog:

|  When CONFIG_FB is a loadable module, DRM_KMS_FB_HELPER cannot be
| part of the built-in subsystem, so add dependency to ensure this
| can only be enabled if the DRM module can successfully be linked.

and this comment in the Kconfig file:

@@ -112,7 +112,7 @@ config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
 config DRM_FBDEV_EMULATION
        bool "Enable legacy fbdev support for your modesetting driver"
        depends on DRM && FB
-       depends on FB=y || DRM=m
+       depends on FB=y || DRM=m # DRM_KMS_FB_HELPER links against FB
        select DRM_KMS_HELPER
        select DRM_KMS_FB_HELPER
        default y

Let me know if you think those changes are sufficient

> With this fixed (assuming I am right):
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Thanks!

        Arnd
