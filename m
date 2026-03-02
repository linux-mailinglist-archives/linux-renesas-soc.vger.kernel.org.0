Return-Path: <linux-renesas-soc+bounces-28667-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JaqHSTFpWnEFgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28667-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 18:13:08 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD4A1DD9E2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 18:13:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 221C63106118
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2026 16:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 003B3423A83;
	Mon,  2 Mar 2026 16:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="rxv8OHCQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A048421A0E;
	Mon,  2 Mar 2026 16:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772470747; cv=none; b=tIoQ5J1HL/9yNBQw7I8MUhbJIvvOtzTCO4swen61W+PX4TfxogGRlDW8zqng9nGVgjco+KcqZ1/+i0s/y5Vpd+GUBzZ1KxyvlVGZV7FMTqtwH15hoIM+ndBEtphfLGZJy2Tw+SPpCWKvCY2fl5oN3b/kx3kYSNa420RdfjfDZ/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772470747; c=relaxed/simple;
	bh=uiJ0RBXKk0XUNumW6onkF1ex71/gnR+cuyox1cQnjB8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kapkFZ/CLVGCyoeCgcek2AQ8c+LkA4OEpELxiKpm3/x9TS1x0rMNAahi/o6mEQxnpRPUxXLN2GD8LPoynbb7nRYHPqgzgDuOQVWKkvwKBw7ZUvO0ucFCBE8pqZfyQaLGSWHLEs70y6Bw24HkhhaKToorWZ62e/BA2Jvh/UvfQp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=rxv8OHCQ; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=odYzrck29LAOJzj3S/U8ypRmw6yfV/uqVpybrs/IoRA=; b=rxv8OHCQZ75qUbOT2J8Uqae4Cn
	Tcxwz4Fgv2EAMSeyQ5hvYhpWiQaVOAO8C6vdgGkzlUjxgyeKTZnUNfm5swOOKFk0FSh1hHf+HM2QV
	BRissMDMOifQuTjY/fGMOMWjwej36iXTM24Y0Y/L2o5WpNhnT8en1La2uBemc4wldttOyS/96DvUk
	QIABMgTR5flvk9rfyt8Ux8JoukeMKLo5SpIu09A0+mvAkR6oZNxZ4mWnBK4dPCKyH27Prf02VZojL
	s1bsVLX4m4E2Fb9by8VKwi9z61LtGqhmgV5DhMulCCukdkERSenZq/HtOA8Zr5EVh0GnORv06+WG+
	kuFgM5IA==;
Date: Mon, 2 Mar 2026 17:56:40 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Kalle Niemi <kaleposti@gmail.com>, Bartosz Golaszewski
 <bartosz.golaszewski@oss.qualcomm.com>, Mukesh Kumar Savaliya
 <mukesh.savaliya@oss.qualcomm.com>, Viken Dadhaniya
 <viken.dadhaniya@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Branden Scott <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Vignesh R <vigneshr@ti.com>, Aaro
 Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Patrice
 Chotard <patrice.chotard@foss.st.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Linus Walleij
 <linusw@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, Matti Vaittinen
 <mazziesaccount@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 01/12] i2c: allow setting the parent device and OF
 node through the adapter struct
Message-ID: <20260302175640.1020393d@kemnade.info>
In-Reply-To: <20260302165928.0e85b93c@kemnade.info>
References: <EDF3FB58-4747-442E-8463-6F1C6E568962@gmail.com>
	<CAMRc=Mc1+GX52A56kBLD0XytvL=E7kpjLDiqNkR=fici4-qUnw@mail.gmail.com>
	<20260302165928.0e85b93c@kemnade.info>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: CBD4A1DD9E2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kemnade.info,none];
	R_DKIM_ALLOW(-0.20)[kemnade.info:s=20220719];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28667-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,kernel.org,broadcom.com,ti.com,iki.fi,atomide.com,baylibre.com,glider.be,foss.st.com,pengutronix.de,nxp.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,sang-engineering.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andreas@kemnade.info,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kemnade.info:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,kemnade.info:dkim,kemnade.info:email,kemnade.info:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, 2 Mar 2026 16:59:28 +0100
Andreas Kemnade <andreas@kemnade.info> wrote:

