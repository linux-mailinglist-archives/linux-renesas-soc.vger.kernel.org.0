Return-Path: <linux-renesas-soc+bounces-7951-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2A195841F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2024 12:21:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DA701C24AF3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2024 10:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B9F718EFFF;
	Tue, 20 Aug 2024 10:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="rXaKkeEJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3B018EFDB
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Aug 2024 10:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724149184; cv=none; b=EvSbSnwoKaq0hmTTxKsyDW7y69sxQ46NVVpROA/F8UB0cLIz55nhB2QK7epm8P/CWLL9qqI0FRpRbe4aH/l2fL9vKgsmL9QV57TJqMSfb8vkOtRAfgk5u5K16b2eJSrCspVJEoPCCygR638VgsTt3VVygApssC3r/GBJH6mv/Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724149184; c=relaxed/simple;
	bh=/TdvNEAXNaevYzUpriQkTuBwYixIayX1stnKgNipS1c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J3fXTNvXzj4NeNVQFarFF2+MX3eIdofwUAmV9Q0Wy266B9isPwzS96ChrdEuluqTIbBqNpBoTzKY/iJWr/gDHRyJ77Eno6NKz5DAbM119ANcqeXQ84N+vSW7+wjZBZnHnojPuPoZt1TZ9mU5byD1ERS+c/wfw1xRA97N5K8YgiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=rXaKkeEJ; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52f04c29588so7139154e87.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Aug 2024 03:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724149180; x=1724753980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14eIIaiklrm7Om11tY/QLjKVR8I5oeTRGAiW2Jg2X2Q=;
        b=rXaKkeEJdLXAfME2uWoU4ObVvGBp8OrE4zvEpj932C6ntuF+lyO9Zi+7NB4Lm4Xll+
         3gSglwU6CuC59U+M147Rqqzm6rbhX7xVKQ4gFugWuMvkkF4bLLc7NU2rk7RMFmNwYQyP
         aB1N6HngQ295qNvu93DMYiseSrzLzFemo14c0ECoObTp93Ov+ehYn7VKCSwsQaDTWAGd
         cEc2/8abyLFngM+FgNzBUgt5DO3NJTx6X9sK6lt4CjzYdPtkF3yrZo0U/xYsg6AFknY+
         QqndC87q6PbFuJHOzH3g/JkGO64vv2QwScV8MtTdUs9i2FaB/eldKNFut1Yu4As5yyBU
         qjlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724149180; x=1724753980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14eIIaiklrm7Om11tY/QLjKVR8I5oeTRGAiW2Jg2X2Q=;
        b=vXTbDqnRapuOh2nU9cFjf0EfIuv/V+O7nm6kc4n+7hS4mi/fmItSUNY3w8m39o/pyH
         ea9F9tO6epvNkiKN5D8JTec2ZccaTCzAk92TBy6wADqqTBOuqAwsBGJo8VwZdUj5yM/4
         XV5u29FX4dFaBO9mjHzJ6Zj8KSBfk/BmlolSukSaEJRagwF+v6i+oMA//WTU4hsps0CZ
         Kad+WHN9HmNFDrCB188cf2y0dE9b5hXLxdZap3ArprmXMcSNKAPs0ze8+eCVAmzCCspY
         CUZj2i9gTUxPwz8TEKNI0zus7gm/CTMNfuXIssXsCWMuZC17XrE2JbXCmE4s2QntQNFv
         hmiQ==
X-Gm-Message-State: AOJu0YwcvaSOsKNUACQ3LYYJEqRn+o4QzDsjLudkgBUBtHk37FEoKQQP
	XCukxdsL7d4iMzzHwS7q5ntti/gE9iDoNqABW+rbriVU92feDi4uk1YjwNPVAE4=
X-Google-Smtp-Source: AGHT+IFzoJ5jRiMEoLCmXiZsg9me43IMFIXAHJJRM3cKOCd8ks++29ur4TKuhzt+3M8oMO6coKdROg==
X-Received: by 2002:a05:6512:1081:b0:533:901:e455 with SMTP id 2adb3069b0e04-5331c68a4e1mr9510497e87.2.1724149180078;
        Tue, 20 Aug 2024 03:19:40 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83839464ebsm734550066b.155.2024.08.20.03.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 03:19:39 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 07/11] dt-bindings: i2c: renesas,riic: Document the R9A08G045 support
Date: Tue, 20 Aug 2024 13:19:14 +0300
Message-Id: <20240820101918.2384635-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240820101918.2384635-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240820101918.2384635-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Document the Renesas RZ/G3S (R9A08G045) RIIC IP. This is compatible with
the version available on Renesas RZ/V2H (R9A09G075).

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- added back Conor's tag

Changes in v4:
- added comment near the fallback for RZ/G3S; because of this
  dropped Conor's tag

Changes in v3:
- collected tags

Changes in v2:
- dropped the renesas,riic-no-fast-mode-plus
- updated commit description

 Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
index 7993fe463c4c..505a8ec92266 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
+++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
@@ -25,6 +25,10 @@ properties:
               - renesas,riic-r9a07g054  # RZ/V2L
           - const: renesas,riic-rz      # RZ/A or RZ/G2L
 
+      - items:
+          - const: renesas,riic-r9a08g045   # RZ/G3S
+          - const: renesas,riic-r9a09g057   # RZ/V2H(P)
+
       - const: renesas,riic-r9a09g057   # RZ/V2H(P)
 
   reg:
-- 
2.39.2


