Return-Path: <linux-renesas-soc+bounces-28641-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKTZGuu2pWkiFQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28641-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 17:12:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4F31DC790
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 17:12:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 725533203305
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2026 16:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43425423162;
	Mon,  2 Mar 2026 15:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="U4dS6Zup"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2063421F04;
	Mon,  2 Mar 2026 15:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772467179; cv=none; b=Vud5eibu1hy0SaaH1TQaOHCDZTWR/zw8vcHgGUOHpVCMFrmpF6l3GZgrzpwMa90bBBs3w5D6AeTPoyGFg31gTX8mUSGAoga2VRXQPZkQhzzqCmxCrSzrtHKlfFiSrmYnXCMnzP6MmZOgxRmhkLcVJazI+yU1LCoU8xXzyfE7m5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772467179; c=relaxed/simple;
	bh=RPXAbgcWiottF+6vRHDeyuLDGGU3d2h0Sy1lz+n4CFY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IQpl2Snwd+MGvK1hRr0PkyebbsJQ27w45qLr38P5Aoz4V+hfYjiVYnewinEmoJSjKj+80oNd3NkKAVjN/jwn2o5KJ8i7q5J7JjFsjtg7FYsH6ZUtSdpN8+MZoiivvdAPAjjkWXmdhOPYgltFvyMQ/8bodKFDxfXymR8vwMRL+9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=U4dS6Zup; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=m+cEZMdIbkTNuc8V0+2/U1K0zQ+pBrPYJlsUByy01QU=; b=U4dS6ZuplR4gMAUbhaueT98vov
	LpSbLTc1jxe+fZfsTiYzJl2Tq1js+HHiOi83ruaLdLfqWlVClK7BuEl2Ke1ZYVkPPVVMwguCO2o5k
	Y+Xaf7wf5BY+7pkkFc0mRPK0dQQDntMJ3J1aalxumhpV9LsOnKGVm+V7VjhUxBq4fWdultevdkUS5
	ZiphFAl8o+fc4AvlZPBICrm26rdd0HrZwW9PC/66JZZxKljItRmq0/vZQgCKPtJ+8hamepbVnE0Ns
	8uXNEEO5Yj4h9uTNCtk6j6ukMXJ1b0tfKXxYlNZLRAFoBcZjbJwo8CeV3bcIcpwC6lsYY+UjV+KrG
	CICpupYw==;
Date: Mon, 2 Mar 2026 16:59:28 +0100
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
Message-ID: <20260302165928.0e85b93c@kemnade.info>
In-Reply-To: <CAMRc=Mc1+GX52A56kBLD0XytvL=E7kpjLDiqNkR=fici4-qUnw@mail.gmail.com>
References: <EDF3FB58-4747-442E-8463-6F1C6E568962@gmail.com>
	<CAMRc=Mc1+GX52A56kBLD0XytvL=E7kpjLDiqNkR=fici4-qUnw@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: AD4F31DC790
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kemnade.info,none];
	R_DKIM_ALLOW(-0.20)[kemnade.info:s=20220719];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28641-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,kemnade.info:dkim,kemnade.info:mid]
X-Rspamd-Action: no action

On Mon, 2 Mar 2026 03:08:24 -0800
Bartosz Golaszewski <brgl@kernel.org> wrote:

> On Mon, 2 Mar 2026 11:38:27 +0100, Kalle Niemi <kaleposti@gmail.com> said:
> > On 3/2/26 10:55, Bartosz Golaszewski wrote: =20
> >> On Mon, Mar 2, 2026 at 8:47=E2=80=AFAM Kalle Niemi <kaleposti@gmail.co=
m> wrote: =20
> >>> On 2/23/26 11:05, Bartosz Golaszewski wrote: =20
> >>>> In order to stop i2c bus drivers from dereferencing the struct device
> >>>> embedded in struct i2c_adapter, let's allow configuring the parent
> >>>> device and OF-node of the adapter directly through dedicated fields.
> >>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm=
.com>
> >>>> --- =20
> >>> Hello,
> >>> Automated driver test system bisected this commit to be the first bad
> >>> commit, linux-next next-20260227 was tested. Failed tests include dri=
ver
> >>> tests for ROHM PMIC and accelerometers, which are connected to
> >>> BeagleBone Black.
> >>> The failed driver tests all fail to first i2cget and the tests stop
> >>> there: "Could not open file '/dev/i2c-2' or 'dev/i2c/2': No such file=
 or
> >>> directory". =20
> >> Wolfram: well, now it would actually be useful to know which commit
> >> exactly is the culprit so maybe splitting the changes is not a bad
> >> idea after all.
> >> Kalle: which i2c bus driver fails here? Any errors in kernel log?
> >> Bart =20
> >
> > Hello Bart,
> >
> > i2c-1 and i2c-2 are failing. I am not seeing any i2c errors in kernel l=
og. I got two failures without the dmesg available (this is bugged test seq=
uence, and not a kernel crash), but those got the same stdout message "Coul=
d not open file ...." as all others.
> >
> > -Kalle
> > =20
>=20
> I meant what driver are you using but I suppose it's i2c-omap.
>=20
> Can you try the following change and let me know if it fixes the issue?
>=20
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index dd8cec9b04c6..01656f82d2c6 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -1548,6 +1548,11 @@ static int i2c_register_adapter(struct i2c_adapter=
 *adap)
>  	if (adap->timeout =3D=3D 0)
>  		adap->timeout =3D HZ;
>=20
> +	if (!adap->dev.parent)
> +		adap->dev.parent =3D adap->parent;
> +	if (!adap->dev.of_node)
> +		adap->dev.of_node =3D adap->of_node;
> +
>  	/* register soft irqs for Host Notify */
>  	res =3D i2c_setup_host_notify_irq_domain(adap);
>  	if (res) {
> @@ -1561,11 +1566,6 @@ static int i2c_register_adapter(struct i2c_adapter=
 *adap)
>  	adap->dev.type =3D &i2c_adapter_type;
>  	device_initialize(&adap->dev);
>=20
> -	if (!adap->dev.parent)
> -		adap->dev.parent =3D adap->parent;
> -	if (!adap->dev.of_node)
> -		adap->dev.of_node =3D adap->of_node;
> -
>  	/*
>  	 * This adapter can be used as a parent immediately after device_add(),
>  	 * setup runtime-pm (especially ignore-children) before hand.
>=20
No changes here. Devices probe, bus indexes are still shifted.
If I take that into account, i2cget still works.

But I think there is no defined order anyways. So if
I would add e.g. usb device provoding i2c busses early than
omap-i2c for some odd reason, things were messed anyways.

On the other hand, just having numbers skipped seems to be odd.

Regards,
Andreas

