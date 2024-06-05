Return-Path: <linux-renesas-soc+bounces-5847-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E69BF8FC4FA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 09:50:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1F682820E0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 07:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC4118FDCE;
	Wed,  5 Jun 2024 07:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYBtDMNP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3173718F2FF;
	Wed,  5 Jun 2024 07:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717573791; cv=none; b=GU8kMfX0Q4QGqF4N+84PdebpaQMvbNaiotQQMCoUUILKQZFY4OKQxcm663YvMV9hzrbqzwoSqwoa/WFqlQ6D+DnusraLcOUEfu3MevCQxhvSJmVNyFtfZteFxx3c7ln6MzDmhGPR5KUHdh2Lr0aRI8VWrBRDkOggW5jJcepOb7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717573791; c=relaxed/simple;
	bh=GH/4yyA1cV2+k32gNINOfNb0ZQS63KppAFTgUxvFX1k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lHALVC0/YruOZUxYkdtKHA3SJTSJ6aDIOz9q5PeO6vm0uJu3lRB4aeAGcZcekzHX/eWE4gER4cMMqb/aB+dbBhdgmzNpq1oRbO/zOO4U8zcJT43N97Bek5+lIBLAxorrj0zzYhAbp+oA8zUbFU1n31cq9fOzZtQKZOV1trcz78w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYBtDMNP; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-421392b8156so18806875e9.3;
        Wed, 05 Jun 2024 00:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717573788; x=1718178588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOPojFycEKbDb+6xYRN5lk81bk8N46X2BGBEfSW2AyQ=;
        b=ZYBtDMNPkdh6k0aqbFpCqtHLGd+xZIWBcUseZR++Ph/hAPRgJ94k1qlTNsL3a3gqe9
         yDC/od/P14SsyvgwB22uPoD5muUVt7CVbnx/tXoqO8KykIXf7lo/XJDSiyVOtDRlQRBr
         e8TMBwzwA5xiB1CMghc60Y4f/g/m0nrzZn3K19CkLqRg2zttUm8AMC9qeMzbIyYaw39W
         NXQ3QoCmLiRU0KK15dTFTVnwoMpAdFfnX0dAwKXCCDMYWd5LaDC8ODZTeRbI3kiM+Fqv
         jfXn1j6bDXb7hMHPLWXjAonSasOk29+73qIkuUT9dng97oKqcVyvKCwel7+BEZmSLwqA
         nYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717573788; x=1718178588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JOPojFycEKbDb+6xYRN5lk81bk8N46X2BGBEfSW2AyQ=;
        b=WlUFeEqcv53pXmpms2x/sO4jA/nNgIQ19o6Ijs6hx4BFIdc6LoUyypkdHulN4D/D8n
         ufbgnkt2NIE4pHAVixg6tnDK35oBSgvm4LTfWdzi6JCZcbTTv7I/CDLtr0ToF0uxAulo
         nk+xV6wf2H74BHXvHk+G87BkaJm/kJw6yTSMW5V8M6hWzQVzuGyQxUCKTd8mhRUaFCf7
         ow1AjyMrexzkpg3MbtRkcDSie5z2bSNzJecCTUh801fEGSZEKAfXkj4V24LHTNgiz/WJ
         f7bZ137KcVp3QFRZivOnCS/thNjyyvOXbUUspqu72FFyy3lBMGPYacJ/RIOdEc6Z8adz
         cMSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw+e772x6PworQjqrRjl7Odh+9ppiygdsj3EFoCAHcJmjma0A/DViftZq1Cw40GpCawYrpItxabN+cjkvGKne2sLaMHFm3EWyKWBBEme++bb3V8LHa2EcoYv1IU3vZui3hAJOGcToHgjNiUXBlwnbJDmQ6Enp9hTHBnc8ez74jnqXGBUTi2MoL1rom
X-Gm-Message-State: AOJu0YwYN92t2S8fW/QjQVGdrRvjslmEuWBltXXAYmoaykCjLS/zu3hw
	j6U0o1RZ2hrNZMtVHEDBV+PhM2UZKJaKWsSuaXs4EGeTfd/DLhAs
X-Google-Smtp-Source: AGHT+IGjkFT+ZKnjgwFk64cxSbtgs50RgnBYPxpbZoJAZJ3zr6J5iDQsjOlfhX/xxMDqfe1IA4qOcQ==
X-Received: by 2002:a05:600c:4e08:b0:421:5242:ee2 with SMTP id 5b1f17b1804b1-42156f8cfb8mr11024645e9.25.1717573788214;
        Wed, 05 Jun 2024 00:49:48 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd064bbb1sm13527200f8f.101.2024.06.05.00.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 00:49:47 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 2/4] regulator: core: Add regulator_map_voltage_descend() API
Date: Wed,  5 Jun 2024 08:49:34 +0100
Message-Id: <20240605074936.578687-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240605074936.578687-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240605074936.578687-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Similarly to regulator_map_voltage_ascend() api add
regulator_map_voltage_descend() api and export it.

Drivers that have descendant voltage list can use this as their
map_voltage() operation.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/regulator/helpers.c      | 31 +++++++++++++++++++++++++++++++
 include/linux/regulator/driver.h |  2 ++
 2 files changed, 33 insertions(+)

diff --git a/drivers/regulator/helpers.c b/drivers/regulator/helpers.c
index 6e1ace660b8c..ac62d778e3c0 100644
--- a/drivers/regulator/helpers.c
+++ b/drivers/regulator/helpers.c
@@ -368,6 +368,37 @@ int regulator_map_voltage_ascend(struct regulator_dev *rdev,
 }
 EXPORT_SYMBOL_GPL(regulator_map_voltage_ascend);
 
+/**
+ * regulator_map_voltage_descend - map_voltage() for descendant voltage list
+ *
+ * @rdev: Regulator to operate on
+ * @min_uV: Lower bound for voltage
+ * @max_uV: Upper bound for voltage
+ *
+ * Drivers that have descendant voltage list can use this as their
+ * map_voltage() operation.
+ */
+int regulator_map_voltage_descend(struct regulator_dev *rdev,
+				  int min_uV, int max_uV)
+{
+	int i, ret;
+
+	for (i = rdev->desc->n_voltages - 1; i >= 0 ; i--) {
+		ret = rdev->desc->ops->list_voltage(rdev, i);
+		if (ret < 0)
+			continue;
+
+		if (ret > min_uV)
+			break;
+
+		if (ret >= min_uV && ret <= max_uV)
+			return i;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(regulator_map_voltage_descend);
+
 /**
  * regulator_map_voltage_linear - map_voltage() for simple linear mappings
  *
diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index f230a472ccd3..6410c57ba85a 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -735,6 +735,8 @@ int regulator_map_voltage_iterate(struct regulator_dev *rdev,
 				  int min_uV, int max_uV);
 int regulator_map_voltage_ascend(struct regulator_dev *rdev,
 				  int min_uV, int max_uV);
+int regulator_map_voltage_descend(struct regulator_dev *rdev,
+				  int min_uV, int max_uV);
 int regulator_get_voltage_sel_pickable_regmap(struct regulator_dev *rdev);
 int regulator_set_voltage_sel_pickable_regmap(struct regulator_dev *rdev,
 						unsigned int sel);
-- 
2.34.1


