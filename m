Return-Path: <linux-renesas-soc+bounces-2262-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9E9846AF7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Feb 2024 09:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFF1B1C25771
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Feb 2024 08:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC9360DD2;
	Fri,  2 Feb 2024 08:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="KeApL3q9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5B36027D
	for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Feb 2024 08:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706863321; cv=none; b=fpR+iaB0JVfGOTCeGxpFgXRSCI8KYaA1AHGgnHxz4cEy00fEUO/l6zsgKKqQKejeoeBmtmVZdCUiIvI48HsIMN54iRiW5g9WzubVtYGofcyLHnGz4OSW8CtRcUf87GS/jldF/UZ2/iKZTTkI7EO7o+XVjlw2Bo6kIsdhP/boBU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706863321; c=relaxed/simple;
	bh=7knUzxJaOSATsmEqjBqD5f6xLSBKqcQD+sqyG+aVVfE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WBf8VIUoSpoFBwXDKjs8mwqS7/ll9sDojIZrANB47CUYDAXw54jlhYaGjQRppESgsazA7AMp9zEqh5Y2Gz15F8yDgTtJ/b9yxGBwhhEOVRTLNJ0kbNaix5Dl5Q5B8XLRRIrkszPCsy0T6lfOIbCiObjv1hL0DKJPXQm0LegJufM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=KeApL3q9; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-55fd5f67f03so1515930a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Feb 2024 00:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706863317; x=1707468117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcPvbSGq6xN49QvaaQuCyF55moPeocRQPNZDf403Hwc=;
        b=KeApL3q9VYwm1LbfD5KvpSf6/DSat/d8nFWKDdQE0QJldx+i7B5Gz5q4i1dTSJFcGo
         qWJQeYzfGdGbPcf/aDnl0YVJG/HMPiGVGKt4GLQzwl6f0IJA76TgePN8iIzOt/dzVDJK
         36M4lY3mE5QIwHfTJm4KWaA2G4BjWGRkctmDP3kk9JZcolQuq/AH6GxxwCFD8v3igvnt
         I/IJjMLoBuZIOR0mvUYuRYxh/d+SCa5z4uLpG+fqsvnWAFZyMiYfhDPXUP5gwYqzfiWL
         ZdldmpJX6QUEXeyev/v3GfRD1wk5uw8a6KrcltmPKzvkelttjFTXlt+aXmcpqlMXKXit
         NT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706863317; x=1707468117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QcPvbSGq6xN49QvaaQuCyF55moPeocRQPNZDf403Hwc=;
        b=bwhkHFRuyqOMPHGZx57ZwFEaABBWPgxxUv5ef1IvTrS3SWLi1FfBu/YnRs5WqP1K0v
         mxU6QGbRb8DX90RRkF8Uskn6yrPBwFT/2+CAUJeyzZ9YLuqjzsbXUqF879TaP3JyyMlc
         wnXrVEUvvPIQjTiQUaMosxCL3gt7/3M0lUqR62TdwQmANnn4Y1xphP7IWTpX4m0NSho4
         qWfAYnBk0cDxDYYkgkflp7GEh98Dql4ftIc96X6JBE7jNH+ttVXJ7NaXHtX9XPoMh0Q+
         C1GJx/XgZmoEv8wYIJJ/A9HNwpbh4TXTo0eaciqcy7PIiyoxNSoSjRGBz30TYEEqLwp+
         dE8w==
X-Forwarded-Encrypted: i=0; AJvYcCVFfckvWFpgW57atjxcAKpCxyFCyPMJhfc0T5mpQtpvSEusYFlrnBGVHdx+BjN9T5ylQeUk93QdpXq93GoXlHa0eHoXkhTErfwpfeajNaBENtc=
X-Gm-Message-State: AOJu0YylWJmQ+ZaRypUCHCcknwwuomM4lnAsMo+gzAQdgQD84ACkIuOM
	mWU3UFH/X7zgKmCtovy36j3riJ6imtFYT2GFLi4kp7zydbvHx7lSAXzEfTzu004=
