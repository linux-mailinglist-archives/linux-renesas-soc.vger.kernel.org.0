Return-Path: <linux-renesas-soc+bounces-21159-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAC1B3FA7F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 11:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D6B216F8FE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 09:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2310F2EB862;
	Tue,  2 Sep 2025 09:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="FqRiGX+2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68E71D2F42;
	Tue,  2 Sep 2025 09:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805690; cv=none; b=F8siuzINTUk8Sal0uBf/lD3McnkEKWX3bEzsBswd3SJi2L05Vz/r4K4Q5IQBOoUUKnRHsDpHerT+ttqQBL4zSbwi2MEAkt3mwtJhV++KvZ4GiTEXE8M/jZtA56VGqBNVmDLYF2eQRynUOme/wLYnNxDRRjINFb3/xSFxgVGINqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805690; c=relaxed/simple;
	bh=uAi427Qs5KRU3DRKNgGQmaELYcEJOUtVuLXg53CQ5rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XYjHMAR7o8bCw/7qgjP18HxMlRdWSnLuBVJBFmbUOG1qRUvC2giQaCKPA0AD1eut1O6UcDJGjGbborQJQn3ftpHz5m2tJzUAo+c4pi3IW8VVak3E9Ed8ZEJcmTVa4kkX0whET/EktFlRvz5DblBZvSHmjoS4JUNc8q55LEc8XmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=FqRiGX+2; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=34Y1yLTep9znhYAIr+QK6BAuH5EBj7CVYSKq7UCZVAg=; b=FqRiGX+2mcHMQezRGa4nCBeXK9
	FMLkqusifE8FDz5tiLl8OtJQtaS7vKnQvTGtzMv7MBaAJcO6SNq5OtzSGnqsS5ue7cXObHVN9GtU0
	v9tdsGe/zuAKovBV6VXTklUOEUJAImGXKyHefs2ARy+msK4STGX/WNVDFZazJxhybiEePMG7yWBQ0
	5tRGD7sJXnCFE1C0hrGVu4Ev+GuKw/9EMjMqMO3bWcoUMRcZBHxsfKfPoQ1tCYwM6tJdtEKa9m2i1
	myQYJ/Sg59Jq48Z/t1MoZJIlF55BFlbKXJ6Ya99D3DxFHYjFcKFVfDKdxKNNYSJIAbOKg5m/uWvBJ
	eryGAOsQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43538)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1utNPK-000000007S7-06GK;
	Tue, 02 Sep 2025 10:34:30 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1utNPF-000000007sF-2o3H;
	Tue, 02 Sep 2025 10:34:25 +0100
Date: Tue, 2 Sep 2025 10:34:25 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next 10/10] net: pcs: rzn1-miic: Add PCS validate
 callback for RZ/T2H MIIC
Message-ID: <aLa6IeZsGeESpMKQ@shell.armlinux.org.uk>
References: <20250901224327.3429099-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250901224327.3429099-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901224327.3429099-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Sep 01, 2025 at 11:43:23PM +0100, Prabhakar wrote:
> Add a SoC-specific `pcs_ops` pointer in `miic_of_data` to allow
> custom phylink PCS callbacks. For RZ/T2H MIIC, implement
> `rzt2h_miic_validate` to restrict valid interfaces to RGMII, RMII,
> and MII. Assign `rzt2h_miic_phylink_ops` with the new validate
> callback to the RZ/T2H MIIC SoC data structure, keeping existing
> PCS support intact for other SoCs.

This seems completely pointless. Please review commit 508df2de7b3e
("net: pcs: rzn1-miic: fill in PCS supported_interfaces") to find
out why.

Thanks.
-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

