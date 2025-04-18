Return-Path: <linux-renesas-soc+bounces-16154-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24019A93A18
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 17:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48AD4462FA2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 15:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4637F214227;
	Fri, 18 Apr 2025 15:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="4Xn6J2jp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3A7213E74;
	Fri, 18 Apr 2025 15:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744991446; cv=none; b=BuVfmISqqzLJBwakDGAe4458BpXStiaimK0KNT86ztf6OpbWysHCjwnU7wrDhOjSiMBFZ3jynQ3fGq0JQmfO9yMEn5sw+zeXYhfuTB1qqca1GK40FBXXCSM/X5DIcu+3c2hSZjaE1JfJAmi76fUQf1AdhUaQLTSClVu0cHzMdbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744991446; c=relaxed/simple;
	bh=hrzVcPp5BwTWABo0Z+wZXmfOCdBI4JzDBoT8ibQ1qt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P0wnPrLsr/7OzZp+XaoH+jFOHNY0TNjsxG8gHuFlUTX9jVOQ3TUax5R7lj2adKxH3ZCHoJ6EPNVbq8S7AYwWn9LgDl/khmLF/Mpsf0awsWlRqS68riNOh7YPRv8fD+qa04kNyf0CRKWEx7cAGuU17zoBxMxSfdzZjrn1NbQnvXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=4Xn6J2jp; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=BF9rJm/ZA+nCMIToAquPbKoRa1VgB5PGmOXYUNm5WDc=; b=4X
	n6J2jpCLomojMFKAcpdW1SO+H1AOLqKIjYDsWJZydnUI8sQi5pSlNmTpHo1JTuZfS+mg9yZAGAN2o
	WJm/zwwCG01CJ4Qle15rrbcZ8EBNxNEUi1GmdvzGscNlDT9NtQif32lU6QiPjg4u7SKoCVUZsPGgT
	IGEyxoBAQO7f8GU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u5nyw-009uI0-DP; Fri, 18 Apr 2025 17:50:22 +0200
Date: Fri, 18 Apr 2025 17:50:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Dimitri Fedrau <dima.fedrau@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v2] net: phy: marvell-88q2xxx: Enable temperature
 sensor for mv88q211x
Message-ID: <a2f9f3ec-d939-4a46-99a5-49ce7d86458c@lunn.ch>
References: <20250418145800.2420751-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250418145800.2420751-1-niklas.soderlund+renesas@ragnatech.se>

On Fri, Apr 18, 2025 at 04:58:00PM +0200, Niklas Söderlund wrote:
> The temperature sensor enabled for mv88q222x devices also functions for
> mv88q211x based devices. Unify the two devices probe functions to enable
> the sensors for all devices supported by this driver.
> 
> The same oddity as for mv88q222x devices exists, the PHY link must be up
> for a correct temperature reading to be reported.
> 
>     # cat /sys/class/hwmon/hwmon9/temp1_input
>     -75000
> 
>     # ifconfig end5 up
> 
>     # cat /sys/class/hwmon/hwmon9/temp1_input
>     59000
> 
> Worth noting is that while the temperature register offsets and layout
> are the same between mv88q211x and mv88q222x devices their names in the
> datasheets are different. This change keeps the mv88q222x names for the
> mv88q211x support.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Dimitri Fedrau <dima.fedrau@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

