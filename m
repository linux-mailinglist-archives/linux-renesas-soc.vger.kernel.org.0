Return-Path: <linux-renesas-soc+bounces-3074-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1349E85F2F9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 09:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AC1D283132
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 08:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D19D1B808;
	Thu, 22 Feb 2024 08:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EkUA7yLc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE0B225DA;
	Thu, 22 Feb 2024 08:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708590669; cv=none; b=I0qpyMhK6pXlpa+sZ15Ph5dxbW5fCs6l1hoBqx1FUWSfI5XikHpZVMpS+/8LKp6TpD0/PiI8B5issIwLsOOwY3mFCjrs0gTtFyF97LR3nbQaKR6lrYCGpRMyRdSoYSalA8NUz58Vyq2uy/qy+qCpzvJSCxQnoHtG/Z1YJv8mw8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708590669; c=relaxed/simple;
	bh=fr7dYy0DVPL5Ned5T+pSWbcMD/qBAeoXzr5PvrYolOs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qRN2EZx9BHrZwAD4LxTGxbf+HtOpbTK4jjU48BJ9x9GABST5l5MYtJUY4cxtE6Zq+e6PvbpJqRWdKiFChWhNKoz5Cj8/AUp5eSepUKGzvdxlGMEHizH54ZSLwv3pcl1E9hZmyEJay3AnwthPn71QEfcRjNsX7kO+nmk1pRAK3Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EkUA7yLc; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD0E72000B;
	Thu, 22 Feb 2024 08:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708590665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5PMuuuclVIaSoKYSTG9l7tX59EQaHIKNZ7KCMWv4BXM=;
	b=EkUA7yLcRa5a2pXFrOZZ9T6y/dDaNwUWqLGjiLkJA4zlS/MdaAIZThQYB55si4SIhYDEtS
	cA1GG21UwP7j0GHYyFc2i1+5McyPboIwsq55o2etuZ19AUBz6Xmxd90sR6PBV3TIojpni5
	bHgTBvf3hHHCoxp1/Q6t35HBamGHR/Yzo+poHmzca4fY2Tq3XMwQvfNeboCKab/P5Cq4hq
	2Ge2QXxYItSZUT+upCO+oe/ZPmS2cg6PLC6x83aHa0WZllgORRSzEdHWJTswe9jGLZVG9l
	828VIfeCEXtJVNeiSfyoJVIPa4pprTxBszWRHeabGcifMxfQGg/2bS9QmYV4JQ==
Date: Thu, 22 Feb 2024 09:31:33 +0100 (CET)
From: Romain Gantois <romain.gantois@bootlin.com>
To: Simon Horman <horms@kernel.org>
cc: Romain Gantois <romain.gantois@bootlin.com>, 
    Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
    Heiner Kallweit <hkallweit1@gmail.com>, 
    "David S. Miller" <davem@davemloft.net>, 
    Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
    Paolo Abeni <pabeni@redhat.com>, 
    Alexandre Torgue <alexandre.torgue@foss.st.com>, 
    Jose Abreu <joabreu@synopsys.com>, 
    Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
    =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>, 
    Maxime Chevallier <maxime.chevallier@bootlin.com>, 
    Miquel Raynal <miquel.raynal@bootlin.com>, 
    Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org, 
    linux-stm32@st-md-mailman.stormreply.com, 
    linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next v4 2/7] net: phylink: add rxc_always_on flag to
 phylink_pcs
In-Reply-To: <20240221190740.GG722610@kernel.org>
Message-ID: <46da0819-13f6-c44c-eee0-fb87468ffe51@bootlin.com>
References: <20240221-rxc_bugfix-v4-0-4883ee1cc7b1@bootlin.com> <20240221-rxc_bugfix-v4-2-4883ee1cc7b1@bootlin.com> <20240221190740.GG722610@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-GND-Sasl: romain.gantois@bootlin.com

Hello Simon,

On Wed, 21 Feb 2024, Simon Horman wrote:

> > + * driver authors should consider whether their target device is to be used in
> > + * conjunction with a MAC device whose driver calls phylink_pcs_pre_init(). MAC
> > + * driver authors should document their requirements for the PCS
> > + * pre-initialization.
> > + *
> > + */
> > +int pcs_config(struct phylink_pcs *pcs);
Yes it should, thank you for pointing that out.

Best Regards,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

