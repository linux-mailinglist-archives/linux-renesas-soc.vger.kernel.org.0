Return-Path: <linux-renesas-soc+bounces-12070-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2368DA0AC8B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jan 2025 00:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 036613A60B8
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Jan 2025 23:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E363D155C97;
	Sun, 12 Jan 2025 23:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Qt0UpYwp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26F41B87ED
	for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Jan 2025 23:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736723117; cv=none; b=HAR923+1Q8Zg1DPkGPLGVQ6ItlGt0BNcQ1auCGQS6kjM8Xbq/oycKkL2sVzVl5L2Xa5efNGk8UhDuQpvsGK6I2lEAOuJEQtoZ0/zFjjkDADiYvnXLkGS0G5Le8jCMhqEwwbQizS4aLV/EZCCXTJA6OoFNfz00rmj3b6CWBeYC1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736723117; c=relaxed/simple;
	bh=Mo5qUszSyWUIQAoyu8p6/fa9K+EW/bzx3sY8UYgKGEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L6onE1WxLQc/WKBwKSwCfRqiu2dLgN0+3TaL7as6w0COWi3f+uVgBgbAGSA1kdhvm1uYOU7pmFrzOdFv4sxhFIF9Z29YzPGQfI4VJirto4O2CikQ6hDNB/c2BYau/oLnaxdI1M3R1dMjEPaOmS5ePo12WmggqBfPWJAQLNqTycs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Qt0UpYwp; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 79A47C0002;
	Sun, 12 Jan 2025 23:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736723107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K7+ie0nzNqQuHab8mm78UbXRHJOJCUPMvYctqDi42QY=;
	b=Qt0UpYwp1Zom8NeOSu7f+tAfHqm1xQ9mLpv1dR4cNrIKEBvMTmEPgR+qwZ7Ba0+Spz88o2
	a284rfu3NnwgbhXnMrMfhBPcb+vlFF3kjfOa1nNWY40npLcny8dUgQiwqgTWBc2TaPD7bj
	MaYIoSGlNU5mzDsH5Kp0GHAbU11icWIQZ8B2BQaQyUBEA+MEw4xmgUREmpToAxt8nBUEtx
	kaHT/Xh/PeVcXqh+vLE+Ly/aJXzwYw+uZiAHlXRLEeBk84JM/fpqA4dHBTx2v6GA+mY1kr
	qkv5NiiGF6CsBq8pVheOcSmyHPJ495uz/eTs6kIfwulFIO6twwlUFfZEy3En1w==
Date: Mon, 13 Jan 2025 00:05:07 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i3c@lists.infradead.org
Subject: Re: [PATCH] i3c: fix kdoc parameter description for
 module_i3c_i2c_driver()
Message-ID: <173672283104.1485431.7286252526391577976.b4-ty@bootlin.com>
References: <20241219220338.10315-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219220338.10315-1-wsa+renesas@sang-engineering.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Thu, 19 Dec 2024 23:03:37 +0100, Wolfram Sang wrote:
> A typo mentioned I3C when it should have been I2C.
> 
> 

Applied, thanks!

[1/1] i3c: fix kdoc parameter description for module_i3c_i2c_driver()
      https://git.kernel.org/abelloni/c/0d2c022ffa7c

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

