Return-Path: <linux-renesas-soc+bounces-27453-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDVaIV2ud2ngkAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27453-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 19:11:41 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7998BEB8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 19:11:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D357E3019818
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 18:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7787734D4C4;
	Mon, 26 Jan 2026 18:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="NrPEk1J1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E6F2E54D3;
	Mon, 26 Jan 2026 18:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769451096; cv=none; b=qH3heGtf2OzxhXPVQIgODp5aGJ055DtP87vyFVAboI9R69nhMo9Fc45e68gfode1TqX3Tf2/QUKga+IjJfZokz6ZfJl/65+Aqa3HRlhxk0NGNMjC/HzXbBpQxo2DI9jFbeFoeO4D2kNfCsxb5Nu481uX5KARdgtox7GfCtM2RGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769451096; c=relaxed/simple;
	bh=3V0RDusxbh6pnXCeXi+v91jcVPHVAE66LeVm2jo3hH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i0oWxhK+0f7AqVbkCEU5zxt6d4KW8eQLaaK6xU7DPLW38n5rkzdqumhdiZj40L2xZAJciXxylOsnPgJ+9Q47mo20/C3a+2IrMuTW9+d5ip94aSqhDAcqBuVHafYoDCjIChzGjYbO8dHdpkLtxNpj+bz660DKAMEQblReobmgCWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=NrPEk1J1; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vicu6lpUE90FAgN2xtfuOumDUR1Qg4VnW5GWRXk4y9o=; b=NrPEk1J1La77hJglDtJdiD8za9
	IGx3mDMOahM9R9I2Epz3BcUKZV0mEwhrhJowvHeWenHhHLJRQmcsbU5jlB66JkVEvQS2Co5khEXlF
	asdrMDH6hVzJxOHU2z65VzC4+izMIh1i573mzJbt9dxmqTpS+HtuGU2tgNpoX+XId54JueRF3XNIF
	LpV/dq8Ej88/zNas8S35JPhVSeA8skdIZWOdx3nPPsnkHPXiP97M1UY8xNnAHJVZi6ipsJJ1MHpZF
	PAlyizJyryjDuVP54qj98ob9nRsfq+XB3t4GOkzjGe85CZRYRnTbfos0P7CnvrtLmXfVuSo8b1zma
	Zh7SYR1Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36042)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vkR3c-000000005Co-0yVO;
	Mon, 26 Jan 2026 18:11:24 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vkR3X-00000000595-3RUR;
	Mon, 26 Jan 2026 18:11:19 +0000
Date: Mon, 26 Jan 2026 18:11:19 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [RFC PATCH net-next] net: stmmac: Preserve bootloader MAC
 address across unconditional reset
Message-ID: <aXeuR_YLoAFYEAVi@shell.armlinux.org.uk>
References: <20260126172503.238724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126172503.238724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27453-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,pengutronix.de,glider.be,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,renesas];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,shell.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: CE7998BEB8
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 05:25:03PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Commit 90f522a20e3d1 ("NET: dwmac: Make dwmac reset unconditional")
> asserts a reset in probe when a reset controller is present. This reset
> clears the MAC address registers, so a valid address programmed by the
> bootloader gets lost and the driver falls back to a random address.
> 
> Read the MAC address from the hardware registers before resetting the
> hardware. Keep the existing address selection logic when no valid
> address is found, and program the selected address back into the MAC
> after probe so it remains consistent in hardware.
> 
> Export stmmac_bus_clks_config() so the early read path can enable the
> bus clocks before accessing the MAC registers.

I don't think this is a good idea. stmmac_bus_clks_config() is specific
to using platform devices, but the core stmmac driver also supports
PCI that doesn't use stmmac_bus_clks_config().

stmmac_bus_clks_config() handles:

 - plat_dat->stmmac_clk
 - plat_dat->pclk
 - any clock handled by the plat_dat->clks_config() method

For platform devices, stmmac_probe_config_dt() gets these two clocks
from DT, and prepares and enables them both. So, by the time the
probe function is called, these clocks are already running.

For those handled by the platform glue, the glues that populate
this function:

eic7700: eic7700_clks_config() - this is called from the init/exit
handlers. Will be invoked to enable the clocks by stmmac_dvr_probe().

imx: imx_dwmac_clks_config() - called by imx_dwmac_probe() to enable
clocks prior to stmmac_dvr_probe() being invoked.

mediaktek: mediatek_dwmac_clks_config() - called by
mediatek_dwmac_probe() to enable clocks prior to stmmac_dvr_probe()
being invoked.

qcom-ethqos: ethqos_clks_config() - called by qcom_ethqos_probe() to
enable clocks prior to stmmac_dvr_probe() being invoked.

So, I can confidently say that all clocks should be running by the
time __stmmac_dvr_probe() is called, and thus there should be no
requirement to call stmmac_bus_clks_config() in this code.


The next problem: you place this code to read registers from stmmac
before:

	ret = reset_control_deassert(priv->plat->stmmac_ahb_rst);

Sadly, the binding documentation is too vague to pin down what this
is, as dwmac can have AHB master (which generates bus cycles for
accessing memory) and AHB slave (which would be the target for
register accesses) interfaces.

The problem here is that if some platform glue has wired this reset
such that it resets the AHB slave side, that will prevent register
access, and thus your attempt to read the MAC across all devices
will fail.


The next question that comes up is that we have a perfectly good way
that's been around for years to pass a MAC address from the boot
loader into the kernel for any network interface. I notice that it
isn't mentioned in the DT bindings, presumably to prevent people
from adding it to their in-kernel DT files.

	mac-address =
	local-mac-address =

The old documentation in ethernet.txt was:

- mac-address: array of 6 bytes, specifies the MAC address that was last used by
  the boot program; should be used in cases where the MAC address assigned to
  the device by the boot program is different from the "local-mac-address"
  property;
- local-mac-address: array of 6 bytes, specifies the MAC address that was
  assigned to the network device;

Given that these are interfaces between the boot loader and the kernel,
they can't be deprecated, as platforms will rely upon these properties
to pass the MAC address from the boot loader to the kernel. For example
on one of my systems:

$ vdir /sys/class/net/eth0/of_node/
total 0
-r--r--r-- 1 root root  4 Jan 26 18:08 gop-port-id
-r--r--r-- 1 root root 50 Jan 26 18:08 interrupt-names
-r--r--r-- 1 root root 80 Jan 26 18:08 interrupts
-r--r--r-- 1 root root  6 Jan 26 18:08 local-mac-address
-r--r--r-- 1 root root 14 Jan 26 18:08 name
-r--r--r-- 1 root root  4 Jan 26 18:08 phy
-r--r--r-- 1 root root 10 Jan 26 18:08 phy-mode
-r--r--r-- 1 root root  8 Jan 26 18:08 phys
-r--r--r-- 1 root root  4 Jan 26 18:08 port-id
-r--r--r-- 1 root root  4 Jan 26 18:08 reg
-r--r--r-- 1 root root  5 Jan 26 18:08 status

where "local-mac-address" states the MAC address to be used for eth0,
as specified by the boot loader.

I don't think stmmac needs this extra complication provided platforms
make use of mechanisms that already exist... and I feel it's time to
start saying no to platform specific quirks that can be handled by
those mechanisms.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

