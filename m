Return-Path: <linux-renesas-soc+bounces-16707-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 898A5AAC16F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 12:33:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A0021B67850
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 10:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49348279327;
	Tue,  6 May 2025 10:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhgMo3rI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B5D274FD5;
	Tue,  6 May 2025 10:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746527524; cv=none; b=Awo21uqFd6kTiEiI7hm3uWAUFC/HQ8EQydjAxHdVNAfisDpAtw4w96N8ZVXomQZ/c/389DNObPqJt9fAvEPNjvl9oOk3agnFbO+lKMLyfxcH2icfH5d7EOAo7gLYPIzswgXN9JlniVnBLFEPzBBhlYATfUWbStuU0pvh9X75dp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746527524; c=relaxed/simple;
	bh=3s85ntiiNzd5+0+mIcxOAggh52V8eHV2PUMFSbSLszA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UzHLdReUyjHq6YD1S8gHqU0tu6TmDsBscz7HlK+NOV3krth6DCNFR8xF7oDcVX4YniD0rRGGDbLVvho5o5Ycmy0HIg6Lb87XO/Sv6D1+eBgAO9Ma8gbunOp8+Toc+RTi6lBn6hTb37CPYUjTLBC3SldQMnKmWR4eLJ1aiS+u+OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XhgMo3rI; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a07a7b4ac7so2419111f8f.2;
        Tue, 06 May 2025 03:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746527521; x=1747132321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OerV0UxutKOzCYvF95TGs6Kvaz5IA/e67MGn1c0G1iQ=;
        b=XhgMo3rIJcNHyMdpe2d21DNbzyUBveHA8S+F2oqc6fZTisf+auwT4u/zTh9V1jk4s+
         afBzhxtO1EmucEUnx6HUbiNh2jRzCFs9kN6vcSU2zrRho+iupKQOzUl1wFYWJpT93nev
         0+4APdjenfm0lnrOUdl52/GwqOFri+sqSP2RvL1+a3c3y0KI68ljjPCc/h7rUhdOapkb
         trltR9PUNvoUJHimEGmytE0FKQ/TjKhebvE1MHxemeY1cZlmH55WCbSE4X1Bt5oqNHJa
         SZrG2dNiw8LqNYdmCeRQYy5Rq3bunh6unKgyxJ/3SnuBtNdZy4wa5hCwddAiK6svq+Bf
         6V9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746527521; x=1747132321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OerV0UxutKOzCYvF95TGs6Kvaz5IA/e67MGn1c0G1iQ=;
        b=UFOQ9d7pIYfAhCm3fHELg5TNDskDrzjWxoiQ2Rh2U1CskAQJW9RsOMXCt5O91vXikn
         4zQW/je5rVb2kDuDDZEOGjY68sVM1rMK4X02iDliJ7SkAR6ralKSplkR1tXf2g0wocFY
         98LOkn7UY6MisreOtDlcmLQj5b5ZHElo5tS34arIYtp6HrAwwuslquXYEZ7MCKvQCC06
         N/mC/4tK5NQiBTSIxkVphF8Zy4C3tC2I6Sfl9mNOHwKjBcLb+n6XpZPPh6PpewhhW2CY
         t6YsUggdlAsBrE6CAidoFPxTqzwDxN2yjx72gad8xHuspQhtV18GFGvuGK9EaXIKB+9k
         q5AA==
X-Forwarded-Encrypted: i=1; AJvYcCXOHym8r06AzCjEfFSH6JVm5qV7EJO+fNbpXfnZAB736LC8PhX3yXLe5Th7ArbpBMNz89k2nfEUeQ4Fk1omK7xpa+c=@vger.kernel.org, AJvYcCXXCFxMr6N8E2kDUo0YHIez/Mz+jtkJ/1tM2WE/6i5uNGPNDXjvoB1uPlVZ3n1lBu7ckYbKKw6jXcTF@vger.kernel.org
X-Gm-Message-State: AOJu0YwVHgI/Z+qGGZgWbQGisPQ13YHKuNsyToLDV8HpO0wjXkF9Bhmq
	31OpIdII7JarCPc7ScIzSGG8oBHl+cnwWs4HQLbupPzoiFxpEUSJ
