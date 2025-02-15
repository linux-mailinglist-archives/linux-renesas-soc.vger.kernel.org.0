Return-Path: <linux-renesas-soc+bounces-13188-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9922FA36E74
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Feb 2025 14:19:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DC063B1EF5
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Feb 2025 13:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34C31C84C3;
	Sat, 15 Feb 2025 13:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="lxUmLtrK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEC478F35
	for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Feb 2025 13:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739625531; cv=none; b=WCI8eQKBU6tUwKkGIjLH9X4ynNe8KOsYI3jRE2IC/EnnplyLllOSxdoRKwtPnjnYPbLXthQ7EKIlhG2ZVLR4PJm6r40foKvTr4GCp4z+WhQ5qpiYsyjE1lWpCN9Oy2eFtPcaFiNFU3Up9FF4NuitoYRzTWOcNpvxZMhGbRfplrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739625531; c=relaxed/simple;
	bh=b6icX88GUI1+i0qFjXdViO6fgfTNslKBapLU99JDsdM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nG+k9ZEFG+XLxLNGosDRbdwVz6lqmjusZ07eeOtjEz+LEb/QTIsgyT+KqPow98klydbXhF6BNOiCxz83VRq/Or2s14ex8z5GBnIVWtDRzBLq/iLxxexcOBwY8SnQObDTRgKmhXVvcO3PfCjJRx475BohX6LUCKdrbHiEb0nw+fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=lxUmLtrK; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5dea50ee572so4357150a12.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Feb 2025 05:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739625527; x=1740230327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d1Soy9HKLDRhtgvZqgnl4BT3HK1yJOBepLUK2HNIXt0=;
        b=lxUmLtrK0jfEmrohvwavhNdbdu6o50Z7gDWlGGq9WHoP8TiZhqQ1tNP8QcC+b/ScoV
         ZJa495btIiL1BKhLn7dxJFo/3ReBfQT7br9U3nm8eXiuZmtm834fP/tSCuEn/5VtPJ8r
         DDkEcz4Mz4rw7itCd7tFLXGfHdZMh7nObp0BTs/gflZMp3zjD25eztSRRM3fLOCG9Dbh
         ycmv3mBHsSKR5yMxZYBnOwFYkjvk2vCE2LYaCPfF9vOqqZ8uTBgEBg7Vy/zIaj7MK9nQ
         IaqnU7vj0UqdtzQpsVN+jl3lo2rbTvMo6cUWyR3CKnzzGSTETNAsViTvJ4fCvokAJbmF
         P3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739625527; x=1740230327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d1Soy9HKLDRhtgvZqgnl4BT3HK1yJOBepLUK2HNIXt0=;
        b=nRLvjE8ea6Znuxxrzb5nrT6xJ8DNfkKD6cjFK+guEjk0OpDwdvDhulOE6RYwUda36U
         /ULMRxsFW0OBHJ/6oShXF1ggdaatn2G/euzvnFO4H2aDcYW4rFni21sUYwGMhjkpPS9R
         zRHrI1XninTQve6WjOxuTWWkUVr1sUcJN6nYuNBV6a5bMRvmfziDap1J+letxrc8PiiQ
         lDTNGNZALgFhXii/Y3BvPkfpUEwPmEGCpU5SLUqoF4PpokcneDrJSUb8XHHhcSvNL3rV
         VBGEa/0Zni+P0TqdM+efbH0HbYUP8x5g9zC+6iisyxmMLo4KDPcNTKIrC2wnN7YK/Rv4
         4Q2g==
X-Forwarded-Encrypted: i=1; AJvYcCXY4guCjFM9nZJq79YxV0n0+YWTdGupSsRz/vvv3F8tQKrYALW9KHrl7vv9wLFNk8WIRgBhC8Mdd+jH66Kx4xZbSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmEl3q7AiUelD5KqDql+mrXOBoxtQejKFWKXwvkwB6wfU/WgAH
	3SiVZE/ZfK0m/pngo0Pn9mWeYDu5X+tBJAhBoYXTNMapNDAg4c2rsiaZ/jMWviQ=
X-Gm-Gg: ASbGncsov/NONPmXZ4Hon6/86HHeRGM5h4qpNLVYGOcmCRixS+1DU22CdhJtuaGccsL
	kUUm1eGhzBFZBaf/CJB1jsdAKLDJR7izWmE/kSLf7c0AzzoqSTh8DGOEY+isN1rCJnkwAbs7C4r
	LdMy/89bbWsUyAxQRdOfjWyriEYfuhTtCCijZ6pKNFP4jj9WAF79DmiCb2hpyNrEnQVBoB1RIGA
	ApS41L4e4TpAG0i17OseCRedQaeX+cBOeoOgz5r9FdiCPLoprCeUzh3HCRnO69T/OlYa6nAOvqN
	c7VtK+3KgX0r8lgu31Gtq/4Vokl2f79injjYwsYlkEyaRw==
X-Google-Smtp-Source: AGHT+IFMrBPMiwy4hh2gSuBvAuc2QNDGynYaCQjJMK2b6mLiJrQx4XpH0JunoWzRU7sOAKxbiiK2rQ==
X-Received: by 2002:a05:6402:2114:b0:5de:d226:83b7 with SMTP id 4fb4d7f45d1cf-5e0360419aamr2320384a12.8.1739625526853;
        Sat, 15 Feb 2025 05:18:46 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1d3693sm4455433a12.39.2025.02.15.05.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 05:18:46 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	john.madieu.xa@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH] soc: renesas: rz-sysc: Suppress binding attributes
Date: Sat, 15 Feb 2025 15:18:43 +0200
Message-ID: <20250215131843.228905-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The matching data for the rz-sysc driver is marked with __initconst, which
means it is discarded after initialization. Because of this, attempting to
unbind/bind the driver through sysfs after system boot can lead to "Unable
to handle kernel paging request at virtual address" errors due to accessing
freed memory.

Since the System Controller (SYSC) is an essential block for Renesas SoCs,
suppress binding attributes to prevent them being exposed in sysfs,
avoiding potential issues.

Fixes: 1660e5ea6a3e ("soc: renesas: Add SYSC driver for Renesas RZ family")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/soc/renesas/rz-sysc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.c
index 1c98da37b7d1..14db508f669f 100644
--- a/drivers/soc/renesas/rz-sysc.c
+++ b/drivers/soc/renesas/rz-sysc.c
@@ -120,6 +120,7 @@ static int rz_sysc_probe(struct platform_device *pdev)
 static struct platform_driver rz_sysc_driver = {
 	.driver = {
 		.name = "renesas-rz-sysc",
+		.suppress_bind_attrs = true,
 		.of_match_table = rz_sysc_match
 	},
 	.probe = rz_sysc_probe
-- 
2.43.0


