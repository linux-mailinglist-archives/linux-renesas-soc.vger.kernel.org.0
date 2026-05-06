Return-Path: <linux-renesas-soc+bounces-32124-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPBKF0k++2nTYQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32124-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 15:12:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0DE4DAC73
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 15:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D596830028F5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 13:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18AF3F20F8;
	Wed,  6 May 2026 13:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ogZAU6go"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8623F1645;
	Wed,  6 May 2026 13:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778073155; cv=none; b=iHsDrGi7Cl3CnKowYIYpQgLyfL+7YXGSi9Si/1NFvDDAjcUMKvOSOZ1C2zyMjlzY4eZ6qK0zUYu43stO582/entdmTX04l1C2F7l142lBYWa+QhXN8lMM+oBXwRQ8qr0bodKqTcNRthMGjmKUcIzG3bk0+ieAauwlQx1j7hjrCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778073155; c=relaxed/simple;
	bh=QFFoUoAMce6NFU+gr6rURVwWJnWkoSeNA2b22yMweFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XmGw8ABzGBqRgPZxwxSmxjUGUZLGVFBDGNpVumz11B0Pv44OExlTSk5CCo46hcXeIQAtWV/8qfqEz08NKcqoskllbLSUNcKDF6uTehF31uBVisRkd3CZWzwwQ2y8lSjcPnVmAIbpfq9uKYvs57oJgI1XWizcj2Q/bAUHubLYOoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ogZAU6go; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 351F0C2BCC9;
	Wed,  6 May 2026 13:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778073155;
	bh=QFFoUoAMce6NFU+gr6rURVwWJnWkoSeNA2b22yMweFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ogZAU6goCpX5lBTvQX1GgPoe7WNJj4UAMtFFjz1n0EKC+o+Ep4mAPqogpFrqmpNha
	 M/Nv5I5IE7cIKL+p332BZEVtCoVwcb8KUZxfKWJytk3FHc0MWWQYPv4wLXjpz6yB24
	 EGM0TaSRK/Vv5w7+F0GKBp/SMzxH/KYrFiv/62stxsDmT553OEOmOxVIE9rDOuKuQd
	 alFuh3k+2VV482PLX65OedeuyFyrjttdUg/XsX3Lzr431xWXLgsUNnVkLr/6Kmxalu
	 1xQLLXH9InKDPQic/y/JLdGbPj659jAAPw6iScKCrA63xuF5nsLGg4vqpcjnHGRj6f
	 9DkMplK4YGm5Q==
Date: Wed, 6 May 2026 18:42:25 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, John Madieu <john.madieu.xa@bp.renesas.com>, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 5/5] PCI: rzg3s-host: Add support for RZ/V2H(P) SoC
Message-ID: <ed3g6ff6rprbmho6aegkl3p3rzr2lroskf3h2rk774jhxpbqkt@pkuovjn3hrlw>
References: <20260318124450.163471-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260318124450.163471-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <605e8d4c-09e7-4d11-acdb-7829a85eacc3@tuxon.dev>
 <CA+V-a8srS9g2WDMARDJn98K=nL9v1LiZYxqM8evsVrzR-s5ZMA@mail.gmail.com>
 <lvix7p4e7c4dtchtdti3rwrs7jkda5iy7lthcffhqc7g6vgu2p@54qywklrspi7>
 <CA+V-a8sd=dyTZmViLbDrCPYbx5ujWzjk74HxhP0aBEqxLuEqJA@mail.gmail.com>
 <leky6ktelj7t3uwd4bakgefrk32m3ceyxmwbkkjpp5zqp6rjgj@jtiqktxchws3>
 <CAMuHMdUpzABKKRBwK3mMmTS1+S21R+0k94bOX-+4ZBoa+bRWSA@mail.gmail.com>
 <phuerp2kp6ngruqjkpyjczpn5ya7iywrsiaqiiydvqxwlkntks@gyfcws3intsw>
 <CAMuHMdW_f5676cmimQYNyO3FZyi=DY_3sdVdUSUqXyZXpqCN0Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdW_f5676cmimQYNyO3FZyi=DY_3sdVdUSUqXyZXpqCN0Q@mail.gmail.com>
X-Rspamd-Queue-Id: 4B0DE4DAC73
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32124-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,google.com,tuxon.dev,bp.renesas.com,pengutronix.de,sang-engineering.com,vger.kernel.org,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[add1:email,renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,tuxon.dev:email]

