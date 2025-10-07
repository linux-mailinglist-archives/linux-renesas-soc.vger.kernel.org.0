Return-Path: <linux-renesas-soc+bounces-22746-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99821BC1554
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Oct 2025 14:15:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C37519A16C8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Oct 2025 12:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFED72D94B4;
	Tue,  7 Oct 2025 12:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VpDTyQu9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE48E213E6A
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Oct 2025 12:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759839337; cv=none; b=tsm+CbVbG27n8YMEgpv+kS6h3xAz1JchQuH2XPODdhOiLR+ip90EVAi7sgp7GCui4Ru+r8LFgEQBj/A3JlyeYlLGhIhtdVwjMUIzv3qYOrSWQ4WUXK3cFwUQc9CXed+9tqMhEmuaURQcyMXKR53FU4lFdFP2MzM03ES1YS7e1eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759839337; c=relaxed/simple;
	bh=o5Vm8gv/dWeltWLOsORUwUcohSNsrHZokwCLzeCB6FQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RXjhkZ0RIhsaamUkWfKwufGtk2GMtX/6YmXjOihM2oHX7TIQxDqP6DPS2FzK//ojI+IFk1QMh82bA4LtLVAzctiukRNK3Uwaz9cgDqf09D5gckJihpB3wAvvZBC/liSAtTs69PuxQbhIZLH7JzL3avyfR/KQsz4mAEhbiGGNdK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VpDTyQu9; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3c68ac7e18aso658036f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Oct 2025 05:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759839334; x=1760444134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cIGcPIO4pwJ20cio+6iwr0NsYTVXlvXAH4qCjEgK5s8=;
        b=VpDTyQu99fTTtxRrOKBXxBU6JkeZecg6qCflknFXz+4xjKxdysLy1sl1ZmcjETrKnT
         rkYd8f6SXydfjw/XHlKgCFtdrhCMhrBAlW6ctOnGhry3iYths05MORWatLl9d8UZPebW
         Y95u4DF9bVIi22EHZmSA/QhVs5Q2akD+CACH9TJ1xuGF76OqDqABfH3+yTgntemeRmRJ
         poU3HuytyvNc5cdQAL6vxQBdkmqQVgaNeKAADVh75hgSiMxNiqRQuz18NwvtvG9I57kI
         Tt4sEEWfWly5kLtgpg2q3vvUh3Q+IXR2IBBlHvr8kgPTJltckWwGFxP+C3BhklHec8GU
         Uj8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759839334; x=1760444134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cIGcPIO4pwJ20cio+6iwr0NsYTVXlvXAH4qCjEgK5s8=;
        b=eE0iziHDAhlIU6PT6lH1yoNW1uyWRQ4rIrLt5M6V/c3KW93nX4RHFhX1ct1L1GY8fZ
         Tn4CFV3iNhzKIL/53vFiAEba8+s9QSEWg/pQgCP6Y9dWqj+QXXtO/WpLLmbA/dbGdhKd
         gE+53OBJiiKFHf+fLlcPBZ2VuMIXsmIpDF//FuG5rgr/iytaNjFHdtJ6hXSpS2BpH3b1
         +KfcqDJJ4sSJEPXT3hyB5qmq7QgNIrkjAc6EwfqWLpq/1nbqswCN3QynSeUCQBXV13do
         d8/PJLnijgTbRkx3FITkffUDjCQTqVmQO4YnGU+yCZsxFAFFXpeS+jeP2ICAY0NkjRd2
         SROw==
X-Gm-Message-State: AOJu0YwrMzTb9jZDOgxyg7B9+O7qEjE5ADaV9v8VG0rAaytQF1G1pUCh
	P8B6P4kLo1XqsxYMwETGzVRIOtQrFU5f4FuLJcI3QWV0ogenztvJ7bLvprB8cQ==
X-Gm-Gg: ASbGnctwQk4D478uztqmgbGN15+am3HbSbUwbhKEWzJL/3+Na0UHFtQZOEcuA7uVJBW
	Ln7ZsIb9vhTMpOsq9cGbcNeKCo6xKy85p4ORiRgDL2/bJJmp7bnLiRMOUDdQH4YVGcS5nIYuIGI
	o+Rmi7v+IPHRVCgrD6ukhKGgxLiGYjKgQJkNPI6fyBYlvuOU5B4paaE79qNvF/hkxm2vgIDw1HZ
	8PP/aCtdiRoLwg1RICjHM/okJwLRcYhHNmaI1z/SgWtOOD3siZaTeASyeHb+AFGb6xLJFD6R7qf
	GH4opEyEbrMyc0c5F2zcspv5uasi4x5ox9e1aiBwoA3t1FCwzlp/UEFjGPLEmEUiuDM40NYCVNX
	BBog9v17FxmkXRkpqLExQLke5uQSkUIUfFxPKLGZKh43858Q0ogXyVFJBSbY51DyXH79QbMx0Cz
	AqmN29
X-Google-Smtp-Source: AGHT+IF2LSiQFvLIeEfaTgaJIYpO93EW0f1AR022pw4muAjwpr+/8fuU227Foup3a7Fps8cCIR+d8Q==
X-Received: by 2002:a05:6000:4305:b0:3e8:9e32:38f8 with SMTP id ffacd0b85a97d-425671512f5mr11397546f8f.14.1759839334129;
        Tue, 07 Oct 2025 05:15:34 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:9667:4f0f:586a:20c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8a6e1bsm25590167f8f.8.2025.10.07.05.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 05:15:33 -0700 (PDT)
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
Subject: [PATCH 1/4] arm64: dts: renesas: r9a09g057: Add Cortex-A55 PMU node
Date: Tue,  7 Oct 2025 13:15:05 +0100
Message-ID: <20251007121508.1595889-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007121508.1595889-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251007121508.1595889-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable the performance monitor unit for the Cortex-A55 cores on the
RZ/V2H(P) (R9A09G057) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 267fe91b31d9..40b15f1db930 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -135,6 +135,11 @@ opp-19687500 {
 		};
 	};
 
+	pmu {
+		compatible = "arm,cortex-a55-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+	};
+
 	psci {
 		compatible = "arm,psci-1.0", "arm,psci-0.2";
 		method = "smc";
-- 
2.51.0


