Return-Path: <linux-renesas-soc+bounces-18670-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBBEAE6DC2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 19:41:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3E141BC6741
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 17:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01E1D2E6D2C;
	Tue, 24 Jun 2025 17:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HX92Qhux"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4E22E6112;
	Tue, 24 Jun 2025 17:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750786842; cv=none; b=T9TM50NfELlJXfI+fQZ3LjKqZaIEYFCwN2sgOOtQ2hj3mKh1Lbj+QYxAMI7BB8XZaGgzhEfBOd1Js+1++mkEdSmYEjE9j/VjytVg+uf0XekcpgTmSInNKqXGH7gpphf44ZGiNeI4nTPaDfrcWD+3t51mLQehjgCsNJt/BQylbqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750786842; c=relaxed/simple;
	bh=olhPcN3gX5ySSH9/n65tg5qZ+neGQL+QRT9vcBFkzqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dMqn5U/PNEG560QjR1lJAjEbTK6rOgSpfFthNi1ydULry8b8xcQ9bO7IpKD1TspnuvlZp0xNGhL8D4KhglCD4iZqa0baVI77uwjsJ6KMSGU6Yq40nEAHxljrZ9T4hqTyMx7GQNR/cuyZZdOmtnHvYXiA3tMjgpwxYL9L5kjI/OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HX92Qhux; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4537fdec39fso3147735e9.0;
        Tue, 24 Jun 2025 10:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750786839; x=1751391639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=68gwhcusNDHZ8866A6Xhd3/J7ABAq6GS5EV9+JDPTPg=;
        b=HX92Qhux3ICRDJ+yfzg8BDEsMWFo2D5RT/w0LaVCsLVynIbCjScCocaOKjC4QlIzsn
         8zkNT+orjLA92PbJi2pA4WG8b4zMzZwYbqE0Wyb88m8Ui+tBlabk3aj4+/v/k+JwKEk0
         CQ1k2qyzhsFqBBVooD47E6Suk0gS+I+HWH6mWbA0gnd8hsgCnI7vL+6v96UgGmaSnkui
         0L9X/FI4FIFBe6MSxtAkSFyMe+JzN30dv4WdVhjDpaYAyTeouyJO29xW0SMe2/br7K8D
         DxO3ihs/Xh+VhPtjaFSz6SNRA50f2THCC5lWcAlC1bGzHDQ5bZgLbvo2BtEqrz0pHvSn
         s69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750786839; x=1751391639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=68gwhcusNDHZ8866A6Xhd3/J7ABAq6GS5EV9+JDPTPg=;
        b=vqbf6xcacn9OqHtaJ62PefpFjnFC0ceyKXWSPUhRYTcto4ECyB5J7wG4KzDbQwSkKW
         z832ClD31YLOzLS9BwLfJgZvZ+HTEqoajYm+Q0o0CT0uOIX5TwGlbyNqCg2vxu2Lebpk
         wbN9ydrO6n5ft2jwvp+yv9nbHZ/Wea2LBSzBkqXd1CYePYZMPESbrZa5l29lWA/hypKa
         JwPDQqSfpNrY4Tsk3Zr2i4y+Rp8WXMoOIEmRxliiYtzml3XiQyxI+Gp+mAKcpa4w3Cdp
         u9Hd3ElbKUWZjnLTWMpIcDbK4L6D2OCRt/gNE0YBtTed1sVB4pNvESqqds5u0Hbs0rSt
         3jsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5lQEdFewvKI65hpYeO7sleW8ll3EfGQEeAHcApKBQEJQ76dj6OSaPK9azbaOSXIATWu6+MzIRJUF2vPbA@vger.kernel.org, AJvYcCVjGp6hUndRveOarV+F5ApxI4//7v1TNzQSsAjCltPu0K8RiiX/ew/CUHFnKAANBZHh+Em0KQGXHyrI@vger.kernel.org
X-Gm-Message-State: AOJu0YzSbp4AgE9ZEs4imWRFGLuiX3t1aW9gO0EmtUbTo4vzMHDj9MLM
	3na0X20uW7Q46dzRspPe01yh0pSULO/yuV6iwDpEBadWBQzDmr96TJYNvHY4Zn0Z
X-Gm-Gg: ASbGncsadjnkjuAgbaG/VDRph640E4dMJzEpqsExF4kRrtMPoOh+EOiT+U05kJd9fFD
	tRXSzDRd1pGo1h72uOuaQ2JCE+IZQ0vsXmpsYk4XwTZ2vdjT8eHSxcF23SqD0XHBlWrJzcskP4c
	vUznZK0cFxTh0Iax2BSqVBVdFgbGhOTsUlFGg8Ga8Q8MI3Nruj3ngYj7RkaDYPA3QlhYZUU02rq
	mLXOK15RlC1qMdIissUOlWB3FajO0bWDYl/o2baXBxEMOpj5TPg2/Uk3Y8GCe77WTgCq3qLmyEI
	U36yNbKEdKqtgPjtLcobWFgTcVHY5j85rxUQKUxdFMhTIONTNm6rB9KEUFcJsc4JVgL26QrUxq4
	SlLdP4Up4lJz3jISHIWuFhPcyRKOWbzs=
X-Google-Smtp-Source: AGHT+IGv9i3Mc29EvxvUDdSpt1Q19MzdDB7J+u7vhi+7a8LQjd8gisDeuHmIlywTjAIIYO5RrpBm0A==
X-Received: by 2002:a05:600c:4f54:b0:442:ccfa:18c with SMTP id 5b1f17b1804b1-45365a002aamr128462465e9.32.1750786838301;
        Tue, 24 Jun 2025 10:40:38 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:a522:16f6:ec97:d332])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb692sm149812735e9.2.2025.06.24.10.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 10:40:37 -0700 (PDT)
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
Subject: [PATCH 3/4] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable serial NOR FLASH
Date: Tue, 24 Jun 2025 18:40:32 +0100
Message-ID: <20250624174033.475401-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
index 5c4ee66b12ee..73e95425c89a 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -342,6 +342,18 @@ vbus {
 			pinmux = <RZV2N_PORT_PINMUX(9, 5, 14)>; /* VBUS */
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
@@ -384,3 +396,39 @@ &usb2_phy0 {
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


