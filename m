Return-Path: <linux-renesas-soc+bounces-31845-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNdzCiV182mt4AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31845-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 17:28:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1B74A4C07
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 17:28:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9F500300BB9C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 15:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51AE42F3C1F;
	Thu, 30 Apr 2026 15:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mluKwcAW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7742EE611;
	Thu, 30 Apr 2026 15:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777562788; cv=none; b=tHa4y+tF5RcfpholQBXuhopzSXCA18JYik7Mgshd0zKpBPCoHq4T3CES1z4Tel9mZYiokJ4LjcpBdAYDTSfceI2Sp5BRexPjJ6O4iOfITsCj6nDAMw9/VRdSWLNkW1Twi2d5q9iVmcCDoVu3THvdlJQasXZr1aXBB3b/oNw4NRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777562788; c=relaxed/simple;
	bh=UQjPSiitxZ94Lj9oj8nkfmn35aZiy+FarQcaGlt5B1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JReS8QCcLvTHNGAgU9mFxjC8CrpWESHLJs72EL1Um/+mB6VprP1W/8JeHtM2RVgExQpDeLpt2A63cShz/a3zysp3KWoexRbZLkw5D2LYZxv9QCWTdz+f3pPAn0y5TGXU/B6xZeK3qEEt0TAQZG1akRIcXLVNpKMOcbOtdvwvmM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mluKwcAW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51A61C2BCB3;
	Thu, 30 Apr 2026 15:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777562787;
	bh=UQjPSiitxZ94Lj9oj8nkfmn35aZiy+FarQcaGlt5B1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mluKwcAWxCiQdZ3bgocvx4a1neormKMn054hHInZRgQ7b1DLPPPZqPg/fQJHuSsk0
	 3ZH7vB59hfOKD/c44sstGy6chTjG2vkCiMqIndFffcn4ac222IhU71ZC4rYYmcBgPk
	 +0+GzX/JrWVMah60z3W6u2D3ojg166cZNa5pLStu33ubL1gAm6sEdeQ5v8uoEdfos8
	 jN+PqKxGUcZC3YVqcwVVDWX6KNwjlW47f2h/EhF3cuVVIYVCErijpJsjRJjNXWGb5U
	 GrMJdOqgKcCQku/5fnOVEKVluarK/q33Wi/+FLoe4Znd322t1VyHmF6sp3Iy0CqYib
	 5oAmFyDsPGJYQ==
Date: Thu, 30 Apr 2026 20:56:17 +0530
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
Message-ID: <lvix7p4e7c4dtchtdti3rwrs7jkda5iy7lthcffhqc7g6vgu2p@54qywklrspi7>
References: <20260318124450.163471-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260318124450.163471-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <605e8d4c-09e7-4d11-acdb-7829a85eacc3@tuxon.dev>
 <CA+V-a8srS9g2WDMARDJn98K=nL9v1LiZYxqM8evsVrzR-s5ZMA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8srS9g2WDMARDJn98K=nL9v1LiZYxqM8evsVrzR-s5ZMA@mail.gmail.com>
