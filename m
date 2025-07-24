Return-Path: <linux-renesas-soc+bounces-19635-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E991B10522
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jul 2025 11:00:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E11911882B48
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jul 2025 08:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E87A2222B4;
	Thu, 24 Jul 2025 08:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="HlGI6+Wj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788A91A08BC
	for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Jul 2025 08:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753347542; cv=none; b=Ta2PEhJhXNzuuBc8KCVVsExU0IX7/y5hlbH3cDB8OqT6SIH3jnGXgQ6LQJauvvMOnpp92r/TMq+B/AgjfEqKLYZEvISBPUBdTC73U1rUQWJskrNjJ06DidSP67b1yxUzFgfYXNMcMI4a5DzbLnQQNcy2U0Ni9SXHwY4vn6jd89A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753347542; c=relaxed/simple;
	bh=9lJnOw55i7kP9A1aXurdf0QVZFmLS+frff9ASAagBIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fx+yVffzg1sCEqCNTI2hx3C8E6bDZ+5DxmkIHsMLnI1/IcjWDCjif6xRbysFkHUM6O9MHobTfKFFd3lLuiVEfzhQ9RmKs4ljpRZCWPCj/RTnqSh8TGvKosKLeVRcADGtOc3rlgugaZmYx/sVD1ns2gV8WqM4OUTCDYT6OWydXa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HlGI6+Wj; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=i/NA
	INETyHfGijHMzvc7a5LD4S6+WhrSyQ8ZvBvYX58=; b=HlGI6+WjAGj0V7Jk81Fv
	UdXTWYIpk/WZOXjC1082Nf/zZrYcBw0yXmQRykgCLCbXapgQ1a7sDVK7AoTi3cOY
	SmBQsuG2komJxNHDKsm3Zv2ZBL1Fh3qk4GOfUPse+hq8V7wAKDmGL8jx1k7vxLGY
	RnUw/+0ZRMiyrRxFzlMuasut+lBY9/dfQWhBHQeqJIJthgFqe67fn6WayVBGMApA
	XMrCiQ/QWHw1JHMFqb03lKnmt5KUnGygTIIjYoMkf0+FxxK7dDzgnA+WoqgqmF9V
	LWo6+0513NoVqatwrwvpeUWUdCpJ3N8uqBDzgzNfzWbIwcepnEg48riTeVoe9iRy
	Pg==
Received: (qmail 2002639 invoked from network); 24 Jul 2025 10:58:54 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Jul 2025 10:58:54 +0200
X-UD-Smtp-Session: l3s3148p1@drDwCKk62usgAwDPXyBWAATEinPyanBm
Date: Thu, 24 Jul 2025 10:58:53 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH RFC 4/7] i3c: add driver for Renesas I3C IP
Message-ID: <aIH1zUb8tyIlyC3S@shikoro>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-5-wsa+renesas@sang-engineering.com>
 <aEmws+OtHirrUPUo@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEmws+OtHirrUPUo@lizhi-Precision-Tower-5810>


> > +		renesas_i3c_enqueue_xfer(i3c, xfer);
> > +		if (!wait_for_completion_timeout(&xfer->comp, XFER_TIMEOUT))
> > +			renesas_i3c_dequeue_xfer(i3c, xfer);
> 
> This may common problem, I3C spec have 100us timeout, target side may
> timeout when driver wait for irq. So target side treat "repeat start" as
> "start" and issue address arbitration.

Looking more at this issue, I think these are two separate problems.
Chapter 5.1.2.5 mandates that the controller shall not hold SCL low for
more than 100us in most situations and by no means longer than 15ms in
any situation.

Depending on the controller, this may be need to be handled in software.
Or it may be handled in hardware which could raise an exception and
release SCL on its own if the timing was violated.

The above completion is for the *whole transfer*, though, including the
target response time. Like I2C, it is not specified for I3C. At least, I
couldn't find it and I recall no one at the I3C plugfest could point me
to one as well.

So, this completion timeout is more than just 5.1.2.5. It might make
sense to investigate a more reasonable value. But I don't think this
should be imposed on someone submitting a new driver. It is a dedicated
task. And I am not even sure the result will be a subsystem-wide static
value. It might be a calculated value. Maybe even a driver-specific
calculated value.

So, I think the best we can do until we have this investigation is to
keep drivers consistent with the historically grown value.

Or?


