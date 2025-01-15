Return-Path: <linux-renesas-soc+bounces-12155-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF259A11FF5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 11:40:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33ED6188466E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 10:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 823F2248BCE;
	Wed, 15 Jan 2025 10:39:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D180B248BCB;
	Wed, 15 Jan 2025 10:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736937587; cv=none; b=tF0erR6aUM87h173veaj3TlnW0JqSuvIlpgIWU5IBK3cdZZwyhqaHlFC6eQsklnfKjuPRyWV0RumnFg2O89+/mYnEkVMtri9cdnKZFJJWN1PbLph+KEoNNTaP07FTsQyfJ6P6lz//ccl+jTsdnDtXOhtyC8kNC1t3kMZ0MOPw5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736937587; c=relaxed/simple;
	bh=TXjc82M0M8WAL/yjXDCh3qK+ze0ZeLG61ujYxiOKuzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZMkuN6dM6aFAzN52poEiMv2Otr+iwKIrV83DbK7I1usZVsngs6tPF1AHS3bIrvoshD4r/ee9TpUV6eb+jtQjOfMijm6qiBYoh9b2GNCkAshllMkPWtVOpVoGMkglvOMIfch+M79C4Nc5vvG9fUyPL+3NK0ivi8V25o0SkIL0ohg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: SgIw5IGtRlq+WbWnRPv3Ww==
X-CSE-MsgGUID: ghVA2jI9RnqRVjQYLHt2Qw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 15 Jan 2025 19:39:32 +0900
Received: from localhost.localdomain (unknown [10.226.93.251])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 00E024230278;
	Wed, 15 Jan 2025 19:39:19 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 5/5] arm64: dts: renesas: r9a09g047e57-smarc: Enable watchdog
Date: Wed, 15 Jan 2025 10:38:54 +0000
Message-ID: <20250115103858.104709-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250115103858.104709-1-biju.das.jz@bp.renesas.com>
References: <20250115103858.104709-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable WDT1 watchdog on RZ/G3E SMARC EVK platform.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index c063d47e2952..33b036b6a93c 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -29,3 +29,7 @@ &scif0 {
 	pinctrl-0 = <&scif_pins>;
 	pinctrl-names = "default";
 };
+
+&wdt1 {
+	status = "okay";
+};
-- 
2.43.0


