Return-Path: <linux-renesas-soc+bounces-31050-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mN7jIn6l1ml9GwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31050-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 20:59:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA7B3C21EF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 20:59:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A736305616B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 18:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E92337B81;
	Wed,  8 Apr 2026 18:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hg/Lqc6i"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9D43D890F
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Apr 2026 18:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775674511; cv=pass; b=GyI0MhIJw/p+Spo+972EQwT2OjKLvxMdav44kfUYPXEUvBrK4+vKvQXcCrrtsftysKmIa/2bsIAsC+JR8UlIlRNlE6fx7xjPP8QladNLVz9dHZBYJToDGgz5VZ43rS6iR++fpHO+0+hLJ6bd2ORN28wcdefLeB+sYhqm5BOiUTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775674511; c=relaxed/simple;
	bh=cbHheetpVVdSiC5nwYLY9Y4ggJ90feKOZM6q3wsD+q8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oiXpZcHyIHwW1UOypMTAMM/bf3mzAYtvrtmtFr4i3x73a08l6NahuciSzsikhvESpGKSKLYrKzSiu5c35p0nF1A3MU0jbKnu2drQyDDlUa/3p0aNoPHvC0AYY3UfWag13T+ndm+2BrrC1aLBc2iA1VPp/3IQEBaOsR6L/qiK3DA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hg/Lqc6i; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43b95e5b3afso31258f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 11:55:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775674508; cv=none;
        d=google.com; s=arc-20240605;
        b=PYFuzNtXwOEbpsREkabr1ur7l8QRn3G4rgXkKUIm5soEitc5t6yFpuDlRc+ZV11X9z
         ngG9SRJ4U1xLJ1XXuZhE2ZBnMHKkhR3qLi6sklRICwHB1z3tdijdQ2sPjFaox9VNTfty
         nu2tybJ/39/O0iDXDX8AehSahCCqNO1BHNyTRM192iJDAoCqni7AhwrOhguvcJILSr7v
         qN6NNEM8rVt9Zsro+YHVQKYoH+GUa20PsiyE9Eis/z2saHFJKleyPZD06hjpZi/T5n4Z
         jpuJjb2KfbC/khRMWur+OgmYgNK/YgPffmq/RYwzEY/lX0AZvN+CNq+BLuYh/FIDRxTd
         ZWnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OmQpWX/IJfLVa4peELtc8B2oG/bwkKVLP9eXsbWoqvU=;
        fh=PdlbgSAGvU/gYz7awFcMGa+wAxs/u4HwrvgqwkQ13To=;
        b=aoBk9O9tBiKS0dk75Ra1UzSpLPobSvMAFPvQgv07z0imJ1UJdlmZ3msS92LftfCbIi
         XfjCEnGDBok7xbE7SECkH7OYstbVVsXVrCaTKTh9fFvFmvS7x6j39GSRHyPeyGOB6ehO
         CHBl4kg85IW5tJMAi3hZ+cKcpOwdpARbnBJloewn13JNrtmW0gBUsYYnlO7WRzBAPe2u
         szW1R5Dp0gs5v8jYkK626QSxVjan1HlzKeKmlLHlO965Gql4lYY10guPRU1rjBWmSzrD
         R9lsl8WPxoWj9GeIPuxKe81mnm1oI1gyKOSsYS70Y9e3pcnk1BLCC1tKGh3qTO3vKXO4
         Xhvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775674508; x=1776279308; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmQpWX/IJfLVa4peELtc8B2oG/bwkKVLP9eXsbWoqvU=;
        b=Hg/Lqc6itriGWQ1KXrXBxZTpSiLYNnwnaytfZF4aNNa1RUMBr7VK+mQ757rh5ix+D6
         l6bzdURA1EfuxbO6yp7GXxeziHTUfQ9EeIU49188zCsjAy4GmQuEaStQtKHAMPP3YE5i
         6yMAUmiH6MENqEy08h/qWsMwdzN3KzudjADMunuHsebkISmaVBKjH5oF/IxjOo2aayHn
         8h3HGYWFRA/Xth5QI5/cOQBFXv47TTLxN8dXUi3KrLgN0uoZaMH4mPFOleF2RueU2G7H
         wjOqvUy/v4P+4W6Yk6AyMzAL8VOzRlIHkap8+4O/UGOY4b1jVSONsEJEzjm5RD3Td1UA
         hckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775674508; x=1776279308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OmQpWX/IJfLVa4peELtc8B2oG/bwkKVLP9eXsbWoqvU=;
        b=I8p4r08qQ65RzcKTCiQPIXlAdddR07L+2OkikRDSRYY54g6MIjULXJAzJqjefF211P
         wCq97DEUeugi+IUqnRhvluAbnxhdCAn9yDHY9f7UgvqkIfQMSpi2CDydn6NTCbCs9dp7
         qqv7IkcInnSng55EWnbaMBXJzUDJcWjRvB/+9+YevR63B3TgO34vQgryCnjrjQFy45gJ
         djl1ig4jAA/PQTN1RAnA5UeyQNkv01DZMQ1fQ3PCQIoLLEqI7c7aHu7n0NVyt2DCEOCW
         aSzyzOJ0gFVUbT6WltT6yENHJBgE47E4AMLFIkI+H728D0n0ToYVYFVELucVGXS7KiCg
         9HwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVceQ/QkWtrL5aqauPH7vFGKYeKH+wKRBHg1OXzEY3Q7TBF81uPrLl4pV7w8WvSVrHaaIFYr/G4NTcUHB7htVEFcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOu2zjurYf0KG/hPLdd62yRqkXO9Qv4zr+z/gzcW83fx7EZBfH
	bIrbMnoG8q4BVO8C7qub7nNfwcwDwar2TDtkryoDWI7JmwnhqclZbwd41COGXTc5KBMVmIBkzcI
	Bil8QklooP15Bz2tD0ZGtl/+hiG/E734=