X-Google-Smtp-Source: AGHT+IHUg5QEIwAX1/FjeYfVhxorC/bkxITWEs1POR/iprN1aR+jqEPzp5x3sn7zuKVqxHeTAbGzGQ==
X-Received: by 2002:a17:906:3612:b0:a36:8711:f7b6 with SMTP id q18-20020a170906361200b00a368711f7b6mr3487272ejb.34.1706863317150;
        Fri, 02 Feb 2024 00:41:57 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV3hy6AVSB5ks+zaQtr4DnV/Kixqk03qDqPraUFFQM/1B+JC0kfHttEMn8AbQJ5kvPdDJ97oThb3cJIJ/VVvpapYCn34so1BAuL57J9nGcO5LJAwOqh3u2nOlyD6uNKspJV2A9Sym6Q7Hv2oAhC763Aj8rEdWk3z+bwsFj5cyLUgeAp7ob17Wx3HTfOFp+2+aA0I9OlMGQUe+wCG1JD39yrcqR8ORml6IlCLOBdLhxi3179FdXTflWQdHLsjAqNwnUvGav9H1/Uitt9tsosglgtP3Ldq/dtv4mOju4JgA6B4jyz/4WlBFImRs58mxB+DyZVr0DnqLSMrqHD/OXxLJWEUHjWg2g0M9nr6dcs92tgf402JOdfk1Ka66LO8yi2Y/o5AM8uOBiqxalpZtAvDlEvt91EAzNJmLOk/Wr+GM8Soqgc7Qs=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id oz35-20020a1709077da300b00a361c1375absm631642ejc.133.2024.02.02.00.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 00:41:56 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	p.zabel@pengutronix.de
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH net-next v6 04/15] net: ravb: Switch to SYSTEM_SLEEP_PM_OPS()/RUNTIME_PM_OPS() and pm_ptr()
Date: Fri,  2 Feb 2024 10:41:25 +0200
Message-Id: <20240202084136.3426492-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240202084136.3426492-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240202084136.3426492-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

SET_SYSTEM_SLEEP_PM_OPS() and SET_RUNTIME_PM_OPS() are deprecated now
and require __maybe_unused protection against unused function warnings.
The usage of pm_ptr() and SYSTEM_SLEEP_PM_OPS()/RUNTIME_PM_OPS() allows
the compiler to see the functions, thus suppressing the warning. Thus
drop the __maybe_unused markings.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Changes in v6:
- re-arranged the tags as my b4 am/shazam placed the Rb tags
  before author's Sob tag

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- collected tags


 drivers/net/ethernet/renesas/ravb_main.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index fd431f1a0b98..7ced5db04f75 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2971,7 +2971,7 @@ static int ravb_wol_restore(struct net_device *ndev)
 	return disable_irq_wake(priv->emac_irq);
 }
 
-static int __maybe_unused ravb_suspend(struct device *dev)
+static int ravb_suspend(struct device *dev)
 {
 	struct net_device *ndev = dev_get_drvdata(dev);
 	struct ravb_private *priv = netdev_priv(ndev);
@@ -2993,7 +2993,7 @@ static int __maybe_unused ravb_suspend(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused ravb_resume(struct device *dev)
+static int ravb_resume(struct device *dev)
 {
 	struct net_device *ndev = dev_get_drvdata(dev);
 	struct ravb_private *priv = netdev_priv(ndev);
@@ -3052,7 +3052,7 @@ static int __maybe_unused ravb_resume(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused ravb_runtime_nop(struct device *dev)
+static int ravb_runtime_nop(struct device *dev)
 {
 	/* Runtime PM callback shared between ->runtime_suspend()
 	 * and ->runtime_resume(). Simply returns success.
@@ -3065,8 +3065,8 @@ static int __maybe_unused ravb_runtime_nop(struct device *dev)
 }
 
 static const struct dev_pm_ops ravb_dev_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(ravb_suspend, ravb_resume)
-	SET_RUNTIME_PM_OPS(ravb_runtime_nop, ravb_runtime_nop, NULL)
+	SYSTEM_SLEEP_PM_OPS(ravb_suspend, ravb_resume)
+	RUNTIME_PM_OPS(ravb_runtime_nop, ravb_runtime_nop, NULL)
 };
 
 static struct platform_driver ravb_driver = {
@@ -3074,7 +3074,7 @@ static struct platform_driver ravb_driver = {
 	.remove_new	= ravb_remove,
 	.driver = {
 		.name	= "ravb",
-		.pm	= &ravb_dev_pm_ops,
+		.pm	= pm_ptr(&ravb_dev_pm_ops),
 		.of_match_table = ravb_match_table,
 	},
 };
-- 
2.39.2


