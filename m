Return-Path: <linux-renesas-soc+bounces-6572-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D91E3910D39
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 18:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14B5D1C238B5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 16:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 267111B140F;
	Thu, 20 Jun 2024 16:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KgTLXHiC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2910482D7;
	Thu, 20 Jun 2024 16:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718901481; cv=none; b=nLvyl3Nd0dNJtVvNGdRkxu7ayv2RMX2HQaOjIL7tgjZfLyGJMKKz3zzp4w/8Rms3H+tZ0n2RxbCoHfbB6f4/F+jpg2q9SbFTxAoREFaP27YX4xls4y2fjzEeWp5wXzi1B/2OPhZyQmHyRnv3x0Paz1q1DtIds/pMuS2z7KAiVsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718901481; c=relaxed/simple;
	bh=zBODjumhF8suBDPPzFJNNhUijNBXFCszRrZlUFXwvXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cm3ZdprYKFL+LZIhwrXCodNJAuAFWKCUdtSqTS/bPbqqTL9+l1fpnZAnTIkruZT53bnB6RtXfBaCWlr1mmLXs5yfsu4OL946tXRcFhIQ39kXQwP3V0PGjv6mN3aj46CKY83kYnXVcaltRF2Zdp8HeUg5M/NSNPcYLtn1AqXzCGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KgTLXHiC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8182C2BD10;
	Thu, 20 Jun 2024 16:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718901480;
	bh=zBODjumhF8suBDPPzFJNNhUijNBXFCszRrZlUFXwvXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KgTLXHiC35xjPS6nkkkzXX8aUsOMyNiPNkcc5owndwq1EHcgCm9GUzZAQRMR6X6J5
	 4J78IFoEd3NPElyFHrI4qi2mnLvafpZdjT8Das3s/0UGKErcbkdu4L3dYhjtRH6BCX
	 2DmFGB8ffGWlMmhCeMYPlvLd7m+qOKff2NzkZugGxGHQeUzcMePwEWnBB2POgh922H
	 xMD87hccL3p1a0CEqEMKwU0eh+SEthiehTH58cCZ8PlWoZVz6QhelGWgfy1eepXwa1
	 d20JIhYivrAjssq249+rj3Owos+aMd+oowWxchIC44TCkILPOu05waW+HLFqEcb0eJ
	 wojRt11KkxN4w==
Date: Thu, 20 Jun 2024 22:07:56 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 0/6] Add USB VBUS regulator for RZ/G2L
Message-ID: <ZnRa5CRumiJeMhEb@matsya>
References: <20240616105402.45211-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240616105402.45211-1-biju.das.jz@bp.renesas.com>

On 16-06-24, 11:53, Biju Das wrote:
> As per RZ/G2L HW manual, VBUS enable can be controlled by the VBOUT bit of
> the VBUS Control Register(VBENCTL) register in the USBPHY Control. But
> this IP is in the Reset block.
> 
> Reset driver exposes this register as regmap and instantiate the USB VBUS
> regulator device. Consumers(phy device) can use regulator APIs to control
> VBUS as controlling is done in the atomic context.
> 
> We need to have merge strategy which subsytem will apply this patches
> as it involves multiple subsystems Reset, Regulator, PHY, DT and Renesas
> SoC??

Why is there a dependency.. why cant they go thru respective trees?

-- 
~Vinod

