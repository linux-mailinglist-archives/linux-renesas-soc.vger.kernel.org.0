Return-Path: <linux-renesas-soc+bounces-19636-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C75BAB1053E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jul 2025 11:10:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDDF01C278AD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jul 2025 09:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3280822CBE6;
	Thu, 24 Jul 2025 09:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="mJuPNYhL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225D217996
	for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Jul 2025 09:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753348203; cv=none; b=oV+visvY0FbuYC1uFxeKc7rSCG4usRTXaaSB0oCZREkubwwT44lU3FPJE341SISbudlkzP1trcqPp14mmPX3mGGdXgf3uwTKx4jrJgTJOIjVEKOAjGs8IXpEFxztB2okhxwbvRSPTopGGNdVo/MSr6RE7rzYlncEbE+F8JKmCGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753348203; c=relaxed/simple;
	bh=G3YlWTRs2ZjXChxoKT8sSieebc1PwZfmrkToTM0RJJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJJx88cKRwNrmi/nnPbCIJSWa3K8iZY3eCh/4ADrxav7T+eIpUU8OPnQR20yW7sp1yWW47GBmeHjljl8GRQkqqyjgUTgfSUlQfS0hdFytVRFI37ysMBqRxW8/XPFdktTWJekOnV2i3JCQdk4/yT5Zyew13DV0QxnWuJNnJm5L4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=mJuPNYhL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=6Lub
	CPP7Wbmj7qoJKI6x3Jj43GjD7R6ZKtT47pr9Epc=; b=mJuPNYhLvU4rsyz1aRpr
	HiLSLRSOEsz6cayOnUuic7P/XBFpj5nK74BCvh4EtxxzEu36EkAgat1PRFAwWInY
	zH0ZhjUSjD4dv6vfl8RW4lPqmnD/g2sQFdnpvK3BJw3ZcV5kLGupRrAvfiuw9CBh
	RvZgxP0cAPR7ZHAfXwAZ8udIptTXHe6O19AZqqHqzzlo4P0uE6a6nfNbJ3+d5U2P
	JsozP8Rswosv51Fzmdv02Mb4KD6Dn6HS77QT5BZlGiX4Qq6PiFYp4hyTLne0zflg
	1ehCP2OumkmIU01G88fgk4q2r1keIuH7YiygEqnuvXO5k+H/YPHhzcYBTjp/ShxY
	lw==
Received: (qmail 2006403 invoked from network); 24 Jul 2025 11:09:59 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Jul 2025 11:09:59 +0200
X-UD-Smtp-Session: l3s3148p1@Dw+PMKk6YoEgAwDPXyBWAATEinPyanBm
Date: Thu, 24 Jul 2025 11:09:58 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH v4 2/4] i3c: Add more parameters for controllers to the
 header
Message-ID: <aIH4ZmqVcYhOT8xT@shikoro>
References: <20250722190749.6264-1-wsa+renesas@sang-engineering.com>
 <20250722190749.6264-3-wsa+renesas@sang-engineering.com>
 <aIEAk3DF7Ez7NFwK@lizhi-Precision-Tower-5810>
 <aIEg-qyGhb8B2Rep@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIEg-qyGhb8B2Rep@shikoro>

On Wed, Jul 23, 2025 at 07:50:50PM +0200, Wolfram Sang wrote:
> 
> > > +/* TODO: Document a reason for this value */
> > 
> > Todo? Can you finish it?
> 
> Yes, but in a seperate patch series where the value is to be changed.
> 
> This needs additional testing because I want to update the other I3C
> controller drivers as well.

So, I started the research [1] with the conclusion:

---
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
---

Based on this, I will send V5 and move XFER_TIMEOUT back into the
driver. We don't know yet if a subsystem-wide static default value is
actually the right way.

[1] https://lore.kernel.org/r/aIH1zUb8tyIlyC3S@shikoro


