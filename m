Return-Path: <linux-renesas-soc+bounces-7549-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 643DB93D443
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 15:38:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 946991C2329B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 13:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4BA317C23A;
	Fri, 26 Jul 2024 13:38:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D9117C225
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jul 2024 13:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722001105; cv=none; b=mH5/Nr296+Tbz6qL/ml2Dia0ZYXE7/OuvW2jHRz4hBAmo+O+y6IVGn+/7QzzlLqThO9WqoLRVis3in3GsSklGrjEDNVOLlaBpQ+7LQEDOJm+6iIRkLTkMf8AtZ35dH1gzNJy+LFI9hG5Dutkik0/kC1I5wZIy1Y5UYgp//I0fdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722001105; c=relaxed/simple;
	bh=47fe7Fwb0yXTDKoNl2wd/u4e8OnEK9iPFbqci4doMh0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YTHu4GUFUa87BPJH3V62iGZlL+SrFFX5d2X0BGyRjEQn+Z4OG37/1wwNdb8piA5eZbDN5oyseMHWJhe1x7zz9wlYcrpytUOSVcr2SuEyLWr2AP1Yzf5Faozo3kxxMKmThxJX4ZveCW56Q7KmMNamekGIFbIYETvPGhK4tVxyQ2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:3d94:87cf:603a:d7ae])
	by baptiste.telenet-ops.be with bizsmtp
	id sDeD2C00S1mGjv501DeDhZ; Fri, 26 Jul 2024 15:38:15 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sXL8p-003cMG-U4;
	Fri, 26 Jul 2024 15:38:13 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sXL9B-004G6W-ME;
	Fri, 26 Jul 2024 15:38:13 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 5/7] arm64: dts: renesas: r8a779f4: Add UFS tuning parameters in E-FUSE
Date: Fri, 26 Jul 2024 15:38:10 +0200
Message-Id: <5c9ba9543222f4b7a8199ad5992aee9fecd8bc1f.1721999833.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721999833.git.geert+renesas@glider.be>
References: <cover.1721999833.git.geert+renesas@glider.be>
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


