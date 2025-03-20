Return-Path: <linux-renesas-soc+bounces-14690-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C024A6A815
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 15:12:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED642188C6D7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 14:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06EFD22332E;
	Thu, 20 Mar 2025 14:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B1oLyqwG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA8C222596
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Mar 2025 14:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742479254; cv=none; b=a1hY5Poi6YbklSRpkjgwLBvLIkRkNmWKJeTIJ1abgMFzGUSeiFTclf04+1Bin8UCC2L2Mo8CfrXttm2bldxunWddLMnWT4d0DMUvEXvLxKOCAG7tEIFJy0ZKaORmvc+SA0qjQlWNjpButqQMsDcP5mJiklasbHS3dQBPys/9zJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742479254; c=relaxed/simple;
	bh=VhD8Av3HSuJHTUiv2cdROzFQDA9TdxYn3udhBrPmLPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AUdb8fJ7TGgVIrSJzyifBYYQP8YO3W9kakOKSiXoqOXhpjByfNyUWCyHRbwPv7YBpc/FYUsXScgkPdf2ccZI55tMkG/z4KysYN9mxKfyAi5gIq052IRFfV8LUyosQR3mjx/3QsMetcJgaPIFlcjHX/ZUYMx4ONEiX7JLuarItsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B1oLyqwG; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30bfc79ad97so19698301fa.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Mar 2025 07:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742479251; x=1743084051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYAI2eqixUcWJERcq8+IYiHipQCgnbOCM34Jd7N+9HY=;
        b=B1oLyqwGqyT03rP0GFXC82s/cDUh4gdQlsUNZve/uzwAbLZJk2y/RLv6ITzPYDRx2M
         etIcDIxYMpHP57RLIZhziRzmc0pmXnh6xJxrEQ4wCJlOJWnuAOXjfRL8p/1D+XJZa07p
         jbhbMWdRoS3f085uzNlQ+MhdThzt76ct++dW81eKzTEJkSmvKIZ2CopIVy2M5RwgQUIM
         h3RHxuYwFMtB96hFhSI8hVSul1FnxSVF1LJLJP/K108g2vidlIeegvkzlKNBbiEqtybk
         1JDdZblJdqSeS8IDdOU7cI3JSSFlb6avt5L5dvO7wxgKc2a9xlqvZZI4dYuHDkiPVtOW
         nWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742479251; x=1743084051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RYAI2eqixUcWJERcq8+IYiHipQCgnbOCM34Jd7N+9HY=;
        b=tzzIApXSD9kG0qevISBKfogOPCfLnRCrVUOTuMXhdPlhxJSzwamabGibiaJQKwP77m
         j2dnz9czy+4/neZcHPlAZYPqkYF6b1fIjj9PlIuH+GYvwtUbO832Vz3pUaGo8tWu58yQ
         UhgozGNUUi9lYIqfBWhbSPJgYw/LtVw5D1GDMlyKjHBB//XdJ/KI0W947kO7Kx3baD5u
         Ix2L6MelodhFMD6GNS16tnrXarVsKAjcxVA35QWTiLwGRYX047J4hRoek9o1SKGrBbcO
         93XyE6eepsVM2EkMnYEk2V742dayzePIc9ZjYV+7Nak06K+t+ut0pmtz0FlsQ0TrXPKo
         dDPA==
X-Forwarded-Encrypted: i=1; AJvYcCVuTLm8BVFeSA+WWUY6BE+3VgPZY6eECj5jjD8SmdFsch7ejQlhL923TKe32V/gGJkdkTHaI2+l2mX/jPexyMjiNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwK+/p3uBBc8V25NxXbgQ41ccsCSjlKZniCfzLqBOcGoQ3TYs5X
	UVTZOk0Vd4d5xYo71EDPeKe5hm9zHjYb6+D7yqR5lzpBksbAwAcWjec1nlBPhwk=
