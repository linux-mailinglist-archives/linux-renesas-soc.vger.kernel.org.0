Return-Path: <linux-renesas-soc+bounces-23791-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 14815C1656E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 18:58:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 396434FDBB9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 17:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87ED834DB7F;
	Tue, 28 Oct 2025 17:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QfQiRtps"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB6032E15F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 17:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761674116; cv=none; b=HZuUDBwlGirvOA1gtobt8BIOGqJwXX1UxWyPYXgVh1l013EOi7JS5XM3+A/u3pM5dosQ4kDtdYZdgVJqpVlunkeWZk/o0cofHCsRfPyCxY3CpWMARw80FNL6F4quEmySOTKcS8q+VxAmD1e/EgHt9HftcqIH7CN/QXY3ftYYJ5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761674116; c=relaxed/simple;
	bh=PwsyC81v3tRrRPNuJHDHL2QzEBY4a5tRjjnrba7X5gE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rfzIglBzX86FlQ5EFX+Z+iDstJ3boNEtzfuP1/T4YjCm1TF9OEON1TQtUDurUlzHVbPMtcSTgAKs6LN1qfPrR7MmmQPtuCQmfurIoEN5mRUM873LGwK1j4u9WR+kn1ypPDJ7Bxb0N4KdNcs7093Vm71T3VD8t5EVwzCVzj8ircU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QfQiRtps; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b553412a19bso4105538a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 10:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761674114; x=1762278914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+55/dqa9+0HC3hZu/kC0nj8fjuThSbHmQ5+76wIXkDU=;
        b=QfQiRtpsQbN2zW1X7O6Dw1bjJRSy1kbL52ymg8E8UgOinlJZ+2SSRn1ufSKwiGrcy+
         Ytn8i18n0Q/nKEpsNAhyTr/snTbdxuC4sajkMSPh7IQjWs/gyXW3OaKl72qGMAQ2KruI
         k0pXcL9m6DsR8mIKkYT9KCSwCdw89BqlaC+QJ4QQaqFdFjCw7eEsRwycBQf4qH4vLzY2
         szd9ZTBd+3gbhgOyBqCNb/Ljevou3lG+RmbRJOOjqTZD5UywD8oBcA1f8T7C0MIwrqKc
         Toxwy5Q8CFVs9WRt2z90Nb+4QyTCFkCSpn8Uf1t775Z9ZPFyPkKmYxrHpN1Z2GiQTQke
         L8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761674114; x=1762278914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+55/dqa9+0HC3hZu/kC0nj8fjuThSbHmQ5+76wIXkDU=;
        b=AfprIun30dMslUR+Sd315kf3EkcwHSRcTJHTxSX4FXfCOQORGaJKhAE9Jzk8okaEug
         c1HyiNSBrKXkk3eL3l2TZTDg2vOJFJuL4eEswERnCW1FVqsmoArrtywhHXSLj0f6ZyKb
         UGisjaDpS4X4a2zwhk7rsXrsRaB7xXra+dkZ4SdQ5oNJNB9a4vNKjpMPE9a9Z/FuVoQi
         tcegYsId3eLrR1hUgk2pFh2M6pKSXOSYbcfo5/MgyksKZbuYgm9st8hzSzYT8YMZk3Ss
         384mGydrPJAyAY2f0gGw4VDSNKxfermZDtZ9EX+r70JfDkMxd+vwtYzX09KpwhGLSQgK
         tAMA==
X-Gm-Message-State: AOJu0Ywo59rYLoUIoMjV9RjB7+dCr6cVkbOVAJN6LRIAn2OatEm4fVuA
	X/vmwT/+tYKCSOLAkZIsonc9FONHq291sFBwGxz6tG7ETQxshLqTz+h9n3zWrMoz
X-Gm-Gg: ASbGncvExSpSCC/vpimo+SEg1YcEY/Tpzk5nYFTiNI1VHfVaV3zcNW0epEZBS8gqgX0
	YJi7tHIOu/DTodQ8ZTCeQz33JynI7epIQId6yN36ai7hdqGSl4YZHLuUclSXRwcwFwAj+SpnPdk
	48xlSFA8sIWV1/nUOldB3P4WMPrBvYZ21/ZnsrpYb2Varu/+r1wWJtaBaM9EOG7Ftwx3PUEUguV
	kNZQzDS2C+YX+UQZWetO0Y4uQixAjVLs+vfflyByjj8YILNaE9nf4evdO8goMaHpIe87kNscG0E
	IKsUxIeAEHz6+yWTXDFf2pO7YPFqgV+YuZxq7HZkI0SBLg7ZpuPr5Yw5n62uQsgl8rxK0+5Mf6Y
	inKcM/SbYMURqTo7iZVYejIQJY1NgFJsCbTIUIdW/JZyH/pEkFOaNoHcpvZlZrYTtDNj5v704sl
	ArTpPe1ztB2iau08UPv8aIXg==
X-Google-Smtp-Source: AGHT+IF4dKtNRfxxNp4OrXB9wZEZoNLTOJhqDtJGPdpTZiD9T/kISh+eB5h1ld3hQ9XZZ2q9Va6rVw==
X-Received: by 2002:a17:902:c40b:b0:293:e12:1bec with SMTP id d9443c01a7336-294dee2c381mr675755ad.20.1761674114059;
        Tue, 28 Oct 2025 10:55:14 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:77f0:168f:479e:bf92:ce93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3410sm125713005ad.8.2025.10.28.10.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 10:55:13 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/5] arm64: dts: renesas: r9a09g077: Add ETHSS node
Date: Tue, 28 Oct 2025 17:54:54 +0000
Message-ID: <20251028175458.1037397-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028175458.1037397-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251028175458.1037397-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add an Ethernet Switch Subsystem (ETHSS) device node to the RZ/T2H
(R9A09G077) SoC. The ETHSS IP block is responsible for handling MII
pass-through or conversion to RMII/RGMII.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2 changes:
- No changes.
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 2acca4bc1d3a..8a530c12a6dc 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -270,6 +270,43 @@ i2c2: i2c@81008000 {
 			status = "disabled";
 		};
 
+		ethss: ethss@80110000 {
+			compatible = "renesas,r9a09g077-miic";
+			reg =  <0 0x80110000 0 0x10000>;
+			clocks = <&cpg CPG_CORE R9A09G077_ETCLKE>,
+				 <&cpg CPG_CORE R9A09G077_ETCLKB>,
+				 <&cpg CPG_CORE R9A09G077_ETCLKD>,
+				 <&cpg CPG_MOD 403>;
+			clock-names = "mii_ref", "rgmii_ref", "rmii_ref", "hclk";
+			resets = <&cpg 405>, <&cpg 406>;
+			reset-names = "rst", "crst";
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			mii_conv0: mii-conv@0 {
+				reg = <0>;
+				status = "disabled";
+			};
+
+			mii_conv1: mii-conv@1 {
+				reg = <1>;
+				status = "disabled";
+			};
+
+			mii_conv2: mii-conv@2 {
+				reg = <2>;
+				status = "disabled";
+			};
+
+			mii_conv3: mii-conv@3 {
+				reg = <3>;
+				status = "disabled";
+			};
+		};
+
 		cpg: clock-controller@80280000 {
 			compatible = "renesas,r9a09g077-cpg-mssr";
 			reg = <0 0x80280000 0 0x1000>,
-- 
2.43.0


