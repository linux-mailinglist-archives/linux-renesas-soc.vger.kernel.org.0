Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5A251AEBA0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 Apr 2020 12:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgDRKSl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 18 Apr 2020 06:18:41 -0400
Received: from smtp07.smtpout.orange.fr ([80.12.242.129]:49224 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725923AbgDRKSl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 18 Apr 2020 06:18:41 -0400
Received: from belgarion ([86.210.245.36])
        by mwinf5d13 with ME
        id UAJe220080nqnCN03AJeRj; Sat, 18 Apr 2020 12:18:39 +0200
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Sat, 18 Apr 2020 12:18:39 +0200
X-ME-IP: 86.210.245.36
From:   Robert Jarzmik <robert.jarzmik@free.fr>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     dri-devel@lists.freedesktop.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        linux-fbdev@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Saeed Mahameed <saeedm@mellanox.com>, masahiroy@kernel.org,
        Laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@zonque.org, haojian.zhuang@gmail.com, daniel@ffwll.ch,
        marex@denx.de, stefan@agner.ch,
        linux-graphics-maintainer@vmware.com, thellstrom@vmware.com,
        jfrederich@gmail.com, dsd@laptop.org, geert@linux-m68k.org
Subject: Re: [PATCH 2/8] fbdev/ARM: pxa: avoid selecting CONFIG_FB
References: <20200417155553.675905-1-arnd@arndb.de>
        <20200417155553.675905-3-arnd@arndb.de>
X-URL:  http://belgarath.falguerolles.org/
Date:   Sat, 18 Apr 2020 12:18:38 +0200
In-Reply-To: <20200417155553.675905-3-arnd@arndb.de> (Arnd Bergmann's message
        of "Fri, 17 Apr 2020 17:55:47 +0200")
Message-ID: <873691p05d.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Arnd Bergmann <arnd@arndb.de> writes:

> In order to add more compile-time dependencies to CONFIG_FB, remove the
> last few instances of selecting it from platform code.
>
> This was originally written to allow a modular driver, but that never
> worked because vmlinux cannot call exported functions from a loadable
> module.
>
> Just change the #ifdef check to what it should have been and remove
> the 'select' statement.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Hi Arnd,

Ok, so if you remove the select FB_PXA, I think there will be a couple of
defconfigs which _might_ break, namely :
	corgi_defconfig
	h5000_defconfig
	hx4700_good_defconfig
	lubbock_defconfig
	mmp2_defconfig
	multi_v7_defconfig
	mvebu_v7_defconfig
	pcm027_defconfig
	pxa168_defconfig
	pxa910_defconfig
	xcep_defconfig
	zylonite_defconfig

Could you please have a look to see if they shouldn't have a CONFIG_FB_PXA=y and
CONFIG_FB=y now with this change ?

Cheers.

--
Robert