X-Gm-Gg: ASbGncsedA5ivraqlvMSL/ZDbyfA/dj50jCNDeIvvskD3/qlI7rBTnSHqVf/LPUxYHm
	5zxbztoN/2av+uH996hv/OGQ6vXBDI+5jHNKE3ugbxrwI40IqkzURspk/FlKD5mBbEwP6LRM529
	cKcbznZ+xLiKOIwjedsyT7pwOa0nhlfnDL1/EYHV0uVdhkGnWmpiHOgCA2onnWKPFTm/S0LsASt
	TWsbicfktaErM8owhKuzEMV+bnxU0i1qyzgmJDMPtEIKhAPV9haXEySiUfgJZ/yb5Ix1XcWD1uY
	SeDmOgZPOYK4RzaqP3apOEvnjpJl6zktmJL4KHFq/H1cqLqchVx4kGryhjPjJPKRieCwugHIetv
	YGtWy8Cy2vMXajAqdj5M=
X-Google-Smtp-Source: AGHT+IE6l4M0DQlQYZg4ALvU5yllXDeu5+WFY7sQJFtppyPs0t//66RIGxg0FcrWHeDey/P2LeUHtw==
X-Received: by 2002:a05:6512:39d6:b0:549:6309:2b9d with SMTP id 2adb3069b0e04-54acfaa1caamr1050147e87.13.1742479250703;
        Thu, 20 Mar 2025 07:00:50 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba864dd9sm2295029e87.148.2025.03.20.07.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 07:00:50 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] mmc: core: Further avoid re-storing power to the eMMC before a shutdown
Date: Thu, 20 Mar 2025 15:00:33 +0100
Message-ID: <20250320140040.162416-3-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250320140040.162416-1-ulf.hansson@linaro.org>
References: <20250320140040.162416-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To manage a graceful power-off of the eMMC card during platform shutdown,
the preferred option is to use the poweroff-notification command.

Due to an earlier suspend request the eMMC may already have been properly
powered-off, hence we are sometimes leaving the eMMC in its current state.
However, in one case when the host has MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND
set we may unnecessarily restore the power to the eMMC, let's avoid this.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/mmc/core/mmc.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 3424bc9e20c5..400dd0449fec 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -2014,6 +2014,18 @@ static bool mmc_can_poweroff_notify(const struct mmc_card *card)
 		(card->ext_csd.power_off_notification == EXT_CSD_POWER_ON);
 }
 
+static bool mmc_may_poweroff_notify(const struct mmc_host *host,
+				    bool is_suspend)
+{
+	if (host->caps2 & MMC_CAP2_FULL_PWR_CYCLE)
+		return true;
+
+	if (host->caps2 & MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND && is_suspend)
+		return true;
+
+	return !is_suspend;
+}
+
 static int mmc_poweroff_notify(struct mmc_card *card, unsigned int notify_type)
 {
 	unsigned int timeout = card->ext_csd.generic_cmd6_time;
@@ -2124,8 +2136,7 @@ static int _mmc_suspend(struct mmc_host *host, bool is_suspend)
 		goto out;
 
 	if (mmc_can_poweroff_notify(host->card) &&
-	    ((host->caps2 & MMC_CAP2_FULL_PWR_CYCLE) || !is_suspend ||
-	     (host->caps2 & MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND)))
+	    mmc_may_poweroff_notify(host, is_suspend))
 		err = mmc_poweroff_notify(host->card, notify_type);
 	else if (mmc_can_sleep(host->card))
 		err = mmc_sleep(host);
@@ -2191,7 +2202,7 @@ static int mmc_shutdown(struct mmc_host *host)
 	 * before we can shutdown it properly.
 	 */
 	if (mmc_can_poweroff_notify(host->card) &&
-		!(host->caps2 & MMC_CAP2_FULL_PWR_CYCLE))
+	    !mmc_may_poweroff_notify(host, true))
 		err = _mmc_resume(host);
 
 	if (!err)
-- 
2.43.0


