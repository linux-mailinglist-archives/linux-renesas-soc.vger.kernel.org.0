Return-Path: <linux-renesas-soc+bounces-7522-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F7193C331
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 15:42:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8B911C21824
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 13:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1084B19D07F;
	Thu, 25 Jul 2024 13:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dl5q54JH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EAD19CCF0;
	Thu, 25 Jul 2024 13:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721914882; cv=none; b=JTF7FKehArvcInEydwXqw98LdU8T81J76zYGLzS4OPND8E1LR0MCJU0zThCvVwcqn8ez2Bf7u2gKDoILWde0YhGZMR37gsq9vXR+IVWCNUNOs078GgWznLORxADbfiect/GZYkBr+pQYGuXmGLt4zvzgC9q4S4/KL4u4yTRkbDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721914882; c=relaxed/simple;
	bh=vuUOMtKfTG6W3EqD2raRYWDKcefa8HCjilFIMzyTtCo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Kavw1gVjqfJyHbevPCCRY38pJfbmTcezKAagLPDjKTMk+1d6OrxQ09YUzXXekzNbkO64YKhLXkhQTrXXgWbCvhNXr8cofCRLkhGTUU2ksMuygmyqaMMEcOtSbB75UCGYts0tQmU0VSB3ryIa6Ex8BjXX4SZ+B6JC7wey4EZxEAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dl5q54JH; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3687ea0521cso644059f8f.1;
        Thu, 25 Jul 2024 06:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721914878; x=1722519678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lcg8M7spf8nRW+D7oxsKP57WHlbsMgBxOasm0Uk3IR4=;
        b=Dl5q54JH9lysYa5TQiryh/loHYSKlxcPxIOIU0Zq05oeoiFIF1bvyKqxTh/572A/Zw
         UHJn/E3i0B3qhoT7Gp4opgT26G3q/GbnnxpEDfYHYxyZ/ryUtf4uHP2WXbMnSkaUbEA9
         gBnTeHucHZQYyb1zm0sJkJGTCRsP0koeFdBFmLtEcuN4l4y/+hx+oJfbZI5IsnEv2DEo
         B2X/ANkvHRNsQwDab7V6Blm+OOUQdH23yTp1N2GuDFBgevqE7rakPePMsVGQ9EkQgNIy
         IaQOdGdTpKxueaVbhaXd2QpS19HHF+CMMe448pfGGrfRETRrrmn8lH6n/Sn5Um2llVgP
         MLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721914878; x=1722519678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lcg8M7spf8nRW+D7oxsKP57WHlbsMgBxOasm0Uk3IR4=;
        b=ShJHpH8FqkBnZYsDZ6qwn9cygnRbfp1EbvwQ2F9V5mUasEWurS5vNne+r7v2QnCQAd
         Ena/bR6t4vw0ej8GOcLbNuUJQq+UvRoOCV3Bp4LB4ZBwdjX+OxsXLXsDYy7/DBxWZlPa
         NjQQCCX6W7mXiPn2U7qGffj2rvpKRZlHBg3vTVibv3v4J+6WKUATpuuQ44pJJfEcF5hp
         gZm0GgplwSzilYS3Hncfdv/DJN9E8EfuAPXroGUVmskReM1NSoEjc2riE+pb6uP0xRWd
         oYyKkiHTKkJCXY0noutkPsuCwW+Lb0v9sUy9NQKbt1oMl1WtxqMychHD1WQh/F3Kpcin
         Qymg==
X-Forwarded-Encrypted: i=1; AJvYcCWw1OVFgXL7zZsEVPhWSmZ8npRmOe2xTCqjD2Y6XMARQrO580LnfBdHhNLzPRMovjbcz5eZAjCdt0wne6ic2vK6DS4UfN9WWG65ISQa3UzDDYqKuG3IktXAUtLHZofLrth6YQwvhdAorQ==
X-Gm-Message-State: AOJu0YxxYRzOv0HyrVdJTHP1DBO3mmtl36iqv236UTO7ag4AGmU6yS/M
	1K1FhBqaPdSHbl6JPJPLEMRmjigXPK3iDoX4/+Iq514KBz/ODKOO
X-Google-Smtp-Source: AGHT+IGM59lR/GHgnsxRjJrJprpXzHdKBYAyFeRAdep5H4deZuR0bqaPnT9Vx7C6EqzyT+FwmTFOKg==
X-Received: by 2002:adf:ce84:0:b0:368:6337:4221 with SMTP id ffacd0b85a97d-36b366464a7mr1655398f8f.54.1721914878246;
        Thu, 25 Jul 2024 06:41:18 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f93e605esm80447085e9.34.2024.07.25.06.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 06:41:17 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Marc Zyngier <maz@kernel.org>,
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
Subject: [PATCH 4/5] arm64: dts: renesas: r9a07g044(l1): Correct GICD and GICR sizes
Date: Thu, 25 Jul 2024 14:39:31 +0100
Message-Id: <20240725133932.739936-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240725133932.739936-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240725133932.739936-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/G2L SoC is equipped with the GIC-600. The GICD + GICDA is 128kB,
and the GICR is 128kB per CPU.

Fixes: 68a45525297b2 ("arm64: dts: renesas: Add initial DTSI for RZ/G2{L,LC} SoC's")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi   | 4 ++--
 arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index d3838e5820fc..c9b9b60a3a36 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -1043,8 +1043,8 @@ gic: interrupt-controller@11900000 {
 			#interrupt-cells = <3>;
 			#address-cells = <0>;
 			interrupt-controller;
-			reg = <0x0 0x11900000 0 0x40000>,
-			      <0x0 0x11940000 0 0x60000>;
+			reg = <0x0 0x11900000 0 0x20000>,
+			      <0x0 0x11940000 0 0x40000>;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
 
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
index 9cf27ca9f1d2..6f4d4dc13f50 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
@@ -16,3 +16,8 @@ cpus {
 		/delete-node/ cpu@100;
 	};
 };
+
+&gic {
+	reg = <0x0 0x11900000 0 0x20000>,
+	      <0x0 0x11940000 0 0x20000>;
+};
-- 
2.34.1


