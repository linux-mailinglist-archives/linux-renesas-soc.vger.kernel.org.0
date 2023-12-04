Return-Path: <linux-renesas-soc+bounces-665-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CA88041DB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 23:50:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D6E9280339
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 22:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CC0C2374A;
	Mon,  4 Dec 2023 22:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="MmwSB5MB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33A98CA;
	Mon,  4 Dec 2023 14:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fFWWPwBvSjpA61dgQaSff+CQ0wkrzPLoFdIafT7POfs=; b=MmwSB5MB7HGZIbwBA/CUUWkTT4
	3gOha10TwRrnS1SLAlTfJsmF2mGEhzlvkeb2uFD5okOiP5Xixx9NpMJqF2SMSRmpwqJ9KvVVNzpNw
	8YzI1PRjGX7l0mEMNRpohSK7BHkvxaxVe4EkMNsVggNNLkCCELm5/4EOS6fPFVotAu/r2ZF167xgJ
	6RCZ+L9PUO/Bipta89/QNg9TOQaDQAfgR4fecpLasUImOJFXbAlk7pMitNIyvKxaFu7cIueAz2FvL
	orUUupQcJU8XVNS9PuIMU94b5aIvJQ6E820bNlcya36onwBo8IKMDbfQEx8MtLqHjFWuoj5udxpFc
	d9LFiUJg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60080)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rAHlc-00066D-23;
	Mon, 04 Dec 2023 22:50:20 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rAHle-00014w-HX; Mon, 04 Dec 2023 22:50:22 +0000
Date: Mon, 4 Dec 2023 22:50:22 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	kernel@pengutronix.de, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH net-next v2 3/9] net: pcs: rzn1-miic: Convert to platform
 remove callback returning void
Message-ID: <ZW5Xrk1hkKtP1bES@shell.armlinux.org.uk>
References: <cover.1701713943.git.u.kleine-koenig@pengutronix.de>
 <82b728e14a68c421e269eff3b8083d9d6e62d956.1701713943.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <82b728e14a68c421e269eff3b8083d9d6e62d956.1701713943.git.u.kleine-koenig@pengutronix.de>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Dec 04, 2023 at 07:30:43PM +0100, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Link: https://lore.kernel.org/r/20231117095922.876489-5-u.kleine-koenig@pengutronix.de
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