X-Gm-Gg: AeBDievCZ0/f2h6bFud0KA3yPP4edDFk9k/uh7MgK1fuiA5A61p2T2lnaKmppBtQfgG
	eDqxXuCJU8fXE1pMsr6AgLLmIw2d6DO82sOur/2+a6P2qtEJuTqUCG8xj2AqMavBhRzkI84GbaE
	k1tCzUjFjDMfFauKR/AVjuXq53IN1+I9HIlXqlBmayuUw3q7ZAYDKgzF9yWEppK867j9eCxJzQX
	5e+ad+NIe6jexvxQROk/rnMTHTJz03oTF+xnYV05+Sly29lrt5ccv6B0utKsyHCgm+DQIde9nBJ
	NdKEMEviGb3B/AvyrcSrrzuEjkzX8EDlk30a9lESXJ/JFdJoN9r1ycm7gu8qitoC9QVKkw==
X-Received: by 2002:adf:ec4c:0:b0:43d:30d1:857c with SMTP id
 ffacd0b85a97d-43d30d1859bmr20096655f8f.7.1775674507678; Wed, 08 Apr 2026
 11:55:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318124450.163471-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260318124450.163471-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <605e8d4c-09e7-4d11-acdb-7829a85eacc3@tuxon.dev>
In-Reply-To: <605e8d4c-09e7-4d11-acdb-7829a85eacc3@tuxon.dev>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 8 Apr 2026 19:54:41 +0100
X-Gm-Features: AQROBzDr87Qzy0mqlZSdEAmIW08-1n_rQMiTx4fUpVUhSnbJkQMQoeSIC73X2dA
Message-ID: <CA+V-a8srS9g2WDMARDJn98K=nL9v1LiZYxqM8evsVrzR-s5ZMA@mail.gmail.com>
Subject: Re: [PATCH 5/5] PCI: rzg3s-host: Add support for RZ/V2H(P) SoC
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	John Madieu <john.madieu.xa@bp.renesas.com>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31050-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[tuxon.dev,bp.renesas.com,kernel.org,pengutronix.de,gmail.com,sang-engineering.com,vger.kernel.org,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,renesas.com:email,add1:email]
X-Rspamd-Queue-Id: 4AA7B3C21EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi All,

