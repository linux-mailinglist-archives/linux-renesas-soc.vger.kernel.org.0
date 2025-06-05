Return-Path: <linux-renesas-soc+bounces-17858-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC49ACE8DF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Jun 2025 06:09:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD1FA3A8AC1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Jun 2025 04:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C5F81FC0E2;
	Thu,  5 Jun 2025 04:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="WULquvlk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EEA1A5BAE
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Jun 2025 04:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749096540; cv=none; b=uzysxHztLG4CBzfrhy9b5/vBt5r/zw+IvESWN1xbrnwT+e4vNK/O48xzWi0USuw+uX0JIMJUCf/hJzVke6Tm1OvYON7Y8kOA3szF6RafS7yAdt9LJvv3zyhMg9o2jWjuW2lsfjKXDVH7cgUP1MmC2tZ26ydSgTCMwyK9fRPgyyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749096540; c=relaxed/simple;
	bh=S9Myu/EAwV+EabHUKboJwstByqgJNE42t4kceGhAaJA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=o/U1Rv228j7qPgbI1yD6KLJcWobmNbdRbwnmyiZtr4B9+tdNi3adMnmMzj2g5BM24IxUrmAiDSRgnFGySOZIh/mKNkGnf1+wN5XYlArd+1mImkCpHJ8tVDxD0uPklfwBAPgzFece3r5Zlncw5ihZQsvVkru3cxBbggS1rZtV1Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=WULquvlk; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-74800b81f1bso522427b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Jun 2025 21:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1749096537; x=1749701337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3reX2SYNoxgNAAZUbIwRQ8AO5e4F9o+0m3Nm0EB8qO8=;
        b=WULquvlkqAGjVR7Ze5cycx/D1ijtw5iyhqbXmH6oPfFbAkpV1g3TWH4UUHzygVdVJ6
         V5+/QU19+nRlPB5uiKW5/1WzVe2pWh93/bejElLViof+S61A8xocXKh/3yoeAdtM4Jh0
         4d2QVgHPJjVP4xJ2wKPJUIttptS2Ovm4w15g0B+D8qVc4fB28u3KEFI2vg0fC770IRpo
         l6nnMW4F9DPHX2UcW63tm37lML0cOQET7KrCb6qgyrUC20Z3OBkFh7RJa8W4hUiUKebn
         v/FrAZs8US0DWE6ZhC6RfSwX8YwA+bwmIKWOP7XyFQo5Q6LloVIILbor8i5Wjx7QtsEY
         4aYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749096537; x=1749701337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3reX2SYNoxgNAAZUbIwRQ8AO5e4F9o+0m3Nm0EB8qO8=;
        b=OYV0QGjGzdUre7DAH3yz6r/GYV/V9AtockZLs9GjtH8iaPbVpNwQi+gPtwY1PLtosL
         0uUKo5WpgK0BJJQXSga63L6QzeE4bbIC4FwmndV0INbHWheONRhOu191yUiqPJUIKW29
         QaN9/1Iil4nuH00yUf8qaGyenIZLENDQBqqdv1eygMY6rotx2HJgdds2bGMY/quJHkb6
         bpQdRh0dG/GrJX7j2WJOmeFsjkAVTN8T9G8A6jx4+2JBOtieL9nNAVsq5FJMjXcEDKw5
         34hRrhRwFT+yKA86wQsU0lAcUQVJC50s+z63URWnlKcpR+mGMTKfiPMdIam7tMFt9o2z
         PGqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR0b7aAd9/TWJItrav9G8R8dKnK1xM7JFFF7A/XBZi/Hdoc9Gi9c6ErmI25GI61QfCoHh6qsXprR/quJaR9CVYAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp3ozeR+mxGrYmdWErnIYQ7/aU9C2KOUSeRNJwD6POdgdlwvSE
	vOstqpYb96jWtukFrgBE3V9Kv2hSmAOX9p7fCuzBBhLp/gaEnm0zLmqL9/Dq0QiWbdQ=
