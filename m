Return-Path: <linux-renesas-soc+bounces-2426-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1316584CA7D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 13:11:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AAA81C232FB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 12:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901D95C5E4;
	Wed,  7 Feb 2024 12:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="MPgOiRSk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA475BAC7
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Feb 2024 12:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707307677; cv=none; b=SaO4AtGO2/oS4utfZl0z8pVlYrGNPaVXVq+7c3EapHB/DgdsEkB9ykWejaY+HjK5YcUvrbxmFBP8qc01FhQ7kd3MLzkPDGVQmQWyfFB3Y6ECY7D9L8vK6GSL8NaaNMcbvxHq8ka3MpuH7SRAj9iTh5am2AemAw9eJDzGgiFZYSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707307677; c=relaxed/simple;
	bh=NYw9l+bXoPskg73dqQ5BlVMt8LzWUzBTvky6tqXSly0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BiFtDhI5mOoK7Z46h4CeHRG6K71g46BQMHqDmDru5KbCTr/yyrmnPOrW0tKyTzCo72Skh7r1OR5SSmt/F23hl/4fWYShRykmDh8puErKh+rvCbd8HZzZ8SScVxe3d1MTKBGyHIifE9dg39z1uqNKmgX3ZsKdD8alP6D7/1b4VBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=MPgOiRSk; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33b2ee2d1d6so318060f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Feb 2024 04:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707307673; x=1707912473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8pXU065R8j0WF5WsKAZv+XgZqzc/5yTJ5Xq8oCQ9So=;
        b=MPgOiRSkTxmMLIeoko5HPtqgXpR5EcuKIVNP4+5uTIioZRbFY06ZxbTL2FDv+XuKK/
         50HY8Gy7PIHLPAbJA277y1yOgczGQiM/bkVVu9sXkwUqHHATu/FYuXfxE3A2OlDxxDcJ
         +HuQemuEgfoKapU0eP7KXuIGrzUb6az75MOfkk1Fm8fVTPc/y+iUMTremd04WLE5gBO/
         w3/y+wkKx1n8HNw91esOFVPGaVmMb/hLQU9Hy/W8JrQ+4995Y0+CYwwA0Dt8cFVE1uNi
         Sh9Ct5JPv6L+kQ2MrR0l7vxJFQsHC9bjuh4sXjv2URkviN1jQfps5u/zBoBeuShwoO95
         t8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707307673; x=1707912473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8pXU065R8j0WF5WsKAZv+XgZqzc/5yTJ5Xq8oCQ9So=;
        b=JHQEbKmxzEUra2uslVQnlypTfy6y34n9i2LeggxTwznHwCfuM58rJhlVMrmnsZ3+/Q
         QfVw3a7uZd4Ep5+aoqqUpElngyohj4ENNsa6avWGYXJ/Ju60e91qmDHDdcDZUffvAaln
         MWK9Uvqwc07n6LdjrtnMa0SIuqWVxFCdb1jWo7SmUriNtzhHjMRN7weCHfdmP2iQPiqq
         OiIuerG2xiSNv5BRP8T4OqIvPY3nB38dnWmBZIl+7SjhsUdEYi7lBUn0K/Ep7SLyj2Gp
         48viUeF+qjPOxrW9QKPJZ80vd5F7FBzo6Qywf4SciU2y8Bd4SDQhaldimVaoqALUR5wR
         2u3A==
X-Gm-Message-State: AOJu0YwcGbUbDx5DELoloU68deAOqGj1BE+zSZVXBFZsWh5TCYG66yNY
	D3FrcuadcV5rBMR/ufJcWTBdShiskyCCXwVyM5SiPgCLG/BBwgbC4QIftvgicjo=
X-Google-Smtp-Source: AGHT+IHxhsBj13/V9713emnkJKi2bOGNaaDEBPlWNWQmdBgqtYS9PzrOzm9JfR48AlCgTsbNpdXxiw==
X-Received: by 2002:adf:dd8b:0:b0:33b:305c:9de7 with SMTP id x11-20020adfdd8b000000b0033b305c9de7mr3456728wrl.50.1707307673633;
        Wed, 07 Feb 2024 04:07:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWTTQoQujoKD98K5RDcZ0QGCdCrcWsry8yyFZx96BpOOKCmgr5/QWLzRYTIE723RDA3tCxQaXoLt9BPkzheSBP7xK6rU5eUntOlOnuw+zm5cOsuL5pDJJqal4IooyFN/COmqcwuVOEwtk8a9vbqBuIIiUSa/KdURaKXvDGg8xLB7ABVyNXtADifd0qLXzrP00HdYyEwfIOFL6OX+Rw3JHzcLci1oOoDnxC1GzGO5Qc0TeuLH0aijoNFP3P5LoBdtMnBUhreNJqaafIuOUmR1acQmeD2uYNqZPLXD6y/7pfuiIKifjZtiIkuYBI+d72OYInUGNa95xb6V7U=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id f2-20020a5d50c2000000b0033b4db744e5sm1363957wrt.12.2024.02.07.04.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 04:07:53 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH net-next 2/5] net: ravb: Keep the reverse order of operations in ravb_close()
Date: Wed,  7 Feb 2024 14:07:30 +0200
Message-Id: <20240207120733.1746920-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240207120733.1746920-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240207120733.1746920-1-claudiu.beznea.uj@bp.renesas.com>
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
index e235342e0827..0f38e127ad45 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2228,6 +2228,14 @@ static int ravb_close(struct net_device *ndev)
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
@@ -2246,14 +2254,6 @@ static int ravb_close(struct net_device *ndev)
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


