Return-Path: <linux-renesas-soc+bounces-17761-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1270BACA8CC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Jun 2025 07:11:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C4C5189AF9B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Jun 2025 05:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB40167DB7;
	Mon,  2 Jun 2025 05:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="ESo8aTvD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D406714885B
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Jun 2025 05:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748841097; cv=none; b=s4aI6EHemOCM1Qy+DTSuwLLB6c6Df+HXY5L7RKbvvnvp2pcE6QrRptP1ZaYQouKq7g7KH9soZHEJa8Ey7JNJMZKmESxqMOMpoBf3P6oLOruRGdk5ZUq2SB3Vn06n1th0chHmbDIEUZs/eFzJnrrOzM77BB3R6g6dVBXm0DCx1nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748841097; c=relaxed/simple;
	bh=oZuMIrB48TQVZ267SzyqqFKk1A27pKuXp9Tsyg4Y0LA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Uc7okPnqqDDHhSpqzClhda5k729Nyh262Ut2WI3sJlxSXgx30VnQg81wfRzyagXcAmeJ2ualrykaRttN3zO/Z74rgSkXmivUwnTJ9VsWzQro6KPqJUSmQ9jy7AoqZ3wOW4m0T0KnTQevZQoP4zLoVAOWzmkrl2XVa+4vYHdDw3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=ESo8aTvD; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3122368d7cfso2691138a91.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 01 Jun 2025 22:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1748841094; x=1749445894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tUG2mfGbVlQP6aOBxscXOizK60ki2GEc4gRzXvccP38=;
        b=ESo8aTvDOPTwuZy+ulOvoOopFLjXd/L73VlkR/cgGVw2CAUhN4+OkraTN6IUSK1hIZ
         SVho4AbUMAjI6UsAXgan47DRKiS8429xLF9apDP0pDCWi9pQyRPDB78Y2RfsMQ940q6+
         lIhqcIP16kxcur69agg63p3RjdBTglWihGjbXdzwYNCsItVd/dSUVv8pKVUCB/lGWTu1
         W45B/fkbSsAk8IYdNmKnYaMuNpaz3pW0KofqQE3JuOA5YucA4XbwYajwFSDh5YTGhJkm
         CSvxJdOpTNgZa4ebwwoA+B82jX89pgBPSnyHRfNIZTGvsdMc+aihc9TpFlq5xSUgEmA+
         ck1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748841094; x=1749445894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tUG2mfGbVlQP6aOBxscXOizK60ki2GEc4gRzXvccP38=;
        b=wfXdfd7Kx2MOp6Y5RIXRJ4AdYIrmzuQ5OA9L+jx4U988c/fdIPbXsFddXMAlbvmvVF
         rSdJUrQyvWIpPn/Ule1xAlBZBmWOWgifjqyJ4RtU+TOlPCLFPrAUV+mweHNprIZnr+ZP
         t6Wi8rCSCNltcPVmf0ckyswrQv2asMbpXsbGorNQN9hr4lK8SdsBFkjuDElb73pi0o1K
         OOrW64OhHVIxWTOcf3TAvEBUh6a5wexZYxoxduZZnjEbmWO7KRQrESjM2CcZa655DzHN
         9Nq/WFv3XUHip4DATBtYa4z/VYwqfrnJrkN3qkoPihrUn4TKIfebggeZ4lukDs6ZHKwp
         bg+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUcMjm+doXoPG6Zzzx6XvyGCdgP3TVSe2kO71UCh4lYyuBMxgkmwqcflMOYoBtZUjCeYd/Y443KwBCSgJGavRqsUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJpbZmIFn57rnDGTNuUfJtLkeJbL3u19TT8tl+1XdM7IxNLp40
	y4rmAvakbJ5aq/XaYeCHqwnBJbPazLHF904iOVoldVjRQ5TplB/k4N3pjD7tAtNDrJo=
X-Gm-Gg: ASbGncs+tkQa5g2/Q7alSxgSgGcYYYwSPxjQj6wRSZjf7GYa8NteKIiDgPN/bq4sYP+
	BFL/Ci8pm9yXoOjGPko1gSCVMynztmA0mHyWVCuFsVGbXH/p5U/z6zsNJ8iNVe7JmYEo1dl3z0h
	LWBuW82iQj1r8nO/vBDkAelnLU4J3liE3y6gO0BEBu+bGZE1BxqaaaH3OTxAJOp7b2giE4VY6eo
	MseRAF5XLybnkfV9Ws1lysKfD28ya2nJhtOhiR28IQ/MfLRo6X3NvndHZw8rW/XyiF0dV1cgNf3
	GYYxNWHz2rj5nqTbzGC8m8KKJCQNCDSQ2GT4PrFqp80o2/4yNcybIqMNJMfEf7rd9Q0bQxIzNUU
	ZAYTmG0E=
X-Google-Smtp-Source: AGHT+IH15jahMcfNNWPkxUhg7yjgT+AT6xissa4av5uh34InGjeBLrUD+mSsSG/ZR/48e5BFYwDQwg==
X-Received: by 2002:a17:90b:3a0e:b0:311:e8cc:425e with SMTP id 98e67ed59e1d1-312504914b4mr15268598a91.31.1748841094114;
        Sun, 01 Jun 2025 22:11:34 -0700 (PDT)
Received: from localhost.localdomain ([123.51.235.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bc85fcsm62709085ad.38.2025.06.01.22.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 22:11:33 -0700 (PDT)
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
Subject: [PATCH v4 0/2] Add support for RAA229621
Date: Mon,  2 Jun 2025 13:04:13 +0800
Message-Id: <20250602050415.848112-1-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
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

---
v3 -> v4:
- Add Changelog
- Remove unnecessary "From" tag
- Add the compatible of raa229621 into dt-bindings
- Link to v3: https://lore.kernel.org/all/20250303083537.3312250-1-chiang.brian@inventec.corp-partner.google.com/

v2 -> v3: 
- Fix the corrupted patch by sending plain text email
- Link to v2: https://lore.kernel.org/all/CAJCfHmWJ9N1R8x6ikU02_RYq9ieq6yWY7CGdfvc4hRqHnX5szg@mail.gmail.com/

v1 -> v2: 
- Modify subject and description to meet requirements and remove the override of
  isl68137_probe, and add the of_match between raa229621 and  raa_dmpvr2_2rail
- Link to v1: https://lore.kernel.org/all/CAJCfHmXcrr_si4HLLCrXskuZ4aYmqAh0SFXNSkeL78d2qX2Qcg@mail.gmail.com/

---
Chiang Brian (2):
  dt-bindings: hwmon: (pmbus/isl68137) Add RAA229621 support
  hwmon: (pmbus/isl68137) Add support for RAA229621


 .../devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml         | 1 +
 drivers/hwmon/pmbus/isl68137.c                                 | 3 +++
 2 files changed, 4 insertions(+)

-- 
2.43.0


