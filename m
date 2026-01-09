Return-Path: <linux-renesas-soc+bounces-26537-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 87226D0B0AE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 16:51:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 02D6B3000B00
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 15:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 255E7315D40;
	Fri,  9 Jan 2026 15:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="AC3DNPGe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BE850096E;
	Fri,  9 Jan 2026 15:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767973877; cv=none; b=QjCSlALmB0DicMWH031F1ukWrvSGJIfNQ+hrEoSV2M0RTPdshhi2b0odF/d/0fo04nkyuBUQc7bcXuvndS+F0NM8LAMoqyJJXdA6yZydc6FTUY7BJcoJFmJRrIe+EC9SWqhoVR/f2R5OlWYjYuUH3RmdqDVfnisenVD/Gh8jrjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767973877; c=relaxed/simple;
	bh=N3OEbXDN24wq0LthEeSqFAaMCzO9m20JgYsrfFI+PkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=msXRSvIDKJXn/7cAaOjAQu9n5rVKj8pI7rYRwtrm9URIg8TKwVOV3/FgGRn2FAktlf482em7ggTowUQSMiRvSUPtJ9/qVycNB3PwpvWd2xokJGKELMOy/OBW4hfQ30FstZqVItwFC290w2A6XewfCtILShd4E1McH8Hq3lzmAww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=AC3DNPGe; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WrKiJGExYEJRLwUXBNV/ZZjm3cu688A6kKxR9wIJ1IM=; b=AC3DNPGeniIWPTJqnquv8lv8Yh
	Do7HegUNbO/CTTfzlEXijhCXpypmLIosnybmuZMZE0VMnKZlW1euXJ4RRBq86UWCuVPZ6RWCd6ZuI
	tNclhbVkYrMm85bfzAokc8rVcu32DQLi17BOI6EQxLJHe5DFm+L33zQkZPqDwRqZl5SBl2saJjclr
	2YMCa9KUn6tAP8I2vwMbkd15eDHKLprX0UVSk7dE6Wjp8Al4IOLdiS0mYkm6/hrK0rkoTW5TNi5WB
	8+rC7aI/7J9lMXgT4g1z0XnE4qfDzZAFAIumxdDahiozcKXkrboj7ozlVkJaXWQ8yo/23zsjTahbD
	ynHjW1kg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56696)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1veElS-000000003zl-27RH;
	Fri, 09 Jan 2026 15:51:02 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1veElO-000000003Qn-3IVr;
	Fri, 09 Jan 2026 15:50:58 +0000
Date: Fri, 9 Jan 2026 15:50:58 +0000
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
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v2 2/2] net: pcs: rzn1-miic: Add support for PHY
 link active-level configuration
Message-ID: <aWEj4py2Cv4tPu-5@shell.armlinux.org.uk>
References: <20260109142250.3313448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260109142250.3313448-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109142250.3313448-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Fri, Jan 09, 2026 at 02:22:50PM +0000, Prabhakar wrote:
> +static void miic_configure_phylink(struct miic *miic, u32 conf,
> +				   u32 port, bool active_low)
> +{
> +	bool polarity_active_high;
> +	u32 mask, val;
> +	int shift;
> +
> +	/* determine shift and polarity for this conf */
> +	if (miic->of_data->type == MIIC_TYPE_RZN1) {
> +		switch (conf) {
> +		/* switch ports => bits [3:0] (shift 0), active when low */
> +		case MIIC_SWITCH_PORTA:
> +		case MIIC_SWITCH_PORTB:
> +		case MIIC_SWITCH_PORTC:
> +		case MIIC_SWITCH_PORTD:
> +			shift = 0;
> +			polarity_active_high = false;
> +			break;
> +
> +		/* EtherCAT ports => bits [7:4] (shift 4), active when high */
> +		case MIIC_ETHERCAT_PORTA:
> +		case MIIC_ETHERCAT_PORTB:
> +		case MIIC_ETHERCAT_PORTC:
> +			shift = 4;
> +			polarity_active_high = true;
> +			break;
> +
> +		/* Sercos ports => bits [11:8] (shift 8), active when high */
> +		case MIIC_SERCOS_PORTA:
> +		case MIIC_SERCOS_PORTB:
> +			shift = 8;
> +			polarity_active_high = true;
> +			break;
> +
> +		default:
> +			return;
> +		}
> +	} else {
> +		switch (conf) {
> +		/* ETHSW ports => bits [3:0] (shift 0), active when low */
> +		case ETHSS_ETHSW_PORT0:
> +		case ETHSS_ETHSW_PORT1:
> +		case ETHSS_ETHSW_PORT2:
> +			shift = 0;
> +			polarity_active_high = false;
> +			break;
> +
> +		/* ESC ports => bits [7:4] (shift 4), active when high */
> +		case ETHSS_ESC_PORT0:
> +		case ETHSS_ESC_PORT1:
> +		case ETHSS_ESC_PORT2:
> +			shift = 4;
> +			polarity_active_high = true;
> +			break;
> +
> +		default:
> +			return;
> +		}
> +	}
> +
> +	mask = BIT(port) << shift;
> +
> +	if (polarity_active_high)
> +		val = (active_low ? 0 : BIT(port)) << shift;
> +	else
> +		val = (active_low ? BIT(port) : 0) << shift;

Looking closer at this, I think this is confusing.

The underlying purpose here is to set mask and val to change the state of
a single bit in the PHY link register for each call to this function,
accumulating the changes in your misnamed "struct phylink".

Given that "mask" can be used to compute the value to describe the bit,
and that is made up of "shift" that describes the start of the bitfield
and "port" that describes the bit within the bitfield, then surely:

	mask = BIT(port + shift);

would be saner?

Next, the creation of "val". This is either zero or the same value of
mask depending on active_low and polarity_active_high. The truth table
here is:

polarity_active_high	active_low	result
0			0		0
0			1		mask
1			0		mask
1			1		0

This is a classical an exclusive-or truth table in the world of logic,
or could be regarded as an inquality relationship (result is mask
when polarity_active_high differs from active_low, otherwise zero).

Thus:

	/* Set the bit when polarity_active_high differs from active_low */
	val = polarity_active_high != active_low ? mask : 0;

Or, even simpler, this could become overall:

	mask = BIT(port + shift);

	miic->phylink.mask |= mask;
	if (polarity_active_high != active_low)
		miic->phylink.val |= mask;
	else
		miic->phylink.val &= ~mask;

> @@ -605,8 +698,15 @@ static int miic_parse_dt(struct miic *miic, u32 *mode_cfg)
>  
>  		/* Adjust for 0 based index */
>  		port += !miic->of_data->miic_port_start;
> -		if (of_property_read_u32(conv, "renesas,miic-input", &conf) == 0)
> -			dt_val[port] = conf;
> +		if (of_property_read_u32(conv, "renesas,miic-input", &conf))
> +			continue;
> +
> +		dt_val[port] = conf;
> +
> +		active_low = of_property_read_bool(conv, "renesas,miic-phylink-active-low");
> +
> +		miic_configure_phylink(miic, conf, port - !miic->of_data->miic_port_start,
> +				       active_low);

I think this is also over-complicated. Wouldn't it be better to only
deal with the miic_port_start at the one place that it matters?

                if (of_property_read_u32(conv, "reg", &port))
                        continue;

                if (of_property_read_u32(conv, "renesas,miic-input", &conf))
                        continue;

                dt_val[port + !miic->of_data->miic_port_start] = conf;

                active_low = of_property_read_bool(conv, "renesas,miic-phylink-active-low");

                miic_configure_phylink(miic, conf, port, active_low);

?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

