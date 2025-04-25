Return-Path: <linux-renesas-soc+bounces-16370-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 222D7A9C48F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Apr 2025 12:01:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CDA8174961
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Apr 2025 10:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E739D13DDAA;
	Fri, 25 Apr 2025 10:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="IzxmH9Au"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545D7218821
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Apr 2025 10:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745575305; cv=none; b=kgSVMgpgoqXB4lV7cmmEdBPfx6oohpdJl9BGYQ6GwxqOzeU2WKLtdfwsIqh97mCsQeU0IlcxbOWdIJzOtdKcSioEC5tE+PcLlpE/2kLg8cReeOp7aVs2XKIRfEX6O6Rph24Kg9Rz1iIoP4nxvlBIwVfFqF7UP5/q8CRLJJr/cB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745575305; c=relaxed/simple;
	bh=rBxjjZDFRB1k9fVQhnLf0fxIn25eGdrOK5bUKnfM880=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=suyUr5HiJOU9mEA7dktcigg3phOpI/eVujm+koG+QP89Lky7DrAqBQHnRbmNghslyIvijCuacqpnAURs1ljXEluXTBAXOv/Mf0IjXfp4Yc65awzwJGhVGpuupseCwa2QqhcXRk4wSiEjqlT0y2qFKKklewVwn4EnvlEbmikUFpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=IzxmH9Au; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=j0uHG+1f0cfwsqZj9p77DS/J5tXVPoKo2mxdgRWgc2E=; b=IzxmH9
	Au9UEb/9zhYmgvDf8Q1g/PjayMGaVaQ75bFyqL5tqTBoRSVfIGI3mXFDIlc90w0R
	5gUJnfMwNoCzrqcKSh15dOcx1LNZ4nQ4833PF1E8e1Cegc3l5/QVR5UwKLGGNmyG
	hqG69MwSlJfZjKf1r71jbdQwVMpo4eGLpqloG/9EwmnTDCgxLe4mNZCzDl2JQVDP
	ftT98XPxy61qOQlXmLqug1+SPMzfA/bDmeqMp54a9nHuLbn9t6vVp9rELixbBqka
	En8lOzEsY5zUAl2JxxhNXuFknKZdR7S6hvaoqA+53YSigp+NgwyYtIi088rATXL/
	759aun3Xx6aTlYWw==
Received: (qmail 3778933 invoked from network); 25 Apr 2025 12:01:40 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Apr 2025 12:01:40 +0200
X-UD-Smtp-Session: l3s3148p1@taqta5czWOMgAwDPXx6JAAunYj8Nf7DC
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] ARM: dts: renesas: r9a06g032-rzn1d400-db: enable USB device port
Date: Fri, 25 Apr 2025 12:01:31 +0200
Message-ID: <20250425100129.11942-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250425100129.11942-4-wsa+renesas@sang-engineering.com>
References: <20250425100129.11942-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Can be used via the microUSB connector CN9.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

The 'g_serial' gadget could be detected on the host.

 arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
index 322e4c95ad3d..328cb35547d7 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
@@ -282,6 +282,10 @@ &uart0 {
 	status = "okay";
 };
 
+&udc {
+	status = "okay";
+};
+
 &wdt0 {
 	timeout-sec = <60>;
 	status = "okay";
-- 
2.47.2


