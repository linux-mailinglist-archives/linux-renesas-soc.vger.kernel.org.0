Return-Path: <linux-renesas-soc+bounces-9350-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0F298F0FE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 16:04:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2652C2826DE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 14:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DBB619E827;
	Thu,  3 Oct 2024 14:04:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C7519CC2A
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Oct 2024 14:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727964284; cv=none; b=sc08iDUmAish2XqSePhooXF6hoPdlF0DDA3GUt+oRSUDHi61p4N51PX9Wa4JuiaKPfTbUJOai6drNt8Q1U1u49UKvEavant9z7dPaVOxugtcq2YFXNX039MLQW2cM7OU/WblPADRcS5DKTuKjC4n4nyprrP+gqXadgZrqKkdXg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727964284; c=relaxed/simple;
	bh=47fe7Fwb0yXTDKoNl2wd/u4e8OnEK9iPFbqci4doMh0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fsm6SUpNB2bvDuDGR43lI5jhBe+sXOy1eP7RlftbIxhVUB/fthmCVO/XVg34bFl6UTrxXZmn1dSVTr0m1wjZQwGe/hhC7kdQKxYUBVIOyClJk65EPjskBP1PvHtGVXyloWVH2JLwndJM4xDxQk1SlFsIUhAVX7YK9rKwyw0dmy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:d4db:7463:4f08:3c82])
	by albert.telenet-ops.be with cmsmtp
	id Kq4d2D00J5K8SYz06q4d4G; Thu, 03 Oct 2024 16:04:39 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swMRR-001CGk-74;
	Thu, 03 Oct 2024 16:04:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swMRZ-006e9w-F1;
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
Subject: [PATCH v3 resend 5/7] arm64: dts: renesas: r8a779f4: Add UFS tuning parameters in E-FUSE
Date: Thu,  3 Oct 2024 16:04:29 +0200
Message-Id: <dd37f7a914509bf1c731dc6ffb457bb0e02ff694.1727963347.git.geert+renesas@glider.be>
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

Describe the location in the E-FUSE block of the PLL and AFE tuning
parameters for the Universal Flash Storage controller.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - New.

After adding:

    &ufs {
	    nvmem-cells = <&ufs_tune>;
	    nvmem-cell-names = "calibration";
    };

The calibration data can be retrieved using the following sample code:

    #include <linux/nvmem-consumer.h>

    static int nvmem_dump_cell(struct platform_device *pdev, const char *name)
    {
	    struct device *dev = &pdev->dev;
	    struct nvmem_cell *cell;
	    int res = 0;
	    void *data;
	    size_t len;

	    cell = nvmem_cell_get(dev, name);
	    if (IS_ERR(cell))
		    return dev_err_probe(dev, PTR_ERR(cell),
					 "Failed to get cell %s\n", name);

	    data = nvmem_cell_read(cell, &len);
	    if (IS_ERR(data)) {
		    res = dev_err_probe(dev, PTR_ERR(data),
					"Failed to read cell %s\n", name);
		    goto put;
	    }

	    pr_info("Cell %s contains %zu bytes of data\n", name, len);
	    print_hex_dump(KERN_INFO, "| ", DUMP_PREFIX_NONE, 32, 1, data, len, 0);

	    kfree(data);
    put:
	    nvmem_cell_put(cell);
	    return res;
    }

Calling nvmem_dump_cell(pdev, "calibration") from ufs_renesas_probe() on
the R-Car S4 Starter Kit development board gives:

    Cell calibration contains 8 bytes of data
    | 23 51 23 51 52 98 52 98
---
 arch/arm64/boot/dts/renesas/r8a779f4.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f4.dtsi b/arch/arm64/boot/dts/renesas/r8a779f4.dtsi
index ebed41892df3346c..dfa3c015e04b740c 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f4.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f4.dtsi
@@ -10,3 +10,15 @@
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
-- 
2.34.1


