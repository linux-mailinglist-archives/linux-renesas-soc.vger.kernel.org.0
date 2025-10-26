Return-Path: <linux-renesas-soc+bounces-23612-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDC9C0B63F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Oct 2025 23:47:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15EA03AD3E8
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Oct 2025 22:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE2C19ADBA;
	Sun, 26 Oct 2025 22:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="H3Tq3ZE4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8A6CA4E
	for <linux-renesas-soc@vger.kernel.org>; Sun, 26 Oct 2025 22:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761518871; cv=none; b=hmQvWwjaV0vF77vJo3P7O7ln6V8Z0xf4CCI9yaTc7vNg7mblZJIZt4/Gh2DJUAEtXsAIiuJ6Kq3Z4K1P/QMwS7uulRn0UuOe9/HGA0gHkPfwQ2zLP4tOE70NdZHFUybDVHn7HN7eNvQj4znfgXiH2Qzm8xzsdM3TNci66Ny0bVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761518871; c=relaxed/simple;
	bh=LqaT8t7f9y3yVmMeZA4qSd6VoGnYWESnAsgtdzVRrHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9wGEeYrIU89/oF3PvEfxYTYlbj4YBGUx8OxTEVwYOZLJxHF/tk5TEKE/0AJn2y8bf/Gn9RPkQ99SqMH3f0MGBkCl2y7ZQHJ6XdFO1CLCTGrmM86SfpnUz2eei3Uq/IVqCDPNdxojaJtgktxSHnFc7bYCSIoyjE0yb9w4cyaZ+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=H3Tq3ZE4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=TvwQ
	l8d2jlX3Ak0jPbn1ibLAZ4HqwcHrLO0wfm00CYk=; b=H3Tq3ZE4/0VxkoEnM9U3
	+TFH9n8g3EjdjsMv2+IX44AKqVknWg2JkEHGvIGNfZpMbAvDmSa8KT4/HohmgPfc
	uGwt4UCSUcPDdQjewnrkMbbeL/+HVtwArSJblJ/UsptY1onfozNoMnNo3lJdX5u9
	DAsBt942C2lrecJwt8YaZ/r0ANWAOcP1eTDwifiL8b3sEtniaK2zPUk5KigVdMFX
	WiZctBQTdQsTgkbEdFNnFq+U7BYJpP8aYFq2QmY4f8NapV8vztE9FtOR55NmoFM6
	fANRaBrqQVVMckRpU+tSj4CDKkzAzynECUA4gFzhVXILFGJB7Nv44DhRThmszVB9
	WA==
Received: (qmail 3383049 invoked from network); 26 Oct 2025 23:47:45 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Oct 2025 23:47:45 +0100
X-UD-Smtp-Session: l3s3148p1@VCMykhdCUNkujntU
Date: Sun, 26 Oct 2025 23:47:44 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] mailbox: renesas: Support MFIS mailbox driver
Message-ID: <aP6lEJwg-65m8DsL@shikoro>
References: <87frb8n7kl.wl-kuninori.morimoto.gx@renesas.com>
 <87cy6cn7jg.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sUliLxCTxVvcQyTq"
Content-Disposition: inline
In-Reply-To: <87cy6cn7jg.wl-kuninori.morimoto.gx@renesas.com>


--sUliLxCTxVvcQyTq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

in addition to what the others already mentioned...

> +	help
> +	  This driver provides support for SCMI interface transport with
> +	  MFIS(Multifunctional Interface).
> +	  It is used to send short message between CPU cores and
> +	  SCP(System Control Processor).

Spaces after MFIS and SCP. But I would reword it because it can send
messages to the RT domain, too. Suggestion:

+	  This driver provides support for mailboxes of the MFIS
+	  (Multifunctional Interface) via the SCMI interface.
+	  It is used to send short message between different domains
+	  like AP, RT, and SCP.


