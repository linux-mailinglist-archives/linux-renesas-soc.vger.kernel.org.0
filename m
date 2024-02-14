Return-Path: <linux-renesas-soc+bounces-2771-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B721854AE0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 14:59:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A02E21F23F6F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 13:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50BE255E6E;
	Wed, 14 Feb 2024 13:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JRXYa6Nx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7CD54BFD
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Feb 2024 13:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707919130; cv=none; b=e80LrJ9TDLJOYLoOA1sbSb6ZVw1LANxgSoAGaah3Ri5nE9OQEnRsRwnfGQyzGZ2B11Qah6/EV2+9pwr5L/BS94u6InMGtJrYIXcV4juZMMfQGRsBapvipQBuQYS54ZCw+qkrYJXYqW1MrSB9yUMBIU1OLOU6NUfjxfFaLLMX7Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707919130; c=relaxed/simple;
	bh=M4Y9mIMWHDIktHdxXrNnI2TKtm/DLPPURoaSoNyE7Hs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tzvMdzjA4t4jRaL7/V+VFICSmFdlL2FTZiDtbW6Cr1RL7FnK7oyN/doPOPule+LPc3mZ4wAPb6u9+qVBgUlKaM2x7gPRoMzRm0fKP5meCvNpvecPIH8RijeQsoLB+6F0EKggpp5aFt0532GzCYbRtGok/10Gyvt+9LXg50AZgXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JRXYa6Nx; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-411fc61a0ecso1847525e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Feb 2024 05:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707919126; x=1708523926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nlR5/FjPjiRmwOAx9UtkAJTic0hke24cfsu9KAX+Hkg=;
        b=JRXYa6NxplIY0Zn6C6eb99PeW+uCn2MHLzr2pAb9k2uJPV7PFP49hZeREemYCOM5wU
         BHl2oXlID3SCi0kPKP8CaxnAez1y8NsXqULEmSrY0Bd8IIfTrz4SJ9MzAKHgV4VO1JXc
         MLYv024l972eFbFXS8AX9FhmKBKWn6q84grcgokn5q3NGuXPOBueFT5yY7r8PZ3kIO/J
         KSb2mqL+HEGI8ClqKu8ege/HngjgSA1z6u5zUsOZQjageTGj7hGkrCFRGo5GLDKDYHaT
         c6ro6m0H29GoFdLvIVyk992nBqDi5TW7nrN+dC+Bncx1NzdXbainSal5jjkLA0GKAQWi
         FqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707919126; x=1708523926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nlR5/FjPjiRmwOAx9UtkAJTic0hke24cfsu9KAX+Hkg=;
        b=KMWWCDZFnGJOkYekAxJu/NUJDAi/x5sdLANavpcLFAKWs33Rhdu0qAytsgD7k9RLLX
         F382SolUWeP8tdSs3nUA2I5l0c5Yw+bSaQ9J11m0w4F1Z88J4NHQV3ekQQNQ4BbkxUzO
         S6ahNyDJPKSjzKKf1PnbDoVlZYJPu9lOhVqGpNTX5MSZ7Wpt/iSUGsuGM8zyR9Mw4BeI
         /QREZVSy+ZaVIapMTVBmvQPQ0RzzTqTtLmtu/g+ENWNeOt+cgQviickYCIWYmSie8VMO
         cbdMmiqqhq6g6HqCMFvXUpnhg4kn4l3x7LsO25yFxIKZJWwwG9T1uSweJ3TehxCYp0+P
         tuuw==
X-Forwarded-Encrypted: i=1; AJvYcCXhKdsjj6ys5rzxgf6X5MTeZHqFCzGEaJ3Qpg79HNMHpOHkCRMtglKeUOSiyHl3PVdXyppIrWfTyPSKXKXh2oAi+txCXCixIMBY+lcjdDlWO6w=
X-Gm-Message-State: AOJu0Yx3z15nRwboUfHTlQAGKsSxJ61yBq7HdXMXnyxK8gLtUiki9/+Y
	/QsCwCMfrEzE/pdHLNUdTEpNMO9D2t8FMCx2uiYh+rRybN1ajirFe5DwfzjXJsY=
X-Google-Smtp-Source: AGHT+IGkgcK49gW8USn9JN9o448EltIafv7DQf/wfSCtuzxO8qlGegPojxeL6/uNdwpiy1ESvjhKKQ==
X-Received: by 2002:a5d:4041:0:b0:33b:2281:ef32 with SMTP id w1-20020a5d4041000000b0033b2281ef32mr1688302wrp.69.1707919126512;
        Wed, 14 Feb 2024 05:58:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUrSz/VkR1W9EksF5qYZeuWWKTpRn1+2yazlR0ERZZdPhFNGzRKAK4T5ZAZD0bghSXAgt6rLFeblkPqt45kaAWuk3z5laJXoMV9Ko20Cp6v+ROpXh+mDqnpDYrqAFvUh76Da0AORwPs7VqoDSDLr+6HygCxHbvIYwGSu+lf2rHFZNvK9Bdgzl88mtIODWh/uUwcIlaLR1C2GCK7Ga6fyeYZ5CALTiBq+HLl09AV/6lYac6rt345JB3ZCoIsCbZO1I4jfE4cA7XZiJW/qUXUmEqdvuZISuJ45pnWizcxHC55djynCQUBAX+6QdSZSamiOLwTuGo8/vb0BZe8hQ7Po9booAItgseBDRkLAsXrBH6rsZtZpFIu
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id f15-20020adff58f000000b0033cdbebfda7sm4282140wro.14.2024.02.14.05.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 05:58:46 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	biju.das.jz@bp.renesas.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH net-next v4 2/6] net: ravb: Keep the reverse order of operations in ravb_close()
Date: Wed, 14 Feb 2024 15:57:56 +0200
Message-Id: <20240214135800.2674435-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240214135800.2674435-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240214135800.2674435-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Keep the reverse order of operations in ravb_close() when compared with
ravb_open(). This is the recommended configuration sequence.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- none

Changes since [2]:
- none

Changes in v3 of [2]:
- fixed typos in patch description
- collected tags

Changes in v2 of [2]:
- none; this patch is new

[2] https://lore.kernel.org/all/20240105082339.1468817-1-claudiu.beznea.uj@bp.renesas.com/

 drivers/net/ethernet/renesas/ravb_main.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index a1bf54de0e4c..c81cbd81826e 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2321,6 +2321,14 @@ static int ravb_close(struct net_device *ndev)
 	ravb_write(ndev, 0, RIC2);
 	ravb_write(ndev, 0, TIC);
 
+	/* PHY disconnect */
+	if (ndev->phydev) {
+		phy_stop(ndev->phydev);
+		phy_disconnect(ndev->phydev);
+		if (of_phy_is_fixed_link(np))
+			of_phy_deregister_fixed_link(np);
+	}
+
 	/* Stop PTP Clock driver */
 	if (info->gptp || info->ccc_gac)
 		ravb_ptp_stop(ndev);
@@ -2339,14 +2347,6 @@ static int ravb_close(struct net_device *ndev)
 		}
 	}
 
-	/* PHY disconnect */
-	if (ndev->phydev) {
-		phy_stop(ndev->phydev);
-		phy_disconnect(ndev->phydev);
-		if (of_phy_is_fixed_link(np))
-			of_phy_deregister_fixed_link(np);
-	}
-
 	cancel_work_sync(&priv->work);
 
 	if (info->nc_queues)
-- 
2.39.2


