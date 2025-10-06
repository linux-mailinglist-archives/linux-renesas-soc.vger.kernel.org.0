Return-Path: <linux-renesas-soc+bounces-22689-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABF6BBD58A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 10:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A6621894AB6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 08:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69FBE261595;
	Mon,  6 Oct 2025 08:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DL6u660v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B8D25F995
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Oct 2025 08:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759739353; cv=none; b=N/opwHocT4+I/qSPYODeeXjRYZnhGqTT2czYFW4bmgV7JlTLWAqweyGxD3NVcBo9LM/e06Odqx3df8SRD2/uLEGEgaAugYFIOpyzOg2P7lYj94zooWD2f7GY6G5RkW55KkK8zMTEGNbnSuYK6z6fW8Gu8FYf2Sk9Nr/TA5TywSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759739353; c=relaxed/simple;
	bh=uMxDPfmhFu9c/Vzs4BdXYisoHbh3leAaUC2QHZAwoh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oNoQlN9GfXAPoTuovA4Ott+cuQQAAj7BDh52cTZoqR0h9zfdMijXZCwyTLLNZCns0qaVdZwULvVgCfvgkvlW0Q3dml0YvidKiv5qQtlOxcq/mK/I+o7DxsMQhDPhDcwvcw9XhLwKAI8DK+vTqkjlEn+vi94Tz9U0bvGQnI85FTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DL6u660v; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=x39VBSHFccwrhbfyjsPp7h90lsVDCyxui9hUPD390MI=; b=DL6u66
	0voyWlDJZzyXhQqVeBoXSjYSmNMJ52b6Rr+uAUniBR43WnASHTB7nWF9o8opNRF9
	rLdobOKeRSA63NWKsI8x/jmVmhBhTU6Yx1qOHTr3VVxAd9qaCw9qoAg87Ee7VT4t
	6+YxtqV4Dc7+eYt8zFtmH4HK3K0zMYl3o8z0UFKTTcXz2h5j63Imd/rWSIVqY53b
	lEwhjCD7L4OejU7xML78OTJ4LKYQ8QAza11pJeR4jeL1An26WsNBiFvVfiFV4Zwn
	SbDyNko6rMwgdN1pqvpv53dkttynqgz4tDvb/owDBhDL4GZY75E0yEo7awtjGY61
	+KlnU6/BTR7UIA8Q==
Received: (qmail 1689949 invoked from network); 6 Oct 2025 10:29:08 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Oct 2025 10:29:08 +0200
X-UD-Smtp-Session: l3s3148p1@cC29PnlAlOwgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 7/9] arm64: dts: renesas: v4h: mark SWDT as reserved
Date: Mon,  6 Oct 2025 10:25:25 +0200
Message-ID: <20251006082520.10570-18-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251006082520.10570-11-wsa+renesas@sang-engineering.com>
References: <20251006082520.10570-11-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This watchdog can't be used with Linux because the firmware needs it on
V4H boards. Sadly, it doesn't mark the node as reserved, so this is
added manually here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi | 5 +++++
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts    | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
index 15554aa64c5d..86f09b9a0488 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
@@ -17,3 +17,8 @@ &rwdt {
 	timeout-sec = <60>;
 	status = "okay";
 };
+
+/* Firmware should reserve it but sadly doesn't */
+&swdt {
+	status = "reserved";
+};
diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
index 1da8e476b219..161c083241f9 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -942,3 +942,8 @@ &sensor_thermal_cr52 {
 &sensor_thermal_ddr1 {
 	critical-action = "shutdown";
 };
+
+/* Firmware should reserve it but sadly doesn't */
+&swdt {
+	status = "reserved";
+};
-- 
2.47.2


