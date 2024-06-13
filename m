Return-Path: <linux-renesas-soc+bounces-6141-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F221A906857
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 11:17:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81A70285EC8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 09:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17A0B13FD6D;
	Thu, 13 Jun 2024 09:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LVMHuVOl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F8413E3F9;
	Thu, 13 Jun 2024 09:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718270258; cv=none; b=D7gdSh8vJvkTiAzZanMjx+fX3WJJkPnHTMQ75MpLHVKdgiW0lJTA4GMtTv/CDkAdJXwwGnv/2BSFNWDf07cT/J1u7xVBVwdQqV1gswkM1sloaDQUb0YM/ayGmnCwiR5qYRvc5ZDaakYMAUZqc1MbuilBjR0GUJsmtMaW3PDRSoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718270258; c=relaxed/simple;
	bh=+3V3qanAe98hm7jfY8nmDorU71AYrMnd6Y9qmNLpWyM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=URMN9sTqKj8RLKlsNS2oLziaWzlJc/id3NJ3Bj0rJpoRJK+mNmG9ex7w9FFNuEQYDl4y/k8Ztsrojj7H8L6q6WvBFXzKKgN05P5GP/2k8JuiXVMME1rU3Wzbke9GbBOuxk/kQy/x05p9TzxLAJ53Hdj4MyRG8Y82zl17FBJh0t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LVMHuVOl; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-35f1bc63981so1175733f8f.1;
        Thu, 13 Jun 2024 02:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718270254; x=1718875054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=621zVGZpMb676Vt5UBY4ci/vfoySiauLdAxghFj40RY=;
        b=LVMHuVOlGx+0cj3iInPP7/fld1Sk3Es27ftCaZ2XW41MxxBm63kObLCXiMrkccGQSg
         5PJ/Ei7olSlgZIUxlOzBbmRiH+msj4y/qjjpJvcWZjYpLWDlLwUJu/8k5Um1EOIdECBK
         ailLELQLdxLHH9JvlyXZl+nLqYlm5P1ybD6mhZJNkAAEgAnquwLdn3AgrqRhjsHI2sXl
         VIMXthOv1aS2Vmn5pP46QskJWGZlq7HmpMuNuxKulJM0n9i4V2zwKFjiZ1OdPDBb9m6b
         4tw9JjBfZxWP/Fd7mTbvu/GnC14EmOWPxvo5/SMj6ZxQ7I1uq4Xug8VafvL4vmhyAwYS
         oScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718270254; x=1718875054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=621zVGZpMb676Vt5UBY4ci/vfoySiauLdAxghFj40RY=;
        b=VEHx7XxGgoGwqNXReSw1BLyBNYinqYgrfz/IW2PpTjEmu47CZcLF2MpqQLcuWGWLqS
         x7ZeO0juBrORKzT6uDapHGRe9A7zUw8rSeFTW93XIZ9wErU0P0elyX3MVuzMv0SZEf05
         KaSOfp/RoKKFQrmZU8CzPG+52wCDKqAM71UQG+KE68LJ7XkCAeLFN6tSdlhyPZ+kFlU9
         ePblI5Ur8hk+gZMUIw6oUo1ubV56ONkuFYKCYt0sHnZj0uSVGUg2VAomI0eADbx6hxHO
         exNrWl5z/Bw1LK0K5voidmls0/uRjKovQ2ms9f+cG0NZehUVYJzCzqs/QiHP/cdeJ+2G
         lJuA==
X-Forwarded-Encrypted: i=1; AJvYcCVG+Tl025X4ATcaaSXG6mVfAYkuHLu3i5rqHd6YBv4yiRB0mhrrmPZsp26Zpa6T33dB7bhECiuFa8JD/7opSnJPPnZzyF6SFXbiVI9b7t/TJSOuYr/tXtm78nc39asm7QEDB5y2kMgQAWlZiJoBawVlmtuvZ/myqQw7GUqtbRCY19g783B8FSCikS95
X-Gm-Message-State: AOJu0YzJQf4f1CNqbZZm+3HOr84lKIU2bUn7MWxkvF5MUP/YowgasQfC
	8V9w4cm5EyNFb72HEe/Q9cYhEZWxyuvQUa5eHX1k39eNkbCNRESF
X-Google-Smtp-Source: AGHT+IEWxBfDzhuPKrKIM+a7fs3/5PgozrIABi/DohkivbPBOhPDk0y91Gc+mogG6hDMQzmnb3J4zg==
X-Received: by 2002:a05:6000:184b:b0:35f:fd7:d037 with SMTP id ffacd0b85a97d-3607190d7c6mr2492410f8f.31.1718270254600;
        Thu, 13 Jun 2024 02:17:34 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3607509c79bsm1108122f8f.41.2024.06.13.02.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 02:17:33 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ulf Hansson <ulf.hansson@linaro.org>,
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH v2 2/3] mmc: tmio: Use MMC core APIs to control the vqmmc regulator
Date: Thu, 13 Jun 2024 10:17:20 +0100
Message-Id: <20240613091721.525266-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613091721.525266-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240613091721.525266-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
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


