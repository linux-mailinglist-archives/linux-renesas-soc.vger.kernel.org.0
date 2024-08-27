Return-Path: <linux-renesas-soc+bounces-8361-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1C6960886
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 13:26:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8735D1F2375B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 11:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A6719E83D;
	Tue, 27 Aug 2024 11:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="ai1XaIxA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A664414;
	Tue, 27 Aug 2024 11:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724757974; cv=none; b=pd/rlNvOEqNoEiDGRYLGbbhlzQL2XU1nedK7062gfISGSVA3K3e8Le8mRqjuODu3GkdCSYLCN1zugkks91JM4KsdEzoq/+/SWF8AgvjeRTqtn5+6UbJ/3i4tTV5qjDdrl7GN5dEPAbYzyldq9N1nrnBNZZq1T7cD8dQrzTqYZ5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724757974; c=relaxed/simple;
	bh=Hn2MFMhf4wm1sWJ1Cdtt6Zzb/TRPOxG4INVnvfR5k74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VmSC/hsolJq8Xl3SGG7oQwhALZ4uEcUwgJ5eSj67c4zhx4VdcpkVWGDR5zPRjLoyYVS5fqhBhP7jUBGdQ6NrapKgcLmkJ9qrb3UzRCRR5YCkeOHIL5hf77KfEmTAUZEJsktneQvqKDl3oQnm1BwBu/ddee12C1XooxtM9Gkb7TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=ai1XaIxA; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pPyJCT/R91XYkwzYF/KN6tVWCJJRmOpGOpF/7PNudjU=; b=ai1XaIxAI7LILZRBhBK2yNI2aq
	hdpB046enSIHSlmoCaWmk0Qc0fK7/4H7LARWDtxKmks4YqeSG+NvYYWScheosTcjibkULw++fH325
	thEf8Fa3V0Oi2mvLU9tLJyBjvPzxsbcth0MEDeZXWNA11Po+UzwVpW6Oy6x5hww8C8PLR76hyh6Z/
	YYsn+i1y4i2q6PPEc7m3bUtcftKC+1tYxhSjy2IXwvaV2DwQqczbYIL7T1WEvKzT5O/tyKdw3XD7M
	J3zlrf5eToWI6XdfwOkrslYrk11MfBsMJ1Mpf33a8t9lxoQPCyJf7q1iyHlMaG1w23TT56gnkdh2x
	R8MDOnEA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58178)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1siuKg-0006sT-2Q;
	Tue, 27 Aug 2024 12:25:54 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1siuKc-0003Of-2M;
	Tue, 27 Aug 2024 12:25:50 +0100
Date: Tue, 27 Aug 2024 12:25:50 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Yangtao Li <frank.li@vivo.com>
Cc: clement.leger@bootlin.com, andrew@lunn.ch, f.fainelli@gmail.com,
	olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, ulli.kroll@googlemail.com,
	linus.walleij@linaro.org, marcin.s.wojtas@gmail.com,
	alexandre.torgue@foss.st.com, joabreu@synopsys.com,
	mcoquelin.stm32@gmail.com, hkallweit1@gmail.com,
	u.kleine-koenig@pengutronix.de, jacob.e.keller@intel.com,
	justinstitt@google.com, sd@queasysnail.net, horms@kernel.org,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [net-next v3 3/9] net: ethernet: cortina: Convert to
 devm_clk_get_enabled()
Message-ID: <Zs23vqQn9zqOQ62S@shell.armlinux.org.uk>
References: <20240827095712.2672820-1-frank.li@vivo.com>
 <20240827095712.2672820-4-frank.li@vivo.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827095712.2672820-4-frank.li@vivo.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Aug 27, 2024 at 03:57:06AM -0600, Yangtao Li wrote:
>  	ret = register_netdev(netdev);
>  	if (ret)
> -		goto unprepare;
> +		return ret;
>  
>  	return 0;

Same comment as per patch 1. At this point, I'm going to stop reviewing
your patches (because I don't want to waste what little time I'm able
to spend in front of the screen raising comments against the same issue
throughout a patch set) and I ask you to do your own review of your
series for this pattern - and also consider where using
PTR_ERR_OR_ZERO() may also be appropriate in any of your patches. See
that function's documentation in linux/err.h.

Please wait at least 24 hours before reposting.

Thanks.

-- 
*** please note that I probably will only be occasionally responsive
*** for an unknown period of time due to recent eye surgery making
*** reading quite difficult.

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

