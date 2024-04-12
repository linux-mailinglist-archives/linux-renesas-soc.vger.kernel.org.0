Return-Path: <linux-renesas-soc+bounces-4558-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B7A8A32B6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Apr 2024 17:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3D6D289607
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Apr 2024 15:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B5A11487C6;
	Fri, 12 Apr 2024 15:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="gmwk+vjZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8D486255;
	Fri, 12 Apr 2024 15:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712936475; cv=none; b=N3W/7bq+bB9qF8G00alE3WBsCDGgmaB91De0DsSI2tXhXSuw7U19Pdr1PS8NhatWTqlPnCeLWeze6z/z046ns6yMama9nB0F8Qe5kQBoKPZxeQF832o41tEAtWggJHKysV/UR+0VG7Jw7/hZEw/unZwCb5ovtyTkkvRJVEXn1cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712936475; c=relaxed/simple;
	bh=N0XVHGo4SMlPD6EQfbU20bRIk//KUBXgZx3W2pzz8ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BUsBtJl2NcQ3RC8agFzQ+raOubCtztokyPO2Bhcq3ZkJ/Nju29NbKnCA+eoebETaJqH2quiq3BUte40glKZLlZPgnec0XM+3A4RYCTeNb86ewEOTEyZskdPYlMu/5a9vt3uA8EloCXo3xhXJj8pzwBc0gh8wZhd8cbgF/WbHX98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=gmwk+vjZ; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6my0iodQaeFR5ckhDBIIj+CUGiu9F+ZcP+5OqFc8jX0=; b=gmwk+vjZ4UTeJx4MQrTiD9foif
	hsM2+ZrWPMJQnhlDL6zls3cxABiYR3kBmNoRQQmR8aTRushwCUBvv35XeQ96U5ryF2eA8FFBDK168
	Lpa0bZ3dSGSBgiwPAt5Roa9pBGKryjf/z0Ws9Xs6OpB72Lk4MnUdWPZTBWJ3zToUP+YGCw78orNJw
	y/aqMh4BEPXyTzJGM2JNRzmgfjz9JvyLjidopV87f6IK9vrDwzkCVhZCNb4kOtdtkL4ZqOOOO+l7U
	v1E16mhROz6wiQBwtlbK9ZAkmndsTkNF5paSLFl9x7gSEqlIO1MjO1av70iD9uDAesZECM4GS3NzR
	XLOoK07A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58796)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rvJ1W-0002fC-0Z;
	Fri, 12 Apr 2024 16:41:06 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rvJ1W-0007wG-4C; Fri, 12 Apr 2024 16:41:06 +0100
Date: Fri, 12 Apr 2024 16:41:06 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 2/3] clk: Add clk_poll_disable_unprepare()
Message-ID: <ZhlWErZjizEc5bm5@shell.armlinux.org.uk>
References: <20240318110842.41956-1-biju.das.jz@bp.renesas.com>
 <20240318110842.41956-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240318110842.41956-3-biju.das.jz@bp.renesas.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Mar 18, 2024 at 11:08:41AM +0000, Biju Das wrote:
> The clk_disable_unprepare() doesn't guarantee that a clock is gated after
> the execution as it is driver dependent. The Renesas and most of the other
> platforms don't wait until clock is stopped because of performance reason.

I'm not sure it's "because of performance reason". It's probably more
that it's not important for functionality.

> But these platforms wait while turning on the clock.
> 
> The normal case for shutting down the clock is unbind/close/suspend or
> error paths in the driver. Not waiting for the shutting down the clock
> will improve the suspend time.
> 
> But on RZ/G2L Camera Data Receiving Unit (CRU) IP, initially the vclk is
> on. Before enabling link reception, we need to wait for vclk to be off
> and after enabling reception, we need to turn the vlck on. Special cases

"vclk" not "vlck".

> like this requires a sync API for clock gating.

I suppose this is fine for clocks that only have a single user, but
this is highly undefined for clocks that could be shared between
several different users, since it becomes racy whether another user
of the clock has enabled or disabled this clock.

I think this new API needs to spell it that it is not for clocks
that are shared.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

