Return-Path: <linux-renesas-soc+bounces-16036-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C12A8A887
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 21:53:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0800E3BD256
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 19:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C18D9256C70;
	Tue, 15 Apr 2025 19:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hbhJS7k3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C052550DE;
	Tue, 15 Apr 2025 19:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744746705; cv=none; b=an/IjJC3WjODFd2mqI+IJKSLnQYT1FLVAozDqSwnU7xYe04PSNSrVHFeSqqnG/yFajP2a4rjtnQ8kXqEjMmHurTVx61b3dVcT4gJ/A5apbhHORGVWUB4n4Kh7FOE7lNvvstejEnLWGkhjctbsuZ7SxMJGHtVJQ3kO9K65eO1afI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744746705; c=relaxed/simple;
	bh=slZmxp++QhIB/d1vWbc5Di4/dmlQ7NU7kBrPsD0giv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p5cQgosYNMpPOAZiKXRawSuu+XdDs0xNf+P7SkKLccm7x/E2nz8rcTtY5vjJHAyJPr6MaH74RWl2Bu93Ki8oRFqoIQ5EOdKYkCtlMVKMgoESaRHbGqwrNQGSlN8tY8a24GyzGc3ARaz5KldE3Ga8QwqQKGKuchoJaC0tA04n2jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hbhJS7k3; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d0618746bso47124435e9.2;
        Tue, 15 Apr 2025 12:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744746701; x=1745351501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQPAcNlalkLy8oJ9CIcK6WyWW0X8sA33xHew3+Clh4E=;
        b=hbhJS7k33FfOoVDY7ACb8jK7QRxHaplKZ7kdL7uIsYWXeUPLRLPw9mPDinaCb0j1W7
         GbKbgfQmWVHJwMAu62ln81beGCZQ+KmhQejrqIeo+5VgBXQCZIrELJL12aWKBj+tL4mK
         y2mabz2XbkkbxW4NWaDNjQMqhYHO6ebnhH0kZkJejQaWl6GvMazthikyT5ri3veLgtvf
         7GzpwJVfD2t5Ow1kHyKsCrUdy+pNAjmoO9GQX/UFj4iVM4V+zpXcHf5yf7h9LcBBCD+c
         6Bf3VXxG3ewte0fOZurw0bSKffMhtQJWTYDNfu+ze/8sPRTTlxWIYrmi57XUAnobWeLw
         8BQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744746701; x=1745351501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NQPAcNlalkLy8oJ9CIcK6WyWW0X8sA33xHew3+Clh4E=;
        b=AXSBQwH54bVNaTEiDu5bEcNj6i/p+tl4kneu0K0bignwVXC3QMUU6BPQOAHaI8b81H
         FAZ6JbnPDGkfuF3aKuYkN/g+Wkq+bU6fc+JGZWUvlBW/yoVRO4aGzsYVkNahCnCrdbFs
         kvd4m7+V4N+nY67ticVjZCElZEGFfRZDrgDmz2/F2Kh1HxbNmu/2HFLICrw6KByEcv6B
         04caObgokYvIFE/CLHzwSVIhMHseThi+RrySEfJC4k0AYqOf97IsaZ/bQoGp7Yp6IKbf
         lnmh4HaQAl3z+N15zcPHLaPacXra2WkgzuA2315SDm0HZnKndZgy8kT1zxQO5hDPvnwi
         LyAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZpfrq4qWNBfGomg/81qqpUloo9oeiRNnG/talR7QICV9ojmpWsDUXWwHE34QGNdncRfyxjm6e+5sn@vger.kernel.org, AJvYcCVIMXr1KUGeeTIyT0hyGsw2gxEB8QSQ/mtKPm7uNZBhy0Auwzn56zbEW1WxAyhwd9aQsYA4EN5dyV2wGnCy@vger.kernel.org
X-Gm-Message-State: AOJu0YxGn2kBBcoos4w3ZVHI6tJmMjCgpovXNQYLiK0InxSzrJ8vdxww
	lALhaf2tv9c/NbJ563aUCei4G9dOuFl3icY/PWwflD8gVZKSqmK9
X-Gm-Gg: ASbGncvRiAWL10dTswiaWljS63RzzmWDAH4IOeVpuzpq5NEJPFfSOiZwhMXgcwslLbb
	/V87oz/G4PKbopWi7Mz/UkYaHBayqoylTxhvyRiMrat4k70rIbJOMGtbArrjHkDhB28KEY6z87W
	+mSuNHEF1c4ZEQ09NboCWgaIqTUR8cutOaU96i6f7uY8Z+rw4/p6B72iFdgVExrU9buj7GxFpOr
	M7zXZs8DpaKd+87r+ovFmVxGPj4pDI/BHO/rUAVmoDBsAQypxKQ6Bn59IkW0cYblSDpO51TAYyv
	aWBuSkfjpQeiDKZfL6uxm1b7RtIpI94GKcnrG/0lbwyF5wlyntB4mG4elY99UnXO
X-Google-Smtp-Source: AGHT+IE4rAkHboQ7//hlbqk4UZSW6zTq1/RUlX9NCL5z1569iJqvd/G+oaZH/PDtiCoKzjHRBjKUVA==
X-Received: by 2002:a05:600c:1c88:b0:43c:f597:d584 with SMTP id 5b1f17b1804b1-4405a104ba9mr2691095e9.29.1744746700723;
        Tue, 15 Apr 2025 12:51:40 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1883:aa4:a265:bc12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4404451c67dsm14169335e9.3.2025.04.15.12.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 12:51:39 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 3/3] MAINTAINERS: Add entry for Renesas RZ/V2H(P) USB2PHY Port Reset driver
Date: Tue, 15 Apr 2025 20:51:31 +0100
Message-ID: <20250415195131.281060-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415195131.281060-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250415195131.281060-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a new MAINTAINERS entry for the Renesas RZ/V2H(P) USB2PHY Port Reset
driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b5acf50fc6af..a8d8eabf9ecf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20684,6 +20684,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/usb/renesas,rzn1-usbf.yaml
 F:	drivers/usb/gadget/udc/renesas_usbf.c
 
+RENESAS RZ/V2H(P) USB2PHY PORT RESET DRIVER
+M:	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
+M:	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+L:	linux-renesas-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
+F:	drivers/reset/reset-rzv2h-usb2phy.c
+
 RENESAS RZ/V2M I2C DRIVER
 M:	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
 L:	linux-i2c@vger.kernel.org
-- 
2.49.0


