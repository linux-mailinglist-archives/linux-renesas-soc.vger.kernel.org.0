Return-Path: <linux-renesas-soc+bounces-17763-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D834ACA8D4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Jun 2025 07:12:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39794189CF57
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Jun 2025 05:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2F6192D9D;
	Mon,  2 Jun 2025 05:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="bJHOkuky"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364C718DB0E
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Jun 2025 05:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748841101; cv=none; b=RgWJQxBM9eFVFVa/m/l/e8oQaap0Oa2Z6g2pROnHM0103bAoBmodXAofTK8ALEsG169g94n6de4hh233wMrNDvzEu32g8yzl8OTBbi/DTC72BN4tfJV8S/P5u6Oq9XtMreK93VbwirRtTuHwW9M1dKu8omi9n7sFV2eru/oNcg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748841101; c=relaxed/simple;
	bh=+pqB+woQ+johQDR7Xt+BkyHCFQPBmolBse1yy1Pv8T8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jStgj5VTwjZ4qCbCyCOWZhrHClu7xsAs6pl6dgrEW7st4sORsA6MndZmP9aWHhTKdG987ZibDwnkfa4iN6Iu6PQIE5g2DH3yzN247vF0z9HEeMPRsQz3GXa91Q+sobuOWU+2pyDiCBu+7hyumOASOlKtdKEwcn13kpuRM8+AOxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=bJHOkuky; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-234fcadde3eso47779755ad.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 01 Jun 2025 22:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1748841099; x=1749445899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SX4qDXPOyGHybeO07OFB098vYbgW31M4pU8wGvxmZ/8=;
        b=bJHOkukyjQZ5ifLiEl0myWuNF/sJV1d3PPHO5MY/90iI1fDhbYkpp65Dtqe5HZDB9M
         0RFTbwlu5nlUhrs4MUVP/NKEZtYlBws6R/EaS/507s3W6TZZA+hsGQ4mtM3Iro3+U81c
         WNXnG13HYqlVOA06g+xYFpelzcewdzjI00SC8HVeaUSVeDcd94PMlKgzEeRCISm5SVq7
         9PB55OpjNMuCEgiMDMYyCM8tAXA+9ZdNNlSbCKrFluOvo20Dz2+uDQ3/35vQ7h9T7DlC
         3KbQClvmK5D+7j68OasTakHpYcez/KwDgHTtTLMvj6E6KPuSs+EBEh3mYaS4hJLHzgDk
         D25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748841099; x=1749445899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SX4qDXPOyGHybeO07OFB098vYbgW31M4pU8wGvxmZ/8=;
        b=EGlcZ9y3m+4/taeaY7GSn/EIlPi6FFzZaALO2kgPTnlTuimDRIqy/F76O3i0hU+pRi
         dZrlTqhfysCW+WPB7+zZjOEw1kz4Pik3QJGNFDtv1xDbbg0U+EHtt8YG6P3tvLHCUXxE
         hnd9xZ5CZpukOFfAzA8CSdss9R+O/wa/GkoTefnsGEbq1P9i+cwhiWKHqSLNjoOnmapf
         o7FXAqMe36lSFTxjJhs5rldWMVEaplYBOV+Ix6GmmQA5CKfE7ot7HTNKfz+IcPXCvWM2
         pw/ZzTzxuPK/vFV99/DIfJ47Pn3E4Y75B9PGCNyLcnmBZ0ZFbQMSlQKOk4w9xagNWExU
         FPBA==
X-Forwarded-Encrypted: i=1; AJvYcCVYD+uQGG2ITBI/9Q1IRHOFRDf3FAVMhjHAxq0//wNSL1HSMDdtTu5uNriwoT18clhsTgkCOfgSeHzglgSjyDZu1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwRBETFtGd7xKoq9Oug03OfZiKA3KmOJPtmaSeSRh8Li8KuW0p
	hP2C+z6JocAOzlXAhvz80abzhbCkN0lRXeZNCqEsH9qGyCKlWHVz4YWaAFW+rCbWaj8=
