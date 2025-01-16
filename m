Return-Path: <linux-renesas-soc+bounces-12201-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CE3A13CAF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jan 2025 15:49:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2F3216B3E7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jan 2025 14:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F0D022CBE5;
	Thu, 16 Jan 2025 14:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b="Wg7gl0zL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1051E22B8DF
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jan 2025 14:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737038898; cv=none; b=Fld7hHtS3/IzkzL0YknlGBT0k1uadrRqsyxhrceoQ/pN5VDtb37Cx68l2Ff5Hi9D355VqUTGmmcm3noLDI9tvAuq3Q7n7d6jWdfh5T9PbESxzMfaq6lKH/L1JZHjp7vCjSLtyW0e6qHNUtU8DiHZTzXDP1CvGlaJ93KUCcoxPqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737038898; c=relaxed/simple;
	bh=lGFk7U5Onz6sNN5y/99LRrKkOQgLiX19I23GYTjkcUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g7DneSUZRTVnEsBvN94A5hmvwkR2g0U1OCb7kG6mEC2YpMh2VucjtTXQ0GKztxnbLGUQaTNma/YVD9p44vwMj37oMOQC8gZZXWwhyailD45/Sw6u4Z0oMdlpCBvHqElSCA9ZRkVJNq4vSIbEALz9Ld6+e5390OdFR5F++If3vYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org; spf=none smtp.mailfrom=nigauri.org; dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b=Wg7gl0zL; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nigauri.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2163dc5155fso18791185ad.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jan 2025 06:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1737038895; x=1737643695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T3wwm6DpMoyeaZ3xyPasEm+MVRTmuQGP4Y2DQwnl42k=;
        b=Wg7gl0zL5gWO0VMOWkdaJHoHqrhjLe33RKpfqG6JEu6pw51uBMJOOdrobwq+HCQjtF
         zRrEEq1ekpfggZdXDz9gvSCwMZsIhiNEyV43kDhyUBzYU/VZfrCKRg5QrddHTUbN79lJ
         WbKmoLLGYrw/VlI/p1KM1UbMcF+/wW46LTnLgo4MgQlC4kRz5FRyKdfG+A/sveY/MzPR
         Ol/MHPG+QnYkutwtlk3IbWCfJFXA0cnnZY5j4/Ggo6hykSxzT4gc6CeruJl22Bs0L0eN
         B2HtkydXFLPkUE4j5d2LNp1kHDem+3HDc//Hmz67UrehgyCAeHaVoJ4NGSN6B2HVg+sB
         +06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737038895; x=1737643695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T3wwm6DpMoyeaZ3xyPasEm+MVRTmuQGP4Y2DQwnl42k=;
        b=QHMHqdPLIX6Zt0d2m80UAv9acep/5IADPsrzuzyJdcBmQoGzt3klJ2a99xaqQv2kZA
         dovghAVryQ+ZSU31caudwwXBjENzu7jN6efgKLeGm+PcHx/Kkei4wczDu82pnlXFlmQG
         Lvsnd/oL2zOa2A+YJFRoV26MuxPM5E2n+FMvIrtN+NSPKEANvX66JB21YuZb5zhuDyzW
         FPOXT2G1cJXXJrxapl2yitJf/LvV8jC/WUPRviu7Yokav58O4/0DFyi7kArR6fanvCGb
         xLxwy9UkmERfrQRkw/2z4QXGQO1oQDAs6VmNuQBUdXw0qJyAwxiBCLm2WEeMCX5Eby2n
         DPtQ==
X-Gm-Message-State: AOJu0YxB5kAM5JOqhFWnaXd0yF7Yn1XsHnwbrHu18yhra0In9WTgIT7D
	N67gmMShdnJfJZG5ucwpI2sYXGe7t4jvoWbHrrh7YDgir6umCj6u5wobp42D
X-Gm-Gg: ASbGncud7+0E+Zo/qWcujecipOlMHotdo7d/8l+SzAr4+SWOkQVZPugYFVHomnzDy09
	BJApyi2sNgzimaDx6jwMeJ66MZUI1wl9yz7SKrIWxXLvediv5eSTh3I7pgIasZuygYa3bRbS9LH
	YYPMQqYoTxnt7QVdWii9Zbl9DILKGBFAA8pHCPqXYarY1whm3YiLUi7UcJ2Wg/XU1xWhIEhxK2Y
	OB9y23mLCuWMnfcy3NDzk9IPhEp6/eQkUbjOTQBcCYuo6oKpe3XClk/Bg==
X-Google-Smtp-Source: AGHT+IFXKTQhzIDfuhegdMGAWS4p4O9ffD4TW2PQ2mR4SS1qCyoMHuPOsN0WjV86om0RCKlGkp6H1A==
X-Received: by 2002:a17:903:2452:b0:20c:5533:36da with SMTP id d9443c01a7336-21a83fc764cmr489625645ad.42.1737038895321;
        Thu, 16 Jan 2025 06:48:15 -0800 (PST)
Received: from localhost ([2405:6581:5360:1800:4323:933a:5975:d650])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3ad20bsm1221885ad.128.2025.01.16.06.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 06:48:14 -0800 (PST)
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masato Kiuchi <kiuchi_masato@yuridenki.co.jp>,
	Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH v2 3/4] dt-bindings: soc: renesas: Document Yuridenki-Shokai Kakip board
Date: Thu, 16 Jan 2025 23:47:51 +0900
Message-ID: <20250116144752.1738574-4-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250116144752.1738574-1-iwamatsu@nigauri.org>
References: <20250116144752.1738574-1-iwamatsu@nigauri.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "yuridenki,kakip" which targets the Yuridenki-Shokai Kakip board.

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>

---
v2: Fix the rule of binding for boards.
    kakip board uses r9a09g057h48 only.

 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 4f2645e8140c5c..a8af4fce596127 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -557,6 +557,12 @@ properties:
               - renesas,r9a09g057h48 # RZ/V2HP with Mali-G31 + Mali-C55 + cryptographic extension support
           - const: renesas,r9a09g057
 
+      - description: Yuridenki-Shokai RZ/V2H Kakip
+        items:
+          - const: yuridenki,kakip
+          - const: renesas,r9a09g057h48
+          - const: renesas,r9a09g057
+
 additionalProperties: true
 
 ...
-- 
2.47.1


