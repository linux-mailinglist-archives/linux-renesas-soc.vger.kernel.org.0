Return-Path: <linux-renesas-soc+bounces-3696-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A17CA878DCF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 05:28:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 579EE1F21D37
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 04:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EAE3BA39;
	Tue, 12 Mar 2024 04:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IMTV257J"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64172B665;
	Tue, 12 Mar 2024 04:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710217734; cv=none; b=TfhdXOpxB+MHMWVnUC6GSk1+ZnWA05uOeOgRkvvDiq/VwT9+vN8GTv1AMIBvCGZ1Oc0GPFva1s8B+4kkyz0so3fer41oUoXHDVZUj0NRSVGXe1YZ8/6pebj2xS2RKNl/e0UCtqPajwfzBk7FVAchOkiWVS5ADp1j6dMTfSxSxyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710217734; c=relaxed/simple;
	bh=dVpF90zefLWAqpU31bKcETHT4IBXM4S+wtcvz9Boem4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QR2+d4AESgIj0a1FozHFuM97x3n0sJ762DrIfINKpD90su+qP69Bvtgy68PsIOirvmKqkOhrN8ZDpJt4Jf0x8M+tFlABMzxxooNgKe1ppicoCP/Lf+k64VnpoqZYKMXNs78r0vVg98PM8RexQ66PYxo+HDGB4K9vEWDGDDpuzmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IMTV257J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00BE0C433C7;
	Tue, 12 Mar 2024 04:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710217733;
	bh=dVpF90zefLWAqpU31bKcETHT4IBXM4S+wtcvz9Boem4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IMTV257J5X5outjE5pGZIoNb00rx7AZY48tt+FF9LhaibdAp4nHH0+8e2G4n094xY
	 ne5uukUhjoaqDYLEUSNqISDF1I1gZiDtGGhu/VSwBQq8XmoVW0ubY4OKcfvVNer8yL
	 MiWnfDxVy896vPPkngxeKQSNEBqOUjb9FY+m5Puq7k7q9H3y1C57RUZGmMCwuJFbpR
	 mxdR9FHZiGm6ieEavDf4Goke95w+XLwMutkOOv79TIEMWN2KXhv6L7QBaRDOHx8joL
	 vmktuuy+B8lvq7EKDCYBCKi1urANBznNOhrHSaKF2MEzKK+mYQd0QYbFyPuYmMxtfU
	 oj40jEy9Yg1dQ==
Date: Mon, 11 Mar 2024 21:28:51 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose
 Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, Maxime
 Chevallier <maxime.chevallier@bootlin.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Clark Wang
 <xiaoning.wang@nxp.com>
Subject: Re: [PATCH net-next v6 0/7] Fix missing PHY-to-MAC RX clock
Message-ID: <20240311212851.315ec6f7@kernel.org>
In-Reply-To: <20240311-rxc_bugfix-v6-0-adf5133829a2@bootlin.com>
References: <20240311-rxc_bugfix-v6-0-adf5133829a2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 11 Mar 2024 10:55:43 +0100 Romain Gantois wrote:
> This is version six of my series that addresses the issue with some MAC/PHY
> combinations.

## Form letter - net-next-closed

The merge window for v6.9 has begun and we have already posted our pull
request. Therefore net-next is closed for new drivers, features, code
refactoring and optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens after March 25th.

RFC patches sent for review only are obviously welcome at any time.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer


