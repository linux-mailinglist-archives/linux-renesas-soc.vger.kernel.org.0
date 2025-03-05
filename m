Return-Path: <linux-renesas-soc+bounces-14011-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A57C1A500B1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 14:35:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6CE9163019
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 13:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86A72244E8F;
	Wed,  5 Mar 2025 13:35:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277BB38DE1
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Mar 2025 13:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741181723; cv=none; b=fXWpaH/Gqwt03uPiShspb1dsdw7D8MpDHWK/NvL+IuwUX3ez4mq9BiE/wTyaz6ZmM9ZRos2RpvU/F86w80Rs9rl+YfZE7WgAfuZoP9QEMuYrkjuLWteLAGHss51JE6WgaVJ+KDLEiAp5xf/7tY/GfWHejMd61qiZrh1vv+5Y+eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741181723; c=relaxed/simple;
	bh=2Dm7IRfYo6Pwrw69wj3ER0O5BUKzlKXqOjgmyu30uBg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X0lwZsjgQSvtpu+b8GP6zlXxUUfWSrwwUP7QpZs8N2sgnzkcyjLZbquBNgt+ej3AM5QoriLSQC+n/4EpNKEt5+0wrTsBmVruVQSRaAJL3J3/MujL9AuK9xFWb9cFWIKuvuTYrhQmg05tGj6rId7IPBKUF7HsgHaQ637jlOKknH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4Z7D7r3zB6z4wycw
	for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Mar 2025 14:35:20 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:fba:8cad:3d23:9db3])
	by xavier.telenet-ops.be with cmsmtp
	id M1bK2E00J0exi8p011bKwq; Wed, 05 Mar 2025 14:35:20 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tpotm-0000000Cv4X-2vVH;
	Wed, 05 Mar 2025 14:35:19 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tpou7-00000008wpn-3M9j;
	Wed, 05 Mar 2025 14:35:19 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a779f4: Add UFS tuning parameters in E-FUSE
Date: Wed,  5 Mar 2025 14:35:13 +0100
Message-ID: <3e4fca228eb049d54a1ae520104558505dbdf803.1741179629.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the location in the E-FUSE block of the PLL and AFE tuning
parameters for the Universal Flash Storage controller.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Updated DT bindings and driver code are available in "[PATCH v3 0/7]
scsi: ufs: renesas: Add support for R-Car S4-8 ES1.2"
https://lore.kernel.org/cover.1741179611.git.geert+renesas@glider.be
---
 arch/arm64/boot/dts/renesas/r8a779f4.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f4.dtsi b/arch/arm64/boot/dts/renesas/r8a779f4.dtsi
index ebed41892df3346c..b216d605c321c2f3 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f4.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f4.dtsi
@@ -10,3 +10,20 @@
 / {
 	compatible = "renesas,r8a779f4", "renesas,r8a779f0";
 };
+
+&fuse {
+	nvmem-layout {
+		compatible = "fixed-layout";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		ufs_tune: calib@144 {
+			reg = <0x144 0x08>;
+		};
+	};
+};
+
+&ufs {
+	nvmem-cells = <&ufs_tune>;
+	nvmem-cell-names = "calibration";
+};
-- 
2.43.0


