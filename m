Return-Path: <linux-renesas-soc+bounces-16896-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A5FAB1786
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 16:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 149799862B2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 14:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9775B225405;
	Fri,  9 May 2025 14:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="pAXhJYTb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4915122539F;
	Fri,  9 May 2025 14:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746801236; cv=none; b=el5kPKl8VnTzLSe5OzGlf2bbJ7hvRzOzYJwEijlaNfwncV+7c9sDcfsbzHXYQJ/PUhomK81Dlw2S1rzgYNRj2ayVNFLIytsiNVyOYHM7TuS+N8cR+6EJv3hTE9iRCxnRdcNf6n99XVMn196MUt66JV4VzIsNgeBu877Ff9VTQTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746801236; c=relaxed/simple;
	bh=mhyldcst/FwlgLhc8mUZwssOs1OMGla2sLaQ1bVesSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=InNCM5tZQ1n20Rus2ieObHRkdkeF/H4e5I9+q2zLCE795T7auFLRcRLt0FeoHA6J31ePa54vYMF/V6bsw5sSMWFMn6Y0NLDoEfuyECvII/PBpDl+K18Ok/laAqlq/1xx1iOcZR/sFCbsZKRTGKrJl9ojVuANE5d7GC6vVuFIxmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=pAXhJYTb; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=KZet+ff0CAqKdEihq0J4KoIwRL/wzE3KoqwUIYv73Sw=;
	b=pAXhJYTbNRJtQHK6fCd0ea3DhgtshwYydPx04PrJS2UaqOYzyginNzWLkXJq1F
	exjsqMWvuiU4N54hvvVh8NGwq2HSySo67N5rqG2xBPbmO607qao0hMED2UpTyKdB
	CRolNhVdC2YvbsiKfZ5BVqqovzV6OaRrgMt9YVsxYeJGE=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD33xEbEh5otAutAA--.15781S3;
	Fri, 09 May 2025 22:33:01 +0800 (CST)
Date: Fri, 9 May 2025 22:32:59 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt: bindings: arm: add bindings for TQMa95xxSA
Message-ID: <aB4SG1a8A2OvIBNB@dragon>
References: <20250428135915.520432-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428135915.520432-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:Ms8vCgD33xEbEh5otAutAA--.15781S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUcg10UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCR5IZWgd36zXkwAAs4

On Mon, Apr 28, 2025 at 03:59:08PM +0200, Alexander Stein wrote:
> TQMa95xxSA is a SOM using NXP i.MX95 CPU. MB-SMARC-2 is a carrier
> reference design.
> 
> [1] https://www.tq-group.com/en/products/tq-embedded/arm-architecture/tqma95xxsa/
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied both, thanks!


