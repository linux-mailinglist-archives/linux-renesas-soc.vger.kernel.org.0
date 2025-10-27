Return-Path: <linux-renesas-soc+bounces-23704-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52978C11809
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 22:14:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4D07421095
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 21:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8EC2329C46;
	Mon, 27 Oct 2025 21:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="nB3AZRFJ";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="vBbfk6Jx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317DD328622;
	Mon, 27 Oct 2025 21:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761599589; cv=none; b=GKpAS789iW2izGhT8aSQ5Ziy+T6IP1Mg0dv1VvehrmwJ6NHnyBejrGHwtKR16sujQTeiWxERfr0XSVRukjFyyBu7XA2P8qQPTMrYrEwXwetNR3LHRvl0YMdbp3+F/jQpXrNExIaEC71b73KXpkVxVDCcn0zufvgD9i0Ri4Q3ZB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761599589; c=relaxed/simple;
	bh=4Mk7XeIu8I1tW8Xb5LitDZJAazVj8Sqo2TxTfhsgB4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bZQf9dWb28D8WxjSJF4e38c6Y0px3DdVmivxd5hqp9rjwJB5I6PumkByFuhNbHlBV4ASLcE3AvcdVUvaJ4tq8fuxrV5MOtgwL6RvDdS6gxAgSvH8Gfumx53eohc1SQSnjNm4dAhP2aZHx3HYAzFvqNLcqKxHi+lq1G15ki5VFvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=nB3AZRFJ; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=vBbfk6Jx; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cwR741SHZz9tV5;
	Mon, 27 Oct 2025 22:13:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761599584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VX5p8zL1uHRFoHX//z5NO2RcC15Azw9VhUq1BP1qqKQ=;
	b=nB3AZRFJnRbOn7MWEz/PYzCCCcly8xk8w1Xn4YxKDdrdvOyT6Ex3XnINH5bht7ATJzJn3k
	6kQ3BhSeWFzpEDaxNJhJR4ZTfHkYWzLU4Osz8OcXl4qD047BQ3FwenXp442kl09TvFsUAO
	3y1iPlDNdEdVcbbITwZSXarbqImRK0ugItsAcMvCrPUK0B9zz439OEnDvqtqw0BGuKbkX5
	9iBAQXHUFCz66v0RHnVwAl0ClZTocpJhMUN2G1wcCwe76aWiLWCb/QNPrE/5gzjb1Yi+ls
	wfbzTnX1akNXj+DeHkkXAuwKV3I7epgPSIP6GjuJZoVF3sBmtS164Djy9vohHQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=vBbfk6Jx;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761599582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VX5p8zL1uHRFoHX//z5NO2RcC15Azw9VhUq1BP1qqKQ=;
	b=vBbfk6JxkcLq+3cBugcwFp00zIWoZ/OSdPt8QiaFfKd4K9o7rABAhnUtdLDIzDEBN7zDhX
	9miC7VMspHXgzMMfRrigGulH3IOzfaPGU4e3oS45vNs8xZ23App8y82f6z4DOzDuQM5zWh
	xRxGIDH0MBi5v0EidEqCYvXoMP/RTqqVY3QLT4E8KMxdTC/qZy/Z+pKpeqEyS6ALmgK/AH
	f7W+B2iwGYEZFsysUpbls6KME9AhuLaVD1hG5eaT4YVD6gvQHxog9BlRhVOEtduSAA2la3
	o9nLsxqdjQTIVqHXTgiZHiywwZEL5HmWH+dayQpMnNwJpikLS6/fyr4xs/9dMQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/5] arm64: dts: renesas: r8a77960-salvator-x: Enable GPU support
Date: Mon, 27 Oct 2025 22:12:18 +0100
Message-ID: <20251027211249.95826-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251027211249.95826-1-marek.vasut+renesas@mailbox.org>
References: <20251027211249.95826-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: b8767696b4374a78141
X-MBO-RS-META: w445uu5k6uas8arw9551891xcojxmg87
X-Rspamd-Queue-Id: 4cwR741SHZz9tV5

Enable GPU on Salvator-X with R-Car M3-W.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dts
index d5543f26c4720..0d5c754a7f0ec 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dts
@@ -35,3 +35,7 @@ &du {
 	clock-names = "du.0", "du.1", "du.2",
 		      "dclkin.0", "dclkin.1", "dclkin.2";
 };
+
+&gpu {
+	status = "okay";
+};
-- 
2.51.0