X-Rspamd-Queue-Id: BE1B74A4C07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31845-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Wed, Apr 08, 2026 at 07:54:41PM +0100, Lad, Prabhakar wrote:
> Hi All,
> 
> On Wed, Mar 25, 2026 at 10:18 AM Claudiu Beznea
> <claudiu.beznea@tuxon.dev> wrote:
> >
> > Hi, Prabhakar,
> >
> > On 3/18/26 14:44, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add support for the RZ/V2H(P) SoC PCIe controller to the rzg3s-host
> > > driver.
> > >
> > > The RZ/V2H(P) SoC features two independent PCIe channels that share
> > > physical lanes. The hardware supports two configuration modes: single
> > > x4 mode where one controller uses all four lanes, or dual x2 mode
> > > where both controllers use two lanes each.
> > >
> > > Introduce configure_lanes() function pointer to configure the PCIe
> > > lanes based on the number of channels enabled. Implement
> > > rzv2h_pcie_configure_lanes() to detect the active PCIe channels at
> > > boot time and program the lane mode via the system controller using
> > > the new RZG3S_SYSC_FUNC_ID_LINK_MASTER function ID.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > >   drivers/pci/controller/pcie-rzg3s-host.c | 142 +++++++++++++++++++++++
> > >   1 file changed, 142 insertions(+)
> > >
> > > diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
> > > index a629e861bbd0..d1bf1e750d9b 100644
> > > --- a/drivers/pci/controller/pcie-rzg3s-host.c
> > > +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> > > @@ -179,6 +179,16 @@
> > >   /* Timeouts experimentally determined */
> > >   #define RZG3S_REQ_ISSUE_TIMEOUT_US          2500
> > >
> > > +/**
> > > + * enum rzg3s_sysc_link_mode - PCIe link configuration modes
> > > + * @RZG3S_SYSC_LINK_MODE_SINGLE_X4: Single port with x4 lanes
> > > + * @RZG3S_SYSC_LINK_MODE_DUAL_X2: Dual ports with x2 lanes each
> > > + */
> > > +enum rzg3s_sysc_link_mode {
> > > +     RZG3S_SYSC_LINK_MODE_SINGLE_X4 = 1,
> > > +     RZG3S_SYSC_LINK_MODE_DUAL_X2 = 3,
> > > +};
> > > +
> > >   /**
> > >    * struct rzg3s_sysc_function - System Controller function descriptor
> > >    * @offset: Register offset from the System Controller base address
> > > @@ -194,12 +204,14 @@ struct rzg3s_sysc_function {
> > >    * @RZG3S_SYSC_FUNC_ID_RST_RSM_B: RST_RSM_B SYSC function ID
> > >    * @RZG3S_SYSC_FUNC_ID_L1_ALLOW: L1 allow SYSC function ID
> > >    * @RZG3S_SYSC_FUNC_ID_MODE: Mode SYSC function ID
> > > + * @RZG3S_SYSC_FUNC_ID_LINK_MASTER: Link master SYSC function ID
> > >    * @RZG3S_SYSC_FUNC_ID_MAX: Max SYSC function ID
> > >    */
> > >   enum rzg3s_sysc_func_id {
> > >       RZG3S_SYSC_FUNC_ID_RST_RSM_B,
> > >       RZG3S_SYSC_FUNC_ID_L1_ALLOW,
> > >       RZG3S_SYSC_FUNC_ID_MODE,
> > > +     RZG3S_SYSC_FUNC_ID_LINK_MASTER,
> > >       RZG3S_SYSC_FUNC_ID_MAX,
> > >   };
> > >
> > > @@ -261,6 +273,7 @@ struct rzg3s_pcie_host;
> > >    * @config_pre_init: Optional callback for SoC-specific pre-configuration
> > >    * @config_post_init: Callback for SoC-specific post-configuration
> > >    * @config_deinit: Callback for SoC-specific de-initialization
> > > + * @setup_lanes: Callback for setting up the number of lanes
> > >    * @power_resets: array with the resets that need to be de-asserted after
> > >    *                power-on
> > >    * @cfg_resets: array with the resets that need to be de-asserted after
> > > @@ -268,17 +281,20 @@ struct rzg3s_pcie_host;
> > >    * @sysc_info: System Controller info for each PCIe channel
> > >    * @num_power_resets: number of power resets
> > >    * @num_cfg_resets: number of configuration resets
> > > + * @num_channels: number of PCIe channels
> > >    */
> > >   struct rzg3s_pcie_soc_data {
> > >       int (*init_phy)(struct rzg3s_pcie_host *host);
> > >       void (*config_pre_init)(struct rzg3s_pcie_host *host);
> > >       int (*config_post_init)(struct rzg3s_pcie_host *host);
> > >       int (*config_deinit)(struct rzg3s_pcie_host *host);
> > > +     int (*setup_lanes)(struct rzg3s_pcie_host *host);
> > >       const char * const *power_resets;
> > >       const char * const *cfg_resets;
> > >       struct rzg3s_sysc_info sysc_info[RZG3S_PCIE_CHANNEL_ID_MAX];
> > >       u8 num_power_resets;
> > >       u8 num_cfg_resets;
> > > +     u8 num_channels;
> > >   };
> > >
> > >   /**
> > > @@ -309,6 +325,7 @@ struct rzg3s_pcie_port {
> > >    * @intx_irqs: INTx interrupts
> > >    * @max_link_speed: maximum supported link speed
> > >    * @channel_id: PCIe channel identifier, used for System Controller access
> > > + * @num_lanes: The number of lanes
> > >    */
> > >   struct rzg3s_pcie_host {
> > >       void __iomem *axi;
> > > @@ -325,6 +342,7 @@ struct rzg3s_pcie_host {
> > >       int intx_irqs[PCI_NUM_INTX];
> > >       int max_link_speed;
> > >       enum rzg3s_pcie_channel_id channel_id;
> > > +     u8 num_lanes;
> > >   };
> > >
> > >   #define rzg3s_msi_to_host(_msi)     container_of(_msi, struct rzg3s_pcie_host, msi)
> > > @@ -1155,6 +1173,13 @@ static int rzg3s_pcie_config_init(struct rzg3s_pcie_host *host)
> > >       rzg3s_pcie_update_bits(host->pcie, PCI_CLASS_REVISION, mask,
> > >                              field_prep(mask, PCI_CLASS_BRIDGE_PCI_NORMAL));
> > >
> > > +     if (host->num_lanes) {
> > > +             rzg3s_pcie_update_bits(host->pcie + RZG3S_PCI_CFG_PCIEC,
> > > +                                    PCI_EXP_LNKCAP, PCI_EXP_LNKCAP_MLW,
> > > +                                    FIELD_PREP(PCI_EXP_LNKCAP_MLW,
> > > +                                               host->num_lanes));
> > > +     }
> > > +
> > >       /* Disable access control to the CFGU */
> > >       writel_relaxed(0, host->axi + RZG3S_PCI_PERM);
> > >
> > > @@ -1687,6 +1712,63 @@ rzg3s_pcie_host_setup(struct rzg3s_pcie_host *host,
> > >       return ret;
> > >   }
> > >
> > > +static int rzg3s_pcie_get_controller_id(struct rzg3s_pcie_host *host)
> > > +{
> > > +     struct device_node *np = host->dev->of_node;
> > > +     u32 domain;
> > > +     int ret;
> > > +
> > > +     if (host->data->num_channels == 1)
> > > +             return 0;
> > > +
> > > +     ret = of_property_read_u32(np, "linux,pci-domain", &domain);
> >
> > This introduces some limits in the systems with RZ/V2H(P) SoCs with regards to
> > the usage of linux,pci-domain. I would like the PCIe maintainers take on this.
> >
> > As this is necessary to index in the system controller driver specific data (as
> > there are different SYSC offsets for different PCIe controllers) I see the
> > following alternatives, if any:
> >
> > 1/ add a dedicated DT property for this, e.g. renesas,pcie-controller-id
> > 2/ Add dedicated DT bindings for RZ/V2H(P) SoC that would be used to specify the
> >     system controller register offset and mask for different functionalities.
> >
> >     E.g.:
> >     renesas,sysc-l1-allow = <&sysc 0x1020 0x1>;
> >     renesas,sysc-mode = <&sysc 0x1024 0x1>;
> >     renesas,sysc-link-master = <&sysc 0x1060 0x300>;
> >
> >     And use them in each controller DT node. E.g.:
> >
> >     pcie0: pcie@add1 {
> >         // ...
> >
> >         renesas,sysc-l1-allow = <&sysc 0x1020 0x1>;
> >         renesas,sysc-mode = <&sysc 0x1024 0x1>;
> >         renesas,sysc-link-master = <&sysc 0x1060 0x300>;
> >
> >         // ...
> >     };
> >
> >     pcie0: pcie@add1 {
> >         // ...
> >
> >         renesas,sysc-l1-allow = <&sysc 0x1050 0x1>;
> >         renesas,sysc-mode = <&sysc 0x1054 0x1>;
> >         renesas,sysc-link-master = <&sysc 0x1060 0x300>;
> >
> >         // ...
> >     };
> >
> I'd like to get a clearer steer from the PCIe and DT maintainers
> before investing further in either direction.
> 
> To recap the two approaches on the table:
> 
>   Option 1: A single renesas,pcie-controller-id property used to look up
>             SYSC offsets in the driver.
> 

Can you explain what is the limitation with 'linux,pci-domain' property?

>   Option 2: Explicit per-controller DT properties carrying the SYSC
>             phandle, register offset, and mask for each functionality
>             (L1 allow, mode, link-master, etc.).
> 

Are the register offsets going to stay the same across controller instances?

If they are not going to change and you can derive the offsets using the
controller index, then there is no need to go for individual DT properties.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

