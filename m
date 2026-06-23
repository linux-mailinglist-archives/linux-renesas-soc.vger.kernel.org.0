Return-Path: <linux-renesas-soc+bounces-34360-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dPf5G+MyOmqP3wcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34360-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 09:16:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AAD6B4C73
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 09:16:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ew.tq-group.com header.s=default2602 header.b=kqbvVj+L;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34360-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34360-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=ew.tq-group.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0497300BC8A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 07:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2833C456F;
	Tue, 23 Jun 2026 07:14:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA283C3450;
	Tue, 23 Jun 2026 07:14:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782198865; cv=none; b=RR1Gjeva71pf1uEGAkvXIDUYOnq3jLkoLN7FavEWbUvYHva7joSOX0iYudQqlxvaQoVoqiovGCloYI+cW2S7G4Ic1e+yQ7Jf+iB2UQlgPm1/Tzk4cmsNf4A1TOzqORLUndPD9gQFBXW++GWAGQHl+4vd10jYu2wPmJjRs/KWH6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782198865; c=relaxed/simple;
	bh=8y46Yju15t/1iPyWUiD+fHypEVZTRKbUmfGltB3HmX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OizbVACHNw4ZD+aiPiKq+L4onN8Ff1HFJKIOjGX+11Bie/Wan3Demo0r/EjOEzvuU/iIKwBmDrQWJwMX2Oax3MqLhbB/8cQHh+Arz0BM0ocGHAx4t4bYHF4CPOnCgKL0s7dpGNCBJ8WhSG+OZogULRd8EujNhZf2+TgG4yl4enU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=kqbvVj+L; arc=none smtp.client-ip=188.40.3.216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=sXOBfhLAVLwn3podSYtFoxvOp/Tp82jbXxsxprm1FYY=; b=kqbvVj+LJ8cVuOpaDC1veWCJiX
	uOgYwPvpWyuyPDFv4+YJbFBwS0jG891C6E3kwpzx8sdGs+VaLL+s6k7PhZdkAogmsGsABVa9K0/20
	Ut/Dc8nUp2lejzvq4pFyffSvu77bBlVW06LQqOlnrFYf6MwTxRYtFiShPNN6wy5Bma/2HoGZDbNIr
	BiWNWSohIcej2ukS/q8CA/dLqQ5QCM2yGJnLD4ihOW61/wBC360KWv9rLSYbx3nPDuZ+n7PgdISV1
	AlkLCHcCdsX/2f+6RLkFm+JXxw/o44W30aULjgnm1ZNxn3UDEW6aZcPZzARaTJh9MEfJJWnc7mFNK
	SKyrN92Q==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wbvKn-000G3R-1b;
	Tue, 23 Jun 2026 09:14:13 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wbvKn-000Oj2-1j;
	Tue, 23 Jun 2026 09:14:12 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 1/1] arm64: dts: add tqma9596la-mba95xxca
Date: Tue, 23 Jun 2026 09:14:11 +0200
Message-ID: <6282261.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <ajVN4nbmOW-D_Ec9@SMW015318>
References:
 <20260619112434.1121610-1-alexander.stein@ew.tq-group.com>
 <ajVN4nbmOW-D_Ec9@SMW015318>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5113499.31r3eYUQgx";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28039/Mon Jun 22 08:24:57 2026)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ew.tq-group.com,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[ew.tq-group.com:s=default2602];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-34360-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:Frank.li@oss.nxp.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:Markus.Niebel@ew.tq-group.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux@ew.tq-group.com,m:linux-renesas-soc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[alexander.stein@ew.tq-group.com,linux-renesas-soc@vger.kernel.org];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,pengutronix.de,gmail.com,kernel.org,glider.be,ew.tq-group.com,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.stein@ew.tq-group.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ew.tq-group.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ew.tq-group.com:dkim,ew.tq-group.com:from_mime,vger.kernel.org:from_smtp,tq-group.com:url,tq-group.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 13AAD6B4C73

--nextPart5113499.31r3eYUQgx
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@oss.nxp.com>
Subject: Re: [PATCH v5 1/1] arm64: dts: add tqma9596la-mba95xxca
Date: Tue, 23 Jun 2026 09:14:11 +0200
Message-ID: <6282261.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <ajVN4nbmOW-D_Ec9@SMW015318>
MIME-Version: 1.0

