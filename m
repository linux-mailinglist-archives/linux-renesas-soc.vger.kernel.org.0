Return-Path: <linux-renesas-soc+bounces-6809-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8930D9182AE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 15:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC63C1C24060
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 13:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 008321849CE;
	Wed, 26 Jun 2024 13:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fPGSa4U+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39611836E8;
	Wed, 26 Jun 2024 13:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719409085; cv=none; b=obeYlE3kLBmErX+icU/u4SumU3OtweTjD9twOQgbFu7PjkpY/nALIkd/HtxPYQjtUZRRLqe9w8wI/d4alKsz1z0lCH/axbgcIIEKWjUv4o0pgHvgk58c1MRXDLkMss+Ir6YMAZvHWmj1ajhRnW2EsuZhNlpBBPUo/TBINbg4lkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719409085; c=relaxed/simple;
	bh=eGuiqkbqwEjTJMSnanqpeKyW7v7gB9/zZMa957ziz0s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jMESzgv1SodGHv3OgeqqVrpNCNedy/PYVUIxIc9LZd3nAw/Zz0YOVVkBEK1HfD00ZSxFZo+/XVP/kwJKmePrHPPGaMe6QxoZbxbc/oSPvDy+P/tiPkFVxX3fBQP9rDppzL9xlwWbVpVg30ck8dhL7VNmwpD2LDsQefUtpActuDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fPGSa4U+; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-424a2dabfefso18982975e9.3;
        Wed, 26 Jun 2024 06:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719409082; x=1720013882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ff1gpKAxPXlzpHjpY84/LRkN051ZvT34oN64lCkUGxE=;
        b=fPGSa4U+T8h6OD32NveJYZDKK7KNxMdKaUPZqwnWarYTaMzxqALaTwtou4sJjyxe+C
         QYn+2Oqn/e9EAK3uJ1xsq3pKKrbbFHY4sysakUqM0TMct4tZLkyWP1OLjuVvlNEahhxI
         A9zTfm7TXtSZzyROEVPu0fAbbY7ppCzPQiMrNMB8k7ZeoVqFZ086dX7tYUIOuR11EoEE
         ouHwGDxc2zjGJ4UlShqrKNX4s2H1NEMD0OcZBr0jyzdm5TtB1RZSxLZzl3JP/+Xrcfd6
         gBpnOthuUwV2LVac8rd7eqRsMsLN4o6mRonctt44zGS9AqlWFrPBgjlFPT5nx0Q7GppZ
         fHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719409082; x=1720013882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ff1gpKAxPXlzpHjpY84/LRkN051ZvT34oN64lCkUGxE=;
        b=rXEycPHiDuRw/7/7N8PyRK9+iBw70DoDK6L3ETtaf40CYmgkS99FH4nS6EPADKk/M0
         v6l2f2VLgiKKXXop7uMeU97T/N/PeyTJ2jcl4TM1Lmxzdelae/1y8APfvklYFubSP+c5
         z+MhNJzbtFcwbXXdZj8aNSdexfWuyL2HW8R4f5XXx9ugljjz89b4XxUd70NoqqiLbvM4
         lhbwZrx2gGEu9D+pyc+rJ0kTwL6/O/Xgh0x2d9bhpfhXRFA+QmyOg7RoGEJ2Qe0n5jFz
         SVE12gZ0QQvYCKJMIFHep7OX/6EdbVbfkz4RaHuUSwYQbsEzjH/MMXbIHEP6U87anos1
         U5oA==
X-Forwarded-Encrypted: i=1; AJvYcCVrxrxPQXzWXRNu/02h4Ub/p7dJG2MwmCa8CqhgRFbkeDoiLsMsgQa7oSPmAXJK70zzbMERu3o8Ag2Mq1PKzANolvpoVMAJojVfBrHBPP/pdqOiHQyw5fqPq7ySCuHeR77T3lz6ywwM3R3UJ7NntlPjJqo2kBvQny6ZCEaHUVeaSsnV1XOKXucGVrM=
X-Gm-Message-State: AOJu0YziaXn8/1oHYey87PPBqd7pnQ5vgE/1zF/x8XWQrIZBFv9UnHKR
	GRTG9W41e2QC6kFF6B5UfEDFpHnMFMdRuyZfy3NX4HOzha0PPwmg
X-Google-Smtp-Source: AGHT+IGaRhr8rWcsg4D0Zrt64f9WF2PjVX2ohxvJUG2BhaPuRQR5Cdsqe830RrZ1VR6CXaJ2dGeQTw==
X-Received: by 2002:a7b:cbd2:0:b0:424:ac9f:5c68 with SMTP id 5b1f17b1804b1-424ac9f5f4fmr18145285e9.29.1719409082097;
        Wed, 26 Jun 2024 06:38:02 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c8246297sm27107225e9.8.2024.06.26.06.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:38:01 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-mmc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 2/3] mmc: tmio: Use MMC core APIs to control the vqmmc regulator
Date: Wed, 26 Jun 2024 14:23:40 +0100
Message-Id: <20240626132341.342963-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240626132341.342963-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240626132341.342963-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use the mmc_regulator_enable_vqmmc() and mmc_regulator_disable_vqmmc() APIs
to enable/disable the vqmmc regulator.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S
---
v3->v4
- Collected tested by tag from Claudiu

v2->v3
- Included RB tags

v1->v2
- New patch
---
 drivers/mmc/host/tmio_mmc_core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 51bd2365795b..9a9e283493b0 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -897,8 +897,8 @@ static void tmio_mmc_power_on(struct tmio_mmc_host *host, unsigned short vdd)
 	 * It seems, VccQ should be switched on after Vcc, this is also what the
 	 * omap_hsmmc.c driver does.
 	 */
-	if (!IS_ERR(mmc->supply.vqmmc) && !ret) {
-		ret = regulator_enable(mmc->supply.vqmmc);
+	if (!ret) {
+		ret = mmc_regulator_enable_vqmmc(mmc);
 		usleep_range(200, 300);
 	}
 
@@ -911,8 +911,7 @@ static void tmio_mmc_power_off(struct tmio_mmc_host *host)
 {
 	struct mmc_host *mmc = host->mmc;
 
-	if (!IS_ERR(mmc->supply.vqmmc))
-		regulator_disable(mmc->supply.vqmmc);
+	mmc_regulator_disable_vqmmc(mmc);
 
 	if (!IS_ERR(mmc->supply.vmmc))
 		mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, 0);
-- 
2.34.1


