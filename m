Return-Path: <linux-renesas-soc+bounces-22901-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F54BCFCE2
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Oct 2025 23:24:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6525C4E1300
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Oct 2025 21:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB59B23E33D;
	Sat, 11 Oct 2025 21:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="A1sueLFH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F207D6BB5B
	for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Oct 2025 21:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760217845; cv=none; b=rXcLhCSaybAYwSmDBQDp3aK9Qn5RQFxcTwVRlHZAa2rVRolJr+aWyoeO7PR/UMJosuOcDSbcbXGv2E0zJxVa8N3eWJgQSd1kPCFw2EzwEgi0lcZU8tz29b9oGKXi1RM9O1jqFLJLEBEUuqaLqt9qdH8iMPnY84urCm9Iun661vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760217845; c=relaxed/simple;
	bh=iVLUfaBdRxe6BtYySc0Vi+hSvDLbp71t0vV+DHbm14Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hbK6CxCMu3539soN8KhO3g6Cs+t4TvrMd9kzX7N8zE0/JFE2cDY8xyWpX9TSipGXKN3TUL5FGu58KUdk9bUwNQRRc2C4qaVYyzr6WwYj2lqX8hEJCfeekQu2vIoRJgIVa5UKDD6E/122jXuMCLAyBKZPFhooTFrXjLCpoDFaObw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=A1sueLFH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=GsE2heXY50Yjd1
	5nri88gwUGP5IkW19TD/huxovLP2M=; b=A1sueLFHOOIFMDWzUfKPuQ6yvm2/PW
	yVEjWW5Di/+oiJQosYvJxIZxPZhhfRDveOBt67pibm4pxrX4oPI9XjT3ggVr7Lhu
	yh6ozrdMm9yUe4oknR2JnbHSUgtRrbZFBSgx7XkuCU+Ycxd/dH1oCOIYWJOd/pMi
	sfi+vfcNgcndxcsRz5zUOturepg1FSWOxEvtE6tGWu4toq69Dzl0nkVKs+1sDVzu
	XKMkJi8/vD8aNEFP5t7A4AdZMzJy5IBr09hylVpm/4pnvEZSDoypHu3u7vce9AxH
	0Pvz+78egbxXvcfAB2o6ZlqB0/KvT9O17UhSqkLhXGGmpjzpJIPiVupw==
Received: (qmail 1930986 invoked from network); 11 Oct 2025 23:24:02 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Oct 2025 23:24:02 +0200
X-UD-Smtp-Session: l3s3148p1@YAoup+hAOLEujntw
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2] ARM: dts: renesas: kzm9g: name interrupts for accelerometer
Date: Sat, 11 Oct 2025 23:06:06 +0200
Message-ID: <20251011212358.3347-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Name the interrupts to make them descriptive.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v1 RFC:
* reworded commit message
* added tag from Geert, thanks!

I'd think we can apply this before my binding update patch goes in.
Because this DT already causes a warning before the update (2 interrupts
not supported). And it will cause a wanring after the binding update
(interrupt-names are required). Or?

 arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts b/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
index 1ce07d0878dc..0a9cd61bcb5f 100644
--- a/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
+++ b/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
@@ -209,6 +209,7 @@ accelerometer@1d {
 		reg = <0x1d>;
 		interrupts-extended = <&irqpin3 2 IRQ_TYPE_LEVEL_HIGH>,
 				      <&irqpin3 3 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "INT1", "INT2";
 	};
 
 	rtc@32 {
-- 
2.47.2


