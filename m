Return-Path: <linux-renesas-soc+bounces-30147-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CE4eCSlowmmecAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30147-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 11:32:09 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E45D306790
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 11:32:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 85E84305FC59
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 10:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C9C3E2756;
	Tue, 24 Mar 2026 10:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="FrI/5Qh2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B093E1230;
	Tue, 24 Mar 2026 10:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774347861; cv=none; b=aKQ25nC48pVKIuNh/meDLo7sdKKCSqkrqRe4L2OE+WDLnCLSNatyqM+XKM/aDvOmsTYMBg7AuHeVbGK5LaAlQ7UZj3+v9Buw7LvoaqB9KkojdGB9YhMqgaB6Lh6XWh3kbKLSyBJ1RjmnKfdZrktas8ZaJf1KXKCtJ/Mtib2w30k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774347861; c=relaxed/simple;
	bh=uOc2W0qFV291yPRbXPafqHAGAkVduR26ne2oc7X4SYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O2MpT2OzT2Nk5sSsEc+HU6WmUg+b0d2cZc/aZdD0zeD9ptjeKD3cYQd332r6Dgr/RWWrbpjiAX3r3a856KxW/kdMb8QFUa5XM31rZI7TNE+4DEyj+8UbP7+dn1fijz8t0VNUdWa4QCeUg2ocQCnsZ6VOWwO0R606iIMM9NZ8oRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=FrI/5Qh2; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=S6uvvEM8Q8RkAK0BRhim+FMr5vS+WhCd8Ae7ZnBCYfM=; b=FrI/5Qh26/Bf0qI2wuHwMH5x1o
	l0ZcurgJMqFwdycKwHnU7AfnwWV6bVn3ESzW6v4BLnICtYS3M4Calj9U0lio62uJO4+cnP2WDDcbK
	TqKYfj+nvFnnAK/LEcwUc1Rt6F7wzJxC4hZICVGRevdq/UXEML4WVK1VKDGvM5vPslKqNpBMuQ+vk
	vJ9ZFIH4wqs3M480+9AEIz50WkRgbPM9d4o64BM2HZv3yg+Ks2fTLoKJaSC9uHldnkVrAVR1h7QHy
	iXF8bweU2MiIjMdXFLSaXLP+Ir6MrWioUiHnx+lu5xoYvqZuYAOre828JcY9CgbYZ1NlVIeHZ4cbX
	c6T9UXxQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w4yvj-000E43-2Z;
	Tue, 24 Mar 2026 11:24:11 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w4yvj-0006q3-0d;
	Tue, 24 Mar 2026 11:24:10 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Frank Li <Frank.Li@nxp.com>,
 linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 6/9] soc: imx8m: don't access of_root directly
Date: Tue, 24 Mar 2026 11:24:09 +0100
Message-ID: <6593091.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260223-soc-of-root-v2-6-b45da45903c8@oss.qualcomm.com>
References:
 <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
 <20260223-soc-of-root-v2-6-b45da45903c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27950/Tue Mar 24 07:24:19 2026)
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ew.tq-group.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ew.tq-group.com:s=default2602];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30147-lists,linux-renesas-soc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,pengutronix.de,gmail.com,glider.be,sholland.org,nxp.com,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alexander.stein@ew.tq-group.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ew.tq-group.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,tq-group.com:url,i.mx:url,qualcomm.com:email,ew.tq-group.com:dkim]
X-Rspamd-Queue-Id: 8E45D306790
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Am Montag, 23. Februar 2026, 14:37:21 CET schrieb Bartosz Golaszewski:
> Don't access of_root directly as it reduces the build test coverage for
> this driver with COMPILE_TEST=3Dy and OF=3Dn. Use existing helper functio=
ns
> to retrieve the relevant information.
>=20
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

today I noticed the following warning running next-20260323:
> caam 30900000.crypto: No clock data provided for i.MX SoC

This happens when there is no matching against the soc_id.

Checking the source it turns out this patch is the cause that the SoC info
does not provide soc_id anymore.
next-20260323:
> $ grep . /sys/devices/soc0/*
> /sys/devices/soc0/family:Freescale i.MX
> /sys/devices/soc0/machine:TQ-Systems i.MX8MPlus TQMa8MPxL on MBa8MP-RAS314
> grep: /sys/devices/soc0/power: Is a directory
> /sys/devices/soc0/revision:unknown
> /sys/devices/soc0/serial_number:0000000000000000
> grep: /sys/devices/soc0/subsystem: Is a directory

reverting this patch (2524b293a59e586afd06358d0b191ab57208a920):
> $ grep . /sys/devices/soc0/*
> /sys/devices/soc0/family:Freescale i.MX
> /sys/devices/soc0/machine:TQ-Systems i.MX8MPlus TQMa8MPxL on MBa8MP-RAS314
> grep: /sys/devices/soc0/power: Is a directory
> /sys/devices/soc0/revision:1.1
> /sys/devices/soc0/serial_number:469677A693A4B8CE131D180033E44903
> /sys/devices/soc0/soc_id:i.MX8MP
> grep: /sys/devices/soc0/subsystem: Is a directory

soc_id is restored. Now that I write these lines I noticed that
serial_number also contained empty value which is restored with the revert.

Best regards,
Alexander

> ---
>  drivers/soc/imx/soc-imx8m.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
> index 8e2322999f0996d2723768469c6893b0ea22eb9d..77763a107edbd11302017e3f6=
1ecb4369fda1ab0 100644
> --- a/drivers/soc/imx/soc-imx8m.c
> +++ b/drivers/soc/imx/soc-imx8m.c
> @@ -226,7 +226,6 @@ static int imx8m_soc_probe(struct platform_device *pd=
ev)
>  	const struct imx8_soc_data *data;
>  	struct imx8_soc_drvdata *drvdata;
>  	struct device *dev =3D &pdev->dev;
> -	const struct of_device_id *id;
>  	struct soc_device *soc_dev;
>  	u32 soc_rev =3D 0;
>  	u64 soc_uid[2] =3D {0, 0};
> @@ -244,15 +243,11 @@ static int imx8m_soc_probe(struct platform_device *=
pdev)
> =20
>  	soc_dev_attr->family =3D "Freescale i.MX";
> =20
> -	ret =3D of_property_read_string(of_root, "model", &soc_dev_attr->machin=
e);
> +	ret =3D soc_attr_read_machine(soc_dev_attr);
>  	if (ret)
>  		return ret;
> =20
> -	id =3D of_match_node(imx8_soc_match, of_root);
> -	if (!id)
> -		return -ENODEV;
> -
> -	data =3D id->data;
> +	data =3D device_get_match_data(dev);
>  	if (data) {
>  		soc_dev_attr->soc_id =3D data->name;
>  		ret =3D imx8m_soc_prepare(pdev, data->ocotp_compatible);
> @@ -326,7 +321,7 @@ static int __init imx8_soc_init(void)
>  	int ret;
> =20
>  	/* No match means this is non-i.MX8M hardware, do nothing. */
> -	if (!of_match_node(imx8_soc_match, of_root))
> +	if (!of_machine_device_match(imx8_soc_match))
>  		return 0;
> =20
>  	ret =3D platform_driver_register(&imx8m_soc_driver);
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



