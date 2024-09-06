Return-Path: <linux-renesas-soc+bounces-8820-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1DA96F7B2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 17:04:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D94F28696C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 15:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C781D223B;
	Fri,  6 Sep 2024 15:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QFdduUky"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06CC1D1F4F;
	Fri,  6 Sep 2024 15:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725635033; cv=none; b=GH2nID92eHQnAfpmpaAyzgA/hQaypDRtTAHKIMrJVV0tsDmDQTWtkU3A2JUfDfafVtL0/kRrkT1uu49WquLHMXUS8GYVLtVShprcFpKgFtuQCfzr8FRPS26GcqLo2xZojO56U1PyNErxmXi0m1QElSNntl0f3u/wIDxuTkMymog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725635033; c=relaxed/simple;
	bh=2oeQEBkTdVNWGwtz6+y1GsN4AO/sM4yT7WaXmgyvhJ0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tDmZnIToq4puLWaitgPHmUYpo30EjVDGZwnVjwsY7irUVIWWdRcHqz5RoMYHl9uRO3nfvnrngobrGYNeSlbXgpCGvdaVKFwG3lTgoc0DLxnsEw6tQTPqUbIJb5RF54dot0FYXcgPSABN8M4+KnfdOASD5CTZX7oXU2GQCb+iR1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QFdduUky; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 79075E000F;
	Fri,  6 Sep 2024 15:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725635023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ee9E1EaKOTlVdaGoV/jFTAD6cKrW6LwAZgqUGO3N8fI=;
	b=QFdduUkyT1+QwBo+jlvyJMYP3/45JVTkmvu1YL4mwpOQaUBF1aV/jkT92vRfa8v3SRbIqZ
	fk9Sf+TsTdH61rs3UzxlhLpC6Q7AP2yYrvo/6ici5ot19NZWbvbWuJfXIYTzRGW42988WJ
	I1KJDnY/Ysxq2db8P9yqJosCZpcc9iOTgQHFx0HO/ZV9wGiXDrwCM4Vh869XCOF3T0EIaI
	f0PA4B8JkRH1iJDwhoFpLxZtxIecWCDA4tbGw9FV9w6IFu2pwt0SpkPOS4cXDtMPFRNxPz
	Tfxgn6/Nl/KYg78OmDL12HTvgIlWD5IXAnugF/St6P5p8E03rJPuCp5gAa7Mbw==
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
Subject: Re: [PATCH -next RESEND 07/10] mtd: rawnand: mtk: Use for_each_child_of_node_scoped()
Date: Fri,  6 Sep 2024 17:03:40 +0200
Message-ID: <20240906150341.734598-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826094328.2991664-8-ruanjinjie@huawei.com>
References: 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'8795952679494b111b7b2ba08bb54ac408daca3b'
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com

On Mon, 2024-08-26 at 09:43:25 UTC, Jinjie Ruan wrote:
> Avoids the need for manual cleanup of_node_put() in early exits
> from the loop.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

