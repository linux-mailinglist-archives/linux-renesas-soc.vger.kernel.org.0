Return-Path: <linux-renesas-soc+bounces-31870-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PdnOei79GkwEAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31870-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 01 May 2026 16:42:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF6E4AD56E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 01 May 2026 16:42:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 579C5300695F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 May 2026 14:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E01783C2787;
	Fri,  1 May 2026 14:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LGB7Welq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87122857EA;
	Fri,  1 May 2026 14:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777646565; cv=none; b=vEYmKOT5d0ZwR8QH9JpGGS8P+dMoheBCv2v/V5Iq8FL5JEgIOcr5ZQlvRRs2LbTUJBOCScDbUyUUBdONFCI0pVn+7JqXTJa+IOQa22KZeUdLVa0RpSDlzs2ZqvZxaMgxPOrBhSEaG9dy/OOVzfDGnv52++io5+MIRZpIa/oM/rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777646565; c=relaxed/simple;
	bh=k/u97yxQjmcGzmns+dUJBl5k+4iczjSFkBpto1YQqB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJoCyyyXXlyFMzlNk8R3NBV5buMVRHYujdJW3kdvhlI7Gi4M1RxLqmaww3nc8RmJ8anARIxhsjHfRtEq7WHnccf86ntQnyyPC9yX0I5by8i497rmP/rZT8q8UXxjqkOxVR/0BgQcp03xQfn9DiNX3h/+A5THJHLvOc4f9dz9PzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LGB7Welq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 349B8C2BCB4;
	Fri,  1 May 2026 14:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777646565;
	bh=k/u97yxQjmcGzmns+dUJBl5k+4iczjSFkBpto1YQqB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LGB7WelqvG9tsPZELN671K8ocfWUjqqN/o0XLGpJvyottkZGjLeikbK8AgkOYZsSD
	 u9XoCcKhzdNbxNhUsoF7l4Li0OH0nMS5Rdu+7p0FhRf/wP2r4ouVJle+RT27liVgVW
	 X7uXhIOqmOq3lO5QdAh/42HGDFP6rp/nR/b+dLJcccq/Q3uJUIkJ+FJx5+xJBm2AKJ
	 Xv3t1xpkKhxQuqKhc0M7NUxCcUqlwWj8mT2WPy3SLM4kHmCG8xePR055Wa948nQKRJ
	 hhNm7uIWmBB11kxfQtoNsWR0btzspct7tKhCQ9GyyRYYQ0ZmNTQUoMiQAs+n+XNnr1
	 lrtX28W0+g9Jg==
Date: Fri, 1 May 2026 20:12:34 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Bjorn Helgaas <bhelgaas@google.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, John Madieu <john.madieu.xa@bp.renesas.com>, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 5/5] PCI: rzg3s-host: Add support for RZ/V2H(P) SoC
Message-ID: <leky6ktelj7t3uwd4bakgefrk32m3ceyxmwbkkjpp5zqp6rjgj@jtiqktxchws3>
References: <20260318124450.163471-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260318124450.163471-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <605e8d4c-09e7-4d11-acdb-7829a85eacc3@tuxon.dev>
 <CA+V-a8srS9g2WDMARDJn98K=nL9v1LiZYxqM8evsVrzR-s5ZMA@mail.gmail.com>
 <lvix7p4e7c4dtchtdti3rwrs7jkda5iy7lthcffhqc7g6vgu2p@54qywklrspi7>
 <CA+V-a8sd=dyTZmViLbDrCPYbx5ujWzjk74HxhP0aBEqxLuEqJA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8sd=dyTZmViLbDrCPYbx5ujWzjk74HxhP0aBEqxLuEqJA@mail.gmail.com>
