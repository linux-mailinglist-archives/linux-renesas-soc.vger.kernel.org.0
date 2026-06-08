Return-Path: <linux-renesas-soc+bounces-33655-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PYFxE2enJmqOagIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33655-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 13:28:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 973C2655B30
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 13:28:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ew.tq-group.com header.s=default2602 header.b=aSaIYF+j;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33655-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33655-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=ew.tq-group.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 748D73037BA8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2026 11:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93233624C3;
	Mon,  8 Jun 2026 11:22:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CD634B697;
	Mon,  8 Jun 2026 11:22:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780917745; cv=none; b=lRpKsjJwGeSa4PKkUgw2SlGGqlgySvWVU1+OOOxO5hAYKHmoW65ZSBCId95gFKpdmi9yYcG8UxahD4qhStzsTGCr5DTezhm81/D0oTyWITGipHI95pdsnCIHm4YlF6GfywmjaCHyH+tQSn2QUxyfoE/2oVtiiKka7+ip7oDkteE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780917745; c=relaxed/simple;
	bh=DgrOMY7tOjOQAsBnHupbRQF92Dgr7IP6xb3SYar9Q9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q1yD12yk3sS/pfDqSHoIxEbiiX6oCiIP04yNrF/r1iSAirf1ewTlz59dHWK9cr0EVuUDa1X7UcSqVqp4qmeq93uemzWvT2hnM/b3ujGWd40Ia7cS3Rkh39qNHeO7WvElpB3sAHh9AyVYhvZ1I9nlsXYJ30jeldDUzR4Zu+OEtXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=aSaIYF+j; arc=none smtp.client-ip=188.40.3.216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Xe3m8aEMLZ/02vgwpqo5f7f9hIk8DfPm8JBqFu+ZRLY=; b=aSaIYF+jLzhpB2x34fAjS6W6zC
	loVRKG/E/QhEiTlDPJMcEQvo5oD3KZHmM3qrRKPQX+s906GTCAgyDBmPoCKxSZ2qeCDinuRCnF7ta
	4+EgcarogMFhI1xGe1gI9ewYCPWmyaMPvfUsDWW4LAm5JlddsX3QeRnEeLBNLgDnPLfj1LStca7Ap
	6g1yvEkur6ogZdSTxcsP9CfxIp7cI8FQzjdhN4tLOxrDcRSyNxA6uCIiJSfrTUGD58D2XBycgNGAo
	wnA5LMM5GzBuayQtbWmJubrV+Ao7MbEeRnpU1NirUVPPQgGN2L1MY5wmvP65Me+93YPSrts+0QxD8
	G6cn+AyA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wWY3h-000EpY-0l;
	Mon, 08 Jun 2026 13:22:21 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wWY3h-000HhD-0P;
	Mon, 08 Jun 2026 13:22:20 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com, linux-renesas-soc@vger.kernel.org
Subject:
 Re: [PATCH v4 4/4] arm64: dts: freescale: Add dual-channel LVDS overlay for
 TQMa8MPxS
