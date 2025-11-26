Return-Path: <linux-renesas-soc+bounces-25228-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7850C8C063
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 22:29:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 868FE3A8AB5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 21:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853E42D661D;
	Wed, 26 Nov 2025 21:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="kA6HxFiB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A710529D265;
	Wed, 26 Nov 2025 21:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764192537; cv=none; b=i45y26cYlczb3t/Vw7Zkrq5tLquc5pZUgvUhpmNPmxB3mFT/NVvMY1CgS24zZM+tC+DWNjXc/AaL92e+fiQhBo/+FxDs3h50J3EQNsrZFjC3eO+m3ZfugzIPZCcnz3DlaiXNXvhHhjLPWCB2yyzK8PqRfmcuPkKWR4hy5Wk0GzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764192537; c=relaxed/simple;
	bh=CssGIMckCwYlvoFRUzLEnjscQLkpYHsbeBgfng32u6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yz+QjPIBMkLK2cn2Lid0OgvbL+cfKb9/m60ghfUhyd5iHtOxmgK9Z3QxX+mDtXixKg30EnhIgpFQ/FSZmeaLdWGXS9hzSFezNwT9JHM230g/BiVKzAHE4baX5SMNIrc8fxrN1u2CrhKhWPZrUhjqXoauhN9NCTzAG9BTtfrvTMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=kA6HxFiB; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=9X9n7aU/TJ/voAwW/L3k+ydogg1yk6XrLlkSzg40I3k=; b=kA
	6HxFiB1sY6IB1o70t2byczTUOOsu9RU8YJcSpyw2PA6tyKVqJnVFlKUZXriahBf3CPtZBG0JDzYr3
	Fqg8Pb5vInoZK1teKCIPN1b4skCruU4JaP6NS2rKIPM3yHSDs2FIWageDVCho5sRbD2mSvyc/6Txx
	/HrJrdomOHycelk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vON41-00FCJf-Oz; Wed, 26 Nov 2025 22:28:37 +0100
Date: Wed, 26 Nov 2025 22:28:37 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: pcs: renesas,rzn1-miic:
 Add renesas,miic-phylink-active-low property
Message-ID: <116b3a93-2b65-4464-821a-cbc7aa1b3dc1@lunn.ch>
References: <20251112201937.1336854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251112201937.1336854-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <de098757-2088-4b34-8a9a-407f9487991c@lunn.ch>
 <CA+V-a8vgJcJ+EsxSwQzQbprjqhxy-QS84=wE6co+D50wOOOweA@mail.gmail.com>
 <0d13ed33-cb0b-4cb0-8af3-b54c2ad7537b@lunn.ch>
 <CA+V-a8vx5KTUD_j7+1TC9r5JrGo2fJ0D7XXJCc-oHidtbUN=ZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8vx5KTUD_j7+1TC9r5JrGo2fJ0D7XXJCc-oHidtbUN=ZA@mail.gmail.com>

On Wed, Nov 26, 2025 at 08:55:53PM +0000, Lad, Prabhakar wrote:
> Hi Andrew,
> 
> On Thu, Nov 13, 2025 at 9:58 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > > Each of these IPs has its own link status pin as an input to the SoC:
> >
> > > The above architecture is for the RZ/N1 SoC. For RZ/T2H SoC we dont
> > > have a SERCOS Controller. So in the case of RZ/T2H EVK the
> > > SWITCH_MII_LINK status pin is connected to the LED1 of VSC8541 PHY.
> > >
> > > The PHYLNK register [0] (section 10.2.5 page 763) allows control of
> > > the active level of the link.
> > > 0: High active (Default)
> > > 1: Active Low
> > >
> > > For example the SWITCH requires link-up to be reported to the switch
> > > via the SWITCH_MII_LINK input pin.
> >
> > Why does the switch require this? The switch also needs to know the
> > duplex, speed etc. Link on its own is of not enough. So when phylink
> > mac_link_up is called, you tell it the speed, duplex and also that the
> > link is up. When the link goes down, mac_link_down callback will be
> > called and you tell it the link is down.
> >
> Sorry for the delayed response. I was awaiting more info from the HW
> team on this. Below is the info I got from the HW info.
> 
> EtherPHY link-up and link-down status is required as a hardware IP
> feature, regardless of whether GMAC or ETHSW is used.
> In the case of GMAC, the software retrieves this information from
> EtherPHY via MDC/MDIO and then configures GMAC accordingly. In
> contrast, ETHSW provides dedicated pins for this purpose.
> For ETHSW, this information is also necessary for communication
> between two external nodes (e.g., Node A to Node B) that does not
> involve the host CPU, as the switching occurs entirely within ETHSW.
> This is particularly important for DLR (Device Level Ring: a
> redundancy protocol used in EtherNet/IP). DLR relies on detecting
> link-down events caused by cable issues as quickly as possible to
> enable fast switchover to a redundant path. Handling such path
> switching in software introduces performance impacts, which is why
> ETHSW includes dedicated pins.
> As for Active Level configuration, it is designed to provide
> flexibility to accommodate the specifications of external EtherPHY
> devices.
> 
> Please share your thoughts.

Please add this to the commit, to make it clear what these pins are
for.

It actually seems like it is mostly relevant for link down, not up.
If the link goes down, it does not matter if it is 10Half, or 1G Full.
All you want to do is swap to a redundant path as soon as possible.

It would however be interesting it know more about link up. Does the
hardware start using the port as soon as link up is reported by this
pin? So it could be blasting frames out at 1G, until software catches
up and tells the MAC to slow down and do 10Half? So all those frames
are corrupted, causing your nice redundant network to break for a
while?

	Andrew

