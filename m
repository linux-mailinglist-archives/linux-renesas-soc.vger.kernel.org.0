Return-Path: <linux-renesas-soc+bounces-17318-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CA3ABF76C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 16:13:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 801B017F523
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 14:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1729283156;
	Wed, 21 May 2025 14:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="cVbWjgzu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5976719DF7A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 May 2025 14:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836628; cv=none; b=l6qBsBIM1nrIvK3f8YYWmgmG9006tOpWD5g75ZqXHh4fhz1Z+3IYsdfuECmMV7zZ7EyDDwnlw0sPFccWI0LGdgxBIIJxCkBse6tOR2+4JxtnM6MWW46zGkUL4T6o3oLXcKCkQb0xIlZyp5wV7e5QMQTPZ8H+Jn2sZCeQiZGhe60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836628; c=relaxed/simple;
	bh=jZzOia2XsslK/UVTV0RsWGKc7SbGTkfUbEhS+fMGkbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=edPF7CO8GArG8F6k5iuc6gT82ozRbD+ygvo2ZMU6kWe1QzGWa57UtyrJ/ykejI/yhqpzwQ+E2FkGPSuW3rKwvaR5iEQe9FL19ryErywFKCu8dkssetbOYxLv04rCeYVQv0PQXeV4WobDN3g1Xq+jTA/8iM2HQlVWAfDP8/TW2Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=cVbWjgzu; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-601a9e65228so2333985a12.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 May 2025 07:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747836624; x=1748441424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v258ll9JbBLXOIea9jWrUjVqAB2GMAl7DarOvnstw10=;
        b=cVbWjgzuu0ZSyeUoBXslQzHX5ijm+KVDmdBZqtqTv9cW8cfiqp2vcykkKD0A3mCCpv
         dotkvDCUvVUXhhvfq2lmWrEmQ8QQTk3kTgI8TSK1tczl6Tv324u+WD3976uwhrtxgGpI
         H7gqP9czE2CpggUd42oT9bpvSxFx5p5+585H+Ikd19OMnCa3qa78WI8HZe2ynVSrGBPB
         3ZJAp6qwfmvFjM0JbzeEisrmr2wIwDcRIjS1W1p2xhrWNIFgPAJNJyk91rQzj1wb+Gq3
         82pJhGIP8SQGEUlwZuad4QMXGlgRqACA36FNyutNae1SlpYVK7/SASo9s5PacGDDMfZK
         0w3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747836625; x=1748441425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v258ll9JbBLXOIea9jWrUjVqAB2GMAl7DarOvnstw10=;
        b=DZaBmP0PjPoUqGu82tXfZ1mtsgeiRslh4ZQAHVXZR36WR+pn76xBPt2/61EiesgzPN
         9Eag+7dIuFcxB7t2Bcy53MYZftI7GK2t3KDvUSoLxQRkj11UC1+GhGutUtYX9jIwO0p2
         OTzfvaKmRH0my8SHGiCd9c6oWQAs6RlJEkJDcNiEWRyHFc9CVbgb61iCfnW5EL9VBgoJ
         /vnduCkOE0R8sLPegGIMQU6a1CFeGQiz2Rwdo5cNk4+23MLCaaryrdjW9DkRNbq3/c+i
         dInjmPVUJKhpjxcWXkFswzPAxSYtfR2/JkJcm/QsEdqgxiaL1CbVevf35vD+VFWNSc0d
         UqnQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9azqRMU5yhSbogmbKuKhzacwNTE2kdVpN1FdP3NItI2JK0rtFtZBjjhVHkQ+bcYvIqcA4YQQoguwNIJAqO+/vZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb1Pc3eVjwuU0vykoVeY1L8UShEwA3BNE4iDsA/7SxiaQITtyP
	7t6Y18zYzNoIrQfD3SfEthXdywdqI//mMw1OmuwmjmFjzOGZeMByfs0m3CQth9BkL++l+T/eKA5
	yF6/A
X-Gm-Gg: ASbGncvgCgoZ3wUK1YPbAzxvceAewIoP3R3mIujh7o0DnGZWoGU1n6B8fSl4z0k3VGo
	OQuyd8RV/RkUDjmnb4MZaB23tvsncAX6r1Orem2eP1K4oCRoqDx+v4+GaMMOqQuy+IJAK6JigV+
	WRgPIQc/xkRfPkYGBQ41y6T0woZy7JitUACrcUF+fH56BVwLJQqMxcvPMApfFE1PNHd40zLzt3z
	ph0eA1QFB6psnrFI4GyhBp955t0UjG0fqYF5R9qqo8E8Blw22XBLeImV2vI4uLDib54o2BM5z+q
	RGPATSgML1jtc4PtziWnE2VMr7xDa8weg03C3xZnchj7yxcBMLvig4bb3blVbS0wwCoR7niSJYc
	AZsRs
X-Google-Smtp-Source: AGHT+IExJE/BNkE5bINpRA4UDQooBTWGbExswmf0e5QQQgNXAyz1AiUe3bXi/hkJVkXYpmXzRVVPXw==
X-Received: by 2002:a17:907:2da2:b0:ad5:78ca:2126 with SMTP id a640c23a62f3a-ad578ca2302mr998041066b.59.1747836624607;
        Wed, 21 May 2025 07:10:24 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d271916sm914552866b.69.2025.05.21.07.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 07:10:23 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	yoshihiro.shimoda.uh@renesas.com,
	kees@kernel.org,
	gustavoars@kernel.org,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	john.madieu.xa@bp.renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 10/12] reset: rzg2l-usbphy-ctrl: Add support for RZ/G3S SoC
Date: Wed, 21 May 2025 17:09:41 +0300
Message-ID: <20250521140943.3830195-11-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521140943.3830195-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250521140943.3830195-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S SoC USB PHY HW block receives as input the USB PWRRDY
signal from the system controller. Add support for the Renesas RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none; this patch is new

 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index 016aae883b2e..98d6323e9f56 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -97,6 +97,10 @@ static int rzg2l_usbphy_ctrl_status(struct reset_controller_dev *rcdev,
 
 static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] = {
 	{ .compatible = "renesas,rzg2l-usbphy-ctrl" },
+	{
+		.compatible = "renesas,r9a08g045-usbphy-ctrl",
+		.data = (void *)RZG2L_USBPHY_CTRL_PWRRDY
+	},
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_usbphy_ctrl_match_table);
-- 
2.43.0


