Return-Path: <linux-renesas-soc+bounces-2099-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAE7843970
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 09:44:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A958B241AA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 08:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8516869DEA;
	Wed, 31 Jan 2024 08:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qXe4WuFF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E9469973
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 08:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706690517; cv=none; b=NzkZ6Zl9L6ySstZSdEVDOy695oqAM+GeUhj8NSUnoW4rdsgMOpmxcd9muI7ac9jeG1CneiunbaBhFKVQKm/6nr0mjb4TYcYhiDcZMEG07M1SLuFZdLS6lSO5CZXfE4EpMxcljdT/XrmaD0pd3mEYvH70DeEjGnFD/Aj0E47KTCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706690517; c=relaxed/simple;
	bh=/PWJylbKKwrgWlPJgrOJpkH0IScCVBZN792i+Gp+2SI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G56ngFjUxmkVceiKZuccoaxV6S0Rzu+F4mpWiUlsSJpHfWfQy6ddQhpuBnZdSpE9izn10DDqcIYh8Z5ayQcNM7jH9VkYBb3TVa/JYPaDr+C5ySr3ZyaMIm74+ltsigoz/zcrIAOD7+cf4VZ2wo4QjSR8we0nuEiCZ6B6Ik1PPn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qXe4WuFF; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-55cca88b6a5so4946321a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 00:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706690514; x=1707295314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itOIGVA3R7eyMhVQYhNOchTm4KKMCVx7yc0jtC14CEA=;
        b=qXe4WuFF/jIibmNYjRzxdXnwE2P7yHJJUwh0IX/kXluVSkktU4EJ5YB9Yz1se12gyb
         qqFc3DLkPehoPlU47mcs99zFFlrafTGISMkBIdy5VnM/Yt2Tw7l+e4paoGzNC+1XJqOK
         Qpxomv8J8fUBNuoyfJkS6ZHYciSWPqrq2768P+qPTsD0gtGk6/NRveNghVVAw4lFL6j0
         IznFAQTgtaWJI7emXI5XuG3xXTIJUi6LSjglhS3dqCg9XGQNSFmXS4Oa1rfIjw1E4tuQ
         mpcYWMVzDgMBzb8WnW13EDqVcDRmPxjgo2HOPpxKMZnWU5YQAxqGu0+pd7cT3P5KoHJX
         AktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706690514; x=1707295314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=itOIGVA3R7eyMhVQYhNOchTm4KKMCVx7yc0jtC14CEA=;
        b=m5y8AjWuNGW816xOKG7SzdDMZhk/vNMiZ1p9tAgpO/ws0nM9AlI0fY5/uARb7u8pp+
         8ZUAVCqzzqMvdyyOgaCUIEDsXIwxiruDeCGWdrQMbEgP6wrIwBLxR89EB3qf82k22kPp
         sBaFw0c02GTHoWYSXl5xr0jL6jAeONBN36dN8KrmQwI4n3+r8S1hJJnNjNrTQMjtTumL
         vvti9EpePMqAjGKX6LkcbkTZxYISb7Ar2ZRSHMsA+EOdT78my7yZOGUeQpSgs7FrzGeS
         MYv5BRAtouUbNUKhO5zYVZmwQJ+Tlgh0su7frRqBkVqe1z+dRB/ixnt7bc5nl5JGrtsN
         5QsA==
X-Gm-Message-State: AOJu0YzW9UQvSkWTaRawa9EGd+D+fCFApSJkYFtX+nACmUwxH6q8RVLg
	LS7foQ63YC4CTDzPbNOe2g+n6j6hHXDla9lprKzXkLuNzCUHz7Rzk7QvTj+DHCU=
X-Google-Smtp-Source: AGHT+IG9rGImo292r2RZzxIGuzmZgarHtrrUyPsuHv+Si+ydCummwyBkISc94Tv4f6xKXAs77SJF1Q==
X-Received: by 2002:aa7:d295:0:b0:55f:80e1:29 with SMTP id w21-20020aa7d295000000b0055f80e10029mr581032edq.1.1706690514031;
        Wed, 31 Jan 2024 00:41:54 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVOa7jtGLIUOzbqQlRyo7VdLl2vPSo50eXt1GVm+ze22BKVkK2vAwQy30mcxXXWsk49Buip2FgifGbUKUW2PKpUWqAxmUMuJPFTiP/vj858c1fKxX+GaV2MdSPu6afhocNYu6xXgCCFFiw4M1DsMKuRNOddHzMKyC5qi+5CIpPxIOMyp3owAsm1+BPXn9vsRO8g5KgLFhpp24J+2Y2u3sBBrS3KykLjVXlT6eql1dTjJvd94SsjGKMbSWYKQH4srHfakkrivvKiYVNO+P1dz6X1EblE1bzDg6z/0+eepILVQtQXUOrwHhJDQcx2SZHomtAyz6KtrGSXZt1JJA4I4KpO0mCro0agXucYU6V2IwqSddMpQN3Gl6gZU5hRusy7WnqkYW2K7ZecZ3spdSYslbfAjaGIWM3SVu1ccNtTTXlVgqR0U0A=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id cq16-20020a056402221000b0055f02661ae2sm2863630edb.78.2024.01.31.00.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 00:41:53 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH net-next v5 06/15] net: ravb: Assert/de-assert reset on suspend/resume
Date: Wed, 31 Jan 2024 10:41:24 +0200
Message-Id: <20240131084133.1671440-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240131084133.1671440-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240131084133.1671440-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

RZ/G3S can go to deep sleep states where power to most of the SoC parts is
off. When resuming from such a state, the Ethernet controller needs to be
reinitialized. De-asserting the reset signal for it should also be done.
Thus, add reset assert/de-assert on suspend/resume functions.

On the resume function, the de-assert was not reverted in case of failures
to give the user a chance to restore the interface (e.g., bringing down/up
the interface) in case suspend/resume failed.

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- collected tags

Changes in v2:
- fixed typos in patch description and subject
- on ravb_suspend() assert the reset signal in case interface is down;
  due to this the Sergey's Rb tag was left aside in this version

 drivers/net/ethernet/renesas/ravb_main.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index c05d4a2664eb..c2b65bdad13c 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2978,7 +2978,7 @@ static int ravb_suspend(struct device *dev)
 	int ret;
 
 	if (!netif_running(ndev))
-		return 0;
+		goto reset_assert;
 
 	netif_device_detach(ndev);
 
@@ -2990,7 +2990,11 @@ static int ravb_suspend(struct device *dev)
 	if (priv->info->ccc_gac)
 		ravb_ptp_stop(ndev);
 
-	return ret;
+	if (priv->wol_enabled)
+		return ret;
+
+reset_assert:
+	return reset_control_assert(priv->rstc);
 }
 
 static int ravb_resume(struct device *dev)
@@ -2998,7 +3002,11 @@ static int ravb_resume(struct device *dev)
 	struct net_device *ndev = dev_get_drvdata(dev);
 	struct ravb_private *priv = netdev_priv(ndev);
 	const struct ravb_hw_info *info = priv->info;
-	int ret = 0;
+	int ret;
+
+	ret = reset_control_deassert(priv->rstc);
+	if (ret)
+		return ret;
 
 	/* If WoL is enabled set reset mode to rearm the WoL logic */
 	if (priv->wol_enabled) {
-- 
2.39.2


