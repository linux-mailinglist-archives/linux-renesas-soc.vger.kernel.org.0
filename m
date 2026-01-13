Return-Path: <linux-renesas-soc+bounces-26670-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7DBD18F40
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 13:55:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81D7C3014A28
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 12:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1915B38F939;
	Tue, 13 Jan 2026 12:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="deNlVGWB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C0E38E5DB
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jan 2026 12:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768308800; cv=none; b=egZk2lzWJlyJwtKaTBUnU2VDqkg7V+XeMS9Xcc535AWntH2bd6UMXGroyPiEU1IlQJ/+lBQ2MhYnzubN9spS23q5X+JwGMlNzMRiOEcFKAust6Wg//+E91ZhtkPQ7K7z8X27wLp8YQm9ANOMH+RSBcJFu68Xkv48o917E9zjH1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768308800; c=relaxed/simple;
	bh=IosZQnDIkZE84/fX6gm7UGmM/IZKDMbdBOr+shTDotU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iPFiKsUyHs5FCBfUNXGIq267aJ61OJKEmdcJPkcJUcEQfGwM2qZh/JygUvUvMnMNSMouJgPWh8MR64daSHNhH7gq4+5z47tHjrpyBEKNdVIZJKK7tYBQdNXgFEQkKlxIsiLUMEvN1bIElngWlpDWVGvsWHV63GFpzMehz1thGDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=deNlVGWB; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47d63594f7eso45266915e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jan 2026 04:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768308798; x=1768913598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vt0DzlDylE+25xem1xZIrwqAOO9o/UpWn2FFY1GBi8A=;
        b=deNlVGWBFyMtuCHzmmGC2jb9/rmBRKewWeaMWziAgYzsCNo9cmpLIPebm0zNgBSkRu
         lYuhE2kh7ISqZFk2Me6wrvd1b9cOmvVXIWtDHW0plKUXHBH5NbWH0tdoeUvRNFx8sLGg
         tgOPeDkb/iRj5bu95Ihe3D+6aqd9OAt20h2vjCLrgwV1iR90J7FvdGthAC5aT4duTo4Y
         3nUZV1IJjfYUW7FnuXk1kL/kvarEfhJQOyU21nuoAbKLWc+bOtGSQRstv5IccBY4b4Vw
         o+qRzDR1qpEl/I6Vc2sWcISk6HuXL2+oblvoJ8bYqQF0K4AFQ6HuhfIC4iH3/D/Po0wT
         JrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768308798; x=1768913598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vt0DzlDylE+25xem1xZIrwqAOO9o/UpWn2FFY1GBi8A=;
        b=agZqInHScD80YNxH7kGAoWuaf/ADvkvHVUczSDixQ9GZ9/gd2vR3zrPC5qdrzqXU7t
         nJJuRRYSj9Zco7fI85ZJZEzD11g1pTssy1pbem30sTwzFytC+kwCl4NvVJtUZm70VTeS
         8Pyzsl3BBJA+yu9aHqroHsLNNCsIKtJWgowVULkjBl/IYO0EG03u3OZQR1lq/x9SAu2N
         7846byFl3dtekdp7mh+Y65g05DllU/ltp58ze49GITC029VRXd1yeoY2Qy9DEeB6LVgU
         v37i99R3YXD5daTyB0P8m+ojFNIRUyRp4kOUgJG6ob4qHUA8VsWkflVJhlw8xGOco0oM
         fBSw==
X-Forwarded-Encrypted: i=1; AJvYcCVKEDk1ML7tNgNihhmAXWMirw1tf7OQjQmps+YyPIdfkcA4Qld6s0el1A8j09vckRM/bwyl5+NTSu8IEEZ0HKUoiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIaqLqCv5i6tczkpH5hnZOedRmSlx1ke18naBhaLj4NMfkt2+q
	bH93U0Pf16ggfndNVU9oXAXoGKM3XQo7M1WxXENCnNSsVgzA42mEaa+V
X-Gm-Gg: AY/fxX4RGz/iGMsn27titpnwiudWRzgnqM28gh29i5Uoi6Nebl3MZuSDY8kGgdvo+pF
	l39siWJpCQdMVAynqRf84YPXMH3kBWWYuQ0qDp0QNJTv6jETemBgF/vcPyh+zBVYbtozFG5LYNc
	knLel68bJoVULX0wt/HowF/ViDSqVmJLJnk1sAy/oylH036qjCF0CR2kQ2bYruWFexBRhbeBbNj
	uPnTjFS96mYmfzskUe6Ihauc6ngvDt78UWCV6LPqj2KbTaNdBpGF8fQsqCAWWc3gbjuYWHbsEpN
	H9kw/hX42RuIIsiFu6R6atslcNN0Uhau4CCGPTWfT7Vi/bdifXW4S3pgdvorRGAMyFJZf5JjqJt
	uO0xR+oobTdYzoe3k0qnCki1eS6uPHqBxmYa2siXp/F1J/sODdmktbOqey7FWuXV64AJbfoECqq
	2QNgNzFmbMKhi9cAp4Bw==
X-Google-Smtp-Source: AGHT+IGXPpg/vAeyzVf71nvro3wrSRnNxBtUKvPSAc7VScTokSYxlvmtkl/uMOs5ejnz+5dNxebYYA==
X-Received: by 2002:a05:600c:470c:b0:47a:7fbf:d5c8 with SMTP id 5b1f17b1804b1-47d84b3b3c1mr219233985e9.26.1768308797796;
        Tue, 13 Jan 2026 04:53:17 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:6e35:f12b:dc2b:8e25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f4184cbsm423744265e9.6.2026.01.13.04.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 04:53:17 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/2] Prevent TINT spurious interrupt during resume
Date: Tue, 13 Jan 2026 12:53:10 +0000
Message-ID: <20260113125315.359967-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Currently, a spurious IRQ is generated on the resume path of s2idle for
the PMIC RTC TINT interrupt due to a glitch related to unnecessary
enabling/disabling of the TINT enable bit.

Fix this issue by not setting TSSR(TINT Source) and TITSR(TINT Detection
Method Selection) registers if the values are the same as those set
in these registers.

Also added suspend/resume support by restoring IRQ type register values.

Biju Das (2):
  irqchip/renesas-rzv2h: Prevent TINT spurious interrupt during resume
  irqchip/renesas-rzv2h: Add suspend/resume support

 drivers/irqchip/irq-renesas-rzv2h.c | 69 +++++++++++++++++++++++++++--
 1 file changed, 65 insertions(+), 4 deletions(-)

-- 
2.43.0


