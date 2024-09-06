Return-Path: <linux-renesas-soc+bounces-8816-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E24EB96F7A6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 17:03:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0703282E15
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 15:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BBDA1CE6F8;
	Fri,  6 Sep 2024 15:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Zw8fgBGt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B741CE706;
	Fri,  6 Sep 2024 15:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725635014; cv=none; b=tNFEKOx2v78TXGLoPHkZnA18ES9EHyciY0j/h3P+LKwUqPHmJHJJ6/cTh5gKT8yq1IBHY/a2MvuVMyzXTla2BOvb/ehiGUCCMtK/1zGzEgKDYjPi23Z6+mCp8AtdGJG+BAD1KF9lP//k0R0tvi04lB2ACxJK8ltMAFmKiDnuxnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725635014; c=relaxed/simple;
	bh=ZvGRlnhoWirh3rR2Y9vlE0e5x1ELOpwq1R1bOvgQToQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eEnwMfkLwoZkuNfQ4Rap8UoisiLWOeoKuLcZx5UKoAEsvjzQ6xCBWAOzxa3QFFEa9o82Oty9Z+LEcf/pfUNMc7wdK2S0xpgIDyodUy4qBsFWw2ENhvI/oU1Ne5F7LURtz4/t8QWklQU3HVJADQLlTGwx5xaWw+6ar7eU0OdgEwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Zw8fgBGt; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F20960002;
	Fri,  6 Sep 2024 15:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725635004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UpOgnp/4T9ohFqRf5TWdDn4NXwlnS6KaHAvMaKzDSL0=;
	b=Zw8fgBGtR6i1G0kB/MTOleD+0SZ2QUoTBptfP2K8dOHvufA2dpQwSe1P5TYX2TI8OTRiQx
	qHKF1SvIRChobRTssJgKzPUPLu1yT/1yXwZ3DuaaG/6jDeZZgzYaQLvCPSpC3dBfwJ2hCr
	PB+Xjq9Spt3zv0gt1dUTSYAl+HQ0H8PJNsepgIlj7bJHXz9n9ZqSEgEWnJoXr7wkAeFfh+
	f6A9F4I0PAVA4hzXvUTxw6UM4rskzkuKRFadnRlsj+8bHS4VPL8KJMKzSiV9coWlcbtSpP
	HSz+9amkrnSGES7TpDMh5UMC9LELrvnwN+jZttaWkiOv+C/6ZwcO6W+RuDefpw==
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
Subject: Re: [PATCH -next RESEND 10/10] mtd: rawnand: sunxi: Use for_each_child_of_node_scoped()
Date: Fri,  6 Sep 2024 17:03:20 +0200
Message-ID: <20240906150320.734507-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826094328.2991664-11-ruanjinjie@huawei.com>
References: 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'b59fdc7f38812fa811a1f8d63ca2d42c9728c09c'
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com

On Mon, 2024-08-26 at 09:43:28 UTC, Jinjie Ruan wrote:
> Avoids the need for manual cleanup of_node_put() in early exits
> from the loop.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