On Wed, Mar 25, 2026 at 10:18=E2=80=AFAM Claudiu Beznea
<claudiu.beznea@tuxon.dev> wrote:
>
> Hi, Prabhakar,
>
> On 3/18/26 14:44, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for the RZ/V2H(P) SoC PCIe controller to the rzg3s-host
> > driver.
> >
> > The RZ/V2H(P) SoC features two independent PCIe channels that share
> > physical lanes. The hardware supports two configuration modes: single
> > x4 mode where one controller uses all four lanes, or dual x2 mode
> > where both controllers use two lanes each.
> >
> > Introduce configure_lanes() function pointer to configure the PCIe
> > lanes based on the number of channels enabled. Implement
> > rzv2h_pcie_configure_lanes() to detect the active PCIe channels at
> > boot time and program the lane mode via the system controller using
> > the new RZG3S_SYSC_FUNC_ID_LINK_MASTER function ID.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >   drivers/pci/controller/pcie-rzg3s-host.c | 142 ++++++++++++++++++++++=
+
> >   1 file changed, 142 insertions(+)
> >
> > diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/con=
troller/pcie-rzg3s-host.c
> > index a629e861bbd0..d1bf1e750d9b 100644
> > --- a/drivers/pci/controller/pcie-rzg3s-host.c
> > +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> > @@ -179,6 +179,16 @@
> >   /* Timeouts experimentally determined */
> >   #define RZG3S_REQ_ISSUE_TIMEOUT_US          2500
> >
> > +/**
> > + * enum rzg3s_sysc_link_mode - PCIe link configuration modes
> > + * @RZG3S_SYSC_LINK_MODE_SINGLE_X4: Single port with x4 lanes
> > + * @RZG3S_SYSC_LINK_MODE_DUAL_X2: Dual ports with x2 lanes each
> > + */
> > +enum rzg3s_sysc_link_mode {
> > +     RZG3S_SYSC_LINK_MODE_SINGLE_X4 =3D 1,
> > +     RZG3S_SYSC_LINK_MODE_DUAL_X2 =3D 3,
> > +};
> > +
> >   /**
> >    * struct rzg3s_sysc_function - System Controller function descriptor
> >    * @offset: Register offset from the System Controller base address
> > @@ -194,12 +204,14 @@ struct rzg3s_sysc_function {
> >    * @RZG3S_SYSC_FUNC_ID_RST_RSM_B: RST_RSM_B SYSC function ID
> >    * @RZG3S_SYSC_FUNC_ID_L1_ALLOW: L1 allow SYSC function ID
> >    * @RZG3S_SYSC_FUNC_ID_MODE: Mode SYSC function ID
> > + * @RZG3S_SYSC_FUNC_ID_LINK_MASTER: Link master SYSC function ID
> >    * @RZG3S_SYSC_FUNC_ID_MAX: Max SYSC function ID
> >    */
> >   enum rzg3s_sysc_func_id {
> >       RZG3S_SYSC_FUNC_ID_RST_RSM_B,
> >       RZG3S_SYSC_FUNC_ID_L1_ALLOW,
> >       RZG3S_SYSC_FUNC_ID_MODE,
> > +     RZG3S_SYSC_FUNC_ID_LINK_MASTER,
> >       RZG3S_SYSC_FUNC_ID_MAX,
> >   };
> >
> > @@ -261,6 +273,7 @@ struct rzg3s_pcie_host;
> >    * @config_pre_init: Optional callback for SoC-specific pre-configura=
tion
> >    * @config_post_init: Callback for SoC-specific post-configuration
> >    * @config_deinit: Callback for SoC-specific de-initialization
> > + * @setup_lanes: Callback for setting up the number of lanes
> >    * @power_resets: array with the resets that need to be de-asserted a=
fter
> >    *                power-on
> >    * @cfg_resets: array with the resets that need to be de-asserted aft=
er
> > @@ -268,17 +281,20 @@ struct rzg3s_pcie_host;
> >    * @sysc_info: System Controller info for each PCIe channel
> >    * @num_power_resets: number of power resets
> >    * @num_cfg_resets: number of configuration resets
> > + * @num_channels: number of PCIe channels
> >    */
> >   struct rzg3s_pcie_soc_data {
> >       int (*init_phy)(struct rzg3s_pcie_host *host);
> >       void (*config_pre_init)(struct rzg3s_pcie_host *host);
> >       int (*config_post_init)(struct rzg3s_pcie_host *host);
> >       int (*config_deinit)(struct rzg3s_pcie_host *host);
> > +     int (*setup_lanes)(struct rzg3s_pcie_host *host);
> >       const char * const *power_resets;
> >       const char * const *cfg_resets;
> >       struct rzg3s_sysc_info sysc_info[RZG3S_PCIE_CHANNEL_ID_MAX];
> >       u8 num_power_resets;
> >       u8 num_cfg_resets;
> > +     u8 num_channels;
> >   };
> >
> >   /**
> > @@ -309,6 +325,7 @@ struct rzg3s_pcie_port {
> >    * @intx_irqs: INTx interrupts
> >    * @max_link_speed: maximum supported link speed
> >    * @channel_id: PCIe channel identifier, used for System Controller a=
ccess
> > + * @num_lanes: The number of lanes
> >    */
> >   struct rzg3s_pcie_host {
> >       void __iomem *axi;
> > @@ -325,6 +342,7 @@ struct rzg3s_pcie_host {
> >       int intx_irqs[PCI_NUM_INTX];
> >       int max_link_speed;
> >       enum rzg3s_pcie_channel_id channel_id;
> > +     u8 num_lanes;
> >   };
> >
> >   #define rzg3s_msi_to_host(_msi)     container_of(_msi, struct rzg3s_p=
cie_host, msi)
> > @@ -1155,6 +1173,13 @@ static int rzg3s_pcie_config_init(struct rzg3s_p=
cie_host *host)
> >       rzg3s_pcie_update_bits(host->pcie, PCI_CLASS_REVISION, mask,
> >                              field_prep(mask, PCI_CLASS_BRIDGE_PCI_NORM=
AL));
> >
> > +     if (host->num_lanes) {
> > +             rzg3s_pcie_update_bits(host->pcie + RZG3S_PCI_CFG_PCIEC,
> > +                                    PCI_EXP_LNKCAP, PCI_EXP_LNKCAP_MLW=
,
> > +                                    FIELD_PREP(PCI_EXP_LNKCAP_MLW,
> > +                                               host->num_lanes));
> > +     }
> > +
> >       /* Disable access control to the CFGU */
> >       writel_relaxed(0, host->axi + RZG3S_PCI_PERM);
> >
> > @@ -1687,6 +1712,63 @@ rzg3s_pcie_host_setup(struct rzg3s_pcie_host *ho=
st,
> >       return ret;
> >   }
> >
> > +static int rzg3s_pcie_get_controller_id(struct rzg3s_pcie_host *host)
> > +{
> > +     struct device_node *np =3D host->dev->of_node;
> > +     u32 domain;
> > +     int ret;
> > +
> > +     if (host->data->num_channels =3D=3D 1)
> > +             return 0;
> > +
> > +     ret =3D of_property_read_u32(np, "linux,pci-domain", &domain);
>
> This introduces some limits in the systems with RZ/V2H(P) SoCs with regar=
ds to
> the usage of linux,pci-domain. I would like the PCIe maintainers take on =
this.
>
> As this is necessary to index in the system controller driver specific da=
ta (as
> there are different SYSC offsets for different PCIe controllers) I see th=
e
> following alternatives, if any:
>
> 1/ add a dedicated DT property for this, e.g. renesas,pcie-controller-id
> 2/ Add dedicated DT bindings for RZ/V2H(P) SoC that would be used to spec=
ify the
>     system controller register offset and mask for different functionalit=
ies.
>
>     E.g.:
>     renesas,sysc-l1-allow =3D <&sysc 0x1020 0x1>;
>     renesas,sysc-mode =3D <&sysc 0x1024 0x1>;
>     renesas,sysc-link-master =3D <&sysc 0x1060 0x300>;
>
>     And use them in each controller DT node. E.g.:
>
>     pcie0: pcie@add1 {
>         // ...
>
>         renesas,sysc-l1-allow =3D <&sysc 0x1020 0x1>;
>         renesas,sysc-mode =3D <&sysc 0x1024 0x1>;
>         renesas,sysc-link-master =3D <&sysc 0x1060 0x300>;
>
>         // ...
>     };
>
>     pcie0: pcie@add1 {
>         // ...
>
>         renesas,sysc-l1-allow =3D <&sysc 0x1050 0x1>;
>         renesas,sysc-mode =3D <&sysc 0x1054 0x1>;
>         renesas,sysc-link-master =3D <&sysc 0x1060 0x300>;
>
>         // ...
>     };
>
I'd like to get a clearer steer from the PCIe and DT maintainers
before investing further in either direction.

To recap the two approaches on the table:

  Option 1: A single renesas,pcie-controller-id property used to look up
            SYSC offsets in the driver.

  Option 2: Explicit per-controller DT properties carrying the SYSC
            phandle, register offset, and mask for each functionality
            (L1 allow, mode, link-master, etc.).

Both have trade-offs. Option 1 is simpler in the DT but moves hardware
knowledge into the driver, tightening the coupling. Option 2 is more
verbose but fully describes the hardware topology in the DT and avoids
a driver-internal lookup table.

Are there other approaches the maintainers would prefer that we
haven't considered?

Any guidance on the preferred direction or examples of similar solved
problems in the tree would be very appreciated.

Cheers,
Prabhakar