Am Freitag, 19. Juni 2026, 16:10:42 CEST schrieb Frank Li:
> On Fri, Jun 19, 2026 at 01:24:30PM +0200, Alexander Stein wrote:
> > From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> >
> > This adds support for TQMa95xxLA modules, designed to be soldered
> > on a carrier board. MBa95xxCA is a carrier reference board / starter kit
> > design.
> >
> > There is a common device tree for all variants with e.g. reduced
> > CPU core / feature count.
> >
> > Enable the external accessible PCIe controllers as host,
> > add clocking and reset GPIO. While at it, add hogs for GPIO
> > lines from the M.2 slots until M.2 connector driver is available.
> >
> > Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > Changes in v5:
> > * Limit LPSPI4 max frequency
> > * Replace PCIe M2 Key-E GPIO hogs with dedicated connector node
> > * Fix PCIe clock configuration
> >
> > Changes in v4:
> > * Fix LPSPI4 pad muxing and control
> >
> > Changes in v3:
> > * Moved reserved-memory to board-lebel
> > * Remove VPU reserved memory (unused for now)
> > * Fix typo in connector comment
> >
> > Changes in v2:
> > * removed useless regulator
> > * added USB PD source configuration
> > * Removed unused uart-has-rtscts properties (unused by LPUART)
> > * Fixed RTS/CTS pullups in pinctrl
> > * Added thermalzone on module
> >
> >  arch/arm64/boot/dts/freescale/Makefile        |   1 +
> >  .../freescale/imx95-tqma9596la-mba95xxca.dts  | 963 ++++++++++++++++++
> >  .../boot/dts/freescale/imx95-tqma9596la.dtsi  | 278 +++++
> >  3 files changed, 1242 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba9=
5xxca.dts
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx95-tqma9596la.dtsi
> >
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/d=
ts/freescale/Makefile
> > index 8ddaab127ab9c..43e1dc51b11d7 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -649,6 +649,7 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx95-19x19-frdm-pro.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx95-aquila-clover.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx95-aquila-dev.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx95-toradex-smarc-dev.dtb
> > +dtb-$(CONFIG_ARCH_MXC) +=3D imx95-tqma9596la-mba95xxca.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx95-tqma9596sa-mb-smarc-2.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx95-var-dart-sonata.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx95-verdin-nonwifi-dahlia.dtb
> ...
> > +
> > +	ptn5110: usb-typec@50 {
> > +		compatible =3D "nxp,ptn5110", "tcpci";
> > +		reg =3D <0x50>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_typec>;
> > +		interrupt-parent =3D <&gpio2>;
> > +		interrupts =3D <28 IRQ_TYPE_LEVEL_LOW>;
> > +
> > +		typec_con: connector {
> > +			compatible =3D "usb-c-connector";
> > +			label =3D "X9";
> > +			power-role =3D "source";
> > +			data-role =3D "dual";
> > +			source-pdos =3D <PDO_FIXED(5000, 500, PDO_FIXED_USB_COMM)>;
> > +			self-powered;
> > +
> > +			port {
> > +				typec_con_hs: endpoint {
> > +					remote-endpoint =3D <&typec_hs>;
> > +				};
> > +			};
> > +		};
> > +	};
> > +
> > +	sensor_mb: temperature-sensor@1e {
>=20
> please order by hex address value

Ah, thanks for the catch.

> > +		compatible =3D "nxp,se97b", "jedec,jc-42.4-temp";
> > +		reg =3D <0x1e>;
> > +	};
> > +
> ...
> > +		m2-keye-dev_bt-wake-hog {
> > +			gpio-hog;
> > +			gpios =3D <4 GPIO_ACTIVE_LOW>;
> > +			input;
> > +			line-name =3D "M2_KEYE_DEV_BT_WAKE#";
> > +		};
>=20
> Now Key E connector already be upstreamed.
>=20
> Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml,
> which already define these gpios.

Thanks for the hint. But these two wake signals are vendor specific
pins 40 and 42 on key-e. In this case these are for the default module
JODY-W3 module.

Thanks and best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/
--nextPart5113499.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEByESxqszIvkmWRwbaS+g2M0Z/iUFAmo6MkMACgkQaS+g2M0Z
/iUfDwf/dfqfx6vWvg+eg95x3/68BAFVAkno24HK2jry2c+5CUtsfK7L9wGzymTY
ZlDGHpZ6VUjgAb2CBnnWa7ZlqadCIGcpEkEIWgIxzw8ACqyeyZdc1S4Fx73ltWGR
DpXLmvnqVWCHNtOUbUhSeaWL+ZLkYtkZFX5RRilB2jwuKKlw4TUlk9Rykm8rIln6
VaI9B3LgoF5mGwZmbspj0my+CT/GRX+EbkgbSh0XR53EnsJBf2zT7xedWW/21ojS
dGPGWQOQyH1LGuF4lYEyFxFGtA3jdyqrod1vj9FR+o/6mLCoTRL7Ox7LusidQot/
ByET8EIgzKA0t9Nn5mRc9YUZW/d8ww==
=QyRP
-----END PGP SIGNATURE-----

--nextPart5113499.31r3eYUQgx--