Date: Mon, 08 Jun 2026 13:22:19 +0200
Message-ID: <6005215.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <aiL9i6IQzK3EHGpm@lizhi-Precision-Tower-5810>
References:
 <20260603093621.2504490-1-alexander.stein@ew.tq-group.com>
 <20260603093621.2504490-4-alexander.stein@ew.tq-group.com>
 <aiL9i6IQzK3EHGpm@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28025/Mon Jun  8 08:33:34 2026)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ew.tq-group.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ew.tq-group.com:s=default2602];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33655-lists,linux-renesas-soc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[alexander.stein@ew.tq-group.com,linux-renesas-soc@vger.kernel.org];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,glider.be,vger.kernel.org,lists.linux.dev,lists.infradead.org,ew.tq-group.com];
	FORGED_RECIPIENTS(0.00)[m:Frank.li@nxp.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:shawnguo@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux@ew.tq-group.com,m:linux-renesas-soc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.stein@ew.tq-group.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ew.tq-group.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,steina-w:mid,ew.tq-group.com:from_mime,ew.tq-group.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 973C2655B30

Hi Frank,

Am Freitag, 5. Juni 2026, 18:47:07 CEST schrieb Frank Li:
> On Wed, Jun 03, 2026 at 11:36:09AM +0200, Alexander Stein wrote:
> > This adds an overlay for the supported LVDS display AUO G133HAN01.
> > Configure the video PLL frequency to exactly match typical pixel clock =
of
> > 141.200 MHz.
> >
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
>=20
> Can you fix W=3D1 dtb build warnings?

That would require to duplicate the setting from imx8mp.dtsi. Is this really
intended?

imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtso:51.10-55.5: Warning (unit_a=
ddress_vs_reg): /fragment@3/__overlay__/ports/port@1: node has a unit name,=
 but no reg or ranges property
imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtso:57.10-61.5: Warning (unit_a=
ddress_vs_reg): /fragment@3/__overlay__/ports/port@2: node has a unit name,=
 but no reg or ranges property

IMHO this warning is not suitable for .dtbo, while it is for .dtb
(with applied overlays). The .dtbo doesn't have all the information.

Best reagrds
Alexander

> Frank
>=20
> > Changes in v4:
> > * New to series v4
> >
> >  arch/arm64/boot/dts/freescale/Makefile        |  2 +
> >  ...p-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtso | 74 +++++++++++++++++++
> >  2 files changed, 76 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-s=
marc-2-lvds-g133han01.dtso
> >
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/d=
ts/freescale/Makefile
> > index dee2bea156740..3f466f102dc1d 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -385,8 +385,10 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-tqma8mpql-mba8m=
p-ras314-imx219.dtbo
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070j=
vhg33.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070j=
vhg33-imx219.dtb
> >
> > +imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01-dtbs +=3D imx8mp-tqma8mpqs-=
mb-smarc-2.dtb imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtbo
> >  imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33-dtbs +=3D imx8mp-tqma8mp=
qs-mb-smarc-2.dtb imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtbo
> >  imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33-dtbs +=3D imx8mp-tqma8mp=
qs-mb-smarc-2.dtb imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtbo
> > +dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01=
=2Edtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvh=
g33.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvh=
g33.dtb
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-=
lvds-g133han01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-sma=
rc-2-lvds-g133han01.dtso
> > new file mode 100644
> > index 0000000000000..9595cf4d43cd0
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds-g1=
33han01.dtso
> > @@ -0,0 +1,74 @@
> > +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> > +/*
> > + * Copyright (c) 2025-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
> > + * D-82229 Seefeld, Germany.
> > + * Author: Martin Schmiedel
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +&backlight_lvds0 {
> > +	status =3D "okay";
> > +};
> > +
> > +&panel_lvds0 {
> > +	compatible =3D "auo,g133han01";
> > +	status =3D "okay";
> > +
> > +	ports {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +
> > +		port@0 {
> > +			reg =3D <0>;
> > +			dual-lvds-odd-pixels;
> > +
> > +			panel_in_lvds0: endpoint {
> > +				remote-endpoint =3D <&ldb_lvds_ch0>;
> > +			};
> > +		};
> > +
> > +		port@1 {
> > +			reg =3D <1>;
> > +			dual-lvds-even-pixels;
> > +
> > +			panel_in_lvds1: endpoint {
> > +				remote-endpoint =3D <&ldb_lvds_ch1>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&lcdif2 {
> > +	status =3D "okay";
> > +};
> > +
> > +&lvds_bridge {
> > +	status =3D "okay";
> > +
> > +	ports {
> > +		port@1 {
> > +			ldb_lvds_ch0: endpoint {
> > +				remote-endpoint =3D <&panel_in_lvds0>;
> > +			};
> > +		};
> > +
> > +		port@2 {
> > +			ldb_lvds_ch1: endpoint {
> > +				remote-endpoint =3D <&panel_in_lvds1>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +// Update VIDEO_PLL1 frequency
> > +&media_blk_ctrl {
> > +	assigned-clock-rates =3D <500000000>, <200000000>,
> > +			       <0>, <0>, <500000000>,
> > +			       <988400000>;
> > +};
> > +
> > +&pwm3 {
> > +	status =3D "okay";
> > +};
> > --
> > 2.54.0
> >
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



