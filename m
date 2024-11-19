Return-Path: <linux-renesas-soc+bounces-10608-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CDC9D3108
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 00:40:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE1D1B23C39
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 23:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DBB71D318C;
	Tue, 19 Nov 2024 23:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="zZCgAI4O"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60811BD9F3;
	Tue, 19 Nov 2024 23:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732059632; cv=none; b=NYIqo7S7Kyi4kRbivGcGYNePcC2MIGN6I+P3vREdwT/0FvOlAGhmT5ieN3UdGqwzaMWiNEwMH2NF+xVBfm1sqtRAZRScjnrBsj/0BcY56sQkYESH7Lyi3ukBGOKQ2mrJdwtGjNMVaMgRDbJR5pLNQ01JyJNz46K5BgoFGxikdRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732059632; c=relaxed/simple;
	bh=vJVKu8SybG0lkuiGLlri3v9gCW+VrWbeJymGrMs7p5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OHR2wKYhgxOCmMFGfFdD6Jkadw65mTY/RVy+211NXc+VBhN/u1tqtszPkN7K80oF3iFt05g4pRBEMSqrB4uWyHaXv+fSl6993dWMtkHZmjHFt/EiYLVCmm+jH+3MqniNHn0UsywinnZhn/eOGi9ZYOxUH0ONsAXH2IMl/1X9jYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=zZCgAI4O; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AlHTVEQepeuGReBeEvUZVoo3TC49/XqTeLtHLo3eaKc=; b=zZCgAI4OjQ6kjZImAkeBsfK7Pc
	lziXnskTXYnMSi8KtFrrbz/2d1FyYUG+m6UJso/kJsujM1nNnW8BLp38QiF0Xcun6/a1SHMCnTq59
	Z/242e2GjTcFiuOymQL4cZ87xqw7po+h82bE6npAAEyF1AdDNsptTRJMJ/mwmkj3fB0yqS1AlEzzM
	zyPOJRp9fPtDN00xGLjbuQqktTmI+j1ynIHsSaqVY2AusBFcNIx6K0iyOuRTaqFb9JtE70+bPTyUr
	al1btfcBrWFrADZiMBe4EF0dVDGgIObaKE0hRQSri6fIYTSeq/iRKlHi5BYn9M7kM1e9XAL1ktgQt
	/UEaa3Fg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38632)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tDXpW-0004ZP-0u;
	Tue, 19 Nov 2024 23:40:22 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tDXpT-0006Tg-02;
	Tue, 19 Nov 2024 23:40:19 +0000
Date: Tue, 19 Nov 2024 23:40:18 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Rosen Penev <rosenp@gmail.com>, netdev@vger.kernel.org,
	Kurt Kanzenbach <kurt@linutronix.de>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chris Snook <chris.snook@gmail.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:RENESAS ETHERNET SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCHv3 net-next] net: modernize ioremap in probe
Message-ID: <Zz0h4pMXn6KzRViL@shell.armlinux.org.uk>
References: <20241117212711.13612-1-rosenp@gmail.com>
 <20241117223850.GK5315@ragnatech.se>
 <CAKxU2N_VMSEo30u-C1VK4+jBSUBTo6QT1vgd14RQSS=P+g9w+w@mail.gmail.com>
 <20241119203916.GP5315@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241119203916.GP5315@ragnatech.se>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Nov 19, 2024 at 09:39:16PM +0100, Niklas Söderlund wrote:
> On 2024-11-17 15:07:53 -0800, Rosen Penev wrote:
> > devm_platform_ioremap_resource_byname has no res parameter, which is a
> > problem as there's this lovely line below it.
> > 
> > ndev->base_addr = res->start;
> 
> I see, maybe we can refactor that too? I see not all drivers set 
> base_addr, and some even set it to the remapped memory returned by 
> devm_platform_ioremap_resource_byname() or such.

base_addr carries with it an issue that setting it on every driver is
likely not a good idea.

Namely, that it's "unsigned long", it's reported to userspace, and
on PAE systems, unsigned long is 32-bit but the device address may
be >32-bit.

I haven't checked the user APIs, whether that restricts it to 32-bit
on 32-bit systems.

In any case, whether base_addr is set or not is probably best left
as-is and not have some "we must always / never set base_addr" rule
applied to it.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

