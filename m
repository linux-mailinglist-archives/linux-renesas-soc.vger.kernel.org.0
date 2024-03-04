Return-Path: <linux-renesas-soc+bounces-3453-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B2987046C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 15:41:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC5F11F22C86
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 14:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E64703B29A;
	Mon,  4 Mar 2024 14:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pwOLp/q2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580161E484;
	Mon,  4 Mar 2024 14:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709563300; cv=none; b=mxDVpVFDwg5oDM4N4nD9NpYJ1GRIJS5Ih5Q563PtPcASd4b1wTHQtP0Ew5pK8W3Bp3ib+uWQfq/DCvNsE4wprwvrs2ShKKMtN3mQbVAX3DzqLe2BzJSkB7ARGlv5HGkHKL2O/F89ewPvC4TDZ0q1cnAldndmHKkEI+QSS1NZZLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709563300; c=relaxed/simple;
	bh=LRzxFEcDukwHgIQew+0nDkMwscHlEfV/iOFh4KYWMB4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fHFEx2srCC90n4md9q1Yd2sII7AEcpn8PPU4Z3B14wzn1XpFooaOyb51xNcUbVlu65jLl99bFZYLP4ZOcrRLT5OdA8TOdqv+HXejlJzqRduZxaDn76kzYlOxWpTQWcp8nh2Auhwdwq18hPw3i7kXYr7mlBdKNKFpCWyhPYiuXXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pwOLp/q2; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C28A51BF20C;
	Mon,  4 Mar 2024 14:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709563296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JB4712Zmm5XygfOkhRNsGTmf84IUmoX3p3owXLkMnrY=;
	b=pwOLp/q2NMfAhLnUpRwHw4RnWdElX/CLSXWTpOPs0zic6ZiTu5twmlh+kERXKoYgZRylLJ
	CQw8z4GeHv3qna7mFij6jURThx5evriRiOmvGL3b8HV5IB+SdT0psjNX9numwZl+QB2bXe
	jedsjxzbt0X9lErHaDSsAqf5ryoROSNB2n1LIUPryWOxeiKnBHOGRhjDSIKmM8f6EiE+Wf
	mTLhjBGV/r0DjRFnERtQTF3SucXLgJDgoSG/b03xaLlPP8mn0qi1ilxhQIcsKB3Q+kVRfw
	ONwmaD9NSjdj0MZOY8kPPO5iLWD7orf4Z+eiFstCwU14FchxGjELfaYaEtFJuQ==
Date: Mon, 4 Mar 2024 15:42:06 +0100 (CET)
From: Romain Gantois <romain.gantois@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
cc: Romain Gantois <romain.gantois@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
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
Subject: Re: [PATCH net-next v5 1/7] net: phylink: add PHY_F_RXC_ALWAYS_ON
 to PHY dev flags
In-Reply-To: <ZeXbV2hIBs7OcEDK@shell.armlinux.org.uk>
Message-ID: <1a5ba9e2-9cf2-00be-3a0f-03a8d6bfb04c@bootlin.com>
References: <20240301-rxc_bugfix-v5-0-8dac30230050@bootlin.com> <20240301-rxc_bugfix-v5-1-8dac30230050@bootlin.com> <ZeXbV2hIBs7OcEDK@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-GND-Sasl: romain.gantois@bootlin.com

On Mon, 4 Mar 2024, Russell King (Oracle) wrote:

> > the PHY goes into suspend.
> > 
> > Signed-off-by: Russell King <linux@armlinux.org.uk>
> 
> This is not the sign-off I sent you with my patches. At the very least,
> it doesn't acknowledge my employer, and also has the wrong email address
> that I use for _all_ my kernel attributations. Therefore, I can
> definitively say that that you made this up. Please correct it back to
> the sign-off in my patches that you derived this combined work from.

My apologies, I'll fix the commit tags.

Best Regards,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

