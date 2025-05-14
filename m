Return-Path: <linux-renesas-soc+bounces-17084-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13594AB688B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 12:16:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47C0E1BA0836
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 10:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F981270EBF;
	Wed, 14 May 2025 10:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XiDm7219"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556BE27055E;
	Wed, 14 May 2025 10:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747217740; cv=none; b=KMze5k4KdQW3AxL1wlFBkYVdkpvJTWg9iu/k0gGZFhXjs/8K4pcWtIJFyPpW5rkhn8lz45LXaXD2SqtBao5qyYlfrgT88GQbpnCBX+TwRFjtkyB6+lqSyLl9ie66/qNVDCstVA12JEhndBUd/hmhJvOqE9lxpcost7MSjRPeLLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747217740; c=relaxed/simple;
	bh=iWtaYG0Srni1RJvKSsFp4oqljJsR3dvTaZVxsCD56nc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u05T3vyG5URGS9PBleXjuOIWFqSgF8xFrZkBz9MgdKjtrpKJ+hTHS19Ns31JSinuBkAUPZe5FIA0Evnv5d9CR8LLW6ahqx4StIdbl3R+nqP8tGMHK6uxnL/k3/sje/jQ/reez77/7kv4kubflF6dWARE/FgI6w5U/MIzcY1PLzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XiDm7219; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a20257c815so3667208f8f.3;
        Wed, 14 May 2025 03:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747217736; x=1747822536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3UQFcJI9+eFiqx/aOP9HayTOOO1GZeGk8FEwcWIvnvU=;
        b=XiDm7219tpAYoODO3BQ/GVxxDqC7eO1VLo622VbNyRsox6JiKMwRlKalhDBCXPJCgq
         SzgeCofbgQOhXt6bGLgvmOpPRCaTF5JW4LdfPubqWqiC3ZBnddPKDj6nkAd1iFDKK9cF
         NtR+PR2MQJt+B/99cQXNbFQq1SOkWWCwbowLU4xDEIO2l8YJUdQdUaMQHwDS4H4FVozg
         QBxkIFkS9IJTf44DWqMB1N9Z19PcMIuurCLQ8qtOKLcGWmGBuD1bwGOgnAbhJSDd5jDT
         TDwANi76Q6mexAS/N2Lvxjgxp7yuuMEeqVPKUMnf0FIQfF+4nEAgD1xeDcg7PzXwHZ+O
         bpGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747217736; x=1747822536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3UQFcJI9+eFiqx/aOP9HayTOOO1GZeGk8FEwcWIvnvU=;
        b=hxxjFMJW5tN4urpPhNNH5faboiqYYY4CinG0PrgaGOo9BW7r9uHydDRQiLHBpnQXK4
         SJnbZPWc5i5OWc4Upi2V8Wl25SPFPwL9fNwSl9tDR+TEyYO8F+RAjXmSg6lBuiWIO7eD
         7f6dwmV/t58JLWzSYiP7xfIKtNmMPCoPqeCCmimCAG2W7BwePK5Tx0SXlUqAXtyMF6iy
         2TF3k1D7QQTPhzbGQrSfH54yEo2PRO95+yhaA1ZVgpMA9Y9lAYz50BR6+3yqu1z9oQXG
         4m+tWq/4bU7DPgWvQD/znzXmRHdvJVtXDSCtkgOV0zsGiIbtzLmcI4sGWmZSF0sUh+Zw
         jcIA==
X-Forwarded-Encrypted: i=1; AJvYcCWqevcS30YOynC04PuWOQz8PyNxJ7EwOQU27pCunewX8qzEUIKb8mTtQ4jxxzhNL16sKK/ohc/Llhe96spZ2/rdvHA=@vger.kernel.org, AJvYcCXlHg88FJMmSUpNrHUlOnn2N8wHaRC+oa7pZADnzNpA2u1aBM26CDhARXPUh8dkpxFO3fwFjbG7ioP0awo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoT7CSBlb8GsQEvvxBtg6dQQ6nncSOTW26hXlhHWGFdBWA7nzw
	Dtu2/faB095cbWqBgG4apv/3AsNxFEILiL0AK1M5AdyVKW/hf8zl
