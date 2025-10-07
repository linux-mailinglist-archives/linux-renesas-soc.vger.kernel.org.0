Return-Path: <linux-renesas-soc+bounces-22748-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA1FBC1566
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Oct 2025 14:16:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D95254F5360
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Oct 2025 12:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F7EE55A;
	Tue,  7 Oct 2025 12:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L5PTt/fR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C392DCF5D
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Oct 2025 12:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759839341; cv=none; b=dWBg8yCmOYLRI830q0kVbKJveRM3FWfhZo++V4SDC783mwxyigOF5zkyru0AMR1h7XRnHUVFTbbczARWZjqByW/S64HRUtcuUNe3Hq97XH/1JLEiTap72hSoN693q/c+cxx3KJSGg7iGtdK9n4KkUwhqFiW0x7xgeoFRr/rOFCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759839341; c=relaxed/simple;
	bh=jE5Y4osDC+P5h48du48IVUkyowJxZGZE4qvBYfy1Jok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ee+dNorkfgTQ1VL8ARidBxfWZ/1zPlnmcf4bVPTDdkv0JedBBkV8tOAfqewp5j2dV/+DsQgPy+ZWupi/daxeYOSBbPdEY+HRpD2ckbIiKPj1s2Ko9us9v7ElFLvwO6CO3ywhsHJxsgXL0aCO21FZlwILcM3Ov4EzPTK/3CQBgYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L5PTt/fR; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3f99ac9acc4so900392f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Oct 2025 05:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759839337; x=1760444137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxV2LuC4knXLNn0oldAJSchipN1qTRUO37h3RaQ5WvU=;
        b=L5PTt/fRfOJ96l8poNIovLWJzFxEZKcIq96vE90JByxy6s2qy3PqfC/CAjK9q1+c4L
         FFTg2bBx1+0xfIKxcWOWKoofmHixNRJis8TX493QF3IWWV9W6Pa/ma3uuuHVJoZyG1Y3
         p28hbpmIsSKvlUNVX1x5+qoWopKNLP2M3EdOTuWt5QRbbb4N5fXtpIiHZqY02RVuH1f9
         t6i6LVEqgBikNKZbgvnDU2A5MbA1ZWY1Tnx4nt0O/UjBuLBXt6rhwVRJOW00OHI1/U+M
         NTMY3CFjGvj2TIGqgfrVwEBhqeDA9sAsSWDrBhRATkm1XQEugfMsnsiE2H8JIftGJ4ik
         02Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759839337; x=1760444137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UxV2LuC4knXLNn0oldAJSchipN1qTRUO37h3RaQ5WvU=;
        b=Oah4pPsVLwkZwqD/OVSZ1orSifvqSCtVgU4q4ZGUnxnw7rjCfFzzTV/2hczJKuVE2M
         5qwQ/7hOf5vDUzYBDFaj+zuAcMSiYWJ3NHPUfJ94gPVkthot3ZZ5NTyRZrvwxsUGhrzM
         OnhAnKTlaz/+mHj+5+I0GO2Baj2B/nS0Bk9AM/QrHvlFa3Wi/xbqpxWTd0eDjaJl9N5K
         pEEZwXOI8S+RQXgpovDuXP7Ckne1tbptzEob2wvUCdqcYFfGKOLWz1MpSOb9ZYmxhWY+
         QujmdT5+uZPaD3seRxVelQI3JbvguOsl5w9qGn5jEurjJ+nLM/unTqZn3Zlz3Gz7r/n4
         LKDg==
X-Gm-Message-State: AOJu0Yz/I2dMKV8bh/ABLJkG8Z7Q5/21dH6vxAtQCO87/qeNU1JSU3Ph
	KTtCWCu9tuBn564ZbueASpgpKDpXOHStKyEkO/242NIGz5zHgRRVfQ3y
X-Gm-Gg: ASbGncu/6X2fhwNvzm0dPjQoRrHagLeCfRnadzlgCCzAGsPgfvismCx428cpoRUKGnp
	xtvrbKPZQqncE+Wpksh5TZK0eCo6a1IRzTyAtI99E8h76xAUIuWfJyQEcgKA38DtVYzwBL/oRfn
	tB3M3haDACoSoDcIZmc31uv9MzYJ3AK7f9t4OB9SuHPBjPZM9BQre+vRhTQbvgEFQCEUTGgQjUR
	2vqezjDs/p/2TlJraEiBKkbv02yhWTbwk4qXNJBLieXBXB4a9wbBw9MHnooHCMoZY9fN7BAMBPk
	b/7vO+6jmZUv6pX4KoH5mggbBweUkCwJVKHE1oN9bdqVY974jFV7XvN2E0dBHyRZEQPtCCjWEkA
	QHrLdFVHaI7PbKGflGFFJuS8VLwbdgE881YYAE153DDk0C/fTX6X5+IL4vzz1Pwfc4zRoynxgD2
	g+qaui
X-Google-Smtp-Source: AGHT+IF9KlIFhnybD09Wxy3QuXwNIOtzoAtHacg13oKGF3oEvjFMihHxLGJv/GK57sI040CCkcmmmA==
X-Received: by 2002:a05:6000:250c:b0:3d1:c2cf:da07 with SMTP id ffacd0b85a97d-4256713ee35mr7992344f8f.4.1759839336467;
        Tue, 07 Oct 2025 05:15:36 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:9667:4f0f:586a:20c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8a6e1bsm25590167f8f.8.2025.10.07.05.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 05:15:35 -0700 (PDT)
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
Subject: [PATCH 3/4] arm64: dts: renesas: r9a09g077: Add Cortex-A55 PMU node
Date: Tue,  7 Oct 2025 13:15:07 +0100
Message-ID: <20251007121508.1595889-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
RZ/T2H (R9A09G077) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index cb16fe194208..0086f7953cdc 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -65,6 +65,11 @@ extal_clk: extal {
 		clock-frequency = <0>;
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


