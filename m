Return-Path: <linux-renesas-soc+bounces-8825-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F3E96F7C5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 17:05:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42B7D28637A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 15:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E5CC1D2F45;
	Fri,  6 Sep 2024 15:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kRg5+knS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795931D4154;
	Fri,  6 Sep 2024 15:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725635059; cv=none; b=kgF5hg95DdVcZP92ICfD7utbAaFA0VYjmUZD0/vB1jK+WIXYnFHQafdQfgCwVLyeIwl7Ym1vUf78OcNgfG1iR9iln2wWgzpyLy/iqdSUi+NPIbDpw0SLz3WhiJ2MW+KlsraSVJLudpWu7nOvX3JKis2O6PA9WvvP3fzB7knn0Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725635059; c=relaxed/simple;
	bh=aMxMfLluDApZg8GZ/hhCoqo5WbxMkrnyc+dD6+FqcOY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UkrtZzQkaL80yOuAtGmOmSMbUqcnlRE8rtXrKSEUYYgrXUCbXTxvkFMsQyoLnDD1IS2iOYH2V/RSpIQmGOUqu23slkheh+w8unBxppZEdAE3+8dVA6w1C0fe8z6F4NO6kX/8LjHeGEWbYuVaHVG8iyYE5sOsjVi75Fqe0TtmfCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kRg5+knS; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C59C1BF205;
	Fri,  6 Sep 2024 15:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725635055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gLX4GxsDjXuYrcRxyG/fXuf+Afhpxwi7So/zPttJNUw=;
	b=kRg5+knSqmEj0BHFU8nCB6ceUaYg8uGpewryyD4TR1SpbbaUtuMO8VAonAzH3uVLnsS7gw
	jrUQ5SLNAAdnc7FKr6/knZl9dhd70RR3ff31QMYqp2U4K8FLK2DZmapqd8z7IhL8aFLwj0
	VTZva4B32Bq7FhWHii/kxctEMqzdgJ9OWfeYTSDL0zBjjPK6BTdEaW8YFl9Uxb7djHPRsv
	5WEUf10V26FyD56JhKfSMKiJyEqLEE7VOhj0K+A60uMvNT3I+iy0zNoOsplrgUcypNAHfb
	qs0CYdtjVLh+rihj0XiU5XtwhuT7zlQanOvxkBq5mi6f1NS0jUiUapji1r9HVw==
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
Subject: Re: [PATCH -next RESEND 01/10] mtd: rawnand: arasan: Use for_each_child_of_node_scoped()
Date: Fri,  6 Sep 2024 17:04:13 +0200
Message-ID: <20240906150413.734809-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826094328.2991664-2-ruanjinjie@huawei.com>
References: 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'7021a797689d288a06cb48d0da44880d1dcaff8d'
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com

On Mon, 2024-08-26 at 09:43:19 UTC, Jinjie Ruan wrote:
> Avoids the need for manual cleanup of_node_put() in early exits
> from the loop.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