X-Gm-Gg: ASbGnctJq+0WtHHwNsPsCyTZLZfhTRCDgUWTRVVjePKYMCyaWFCX0z0wMFl6eJb7Wf3
	rJ4k4rcIfZbTs5Kgh/s/yc7V3X6m4vYyOtzCl50JI302xDpeLFyTitWqT6O9xcmGv8eXPr5FFVi
	gBFXclloV16+EZqGwuoWVsGPICltJ0K1gYGNG4SBzyxe3ocHJM1tpgqvn1nRXiRgr+1D1qiqfcV
	9p9aLOFL4azbfhzBINIQ2s4BgsRGcn33WNOp+vq3Z7s1f1N43DGnNP94LMCaEotUajEK82V/KA/
	CYqKhRjaqmd9+d2OpKRUz2IgX5mbkfaJRw9gWkbMB4YQvoN4AfHV4jU399p/7RKWwXR6Jy3JGst
	b
X-Google-Smtp-Source: AGHT+IFU/Pdz+AESD8cotXNkzszeLpdzp5gCtTFgyhCZ4d6wZdtKImuBYVpkpEOcHfvsr0BGLKtt9A==
X-Received: by 2002:a5d:46d2:0:b0:3a0:9f24:7749 with SMTP id ffacd0b85a97d-3a34991c245mr1763530f8f.36.1747217736480;
        Wed, 14 May 2025 03:15:36 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:6140:13af:687a:7a66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f3afdsm19530249f8f.60.2025.05.14.03.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 03:15:35 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 02/10] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable GBETH
Date: Wed, 14 May 2025 11:15:20 +0100
Message-ID: <20250514101528.41663-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514101528.41663-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250514101528.41663-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable GBETH nodes on RZ/V2N EVK.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
index 24343fce7f53..b72574dcc209 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -15,6 +15,8 @@ / {
 	compatible = "renesas,rzv2n-evk", "renesas,r9a09g056n48", "renesas,r9a09g056";
 
 	aliases {
+		ethernet0 = &eth0;
+		ethernet1 = &eth1;
 		mmc1 = &sdhi1;
 		serial0 = &scif;
 	};
@@ -54,7 +56,71 @@ &audio_extal_clk {
 	clock-frequency = <22579200>;
 };
 
+&eth0 {
+	pinctrl-0 = <&eth0_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&phy0>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+};
+
+&eth1 {
+	pinctrl-0 = <&eth1_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&phy1>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+};
+
+&mdio0 {
+	phy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-id0022.1640", "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+		rxc-skew-psec = <0>;
+		txc-skew-psec = <0>;
+		rxdv-skew-psec = <0>;
+		txdv-skew-psec = <0>;
+		rxd0-skew-psec = <0>;
+		rxd1-skew-psec = <0>;
+		rxd2-skew-psec = <0>;
+		rxd3-skew-psec = <0>;
+		txd0-skew-psec = <0>;
+		txd1-skew-psec = <0>;
+		txd2-skew-psec = <0>;
+		txd3-skew-psec = <0>;
+	};
+};
+
+&mdio1 {
+	phy1: ethernet-phy@1 {
+		compatible = "ethernet-phy-id0022.1640", "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+		rxc-skew-psec = <0>;
+		txc-skew-psec = <0>;
+		rxdv-skew-psec = <0>;
+		txdv-skew-psec = <0>;
+		rxd0-skew-psec = <0>;
+		rxd1-skew-psec = <0>;
+		rxd2-skew-psec = <0>;
+		rxd3-skew-psec = <0>;
+		txd0-skew-psec = <0>;
+		txd1-skew-psec = <0>;
+		txd2-skew-psec = <0>;
+		txd3-skew-psec = <0>;
+	};
+};
+
 &pinctrl {
+	eth0_pins: eth0 {
+		pins = "ET0_TXC_TXCLK";
+		output-enable;
+	};
+
+	eth1_pins: eth0 {
+		pins = "ET1_TXC_TXCLK";
+		output-enable;
+	};
+
 	scif_pins: scif {
 		pins = "SCIF_TXD", "SCIF_RXD";
 		renesas,output-impedance = <1>;
-- 
2.49.0


