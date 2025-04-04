Return-Path: <linux-renesas-soc+bounces-15384-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD17BA7B87F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Apr 2025 10:01:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A8B0189ADF6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Apr 2025 08:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5178518BBB0;
	Fri,  4 Apr 2025 08:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fZTAsPvO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EAB2770B
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Apr 2025 08:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743753660; cv=none; b=nEuA5yu10k/aXmb3wJGbKNS0rJuSs2t6Qc3h04j/ZFtNJ3fLrMCBPdgedu1tFIRPesJl+CySg8N0exsA8grXVEq3NKcrrVSp8MWU1DNt74GJsr1qjEiFA9kS0iElXIHJkW/7Bif1AKvnCs1JX27PDFksxKZLAOCU7hK2Ychw1fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743753660; c=relaxed/simple;
	bh=pr0/25F8iIEDARQYcJhcKSuVvjTXR5ohp+UJj7cy7aI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=F5cEpvZk8AHlMQhmt3fAGh+ntDrTuMNQmMogmENYP7mQkspvEWo/C+FiOMrbrmKNk9GcfDrgYM0FVnUKkjYu63KecrAYuMXNKsWxeIyh5s/4+oxjRO1SpgmDh6zyJAcTpILyVaURHA6TQ96kuXuN//XY8rccBjbGL8XKlJjJ34c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=fZTAsPvO; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so11621425e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Apr 2025 01:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743753655; x=1744358455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yx20aOl6hxNq71ohoplbiMtIwtQJkykeNvp+f1I4+W0=;
        b=fZTAsPvO4hdg1K/x5vi86Yyu82MnOJceQ3onai+bDz46omGtA+OCKLKnvYrhlu9OBH
         xrkeQ0q1xgIZD+gfX71/gl+wo9eUn6N1KdiAyf4VFDQhoGIN7IV+6ELH3yibzKrmcd9o
         NHjYQCo2Mno8VFIKdPswc/1INaCx8+02HKfE98kxMZeH0Qby5azeXuuJTXnVgTfK4VoQ
         mKZifOTnHzQIM3tk478xfaB32CgI23WtAl3Q9kZ4DxTSUCdty+WXTphypFweNcL/9934
         mFQj0NlqWOLUKD6lXfUd+G8U6AjqEn3DQ4aoNhCDDDllc5XzW9tQsxa2kRmR2/Qkl26s
         u5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743753655; x=1744358455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yx20aOl6hxNq71ohoplbiMtIwtQJkykeNvp+f1I4+W0=;
        b=pioUKR0HIetiZi/8qXMbtXT6Ij8xURL7r2yZiyXtPiI5iQ18gjy2JqHwWQxYp4Lewg
         nFKcE0K1ExvxVuDoCd33/NXTkx/ivDL6obrQTmEwnUvBEEltTcKMGJ9xOsRQv7+W+h3s
         tlJGK6RFjO19n+TRVQJTEoY2/f/RNZOIzOSxnq77O2jMaGyTrkFlLerZJqswdQeHQCJX
         vnNJ+7n2GpK4dGopac0th9/NhMTYm0LA7/5XpslEOFTtdvaKD2qlmFexr1LHKTgefSNv
         9lK645t3lkXRJj0/O0lXd4Nkv6V1YftCO3Nj7ev479kUE2F3GWVqoG7C0yvl20dR+gDd
         cJaw==
X-Gm-Message-State: AOJu0Yw9NxGuJYgCk3JLJ7NtrXidaG69eLT9FBG3L9mpOZs5ZxzZd3BA
	3Xye9xE+p/Z6cgkkX2kvAXE5MRDamXrzVbGY5nDqMmTSzUA4MaDP/7Adn8GwwWgQUJ1EDINA53f
	V
X-Gm-Gg: ASbGnctU6lmDAiX8k7VpRhbwNhfd36MWfpBNYpqP+Ka1fGK3PqGYOv9ztLoWVO8LIRJ
	wmzidnOKJRPX3+EYVoFgasf1cYbimXlLMWTHJq6q5kAk1RTRLBFNbQVxX51kFKH1slUbyOyWZe9
	lV7FzPUlFAzpeY6L/E9O7oDsuS3TgP2zqdwST1lLh0dG09renfQka/FuVQv/lOt3wxtgjRmH9so
	I8taOXYPcdU3OS95OKaxBAZu2PdzfjLWBafMhWA2DRU97oOvclT5KWj31PbYmvw/dFoF8qQcZ+o
	aHjuksgxao7Poeu0hCpSsg2DAGzAEatNHhEjzuCDUkbH1hGgn69DZzvLZAQlV8UBUULyCc5FO6o
	syKw1QpaBNtc=
X-Google-Smtp-Source: AGHT+IH92EJqbZhbFVGJDEY6lA8Jg2sdloS5bO5Q4lOiIY+vLsPpGyrboeSaBmRz18vx/ZTSttV78A==
X-Received: by 2002:a5d:64cd:0:b0:390:eebc:6f32 with SMTP id ffacd0b85a97d-39d1466220fmr1243506f8f.48.1743753655066;
        Fri, 04 Apr 2025 01:00:55 -0700 (PDT)
Received: from localhost (p200300f65f14610400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f14:6104::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ea8d2bc7fsm50496335e9.0.2025.04.04.01.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 01:00:54 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Generalize ARM/RISC-V/RENESAS ARCHITECTURE
Date: Fri,  4 Apr 2025 10:00:43 +0200
Message-ID: <20250404080045.367845-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=pr0/25F8iIEDARQYcJhcKSuVvjTXR5ohp+UJj7cy7aI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBn75GtwXL7vChmr7X6CN1PdBtkkIelvq/R+QaBy PKUstjArYaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ++RrQAKCRCPgPtYfRL+ TiZOCAC7TV74Eg4xchbUyT6fdfyvJy2FDymVP9icFTyJ0jdpcJeSeJiIeLIDmV0rG67gfwtS4jl k75rfRgnth5JJ8AQb/OIibPdiAOY85um9QdLl169kEc6ZJidQQmIyHFa7xeqLm/MwsjWhfG2EiC y/ejXE/CGin2/ph+Y/VbGldTKy8XsCEfFJ3EQYN97dX8oU0rPlLO94BDt+lgTG40bMwGStsO/j2 XhCDSbp6LmgZswLYwXx6bShCkWZPEQAW6CofoDOukTsIjz5NmG46Oe0bR1yQ+WJbT9mcfyN5Cs8 dunLewUFiXcnCJW4AiIaH+IMAJnuSbvmxhSGFTyt00rsnpFd
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Triggered by noticing that the pwm-rcar driver isn't covered by the
Renesas maintainer entry, add this driver to it. Instead of adding it
explicitly, just add a file regex for "rcar" (and drop the one entry
that gets redundant by that).

Looking at the output of

	$ git ls-files | grep rcar

only shows files related to that architecture, so no X: line is
currently needed.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4cc3cfd35665..77155718a9e9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3061,10 +3061,10 @@ F:	arch/arm/include/debug/renesas-scif.S
 F:	arch/arm/mach-shmobile/
 F:	arch/arm64/boot/dts/renesas/
 F:	arch/riscv/boot/dts/renesas/
-F:	drivers/nvmem/rcar-efuse.c
 F:	drivers/pmdomain/renesas/
 F:	drivers/soc/renesas/
 F:	include/linux/soc/renesas/
+N:	rcar
 K:	\brenesas,
 
 ARM/RISCPC ARCHITECTURE

base-commit: a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11
-- 
2.47.2


