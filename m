Return-Path: <linux-renesas-soc+bounces-9934-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 350FB9A5FC8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 11:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 496B01C20EDD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 09:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B34748F54;
	Mon, 21 Oct 2024 09:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Z7oIb6hG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3E34437
	for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Oct 2024 09:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729502141; cv=none; b=mC5ZQ6YZ4pje0NNjaLBa2gDghVVk/xjuWeWgLF3IphQlId1xT814n3AMsmmoFtpJqVaNEbBzs3GZFs+MJ8Vf6HWheWmhJy4MikUO8trqg6P9jaIC5YNqUDTZ3K2b7g75u9DqNji2W2vkpkoVeCgFQVj8DxeuZkAhZNaB7czk9QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729502141; c=relaxed/simple;
	bh=Ck9jpFmh256Mz2huEvw1ixmMblWibXE/EzedxLUF7+U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oBlEJZwC9e/bAEfU69BXuOMwD0P7z3JkBSfk9OqqWGrvOyfy1GIKPqPmPxz3IrWNrt83oFYGuVxKlKCKFgL3aov6+MPI72rgFrdSESxO7DjnQTSKQC8F4Sc75FNiGclCuBwo52N7XJCb5ggYTjwhtYuA5Zo37Zh3l4Xs/mEEQ4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Z7oIb6hG; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 87DD7E000C;
	Mon, 21 Oct 2024 09:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729502131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ck9jpFmh256Mz2huEvw1ixmMblWibXE/EzedxLUF7+U=;
	b=Z7oIb6hG+Pgktuts/BIzu41Jz+TLerTZtNMfP5MWQea5M9A9yY5xZZ95/2J/d1yrfSiAwP
	pQItV7OhjPqyY2pW8BiOwuGdAYCMdGivNgD5qbkd7fY2Xx/bBx9jj39pAYAlvX1gufzcwT
	jpm3m8eMUKoxPeZTJdvyD42WxSOpA058dPiusZBpswMa3QurE3cdHuoE9ulVT/pJxPMuVr
	xlsuXCVIHYyxYTpxB+ZJuJAtoknvmHIIALFt2IzGfIGJajsKyCDBBinxj3cJykyd/IjedE
	UmARRNb+ZPWMlWOt4CyuuNh3ctIVSD0toFIP6EdUg4S3j/ILK3VpCz+GvJlYIA==
Date: Mon, 21 Oct 2024 11:15:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Sergei Shtylyov
 <sergei.shtylyov@cogentembedded.com>, linux-mtd@lists.infradead.org, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das
 <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mtd: hyperbus: rpc-if: Add missing MODULE_DEVICE_TABLE
Message-ID: <20241021111526.1882d9e4@xps-13>
In-Reply-To: <20240823173143.366150-1-miquel.raynal@bootlin.com>
References: <20240731080846.257139-1-biju.das.jz@bp.renesas.com>
	<20240823173143.366150-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com


miquel.raynal@bootlin.com wrote on Fri, 23 Aug 2024 19:31:43 +0200:

> On Wed, 2024-07-31 at 08:08:40 UTC, Biju Das wrote:
> > The rpc-if-hyperflash driver can be compiled as a module, but lacks
> > MODULE_DEVICE_TABLE() and will therefore not be loaded automatically.
> > Fix this.
> >=20
> > Fixes: 5de15b610f78 ("mtd: hyperbus: add Renesas RPC-IF driver")
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com> =20
>=20
> Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git =
mtd/fixes, thanks.

I just realize now this patch got applied but not included in any final
PR, sorry about that, I'll handle it.

Thanks,
Miqu=C3=A8l

