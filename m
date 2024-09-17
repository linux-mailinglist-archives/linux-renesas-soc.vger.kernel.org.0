Return-Path: <linux-renesas-soc+bounces-8978-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFD797B2AC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2024 18:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F4052849C1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2024 16:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 762EA16BE39;
	Tue, 17 Sep 2024 16:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="QL0dA5AP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7E317C7A5;
	Tue, 17 Sep 2024 16:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726589547; cv=none; b=sdpUUvdpeO/bOn86dqMQXf4qqGnRO3vDbHy2n+AKR1g4Izr5sVFHCrxkDeK6JaAd9HWIfmu7tf/2mDNUQbqstOlM9qgw3yryqHD6mcLcPa9fJ8XyAuRDohYMGnPVB0FfvBF5BnfTDyiLP+8uyk/LZq6oWXkXBHs5M3ZGzwQ/ENE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726589547; c=relaxed/simple;
	bh=u5AchXwuslXX+oDasqsEBgEsAFc0KriYzHu09KIatkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nAlfcX48ZPjWO6ovOUzI2A6URy29CYFoXRbWm0RKMsjhRG9hSJu9B1qpttRQw/VhhX4TO9Dc6Ur6vVNS8idKvL9lgjySbvAX2SmaEgMZpjZp+/SaR+7waKBUpYU/IoYrw3vIypwrhq4gRj97WvipEJfUWtEDu2iXkaIo6gV5zhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=QL0dA5AP; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9MPR3Gi0E1mG7bQNnZXLbKzyWypXfL2V4986c7Vv+8g=; b=QL0dA5APyxQIQQqWDvf3CMPpLR
	1HFOwqRdsm+UzasktwzvhfnfpX+TL9ck/1QwACRdqhaDxfEgRMX5c6M5/7A6luCpJdTtuDsQ9HKCI
	kGGm8JTx9o6OzsWZBSQ6gAxjvusmf1hQtjhf9TQokz1142d7FIPdvKYeTRkOs+EFpnA6CVgdHjSH7
	vrtWvHjonFYTO2FdG/+D8BSgqMbhChxJbnam50UBwPh77Smq/d2Fw0DAHXhLjMNxhWDpC+7xsyBAV
	14I8sSyGM22mQiG6aB7VbT2bNTIL8zgYAiBi3G4622nGFAfYRuWD6zk62Ee0vLIwTW8uRbY2AIVgm
	qzZrrlAA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36908)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sqaoL-00075z-2r;
	Tue, 17 Sep 2024 17:12:17 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sqaoJ-00087X-2p;
	Tue, 17 Sep 2024 17:12:15 +0100
Date: Tue, 17 Sep 2024 17:12:15 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 1/2] net: phy: Expose the direct mdiobus access
 functions
Message-ID: <ZumqX50wtlmC4TRR@shell.armlinux.org.uk>
References: <20240906093955.3083245-1-niklas.soderlund+renesas@ragnatech.se>
 <20240906093955.3083245-2-niklas.soderlund+renesas@ragnatech.se>
 <20240910161934.7fafc5b3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240910161934.7fafc5b3@kernel.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Sep 10, 2024 at 04:19:34PM -0700, Jakub Kicinski wrote:
> On Fri,  6 Sep 2024 11:39:54 +0200 Niklas Söderlund wrote:
> > Expose the direct mdiobus read and write functions. These will be needed
> > to refactor the SIOCGMIIREG and SIOCSMIIREG IOCTLs to fallback to
> > indirect C45 access if needed.
> 
> I'm not sure Andrew is convinced in the sub-thread on patch 2, but also
> I don't understand why you need patch 1 at all. The callers and callees
> are in the same module are you're adding non-GPL exports, or am I
> misreading?

I don't think any of this is required, or even desirable, and I am
of the opinion that falling back to indirect C45 accesses is a bad
thing when this API can be used to access devices other than the
attached PHY that is being used for that decision making.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