X-Gm-Gg: ASbGncsbqhU4RSh8TKxiHqmU10FsbWeIgqA/ikfWrNGYpKbEzxR87i+/WE7UVCPOKVz
	k3CP4JF6mkfuwh9bOUCEXCgP90OSdqJ+E15ut6g9AnOpX+8sCmwxy6wxei2ydhjjG24lkx/id/6
	WwkE3IStAn0IfpH/WH1GUp+JNxAvnCS1Xa6tkUP4b+oxc76MlBlVGanGs/Kh+L44XTFROiS8enp
	IYd2+rl3gVBuizRD7pCnSrYUifJXP0z6QxvBj/CXQqZLOsXKlq0EljhcbUS1b4KT/7lQb8bpdb/
	YPkMnMa69nREJSR7z0/pyJAfYe7X41mSvIGKZxO0xPojw7BY83SeBjqrzKDCOU0nHg+ZllFX
X-Google-Smtp-Source: AGHT+IFaWnoGFbax5U872Z0YWq7JXogH8BZhBsBdP2E8k3bemDAidjl2iZmiByhbIG/70t/jYpFxFw==
X-Received: by 2002:a17:902:f70e:b0:224:376:7a21 with SMTP id d9443c01a7336-2355f9ef4damr87327775ad.42.1748841099440;
        Sun, 01 Jun 2025 22:11:39 -0700 (PDT)
Received: from localhost.localdomain ([123.51.235.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bc85fcsm62709085ad.38.2025.06.01.22.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 22:11:38 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	grant.peltier.jg@renesas.com
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Chiang Brian <chiang.brian@inventec.com>
Subject: [PATCH v4 2/2] hwmon: (pmbus/isl68137) Add support for RAA229621
Date: Mon,  2 Jun 2025 13:04:15 +0800
Message-Id: <20250602050415.848112-3-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250602050415.848112-1-chiang.brian@inventec.com>
References: <20250602050415.848112-1-chiang.brian@inventec.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RAA229621 is a digital dual output multiphase
(X+Y <= 8) PWM controller designed to be compliant
with AMD SVI3 specifications, targeting
VDDCR_CPU and VDDCR_SOC rails.
Add support for it to the isl68137 driver.

this patch depends on patch:
dt-bindings: hwmon: (pmbus/isl68137) Add RAA229621 support

Signed-off-by: Chiang Brian <chiang.brian@inventec.com>

---
v3 -> v4:
- Add Changelog
- Remove unnecessary "From" tag
- Link to v3: https://lore.kernel.org/all/20250303083537.3312250-1-chiang.brian@inventec.corp-partner.google.com/

v2 -> v3:
- Fix the corrupted patch by sending plain text email
- Link to v2: https://lore.kernel.org/all/CAJCfHmWJ9N1R8x6ikU02_RYq9ieq6yWY7CGdfvc4hRqHnX5szg@mail.gmail.com/

v1 -> v2:
- Modify subject and description to meet requirements
- Remove the override of isl68137_probe
- Add the of_match between raa229621 and raa_dmpvr2_2rail
- Link to v1: https://lore.kernel.org/all/CAJCfHmXm-fPD70uN-mNJdJkzf9B526y8p=Jh5E+W5cwJ0NVhEQ@mail.gmail.com/

 drivers/hwmon/pmbus/isl68137.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index 2af921039309..c52c55d2e7f4 100644
--- a/drivers/hwmon/pmbus/isl68137.c
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -63,6 +63,7 @@ enum chips {
 	raa228228,
 	raa229001,
 	raa229004,
+	raa229621,
 };
 
 enum variants {
@@ -465,6 +466,7 @@ static const struct i2c_device_id raa_dmpvr_id[] = {
 	{"raa228228", raa_dmpvr2_2rail_nontc},
 	{"raa229001", raa_dmpvr2_2rail},
 	{"raa229004", raa_dmpvr2_2rail},
+	{"raa229621", raa_dmpvr2_2rail},
 	{}
 };
 
@@ -512,6 +514,7 @@ static const struct of_device_id isl68137_of_match[] = {
 	{ .compatible = "renesas,raa228228", .data = (void *)raa_dmpvr2_2rail_nontc },
 	{ .compatible = "renesas,raa229001", .data = (void *)raa_dmpvr2_2rail },
 	{ .compatible = "renesas,raa229004", .data = (void *)raa_dmpvr2_2rail },
+	{ .compatible = "renesas,raa229621", .data = (void *)raa_dmpvr2_2rail },
 	{ },
 };
 
-- 
2.43.0


