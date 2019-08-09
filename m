Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B184883D5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Aug 2019 22:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbfHIU1H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Aug 2019 16:27:07 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:39266 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726022AbfHIU1H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Aug 2019 16:27:07 -0400
Received: from penelope.horms.nl (unknown [66.60.152.14])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 6E73A25B81B;
        Sat, 10 Aug 2019 06:27:05 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id DBF96E21D63; Fri,  9 Aug 2019 22:27:02 +0200 (CEST)
Date:   Fri, 9 Aug 2019 13:27:02 -0700
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a77995: draak: Fix backlight
 regulator name
Message-ID: <20190809202658.dtb33eza575z7ste@verge.net.au>
References: <20190731073744.13963-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190731073744.13963-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 31, 2019 at 09:37:44AM +0200, Geert Uytterhoeven wrote:
> Currently there are two nodes named "regulator1" in the Draak DTS: a
> 3.3V regulator for the eMMC and the LVDS decoder, and a 12V regulator
> for the backlight.  This causes the former to be overwritten by the
> latter.
> 
> Fix this by renaming all regulators with numerical suffixes to use named
> suffixes, which are less likely to conflict.
> 
> Fixes: 4fbd4158fe8967e9 ("arm64: dts: renesas: r8a77995: draak: Add backlight")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> I guess this is a fix for v5.3?

Thanks, applied as a fix for v5.3.