> +
>  config RISCV_SBI_MPXY_MBOX
>  	tristate "RISC-V SBI Message Proxy (MPXY) Mailbox"
>  	depends on RISCV_SBI
> @@ -389,5 +398,4 @@ config RISCV_SBI_MPXY_MBOX
>  	  remote processor through the SBI implementation (M-mode firmware
>  	  or HS-mode hypervisor). Say Y here if you want to have this support.
>  	  If unsure say N.
> -
>  endif
> diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
> index 81820a4f55285..060a9c7f6727b 100644
> --- a/drivers/mailbox/Makefile
> +++ b/drivers/mailbox/Makefile
> @@ -27,6 +27,8 @@ obj-$(CONFIG_PL320_MBOX)	+=3D pl320-ipc.o
> =20
>  obj-$(CONFIG_OMAP2PLUS_MBOX)	+=3D omap-mailbox.o
> =20
> +obj-$(CONFIG_RCAR_MFIS_MBOX)	+=3D rcar-mfis-mailbox.o
> +
>  obj-$(CONFIG_ROCKCHIP_MBOX)	+=3D rockchip-mailbox.o
> =20
>  obj-$(CONFIG_PCC)		+=3D pcc.o
> diff --git a/drivers/mailbox/rcar-mfis-mailbox.c b/drivers/mailbox/rcar-m=
fis-mailbox.c
> new file mode 100644
> index 0000000000000..54cabfa305eb4
> --- /dev/null
> +++ b/drivers/mailbox/rcar-mfis-mailbox.c
> @@ -0,0 +1,137 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas MFIS (Multifunctional Interface) Mailbox Driver
> + *
> + * Copyright (c) 2025, Renesas Electronics Corporation. All rights reser=
ved.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/interrupt.h>
> +#include <linux/mailbox_controller.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +static int mfis_send_data(struct mbox_chan *link, void *data)
> +{
> +	void __iomem *reg =3D link->con_priv;
> +
> +	/*Trigger interrupt request to firmware(SCP)*/

Spaces before and after "*"

> +	iowrite32(0x1, reg);

#define instead of hardcoded value?

But I guess the real question here is: do we know already that the SCP
firmware will just react on the interrupt? We really do not need the 15
bits of data that goes with this register? Or the message register?

> +
> +	return 0;
> +}
> +
> +static irqreturn_t mfis_rx_interrupt(int irq, void *data)
> +{
> +	struct mbox_chan *link =3D data;
> +	void __iomem *reg =3D link->con_priv;
> +
> +	mbox_chan_received_data(link, 0);
> +
> +	/* Clear interrupt register */

I would drop this comment, but maybe others won't.

> +	iowrite32(0x0, reg);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int mfis_startup(struct mbox_chan *link)
> +{
> +	struct mbox_controller *mbox =3D link->mbox;
> +	struct device *dev =3D mbox->dev;
> +	int irq;
> +	int ret;
> +
> +	irq =3D of_irq_get(dev->of_node, 0);
> +
> +	ret =3D request_irq(irq, mfis_rx_interrupt,
> +			  IRQF_SHARED, "mfis-mbox", link);
> +	if (ret) {
> +		dev_err(dev,
> +			"Unable to acquire IRQ %d\n", irq);
> +		return ret;
> +	}
> +	return 0;
> +}
> +
> +static void mfis_shutdown(struct mbox_chan *link)
> +{
> +	struct mbox_controller *mbox =3D link->mbox;
> +	struct device *dev =3D mbox->dev;
> +	int irq;
> +
> +	irq =3D of_irq_get(dev->of_node, 0);
> +
> +	free_irq(irq, link);

Is it really necessary to free the irq here? We could simply disable it?

> +}
> +
> +static bool mfis_last_tx_done(struct mbox_chan *link)
> +{
> +	return true;
> +}
> +
> +static const struct mbox_chan_ops mfis_chan_ops =3D {
> +	.send_data	=3D mfis_send_data,
> +	.startup	=3D mfis_startup,
> +	.shutdown	=3D mfis_shutdown,
> +	.last_tx_done	=3D mfis_last_tx_done
> +};
> +
> +static int mfis_mbox_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct mbox_controller *mbox;
> +	void __iomem *reg;
> +	int ret, count =3D 2, i;

Why is count =3D 2? Doesn't X5H support 64 of them?

> +
> +	mbox =3D devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
> +	if (!mbox)
> +		return -ENOMEM;
> +
> +	mbox->chans =3D devm_kcalloc(dev, count, sizeof(*mbox->chans), GFP_KERN=
EL);
> +	if (!mbox->chans)
> +		return -ENOMEM;
> +
> +	reg =3D devm_platform_ioremap_resource(pdev, i);
> +	if (IS_ERR(reg))
> +		return PTR_ERR(reg);
> +
> +	for (i =3D 0; i < count; i++) {
> +		mbox->chans[i].mbox	=3D mbox;
> +		mbox->chans[i].con_priv	=3D reg + ((1 - i) * 4);

Why backwards ("1 - i")?

> +	}
> +
> +	mbox->txdone_poll	=3D true;
> +	mbox->txdone_irq	=3D false;
> +	mbox->txpoll_period	=3D 1;
> +	mbox->num_chans		=3D count;
> +	mbox->ops		=3D &mfis_chan_ops;
> +	mbox->dev		=3D dev;

Only one space before '=3D'.

> +
> +	ret =3D mbox_controller_register(mbox);
> +	if (ret)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, mbox);
> +	dev_info(dev, "MFIS mailbox is probed\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mfis_mbox_of_match[] =3D {
> +	{ .compatible =3D "renesas,mfis-mbox", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mfis_mbox_of_match);
> +
> +static struct platform_driver mfis_mbox_driver =3D {
> +	.driver =3D {
> +		.name =3D "renesas-mfis-mbox",
> +		.of_match_table =3D mfis_mbox_of_match,
> +	},
> +	.probe	=3D mfis_mbox_probe,
> +};
> +module_platform_driver(mfis_mbox_driver);
> +MODULE_DESCRIPTION("Renesas MFIS mailbox driver");
> +MODULE_LICENSE("GPL v2");

"GPL" only.

But I guess we need a bit more information about the bigger picture of
this driver. Like, with which firmware was this used?

Happy hacking,

   Wolfram


--sUliLxCTxVvcQyTq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmj+pQwACgkQFA3kzBSg
KbaV0w//Q9lRuOQkDMtfMf9PM4NY8F4q9Z9v3P6LRm/EsIWLVdaCbZud8270Ekjt
TQCIFJ10rrooaNF0bg8d/I1ePNOPvgTpbZi5uQL4wfZt0LQPQP0JBt+Ts1IzVmRo
TH9t7QPdLEuoaclvbUJvGlfIvkidOyf+GpilqRY6iV6LBsoHMQ48WM+7Kcoj+AER
5E9K00tSYqnPbwP92o0UlaUFPK8nuu1+ygs7Crdm5xyN7jogYXzqpnC95Iqy0aee
DBgc++75dBqihgeelahXudp4FnMnzEqycV9hIwz6gW085p7zriI8VP7T82Yue7cg
k12+YuX5RXr7KWzT6rCFhDwP9vC3UCpMdvJO20432n5hcZsUWnZv09/3lizBX5ZN
TZe1B7d+ViYmV1g5R4K+hqATR9PjXNV0M592Oy9vLKjQpuxCEw8VxrgFCCqB+e0O
ZFXVv6Yir3jea84YQOfNAhjR/zZb+01U9h1EVDWWMvLBMNTx9A9CgSilZ9C9xfag
dAeE3M2RnjlcD2FOmp+QYxmrFt6g+a58AAMqCg/xkcZgCmhCQb+ck+IcqHGQyTTO
PoMo0YGcdWd7CwWytoy3OwMpjwG/q3BDz1rnlkEKwKSwiuQKznhpoKxeHjX9v3xn
roIIbgqybhIwWlorkS7XJAsTWcokc/Z0UZ8aXJQ7hsPAZAGahlo=
=NtR+
-----END PGP SIGNATURE-----

--sUliLxCTxVvcQyTq--

