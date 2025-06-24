Return-Path: <linux-renesas-soc+bounces-18668-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A262AE6DBC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 19:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B23D4174276
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 17:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A5352E6134;
	Tue, 24 Jun 2025 17:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9GO1CCR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57709298CBC;
	Tue, 24 Jun 2025 17:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750786841; cv=none; b=sp4UPG3ed6DDpvWHnjGyGIvHVUmW1cwuBuWS3Af3MAQ4cDluuxVxL06wfPIYTl8DmyJGpyojbNGaItJEaOhT7vlHvOmzZoLGSQJGgKLNROzXaNzXXHmI4VQQjflwPIPc7sraDqPHmHiLyD8W0ecw21kD6LRP1nZf9W28F15vPJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750786841; c=relaxed/simple;
	bh=rJE9bvs3ZEQV8ofoUxIfQA6hgAN/5PCs1FRRZeAQY+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aWHYm83UIX7AhPyqVyYFwhLGluTPMnWM20DaVDspZg6iIysAuk6bQsigb0oRAFhz5fXQz012DvgjAh2qNCGsBWAjQOF+IhMCt6UAyEdeRXXp6bEC9NQgAzDOfzKd6DN0Z4B0m5UiIjfPgvlQuaPVO+9u4kBq+eGFbqgHlpK0AUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9GO1CCR; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so2562602f8f.3;
        Tue, 24 Jun 2025 10:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750786838; x=1751391638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMWIZsxAFwmLHil4nfc2lXJ/KLQvHU049BnUpSrpo6w=;
        b=F9GO1CCRmiputrrxTBQvtceELRtTZK1O0sJW1IJb3AMaH4YRBnzlxYZ010x+Dvxxew
         JFPn+8N1Fx7RS+P300yWdZH9zY2l6gjIM+OV0ta/Q9Z5zYiPzhB4CO7YynvdPS60Mv4M
         09s8jMFHlaCKHTOG4Qf7bFUN7fB4uKEGlBaQiga3HI13wDThFqatRLLsu4OJtwDSpQWM
         l7WQhVetPbBKdTjBU62Btywzezl+lo6Lsnltm/Ncyz6j8260u5qvkl8MJr8+xws2vNkZ
         Ayxep4jF7uowTCTUzqOti4G77KeSRPpasn1Of2wI7BNwFItqxPKAnFm3MgUnbIaSdDvJ
         Wfgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750786838; x=1751391638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMWIZsxAFwmLHil4nfc2lXJ/KLQvHU049BnUpSrpo6w=;
        b=JjB8qXB/bvNzVMpQlj9Ad7NSwUOHi0IdzeqVStvsISKj08KX8HpB3/kSym5aG5Qcaf
         Ue6XIze6a2UjLeV5a+BDHpZax80ekFnn9qsATrf2TQt6YgEuAWMtadnH/Q2DuCUKo+Uf
         AN4OJRJmKJIGhb+bZt4FyyX3ZzUcgp4g2K1x2vx7RtUGry4k4fqISEamLByYSf1nupEn
         JInr6RJ3BNZa1O6UtIdvQT4QdjpScCqKqPbls1UKbtYlKyuy+gX4OfMHDu6qkyf5j3wS
         /JCfXv82rpE8ixIj/Hh4dtmHBLaH7fmpM32U5hMNbW17n9fcQNDC2APAVE2iq9Kqd+a/
         horQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd7LFXjjxgHF0sFsMlsn4IWZkNvEwyFZ71pI8vlIJ/Bl4Ue3NG6R5Iu1z2F+iBPbZf0S2LHBBDWc0B@vger.kernel.org, AJvYcCXwRKwEacw97A/x+AJzu54yBGHroXeC5wsV7NeUEGOM2TSMiKZ5kZ8lv/mVfjCGFbP+KJE5avdX7ffvm/NH@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq4fXG9hKkgNM4IgRXDrMEjNXvNbT+lbWlM6dcTAJmcneA1d3k
	hV4vdYNuhXQ6XLpiqg9eJ8LvVIjSoh2KNSns6L+oNbEEmdNUpYiKeWUs
X-Gm-Gg: ASbGncvjPNNu6a92Mr/wwncBmNU8oUE56OKqJuOOJ74w8bwOm5W/DgcHS2WgeCgjXJ8
	hJjmBVXQ5Se9aYEngqh6pR8oxMASkIeM+T1l1iytSvWRSPGLLwZJhpDrGZmiMjtZz2F9uuUQDVm
	BKsBs3gwDUkzpyuwQ3maonkzdMRBnGK/FXEDybpFwo09ksICBT9vQFF5VwG4nn7oeHEG6egq/Ua
	908DNjXYqogC0N3O4OVw7xZn2CeU6k6oj6IvZ+XULuJwmu/Lur1RCQreCn7s1tjgGDTKKwFegCM
	rTfdBinGkBrJ7KLjoCE+9E+1vp++jkfFOCEbETMwJRG4OxrHokNyT7F9RuJZoD0Yj7+h3Nu4GQJ
	e/OxKD5AtkEo3aFNH61l2
X-Google-Smtp-Source: AGHT+IGRs0ZGHm/gQpwuWXrs4ykIyCJy/uuMHXvpKzmSTRm9ElByLBS6P9HIK+Y6O8GJDy78h712zw==
X-Received: by 2002:a05:6000:2892:b0:3a4:f7df:7564 with SMTP id ffacd0b85a97d-3a6d10355aemr15486077f8f.0.1750786836457;
        Tue, 24 Jun 2025 10:40:36 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:a522:16f6:ec97:d332])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb692sm149812735e9.2.2025.06.24.10.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 10:40:35 -0700 (PDT)
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
Subject: [PATCH 1/4] arm64: dts: renesas: r9a09g056: Add XSPI node
Date: Tue, 24 Jun 2025 18:40:30 +0100
Message-ID: <20250624174033.475401-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add XSPI node to RZ/V2N ("R9A09G056") SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 617b9ec9eef1..68585ece796e 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -208,6 +208,29 @@ sys: system-controller@10430000 {
 			resets = <&cpg 0x30>;
 		};
 
+		xspi: spi@11030000 {
+			compatible = "renesas,r9a09g056-xspi", "renesas,r9a09g047-xspi";
+			reg = <0 0x11030000 0 0x10000>,
+			      <0 0x20000000 0 0x10000000>;
+			reg-names = "regs", "dirmap";
+			interrupts = <GIC_SPI 228 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 229 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "pulse", "err_pulse";
+			clocks = <&cpg CPG_MOD 0x9f>,
+				 <&cpg CPG_MOD 0xa0>,
+				 <&cpg CPG_CORE R9A09G056_SPI_CLK_SPI>,
+				 <&cpg CPG_MOD 0xa1>;
+			clock-names = "ahb", "axi", "spi", "spix2";
+			assigned-clocks = <&cpg CPG_CORE R9A09G056_SPI_CLK_SPI>;
+			assigned-clock-rates = <133333334>;
+			resets = <&cpg 0xa3>, <&cpg 0xa4>;
+			reset-names = "hresetn", "aresetn";
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		ostm0: timer@11800000 {
 			compatible = "renesas,r9a09g056-ostm", "renesas,ostm";
 			reg = <0x0 0x11800000 0x0 0x1000>;
-- 
2.49.0


