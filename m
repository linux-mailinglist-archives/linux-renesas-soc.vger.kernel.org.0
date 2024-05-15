Return-Path: <linux-renesas-soc+bounces-5369-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0478C638E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2024 11:19:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44553283386
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2024 09:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF19B57C94;
	Wed, 15 May 2024 09:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XWtoHPNG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6C056458
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 May 2024 09:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715764781; cv=none; b=UmCfMrUFJpkvDgSKAoYeyE1tcxQyG+edByD95dV5ktSOwtgxvbucxwyNTh0+noeGcUVocAh+J+B7t/vedYWAzx7OglAcqeAJmnDCN8TAuQaWtuBksSeRLIKNK24NocjGCeqGU9PPT9aEUt1Yb2ljMEma8CF4lgv10tTvdaAMz4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715764781; c=relaxed/simple;
	bh=uX8BUzmK5U3cwljazqcPFn6RkNaxnnh9XxgKvcc6bYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JFifR1QksRehZI8NR/NLkwbXekX829MmtyloKj0t+rIEKvHbox65ZrNcP+SqL7dUogyUyMIrl8S11UhqRwKPf0adTtfdGP7L1G0WPFw+Rq1zw2wb6pjv7fMLa0i6+5CLrryFpJ1AoPrK9pkQRKb1otiuvr34Z6L0zcQL65n/OUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XWtoHPNG; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=o6nLSpjPhkFpWl
	lNtTkezbyP18elJVZ7cSCVBUWvsW8=; b=XWtoHPNG95uGkQjfATj9qZZy5dowEQ
	OO8nDkcJYq+fREH/Qjq6NQgB+kDZC7wh7PZUd4diVL0hCQB6zcJpUQvI0CB86z3y
	OamqN5PnQOlkGv/AiZWeJqJjZAw8QTTpl7w9NaZvBwzJap6DqDptXNIoyLAz98cr
	2X4YPDg4Lix6oe52Di0kAh3uMhLTn2c4Gn6wo2FsW0D4ez6rMKhvP4hssvvzaQ2B
	qaUZfVWeeSk+ktdaJeQm7nJSgrmYCGv82hSEJ6whgfLgIXCTBviSsuvmhxVE/w6q
	vsO2w65iu683rhQtE5s3RH61jm/wXimZGZaupyvrpTO1p2O/fvu+iH3g==
Received: (qmail 2774208 invoked from network); 15 May 2024 11:19:37 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 May 2024 11:19:37 +0200
X-UD-Smtp-Session: l3s3148p1@8JYMnnoYIOlehhtP
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: gray-hawk-single: add aliases for I2C busses
Date: Wed, 15 May 2024 11:18:51 +0200
Message-ID: <20240515091925.24353-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

They are numbered like this in the schematics, so keep the names in
Linux the same.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

 arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
index cfbe8c8680cd..2b9a19bb1c5d 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
@@ -17,6 +17,10 @@ / {
 	compatible = "renesas,gray-hawk-single", "renesas,r8a779h0";
 
 	aliases {
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
 		serial0 = &hscif0;
 		serial1 = &hscif2;
 		ethernet0 = &avb0;
-- 
2.43.0


