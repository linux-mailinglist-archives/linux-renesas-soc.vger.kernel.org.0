Return-Path: <linux-renesas-soc+bounces-24473-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEB8C4F2BE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 18:04:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A43B43A7C91
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 17:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 717303730F2;
	Tue, 11 Nov 2025 17:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="mxIpK6I7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594CF3730F3;
	Tue, 11 Nov 2025 17:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762880532; cv=none; b=C3EDufiJiFFgVnkZG/BumDN61kW8+/OBICRE9lG9IvjGhqZwPpHNWZs9myH5oXO9z4OI6Qss5VNxw4ygqrrhJQDiX22RRxiinMoEM8jIrR0I8t3h1VTJh7Byuo8c1W4CoKaWcqMhqEkPT559V4gTWKdyzvbxAZ6SlPHKYbyOxtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762880532; c=relaxed/simple;
	bh=z//mduXKJUo+Oy5YicOfk/B+R1uUBHBKtOyiEWNT9Eo=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=NlnInKZhMYome8m9FfUNZNjBsgwjDTP0Ee7b15ZQCtzM/NLxkFeu9ZCWlUD1ANq2UP3rL4/0PeZnqcxXyKfDz62fEkxtoTYmQwLyQqYIYG65MPpwcCGvO7b4jiGZ7w3H2+fR5z5CYTV16SYuOPr3gLZGEHHCrXurnBAfEGVIQZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=mxIpK6I7; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=tZoyP+M9xPo/FMe8WDOuLaf2cyBC7RlyzUKhtEPI9nc=; b=mxIpK6I7kAN9KIiGfCR48J8j04
	wUO0r6jU92y2dc0fUGhQCfVXaxMwNdqYsekltmjnfBwZDx4E2zzukpbOuB36oHlKp2keVGURxmbgM
	laLjnj5DtO+QXLk8E+xjZYGl1BIEUvk5ZZ9DJnWyuY4Xb5TjcAHL+tuDBLJHrhK+gtJM=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:43624 helo=pettiford)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vIrkb-00064X-2x; Tue, 11 Nov 2025 12:01:49 -0500
Date: Tue, 11 Nov 2025 12:01:48 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Biju Das
 <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
 Nghia Vo <nghia.vo.zn@renesas.com>, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-Id: <20251111120148.943a0e193a65469a53a0cbc8@hugovil.com>
In-Reply-To: <20251105222530.979537-1-chris.brandt@renesas.com>
References: <20251105222530.979537-1-chris.brandt@renesas.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -1.9 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH v4 0/2] Remove hard coded values for MIPI-DSI
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

Hi Chris,

On Wed,  5 Nov 2025 17:25:28 -0500
Chris Brandt <chris.brandt@renesas.com> wrote:

> When the initial drivers were submitted, some of the timing was hard coded and
> did not allow for any MIPI-DSI panel to be attached.
> In general, panels or bridges can only be supported if MIPI-DSI lanes were 4.
> If the number of lanes were 3,2,1, the math no longer works out.
> 
> A new API was created for the clock driver because the behaivior of the clock
> driver depends on DPI vs MIPI, the bpp, and the number of MIPI lanes.
> 
> 
> Testing:
> * RZ/G2L SMARC  (MIPI-DSI to HDMI bridge, lanes = 4)
> * RZ/G2L-SBC    (MIPI-DSI to LCD panel, lanes = 2)
> * RZ/G2UL SMARC (DPI to HDMI bridge)
> * Multiple monitors, multiple resolutions
> 
> 
> 
> Chris Brandt (2):
>   clk: renesas: rzg2l: Remove DSI clock rate restrictions
>   drm: renesas: rz-du: Set DSI divider based on target MIPI device
> 
>  drivers/clk/renesas/rzg2l-cpg.c               | 147 ++++++++++++++++--
>  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    |  18 +++
>  include/linux/clk/renesas.h                   |  12 ++
>  3 files changed, 164 insertions(+), 13 deletions(-)
> 
> --
> 2.50.1
 
Your patchset is missing the base-commit tag like in this example:

    base-commit: 4e68ae36422e85ec1a86aded26a211319649426d

This helps when testing to know on which tree/commit you based your
patches.

See "Providing base tree information" here:
    https://docs.kernel.org/process/submitting-patches.html

I just tested your patchset on kernel 6.17.7, and my display no longer
works.

Also tested on torvalds/master tree commit 4427259cc7f7, with similar
results:

    rzg2l-cpg 11010000.clock-controller: hsclk out of range

Hugo.


-- 
Hugo Villeneuve

