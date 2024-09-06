Return-Path: <linux-renesas-soc+bounces-8821-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D58E96F7B8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 17:04:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9D971C24F36
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 15:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CE471D2F53;
	Fri,  6 Sep 2024 15:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PunlC78B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364561D3191;
	Fri,  6 Sep 2024 15:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725635038; cv=none; b=SEnb5sWNH6SitRu7k4N/HgPaf3lcBEpxonrSUTY4XZ7SpVtDIC6/5GMOP5RA6YdhiwjPeXklW4lPiMJp68mow/pao3bGlUB2YfQXghcokdJrL8D23f5LskjkqbTRwKUoNdlTr7cb18Zux4k9l/+CzERPfFx9ZC1B2113xItGYN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725635038; c=relaxed/simple;
	bh=ig73HJ1hICNEBudefCF5l8HV1ZnEF+cq1GVFvVXOviU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jhzl1sdo5CREmbMummC9O56lhNM7tVP7swNf0RCWgMgvoxRVbBVovsi+JXkrn9OMK40NfXXtIQfb3m4hTaM+KYx634hx8tasobjx9oilqrtg1YgYHbtzH8kom11xxyV9jJ4fNt7mLK0ZkT7V5qLC+gNkd4MYyN5Vu1jrKh+4dZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PunlC78B; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32D6E60009;
	Fri,  6 Sep 2024 15:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725635034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KCE2Aeig1Xtcqxsj6OCesMJmx0Bzx3NcYdEg1kOU9Wc=;
	b=PunlC78BePp6i3CMkcel19x4PHIcMkhAoQtwHCtPb3f/8vgyKhRc4njyM1R8yUlHP5IadP
	4sOrUMZ86RJ2cXmTOITw+HIRlggZDpVCzT1VfBUqZ0dsb3MfwlpJjo/M8jDPUYN8Gont70
	AGNqpJRGxlaEzQCk6b+C1UTPQOwqsylksrCZyxc7QEQov8J9L8XwvpD9TAcgqkefj5o3Fl
	8pUErSqOrREkixPF39G2m0nTzGI8PwKQZDMPVfFVuKfwEYv4Fp6hWOpYUfnhClb4mglzrU
	+5co91phMXuldBvfqhxTKq44tpZqr82YMIlNc35Ul7+vcL1gK92/acbVnNnVOw==
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
Subject: Re: [PATCH -next RESEND 05/10] mtd: rawnand: rockchip: Use for_each_child_of_node_scoped()
Date: Fri,  6 Sep 2024 17:03:51 +0200
Message-ID: <20240906150351.734658-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826094328.2991664-6-ruanjinjie@huawei.com>
References: 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'0d5c32b5c877d61afc954c760dc58f3b8626ec04'
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com

On Mon, 2024-08-26 at 09:43:23 UTC, Jinjie Ruan wrote:
> Avoids the need for manual cleanup of_node_put() in early exits
> from the loop.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

