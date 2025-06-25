Return-Path: <linux-renesas-soc+bounces-18747-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5779AE8A2E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 18:43:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 355B6165BBE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 16:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 917DD2D6608;
	Wed, 25 Jun 2025 16:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jZWKtH4X"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3638A2D6604
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jun 2025 16:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869706; cv=none; b=n5cGd4opdB5Jl4MKxCuRvCRjxuxdV90Iq+r9Nu4hbGekssZ+USMxrzOikFyCnn67UYi5oTCKqnpUpXOM5Y/4rteKgH0uVjjjHQ317cq3jzJngWVPSdIvcc+38VKlFuqNs2YQP8ebOb3Trv+JpLHJKKgUrtUqtXbi65z6RNZs2Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869706; c=relaxed/simple;
	bh=aukJ1XmvYksLt7ENFFSsNgxrTG0eoT84V3S5ioFaRyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jLDRXStDu39fC4mexxgYIf1NoMkb2pKrORPdaXtaYTa/QpEEwN3O1C63ZriW3LUTd/yK4wRKSIWdazFmPZf4da9eYDPe6/BNqKdQZRX/iTeseguV90y6uRBXtPWr8Qa4tG0losonvMr4jpTc4IhXHV8M5iAvQU9pl/T8TPdNvgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jZWKtH4X; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=rrkX
	ASEyQkbmanZAMXQwDaQOSFVKc1m7TVvpIZ6DXl0=; b=jZWKtH4XyRSZ541zXgnS
	LC2lItME4UzOeD/uzanZYNkbRixPq7jNdXdiUH8oFrj+O7vECVmP+arxqxGerSp8
	XMIOkeccJTo0gpTrO2SkUj9kYDsgA01FSf4aYGCybDxe+veOBrWdzG/+h45oswSG
	1emwY7OKwQxejYhU3Wqk0lCB6AuSYeDveeONE/vFPG2SGbMfJIy4IrcnfGHMeqXK
	CiJ0K7qptSPZouHyUqL3hwolO+V1+rxjd61K6mpxU3+YNp9NcwgomYg96jtjYfmS
	oEGWZAT16Cu5XSP5C3Kl1So9Y/w+tN9HBUEKIqnFgpP6mp8oVNEudaPPgY3MLBEk
	VA==
Received: (qmail 717444 invoked from network); 25 Jun 2025 18:41:38 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jun 2025 18:41:38 +0200
X-UD-Smtp-Session: l3s3148p1@8ApmHmg4qA1tKPJN
Date: Wed, 25 Jun 2025 18:41:37 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH] i3c: don't fail if GETHDRCAP is unsupported
Message-ID: <aFwmwduUm8KuJlny@shikoro>
References: <20250625073505.7949-1-wsa+renesas@sang-engineering.com>
 <aFwUx65gdpv6H6rU@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFwUx65gdpv6H6rU@lizhi-Precision-Tower-5810>


> > If a target has the HDR_CAP bit set in BCR, the core wants to get
> > additional information using the CCC 'GETHDRCAP'. Not all controllers
> > support this CCC, though.
> 
> Do you know which target device support HDR? I3C master API don't HDR yet.

The problem is bigger but I didn't want to tackle all of it right now.
'I3C_BCR_HDR_CAP' is still spec v1.0 and has been renamed to 'advanced
capabilities' in v1.1 onwards. That means the CCC was also modified to
get the advanced caps (while it is backwards compatible if you only read
the first byte I have been told, didn't check). So, if you get the ST
pressure sensor LPS22DF, it will not have HDR, but it will have the
'advanced cap' bit set.

Because my controller neither supports old GETHDRCAP nor new GETCAPS
CCC, it will bail out and not instantiate the device. Which is wrong,
because we can deal with it good enough without the extended
capabilities.

Maybe I should update the commit message a bit?

> This is not fatal and can be safely skipped, as the information is not
> necessary if HDR is unsupported by the controller anyway.

It is fatal because the target device is not instantiated while it
could be. I tested it.


