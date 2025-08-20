Return-Path: <linux-renesas-soc+bounces-20784-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4D0B2E60F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 22:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBC031C82BA3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 20:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8DBE2857CB;
	Wed, 20 Aug 2025 20:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lLFM8iZV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2693426FA67;
	Wed, 20 Aug 2025 20:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755720428; cv=none; b=UWhxuly/qO2TLC63Bv3yKRhq02fE61WgsoorUr/9/kIbnB2/J/t6oUW2yIdR5paWF82IsPpneqYQAhGjpgHQPGCxwObtMp6DWnQAd2pKHCVwN31vaM8l2Dcp6X3Lc0EmkNrUtm3gUYAtn5sjCQbB9WxIB+/yPVNC5AvqbfN4glo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755720428; c=relaxed/simple;
	bh=DhFaJpCqiyuqGishahc3FsxNK33u01LlErlwmYQa72A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oORiROyb6WEX4Eh+TtV4NwhfpEm0XN+8cTCwEoU6We4RilhGw3vtik7/eNmMn++p8o9z4HoKrKtOW9OLVPTC2LCYwapHzQVksBy8ia5bq8HXyKHHuf8PqueHVdf1Ttbb0nGI2z00J05EYB6z002ctIQMgE86bu/4cGugC46m8S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lLFM8iZV; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45b49f7aaf5so1536585e9.2;
        Wed, 20 Aug 2025 13:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755720425; x=1756325225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+OrXHtTG5OyhIaY53t5HtBXjxJ9HBp9ew1hQrbNCgg=;
        b=lLFM8iZVg0vXkKvA9XJFR7jqvQODQkQIy6wnpMrWNzgnl2cisPpqVtFabuL1coEool
         3jhuyUfWQUMqnXQVJQYO+Yw/pc0M3kGcvtR/Gzngxq7kD2vOvEvo5FtKtBELBxBo28qE
         AGuJnbyuH/76Ixnxa+7SYoGwYG+8qEeoTM36dpKhMY1Gcu3mJTl9FnN7QRPTBQZ6EHFJ
         oQMCJ1SjzwNA/eSWRIbd9bXVQonVoaxQE2W2H2cmv4VjO1m36z0pvGl5ga4cjxbH87mQ
         izHTeaQ/OeFWK8sucHkVCYmjyLKVHFz1LkSgG/NTtOlBmuIF4O3Sw3HIX+S7aXE/Tzn5
         Uxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755720425; x=1756325225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+OrXHtTG5OyhIaY53t5HtBXjxJ9HBp9ew1hQrbNCgg=;
        b=a2TryPwaerMMiXAZxCg4363VDSxop9KFYC0fxfR5mcrRnXxifgw1A3yK6E44Cw0K/h
         pOrk3ZQsnWPZtIprBOOHj/Flce6+lX2koZKB3O8e89TDo/CLUrFpcyGTANoeubeltJY/
         FZLvJiU6DWcsaEvFx6hqE+sRgirrtmm+3W+//PGztV2p+S6WyI4FEZYlkRJer3FMiA/P
         owQaTBAz8bWEQz6S7PW3tQsas8eoqSFXov3lvd74MKdxcRIPtCNMWX4xTWGDzCuYxVyG
         WMXI5OWrWdpMnFBiDvq78U+PXEQtdr127rKPD2CILaDNIsDqfYy+L1giRolyIlbwKUGl
         v2KA==
X-Forwarded-Encrypted: i=1; AJvYcCUjxfMxfEgtDoDNgu0qhMXvJU32076bkrf47eDKD8slcw+Bk/15jh5qLDn989DtvEr/N+rw2OXDwA3r@vger.kernel.org, AJvYcCV8MUx77qetp9/YXocCOEXTjfNE6fjxwpBfwwUrL7nALhVYx4RDlf6Cu5p6p9zvK4jFUIGdxBN1EwsRB4tT@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6KagTGoobvySG/vYNN0c4GMFPUHQHaoAt6sYN6jpM7MtGrgGi
	uqF7/1Jl3TSDzkgnvxLPTOKAfBHa3FAQ5twz7DzsHzgAy8dddZmooZCy
X-Gm-Gg: ASbGncsX6IM4jVhZAVJSWyPfJbUDvC4xWGa86Zv0kTY6PsbYIhWAc2qAY6kilGAq42a
	8IzrN09vuQkiY586oIksC6akTAjMf1BNtWfV7H1k9QCZUgfRK7hoNCUBrYfbbFKNUeDpa4XB7aC
	qNWHNKDWvGba/wodYMunQ+bFHoXDiyWFrE8pa0jAcw5ImcuWYZo19co68dENd/e0RqDNWUxhmT7
	fqs1Q917pjKXrHENh7T5JBeSgI5CBAPPH1HvACFlXGslL2mfQqxj5LqrrCHKYGjTWeBj6vsVJ7N
	fmmnW7duqrXpphYc5/93Dg+CQuoNFpGSZah3cpOzNLPD6AzOCwhE30ZRklkVtSs/MOO6ST0iyGi
	fe9oM9Pqv3mg6piij5OSlkhQHqDgb/MtFZPEYMyF7gDnlLQ==
X-Google-Smtp-Source: AGHT+IHc7/2uKMWlRnyMclX+2UYCebv+P/IaMUozzb+7YsXLJzBfubannd1u0YdMeH2gX63tlVFSbA==
X-Received: by 2002:a05:600c:358a:b0:45b:47e1:ef78 with SMTP id 5b1f17b1804b1-45b4c73481bmr5144385e9.35.1755720424907;
        Wed, 20 Aug 2025 13:07:04 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:9b1:f84b:89f6:b00e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077789c92sm8810302f8f.52.2025.08.20.13.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 13:07:03 -0700 (PDT)
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
Subject: [PATCH v2 1/9] arm64: dts: renesas: r9a09g087: Add pinctrl node
Date: Wed, 20 Aug 2025 21:06:51 +0100
Message-ID: <20250820200659.2048755-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250820200659.2048755-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250820200659.2048755-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add pinctrl node to RZ/N2H ("R9A09G087") SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
- Dropped RZN2H_PORT_PINMUX and RZN2H_GPIO macros
- Added Reviewed-by tag from Geert
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index 7dcaee711486..ecbb7b93aed2 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -216,6 +216,19 @@ cpg: clock-controller@80280000 {
 			#power-domain-cells = <0>;
 		};
 
+		pinctrl: pinctrl@802c0000 {
+			compatible = "renesas,r9a09g087-pinctrl";
+			reg = <0 0x802c0000 0 0x10000>,
+			      <0 0x812c0000 0 0x10000>,
+			      <0 0x802b0000 0 0x10000>;
+			reg-names = "nsr", "srs", "srn";
+			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKM>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 280>;
+			power-domains = <&cpg>;
+		};
+
 		gic: interrupt-controller@83000000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0x83000000 0 0x40000>,
-- 
2.51.0


