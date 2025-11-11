Return-Path: <linux-renesas-soc+bounces-24436-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4A4C4B40E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 03:53:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82E911893291
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 02:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8981634676F;
	Tue, 11 Nov 2025 02:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="s5u2HRDS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3E732D0EE;
	Tue, 11 Nov 2025 02:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762829623; cv=none; b=q/NMh68XyJsuhVicVGx6VGUAlq9O9q9S1++HKS0T7+UgzTlLSRcoNtQMVln1LNQeSrx+BCW6jt58sMoX+vEGyeBHt8c6lSf+Aa2QXQtsvMS9fhfp2dkPk2wF+eG4T7RzbD9LWw5ZlVb1Rp2s47WRWYl8wuLWcH0uhT8+nMg2ySg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762829623; c=relaxed/simple;
	bh=1NOwuhehZug2eBYJPtl6dHRclJQOhSkPY6rrnxsAzeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=plfp1j64ik0BsbvGkSGFJnYrKuiPtjh64nSZ9MGc84ABrfMs6eugafXCNlSbstjm3tDK7onMEa7z882cdR13bBcRjFCYUNoitV4eEfbuspw60mmn5qn5/DTNRV+z/4bt2rdiptKncO9PWhaBtZgasKC57UUkaYHYoW0BjkUFaPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=s5u2HRDS; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=7AU6tkXJL4/OvUuY8W0OGiJhQka01KlwKcR5UNZNo/0=; b=s5u2HRDSsW3HiES5TXivdHPQh9
	W3xJdDeclRRPqz9WTFwFbldmR37/QqOH2uKNtuMMvxi3E1NeHwk/7HTCvds+cSwV97CnNZzh+qInR
	cC86X9S1J0XGCj8PHfnBDj7phL25qyB8Ss0qXEMIrGmQIcdcyDPfjUscL/MOqJc+CfJs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vIeVe-00DaD8-LN; Tue, 11 Nov 2025 03:53:30 +0100
Date: Tue, 11 Nov 2025 03:53:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v2 3/3] net: phy: mscc: Add support for PHY LED
 control
Message-ID: <e9e7c43c-a58d-4b7a-957b-5d58ff24fbd4@lunn.ch>
References: <20251107201232.282152-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251107201232.282152-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107201232.282152-4-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Fri, Nov 07, 2025 at 08:12:32PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add support for the PHY LED controller in the MSCC VSC85xx driver. The
> implementation provides LED brightness and hardware control through the
> LED subsystem and integrates with the standard 'netdev' trigger.
> 
> Introduce new register definitions for the LED behavior register
> (MSCC_PHY_LED_BEHAVIOR = 30) and the LED combine disable bits, which
> control whether LEDs indicate link-only or combined link and activity
> status. Implement a helper, vsc8541_led_combine_disable_set(), to update
> these bits safely using phy_modify().
> 
> Add support for LED brightness control and hardware mode configuration.
> The new callbacks implement the standard LED class operations, allowing
> user control through sysfs. The brightness control maps to PHY LED force
> on/off modes. The hardware control get and set functions translate
> between the PHY-specific LED mode encodings and the LED subsystem
> TRIGGER_NETDEV_* rules.
> 
> The combine feature is managed automatically based on the selected
> rules. When both RX and TX activity are disabled, the combine feature is
> turned off, causing LEDs to indicate link-only status. When either RX or
> TX activity is enabled, the combine feature remains active and LEDs
> indicate combined link and activity.
> 
> Register the LED callbacks for all VSC85xx PHY variants so that the LED
> subsystem can manage their indicators consistently. Existing device tree
> LED configuration and default behavior are preserved.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

