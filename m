Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB6B01AEB92
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 Apr 2020 12:11:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgDRKLD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 18 Apr 2020 06:11:03 -0400
Received: from smtp07.smtpout.orange.fr ([80.12.242.129]:48780 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725923AbgDRKLC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 18 Apr 2020 06:11:02 -0400
Received: from belgarion ([86.210.245.36])
        by mwinf5d13 with ME
        id UAAm2200A0nqnCN03AAtbJ; Sat, 18 Apr 2020 12:11:01 +0200
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Sat, 18 Apr 2020 12:11:01 +0200
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
Subject: Re: [PATCH 1/8] fbdev: w100fb: clean up mach-pxa compile-time dependency
References: <20200417155553.675905-1-arnd@arndb.de>
        <20200417155553.675905-2-arnd@arndb.de>
X-URL:  http://belgarath.falguerolles.org/
Date:   Sat, 18 Apr 2020 12:10:46 +0200
In-Reply-To: <20200417155553.675905-2-arnd@arndb.de> (Arnd Bergmann's message
        of "Fri, 17 Apr 2020 17:55:46 +0200")
Message-ID: <877dydp0ih.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Arnd Bergmann <arnd@arndb.de> writes:

Hi Arnd,

> diff --git a/arch/arm/mach-pxa/Kconfig b/arch/arm/mach-pxa/Kconfig
> index f60bc29aef68..8444d40df1b3 100644
> --- a/arch/arm/mach-pxa/Kconfig
> +++ b/arch/arm/mach-pxa/Kconfig
> @@ -549,9 +549,6 @@ config MACH_ICONTROL
>  
>  config ARCH_PXA_ESERIES
>  	bool "PXA based Toshiba e-series PDAs"
> -	select FB_W100
> -	select FB
> -	select PXA25x
This last line puzzles me a bit in this patch. Why removing the PXA25x select ?

Cheers.

-- 
Robert
