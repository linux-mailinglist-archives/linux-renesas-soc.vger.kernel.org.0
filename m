Return-Path: <linux-renesas-soc+bounces-8823-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F8896F7C0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 17:05:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15703B226B0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 15:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551F41D279E;
	Fri,  6 Sep 2024 15:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Wf6SCxH6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D861D1F56;
	Fri,  6 Sep 2024 15:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725635051; cv=none; b=AIgEgi+pc3+Wec/mo5wF2EPcJSGK5dzLo6icJupSVrRCbzKRLm0YcqFCShnPhCCNskX6gwlA24a8VjCPaJSDLQSXCmFr5wYfGKbnAwfmn+GRo2l/QJjU10GKYr8fED4GnZu3nVPyIZjfH59FVcOYkhkcVJ/HJHRw5JkDaKOFWfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725635051; c=relaxed/simple;
	bh=GH5rNWrBUQlQIvNKlL9ukxs15QwXQCcVE+kAylO6KS4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JOR2XxD/7QZRWe2QIUfxurXVULocFAEF/ZyJYbeL/Em//hDW48t/ZCHzlSqGy0LyKsAYBonh375HO1MNq6bnunjik7pNOXU4I0fBVa/6Pfse4lBKQhfrvUxqMnE6uMuaz4xLHgX7bkZ3bTtZrzKWMOQEXUe05SWBQl6BFlnFYWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Wf6SCxH6; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id F07CA40006;
	Fri,  6 Sep 2024 15:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725635047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jw3jelfZPGpJojoqs3leXgvbUvML2v+wgQjqH8fSPOg=;
	b=Wf6SCxH6Yu5o+CGniDQq5IIduRCsRLQB/oErbgsNq8vdm3JLhwO5a1soEPJX5JOEZQhW58
	T4XsIFeGaHAH/06yxElbpGgFYRaTYMmW1XtIModGnXxTeS6+ymyeyiX9jkrGED+RZitQ59
	6qy1xp9C2BcWBKcPrAab7CkG9/SaaCWtSc8YQXU3LyPX0pEDgXSrTnOv+KFlk/H+K0dDGm
	1WSsZfMdBBq4jhHwePwiiOokGprjB6+Eik0eyox5fhvN6anUcn6kCCWtz5+Ge67qdV0Wyc
	DXg/l1qX5ELRDfziQcLFmXFagLTeOuGtxr2g7s32TBcclbT4TA5jBPeBc4zX0g==
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
Subject: Re: [PATCH -next RESEND 03/10] mtd: rawnand: pl353: Use for_each_child_of_node_scoped()
Date: Fri,  6 Sep 2024 17:04:03 +0200
Message-ID: <20240906150403.734743-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826094328.2991664-4-ruanjinjie@huawei.com>
References: 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e2e4eddf7b16a0cb431878e95e8bb80d893e4077'
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com

On Mon, 2024-08-26 at 09:43:21 UTC, Jinjie Ruan wrote:
> Avoids the need for manual cleanup of_node_put() in early exits
> from the loop by using for_each_child_of_node_scoped().
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

