Return-Path: <linux-renesas-soc+bounces-25780-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A519CBEEB4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 17:34:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0F68A3017B7D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 16:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D96902BE02C;
	Mon, 15 Dec 2025 16:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVmUF1rs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A6A2BD586
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Dec 2025 16:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816451; cv=none; b=fMLTmbmwY2d8K586ZoHQAazzcZF9/oBzJiOtnqJ8DOY94KR71+rzsqHSwbCAl6fyTWvxXaRTx5V5dfserTIZLD8LLj6devrs/JKmsh/sNjpCnfsy6r8Hoa5lMehIzc44XK2N/kEPpwpf7sst92ErQbfTQzU5y/wuJtTwnq8z3fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816451; c=relaxed/simple;
	bh=XmlUkydCYQcXlifUxleNLdJqiIvsyKaqfOvnL5yelOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ak4n/z2my+bE9cVyWdTc+9UoQoRgu034ZKULnyuRmPsjRVOk4k8qA3m/yrDqEtQyLJHG1KpNua4R/V4aqve61thtkqx3dOZO25L9I56QyJQLoJCGqF5zvLLTFqZ3Yf9RMrD2lVRzY0rCa7DxxmHYgS0SaikW0+hS63nSu6/EVoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVmUF1rs; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4308d81fdf6so1052596f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Dec 2025 08:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765816448; x=1766421248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/TX5+BnpmWjuJYnW43/G2VM/NbAbgOGwAVqzwjBIJs=;
        b=RVmUF1rsKRDb+VTA8sbAyEpLxT7s3vrQ0jbmePjBJ+rvvHsi3xBbmWtfvcKzxtwDRp
         MqNr0JwJdLt5QnB5u2qbbjTA4Z/r+0SPQI6l30KdK3tTCz/LfRHmkrgXpsdBcVAO4+7e
         et5F43DFSXKrDTXYFEBR/ZJpfTbF2Yz6F3s3FTGaDjtXTqiq0GSEQNghE9symzfRxuaZ
         QYo55+qEzgHA9QHKL+bJ7Sfg9e5ebGXgfvopL+28hAHGDlAuQR6QoCRg/4+gSJKAm8yk
         TypL0UPIZdYPXe5O3rAsvqxyIr20WwbjHl0t8nGFhYdKEpvsQ0uTBOllGwszHc5GduC4
         MiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816448; x=1766421248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U/TX5+BnpmWjuJYnW43/G2VM/NbAbgOGwAVqzwjBIJs=;
        b=BwO/nIcTPXxufw1RD72LxMjvUg0u7Vtok6ns8Eqz7r+3UcBRHzN4HqDnxOXrejPxNM
         GwX9WgoDn/i+jql1AIIfoOPP5pp7Bym4deIM/8KZtyoME++8upd6Az0NO+bl5i01DtSG
         RnC1lXMrMdE9x0amoCGUElMiGGiTB7xJ51eEZWxy3OMU6jmoLZSxO7hRsSQnHIU0GYOx
         P+Ore2ehh3X3XruJ6ZpdIb3mAVQZgfTPnBVEGPICpW99giaRRkmjckWTnMZXSww62fGS
         Mi881RTFe+P5f35ttcYAG/YB6e82xhJEAQOpZf4yNcEsqGbOzUsyV9wIWP6kP0i+VXw2
         I0kA==
X-Gm-Message-State: AOJu0YyE6opaSpIaxW3CzDty0+SbiWEMjRvJ2wCwf1k1XBkVEQZT56jK
	eYrn8jN6akAK1RVxPwYpeR3oSEaluomzhZGhEkQe2l7vnFFxq2ddydCF
X-Gm-Gg: AY/fxX5mCaUp1RoJ259BzvwOV+qbaDZtqw7s+NINo2dmzoUxR2Q1EOuI5GqQRfDFCqD
	x6pVfx7+gcN5JuF24xUt4uUumQRV3j/pq86Zrlxu86F4f/3YmCjf6VYFBZtTRo569ZP6AR7mh/T
	68AQHKiZVMV9YYjbogB74pgmxGecqUhji6XWCo7g0xC4Ksc1LlGCDMIZUM7atrMsHI3ggBQXu5k
	WuQChZG2OEABSxq3XUjmm7W8SdxaoW8LIO53DF5wZD7+K0IlhbM7yj8TCV5ffHvrL56NKi9+8GE
	KEm+YbBXtC9JUEGL9uTcs1yYpgYxR69olRA5YA5NkxEW56v8FttZ10Io5AYpbt+MeKS1ygfg2qg
	TjFgwIgfyNRlaik/VQy9t6ndTBxWvPAJKMh+mQh6DlOD2DaJ5qk6P0l3Ihe0cJ07x31bh5nRjpW
	B8Qfm6QBUafoBA58NWeevOErJz7XTmpoVcJ6eEka2R1zFu
X-Google-Smtp-Source: AGHT+IHYeHLijFzb4sd6fLdedRXslNkS2azAY/KSNM1ZvwwKZmO3lm89mK8l8wexALHzdCMGcxa22A==
X-Received: by 2002:adf:a448:0:b0:42f:b9c6:c89d with SMTP id ffacd0b85a97d-42fb9c6cb31mr8167008f8f.52.1765816448094;
        Mon, 15 Dec 2025 08:34:08 -0800 (PST)
Received: from iku.example.org ([2a06:5906:61b:2d00:f5e0:bc9c:3d69:b37f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8b9b26fsm32609640f8f.40.2025.12.15.08.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:34:07 -0800 (PST)
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
Subject: [PATCH 2/2] arm64: dts: renesas: r9a09g057: Add DMA support for RSPI channels
Date: Mon, 15 Dec 2025 16:32:30 +0000
Message-ID: <20251215163230.227849-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215163230.227849-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251215163230.227849-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable DMA support for RSPI channels.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 8b8ed4fbb599..9587733ce04a 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -705,6 +705,8 @@ rspi0: spi@12800000 {
 			clock-names = "pclk", "pclk_sfr", "tclk";
 			resets = <&cpg 0x7b>, <&cpg 0x7c>;
 			reset-names = "presetn", "tresetn";
+			dmas = <&dmac0 0x448c>, <&dmac0 0x448d>;
+			dma-names = "rx", "tx";
 			power-domains = <&cpg>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -726,6 +728,8 @@ rspi1: spi@12800400 {
 			clock-names = "pclk", "pclk_sfr", "tclk";
 			resets = <&cpg 0x7d>, <&cpg 0x7e>;
 			reset-names = "presetn", "tresetn";
+			dmas = <&dmac0 0x448e>, <&dmac0 0x448f>;
+			dma-names = "rx", "tx";
 			power-domains = <&cpg>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -747,6 +751,8 @@ rspi2: spi@12800800 {
 			clock-names = "pclk", "pclk_sfr", "tclk";
 			resets = <&cpg 0x7f>, <&cpg 0x80>;
 			reset-names = "presetn", "tresetn";
+			dmas = <&dmac0 0x4490>, <&dmac0 0x4491>;
+			dma-names = "rx", "tx";
 			power-domains = <&cpg>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.52.0


