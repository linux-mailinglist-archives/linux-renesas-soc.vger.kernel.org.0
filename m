Return-Path: <linux-renesas-soc+bounces-9353-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F279C98F10A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 16:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB127282603
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 14:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC96C1A071C;
	Thu,  3 Oct 2024 14:04:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB3719D065
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Oct 2024 14:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727964285; cv=none; b=dqJkQ2B60PepCrXaXLRHxT9dmsfeZWVRpLSnM1K3ilWEjrfIEJv2KCk1eiLtvoSQgqCnBvdRDDKbfPq/ssQFazXSu0T9vxgQQ/NOsrdsW7of36YYL5yjOQzPEXAnqPkvA5CX4GLst8sstIcEnDXT7wMuS7pfbNcHnHiGxJlM9TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727964285; c=relaxed/simple;
	bh=kyfZbCjQZdw/uIQAn4keSGzXfbV7LKhfTIJNIxZC7lc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TD4dR6fMsP4JmVAtP1bAQny2Wu54WOysdk/9amQw5ipBxn9gWuj+fbMeD2xTrQgzIWFXNCtMQ1pOVtUC8gKswcT0hkLg2yuz90Ks4EYwil6U31PVZep4pHI2hVkJv9wfy0h62CKW26OMJK+dGxv6bfREg19asUi/awGorgUrYsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:d4db:7463:4f08:3c82])
	by xavier.telenet-ops.be with cmsmtp
	id Kq4d2D00B5K8SYz01q4dMz; Thu, 03 Oct 2024 16:04:39 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swMRR-001CGo-7s;
	Thu, 03 Oct 2024 16:04:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swMRZ-006eA2-Gi;
	Thu, 03 Oct 2024 16:04:37 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 resend 6/7] arm64: dts: renesas: r8a779g0: Add OTP_MEM node
Date: Thu,  3 Oct 2024 16:04:30 +0200
Message-Id: <5a8d065dd782d3ede07928f5ad44b84396f9c71d.1727963347.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727963347.git.geert+renesas@glider.be>
References: <cover.1727963347.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a device node for the OTP non-volatile memory on the R-Car V4H
(R8A779G0) SoC, which provides E-FUSE services.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v3:
  - No changes,

v2:
  - Add Reviewed-by.
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 12900ebd098b0b78..61c6b8022ffdc3b2 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -477,6 +477,11 @@ tsc: thermal@e6198000 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		otp: otp@e61be000 {
+			compatible = "renesas,r8a779g0-otp";
+			reg = <0 0xe61be000 0 0x1000>, <0 0xe61bf000 0 0x1000>;
+		};
+
 		intc_ex: interrupt-controller@e61c0000 {
 			compatible = "renesas,intc-ex-r8a779g0", "renesas,irqc";
 			#interrupt-cells = <2>;
-- 
2.34.1


