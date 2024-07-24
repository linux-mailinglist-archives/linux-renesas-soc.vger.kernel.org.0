Return-Path: <linux-renesas-soc+bounces-7493-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D917E93B699
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jul 2024 20:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78F311F2498A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jul 2024 18:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227F816B74C;
	Wed, 24 Jul 2024 18:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePijRn3I"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C3715EFB2;
	Wed, 24 Jul 2024 18:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721845374; cv=none; b=F0IMEUnGVTyAR6hDY/VgiKB90mutyVkDXXjmeU2yyRBxUly+A/aNQE+9LeBGQMrJ6om2ccmmvpPd6x58oGiywqVJuSPYxiUWrBjDSW4n4xODByLSK3vHij3qUnOqSGuONYPAbKDaklIinAsnI9HsbU66IG/lgpGhXxc4SwxAK8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721845374; c=relaxed/simple;
	bh=8RGbS1SP7kcHAkCgegT9tAaFogYWT3+ldggVrglL4xE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hzJ6y3k99ZvbD9T4IMwo0pEBsdCqouSPtP9Nn9fYM3AHR0IYvwR3z7kEyPjw3LJXJuC5+gafo9lI3AId1m83/uQokzj7aoomadUYGLTWjUW9MZHMpX2/G8kIXng406ZgMecGMBOUMvymnpfd8kzln5h351S+QDN1AbmdrtSiGTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePijRn3I; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3683f56b9bdso14698f8f.1;
        Wed, 24 Jul 2024 11:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721845370; x=1722450170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VBRgR518xk+KQEVpEmgH/CVYJnO0FBFpFD/wJKYtKx8=;
        b=ePijRn3IlclGOHZkkMPIHeaFci90n4S3z/a6qJTNd9rtq9IajkooWPm+gXtDzJxlI0
         QgxWOe6nA6T03HVZTdDDnTkUKGfH0S4rYANDYxYT0wd5pVwzUzucpWGm6FJgGwZxI8Ni
         Rn8kWeamU7bL6MEJzg0yEFYdc7XVcM5sdV9++oXlahwNIoTF3ITSqVFzoEQpbf2E9iFX
         Xlr2YZJcwEBGSnLkDqbWr782VN+/oB7xnEMD+9jWU6XELSpm3XTNxZQsBluUEjJ/Q6qy
         KcT3XOIIbEvXw6wsfr3jtgXwJi/MWLPJU0yUjeomZ/N9zp1i+YucTW85ZFRCFcujz/ZY
         Fnog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721845370; x=1722450170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBRgR518xk+KQEVpEmgH/CVYJnO0FBFpFD/wJKYtKx8=;
        b=BwWhHbHIl5scv+M8VNuOLD9+iEpVjsuYF+Th4cpQDOvOkVMFI5c5z44GdgWnze2/TM
         oPYXwu3WlTfztZxlHN+FMjX3qh3AG7lO+NMF+OOQPKr9xq/49qTk536lbXIXJxn/Tb7N
         OlIqcOBNIy0W9sxtBq9O+MPU0OPdBKL0CnnOY2S1AmyFHuh415HLhYLmfTyF4f8kziqv
         jRrAHRRYpBVDTLEb7lPZYt7hXK4xIhBE7KoCL4eaJ7yTP0yaQeQiMruSUh0X+9Y+3gdW
         OtgVNFIYD4xdu611twGvDsj3gB4ZIvD20lqqQQKQ09JXm1mqQIm9hDhj/Ftjw+bvlpaP
         cobw==
X-Forwarded-Encrypted: i=1; AJvYcCVQ/L6A7LHJJvB0zRG9Hx12BSrNrIWU3i3NXF6Cg/7l4m1ZI8DS/LzlPi5/ce8hvzAz8tfBIlFPSegpHRYeKfbLDep6+r7UgiPzwovhYhHqWow2v4usDnFgI6bOuKi7FaZya7yI7/+hVEhy2dG7AoJVU9AZt1cbyiRzJMAOgOikNHIpPxoxUAImdc7L
X-Gm-Message-State: AOJu0Yz374s+rscaCCKBlYI9gwGTHrE5P1Ggk56UaScSslpQ3nNPY79P
	rwOvGSFjiZWAZXV9/F413hXRhShZD/PMk84M1j041Uw6aeAGoJ+v
X-Google-Smtp-Source: AGHT+IEl4Uv5LlJz4QK1tYvI0GnsHyfGj5ud3klmJX6ntUkaQmA+3FLc2q4FjmgDQzx2TVKrZGBGEQ==
X-Received: by 2002:a5d:4b06:0:b0:367:8a00:fac3 with SMTP id ffacd0b85a97d-36b319eb638mr373618f8f.30.1721845370393;
        Wed, 24 Jul 2024 11:22:50 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3687868b5fdsm14909882f8f.38.2024.07.24.11.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 11:22:49 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 2/3] mmc: tmio: Use MMC core APIs to control the vqmmc regulator
Date: Wed, 24 Jul 2024 19:21:18 +0100
Message-Id: <20240724182119.652080-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240724182119.652080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240724182119.652080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v4->v5
- No change

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


