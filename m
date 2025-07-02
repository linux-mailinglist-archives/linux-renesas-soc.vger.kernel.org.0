Return-Path: <linux-renesas-soc+bounces-19010-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9A0AF0CF1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 09:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E59D1C22B3D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 07:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3D7922D7B0;
	Wed,  2 Jul 2025 07:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OwIxVvlZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C694E223DEA;
	Wed,  2 Jul 2025 07:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751442500; cv=none; b=LLddxLg/9KtETc4IOilizR4HMUXLjRLq5cXficerztI2/SQaWsP3vzjMI97iYzpJ3gU/cORx+vd3O2atbh8Mq3dbPMYKPVcZiozO8OWm6WwtZxJ1ApxcPbPpbY17tbh3xBQ2NbPEqTCH5BwWR6dawnOmDKrIslnsCPzWc+jZdtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751442500; c=relaxed/simple;
	bh=Ygo+3EXyX2A//CA0ixDyqzlihUEypIyuHoFDa84UCtQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NEt680OTWTJWP8HJcynwLLeQ0dlltLgL+VaxdPsx3q/OXn7mSLYfuVQKpvg2stlaDdKsfThF6tbLRZN9+28pf73KEMOQ5Tz7QdbCF3y/0orzODRdSAa+oXpvL9c+uVUyvcyJiL9zhNgt42uczzI6v7Yl9ZKYkRO+svqJshFyY+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OwIxVvlZ; arc=none smtp.client-ip=217.70.178.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE69F449E7;
	Wed,  2 Jul 2025 07:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751442489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FjGikRjaB+jO1uDjOO0DjL+ti5fz5Aw/2bvXKkr4ak4=;
	b=OwIxVvlZy5LxGK4FXI4zX/t+d9G0wKbfB3U8Du/5RVNNCOyIa38P4SPyY4yBlpGZ0AC9eL
	voNgIzfSQEqP9qLa22x2wjPykl46YEIiuh2Xhupo51qzUmXzQi9utPiCazlbQ0iBeisnwp
	PtNYqJrFh3cKII6ij0iu433zX+5tI4lDnGB8gbi2nrT3zLcnSBzU+uPZR/VYlj8oOGastt
	9djwEeNezT70Ce0uxU8q7VTUqlYJdUg5h3rhlnOYbm6soUg31p1st1hbV7LlF2AwX1tmT6
	BkSnHpqmNsPi04gOg99iBjZcks1yGSLDZ2mPVlRFsTG+JGP2zbjrLxpHQenowg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: stable@vger.kernel.org,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  Wolfram Sang
 <wsa+renesas@sang-engineering.com>,  linux-mtd@lists.infradead.org,
  linux-renesas-soc@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: renesas: Add missing check after DMA map
In-Reply-To: <20250702071722.24921-3-fourier.thomas@gmail.com> (Thomas
	Fourier's message of "Wed, 2 Jul 2025 09:17:22 +0200")
References: <20250702071722.24921-3-fourier.thomas@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 02 Jul 2025 09:48:07 +0200
Message-ID: <878ql7nidk.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduieekfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehfohhurhhivghrrdhthhhomhgrshesghhmrghilhdrtghomhdprhgtphhtthhopehsthgrsghlvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpt
 hhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg

Hi Thomas,

On 02/07/2025 at 09:17:22 +02, Thomas Fourier <fourier.thomas@gmail.com> wr=
ote:

> The DMA map functions can fail and should be tested for errors.
>
> Fixes: d8701fe890ec ("mtd: rawnand: renesas: Add new NAND controller driv=
er")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
> ---
>  drivers/mtd/nand/raw/renesas-nand-controller.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/mtd/nand/raw/renesas-nand-controller.c b/drivers/mtd=
/nand/raw/renesas-nand-controller.c
> index 44f6603736d1..f4a775571733 100644
> --- a/drivers/mtd/nand/raw/renesas-nand-controller.c
> +++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
> @@ -426,6 +426,10 @@ static int rnandc_read_page_hw_ecc(struct nand_chip =
*chip, u8 *buf,
>  	/* Configure DMA */
>  	dma_addr =3D dma_map_single(rnandc->dev, rnandc->buf, mtd->writesize,
>  				  DMA_FROM_DEVICE);
> +	if (dma_mapping_error(rnandc->dev, dma_addr)) {
> +		dev_err(rnandc->dev, "DMA mapping failed.\n");

This error message is not informative, please drop
it. dma_mapping_error() does give more information if you enable some
DMA DEBUG Kconfig symbol already.

> +		return -ENOMEM;
> +	}
>  	writel(dma_addr, rnandc->regs + DMA_ADDR_LOW_REG);
>  	writel(mtd->writesize, rnandc->regs + DMA_CNT_REG);
>  	writel(DMA_TLVL_MAX, rnandc->regs + DMA_TLVL_REG);
> @@ -606,6 +610,10 @@ static int rnandc_write_page_hw_ecc(struct nand_chip=
 *chip, const u8 *buf,
>  	/* Configure DMA */
>  	dma_addr =3D dma_map_single(rnandc->dev, (void *)rnandc->buf, mtd->writ=
esize,
>  				  DMA_TO_DEVICE);
> +	if (dma_mapping_error(rnandc->dev, dma_addr)) {
> +		dev_err(rnandc->dev, "DMA mapping failed.\n");

Ditto.

> +		return -ENOMEM;
> +	}
>  	writel(dma_addr, rnandc->regs + DMA_ADDR_LOW_REG);
>  	writel(mtd->writesize, rnandc->regs + DMA_CNT_REG);
>  	writel(DMA_TLVL_MAX, rnandc->regs + DMA_TLVL_REG);

Thanks,
Miqu=C3=A8l

