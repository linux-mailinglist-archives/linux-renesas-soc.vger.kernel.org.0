Return-Path: <linux-renesas-soc+bounces-18671-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C26AE6DC5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 19:41:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC88217C144
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 17:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD28E2E765E;
	Tue, 24 Jun 2025 17:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kgWw30U3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B862E6D25;
	Tue, 24 Jun 2025 17:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750786844; cv=none; b=bFN2bN9Dn5jX7VTQGVbxB7KHSZJwWVq+Mdwf/2xw9VyR3qKbxkiVJXEcY3f6InCOxbpCyw6uMke9bTyaemoVAbP5sahHe/sA2INy9l10tqtfO+SrYSCUWZVOSCOemDrhGmoQvvkSPHqFNd4v2x9ggWurjYU+WgnBREs4Yl2gKoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750786844; c=relaxed/simple;
	bh=fQzrbePrYxIhqaVEoVCCnBo8eFypKcmkIBYe9dmZyhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u/qIFx7beKXM+xYjNMB6uITzjxtDT+RQTF/VKQcMUuICfcS40hdAFylYAC0JECJm6ANaZJWbP+pEMGvIpj4xpE5o3yxgFpvhGbuzd6T7CE9ERDeiUnZqky6Lx8bfxrsPNeygORC4kt+dYb2zPEPHShrUH92q4tpQr40fjlyfuK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kgWw30U3; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-453634d8609so5851175e9.3;
        Tue, 24 Jun 2025 10:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750786840; x=1751391640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yFpLgdSSuWbM/Fh3sFwagffQ7A+FzIgyJ4W4hLYxV2A=;
        b=kgWw30U3KWXSPPWBh7Ryng6iJbAAdo4TKyDbxrGFDHyHj1qvhsToHNRtG6vDoWCt7K
         zSxcNHP4+2X9wULSeI3kcq5lleXL2pw36ZzAd/u0r0ggiITL9EBzoo2fWbh9mVEmLNkE
         84oY68exoopqhC/GwuVqSqtmSEdWmN4gwo1G+srg5l/lGZcZl9xmvUBnG0Sfi8QQCsYf
         XEpWkuO2Tcyw+MGpBu/ummqFFmTaD4HoyxMDyPu5mBXimyfi7UG7VKH8w6zQp4oKD4u7
         CngXFm1b9KJOXdfSYe13EFNv+SAUo8LdAeuW/lXvGsdqNHnvJ37DeL7lRauE5e7XnHU9
         usGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750786840; x=1751391640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yFpLgdSSuWbM/Fh3sFwagffQ7A+FzIgyJ4W4hLYxV2A=;
        b=XPWW8uz71EphmG5mKMDWbBTY0zuEtUrIxEQKSbglhnDr+oCncnv0wYLoKldU23J6jJ
         N/RjJlDlAXwFXKQXxbi5aX2qz8qR5uL/sCGNBzWpsg0cdoF/+YxVFT6KB72FIeAzc3h9
         eBLnEjw0kKwiOeKMzJQdTA7nI+699pbgE0f5q+JEYJ5wiYpZS5DPnDTlXLmwPdhWO15M
         l0ffdarbDK7/M2SQWXdfEJQ+qcAAFKY7ch6wbShSqC2P3wAoc9Pj+8WRW5+oi8oRQFcC
         VbLpKE/PE/ZNSOkQjRLBII28h4PrZE06RDyshD44duX4Ar9l2ZvXNfQ2lVkM7DObf/Dz
         JETg==
X-Forwarded-Encrypted: i=1; AJvYcCVhBbPozQA9tR5HIsZhkSqs9T/Zli/8Ev/1HsAwofbIbSFNNPwgsK852s3WYfkhN8PeViStemCNFEnO@vger.kernel.org, AJvYcCX1+zQw/SGoWATKpe5UM7psccZq9COgk9/gRLbc/LoNhyRRptWULmjJknszEU3ubHmRSFi+xBLU8k3iFy7G@vger.kernel.org
X-Gm-Message-State: AOJu0YwtowWNoKhEfHEec2sIRkAGsBC6hBHLMCcQh6Y4062g0F/IxvTb
	yFR0fmsNHDcvcpPDBcj/70nkBnF0gEY2zdyPkFb7fd1DJka1IY6eolek/v3nl/5P
X-Gm-Gg: ASbGncu9+JyyKidZZ/Bk9uUnLdAvrk7dJzx2k3IsV7rbKmm334wk2FHnWjWuIlspXvA
	aKyWMREhBzJFf2g6VgHML8Or+1JxOjoeA/E/O6HnjBCGIil96RcjlE2HBWfzGcdQpqWGnSokH2U
	XmyFaLk5H5jWo2Prvtc8SHC8rV5FLOExMBLtKsZE1VgIDCc0xK8l13L9QbmvPnnVkWPYjdlDp66
	t5lBvxEQmjVocDbf8mGDLUsX7DKglGfvVCaczVIWIWn7yt54wRlia/sBj0/ES7BwVWGhqSckJEb
	r4GQafQ+/KokN7xe9s1LgHHTMehG9886bh2CHfgz26z9tTt7Xephytb/pma6owswAw6ve1cQ/IW
	iI6k/gDQrEc5SfmpXqWUmVpnccIi4f/s=
X-Google-Smtp-Source: AGHT+IEVL67P7XwnvBMlu06MJ0roiWKvVGQR2VixgMEAacbZGjv8U8Xgvd360NNO5BtpHSEmzXC4fA==
X-Received: by 2002:a05:600c:3496:b0:442:f4a3:b5f2 with SMTP id 5b1f17b1804b1-453815363d7mr4376015e9.6.1750786839055;
        Tue, 24 Jun 2025 10:40:39 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:a522:16f6:ec97:d332])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb692sm149812735e9.2.2025.06.24.10.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 10:40:38 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/4] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable serial NOR FLASH
Date: Tue, 24 Jun 2025 18:40:33 +0100
Message-ID: <20250624174033.475401-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250624174033.475401-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250624174033.475401-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable MT25QU512ABB8E12 FLASH connected to XSPI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index f9a0e9aefe7a..1af03cb143ba 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -371,6 +371,18 @@ vbus {
 			pinmux = <RZV2H_PORT_PINMUX(6, 6, 14)>; /* VBUS */
 		};
 	};
+
+	xspi_pins: xspi0 {
+		ctrl {
+			pins = "XSPI0_RESET0N", "XSPI0_CS0N", "XSPI0_CKP";
+			output-enable;
+		};
+
+		io {
+			pins = "XSPI0_IO0", "XSPI0_IO1", "XSPI0_IO2", "XSPI0_IO3";
+			renesas,output-impedance = <3>;
+		};
+	};
 };
 
 &qextal_clk {
@@ -425,3 +437,39 @@ &usb2_phy1 {
 &wdt1 {
 	status = "okay";
 };
+
+&xspi {
+	pinctrl-0 = <&xspi_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		vcc-supply = <&reg_1p8v>;
+		m25p,fast-read;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "bl2";
+				reg = <0x00000000 0x00060000>;
+			};
+
+			partition@60000 {
+				label = "fip";
+				reg = <0x00060000 0x1fa0000>;
+			};
+
+			partition@2000000 {
+				label = "user";
+				reg = <0x2000000 0x2000000>;
+			};
+		};
+	};
+};
-- 
2.49.0


