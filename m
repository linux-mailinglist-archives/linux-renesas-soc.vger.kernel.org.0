Return-Path: <linux-renesas-soc+bounces-3445-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC50F87030D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 14:43:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CD071F21046
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 13:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2BEB3F9E9;
	Mon,  4 Mar 2024 13:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="SQIxh9W3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749183D963;
	Mon,  4 Mar 2024 13:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709559770; cv=none; b=axgzzJFP+hcB0UGuwb8HT/+q9ykWRO4Jyb/pWQrZinEiPNn0tUDodr7Mbs7h2nJCFAYEx9NPyqM91Ktaxww5FQLuZhkvYl2YU66IhO1a/D+RVwTAmIut4Z39E3UH9CfUM4KVRDgLXicch7+LVJrgvYuoG1GYbOckZVe9Rxf8b04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709559770; c=relaxed/simple;
	bh=xGxH/EnFWiuQkzBRh6TIHCe51eTWTNro+b84NRLBuWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J4ff5mArpDA117nOzaQJYikZeKTSjg9mQSIhCPzHmZSBBqFOQsJL443JVmO/HiNZTLcFGYVLbBkgWhjHfo1oQUiSYcUK5nxMRL6CxOzLWkwcCdYC0nRaFaP4yms9kPymg03Jmn92pM8yCgHDIlOvKYpGSKYgewOn8AS/KAAaptc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=SQIxh9W3; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=XALoiXLvzUkqvpNacmv+aPG2cHfQQDerRFqCo/TWfo4=; b=SQIxh9W3iqRh6glS39ukbI4R54
	7Jbld9A5HbMEK68pGw1ge32lJZ7eb5syEWDQkS8ieZxP+US53j2NpSzbiGO/EvZL0EX+qcdhNepSk
	WC8ifUQAMdRqPAkd2y70l/QYyvqao0jCUijCCpK0gc1c//NsxJpod6nkS8p6uBTaKkuM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rh8au-009KNE-St; Mon, 04 Mar 2024 14:43:04 +0100
Date: Mon, 4 Mar 2024 14:43:04 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next v5 4/7] net: stmmac: Support a generic PCS field
 in mac_device_info
Message-ID: <092bdca1-78f1-46f1-bd17-ac714102e097@lunn.ch>
References: <20240301-rxc_bugfix-v5-0-8dac30230050@bootlin.com>
 <20240301-rxc_bugfix-v5-4-8dac30230050@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240301-rxc_bugfix-v5-4-8dac30230050@bootlin.com>

On Fri, Mar 01, 2024 at 04:35:01PM +0100, Romain Gantois wrote:
> Global stmmac support for early initialization of PCS devices requires a
> generic PCS reference that can be passed to phylink_pcs_pre_init().
> Currently, the mac_device_info struct contains only one PCS field, which is
> specific to the Lynx model.
> 
> As PCS models are hardware-specific, it is more appropriate to have a
> generic PCS field in the mac_device_info struct.
> 
> Refactor the lynx_pcs field into a generic phylink_pcs field.
> 
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

