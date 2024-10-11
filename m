Return-Path: <linux-renesas-soc+bounces-9717-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 365E299AB79
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 20:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C2041C228AE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 18:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564DF1C9DF9;
	Fri, 11 Oct 2024 18:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="iccmNrmz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875AD1BBBC6;
	Fri, 11 Oct 2024 18:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728672534; cv=none; b=arVpZ2IRJINCPaosA5teqQDWDdcprgUrYKwRPkKpJZKf5A/xePLa0F1tHS78qiD8bVx6xSwetKrXdJ+h46b/Mpz5xRKHDPKC/vXLx8LJc1cGDxku37KkCT3QG4LyLdU04330oMMURWMjhqo50XjY5SH4KiJGRpuwohGfBhg3tJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728672534; c=relaxed/simple;
	bh=BRBJ69O5Y+OJjvKHG16LKBpIN3vxBrGnZi4bliNQR70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XDtnT185U/VZb0+Nm2tatcokTZlxGPgWLKp9VcsWj23MfNHriF0TrAtsf2XuIAFv0v4a4RDcu90pYjEQcs0puMJrjTTWYc818Ei3MeiHH3eeFjpaU2jJ/hBeY96MGF5yJCDkltwIFvOAE7BCwD+sNMR4+CI5/F0ELfV1C1SlewE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=iccmNrmz; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728672500; x=1729277300; i=markus.elfring@web.de;
	bh=fOk+qxQUaR15C1SG3z4GSWnIHZDQPtizqqUOb7X8qk4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=iccmNrmzWiw+S1pqVV60kuERmH78gvbX8a1d4CZI40q4RuwJ3MoUqhzADwKHqa3U
	 0XApOmGbd/7w1ijd7SiIdSlwYEinyIVLWiWM17lPtSOME7b/JIGvj4zcs+AYXogSS
	 oaV2Fsx/XOJG039L1rPpAGsaHMMDcE1RpNSkp3uA7ZfzfcLoBd9OIzE70xi7vrH46
	 qGCUuw3As2DWxtHPiPXT/FhsgVsi5gi9pZYzp/VmpQKtd8+bNhqysJhC+cw2m2T4f
	 CCb8E1EEZSycU3f53xVPcQUSWSWezESfZgbVQn4US2ekIK/dW1aL2NVfVaQCnWDFF
	 n5ISZyW2LoFwlbXH9g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MMY1N-1tIEyp1M87-00KASn; Fri, 11
 Oct 2024 20:48:20 +0200
