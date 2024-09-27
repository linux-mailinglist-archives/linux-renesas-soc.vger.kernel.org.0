Return-Path: <linux-renesas-soc+bounces-9106-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6469881E6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2024 11:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B92231F22016
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2024 09:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C371BAEEE;
	Fri, 27 Sep 2024 09:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ctimDkDN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4997B1BAEE0
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Sep 2024 09:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727430872; cv=none; b=GYgX8leG69MDx8tNK5ju1O4UR69UMhstEFzNbAolZfFS1hQadkYCO+DaJdzkxGn9aLxYiH4B4AXbii86WXJ4Hmk6ktc15RWIEVCt5hIw5lvKQJP4ng0dYWyNwB2MCArl1H5wg+X/bOYr/TBNy/NLAJMcEfElhLiP2YxPC9L7dhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727430872; c=relaxed/simple;
	bh=BfIwNy2nO+QyrcceEnDkfXw5kYolB3wgrjny6J6f0SQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nVCg6S7jORRseiXdFJKZw2hWsgAF17rFh1s3SOq2iXvkmciNOf+MGgWsOC1gj+tK+yDril+QfqnWutgB1CSbzQr9Nykkpd4AadWzQyy6hYXjOKWxm+ZoB5eaaMTh/YRGMIOFUHaL06/VqhJflAEUA/7Qm9EIbJtTEpIj9xPE0Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ctimDkDN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=EtLvzamo6E6eKdIsT9PGSoabCo+DDYQ/L07zam+azyw=; b=ctimDk
	DNtxLpkQB11b4yWbUwklZmMDYDt/6emZfsVqjPdlu8nGSnwxlh64UJ+VuA1lqZQc
	kdfeRWwfuh2fO83GFbSKN8DZBX03XqiAjCTWywSsUqaZAxFqxmzlrgyQ351C/itf
	lKmG0gYXf+cMdpauFe64xZF3OJKa3wHGJ55YQsl8191fYVQiIh5T6i9jvlskH/JC
	+MEoB1i+TsLLutSSmxZp5UreTgw6EcAQ0Jiqk0IEFMrzqL+Tg2ryWjDHsfKOPrx0
	IVRfiNcX8G7B/ErFPBzhIRXchfQb1OJqZ/9MkouRncbfgnudEEuCQUc8EDExSkgn
	N0vwdwmz16S73/7g==
Received: (qmail 1283466 invoked from network); 27 Sep 2024 11:54:28 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Sep 2024 11:54:28 +0200
X-UD-Smtp-Session: l3s3148p1@24s+1xYjpHFtKPLv
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 2/4] ARM: dts: renesas: genmai: use interrupts-extended for gpio-keys
Date: Fri, 27 Sep 2024 11:54:16 +0200
Message-ID: <20240927095414.10241-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240927095414.10241-6-wsa+renesas@sang-engineering.com>
References: <20240927095414.10241-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the more concise interrupts-extended property to fully describe the
interrupt.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/renesas/r7s72100-genmai.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
index d0b2b4ea1734..e3fb54616537 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
@@ -67,8 +67,7 @@ keyboard {
 
 		key-1 {
 			/* JP3 must be set to 1-2 (default) */
-			interrupt-parent = <&irqc>;
-			interrupts = <6 IRQ_TYPE_EDGE_BOTH>;
+			interrupts-extended = <&irqc 6 IRQ_TYPE_EDGE_BOTH>;
 			linux,code = <KEY_1>;
 			label = "SW6,SW7";
 			wakeup-source;
-- 
2.45.2


