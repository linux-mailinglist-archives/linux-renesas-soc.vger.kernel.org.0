Return-Path: <linux-renesas-soc+bounces-25380-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE1AC943BC
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 17:44:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D8234347166
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 16:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192D631159C;
	Sat, 29 Nov 2025 16:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5gg/r+K"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C530F3101CE
	for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 16:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764434619; cv=none; b=dfovsqUHM4XZbosq0H8R4OwiNx/NI/xYdbCKBNDRJxnST9LmnFquITtyCi8OsZPrBfR1LcgGvnRjix3UlxzeN17skbX2uAWWuzjdmHpCuq6VxB5VUFQL1pfJoWqPaSCfJNtG6vuGdGCy/5QMfDGy9VD3+NLVXCCn/qd+cH42rNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764434619; c=relaxed/simple;
	bh=TJeWZNgC6V19mANa6819NcVhj1KoiROqvTZZzFtxTtY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OXIr0eDkqOOQWs/E25dTs24HPPtv8IOM60CH/V1XEYW9uSeS5g2WO44ceROcn2N+WS/6KmiAv5YxcDfATtiPjid+AduKPiorQDSZjJK6B9VH/4wLtEEPQ6WTCaZAjTw+ii5xKawxszJHZfdfwtRV90e7PRSn9TItw+sK9eLKirQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5gg/r+K; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4775ae77516so29029065e9.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 08:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764434614; x=1765039414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R843MbZCnVpvyUBhLJHg5z4LPvSVt3fcefWUXjH+qo0=;
        b=l5gg/r+Kacbe86JrgasXp+QcwSaeFAG0l370y6AZ0J8Tbj26X5FFA0WQsMKUgcChLA
         AvX5TQKbA5V8wgw/xvfdwJsHzlb6OYJ1lwLQSvxTgKFePpRul3R2ZxZYwMPYdqMdvMCL
         bN8vp9j8KBm8Dc+EIoPtkFzCyEkh9YWrfLF8NqmSgtme+TlJCKrBfAq41EnuLusmuG5N
         5OufqQrlI3tj5MG7+VFy8EPh3xL7SB6EkZ3tTautToca39D5q3kWWReeM3mzo97BxKp4
         7CQEbuMSCp7qKy/DyCnp8BTxWFFX5qBw9DBWx3+XSyaF6t9XsP3TJelOq0ey5eckPVFk
         YW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764434614; x=1765039414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R843MbZCnVpvyUBhLJHg5z4LPvSVt3fcefWUXjH+qo0=;
        b=cVr7Mzptfc9dRVX/c/aQ4IK09e5TzEpjvQrLYsYT2KT7g2RVoc1v4IcSxgcfvoiW7z
         865yhM/Pkq5SXUkIltiWanxG4QaA8z6lER+NP7PvzGWfOYnJa5s0AhBCroWvhKkU1ygA
         7sZaj7BLnSuF/6V/ELplAMMK1gxUAsVKqdv1Dy3AI1uM5p8dzCofYWwzSUWxpDr9TKvX
         97Sj0g/piDH5MXP74D8qAXOpnSnm/fsbGJ791wqF5dF5/ANRB8hZHZEr0G/TKc2jP1LH
         0tF/Gc4qhvqhwRf91WWvJdqdJBCZUQjLcEyFy9c3zxr2jHgeUo4wFzYek2aLeAGC4u7W
         iVCw==
X-Forwarded-Encrypted: i=1; AJvYcCUOH8ov0rhW+xZ7AiezyzHUNmyrY+KJLifm4NLlbvObLeBKkIJ4qv1hDg4FhBgWMNIw5+sCCh/bglzHilCeoM3rOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe8Po5cO/1sy+jTaswNxkm024ZXRyzHt/y1RtJX24XcErw37qx
	8jM+if+YRoFcCeeP8ZighmqCu6d70PxzEkXqUFIj78TJM074OpkUqOcn
X-Gm-Gg: ASbGncv85QWnOltxKP74NquiDSlAhl4V4qRK8aEmyA7oZjWDUPTbV+8atTFKZDj091f
	VTP2pSA0GLVt9sfsx7+LSxnZyAsLc8nzPWtG06h62bPnuT1sMbmTZ1mvSXWEDqsohzpZz/aUrCK
	EbHSpMPuJRKeblbRkD9PO3Kz+HtQ7tgJEujQBvsgWg3980dj77/+dtU+b+fTyExykSJxXxbODHD
	czfkAffUi5PEBpIpiCXwQWcEYsoMGbSdvQWmOhAtARKhhBeE2VZnYCQ9YQB+bOdbtlSKIMpngVi
	3835F3QHzkd5Cw2Q222RxDC2dwn+p3nIJNBejBcGSHjXw4pC8bZhXqgP3V6grliG1MnEB/k8dc+
	FK9F+ZvR5TJk2SPz7MBxxQKUthnupLdlFy8G/RVTw0tX6RawPpAXqmz/6Os8D8UYAHoyH0Y0yuB
	2+N9euo+g+9fdnG8genD0kVVv2rV86AOISwXs+1upnuED7UM5blg1p8qheYYXwdwg6XF0oFzzdl
	KJaM6JG9MHNOkhR
X-Google-Smtp-Source: AGHT+IFZ47zjlwuxIl8M0UD1kY0ilg9J9bhy2OdqVMQb6EHvACxZUYkN1QFczesbPnwVT8eQsuRPhw==
X-Received: by 2002:a05:600c:1551:b0:477:5ad9:6df1 with SMTP id 5b1f17b1804b1-477c10c886emr340735155e9.3.1764434614411;
        Sat, 29 Nov 2025 08:43:34 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca4078csm15970060f8f.29.2025.11.29.08.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 08:43:34 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v5 09/17] serial: sh-sci: Use devm_reset_control_array_get_exclusive()
Date: Sat, 29 Nov 2025 16:43:05 +0000
Message-ID: <20251129164325.209213-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251129164325.209213-1-biju.das.jz@bp.renesas.com>
References: <20251129164325.209213-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Replace devm_*_get_exclusive()->devm_*_array_get_exclusive() to support
existing SoCs along with RZ/G3E as RZ/G3E has 2 resets.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change.
v3->v4:
 * Collected tag.
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 drivers/tty/serial/sh-sci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 7ca94fa84a40..704f175b14e4 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3708,7 +3708,7 @@ static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
 
 	data = of_device_get_match_data(&pdev->dev);
 
-	rstc = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
+	rstc = devm_reset_control_array_get_optional_exclusive(&pdev->dev);
 	if (IS_ERR(rstc))
 		return ERR_PTR(dev_err_probe(&pdev->dev, PTR_ERR(rstc),
 					     "failed to get reset ctrl\n"));
-- 
2.43.0