X-Gm-Gg: ASbGncufy45ql2+HNY6+r2VHqiq3xTfGT2D+w5REQwJiuUv6RCzPXOFg8/ugyBuPRJI
	/5iWx206iBaaP6BWTreDxh93XtiuujKIhq72QLsGNzPebG1jSBMaWPy/0XGUNcFo5HxYXDNibRA
	yb6iJeia+JNcJDzogj8B+f2rvqpALrcQC6db5X02z1f2tnx0CvysEInN8K9cQxiA0fYg0qmj/EF
	EUTvn4hoFIq4obxRHPJiV+v2YkLSMgonVpdw6PS40m8OmDzqOUECg1Zm1sxsan4KM8s/SPYALjc
	enFmnaU6WWMDBi4jREpru29mpEENPBXxNFeFRZbywZRpNCg585C2/CLYre418TJ6IA==
X-Google-Smtp-Source: AGHT+IErh7yQXsQGDQe0taMpsU2js1b5QKttN2MDxoVzQ3fdYdk82BR9U6VsLRzI3uXhnHgTjePkyw==
X-Received: by 2002:a5d:5f41:0:b0:3a0:85b5:463b with SMTP id ffacd0b85a97d-3a09fdd83bamr7522458f8f.48.1746527520309;
        Tue, 06 May 2025 03:32:00 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:26ec:c7bf:3d4f:d8ea])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc469sm166148695e9.6.2025.05.06.03.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 03:31:59 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 2/2] clocksource/drivers/renesas-ostm: Unconditionally enable reprobe support
Date: Tue,  6 May 2025 11:31:52 +0100
Message-ID: <20250506103152.109525-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506103152.109525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250506103152.109525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Previously, the OSTM driver's platform probe path was only enabled for
selected SoCs (e.g., RZ/G2L and RZ/V2H) due to issues on RZ/Ax (ARM32)
SoCs, which encountered IRQ conflicts like:

    /soc/timer@e803b000: used for clock events
    genirq: Flags mismatch irq 16. 00215201 (timer@e803c000) vs. 00215201 (timer@e803c000)
    Failed to request irq 16 for /soc/timer@e803c000
    renesas_ostm e803c000.timer: probe with driver renesas_ostm failed with error -16

These issues have since been resolved by commit 37385c0772a4
("clocksource/drivers/renesas-ostm: Avoid reprobe after successful early
probe"), which prevents reprobe on successfully initialized early timers.

With this fix in place, there is no longer a need to restrict platform
probing based on SoC-specific configs. This change unconditionally enables
reprobe support for all SoCs, simplifying the logic and avoiding the need
to update the configuration for every new Renesas SoC with OSTM.

RZ/A1 and RZ/A2 remain unaffected with this change.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Dropped config check and unconditionally enabled reprobe support for all
  SoCs.
- Dropped Reviewed-by tag from Geert

v1->v2:
- Instead of adding config for new SoC, changed the probe condition to
  `CONFIG_ARM64`.
- Updated commit message
- Added a Reviewed-by tag from Geert.
---
 drivers/clocksource/renesas-ostm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
index 3fcbd02b2483..fcf7ac35a9f1 100644
--- a/drivers/clocksource/renesas-ostm.c
+++ b/drivers/clocksource/renesas-ostm.c
@@ -225,7 +225,6 @@ static int __init ostm_init(struct device_node *np)
 
 TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
 
-#if defined(CONFIG_ARCH_RZG2L) || defined(CONFIG_ARCH_R9A09G057)
 static int __init ostm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -246,4 +245,3 @@ static struct platform_driver ostm_device_driver = {
 	},
 };
 builtin_platform_driver_probe(ostm_device_driver, ostm_probe);
-#endif
-- 
2.49.0


