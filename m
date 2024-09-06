Return-Path: <linux-renesas-soc+bounces-8818-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0371996F7AB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 17:03:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6630285874
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 15:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 865601D1F56;
	Fri,  6 Sep 2024 15:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HqC7m+EF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706931C8FBC;
	Fri,  6 Sep 2024 15:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725635022; cv=none; b=RMc/A0I/5baaaTiuLVi3jP6dEOYKlm9ZZ2ckfBlKnIGaWBFcXHf01Oe0M2ZfnB7TBVbFj66F5t8un/x7tjVnlsS80q24+Go3/geuaMkJAY1/6fmG4yAtXACMX3nHEtTsp1STfzF/Onifg9WdaDgWD/ocnDYQjea+VmyC9TWl+Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725635022; c=relaxed/simple;
	bh=NIY5AZ0GlTPdccNKtWY3YvUuuYbSzAWlagISjAt/HcE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PtkXKD9jSUBS1Id/3Inz3zesF6oN3PJkui+DFkJmm0+P+G7p1dL8Tdl1mLfqtTIHPaw1hU4GQfq4RKreBV01frfys/fDc4v5GVfO/INAlPJt+u/+cPfD/D6w4qV2ZfL1bet/O+rF3YOVWq6eRkaZ+zBluSwX05tDoPv75sIgH5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HqC7m+EF; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00735FF809;
	Fri,  6 Sep 2024 15:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725635018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YCzNIuC06O9GFpBj+rz7i/FoJaoTyZM/ftekjkxFq5M=;
	b=HqC7m+EFgPCjd836JQLxJJmHm80prF1dgL8sxE6fAr42qroDhMQBXdwtpFosb6wpPNsQCR
	IfuvCZbXn3iKIvMijAwzafQkCGIz95baZwVtzeVkxDmqKMkYnZZ69eCU/39m1O9bgIzKap
	wDRHyPJAHhTmStNvOG6/WaLdwrXVYJLMzWPAta5Z+W6WrWFBQj6xzLckz3E2eI440WRGgY
	GqN/Dv1Bf4id3WzmxlDDKi4Fnv2+12VO3veuLpXJ3KmrGKTv8Rnwo1vLW+8BiFzWGaDbPP
	sX1US0i2uG+MLavxLw0sAtEdk8BWGX2OrxhYlIZjVC7pXIfFBJPqKM2cRwdf2Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>,
	miquel.raynal@bootlin.com,
	michal.simek@amd.com,
	richard@nod.at,
	vigneshr@ti.com,
	liang.yang@amlogic.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	heiko@sntech.de,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux@treblig.org,
	robh@kernel.org,
	u.kleine-koenig@pengutronix.de,
	erick.archer@gmx.com,
	christophe.jaillet@wanadoo.fr,
	val@packett.cool,
	christophe.kerello@foss.st.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	krzk@kernel.org,
	jic23@kernel.org
Subject: Re: [PATCH -next RESEND 08/10] mtd: rawnand: renesas: Use for_each_child_of_node_scoped()
Date: Fri,  6 Sep 2024 17:03:34 +0200
Message-ID: <20240906150334.734568-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826094328.2991664-9-ruanjinjie@huawei.com>
References: 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'f3b3c47ca41f696623e71596416d34fe1671d229'
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com

On Mon, 2024-08-26 at 09:43:26 UTC, Jinjie Ruan wrote:
> Avoids the need for manual cleanup of_node_put() in early exits
> from the loop.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

