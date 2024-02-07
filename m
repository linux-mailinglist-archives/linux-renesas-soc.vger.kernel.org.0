Return-Path: <linux-renesas-soc+bounces-2431-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F94E84CB07
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 14:08:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 528911C249ED
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 13:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E72FB76C8E;
	Wed,  7 Feb 2024 13:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="U0NMg1ph"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591EA76C7C
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Feb 2024 13:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707311281; cv=none; b=UwtRgPiNHrzdmg2a+aL99GAmg9mTyasD2yYaWdtNNTu+4FitgobMydfjeqE7q7wlK5FducKVzqTrX9+ZV12+luv7OZGOI9dcCTB96+al2rrZ/dGtCIyULr7xYOd7DylFin7FumYiGz9SWQEq7EEqu03yBLVBsbsmzoPlPN1to4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707311281; c=relaxed/simple;
	bh=EkmY4sElqM8pbcli7MR0xp3fs5dAXCeOD57sfGa+0FE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pt5kzxZ55QZ4WMEVkJLRXbCyp8am59QvjKFfmZonCVb/iVdR3KQhuizAlMvK7+OR9adOITv1OMmpiW3V7mZMKN1A9xy8htcQ8uKAU2eiVgczT2UOV4yQruZWqscnB9qU0Avf7y0CNh+CV9RWgKgSpphl0pG0gwkQCWjnlaa64mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=U0NMg1ph; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-78405c9a152so35890985a.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Feb 2024 05:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707311279; x=1707916079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uW10i55FY3acv30aAFiJ1SA7rereFBOBZltidmdP1vQ=;
        b=U0NMg1phZZiuORuUyAh83Icpl/YgwYTOZreJw4bcyxQK3WAERVxeRiHivIg11QZWPD
         XISnD4eeWnylAWFVU+lEpiaGQert2zxqvuRsBT6DvFSKc2tTHGCrxMenyfm9Dgx+dAjR
         Qo5C9Ia7RXvXAXclXys3/+ruVUIMfAVxlViGbleng4l+aFVgv2XXXVE6qjeSm4Ks8qwE
         Jw3uT79tNuLGr9FkhCOY/l9G+ydR+TyRBRWB6gTn9uevCpwVqSwpouey5FhSc9ksb7so
         ZvYY8LLXnH+r3GVhw9q9NiGoR/3XmqSt39Rfw8h34V+F+Q8SLAhSXFg/htwYJJbcCZy8
         Fa5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707311279; x=1707916079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uW10i55FY3acv30aAFiJ1SA7rereFBOBZltidmdP1vQ=;
        b=Pp/NQKxS/NCBgqIcjfJ4zKSsqcUWWdWgO3nM4Hbi2Gg0eq7sDPQwbfVLlnKXFh6pus
         kIgKckp8ZDNqz70sgwGVMauK7jAl6956I72dBOYJGsKAOjosRXF7ZygnwOkR74t+ZAPX
         qnY4R2d8V7yuU90oX2J3knwAhdhAzrUVwyCM28hALs0kOqQMTkxx/umlT8yaWH3rokhZ
         wPpsT5ELdr7VgFvLkj90OMBviSCdzrjlFbxBGoXjYh1FVoYTBhgczpw3gCq9VJLQBmPe
         9mMkM+c02P2vPSguTMhx/QP6c4O4Cj6Fh70EgweeIY8l1gTgg4SjbZP3WfrgIeY37BBg
         01DA==
X-Gm-Message-State: AOJu0Yxj8K4u6G8ZHzE3gfDqcwoAuB+H0+0hY8vcPO4tqLXzmjMnbEd6
	blYExlYRvY39bAW4Fp3F8gSaNWCLwT0Yh1520QSEWXKKAxPQCgaznQDqui3vEBM=
X-Google-Smtp-Source: AGHT+IEmXVphHhpbhr+EEjCck6cBQ40mGPkdO6rXtGxppYH8Y0BfVBxD1vXPGv153r/shR0/4ENZNQ==
X-Received: by 2002:a0c:e1c1:0:b0:68c:8f4d:c754 with SMTP id v1-20020a0ce1c1000000b0068c8f4dc754mr4521665qvl.4.1707311279237;
        Wed, 07 Feb 2024 05:07:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXv9OXwnC3yotcFf/aJQSOVHvMGtgXuuhsvJ+XtjxfQ2A4hI0c31+nEroGqBMjp4jF2RSB5EnlqSw2+sYhHZnoMyfzvIu627dWL6mKpm7KDb6VM16uPyPKs/nCXHXmPdGNk6uNMhaPj4SB96ak+W5Zb9gxgSo8tzIxXQ0JwkpenGmSRoV8EQPj3/cSd72/mlXi6XcclbcTvEpb6oDmbt5uO2HxQFEHrDN3ynH2/2JbD/VDYJomqDqCTyKSBSd/YxY0wbpjCmPr2WRqynmuuKatdIbrGH4li+ANjS3daEn7eVh7OHTTDg3XPhbarc42bc9vKKQCuPhhjpMyb68t228z0h1pC1CH6z84IVTDPo0IETrKvK0DQFMkG5HDt4EaEbYdQw5bWS0I2l11gGzcmDR+Ep1k6qNbr0btpMdmPH4ce91MOj8QmlefuXg1S2SgU/zdp2GzP20/E/nPKEOHw0vT011BUAI/zxavCmZjQY/jWNWHbnFVhz0f6JlC7AhIuBrfvRNbB+GzV4w==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id a17-20020a0ca991000000b0068c9cd2cf88sm565455qvb.60.2024.02.07.05.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 05:07:59 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 1/9] watchdog: rzg2l_wdt: Restrict the driver to ARCH_RZG2L and ARCH_R9A09G011
Date: Wed,  7 Feb 2024 15:07:37 +0200
Message-Id: <20240207130745.1783198-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240207130745.1783198-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240207130745.1783198-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The rzg2l_wdt driver is used only by ARCH_RZG2L and ARCH_R9A09G011
micro-architectures of Renesas. Thus, limit it's usage only to these.

Suggested-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none

Changes in v4:
- none; this patch is introduced in v4

 drivers/watchdog/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 7d22051b15a2..f6cb63a0d889 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -910,7 +910,7 @@ config RENESAS_RZN1WDT
 
 config RENESAS_RZG2LWDT
 	tristate "Renesas RZ/G2L WDT Watchdog"
-	depends on ARCH_RENESAS || COMPILE_TEST
+	depends on ARCH_RZG2L || ARCH_R9A09G011 || COMPILE_TEST
 	select WATCHDOG_CORE
 	help
 	  This driver adds watchdog support for the integrated watchdogs in the
-- 
2.39.2


