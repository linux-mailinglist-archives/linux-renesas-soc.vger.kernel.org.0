Return-Path: <linux-renesas-soc+bounces-9005-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7B297DCF6
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Sep 2024 13:48:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D0E91C20C18
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Sep 2024 11:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B145516F282;
	Sat, 21 Sep 2024 11:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DAMaGG6g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2061142E86
	for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Sep 2024 11:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726919322; cv=none; b=sGLAr+QAVxPsiINq+IBbZwDURoyOoDa6gqgxrzNzxOha8ouPELgrjNlMK52hvXTX1BudfcDpilREwDCPHKX84oA7c6JGQ/sNFJzcPdd9VMph0cVfSlyrsnW7qG70Z9pqmtym23k0oiOVdnixYHK+/L0AR8XWF/ibxWjHQG+gv1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726919322; c=relaxed/simple;
	bh=ZKF6GZdrKjJEkQLXS1jNMiP8WsyaciPv/gNPDGSaiGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z6mm8r7ViUkUgE2Nit3kJXOfJQA3AG/Ycd6VTNFPMcH+wGGTek3motfZe/XuOkIdSh9HFgqO4IRf2nv/xjAz2C+Lr5374AsmvTqObl94TBDEoSQxq+FQJmxq3MAvS9cwkzAeYXEzhYts9jCIBLZfjkBfwugAZd8WNKW7kj374GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DAMaGG6g; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=tnfdwWPQ4oVF7+DpN/t6fQbAt+FexciXlBD+vZPPLCk=; b=DAMaGG
	6g7KJNIHd1vxLGhO1QDdCinVBg+nijH9qymjZ6mOKpmnT55KCo7puYW4ba+Yn1M4
	jCyWhZkjXn/qAK/23GlUzKZrIEdlfYGLZNpiR7sHXM4jAEMbMe3olbU5rk+P1hbJ
	qFPFq4ts7SpMTVdHydqqlG4nzJqyK6ccydE9ZQlCrLozuhujEc63iAzoppFN7J+M
	NmyyAMfwwp8s5XKnriOxlzzqHjFUJ2kgUcZyisCLLq3eQQO0o+h+BD5VswBxYrUN
	6oJGPkz2RfLWPwre9ASvok1IGysM9dXJ/psZZUxLLr8Mho7qhCuGTqcO4O7ZueJ7
	bvZ4XEcAk/gW135w==
Received: (qmail 3652718 invoked from network); 21 Sep 2024 13:48:36 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Sep 2024 13:48:36 +0200
X-UD-Smtp-Session: l3s3148p1@cM1lvJ8ifuEgAwDwn0Nz2qARpwvTE8dN
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/5] ARM: dts: renesas: genmai: enable watchdog
Date: Sat, 21 Sep 2024 13:48:13 +0200
Message-ID: <20240921114813.4124-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240921114813.4124-7-wsa+renesas@sang-engineering.com>
References: <20240921114813.4124-7-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Driver has been submitted meanwhile. Activate the device.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/renesas/r7s72100-genmai.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
index 28e703e0f152..226bcff180bb 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
@@ -228,3 +228,8 @@ codec: codec@0 {
 		spi-max-frequency = <5000000>;
 	};
 };
+
+&wdt {
+	timeout-sec = <60>;
+	status = "okay";
+};
-- 
2.45.2


