Return-Path: <linux-renesas-soc+bounces-18769-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B4BAE99B8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 11:11:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E47016D033
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 09:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B11F826B76D;
	Thu, 26 Jun 2025 09:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jl391GaC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922391A8F94
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jun 2025 09:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750929101; cv=none; b=cJLL/JnVoKrA5iWSyxTYfpLmTtw7T0DO+s+v7jYCUo59n/0dS+2WpnbUpPaQs7BfDUZ4tzpYDtUg3vnhoBfflzu8cb2OWwgxC//Kf5bVof9Voria0aTZfipejHFk3Mthqj3DUYzI8U/5BwONbuXw55pSYtPXPEfdcs0uGFK2Twk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750929101; c=relaxed/simple;
	bh=I6zdfncc/96+Gw/Om3k8PNo1tLAvs9mp+tWHF0Z6tuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rD328S9jAwWyl+lgLcXdHHpzNDidSIzuj9LObPNFytc5iV2D13AdjXxQhWaCRbLax88FcKC/IZVeGJrMaqrvn2cPP0ewPG8rRB5Z708X2BVo4kHnTxkuKX8Hm1ZbEgCdCDEvb04rzk/ThcOh2Py+6rLrsj6YDUcfCcq5ue7YB6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jl391GaC; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Eeeh
	I820+vbYXqz5ZAdlcKhAicg7pFQoE1iRyfgvkis=; b=jl391GaCgtDBiK5ltUyR
	Ft3buEKQxhgmRrTOeJmBBqEQ7JWZF45QxCAzgCf0+0NGGOek5Qwa39JzNIAfRXO+
	6a/rA0wLQaQDSy7wPzptFTrPqf2/E1a9Qb4EVo/uVT5URp7T5WFudd9T8ELjFbpf
	rS0UVvPdlqsv2sr5CtE586mhXFAY+g9QvyBzIs9hDXnnP03nO7864FkivtPN5Bf3
	B01W+utOPoOvrzAbWYDqGDoDnZXhXLTam86yPptEK0ix3Q7Q+viR3ftT+r5Jgz2P
	Dih91qyUCWZwbYMbURNKIz3HVsrO3MVf+MHCUb7uo3XQRsN3r6YbI7G4j8RQduxY
	4Q==
Received: (qmail 974836 invoked from network); 26 Jun 2025 11:11:24 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jun 2025 11:11:24 +0200
X-UD-Smtp-Session: l3s3148p1@MCYW8nU46tIgAwDPXzuUAOCQSK0rM+sw
Date: Thu, 26 Jun 2025 11:11:24 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH 1/3] i3c: core: switch to use SUSV4 error codes
Message-ID: <aF0OvNnmOIfpKwmQ@shikoro>
References: <20250625130918.14507-5-wsa+renesas@sang-engineering.com>
 <20250625130918.14507-6-wsa+renesas@sang-engineering.com>
 <aFxcbGQyfjaHOHDt@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFxcbGQyfjaHOHDt@lizhi-Precision-Tower-5810>

On Wed, Jun 25, 2025 at 04:30:36PM -0400, Frank Li wrote:
> On Wed, Jun 25, 2025 at 03:09:19PM +0200, Wolfram Sang wrote:
> > This checkpatch warning makes sense here: "ENOTSUPP is not a SUSV4 error
> > code, prefer EOPNOTSUPP" We don't have a userspace interface yet, but we
> > probably will get one. So, let's convert these error codes now, before
> > it will be forgotten in the future, and they could slip through to
> > applications.
> 
> I suggest the simple words should be enough.
> 
> i3c: core: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP
> 
> Replace non-standard ENOTSUPP with the SUSV4-defined error code EOPNOTSUPP
> to fix below checkpatch warning:
>   "ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP"

Can do so, if you really want, but "to fix checkpatch warning" is
usually a not-so-good commit description. The above text tells WHY
checkpatch issues the warning and why we should care. However, I can
probably simplify the wording a little.


