Return-Path: <linux-renesas-soc+bounces-14938-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB43A73E9C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 20:33:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10B1D189EAF9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 19:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C7BB199931;
	Thu, 27 Mar 2025 19:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQzRLH41"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B3528EC
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Mar 2025 19:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743104017; cv=none; b=pypOpF34B78WiL9cdXbsXHExjdzY7TtjUH0jQ1tSM4k6Vp5QD/YBlrfHziGkRa7hd3n3koiXHD22OQHltFwUhr3AmXxuBmPS1fRowBXxWuwpHQT8ebUCT2QuulR0AIhOfYnr4NKUfgFhSHPvH5uzLeP352uDHaUVwh+8ZKnjFP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743104017; c=relaxed/simple;
	bh=1hxZlJlbksf/QmuEJQVMKZ5YBokMVWiTiXg7HaG0Si0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qpE21Qz0NVYosxrmbcFwz7MP8jLjiY4Fnjtbd0Ah6keguIdRfP4auNvKxq01J9hpIoyjov1MSynxCR8jZajDxrX3wz5oLwPQPyuroA7xIhfxlU1hK2gzHxWmOBWsn1PE+3AQBO4LK+Y1XLL7467Ukz4z6R8mpr8ED+BwavYOgY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQzRLH41; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso10693345e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Mar 2025 12:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743104013; x=1743708813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWc47S7pP+OQRntDtRg36BLOwsvM/3EnvcqNk8Z6AU4=;
        b=nQzRLH417ielcUBNb3OM3SH/zWOmJ7Zsaqehk94mzDuUnAG3S4lEpggLKLvD25UBhx
         9dLUyEK/BeTI30rbHgfQAeUiiOuGYBNUCDX9MjKEqf7JYbZfp0vVhQRDaXcohC7/a+kL
         sG3Oiijm3OChlhuSO4xBtfpsb0DEnMV8JLNUZfXkN86okbnEQxZgi9QObL2ge4AKmZw3
         fkN1H8Jem/byMuNXYCg1gF2DlyxjbX56bOy0u3z4Pv2SN1mjn+IpUmyZvctNsutFNa+C
         j2YBkD7jXYB26NQFOaBmi4PBfUhmtSYrfVXMJ8Y4PdYYny/cYsO0cPP71/4T3m33MYBO
         w9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104013; x=1743708813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YWc47S7pP+OQRntDtRg36BLOwsvM/3EnvcqNk8Z6AU4=;
        b=cZqL2aONhGuo+h6RELmLT0cJpGFvxeJCh2Vha9BFzDySjFq4x9Ar2+pQ45ITSYdfhN
         jCVoKu34ip7fHr6IDSN8sy13ZF+0eFbgPCclwL0DdfrSuwi36I/SpG/bzLgXtRWJHkbm
         QWkZ7f/UO88ow4EVnonPeIBJj2q55LIaHV6ZVW2Xj7vKkBOSS4XBp87r7q03VhbjDB44
         0BEOn4FJ41nKdJdlZWu4bGpxiOnXp9bmPO3cSEd++y5RIFHbDTwpjFzC4kXRIN1f6UQS
         H1SaLpIm9i5Sf2UI/iEhSFM6SCych27wvp1MTqCueD2M1sJvhjbmlsVTKAc/kVAH9Q0L
         anIw==
X-Gm-Message-State: AOJu0YxtVjgBFEDQgHJ71q+3gSqdSvaiiu/1d7S8rB7LWBPYACSrEH2M
	2mnszdy/dXvI2KTjHCW08d9ATyzbuDBrpUf6kFQEo+RD6BQKELHC
X-Gm-Gg: ASbGncuWWKW8v1YoTQD/TfltUsLRj84wLeZIiAdf3oQcjL9IZN5Sxa2sIkD8bD/eoG3
	3fhtEO+bSwhbRdRpSkvW7iIi8FLo2YObHS5gubGpB8T341AVSkSQ/paLuWQd5Sk7tG/g8YrNtAv
	YIVUBd5kV3iBgpGuSmmTn3YjquRACFan6GGgLAFlOgGtJsfPs/9cPrfze3hVC8m1+7Ehkal8U5b
	9knDVAVP4R3sOA0hJGyafJPKLh5qRXtFT87sbN6A1D+hLg3f5Jgx+DwusdlaNym6A/kOBJqitZY
	rHxdbTEcGKoqQaqArMbnkezNlCGPRjA4RXnl75MDqpAIT0IG73QpDX3RLVoWi71dhKGHeOLXray
	hCEwY
X-Google-Smtp-Source: AGHT+IHSa3Rvbtxmy6MBKbci/rDshJzhq3HvLdC1DNPwWJxRIb/rl7GlZjZf2h31BpeGlYnMK34bGw==
X-Received: by 2002:a05:600c:1d16:b0:43d:45a:8fca with SMTP id 5b1f17b1804b1-43d8528c74dmr48083895e9.30.1743104012681;
        Thu, 27 Mar 2025 12:33:32 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:c36b:2e01:9e11:8d7d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d90001531sm4039265e9.40.2025.03.27.12.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:33:32 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RFC INTERNAL v2 3/4] arm: shmobile_defconfig: Drop individual Renesas SoC entries
Date: Thu, 27 Mar 2025 19:33:17 +0000
Message-ID: <20250327193318.344444-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250327193318.344444-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250327193318.344444-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

ARCH_RENESAS is already enabled in shmobile_defconfig, which ensures that
all ARM32 Renesas SoCs are enabled by default. As a result, explicitly
listing individual Renesas SoC entries is redundant. Remove these entries
to simplify the configuration.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm/configs/shmobile_defconfig | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 8c30ed14e52c..357cb144150b 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -195,25 +195,6 @@ CONFIG_RCAR_DMAC=y
 CONFIG_RENESAS_USB_DMAC=y
 CONFIG_RZ_DMAC=y
 # CONFIG_IOMMU_SUPPORT is not set
-CONFIG_ARCH_EMEV2=y
-CONFIG_ARCH_R8A7794=y
-CONFIG_ARCH_R8A7779=y
-CONFIG_ARCH_R8A7790=y
-CONFIG_ARCH_R8A7778=y
-CONFIG_ARCH_R8A7793=y
-CONFIG_ARCH_R8A7791=y
-CONFIG_ARCH_R8A7792=y
-CONFIG_ARCH_R8A7740=y
-CONFIG_ARCH_R8A73A4=y
-CONFIG_ARCH_R7S72100=y
-CONFIG_ARCH_R7S9210=y
-CONFIG_ARCH_R8A77470=y
-CONFIG_ARCH_R8A7745=y
-CONFIG_ARCH_R8A7742=y
-CONFIG_ARCH_R8A7743=y
-CONFIG_ARCH_R8A7744=y
-CONFIG_ARCH_R9A06G032=y
-CONFIG_ARCH_SH73A0=y
 CONFIG_IIO=y
 CONFIG_AK8975=y
 CONFIG_PWM=y
-- 
2.49.0


