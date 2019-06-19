Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 283964B776
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2019 13:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727134AbfFSLxv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jun 2019 07:53:51 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:57268 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727067AbfFSLxv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 07:53:51 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id A7C5725B262;
        Wed, 19 Jun 2019 21:53:49 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id A61399409FF; Wed, 19 Jun 2019 13:53:47 +0200 (CEST)
Date:   Wed, 19 Jun 2019 13:53:47 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH LOCAL] arm64: renesas_defconfig: Refresh for v5.2-rc1
Message-ID: <20190619115347.52vdxlqohzrrf5ed@verge.net.au>
References: <20190618124750.15217-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190618124750.15217-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jun 18, 2019 at 02:47:50PM +0200, Geert Uytterhoeven wrote:
> Update the defconfig for Renesas R-Car Gen3 boards:
>   - Move CONFIG_COMPAT=y (moved in commit dd523791c939cfe6 ("arm64:
>     Kconfig: Make CONFIG_COMPAT a menuconfig entry")),
>   - Drop CONFIG_BACKLIGHT_LCD_SUPPORT=y (removed in commit
>     8c5dc8d9f19c7992 ("video: backlight: Remove useless
>     BACKLIGHT_LCD_SUPPORT kernel symbol")),
>   - Drop CONFIG_RESET_CONTROLLER=y (auto-enabled since commit
>     d245a940d97b5cd0 ("media: rcar-csi2: Use standby mode instead of
>     resetting")).
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks Geert,

I have applied this to the topic/renesas-defconfig branch which is included
in the devel branch and tags of the Renesas tree as a convenience to
developers.  The branch is not, however, included in the next branch or
tags nor is it targeted at upstream.
