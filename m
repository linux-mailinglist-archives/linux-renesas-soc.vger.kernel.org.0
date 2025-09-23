Return-Path: <linux-renesas-soc+bounces-22246-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7211B97C11
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 00:53:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E2F37A132B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 22:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F962DF716;
	Tue, 23 Sep 2025 22:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EaYX6+7i"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3774525FA0A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 22:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758667998; cv=none; b=rpVhxg/UQzgegxZcEfQCj3PFUB9NZbw6XvI+6rPW5eHh7C6GdtMykMmnceYnkCccCs07JkdVt9hZ12+3z62kK46n4NFzbwVqjAq6jVVn9lzGX+row00sACyNmBheW+e9OHIOK/ceKjaEYFzKzMaT3bKFd12DTFxykahsBLvi9k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758667998; c=relaxed/simple;
	bh=O+ekn2kw4yJLcY2KYvFztyS7O2fN2FUy/Hg++gUtUkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N517+NnJKpNdW3rE1JPX11e/tLf2xmW8DW/xIIrMhWd28hQYY1Sg/Pmf6A0tfbhig5VZ9CDs6YST0x2Nfno3yMwuLSQkAQJM2VuBSj4/cA5aRJaXYlECijHCkLu+3vNJM2lDr/Fq9ZA2Byv+5CdFgxOFem2qnLsx/o0FLDSfVhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EaYX6+7i; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 578D61A0EB0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 22:53:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 198A260690;
	Tue, 23 Sep 2025 22:53:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6BDC7102F18D0;
	Wed, 24 Sep 2025 00:53:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758667990; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=oQmr4Di+enux/eedyYTgIAwrnKr9S25f1mwcR+UOfPI=;
	b=EaYX6+7ipgKEjHDaUrYya4Aghoy1c6mya/3Ou+2fkmfjjgKHbUWEeADDYHi3VNkbkggB4J
	B+qVzE3qmQ7qSzEbAzZhPTmWMKcfLOHYkQAB6xpqVVtIRLMLmkTp1GhHpr0LxDGts+zlIN
	/DGj7CvGfOqSYbi9u4nt+iUzey3NUccJ5ClICvl5QzyWfJUkhHWKjZxzIecUbluu7hodDU
	hgUvBtz1xuJHS28/JykdFzhTmVCjYY0CSXRxI3+CYe6ebBGTey/H2ACvfC5AfCjx9Bg4RK
	H+B5klCPgp3BdUR4hT4hsUekxMoj5wAH8rVbQuPu4Efk9kQ79Z6grVtcU7vNSw==
Date: Wed, 24 Sep 2025 00:53:01 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH] i3c: Remove superfluous FIXME
Message-ID: <175866771162.212158.11360718295007829847.b4-ty@bootlin.com>
References: <20250923203557.18298-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923203557.18298-2-wsa+renesas@sang-engineering.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 23 Sep 2025 22:35:58 +0200, Wolfram Sang wrote:
> I2C adapters can already change timeout and retry parameters via IOCTL.
> This allows for better tuning to workloads compared to per-adapter
> defaults. So, the FIXME is not needed.
> 
> 

Applied, thanks!

[1/1] i3c: Remove superfluous FIXME
      https://git.kernel.org/i3c/c/649764145b70

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

