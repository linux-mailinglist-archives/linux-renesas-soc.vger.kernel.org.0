Return-Path: <linux-renesas-soc+bounces-19591-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D93B0B810
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Jul 2025 21:48:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9948A3B9EF8
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Jul 2025 19:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E811D88D7;
	Sun, 20 Jul 2025 19:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="YBcYJKot";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="DF02umNP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586AA18EFD1;
	Sun, 20 Jul 2025 19:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753040901; cv=none; b=jMHuhkjBnel3WNwY0o7oZK0qK7TFxnbiu4yA2njUIioJMgouxAN+UhEWuCLKQyh33yVyna/K/cjfaQvuKOQupTU/wUXROL+OcGQmbw00crE00+FakZBXch4K5tcqN8IX9x6rVILarWjYD++kqyhHXlnb5nviE4DDhA0npCSkhcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753040901; c=relaxed/simple;
	bh=1utAwfN3FoW+z41/AXJFsLb5hAD2w7rjDAlXB0LMog4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K+FxBDpyAkERPbal1FjPUGPjUSb9vVFXybfm6dGcTLkEsWGi4tHBPH7Lk83x9y2BgAE3WMo8F+XyHAoZR86PEPZWLV53Ov9SoWHI6KeYiKdYMq/Z3t1mNQyJHV25/Z8saA+lelc6Ayv+ut9Z58vhEJnV8k1yUFMkhc4G1gXJ/2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=YBcYJKot; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=DF02umNP; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4blYwq3Jt0z9sQ0;
	Sun, 20 Jul 2025 21:48:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1753040891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T3lOadESAAHh4H6HI80AHcX9AqZoCllRYNj5xpAyhn0=;
	b=YBcYJKot6u3su4O3fSJb8OKwEuTQXWWrgCbvOcFYspuxNDF+0d/3N2oe+u7GfWq58kFg7w
	ZkH/wZWkOkWj2SyJopDE05GM0zlRZyHitH/ZSPO8KveyctPNaw+MPDRiS2DPfQlO7tg4bw
	rA2wCjZu7KCKgxZBQFNiC5mo/mRVteSkNP84hzfBm1rM646j9ArGCgjICIUTNzP1KqlqRJ
	kiswQCTt+v+byfKvuknma8Mlr9zED7t+aS6Q7ngB4NwZS0RH5x2LDyGmNAkkFRZjJ4avFf
	+G6FOh3I6jwqCH3K6yrlDH2UO7xgvPOiZPt9jjYCW2z9EGy5Lraxg7FKxcXFgA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=DF02umNP;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1753040889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T3lOadESAAHh4H6HI80AHcX9AqZoCllRYNj5xpAyhn0=;
	b=DF02umNPEg9sXSEzfmvPby4B0GTYlEHNPYYaqK1vACGp9wpEzrnmQXHFaAy8sR2AGlvJIU
	vJovo0VHCfQboOY8aZxo0x+SDoS76Mw6zyylE7gkETVz8dqd8OCqaJzZ9owV+l8LxrObGK
	kAqArU27PX7s3O11rLSWXhDHGoHG4HU0NWa23JQeniyj375rG0MdbOVPxEp0DR2969JXv+
	AVKQCVOuCbfa4mhNkmUwCZHlSU0RPRO3ZTJ1qC8owr7vhQWvhjrEaMRIYZja3g68mllCAb
	HC11wvOK2bo5t7AwnEUebzhxp+mWQ8UEiqXec5Z8Ion1tEMCF4FW8swenbaxMw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: r8a779g3: Describe generic SPI NOR support on Retronix R-Car V4H Sparrow Hawk board
Date: Sun, 20 Jul 2025 21:47:35 +0200
Message-ID: <20250720194756.413341-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 17fbfd472437da73ad1
X-MBO-RS-META: 1ydpdb5fm69ntrknicfhkpw98gwodaqz
X-Rspamd-Queue-Id: 4blYwq3Jt0z9sQ0

Retronix R-Car V4H Sparrow Hawk EVTA1 is populated with Spansion S25FS512S,
EVTB1 is populated with Winbond W77Q51NW. Describe the SPI NOR using generic
"spi-flash" compatible, because both flashes can be auto-detected based on
their built-in IDs.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
index 900807fbca8b..ebff536afdd3 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -767,7 +767,11 @@ &rpc {
 	status = "okay";
 
 	flash@0 {
-		compatible = "spansion,s25fs512s", "jedec,spi-nor";
+		/*
+		 * EVTA1 is populated with Spansion S25fS512S
+		 * EVTB1 is populated with Winbond W77Q51NW
+		 */
+		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <40000000>;
 		spi-rx-bus-width = <4>;
-- 
2.47.2


