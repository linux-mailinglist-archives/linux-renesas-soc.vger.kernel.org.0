Return-Path: <linux-renesas-soc+bounces-8832-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0E696FC95
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 22:18:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D7AC283408
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 20:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C080E13D251;
	Fri,  6 Sep 2024 20:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="YEoXGHqU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C331D1B59A;
	Fri,  6 Sep 2024 20:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725653915; cv=none; b=HGN2XimrYxToljjbsUs16QXxD9jTIs/OOiwZ3+Yx+e3K/r4vMQuDw7xj5C1C+WfUBZJ9GzCxgdmdeVOnyWBlB2EY+Ygm17HxrDtHRS0oHJimVDuwl6mOx/yiwJ/LKHlQcJbOG0sdGjgfDT2JEt114Lp4JCxPCu3m6qlIvbWubpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725653915; c=relaxed/simple;
	bh=R1XbdcvWqAynf9FFP2bxtjTaRJoDIE1rVBPVDM141Sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TBVLt2IGdHHeJ1gtrMa7q9BhTXvIrLYu8xPjKNgnaDfQrGM3kmkSTAMg3+HWDNbDJHskOK8n8VsCDpJmx1SQ8ffY1fjZTie9DbSinpGPxByiL+iTKfQQE+61WdYmrOfWvwOM7pyTh1m1S3Vdl0hoADXb5g5H/yFwsKAGlNzDpCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=YEoXGHqU; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=/elSOm7rItG5b9wtp5bNWLeO6G4Dz5qp65sPHfG+V8M=; b=YE
	oXGHqURL6tamfbCLFhtcu8pnYkj1YW7nqoK3f62UTb+a4QEiByFLzRtzbYRE2OqNoVyfNOVeB58mf
	HqARslXcnL+5tlCaDF481esZgBC/EkzTUDzQGIid3piMNTnRHuWlC5kC6jZ7ptaBBsDbONaAfLqcM
	wpVztT2A5t9K6n0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1smfPM-006rBm-7F; Fri, 06 Sep 2024 22:18:16 +0200
Date: Fri, 6 Sep 2024 22:18:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	Dimitri Fedrau <dima.fedrau@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 2/3] net: phy: marvell-88q2xxx: Make register writer
 function generic
Message-ID: <d34d5dd3-b707-401a-b127-ce156ad019c5@lunn.ch>
References: <20240906133951.3433788-1-niklas.soderlund+renesas@ragnatech.se>
 <20240906133951.3433788-3-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240906133951.3433788-3-niklas.soderlund+renesas@ragnatech.se>

On Fri, Sep 06, 2024 at 03:39:50PM +0200, Niklas Söderlund wrote:
> In preparation to adding auto negotiation support to mv88q2110 move and
> rename the helper function used to write an array of register values to
> the PHY.
> 
> Just as for mv88q2220 devices this helper will be needed to for the
> initial configuration of the mv88q2110 to support auto negotiation.
> 
> The function is moved verbatim, there is no change in behavior.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