X-Gm-Gg: ASbGncsq0DAwi/t0nIT1As6wxHtV1qEC4hFH0cL85BxblcDDuvJpBPawKupiZZaiRrF
	MZYP1JK8EiVyNUPExAt8l2LplOilfKitlyzrsq9CUidNovWBkQMN4g8jXkUR+vpvWX//QKKUKbS
	BpjmmTIizBGH4jwVQcbqAjk5Yte09gQHVDJTHBZAegj1ZyGTDFn7G+zuZmKswAgcIhqpdmgS7e1
	xfD6tTa3bCr40URTbFPk6K5ln2hNcppeD2Akp/6OWTQShnWbjQb+Zw73S6fDnFXgZGSQ9hYtfSA
	JCJrr4MzurtcpxM7MUMyyKeq0ko/eYKtz4W20NEid7ZNAMMnaKWaS8A5tw5IIS4OuNRA6Ohae3W
	qVOowOSq2JB0XzKdg9tiNYHY45m5fFTxAI5gYwgNr
X-Google-Smtp-Source: AGHT+IE2dXMM5ab3l/XoJD8gyVgwjP3vN4WSpp7LcxfwoTcExqAg2Z8Xh83mw9HHU+8k37g4o8IuiA==
X-Received: by 2002:a05:6a21:60c1:b0:1f5:7ba7:69d8 with SMTP id adf61e73a8af0-21d22ab40bemr7387987637.15.1749096536708;
        Wed, 04 Jun 2025 21:08:56 -0700 (PDT)
Received: from localhost.localdomain (60-248-18-139.hinet-ip.hinet.net. [60.248.18.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb029fbsm9480924a12.13.2025.06.04.21.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 21:08:56 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: chiang.brian@inventec.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	grant.peltier.jg@renesas.com,
	jdelvare@suse.com,
	krzk+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux@roeck-us.net,
	robh@kernel.org
Subject: [PATCH v5 0/2] Add support for RAA229621
Date: Thu,  5 Jun 2025 12:01:32 +0800
Message-Id: <20250605040134.4012199-1-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RAA229621 is a digital dual output multiphase (X+Y <= 8) PWM controller
designed to be compliant with AMD SVI3 specifications, targeting VDDCR_CPU 
and VDDCR_SOC rails.

Add support for it to the isl68137 driver.

---
v4 -> v5:
- Include Acked-by tag in dt-bindings patch
- Wrap commit message body at 75 columns
- Remove the incorrect dependency description in hwmon patch
- Link to v4: https://lore.kernel.org/all/20250602050415.848112-1-chiang.brian@inventec.com/

v3 -> v4:
- Add Changelog
- Remove unnecessary "From" tag
- Add the compatible of raa229621 into dt-bindings
- Link to v3: https://lore.kernel.org/all/20250303083537.3312250-1-chiang.brian@inventec.corp-partner.google.com/

v2 -> v3: 
- Fix the corrupted patch by sending plain text email
- Link to v2: https://lore.kernel.org/all/CAJCfHmWJ9N1R8x6ikU02_RYq9ieq6yWY7CGdfvc4hRqHnX5szg@mail.gmail.com/

v1 -> v2: 
- Modify subject and description to meet requirements
- Remove the override of isl68137_probe
- Add the of_match between raa229621 and raa_dmpvr2_2rail
- Link to v1: https://lore.kernel.org/all/CAJCfHmXcrr_si4HLLCrXskuZ4aYmqAh0SFXNSkeL78d2qX2Qcg@mail.gmail.com/

---
Chiang Brian (2):
  dt-bindings: hwmon: (pmbus/isl68137) Add RAA229621 support
  hwmon: (pmbus/isl68137) Add support for RAA229621

 .../devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml         | 1 +
 drivers/hwmon/pmbus/isl68137.c                                 | 3 +++
 2 files changed, 4 insertions(+)

-- 
2.25.1


