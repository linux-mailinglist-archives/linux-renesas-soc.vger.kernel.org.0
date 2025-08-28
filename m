Return-Path: <linux-renesas-soc+bounces-21005-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4845B39792
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 10:56:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B694167844
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 08:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20ECA2EBBA2;
	Thu, 28 Aug 2025 08:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CLndv3CP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D992459E1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Aug 2025 08:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756371371; cv=none; b=TZrnM/A8VthSLRmmqpC9bcBlvyj4vi9+djv9WatCNfDPOHGPtzY1y3wgqTBmSsHwMCZjAmo8VNOkZvYzDg1yg6VJ+dR7Rf8V2elA7rLrPtTRbqL0WnBgtbuMaX5dUk90gkRFcHekb9LXGVPB6MdAZsCw7xFdtwa/rqPCJ++vKj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756371371; c=relaxed/simple;
	bh=mdOJV1sdZK45vBFP0mM0b+v0n9JxKYturrTwXISROE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sg99SS7Ql3bOh0e9jE8ZmhtaliWZN+uYcLhGG0yE8xlAlLXntB2kT9ouN5eNWMd9v/t4ap0tFpx8ntmTVsnKKWd+RYN4U/zZxmWGonPmb+Pe8h/3ltabZDEG2C6pUsARmYpgKFtBZG1pMKsLp61eYXwCOX2zOk99KtN51txNbkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CLndv3CP; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=QvdA
	hUEUNTpDtAXlWcb9EeodbUuKdqI/q/I9vC/c2Lo=; b=CLndv3CPXnHjjWw+u0g6
	mXJfrYgOtmsFGbcNoFFPx7H4gDEM92hYG2miokV3ABS1GrsKiB/PKrNdMj8+V+Wn
	ysxbTF65S84fYUfpEZTrIsEzolth0RTHcbbutSHnu9Lwbkn4zSp+Z1MFq4wFBzGc
	ZXukRjIWdsnA+VZiNSRZG3Z4PzDLnhRyeGNI5nDzSHp8hcg6qHONERlfzcoGbGeW
	cLwrxhC2Wrnd4Oo7mPu0iteNi13PT390TAvSlSxTen5d6C0QlZWurz3HAG5No4ja
	itGOfodGX1+93mePPfOZH2qLnQf6Iz+G4X4mW0dqgCgLY9Vxvi6q5lBr4pvTzD46
	lQ==
Received: (qmail 935638 invoked from network); 28 Aug 2025 10:56:07 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Aug 2025 10:56:07 +0200
X-UD-Smtp-Session: l3s3148p1@HmRpE2k98OwgAwDPXw2iAG43AYdOknD3
Date: Thu, 28 Aug 2025 10:56:06 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	geert+renesas@glider.be, magnus.damm@gmail.com,
	yoshihiro.shimoda.uh@renesas.com, biju.das.jz@bp.renesas.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 0/7] Add initial USB support for the Renesas RZ/G3S SoC
Message-ID: <aLAZprjeKtk4pusw@shikoro>
References: <20250819054212.486426-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819054212.486426-1-claudiu.beznea.uj@bp.renesas.com>

Hi Claudiu,

> Series adds initial USB support for the Renesas RZ/G3S SoC.
> 
> Series is split as follows:
> - patches 1-2/7		- fixes on bindings and driver for USB PHY
> - patches 3-5/7		- updates the rzg2l-usbphy-ctrl driver and documentation
> 			  with support for setting PWRRDY though SYSC
> - patches 6-7/7		- add device tree support

Can you kindly send me a working config (privately will do). I think I
enabled all the necessary config options but still get:

[    0.271024] rzg2l_usbphy_ctrl 11e00000.usbphy-ctrl: probe with driver rzg2l_usbphy_ctrl failed with error -22
...
[   10.981612] platform 11e20000.usb: deferred probe pending: platform: supplier 11e10200.usb-phy not ready
[   10.984103] platform 11e10200.usb-phy: deferred probe pending: platform: wait for supplier /soc/usbphy-ctrl@11e00000/regulator-vbus

Thanks,

   Wolfram


