Return-Path: <linux-renesas-soc+bounces-28639-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oD6xOBKqpWmpDgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28639-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 16:17:38 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 483071DBA61
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 16:17:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9850E30B389C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2026 15:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE70140FDA9;
	Mon,  2 Mar 2026 15:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="noBkohPQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D7640FDA1;
	Mon,  2 Mar 2026 15:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772464317; cv=none; b=Z6c+hEvufVbkNQMsUWBeHocOAepNFC6KvSsJWn7SmRt1pc1QubKlGzq2HpVjXgjjLCAkrJ/jiO3aoY/FI2QP3l5zpti8HkVD0nkfiDjvcirEDZ9SI1DC4x8DK1CwSYRNFV0wSGr09cQdhX+YxIwYyqG19saKNCRMQKo8Jr9+gZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772464317; c=relaxed/simple;
	bh=3iYO0kg6ueKYDxo+WUqxQW/1ohu/Io5iWqOcMOoZVaY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QssdM/O35g7ViXM5tIHHDoiMt1NW4MBvyMGz91fwp48riO+A3zao7k5PLnBPQD3GhjfrOZ8yZHeXlsLeK31H1FBes71YOktETSfoZwjxFR9bpPDONPY/61KlmS5rsmsHV8i1JvkNRh0+vaZlMA7+oXf7XU16/Yj6I8Pgzs0JurA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=noBkohPQ; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=fOE00VOY5CO+udhbXmZXmQz9cKeY+YffWZiDPf2sZPk=; b=noBkohPQtvbuoZmsWo6lCfVC0v
	wnxzq1SQ5Lj/pBCMSx747FmzuCK3eO9Ch94CEp6EBHx2GpGzcEerfJlEq3n25yBTSh935UFK8DGD4
	SzpfFNUZZdnGXXIg7FSlb6nQN0crQj1+1RVt0ZZrhPMu/VabG3RzgYsd+0pDI8YtVWoftgAogzXGG
	/Kt60pHaK6B/3iUjTMbmMNc/i8GCJHUQ93IX3MyLxeBxH+Y2VHs239W1HoqMHwAv+BQ0YU39VuaD6
	rxdtCJn8AyOra+wikSbvm26LeV9ISHk9b2tds38fBYg7DDQIVOZYTRpNq1xyd648ZITveXnM4+DWx
	DsvP98lQ==;
Date: Mon, 2 Mar 2026 16:09:23 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Kalle Niemi <kaleposti@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Bartosz Golaszewski
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
 <mazziesaccount@gmail.com>
Subject: Re: [PATCH v2 01/12] i2c: allow setting the parent device and OF
 node through the adapter struct
Message-ID: <20260302160923.53abf2ea@kemnade.info>
In-Reply-To: <EDF3FB58-4747-442E-8463-6F1C6E568962@gmail.com>
References: <EDF3FB58-4747-442E-8463-6F1C6E568962@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 483071DBA61
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
	TAGGED_FROM(0.00)[bounces-28639-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kemnade.info:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andreas@kemnade.info,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,sang-engineering.com,oss.qualcomm.com,broadcom.com,ti.com,iki.fi,gmail.com,atomide.com,baylibre.com,glider.be,foss.st.com,pengutronix.de,nxp.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kemnade.info:dkim,kemnade.info:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

On Mon, 2 Mar 2026 12:38:27 +0200
Kalle Niemi <kaleposti@gmail.com> wrote:

> =EF=BB=BFOn 3/2/26 10:55, Bartosz Golaszewski wrote:
> > On Mon, Mar 2, 2026 at 8:47=E2=80=AFAM Kalle Niemi <kaleposti@gmail.com=
> wrote: =20
> >> On 2/23/26 11:05, Bartosz Golaszewski wrote: =20
> >>> In order to stop i2c bus drivers from dereferencing the struct device
> >>> embedded in struct i2c_adapter, let's allow configuring the parent
> >>> device and OF-node of the adapter directly through dedicated fields.
> >>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.=
com>
> >>> --- =20
> >> Hello,
> >> Automated driver test system bisected this commit to be the first bad
> >> commit, linux-next next-20260227 was tested. Failed tests include driv=
er
> >> tests for ROHM PMIC and accelerometers, which are connected to
> >> BeagleBone Black.
> >> The failed driver tests all fail to first i2cget and the tests stop
> >> there: "Could not open file '/dev/i2c-2' or 'dev/i2c/2': No such file =
or
> >> directory". =20
> > Wolfram: well, now it would actually be useful to know which commit
> > exactly is the culprit so maybe splitting the changes is not a bad
> > idea after all.
> > Kalle: which i2c bus driver fails here? Any errors in kernel log?
> > Bart =20
>=20
> Hello Bart,
>=20
> i2c-1 and i2c-2 are failing. I am not seeing any i2c errors in kernel log=
. I got two failures without the dmesg available (this is bugged test seque=
nce, and not a kernel crash), but those got the same stdout message "Could =
not open file ...." as all others.
>=20
Probably I am using the same host driver

tested on OMAP3 DM3730, result: i2c drivers get bound to their devices,
no obvious trouble. But controllers are registered with high indexes.

localhost:~# i2cdetect -l
i2c-3	i2c       	OMAP I2C adapter                	I2C adapter
i2c-4	i2c       	OMAP I2C adapter                	I2C adapter
i2c-5	i2c       	OMAP I2C adapter                	I2C adapter
localhost:~# uname -a
Linux localhost 7.0.0-rc1-next-20260227 #27 SMP Mon Mar  2 11:56:27 CET 202=
6 armv7l Linux

Regards,
Andreas

