Return-Path: <linux-renesas-soc+bounces-26111-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E01CDCF9B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 18:53:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA9E830517EF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 17:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D97A633C19A;
	Wed, 24 Dec 2025 17:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSZG2wnr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7377329E49
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 17:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766598743; cv=none; b=mhxI8p3unFQoNzwu9kY9xPJji9m7bXk/8M5SCQO+T1l6YhrRHKopmDie6pzn/vBeMixskVYo53Xi4q/N8kGrCilGCNS14GhYpoQGYLTJG5gHAyAJ8iKupmRghgTHznZZDYeiYvgyDrclutwTfqXGlMVcYxAoIR7S3SmZhdwcJZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766598743; c=relaxed/simple;
	bh=LlqGbFYqkHWa3QYtP/wcHCp1ogL1saL7q7uK0E3W9/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G7rB4hHOpZhXzE0JeYLf93D4X2uYUpNxDQDx9eklXlikbMnOX69gsHUHv1mNBE7QHHfcpdPyYKGOWpkFrnWhQ82HeSViiyID1BVFajepz/zbdk+iYvoDaf5tjM5wJYW08tu4+vdqWXmol9R1hzkWf4tw4Jv9dyKB+6jzKXv2zEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSZG2wnr; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so59772515e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 09:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766598740; x=1767203540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNJMua6ZselDA/K5jlMm3u0GStAgByuwzlktfoXO3nY=;
        b=VSZG2wnrTgocH+6ZHdBC9/QrLlrjYM8iiFXPL2ws8U2j8XL57e91jhpUueKc+pOcgj
         YAm2bc1MgIqZR+HVu6JOvYmpMyuZ2KCfla4K7PvGbom2GHCQCUtXkbk3pw/ok40mPYzw
         zVmqBZfYdU43flJNDAScol9kjr/XXrnJEZKfU+vyqJARce8gfzgQm2P4br4Y2RlLQs7o
         70XK7ws10soa9YiTf1wg1qzV1V/QcB/mZCgvUiOUquOe9YQGNT7xlgCNTv84MC93vU9s
         DXh08swPg6d1bJbPOh/4cMUPdjKljHFz17FsRdQxtWzs9SyeQaHhOYkalWGuqK772KSn
         z0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766598740; x=1767203540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GNJMua6ZselDA/K5jlMm3u0GStAgByuwzlktfoXO3nY=;
        b=tPIrbzUi/knMCj0Cy4T+pel0FwZKJkmF7ZyYsGuEvZn2011hMugiSiyPZutpo/T31M
         Flw6L3oicKrd86UoVDIjgAPDsJEZnTBVND204Cl7fEjVn7AJCfC29oU5FgWTm3TLZTzU
         P/UER2XNGt/nsHKvii91XCA0sIxFgeXjnQtEVp/QMQaM1/d09dmwvRqQbI6ltekouAZI
         j+ZlX5jNuLE9GfYmkTF+8FJMs26l5tlBcQ8AjbAD2EcDebLp0ALEa2iCAxgQ3fGaph/T
         zX9x4Yr1HX/6aRRw+Sq3cHZmUr98Qvk25SUk2PcXNB96Lwa1uZDgcI0JZvQS5GawOlNa
         bSGw==
X-Forwarded-Encrypted: i=1; AJvYcCUCi1WPbtsFR4zW2hO5qqv8LNaWQKZBqRqEG+DEUg2RcCZgjCSpEoQ4iCOx5yG3imlQPYGxk/HBmNailvup201yGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFIcuyBsbTW8wHu+0eRc0GkC+bJU4wqxxiMOIzpVP3ZcuFbUlh
	4i/tVLvl/xvNPQYks1Ip9tL97sOxWYCAt0GX12WXU9/kj07AsaMgmMQ+
X-Gm-Gg: AY/fxX5znf5KqpKk1JwVkKKRo2W0NXVLGZveFRjRYs65vJfPv9fMREXyQV2svN1Sifo
	HTViahwDBh4AWtw0kCzZ9fXcb+mNvNplg+xSCJJAOF0nwkisLSaxFURE3qAaKvXT58+KbyByS8X
	OAX7khyyVx6AcyakbhEGLcBVOj8MQN58TywuBJI+3w4fwGeXkRkLu9hCUYL8Z1eWQSMcjjmUFff
	cJWU2oXA6Lcqoic/7kcfAJdRIC2xMYRqZPwS6wPuZjYSn3odnPX+reeDHRI/QNlaj4ZUrOIa+PQ
	2NJjHxXXwZZry3R5Elzk73BFWizPggu4OLB5Brdgusaufvlio+zS6BV0w+T6ORH1AOBRVVr1n3y
	nsMO/8FmVajkLvy6WkIrbao9iEeGSYlRDZJVf4n+J1mcgbHuoj594ZXPTuo5DNvXZ0x6UcFgbIk
	1l+3S1LAEsxpEwVXYkAivgGZS3/AHXg6t5XeLjc8AhBS6rH8ivICoHUkmeowZFdbI5KaBkz7IED
	S78h0ymPr4kZsduHcEPXY3i
X-Google-Smtp-Source: AGHT+IF8m+74SO1T3osVOQ5Ilf6+38hugUNdIgKPgxTKBP6/twvjEVteAYisjoMboSqkNJ46HICfIg==
X-Received: by 2002:a05:600c:8287:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-47d1955578bmr220236515e9.16.1766598740097;
        Wed, 24 Dec 2025 09:52:20 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:3371:7b65:aaf4:d2e4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a4651bsm140167935e9.7.2025.12.24.09.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 09:52:19 -0800 (PST)
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
Subject: [PATCH 2/6] arm64: dts: renesas: r9a09g087: Add CANFD node
Date: Wed, 24 Dec 2025 17:52:00 +0000
Message-ID: <20251224175204.3400062-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224175204.3400062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251224175204.3400062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for the CANFD controller on the Renesas RZ/N2H Soc.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index 9809a6a9c1c0..d76999377077 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -237,6 +237,37 @@ rspi3: spi@81007000 {
 			status = "disabled";
 		};
 
+		canfd: can@80040000 {
+			compatible = "renesas,r9a09g087-canfd", "renesas,r9a09g077-canfd";
+			reg = <0 0x80040000 0 0x20000>;
+			interrupts = <GIC_SPI 633 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 632 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 627 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 628 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 626 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 630 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 631 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 629 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "g_err", "g_recc",
+					  "ch0_err", "ch0_rec", "ch0_trx",
+					  "ch1_err", "ch1_rec", "ch1_trx";
+			clocks = <&cpg CPG_MOD 310>,
+				 <&cpg CPG_CORE R9A09G087_CLK_PCLKH>,
+				 <&cpg CPG_CORE R9A09G087_PCLKCAN>;
+			clock-names = "fck", "ram_clk", "can_clk";
+			assigned-clocks = <&cpg CPG_CORE R9A09G087_PCLKCAN>;
+			assigned-clock-rates = <80000000>;
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			channel0 {
+				status = "disabled";
+			};
+			channel1 {
+				status = "disabled";
+			};
+		};
+
 		wdt0: watchdog@80082000 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
 			reg = <0 0x80082000 0 0x400>,
-- 
2.52.0


