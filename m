Return-Path: <linux-renesas-soc+bounces-21384-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BB8B44735
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 22:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D838C1670C6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 20:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBE2D27F732;
	Thu,  4 Sep 2025 20:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xAUjsIeU";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="jgdvIUnp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B2627F183;
	Thu,  4 Sep 2025 20:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757017342; cv=none; b=A9hgZw4vrBjujnMJp1GAcyEL51V3gv4ntDD1VnYQAN29yWplts2cEH1pxJsgMWTcRFzjM370Ge+JJ6vOD4vzIZRkfSjCfl3yGTxXUUWGGlSIPW7RdiRxWIVocrOTdMdz8oWEq8DQvfuMfHC/OROgEIphWWYGgxRf38NSAFxVeRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757017342; c=relaxed/simple;
	bh=YYd9EveJmWZugVhHYAxv930ixRGX7PW6Nptkl0CmPb8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oOyLE3ieDm4f0Bjqqt1d28HneQFVRhD9HqIcLn1AIQxJYW7WT9OLtWgv+ce6iMU2k+FZ+RwHc0WUB0EVqmm/Of5DfpV5iUUYzZxZP7fEkHz3yzTlKtQdi/tBGnf2tznyoRyvnmTB330SkKx4LdDqtNQIaQbmEtCUVG75jvMgWOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xAUjsIeU; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=jgdvIUnp; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cHrVy5h3rz9sWs;
	Thu,  4 Sep 2025 22:22:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757017338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZTwgX/gMwuaUkBIWkmy7CR7sQcbuj4bE7qmgYr+YxaA=;
	b=xAUjsIeU5rEoaSAmJGfdP2MuPDObgQaDfqk3kC4uZ6GHSUZtkG5B488xhZbSKyXS5HCYf0
	pSlmiggXA6y2BRV+X1T0LhUYaCPJoeQh4rTCjkiaiRahn/WkIF/bhCdXn1zqWTJ4eBjNrP
	5snWmWb3wpihHBJavtZd+NuZdIPcM9kiPugb2HSCs+QaF4G7Upw3oQm0V1AoZX7c/fwvRD
	+NZ3DWjyinrwKs1cxjcK2ZgMHkwLb+ccOj/QmoIOYJAYflfO4Y17Kcb2MXGNG8+BfZDwly
	McNTcnJii0nvbK5f/QXCvctsDhRLuvo3VMD/Sk1UUWQlSb39Squ9LKnLuVPMYQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=jgdvIUnp;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757017336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZTwgX/gMwuaUkBIWkmy7CR7sQcbuj4bE7qmgYr+YxaA=;
	b=jgdvIUnpsaQu/vMSrjhLuxwMJp5GMuQFt/8D3nwnMDssVkmN9auxc4xYhmqtEx8oATSbyQ
	HV4oYHz6PVaC9gd4oJTraTzFHuX7dQMKyK2oJ8JS9Xjy6H9PmIqoBVur8N4E4Y0RNJ5CET
	5PbvacWPVBrqRjsvoh2ZNtGEMGQvChwI4Oidd1nyHMJrqtg8Wf1KcGmfXeSTjMn7DlyOeu
	0jq6MZnaI2Klq5nFXBhBFwSuQOBkGEUpvvw91eYu1iIZExtdmG3dfhCKgoLfH4lph21Mfq
	yYyVBAzqecjH91yO2LQbHmHnrpkDQ0P0HsDPbAihY1EupPb8bkaxuteuoHgmSA==
To: linux-hwmon@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Akinobu Mita <akinobu.mita@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [RESEND PATCH 1/2] dt-bindings: hwmon: pwm-fan: Document after shutdown fan settings
Date: Thu,  4 Sep 2025 22:21:09 +0200
Message-ID: <20250904202157.170600-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 2cae9d1e481855b318a
X-MBO-RS-META: d41kroq1zuxwuu6rysj7jraw85nk1b4f
X-Rspamd-Queue-Id: 4cHrVy5h3rz9sWs

Document fan-shutdown-percent property, used to describe fan RPM in percent
set during shutdown. This is used to keep the fan running at fixed RPM after
the kernel shut down, which is useful on hardware that does keep heating
itself even after the kernel did shut down, for example from some sort of
management core.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 Documentation/devicetree/bindings/hwmon/pwm-fan.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
index 8b4ed5ee962fb..a84cc3a4cfdca 100644
--- a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
@@ -31,6 +31,15 @@ properties:
       it must be self resetting edge interrupts.
     maxItems: 1
 
+  fan-shutdown-percent:
+    description:
+      Fan RPM in percent set during shutdown. This is used to keep the fan
+      running at fixed RPM after the kernel shut down, which is useful on
+      hardware that does keep heating itself even after the kernel did shut
+      down, for example from some sort of management core.
+    minimum: 0
+    maximum: 100
+
   fan-stop-to-start-percent:
     description:
       Minimum fan RPM in percent to start when stopped.
-- 
2.50.1