On Wed, May 06, 2026 at 02:07:21PM +0200, Geert Uytterhoeven wrote:
> Hi Manivannan,
> 
> On Wed, 6 May 2026 at 14:02, Manivannan Sadhasivam <mani@kernel.org> wrote:
> > On Mon, May 04, 2026 at 11:05:11AM +0200, Geert Uytterhoeven wrote:
> > > On Fri, 1 May 2026 at 16:42, Manivannan Sadhasivam <mani@kernel.org> wrote:
> > > > On Fri, May 01, 2026 at 12:13:55PM +0100, Lad, Prabhakar wrote:
> > > > > On Thu, Apr 30, 2026 at 4:26 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
> > > > > > On Wed, Apr 08, 2026 at 07:54:41PM +0100, Lad, Prabhakar wrote:
> > > > > > > On Wed, Mar 25, 2026 at 10:18 AM Claudiu Beznea
> > > > > > > <claudiu.beznea@tuxon.dev> wrote:
> > > > > > > > On 3/18/26 14:44, Prabhakar wrote:
> > > > > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > > > >
> > > > > > > > > Add support for the RZ/V2H(P) SoC PCIe controller to the rzg3s-host
> > > > > > > > > driver.
> > > > > > > > >
> > > > > > > > > The RZ/V2H(P) SoC features two independent PCIe channels that share
> > > > > > > > > physical lanes. The hardware supports two configuration modes: single
> > > > > > > > > x4 mode where one controller uses all four lanes, or dual x2 mode
> > > > > > > > > where both controllers use two lanes each.
> > > > > > > > >
> > > > > > > > > Introduce configure_lanes() function pointer to configure the PCIe
> > > > > > > > > lanes based on the number of channels enabled. Implement
> > > > > > > > > rzv2h_pcie_configure_lanes() to detect the active PCIe channels at
> > > > > > > > > boot time and program the lane mode via the system controller using
> > > > > > > > > the new RZG3S_SYSC_FUNC_ID_LINK_MASTER function ID.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > > > > ---
> > > > > > > > >   drivers/pci/controller/pcie-rzg3s-host.c | 142 +++++++++++++++++++++++
> > > > > > > > >   1 file changed, 142 insertions(+)
> > > > > > > > >
> > > > > <snip>
> > > > > > > >
> > > > > > > > This introduces some limits in the systems with RZ/V2H(P) SoCs with regards to
> > > > > > > > the usage of linux,pci-domain. I would like the PCIe maintainers take on this.
> > > > > > > >
> > > > > > > > As this is necessary to index in the system controller driver specific data (as
> > > > > > > > there are different SYSC offsets for different PCIe controllers) I see the
> > > > > > > > following alternatives, if any:
> > > > > > > >
> > > > > > > > 1/ add a dedicated DT property for this, e.g. renesas,pcie-controller-id
> > > > > > > > 2/ Add dedicated DT bindings for RZ/V2H(P) SoC that would be used to specify the
> > > > > > > >     system controller register offset and mask for different functionalities.
> > > > > > > >
> > > > > > > >     E.g.:
> > > > > > > >     renesas,sysc-l1-allow = <&sysc 0x1020 0x1>;
> > > > > > > >     renesas,sysc-mode = <&sysc 0x1024 0x1>;
> > > > > > > >     renesas,sysc-link-master = <&sysc 0x1060 0x300>;
> > > > > > > >
> > > > > > > >     And use them in each controller DT node. E.g.:
> > > > > > > >
> > > > > > > >     pcie0: pcie@add1 {
> > > > > > > >         // ...
> > > > > > > >
> > > > > > > >         renesas,sysc-l1-allow = <&sysc 0x1020 0x1>;
> > > > > > > >         renesas,sysc-mode = <&sysc 0x1024 0x1>;
> > > > > > > >         renesas,sysc-link-master = <&sysc 0x1060 0x300>;
> > > > > > > >
> > > > > > > >         // ...
> > > > > > > >     };
> > > > > > > >
> > > > > > > >     pcie0: pcie@add1 {
> > > > > > > >         // ...
> > > > > > > >
> > > > > > > >         renesas,sysc-l1-allow = <&sysc 0x1050 0x1>;
> > > > > > > >         renesas,sysc-mode = <&sysc 0x1054 0x1>;
> > > > > > > >         renesas,sysc-link-master = <&sysc 0x1060 0x300>;
> > > > > > > >
> > > > > > > >         // ...
> > > > > > > >     };
> > > > > > > >
> > > > > > > I'd like to get a clearer steer from the PCIe and DT maintainers
> > > > > > > before investing further in either direction.
> > > > > > >
> > > > > > > To recap the two approaches on the table:
> > > > > > >
> > > > > > >   Option 1: A single renesas,pcie-controller-id property used to look up
> > > > > > >             SYSC offsets in the driver.
> > > > > >
> > > > > > Can you explain what is the limitation with 'linux,pci-domain' property?
> > > > > >
> > > > > As sashiko pointed out.dev, The linux,pci-domain property is generally
> > > > > an OS-specific logical property intended to assign a stable PCI domain
> > > > > number across reboots. Restricting it to [0, 1] would prevent system
> > > > > integrators from using non-conflicting domain numbers like 2 or 3 if
> > > > > the board incorporates other PCIe controllers.
> > > >
> > > > "linux,pci-domain" is supposed to be used in SoC.dtsi, not in board.dts. AFAIK,
> > > > the board designers have no reason to change it.
> > > >
> > > > Yes, the property name implies that it is a Linux specific property and if you
> > > > want, you can propose a generic one (not vendor specific one). Other than that,
> > > > I don't see a blocker in using this property. Many SoCs already do this and
> > > > other DT projects like u-boot do not end up parsing this property.
> > >
> > > Sounds like this overlaps with pciN DT aliases, which are in use on
> > > some (PPC) boards?
> > >
> >
> > Hmm. DT aliases are discouraged these days, AFAIK. Are those boards also need
> > these register configuration? I thought only RZ/V2H(P) SoCs need them. If not,
> > then RZ/V2H(P) DTS can use 'linux,pci-domain' property.
> >
> > If yes, then it would be better to hardcode these offsets in the driver based
> > on the compatible. DT's job is to describe the hardware topology and resources,
> > not register offsets.
> 
> The offsets cannot be hardcoded based just on the compatible value as there
> are two instances.  The offsets do describe the topology.
> 

Oops. I mixed it with the PHY compatibles... Anyhow, I'd suggest to go with
'linux,pci-domain' to get the domain ID and use it to calculate the offset.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

