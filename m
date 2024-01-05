Return-Path: <linux-renesas-soc+bounces-1305-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B93B824FC2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 09:25:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2327928371B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 08:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5DA9219FF;
	Fri,  5 Jan 2024 08:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ayMIp6M8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5F824B44
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jan 2024 08:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a2967a6a86bso15485566b.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jan 2024 00:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1704443064; x=1705047864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SP3cnmFkRuyDUJ+465RvuWX7Oy5/w6W1mmuyIYEEwM4=;
        b=ayMIp6M8v4bYsx5jeVZkCsPqgEIaDPoVlYOSRMPj8H+v//hA9GP3XOimJsyoWz2oGm
         7KnDSbuHG8n5IMAFxv/tBjLby1uHen/W44EYnuj2+33DcyT8vTAyrqnmgfOWuwoDkwaw
         BvFxn27QRIoD04IVc5Advnf3+VUcpq7IONN+VzEBcd2zl8YTDOyr/MQLkl3Pn/5u5IVq
         aE29OiiTCCvejreFgv9uFv5fyQggv+9fJtjAvWVBq2Ckf0bxm5d0HKxmJ0YGiH7pUKMW
         5qJgWJzoPzrGJeq3nzzU8ZHHaQwBNI7LaLeU/6GnGKbLyB9/Q1HU+tKscDQfF8Ufp0wu
         6Xxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704443064; x=1705047864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SP3cnmFkRuyDUJ+465RvuWX7Oy5/w6W1mmuyIYEEwM4=;
        b=W9BJvbAmgSnNq0+Sb7fQzgqUs1/kGHW6VYU41psrOKecPuYEQirFi/bF8QXfzocrfk
         FobbVXf+sDTdIqJUWFTDKSnAxt4KHaZUHgpp8qVK0wSQ58tDwnDLY6XmLQ1ssV4aA32J
         +uHCjWtzXUbpJ4tEOWjun+ehldNBmxojuJaKc+IP4THqhDv2xuKmsAwH50Jddp+J4qi4
         aXCfq7cHo+wFm4DkR2/Qceyn+flU4sdEyAvUV7YnjdktCANKZHcyu0z2Q3zwJP618kd0
         G+66FJR0SJiZ6QKQdHdgVhbOK5FIRJ9N0sMLHDoAql+UcE6TvZaeBZfdnLdcnYfas2dO
         9kkQ==
X-Gm-Message-State: AOJu0YydVTYbvgFrNAXmuTJN+ek0E1ePsc3zLyFCgqQ+xoR/yNa0XEOX
	o9SqNfphJ93LkbPtAtA4ZUm4nVMK+zv4cg==
X-Google-Smtp-Source: AGHT+IFdM58evMw67rglg4E1TmB3DrWKqvdbwzTTDgVn2n9IQa21MUuFLKtbs7ZDoBJ7LgnH7PF5qw==
X-Received: by 2002:a17:906:194d:b0:a28:7d8:1106 with SMTP id b13-20020a170906194d00b00a2807d81106mr907726eje.79.1704443064344;
        Fri, 05 Jan 2024 00:24:24 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.5])
        by smtp.gmail.com with ESMTPSA id j15-20020a1709064b4f00b00a28e759a447sm596198ejv.213.2024.01.05.00.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 00:24:23 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	p.zabel@pengutronix.de,
	yoshihiro.shimoda.uh@renesas.com,
	wsa+renesas@sang-engineering.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	geert+renesas@glider.be,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH net-next v3 05/19] net: ravb: Use tabs instead of spaces
Date: Fri,  5 Jan 2024 10:23:25 +0200
Message-Id: <20240105082339.1468817-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240105082339.1468817-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240105082339.1468817-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Use tabs instead of spaces in the ravb_set_rate_gbeth() function.
This aligns with the coding style requirements.

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- collected tags


 drivers/net/ethernet/renesas/ravb_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 53ca5d984e8b..0731857c2a0c 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -96,13 +96,13 @@ static void ravb_set_rate_gbeth(struct net_device *ndev)
 	struct ravb_private *priv = netdev_priv(ndev);
 
 	switch (priv->speed) {
-	case 10:                /* 10BASE */
+	case 10:		/* 10BASE */
 		ravb_write(ndev, GBETH_GECMR_SPEED_10, GECMR);
 		break;
-	case 100:               /* 100BASE */
+	case 100:		/* 100BASE */
 		ravb_write(ndev, GBETH_GECMR_SPEED_100, GECMR);
 		break;
-	case 1000:              /* 1000BASE */
+	case 1000:		/* 1000BASE */
 		ravb_write(ndev, GBETH_GECMR_SPEED_1000, GECMR);
 		break;
 	}
-- 
2.39.2