X-Rspamd-Queue-Id: 3CF6E4AD56E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31870-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,google.com,tuxon.dev,bp.renesas.com,pengutronix.de,gmail.com,sang-engineering.com,vger.kernel.org,renesas.com];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tuxon.dev:email,add1:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Fri, May 01, 2026 at 12:13:55PM +0100, Lad, Prabhakar wrote:
> Hi Manivannan,
> 
> On Thu, Apr 30, 2026 at 4:26 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
> >
> > On Wed, Apr 08, 2026 at 07:54:41PM +0100, Lad, Prabhakar wrote:
> > > Hi All,
> > >
> > > On Wed, Mar 25, 2026 at 10:18 AM Claudiu Beznea
> > > <claudiu.beznea@tuxon.dev> wrote:
> > > >
> > > > Hi, Prabhakar,
> > > >
> > > > On 3/18/26 14:44, Prabhakar wrote:
> > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > >
> > > > > Add support for the RZ/V2H(P) SoC PCIe controller to the rzg3s-host
> > > > > driver.
> > > > >
> > > > > The RZ/V2H(P) SoC features two independent PCIe channels that share
> > > > > physical lanes. The hardware supports two configuration modes: single
> > > > > x4 mode where one controller uses all four lanes, or dual x2 mode
> > > > > where both controllers use two lanes each.
> > > > >
> > > > > Introduce configure_lanes() function pointer to configure the PCIe
> > > > > lanes based on the number of channels enabled. Implement
> > > > > rzv2h_pcie_configure_lanes() to detect the active PCIe channels at
> > > > > boot time and program the lane mode via the system controller using
> > > > > the new RZG3S_SYSC_FUNC_ID_LINK_MASTER function ID.
> > > > >
> > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > ---
> > > > >   drivers/pci/controller/pcie-rzg3s-host.c | 142 +++++++++++++++++++++++
> > > > >   1 file changed, 142 insertions(+)
> > > > >
> <snip>
> > > >
> > > > This introduces some limits in the systems with RZ/V2H(P) SoCs with regards to
> > > > the usage of linux,pci-domain. I would like the PCIe maintainers take on this.
> > > >
> > > > As this is necessary to index in the system controller driver specific data (as
> > > > there are different SYSC offsets for different PCIe controllers) I see the
> > > > following alternatives, if any:
> > > >
> > > > 1/ add a dedicated DT property for this, e.g. renesas,pcie-controller-id
> > > > 2/ Add dedicated DT bindings for RZ/V2H(P) SoC that would be used to specify the
> > > >     system controller register offset and mask for different functionalities.
> > > >
> > > >     E.g.:
> > > >     renesas,sysc-l1-allow = <&sysc 0x1020 0x1>;
> > > >     renesas,sysc-mode = <&sysc 0x1024 0x1>;
> > > >     renesas,sysc-link-master = <&sysc 0x1060 0x300>;
> > > >
> > > >     And use them in each controller DT node. E.g.:
> > > >
> > > >     pcie0: pcie@add1 {
> > > >         // ...
> > > >
> > > >         renesas,sysc-l1-allow = <&sysc 0x1020 0x1>;
> > > >         renesas,sysc-mode = <&sysc 0x1024 0x1>;
> > > >         renesas,sysc-link-master = <&sysc 0x1060 0x300>;
> > > >
> > > >         // ...
> > > >     };
> > > >
> > > >     pcie0: pcie@add1 {
> > > >         // ...
> > > >
> > > >         renesas,sysc-l1-allow = <&sysc 0x1050 0x1>;
> > > >         renesas,sysc-mode = <&sysc 0x1054 0x1>;
> > > >         renesas,sysc-link-master = <&sysc 0x1060 0x300>;
> > > >
> > > >         // ...
> > > >     };
> > > >
> > > I'd like to get a clearer steer from the PCIe and DT maintainers
> > > before investing further in either direction.
> > >
> > > To recap the two approaches on the table:
> > >
> > >   Option 1: A single renesas,pcie-controller-id property used to look up
> > >             SYSC offsets in the driver.
> > >
> >
> > Can you explain what is the limitation with 'linux,pci-domain' property?
> >
> As sashiko pointed out.dev, The linux,pci-domain property is generally
> an OS-specific logical property intended to assign a stable PCI domain
> number across reboots. Restricting it to [0, 1] would prevent system
> integrators from using non-conflicting domain numbers like 2 or 3 if
> the board incorporates other PCIe controllers.
> 

"linux,pci-domain" is supposed to be used in SoC.dtsi, not in board.dts. AFAIK,
the board designers have no reason to change it.

Yes, the property name implies that it is a Linux specific property and if you
want, you can propose a generic one (not vendor specific one). Other than that,
I don't see a blocker in using this property. Many SoCs already do this and
other DT projects like u-boot do not end up parsing this property.

> > >   Option 2: Explicit per-controller DT properties carrying the SYSC
> > >             phandle, register offset, and mask for each functionality
> > >             (L1 allow, mode, link-master, etc.).
> > >
> >
> > Are the register offsets going to stay the same across controller instances?
> >
> > If they are not going to change and you can derive the offsets using the
> > controller index, then there is no need to go for individual DT properties.
> >
> The offsets will remain the same across the controller instances. So
> instead of using linux,pci-domain property we could use below is that
> OK?
> 
> pcie0 {
>   renesas,sysc = <&sysc 0>;
> };
> 
> pcie1 {
>   renesas,sysc = <&sysc 1>;
> };
> 
> Where 0/1 are the controller instance IDs that the driver will use to
> derive the correct offsets.
> 

What if you have other register blocks using the same pattern in the future?
You'll end up with renesas,xxx = <xxx, N>. You should stick to
"linux,pci-domain".

- Mani

-- 
மணிவண்ணன் சதாசிவம்

