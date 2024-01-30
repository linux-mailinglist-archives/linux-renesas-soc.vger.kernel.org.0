Return-Path: <linux-renesas-soc+bounces-1983-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F26842069
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 11:02:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50F7D1F25A5D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 10:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F08A679F0;
	Tue, 30 Jan 2024 09:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NaYDMDNi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E090067A04;
	Tue, 30 Jan 2024 09:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706608741; cv=none; b=RiHTeBLS1Pxs7z5U1n3pXCb1rxFW390xE0x2zho+dT/nUsoCfhERRGTQbma7IMHjXzAH2H7ZPqdJZsx2HRID2aRTdwnTmuirY2Vgqeyy245FKGc/Z0UPq2iNVb8Ggh1etP4X9Sgvm9deBxOWR5b4mFpr6F9q7vZtlQTxqrkU9xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706608741; c=relaxed/simple;
	bh=MKUXB6V1YAzEGEtln10mgT2VHpJUBVlj85vGbaEeyiM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HKhaADrG5amb1zjgucocTO759rYqCCOcPvGunQ2oupg/gcbqLYNSttIbRCvTEPHY2OPeJusjvgf2E9zkk5A/5xtymYnjlmoeb6wO7bEagtc45f5JzgIm2ryI+wNNTnEmkKkD8Nk/FWZnpoVGRWORvaM6bABN7IAzS7/370r8uQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NaYDMDNi; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1D651C000F;
	Tue, 30 Jan 2024 09:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706608730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EiSQPHlZvuMGh0EjQQ581BSXae/FdZolbIAXca57poU=;
	b=NaYDMDNij0V/pTIkkBOPp9SLHn7uDFROO8ky6uETO5MB2EwwAbehy+a6sA18wvGiuG7d56
	CiF4IoJBq2/RnpaAMFibw2GB9OUgYzF4J0KLp5jF9NmU9LEvoaFtl/vpfNaT2EeqarbNdB
	UNzLq+SjLxotlw2FoyxXYv7ElxC5tSlfEVQ1JW6/4GXtDeeUvS5sq4MmdZSUulyIG4Y2he
	cdhSXqL4do3DMAi5xF2t11JSMx8iW/EOVtNPnYDtWs/d9ze7mKYlBwWeZMJfdrQJKPKaX2
	odkK/WErvb4sAOdYBdzS8C2asLbEX/Zc6WH3AxTJFx5pYY86vb+VMIQGHe5I3A==
Date: Tue, 30 Jan 2024 10:58:47 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <clement.leger@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 Clark Wang <xiaoning.wang@nxp.com>
Subject: Re: [PATCH net-next v2 0/7] Fix missing PHY-to-MAC RX clock
Message-ID: <20240130105847.08a2d958@device-28.home>
In-Reply-To: <20240130-rxc_bugfix-v2-0-5e6c3168e5f0@bootlin.com>
References: <20240130-rxc_bugfix-v2-0-5e6c3168e5f0@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.39; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com

Hello Romain,

On Tue, 30 Jan 2024 10:28:35 +0100
Romain Gantois <romain.gantois@bootlin.com> wrote:

> Hello everyone,
> 
> This is version two of my series that addresses the issue with some MAC/PHY
> combinations. Version one was sent on net, not net-next.
> 
> Notable changes in v2:
>   - Introduced a pcs op for initializing hardware required for MAC
>     initialization, instead of using phylink_validate() for this purpose.
>   - Refactored stmmac to use a generic PCS reference in mac_device_info
>     instead of a model-specific field.

As this impacts the dwmac-socfpga lynx integration, I'd like to give it
a try, I'll be able to give some feedback on that part probably
tomorrow.

Thanks,

Maxime

