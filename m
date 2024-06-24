Return-Path: <linux-renesas-soc+bounces-6703-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF4B91527D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 17:33:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D21071C224E5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 15:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B206D19D08B;
	Mon, 24 Jun 2024 15:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHeYeqjH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D571F19B5BD;
	Mon, 24 Jun 2024 15:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719243185; cv=none; b=aaL6xX7cnfAeGUjUlwMZO24S4aJku8AJsWilwpwPA+jcS+G5J6eMK3jjaJj6WXn0P50gh02JneaOn00C0j5ezI4mEaLQGI78+PvbQavhOxs1x3SukER9ZBCH+Bsvm/D/wTLFLY8RucAFSuNGPKmcyNkXQNZ37oB8zQcR0CpAj3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719243185; c=relaxed/simple;
	bh=adBfjBn/lYuTFIc79qvDoN4yHMJ3gU6p+1WC4u3x0vg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SFUxCpqACLHR6/Pi9OmOTpoo6fvWMiLGETow2JpEuzWXbSDYwem9g2Vc4QMX51ReHdm4kWNtXCLreQ4aYLV/wOn2KF4ijLhD9PpZZhfIkKJNh6PMY0oUzZ+fyp9qpTj82lpWJG4XpsChiMaSvA6huTu5DWdnI0+BdYwLM2vEJvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHeYeqjH; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42189d3c7efso49281935e9.2;
        Mon, 24 Jun 2024 08:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719243182; x=1719847982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4DUBKt45bdpe5wjdppw6QyhLp7N+nT5BsOrGXSfdU6I=;
        b=FHeYeqjHQXq7oapqRX5mAkTER+9S/RmvMmRAtiKW+feuPjE58YSBWjYaAmTIOk6z6D
         7s5rpFv3eSM9oblnEmLS1DxxLUkrxxNWxcVNNTbNt310s+OlUrT+Qa/NlEyStWG1w1+U
         XJVun0uIVZc742kL7nwmuEYnpdJlHkB6pmUtgFhoR+s1ZPVphVDp69kDkEALB9h6RNvr
         skyxbPmkEEOrHBVpLSNNc/cfMZ16hGQIPeLzLxV8OrTqQuU7jfLsEFnc4DUjvEVaXjwi
         0QtZUBp1oQRlZTo4PCHMVf38+upbhc6pyua3HrkNTpZJMIMwP4/4Q/w8Qf9uC82FqOLm
         zVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719243182; x=1719847982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4DUBKt45bdpe5wjdppw6QyhLp7N+nT5BsOrGXSfdU6I=;
        b=Tat07gaMwH/E/vZWZm2yNrVKf1xSrwulTsWIoGAXEYHAlpCTujsI/NGlM65h3ZJsZt
         wDQVfhLnoG4O1UQPYGL5cMID8QYiqUERLcaQwGmz5pO3nWQLGPEUA3hDasgCIIm8FVxP
         7yGkhVkB6VOKIxBjXI7Zk0+v9mVpZO8i3DSZ8wwPx7vRDN2LCMyGfxo5sNtTWgm70L6V
         uGqA60H9hGIz8XLCRdnHYnUTuZkWRYfAAZO4hhZCKLeucnoWG5y5XrU2n5ZuyKmMlidD
         8uVg7bb5W2KBb/Ok9vj4AY64uLoMKfplNjXttSEB3Aoch062lDtjveoO+RAifx9AtoKR
         c//g==
X-Forwarded-Encrypted: i=1; AJvYcCVfb/1p/4OCNhxCtZzNC/zeBwi7WHvy2IcZqfoXUwHHF/JjDlrRwBUJAfSnECZ4H+/7jwZK6gm1M9LHPZrITmzuzMgvAiz1wyYoQYcCDJkoJVPVszq069tyVDrtZhYUwwNCTyvOT0EICAXwc7bTLttWGpoE1vruwfCiN1OTEJRukEqQRzr2s3oqXpw=
X-Gm-Message-State: AOJu0YzspopCJwWHxwp2XkbSzrHIqJ5vKIARIe6sCOoEv39UV9HQXmVj
	CXGJ/DPjnGYM6bJaTJljLRQQ4syIsa/t8RaUPuF/fqjzl3dDm1x1
X-Google-Smtp-Source: AGHT+IFEEPfM5oG/+1NH3syrrBVVXCOpfYCyLvoOwRJZuls00XmLNraDcuQ79+lIit7p2B290brrDA==
X-Received: by 2002:a05:600c:4814:b0:424:80c8:dc08 with SMTP id 5b1f17b1804b1-4248cc2716dmr46267165e9.12.1719243182006;
        Mon, 24 Jun 2024 08:33:02 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:c315:5cc8:bc92:639])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424817b6121sm138294675e9.27.2024.06.24.08.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 08:33:01 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 2/3] mmc: tmio: Use MMC core APIs to control the vqmmc regulator
Date: Mon, 24 Jun 2024 16:32:28 +0100
Message-Id: <20240624153229.68882-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240624153229.68882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240624153229.68882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
v2->v3
- Included RB tags

v1->v2
- New patch
---
 drivers/mmc/host/tmio_mmc_core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 93e912afd3ae..2ec1a74c85bc 100644
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


