Return-Path: <linux-renesas-soc+bounces-25575-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FC4CA4AE0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Dec 2025 18:10:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A428C304EB74
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Dec 2025 17:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8214130C342;
	Thu,  4 Dec 2025 17:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="1e3ohZsM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B245274FC1;
	Thu,  4 Dec 2025 17:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764867916; cv=none; b=qOBMF0nrv1kcKq5d/9c3s4Dss9APjQCnvGJNJMcaq6h78c+AZYnBnLj959WydfgmpdyeaLqqcxyAwebxfh9DVxd5DEGbr6u95XJwaqBhpA/1jJnislfvTEweYnnrKRMzr+0xetPeLofHwbhjBQdT15HZ1WBnbpa+lWKvfztyWbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764867916; c=relaxed/simple;
	bh=btE0EemxzOmWTXQzN6O41g5qzhtImddYS9EehFEYzdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=plctvtbUGYZk0YqJHCiy6RpcVhiAfWOcisVONgBCplTOiD2HhG9oQu3WBJAg8Li8AkP5sKsca3lbBbRzdvjKjBWDcDHlYDXuFyiq2m3BmapLVL2USDqw4av+pifbIl4JD+T4vC5vUaUn/0dJgTn5oGEjb0yuoj0YWbmOcNdaD4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=1e3ohZsM; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6d6GxWjoCL+f16M3XdST5sRPrd8wqnlNTQ+6puSwSEg=; b=1e3ohZsMeUa0onJHJuMHzrb26o
	nifll5imBe+0uWQMHJhRpSMji8SYQ+6Am2rxmhtfPe1s3gDtmGj9MgV3tpEvAlJziz/A63DCiABT2
	M29EjSdzdzhgefgOwrViwHleaok68xwUtJ6f7x8i6B81z71aIa/K8Tj7rBDTLDhjRGffFHhf0OQVm
	ST9meqK1tzGM4zGZ0EUDYgI7S3tQpGfQojBzktIJ/fDxfHTjbTP6TYUuSpYEv+DonGbXzzFFF2wo+
	DHJCE6JkYJ35eMBFBglzTnEUcX2abSxrgoPDh/4unUXm37Uw3QOBPjGDlOsiKi1DpMddcOxGZDZuu
	UpIgFzAg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46294)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vRClI-000000003nQ-1rWg;
	Thu, 04 Dec 2025 17:05:00 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vRClF-000000001AG-44Ii;
	Thu, 04 Dec 2025 17:04:57 +0000
Date: Thu, 4 Dec 2025 17:04:57 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: prabhakar.mahadev-lad.rj@bp.renesas.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, geert+renesas@glider.be,
	biju.das.jz@bp.renesas.com, claudiu.beznea@tuxon.dev,
	magnus.damm@gmail.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next 3/3] net: stmmac: dwmac-renesas-gbeth: add
 physical port identification
Message-ID: <aTG_OVLXfvFXzs3i@shell.armlinux.org.uk>
References: <20251204163122.3032995-1-john.madieu.xa@bp.renesas.com>
 <20251204163122.3032995-4-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204163122.3032995-4-john.madieu.xa@bp.renesas.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Dec 04, 2025 at 04:31:22PM +0000, John Madieu wrote:
> +static int renesas_gbeth_get_port_id(struct device *dev)
> +{
> +	int port_id;
> +
> +	if (!device_property_read_u32(dev, "renesas,port-id", &port_id))
> +		return port_id;
> +
> +	port_id = of_alias_get_id(dev_of_node(dev), "ethernet");
> +
> +	return port_id < 0 ? 0 : port_id;
> +}

You fall back to the ethernet alias, which is essentially what
devm_stmmac_probe_config_dt() will assign to plat->bus_id. So, is
there any reason we can't just use plat->bus_id ? Why do we need a
special property?

I really don't like the idea that, with the proposal here, we'll
likely see the stmmac platform glue spawn more platform specific
code. This doesn't scale.

So, the next question: should there be a standard way to describe
these attributes, rather than having lots of vendor specific
properties describing the same information? Should this be part
of the generic binding, iow
Documentation/devicetree/bindings/net/ethernet-controller.yaml ?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

