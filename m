Return-Path: <linux-renesas-soc+bounces-22747-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5CFBC155B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Oct 2025 14:16:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 344C119A14CC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Oct 2025 12:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5C62DEA6E;
	Tue,  7 Oct 2025 12:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KC0dMdeK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C3E2DC76B
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Oct 2025 12:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759839338; cv=none; b=hP785lBHTYaeJrDvjoUcBQKnI7oeA9lXerPNcqjUM01Y4ghruTmvXG03Rs6bOVx/RqtWrV5k6ht7fqGwtNLOcCkIq11pc/JQ0/gETvbQErLrW7fIs1BvhUNVZnRq/t+ivP8OKfFCHIq2mA6pQASuCFC6o0jX2uxUaU3gfAQcCGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759839338; c=relaxed/simple;
	bh=WTfNWiSUHE3yzT8NN8B4cyL4njh+KYmZ9d7q1pyxDug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KObhl2iX9mLfH60iokmL+6eWG4p9v1Jm3cPLnghl0LXahhSE7LVOhPCpvDZQmf7fDh7uOCCrclZbgUBP8qNwjf/1O2cJlm2ZcS/jbAT0APbt8UPQ5EqnRBEcAWUIbhVf+O8Q0W7sa2+PpEZ0bF3VtYhp/vODRG9JOoBFCc/cWhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KC0dMdeK; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42421b1514fso2913727f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Oct 2025 05:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759839335; x=1760444135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=euhEJjeobLyj8H5iJ33FXAElxhlSOQw3IhaD7kRk93A=;
        b=KC0dMdeKkdMPtCuP0yAVJKsDK2wsXOF+UQ2yZR881BYhQ+sitWGuEeNg8dsILXfn4Y
         8cuVaw0ASG/t7Z/he8jEvqBu6CjPBV53WrF/cm06ppYyfBNrZ6hBi/kVtrjGIl0fMHFt
         FjSwJknvLfRCNWCYChSTugHHkFJmOpZmcjmn95ENEfMI/ohEWr7NYou5hzGSdGzudP1d
         SuPKtbA/lWrDn0W7ycaEffulNv6nNq9awDEt3fvIAWFiTvVA782hzCfQHIo3ArxGwFQT
         6M5VHIPxdGhars5Wbeiyk/WKaCg8gPAkWEKzBnLwUrar/gFFEhoZz4UF2j5dpzQLdeWk
         4g1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759839335; x=1760444135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=euhEJjeobLyj8H5iJ33FXAElxhlSOQw3IhaD7kRk93A=;
        b=xA3xiVk3FjKm8s4OlVZyjRwId66Cl46ORqQF5eXSN8mNfFpp1NH0MFzZVe4nlQp6nc
         FAxx+2g92uk1bFO+aDzMsiQ27AkcuDO//tGnxHrPZg76KxSMDI8jEhprXfAtQ379hV9t
         tu1tmW/hpJDTYf9dvJF4iapfBZXsK5GV9qrwTzUmfBQzSVVcSD6HU/qLoXKXfXw+KVMB
         EXDWau+ZVa0BaMK5wLHEFBQWV0Ijwp0igJgyTMPA7Db5MJBhHXSAuSwe4XY84Qe8akC1
         +lbEL0El0RJTMQKr5r9XemJs0cLiGevakOUg7ntsX2OXOYVWaTzB51OHHufHqOQdTMlc
         yv5w==
X-Gm-Message-State: AOJu0YzKpm3+J5jLxDK36JcCbuPqq49hlKpxCGbNC1aadx37TlSSQ8Yf
	J9EHfTvZ4w9+7TilRhrRDr8U9MBxTiqZ3gt/gW3Eka8U/xpMNtSO99wk
X-Gm-Gg: ASbGncsIQBDlmG6hra82umV3r8QR+nMS+W0QRdlsdln6IKLzhOxcQicIYRTQHdR9iVQ
	Poj4cG1GJh79jD2Wyf8cnxGWv0oDoeSnEczdtjmih0K5D5CIbz4ZGM7vP+KBDgc32JuLixk7zcs
	CQmoPYY3sKcSY/bVVrYeSSRNvuUUGwb7bhlERACm4lwI5i25OJZGO5QDQMCcX5vQHQcOZJhfy9L
	FLoMe4XoEgCHlSnQwIP3UYxFNhO/f/3jmSdaL34PtRyPG9zWKF2pkDSgtQA44q4BsE0goMAHB2n
	/RIlvxIjX9YAsRUYBidhNGMs+S6bygrtJwdG03moM9WteDCUZ9N33KZDZsVQ4GR+lGr1QW1vcUD
	u5RO59sgOZUD4O+s85DnYRWfKf3XYcHloq//BtJLh0Sh3FTsECUqG0StVVwjDEMMfO6jTjBzp3+
	YzLaHL
X-Google-Smtp-Source: AGHT+IEWjOayRTPZVPnsMccxbWYDGiMC1YfpjgyiCNEpc7Zo759zR8e/RAlhpAfbAmZEfuj9Nojr1g==
X-Received: by 2002:a05:6000:4029:b0:3e4:b44d:c586 with SMTP id ffacd0b85a97d-4256719e10dmr8954404f8f.34.1759839335308;
        Tue, 07 Oct 2025 05:15:35 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:9667:4f0f:586a:20c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8a6e1bsm25590167f8f.8.2025.10.07.05.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 05:15:34 -0700 (PDT)
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
Subject: [PATCH 2/4] arm64: dts: renesas: r9a09g056: Add Cortex-A55 PMU node
Date: Tue,  7 Oct 2025 13:15:06 +0100
Message-ID: <20251007121508.1595889-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
RZ/V2N (R9A09G056) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 9d540aa4d10b..8781c2fa7313 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -153,6 +153,11 @@ opp-19687500 {
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


