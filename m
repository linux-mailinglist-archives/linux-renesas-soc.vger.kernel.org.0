Return-Path: <linux-renesas-soc+bounces-8932-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAF5974403
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Sep 2024 22:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F4BE1C2386B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Sep 2024 20:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93416188CB4;
	Tue, 10 Sep 2024 20:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ZK/dEZUh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AB2566A;
	Tue, 10 Sep 2024 20:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725999711; cv=none; b=M+oJIaQ4Yrdk+T+Ghdri750i1SsNYKt1LdutD3HJ0o0ReSZJyyo30+m5ZAe1XtEba1r4HVuxrSMdhAf7c3hI3c4+SaDth1v03BlRQoEF9fBmQWWvKI6dl1qJ/cRYjXestCBk6WbyfffE/Ig6ijhihSNZsEzf9avA3ZGA8qBn06M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725999711; c=relaxed/simple;
	bh=R1XbdcvWqAynf9FFP2bxtjTaRJoDIE1rVBPVDM141Sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dm60t/T/mjRq0d+UaHm7EtnMAFQnNgbtaD66uqXmqmwBVJjf/ez21H/zV+4jBl5shxfWgHu0RatC10PbWhbFSO1T0GinEGz4vUcShOj3qL7Ifx5xCyMdVdWAYSnjf51u/YLwzhCCN0NT9itBKmw0AjvIvh4xMZLfjP+P0oDPI7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=ZK/dEZUh; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=/elSOm7rItG5b9wtp5bNWLeO6G4Dz5qp65sPHfG+V8M=; b=ZK
	/dEZUh+vV+eVzH1UNK/gS8BfRv81P04BwYu3pCfrrQJgeE1KnI9PJ22B2sbQQ3G8tERKJv86Gb5a0
	PPzbl9gVXPMOs1twbMx8oOYyL0b3MiJ4tAU8IL4o/LCvcN2sNSlnJ2/bVwTDmWV7w3Z8+H9XJzehi
	GxkzVt/xZWGTlWI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1so7Mq-0078su-6f; Tue, 10 Sep 2024 22:21:40 +0200
Date: Tue, 10 Sep 2024 22:21:40 +0200
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
Message-ID: <b2f32ece-3ecf-439d-b1ae-f91879ab7bf0@lunn.ch>
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

