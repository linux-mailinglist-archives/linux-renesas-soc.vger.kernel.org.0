Return-Path: <linux-renesas-soc+bounces-17762-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 054D6ACA8D6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Jun 2025 07:12:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9099F3A9766
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Jun 2025 05:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 390BE18DF8D;
	Mon,  2 Jun 2025 05:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="bkdfrsbm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DAB17A58F
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Jun 2025 05:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748841100; cv=none; b=DtXNY07bbWeS4aP0GvBn5QkRadTRne6vRIz7uedVVTMy30fo9FfDEh2O5MtNSraa4cWWbsvBqxT85V87sav4V6Jd6aww/+Ebr+4Qh0qsNDaHHJOyzCLtrJ2Wn55rL+IUNCKgoTFB72VkvkLA6wEcAmChXZDL+Tu4t5YBZiDOouY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748841100; c=relaxed/simple;
	bh=fBMmraWfxLq7HUrXgoImc3vLGw7rNTiJCLSX9/+vBE0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nof4OZVDNsJrg6IaWarmRXlwssDDeYnA9snvqiqnxc/qvGMaCPpc+D55jOsPm6QCxEAW7phSjA9JksWs1b6s+5mHC0Y5NPJUIXEd8GkCjuJD7Z9I2Q1IP4yvOqYyA1Ek3kDzZL0Bp7QDVlMjoEb3VYlxjNo8tAyfJxTqFQ3cqdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=bkdfrsbm; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2351227b098so25868605ad.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 01 Jun 2025 22:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1748841097; x=1749445897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpy7pqswBlGBPIRq9ziJBUuXDhOQvEIp935goKXFdPE=;
        b=bkdfrsbmWUt2Gth6JJ5K9q4/qeCbN8uHrXCG1cN0Va3DkpMxijXcavudF2AMDneJak
         30JhWyCH+JtfNMTP9pntDswp5kon3801o7dUFlPqPSCeChRmB6kAL01koTtay4FFwamO
         Iakr8NTorhaQ+mApaMwZD05tLfpKLvq8B90V5H+6Tkb4m3+XlML4VfEqg46xnl9377g0
         tNCzTuszRLiFETLwwZBMR6Ta0SnwvfyxdmzvRSSCfa3/9eHUfxRyDk4VZ3d9TbIlSrWF
         rPfTgS1HAk6y8KCsYYjJsR2fnHHEeWErpAHbryig8N6P0uez9uZEcluZ1aVjt+jLAsTt
         1q9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748841097; x=1749445897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wpy7pqswBlGBPIRq9ziJBUuXDhOQvEIp935goKXFdPE=;
        b=dZhpPxHAiGzQOH/Na+H8Q7+AJGYWII1E3tF1tsaVYmBAog2+d/qBTVSzb+sfmKNfRI
         kO+YKtJ5tPYcgB/AMWOZdJJjVJMZjCYKNxCyJ+druokMe0IoqpmfNeyA5iGmFEXZPZFA
         hCTpGkMpS9Vap05i5AxsJa/T+ofmzj8cl0Gjv3YjFAuYPVZOHtOtYZHVHE4wd+udG21a
         S/ol3sUo6tRUBY2Xq9TG0CUVI4Eau/9U8NrOQmVntviUrIPPZqRhbHPku61YmIqXn8lj
         /Tbr8Me4iqVZ1IA6JlEWVRIlZ6nxYwarFzlscPsHQqx0D+W8ejGh2NTPpr7ZUuEI1s+7
         02VA==
X-Forwarded-Encrypted: i=1; AJvYcCULahWKSFAdZhlR1zwMOz2muyi4s/DOvNV1wB/AvKZ0GzOAvcOnhhNLiY0eZhNXNthkmslpqqlrlZa8FzbG4xnD5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrFPgdluTDpxvbISfLTUh8UfF/5/RvGxIK9jDaUhSwGw+kzfWA
	AgIP1NivCuMonkmXZqkG3nsXU1IAyJ5AbeJTEfWuOp1X2c9Hc7OOYTHCQxU3ygE9onM=
X-Gm-Gg: ASbGncvpcr35+G0ozvw6yzidlXM7CcRRcvJGs2GtduiFNQd0lyiypixTaVw+fVNmSH/
	KJtB7sQMQyMfCtkV5C0bUymB5VoW6voYFB3ncekTKu/Ik8lUnLmRwWnHdOGgFeBESnXXZ3jRS9T
	xbj5k/caGioSSLPUf2egn3H1Z12HFAy1ce5D3XtyPx7nLMyW1KzJ+I3kIpR39Kv4Nh5T04V0+zP
	uREOgj0F0RKm1Crfso5vZaoAb9EMQKVR5ccdx6NrK+2cw7m4xZ+tCCUH5jCCHg75SCCdQC9p9Im
	FDG05jznqO3XHhsil2rYAiZSrduX21KhqrB8ZkFR8tOtXD1btlf0JYbJZ1sM00u8BHANMBnf
X-Google-Smtp-Source: AGHT+IGALTc0/1tFLGhHIF2r9ZhN1RPRNEY+38maOOjRsNV4DmYxUBBG1NaebFKyRx8ArzYcQkcQSQ==
X-Received: by 2002:a17:903:244a:b0:232:59b:58fe with SMTP id d9443c01a7336-2355f6cb6b7mr94525395ad.1.1748841096781;
        Sun, 01 Jun 2025 22:11:36 -0700 (PDT)
Received: from localhost.localdomain ([123.51.235.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bc85fcsm62709085ad.38.2025.06.01.22.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 22:11:36 -0700 (PDT)
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
Subject: [PATCH v4 1/2] dt-bindings: hwmon: (pmbus/isl68137) Add RAA229621 support
Date: Mon,  2 Jun 2025 13:04:14 +0800
Message-Id: <20250602050415.848112-2-chiang.brian@inventec.com>
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

Add device type support for raa229621

Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
---
v1 -> v4:
- Correct the subject and commit message
- Patch kept in sync with series version
- Link to v1: https://lore.kernel.org/all/20250314032055.3125534-1-chiang.brian@inventec.com/

 Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
index bac5f8e352aa..3dc7f15484d2 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
@@ -56,6 +56,7 @@ properties:
       - renesas,raa228228
       - renesas,raa229001
       - renesas,raa229004
+      - renesas,raa229621
 
   reg:
     maxItems: 1
-- 
2.43.0

