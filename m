Return-Path: <linux-renesas-soc+bounces-8822-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FC796F7BC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 17:04:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93A162864CF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 15:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 968371D363A;
	Fri,  6 Sep 2024 15:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lPF136AF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40751D3628;
	Fri,  6 Sep 2024 15:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725635044; cv=none; b=RPdUzLECEFwOLd+6qratQ88O3G84P1movC15loyDlopid201QcbNBf0yUhb6TqwxxUjxo2dpPJ9hXIWu4HqBsahvtij1ymyD9F5tPuVFzzScJXiao6QqVkaF5ZkxkS0+rSBCHBlmNdHSg13fkdZcvrZ8hZHHAp97ALPPWG/F3ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725635044; c=relaxed/simple;
	bh=hEWqExGTt0pJ13YLSou1uTl2RYpMSjF0CsYpiLkm7Q8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HFTmQt4QLOOA3wfd89r/LvmUTQL/CJTF6a3UDCvAOi2LWZF7GqW/zIkvZBTNWhCSRMvETu5j9LGwNt7I52fxP6ISb3CM6ox7GPckY32ij+9slQQ2qzPMv5yX/Tc+OZcseZFdzxyAPK99tyrcGec90fyJdIY8HfCGtqixyX3Tc3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lPF136AF; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 10FF81C000D;
	Fri,  6 Sep 2024 15:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725635040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0gVP1IO5B0KxwnAMcPOyPNDvjw/mvY2nbIjRYuUupdU=;
	b=lPF136AFaXPTVEKxnUQMWPcv+NslqQqYRoTBEdgY2gcjR9kVQpL2qGAMOp23FcUtGHqAal
	m6W2r6rK4/3g+NFSfeQtOQG21ZBHap2EfQYyAVC/vWZniDLb326RRU107oBb5UGa4yab+z
	AupglR5W41ecFm6fBikBJLW2i6kjgpO3SeNlEzdkMUZEbctp/Pwp68Emx4/96MVNsC+trh
	0tOCnVwOtENsa8b4qxAoHl9vR0djb5fKuZPzcRSdD7vX1yGHvIJwAP68a3h8NEjUDw8auw
	W5JtVwLM25N7hJws1c+MDFny/rk4NYO/BXqOpJiGfJ57aGAogkUW5ec+cjnfXQ==
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
Subject: Re: [PATCH -next RESEND 04/10] mtd: rawnand: marvell: drm/rockchip: Use for_each_child_of_node_scoped()
Date: Fri,  6 Sep 2024 17:03:57 +0200
Message-ID: <20240906150357.734687-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826094328.2991664-5-ruanjinjie@huawei.com>
References: 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'707f2d0720ed6831d736cca084b62ba97eb7fa23'
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com

On Mon, 2024-08-26 at 09:43:22 UTC, Jinjie Ruan wrote:
> Avoids the need for manual cleanup of_node_put() in early exits
> from the loop.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