Message-ID: <663a37fe-ffc4-4826-b8ba-bcefdb0e7992@web.de>
Date: Fri, 11 Oct 2024 20:48:18 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] irqchip/renesas-rzg2l: Fix missing put_device
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Marc Zyngier <maz@kernel.org>
References: <20241011172003.1242841-1-fabrizio.castro.jz@renesas.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241011172003.1242841-1-fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5vxS5q9WmasTB24MvXKgHDn01i9eCxrPjt3xBpM6u0jstKy1yHx
 Rt2Vp77a5jHb4IoEqgaDGz8OVl9NEB/zi5phpgybZg7HRvVWR0hMSqMKL1JYOtHLq72drjR
 miPjqmoehn60aIv4877oz4DFn2/k9r9key1ydCPsurmaxTl7fB5mFatOmkjWjsWjYZ4eXhY
 a4MDh+0bwPmBVJhxiK2uA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xEg2pFie58Q=;bVOhJyu9dK2DnQ3etXm0gqj8os6
 8HR7iNmq4qxjyLV74HaaKDugYxoPm2PYXHBnInGbVweyKgL7Jca9VJnzNyhvc6a9GO6vWTuYN
 Zsd8yTpGpDPad8Q9NPI8bdxupCkThQPUQp9GD7k2jpYKJsZFLZ4+uvw9GGY38aTvky2mwMO+u
 BSxrSjaVF2IhylUnyuV8DjjkjKvq84xnC03tvA7Isq2D2b4aHuA/hZrZWTLfmuKd7cPmB5u2o
 jMoxY/PFXbyF38hDHF1JFK20gxQjiS+hqpT9/XDrZDYqm0quggylWHABR8uDS+/RF4v9KqC7I
 iMmDafcBOO4d9+BUpi0LWft7GqU2eoh+dCDrH9Q7gd3U2mKnssI/s8/Daj7FFSAdxMItwUoix
 ZnFxChB9POdw7h2s0eloA4YBERTzGYmX36OwW/u2VoVZYkzjsV5bkjT/DtH/4NJdFdGh/2JIm
 KKxS1CpJagE0LG1sutV2vMtQoBdersoyZDDc5bN8FM81zL7IRZvJRSZMgdGOeeDeoUEUrZxJa
 kWLvn9SkR1iI8p5wK++Zc0ncwSERxYT5gvhe/G9Op0Tzy7IJ//UJ8mlDLsAehkmcYjBrfEwCh
 WHT4QZc2oqOghtpja2azPmlOeZ/1dXjqYhMkB+pwzS3HbXv6fvKQWh+2uZjiT8rdyhyAb4Dcb
 XGNIV9wySUf7qzaBrd7DwAOXpu+BcdDYuDFC7tXP97KHSKjuM9OClDZ/jKt9Uv34PBfbGLgKJ
 AE7+UhSJZP0lF74/4mHRKyp6wuugIVjDzfN2/AE59AKyxha3otxWV+cxtnexqf+JDHK5tf1Ht
 VhBbDWgSMclBifuvTKYicxqg==

> rzg2l_irqc_common_init calls of_find_device_by_node, but the
> corresponding put_device call is missing.

How do you think about to append parentheses to function names
(so that they can be distinguished a bit easier from other identifiers)?


> Make use of the cleanup interfaces from cleanup.h to call into
> __free_put_device (which in turn calls into put_device) when

Can it help to influence the understanding of this programming
interface by mentioning the usage of a special attribute?


> leaving function rzg2l_irqc_common_init and variable "dev" goes
> out of scope.
>
> Mind that we don't want to "put" "dev" when rzg2l_irqc_common_init
> completes successfully, therefore assign NULL to "dev" to prevent
> __free_put_device from calling into put_device within the successful
> path.

Will further software design options become applicable here?

Can any pointer type be used for the return value
(instead of the data type =E2=80=9Cint=E2=80=9D)?


> "make coccicheck" will still complain about missing put_device calls,
> but those are false positives now.

Would you like to discuss any adjustment possibilities for this
development tool?


=E2=80=A6
> +++ b/drivers/irqchip/irq-renesas-rzg2l.c
> @@ -8,6 +8,7 @@
>   */
>
>  #include <linux/bitfield.h>
> +#include <linux/cleanup.h>
=E2=80=A6

This header file would usually be included by an other inclusion statement=
 already,
wouldn't it?
https://elixir.bootlin.com/linux/v6.12-rc2/source/include/linux/device.h#L=
33


=E2=80=A6
> @@ -530,12 +531,12 @@ static int rzg2l_irqc_parse_interrupts(struct rzg2=
l_irqc_priv *priv,
>  static int rzg2l_irqc_common_init(struct device_node *node, struct devi=
ce_node *parent,
>  				  const struct irq_chip *irq_chip)
>  {
> +	struct platform_device *pdev =3D of_find_device_by_node(node);
> +	struct device *dev __free(put_device) =3D pdev ? &pdev->dev : NULL;
>  	struct irq_domain *irq_domain, *parent_domain;
> -	struct platform_device *pdev;
>  	struct reset_control *resetn;
>  	int ret;
>
> -	pdev =3D of_find_device_by_node(node);
>  	if (!pdev)
>  		return -ENODEV;
=E2=80=A6

Would you dare to reduce the scopes for any local variables here?
https://refactoring.com/catalog/reduceScopeOfVariable.html

Regards,
Markus

