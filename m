Return-Path: <linux-renesas-soc+bounces-21405-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5EAB447EC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 23:02:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2136189C1A4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 21:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B621F28CF6F;
	Thu,  4 Sep 2025 21:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="wxM4t4yZ";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hvqe7JLo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A15277CBD;
	Thu,  4 Sep 2025 21:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757019729; cv=none; b=bbjnbl+4bj5xKwko6SQ5WkcTUFxodAeVlaJfYv1c7/DrrjgLwvF2cM9f/YQUV8MZP92coxTXeujOsP+QkLWeJFp6c4B8pRqNy9bmSNil8+3P60pb2gwW3PWebpsHEiX46zqnwE5OlKdzjBeFojEwIY7OHMwElGoYQuEEFO8Ih7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757019729; c=relaxed/simple;
	bh=nJbIOGW2W/4v+U2KvHGxYgMPOku9sh8Dt0dgQSmSz+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aTs1WxwdWuXq0lcRWnw/3o2iT7VFBBGs3SAOGMPYMBUT52Sr4oTLsu3DOoaOR83h9kE11m9ds2mEhD0HwlFxiQbD2gLvkIXpSln1xagHx7B9ltO33L2VAfta9dgAW0cTDmBpRfuQH1YsdgSvWHKJUSYl1Ig0DSCeoqkt4OLqq5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wxM4t4yZ; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hvqe7JLo; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cHsNt0TRBz9tcW;
	Thu,  4 Sep 2025 23:02:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757019726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CHrNoKF6adHTCgOdhIUSq0vItHRfXFbXQ1V0ojo3MRI=;
	b=wxM4t4yZ71yeY2nzfFK47vivk78F5o4A6U1KZks4koYtzJQocLQkD98K/e0053iwc6I9d4
	29/jGL6JcMTHLMRk/CoQlz87JqznExOsLAans6ZWrDLUqmNYARd67Zi8Jn/Hp7r4jI3ocr
	H5bCUPbIGabeMonbVJepuMf1RUXjuaAOtMk4r7cOGBbgegMkgdbTD6uFE+r3bygGt1Q8nv
	mHz9jv5LfZbBN0KRHavgvxGt9CpJKMdHtzdCvhIkOrE1fZLvGoFB74ytU6IRKEP/4YreBa
	iho6MstSNvIBYJ1iBC35a/c7HRdw/a2HshOQDlVmnshinr5/WCPJ/Vs5pQkDdQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=hvqe7JLo;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757019724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CHrNoKF6adHTCgOdhIUSq0vItHRfXFbXQ1V0ojo3MRI=;
	b=hvqe7JLoxVCa26H2FOF/yhkWr1vMxu0VZ9pQdH2bUecc1KBPBKrm5NfJakr4wu87NmF08l
	X4+S6NZmq71iAHN9IHs8/C0FhL/NLGsbj8nmOvp8+7b7crzRu7yn/t0BeXbXDCUOtXpiu1
	6RhO70qTBGxHJCLXn/TJlriw/03nxwn77Uq7X6bU4PkCtimEoubUOkdJeoME7yF9hXtWjZ
	wh79y/1peC4bx0v60jjJK2tQRJ3bVqNajvMKu8HK6zPY7lVEIRC4EA17GRwi3RrQs5L6fo
	M8KYjoGnBKhGz6VdSXriWbVoltJUOOYE3CDp3aZYEaf4ZX6ElZl7aqO5reoMBQ==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/4] arm64: dts: renesas: r8a779a0: Rename dsi-encoder@ to dsi@
Date: Thu,  4 Sep 2025 23:01:18 +0200
Message-ID: <20250904210147.186728-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 6i7xs58sx7m9dgr6msrsgf76ftf3ha59
X-MBO-RS-ID: 57a2b226075f6f7ec85
X-Rspamd-Queue-Id: 4cHsNt0TRBz9tcW

Rename dsi-encoder@ node to dsi@ node to follow node name pattern
in Documentation/devicetree/bindings/display/dsi-controller.yaml .
No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: No change
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 95ff693399919..2c3fb34abb28e 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -2949,7 +2949,7 @@ isp3vin31: endpoint {
 			};
 		};
 
-		dsi0: dsi-encoder@fed80000 {
+		dsi0: dsi@fed80000 {
 			compatible = "renesas,r8a779a0-dsi-csi2-tx";
 			reg = <0 0xfed80000 0 0x10000>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
@@ -2977,7 +2977,7 @@ port@1 {
 			};
 		};
 
-		dsi1: dsi-encoder@fed90000 {
+		dsi1: dsi@fed90000 {
 			compatible = "renesas,r8a779a0-dsi-csi2-tx";
 			reg = <0 0xfed90000 0 0x10000>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
-- 
2.50.1