> On Mon, 2 Mar 2026 03:08:24 -0800
> Bartosz Golaszewski <brgl@kernel.org> wrote:
>=20
> > On Mon, 2 Mar 2026 11:38:27 +0100, Kalle Niemi <kaleposti@gmail.com> sa=
id: =20
> > > On 3/2/26 10:55, Bartosz Golaszewski wrote:   =20
> > >> On Mon, Mar 2, 2026 at 8:47=E2=80=AFAM Kalle Niemi <kaleposti@gmail.=
com> wrote:   =20
> > >>> On 2/23/26 11:05, Bartosz Golaszewski wrote:   =20
> > >>>> In order to stop i2c bus drivers from dereferencing the struct dev=
ice
> > >>>> embedded in struct i2c_adapter, let's allow configuring the parent
> > >>>> device and OF-node of the adapter directly through dedicated field=
s.
> > >>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualco=
mm.com>
> > >>>> ---   =20
> > >>> Hello,
> > >>> Automated driver test system bisected this commit to be the first b=
ad
> > >>> commit, linux-next next-20260227 was tested. Failed tests include d=
river
> > >>> tests for ROHM PMIC and accelerometers, which are connected to
> > >>> BeagleBone Black.
> > >>> The failed driver tests all fail to first i2cget and the tests stop
> > >>> there: "Could not open file '/dev/i2c-2' or 'dev/i2c/2': No such fi=
le or
> > >>> directory".   =20
> > >> Wolfram: well, now it would actually be useful to know which commit
> > >> exactly is the culprit so maybe splitting the changes is not a bad
> > >> idea after all.
> > >> Kalle: which i2c bus driver fails here? Any errors in kernel log?
> > >> Bart   =20
> > >
> > > Hello Bart,
> > >
> > > i2c-1 and i2c-2 are failing. I am not seeing any i2c errors in kernel=
 log. I got two failures without the dmesg available (this is bugged test s=
equence, and not a kernel crash), but those got the same stdout message "Co=
uld not open file ...." as all others.
> > >
> > > -Kalle
> > >   =20
> >=20
> > I meant what driver are you using but I suppose it's i2c-omap.
> >=20
> > Can you try the following change and let me know if it fixes the issue?
> >=20
> > diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> > index dd8cec9b04c6..01656f82d2c6 100644
> > --- a/drivers/i2c/i2c-core-base.c
> > +++ b/drivers/i2c/i2c-core-base.c
> > @@ -1548,6 +1548,11 @@ static int i2c_register_adapter(struct i2c_adapt=
er *adap)
> >  	if (adap->timeout =3D=3D 0)
> >  		adap->timeout =3D HZ;
> >=20
> > +	if (!adap->dev.parent)
> > +		adap->dev.parent =3D adap->parent;
> > +	if (!adap->dev.of_node)
> > +		adap->dev.of_node =3D adap->of_node;
> > +
> >  	/* register soft irqs for Host Notify */
> >  	res =3D i2c_setup_host_notify_irq_domain(adap);
> >  	if (res) {
> > @@ -1561,11 +1566,6 @@ static int i2c_register_adapter(struct i2c_adapt=
er *adap)
> >  	adap->dev.type =3D &i2c_adapter_type;
> >  	device_initialize(&adap->dev);
> >=20
> > -	if (!adap->dev.parent)
> > -		adap->dev.parent =3D adap->parent;
> > -	if (!adap->dev.of_node)
> > -		adap->dev.of_node =3D adap->of_node;
> > -
> >  	/*
> >  	 * This adapter can be used as a parent immediately after device_add(=
),
> >  	 * setup runtime-pm (especially ignore-children) before hand.
> >  =20
> No changes here. Devices probe, bus indexes are still shifted.
> If I take that into account, i2cget still works.
>=20
> But I think there is no defined order anyways. So if
> I would add e.g. usb device provoding i2c busses early than
> omap-i2c for some odd reason, things were messed anyways.
>=20
> On the other hand, just having numbers skipped seems to be odd.
>=20
ok, looked around further,
We have aliases, so numbers should be static


i2c_add_adapter calls i2c_register_adapter() as the
last thing, but needs to determine the number earlier.

This seems to help:

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index dd8cec9b04c6..e22d784202b8 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1657,10 +1657,9 @@ static int __i2c_add_numbered_adapter(struct i2c_ada=
pter *adap)
  */
 int i2c_add_adapter(struct i2c_adapter *adapter)
 {
-	struct device *dev =3D &adapter->dev;
 	int id;
=20
-	id =3D of_alias_get_id(dev->of_node, "i2c");
+	id =3D of_alias_get_id(adapter->of_node, "i2c");
 	if (id >=3D 0) {
 		adapter->nr =3D id;
 		return __i2c_add_numbered_adapter(adapter);

> Regards,
> Andreas
>=20
>=20


