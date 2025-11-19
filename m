Return-Path: <linux-renesas-soc+bounces-24781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B0111C6E29B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 12:13:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 72FE035C9BA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 11:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F05063546F0;
	Wed, 19 Nov 2025 11:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bo6NBd+w"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07771352931
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 11:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763550324; cv=none; b=L3nvKHAoZisO+j80KJf3rJAeDcSauMW5o3K7blFISQ2/paQFfYWzNSDf6RpgYLKToYPkozsHvS7WknnfHDOH3Dl39SRhgs5p73h1plje5dOs8hnnNDsk4+h9TVQOBCMn2jAwepRTIUrCVSn8/e68inTDa95ww78TxgZyrgj80Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763550324; c=relaxed/simple;
	bh=2TJFUQYU+wu7KTNFucKzgKyilN6NhafOyHZKbCecEP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ui2foAia9AEDupX/8w4UG455Enaoea5aUp7ubHK8oQFLeUO17Or/2zDpAz56ctNLgHugPHnLBPHYq5EmqY5wDbzLbjXaCsGH1p4rS5fyXI+YXf8ZoguzPLkcguYVNc3a4A6/YFE2iii9S3sO+UyDAQkBzPiG0liW3rhGlFVEXHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bo6NBd+w; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47118259fd8so48583935e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 03:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763550317; x=1764155117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5EZwZ7ElQzgx5V4OYvdVq2gIvenCiXTvz/XWCyEVH/U=;
        b=Bo6NBd+wqcYrYMEgIKkHs/bp3dYdf5aH1XBquLEwJr6vuGhYd0FM2yviaJsbYivxee
         c4oa6fOapjl4vcwtQ9Sg3I3ff93CSn7z4W188l4D8+yYcpf3R3UnGQMN2UeRwXl19eYl
         zC1fsk7OeKZ2RzxgjoBKiYZVOYUwDXtHjPhluLZceVFII1R7H4vfIPjmN1F3hfW5uvzx
         o2VVF4IYJyV+BLX+gMYA5pfrQfcnCZ5BcOSx88ayAlOa9af4pIobfvJDYxyV+jRLyroA
         NH0OW8H5ySXf06eDlzko9jeNevhlrlGre0RvFZS8nb9Cpxarr61VoM7Ygy/3DSyw2R0S
         YiiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763550317; x=1764155117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5EZwZ7ElQzgx5V4OYvdVq2gIvenCiXTvz/XWCyEVH/U=;
        b=Frci1jsUmgnCH5oZW7stSe5MpkXtOPWuAO/hncdAAxA6aqHGlChWK1X4SyUDDEu8NH
         ncRcCfHG6Uata/IXNm4F2adrKdQincHwIJu0XCFNK2q4aF36IeWFEyntZLmwA36M8pRU
         lta9iDg1XXbbTwE57rvQg3UXQYQaXbWKrPxRcHnVP0c7PhpRZWCPx+EWorG0tdxbMsqs
         00no/EEmayoqABDZ0i/CC0HwMIKV8R5cE0khjuoFdMINi6olsfw9z5v8ykifOLOeEZa5
         LtJArOV7eRBwIH7vh9iT13ymPbfDKbBrvVt7GrvcPucv0WO+VrxWU3V5oL75aj67DmWe
         p4zQ==
X-Gm-Message-State: AOJu0YxY/+EMdQUOzJotYXdC5Cl0xWlaieUtv9N5KuRXwN/sVgP2xI5m
	Dze3p7upjbOB2Qno7OsKnIAE2HWaTsIMFsigLQcvbfyulFzzVto04Ylr
X-Gm-Gg: ASbGncsf1uRe88TBHaOSzrxqWiVO7eWM/UFwpzzJCNz7w44IYRr5gE8TU7uv6+kuEAE
	A/je+e/TYWhRCCtjTR34bLYpm+wRxY24iO9zsne9k4L5u67HkESHL2oQNdRjYytcp4V/RWusEf3
	z8YpoB5FwAxMFeTWHkSdoDMQ1K2JETnu0GMqD9yzOsCe0r+Ywd5YuBURy3dwi61EXGk4gAh2G46
	WSbo4Ln0s9YDopsE4CTT16FM9u5rk6YwxHdmrwy9IY+pBi5oEDJ2m7rflwNnpvWl59wDDZ5jeNw
	R9cMbxS/uYQlSzarRXqkZXI27OMSCSBXVHMgGnRP0kA0Wlu05w3DJIQvU7kBmlT4t34PpIk25zD
	RVPjEjnUijRg8RmIX1h55Z+nB8aZvIHRcptXk4IuVdlAXkE2sbSIM+2s3f5evRsS7u1Z9LWZYYX
	5KoIutJIX923HzjoRWY3OgmY61V3AHc8NuPyKmsosQTHXcOpd7s/ovl49O
X-Google-Smtp-Source: AGHT+IGZPyYYyU1gmbUzbTM3eoIbOfBxE7z0h5lX17lOogXMuPsrWzhgi2FMdXYHZXsDFJAdfojLRQ==
X-Received: by 2002:a05:600c:1ca0:b0:477:b48d:ba7a with SMTP id 5b1f17b1804b1-477b48dbd2fmr15231955e9.32.1763550316612;
        Wed, 19 Nov 2025 03:05:16 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:4b7e:3ed7:e0b3:cf30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9d198a0sm39884505e9.1.2025.11.19.03.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 03:05:15 -0800 (PST)
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
Subject: [PATCH 4/4] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable USB3.0 PHY and xHCI controller
Date: Wed, 19 Nov 2025 11:05:05 +0000
Message-ID: <20251119110505.100253-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251119110505.100253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251119110505.100253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable the USB3.0 (CH0) host controllers on the RZ/V2N Evaluation Kit.
The CN4 connector on the EVK provides access to the USB3.0 channel.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
index b77276489b30..9fd904787c30 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -460,6 +460,11 @@ vbus {
 		};
 	};
 
+	usb3_pins: usb3 {
+		pinmux = <RZV2N_PORT_PINMUX(B, 0, 14)>, /* USB30_VBUSEN */
+			 <RZV2N_PORT_PINMUX(B, 1, 14)>; /* USB30_OVRCURN */
+	};
+
 	xspi_pins: xspi0 {
 		ctrl {
 			pins = "XSPI0_RESET0N", "XSPI0_CS0N", "XSPI0_CKP";
@@ -510,10 +515,20 @@ &usb2_phy0 {
 	status = "okay";
 };
 
+&usb3_phy {
+	status = "okay";
+};
+
 &wdt1 {
 	status = "okay";
 };
 
+&xhci {
+	pinctrl-0 = <&usb3_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &xspi {
 	pinctrl-0 = <&xspi_pins>;
 	pinctrl-names = "default";
-- 
2.51.2


