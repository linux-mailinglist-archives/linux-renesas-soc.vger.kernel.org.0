Return-Path: <linux-renesas-soc+bounces-24339-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E66C41601
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 07 Nov 2025 20:01:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFDF33BFC7F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 19:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4641238178;
	Fri,  7 Nov 2025 19:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Vm/vdScp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183CB2206A7;
	Fri,  7 Nov 2025 19:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762542105; cv=none; b=iFeAAW1Dokdib4yE4SlurXHeogCSTtvgzXKRIlFs15xB4kpHz7OlF6mq1N+J1QlprbkMqah+jWGNMfKlchxwGuw14+YFDieBUL7vSZjmY3pA7tr1RORHO1vrUYzkPUJ7hQcMcVvTXcw8Q42u9skjSDGg6wJRIY1m29G3c6MTOYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762542105; c=relaxed/simple;
	bh=UF2IWmAQDO1X410z/PEbaUPD3GkoRYJG5/Gzv8WH+zA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u33c/TtJaj+c9Ua69RqfmD1IYsN1sj1XvsEBzdjSnJx2u3mI3fa4Q01dHBe6glvXA6C/FErloM1tZGgFsIAt33vPRWlAarwff79OIvZY39R1vzpUspCdfNVez1EQ4Vpn9qpSFwJ6LjgMIZXOXcs551sj7VUXLyvmOWPmyyWoYoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Vm/vdScp; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=dmnU+NL/eOaWWwyUapILw4TvGX9F7hjLcTmUpXNjT/k=; b=Vm/vdScphQjeXHY9UIUIfdxx0g
	5Ab7Zw42SRbmBnh8WFIlTdvmz5p65Nt+neQW1u5YxD/gh7WtR2PkS/YuETgQCF55hhc72sSOzY9UN
	e5zBKjNC4rPDMsnMU32yoH7wqWjcB3XPbhbnzFGW9L4SlK9iwO2gNIJH0QK9DUxfViiQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vHRi1-00DGHz-DH; Fri, 07 Nov 2025 20:01:17 +0100
Date: Fri, 7 Nov 2025 20:01:17 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
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
Subject: Re: [PATCH net-next] net: phy: mscc: Add support for PHY LEDs on
 VSC8541
Message-ID: <caef6e6e-b81e-45d7-ac92-ed6adc652aa2@lunn.ch>
References: <20251106200309.1096131-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ee6a79ae-4857-44e4-b8e9-29cdd80d828f@lunn.ch>
 <CA+V-a8vFEHr+3yR7=JAki3YDe==dAUv3m4PrD-nWhVg8hXgJcQ@mail.gmail.com>
 <2dabb0d5-f28f-4fdc-abeb-54119ab1f2cf@lunn.ch>
 <CA+V-a8uk-9pUrpXF3GDjwuDJBxpASpW8g5pHNBkd44JhF8AEew@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+V-a8uk-9pUrpXF3GDjwuDJBxpASpW8g5pHNBkd44JhF8AEew@mail.gmail.com>

> Certainly the probes can be simplified into a single function. I'll
> create a patch for this.

Please do make sure of each device having its own .probe
pointer. Don't have one probe function with lots of if/else
clauses. Put what is device specific into a device specific probe, and
what is common into helpers.

> > Also, is the LED handling you are adding here specific to the 8541? If
> > you look at the datasheets for the other devices, are any the same?
> >
> Looking at the below datasheets the LED handlings seem to be the same.

That is common. So yes, please add it to them all. It does not matter
if you can only test one device.

	Andrew

