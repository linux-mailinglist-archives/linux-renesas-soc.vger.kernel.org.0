Return-Path: <linux-renesas-soc+bounces-18872-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00029AEC681
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 12:12:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0447617E589
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 10:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 299E1238C39;
	Sat, 28 Jun 2025 10:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="a8G61kAq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF0E1E8332
	for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Jun 2025 10:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751105572; cv=none; b=c9O/CrbE5u70Xb2TMiO9TX9iRY7BL4f5WSy3KsoLozl0RFYWMjOOA9qM3OdMqQrAxvebfmlE1gBO+0iWGbYid/uHHz4g9/lXBFXOZeH6uWo3WHfkn4le3tkm3sHRqJxHLS4Scg2fVRENjTNB6ahYUPA7zSOi3gkw9NPkNSnaXuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751105572; c=relaxed/simple;
	bh=heW1YQJe+E33Q++cU/jNUD8p2tcyFZJzkUIydqJ6jWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CBIPLCx1wT3TQFx8PC1cDL9U9AoJuwsaC+1SjiFWbuaznr6/nUupPe3k96Xpw5efSSvJ8LOzdAmGnFOnAKNE9kKb0IxsrGGuxOyhcTaUuZ1aVJYGBPCbyOQSj5y34XZoSJq7C/atBwg/XpMKVEwSnk+IlDi34CHbDLkObUGF/pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=a8G61kAq; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=wTWl
	1hOWh4B3xN1pG+EnUVjAd8XJxoLiQvIbOalhFUY=; b=a8G61kAqKjbjRtgkX2r3
	2d/X9OnHa8vHgKhFhpFUnIir8HjAigDHQeoBC5L3ps0opq7EzltVAQNcNG+kQKhq
	uctvgajQGt6mahiOBH3KiMmsYHmp5GNfz+TJbvW2LxVAl+FVpZjIjrZmCax5Whfd
	n2M8uVH3ObtUm0vXns0ZYoM2c2v81ceoYcEnJUBYshjPyhLIiL1TOpucRJFCnc38
	Pv9foNEfvvWLlq7utFxPR+RTVKVICQAAGn86w+HeiNfBc7n+RSOswwJZuJY8LGnR
	kf7ptVRwHXKGRJDOrxYrzNGlYy7LxQAHB5qziFIw8xbo7wZdfkLSChACH8/UMdXL
	MA==
Received: (qmail 1797582 invoked from network); 28 Jun 2025 12:12:36 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jun 2025 12:12:36 +0200
X-UD-Smtp-Session: l3s3148p1@LF2cCJ84fjZtKPFJ
Date: Sat, 28 Jun 2025 12:12:35 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH v2 1/3] i3c: master: replace ENOTSUPP with
 SUSV4-compliant EOPNOTSUPP
Message-ID: <aF_AE7H6H_Zb2W0L@shikoro>
References: <20250627111755.16535-5-wsa+renesas@sang-engineering.com>
 <20250627111755.16535-6-wsa+renesas@sang-engineering.com>
 <aF8DLbPnxLJVDn6t@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF8DLbPnxLJVDn6t@lizhi-Precision-Tower-5810>

On Fri, Jun 27, 2025 at 04:46:37PM -0400, Frank Li wrote:
> On Fri, Jun 27, 2025 at 01:17:56PM +0200, Wolfram Sang wrote:
> > The checkpatch warning '"ENOTSUPP is not a SUSV4 error code, prefer
> > EOPNOTSUPP"' is correct. We never want this to slip to userspace.
> 
> what's means "We never want this to slip to userspace."?
> 
> especial what's 'this' here?

ENOTSUPP. If we were 100% sure to only use it it kernel space, we could
keep using it. But since this is fragile because we never know about how
error propagation will evolve, we chose to not use it.


