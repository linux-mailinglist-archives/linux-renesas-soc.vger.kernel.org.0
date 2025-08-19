Return-Path: <linux-renesas-soc+bounces-20668-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5200EB2B8E8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 07:44:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8B0D680D86
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 05:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C43E0311596;
	Tue, 19 Aug 2025 05:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="aqwlLrji"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08F5311583
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 05:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755582150; cv=none; b=V3ncWbdL0qXEyVDHPRmB1LhwSmyFafQmzVLXgKjbq7S7HTeBwnEYAQscaUA7Mv9cJVFFL8nZtbl2W03U95OI/goFW8zTKvh7GydUqhccOv3JnX+DWXft01+UFiMaybpxZsbcImskMOycWl8vnZ9uzxyse2FAQga/O1sdWz4kGn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755582150; c=relaxed/simple;
	bh=I2pIHduqkXRd0dLvTIouEU/KSG35hJ2SXBnZux9yRG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FzjQvKeDDorO0ZxK8CStVPub8lVMvlHaOADF9TSS6Eva1+zRVUddwSxQfqEXEalA8i4bCBao+6PJQHy0DATjfPXo3KxaywIWGSQQvbJLYzbPm1L9Klb1JT470WXucMZpZOyY72+E052zHu5MqNaaCCzwe+dmq+UI8zcMOqOZulM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=aqwlLrji; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45a1ac7c066so27581895e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Aug 2025 22:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1755582147; x=1756186947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRX0/ILbGcYC/ZOQ37kJqtpxqFwl5Y5CWHl3KvwJH70=;
        b=aqwlLrjiQ6l2Pt/S5Erw9BdgoaYUKGklnFlaO9M9oS6u/1XrXYGm1g04etCef7wz8V
         GnAvyBcZFKUCRvAIj5l/yZoY9kdsmQ3J1wdxgJConHkfjnXgRoq5QGNop0P9swTGJQKw
         usRAZDWWrHyQC0I2b0/1qOl+7OHaD78jqOLUEtMrZ4ZLU1r8kiZyGxc5pNKsfrhzpu3j
         KHX1LJLILWOyrEpjrgpWJlv0Jqax2kUGIYYCEZxgKlxIz9fdNeQ26rMcOibWMphjoSZk
         bAwpyLQvYR7FPff7pRwxF1rumMbXeqMJ3/nqMZnEDA/RdovNBu69sYslGPEO6L8A/qEF
         4D+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755582147; x=1756186947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRX0/ILbGcYC/ZOQ37kJqtpxqFwl5Y5CWHl3KvwJH70=;
        b=AgFS2FYKvVbHTvsi5/TxWJIkZvWS/zxQAmVyzePumqsEeS3JxmhMFixORr63UsC8ef
         ymh19uRiDcPHNqTqQK6X4bBvRbO4n4RAf6OAwhJTNQxpnc+Sa3fTULOB+xOz39TiWrtM
         4fTfyzxoBYjpkMryXkOOD0lKVgmFfCnHXGQgcEefJmXMgiEpGiLLnPj9kCq2QRA304/s
         FiIiwqpjIIBtRfa2wtpmJwySxTYWF4NvP0z1hY6UB4aODa3TZ/RrICjuLqnb/fUNdtlJ
         74BotANHni+51/sVKNL1R7tlfRU4pCOVH+Yb/rAjxfLUsJixLBRYIpWk8CVdJq5flZxD
         5tmQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3NrR4HTswYb7CIuRrAcyBWlkc/KuEYm4JtXbHmMgSKaaf3IJAyxG/jJqkfyNuL6m5oefmNbd6gYwIZWbM35C4iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxneiOD5T0MSQyeKYQAaiRiXU4fZJGubqBCsQbVxxY1rXnZ0X87
	GHLcJ/U0TsYvEdDl+DgVkfJmYPzlIX9jSaDV/q9pltyXqzCd/39TrdF5dUGMj+pvrU8=
X-Gm-Gg: ASbGncvp13FTgsE7wspLLJcB1quVi4wh8dcGeEYYS+beMDitFfqz/0Twc17mw3ZNroN
	wwX71YzTHEPeWGotIjxYJW//sB8pu7h+q1R/rKqexALkP2EcjuDAtm3AEaIRKXoKCTi9nDgyfpI
	l/CzsxHvyAXfMre2pPICLVd0ye5ZgAF01zsSUgA5aSFSYRGbqruVrdhVV3vX6kbNbXSpWV/rgyO
	yX4Cam+P38OR66XljDKwWYXxmtSZx0IJgKSzTeWvohPyXfZ/hMxEI72uaanlCiYLA3Dxf8oS/2J
	odyaBdx7qP2pTIMn7/DZWYmK+XTpevPvSqpJXXis9pztTH84zH8EM2Du4R+pz99TMC2T2YPXIkJ
	loGW9MhGlrMEmeOks6YXNqLpBcLSXVq6M8BCmLA3SlC08AaZ1ltcxDHIlI7wERM/99NmftPcl7U
	//88uIYLNxgJU3VIQOkg==
X-Google-Smtp-Source: AGHT+IE82eFUk/hVv5JzkA8bqsXhoqq+l404vddic1GqJDoG4Xu5ff4Uf0NgyqJJ6Jq6LFzRsve22Q==
X-Received: by 2002:a05:600c:3f16:b0:456:1146:5c01 with SMTP id 5b1f17b1804b1-45b43e972abmr8107215e9.12.1755582147370;
        Mon, 18 Aug 2025 22:42:27 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:620a:8b00:4343:2ee6:dba1:7917])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b42a9847fsm25097345e9.26.2025.08.18.22.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 22:42:26 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	yoshihiro.shimoda.uh@renesas.com,
	biju.das.jz@bp.renesas.com
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 5/7] reset: rzg2l-usbphy-ctrl: Add support for RZ/G3S SoC
Date: Tue, 19 Aug 2025 08:42:10 +0300
Message-ID: <20250819054212.486426-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250819054212.486426-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250819054212.486426-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S SoC USB PHY HW block receives as input the USB PWRRDY
signal from the system controller. Add support for the Renesas RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- none; this patch is new

 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index 3856072b23a3..924c614f84cd 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -108,6 +108,10 @@ static int rzg2l_usbphy_ctrl_status(struct reset_controller_dev *rcdev,
 
 static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] = {
 	{ .compatible = "renesas,rzg2l-usbphy-ctrl" },
+	{
+		.compatible = "renesas,r9a08g045-usbphy-ctrl",
+		.data = (void *)RZG2L_USBPHY_CTRL_PWRRDY
+	},
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_usbphy_ctrl_match_table);
-- 
2.43.0


