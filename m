Return-Path: <linux-renesas-soc+bounces-12390-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DEAA1A3EF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 13:10:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3D363A1FB4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 12:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4666C20E71C;
	Thu, 23 Jan 2025 12:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Lk3Ddzjk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B5A20E6F2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jan 2025 12:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737634250; cv=none; b=cmeIxCdqMEEF+TqzL/9Bq5UzOD8G6/ZiKbFx4kxDrTGBCjbMJE900yfEAcUm1cMvDuS4Y/2a+EdSVWBVDSCqS0qGqQyXCDWjnfjxNcZS1tsTgyVM25B7kz6T1vJC/40AZwgC7HItnGZdj4dvtnNrhW5+qaWWJdW16LEbPZwpUB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737634250; c=relaxed/simple;
	bh=D/cMKXuuEgh95o4rHqBLldh15tMGlafLO1tH0ISH08E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k0TiAXiYJ3e01GYrmiYD+nlanBrq5tmLwl30LErWYW9pwpSsdGk+4vgVlYFGSixoHkeapZvqrvyeMoI3oMo3l0vbwbke7NkhRrCoA2LjYZWGUk+tudwXgRmfYelNKgsA1ZxGDuiGmz4M3r+gsoU57ONBLcKo6yKh/f9qr2mN67w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Lk3Ddzjk; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d3f28a4fccso1289856a12.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jan 2025 04:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1737634246; x=1738239046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XoVwwng11jL54LPWIff1s9sIPX1yMVouKzX05iZk2DE=;
        b=Lk3Ddzjkibws/+XSC/+QTC+Scrla3/wBTWH4Sg9Wiu2FmcarsUrjobEe+RXJkG11C7
         62WiqiGwbGOeqOxC9H353F9B6ChhDrXlGkVCSZtXG8se9EK181T4M85BJVQ/e0lPP7cG
         QEccsjyRFpr6B58vdwFaVmZ7y8YozkudSpbIO8Ah0NA+1oqPJ9+VHSdcH/P4S0DMnlr+
         HsCV+GwtqAsGaJ1hhDNvYyJmDzgZ5/nFlj/YTipSj/h4Yxmj6IHz7ef95F/pgUfNQhc5
         98HS5HEXp5TFMrpsKzlJkUSJDwIB8Ps47DwrPaJbX/cNFgfD+huO8CSUVQfqn2ce8AJD
         0TEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737634246; x=1738239046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XoVwwng11jL54LPWIff1s9sIPX1yMVouKzX05iZk2DE=;
        b=V0pvaDsd4qvpyaGknX/oa5kit/SN+YjH60e8z+OihWCaxu4cE/F08t9/bG4g735qHT
         b1ZjtvoCl62zxN4o90LYnaTrio5g9zuAxUcTQFVSeFk7r+HEVfzrx4zCGXxmrPsHjOue
         MDZCLYaBWpcK/eogqT6kEVfYLCDe7WDAOVux9wxhLa50SRWEWZQYhdNO3W7RseJJViDI
         /yCO8U7tQGCqJArnsOcXSJXlGeZVavML0REZEqL2gB2+8xgWfAuKFNpAWcGf11MeKKok
         c9B8AQl2YLZxSKhqaTVSv2wqwKILqsFC2QJAtV10Vi/gXKrfG++qLRwaw1lwgCu41Ezj
         xcHA==
X-Forwarded-Encrypted: i=1; AJvYcCVaZYD/88GS6F2YdUyzGSk8kGPNMWqUsQudhQnLt067+dOO34QVy63jFU0JE8Z5/aYJZyrIMlUI2nBSkwIeHcnkew==@vger.kernel.org
X-Gm-Message-State: AOJu0YywNssT8tw8MSiL9es25+tZa1FUjXxlf8OR+vy+l6lOcDcgXiT+
	7PE1bRiF/E09CkbQA/O25PORLR+Z0YwY9Wd7Y9qFRpagwVN3Zi7oKF7hd4/FcVs=
X-Gm-Gg: ASbGnctZyuQVdsDPYJwAgHXYiqWh1di+d8DfDoQrl6KVcvMug+yZ6cce39B0HU1ez5p
	k69w7XLVwPSMT/Ur9GZkb78GksaiCY0ZNEIf3zL+DPQuDoXvJbGTCSiZN2ICrTCika3tEgSioPw
	7Fw23KMH4GGXhUVV3cfIqfxYRaDzgy4Ln5MxzW0K65r19pZLHz1810SVKP6m+Stcp4jOWtRvnbH
	giHuNpBSdkMQakFq+o2ymUZqfTFvmePfNLEk+O/wOlB5SElqqRlkfOsUpnNJorXi6nNIGF84f14
	nLIYQ6kfc47S2UEQxntK5g2ZdzcsdZ1erQ==
X-Google-Smtp-Source: AGHT+IG/68d1em6WKDvGKxhWbi8mGcZWAOKfiywlF6VeP6YEpu4Q/f1BT04D9ulRpQnCTsFTTSCb+g==
X-Received: by 2002:a17:907:72cf:b0:aa6:8676:3b33 with SMTP id a640c23a62f3a-ab38b3f8f45mr2227760066b.47.1737634246258;
        Thu, 23 Jan 2025 04:10:46 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab3999638f8sm926787766b.9.2025.01.23.04.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 04:10:45 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: claudiu.beznea@tuxon.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	support.opensource@diasemi.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH] ASoC: da7213: Initialize the mutex
Date: Thu, 23 Jan 2025 14:10:36 +0200
Message-ID: <20250123121036.70406-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Initialize the struct da7213_priv::ctrl_lock mutex. Without it the
following stack trace is displayed when rebooting and lockdep is enabled:

DEBUG_LOCKS_WARN_ON(lock->magic != lock)
WARNING: CPU: 0 PID: 180 at kernel/locking/mutex.c:564 __mutex_lock+0x254/0x4e4
CPU: 0 UID: 0 PID: 180 Comm: alsactl Not tainted 6.13.0-next-20250123-arm64-renesas-00002-g132083a22d3d #30
Hardware name: Renesas SMARC EVK version 2 based on r9a08g045s33 (DT)
pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : __mutex_lock+0x254/0x4e4
lr : __mutex_lock+0x254/0x4e4
sp : ffff800082c13c00
x29: ffff800082c13c00 x28: ffff00001002b500 x27: 0000000000000000
x26: 0000000000000000 x25: ffff800080b30db4 x24: 0000000000000002
x23: ffff800082c13c70 x22: 0000ffffc2a68a70 x21: ffff000010348000
x20: 0000000000000000 x19: ffff00000be2e488 x18: 0000000000000000
x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
x14: 00000000000003c1 x13: 00000000000003c1 x12: 0000000000000000
x11: 0000000000000011 x10: 0000000000001420 x9 : ffff800082c13a70
x8 : 0000000000000001 x7 : ffff800082c13a50 x6 : ffff800082c139e0
x5 : ffff800082c14000 x4 : ffff800082c13a50 x3 : 0000000000000000
x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00001002b500
Call trace:
  __mutex_lock+0x254/0x4e4 (P)
  mutex_lock_nested+0x20/0x28
  da7213_volsw_locked_get+0x34/0x60
  snd_ctl_elem_read+0xbc/0x114
  snd_ctl_ioctl+0x878/0xa70
  __arm64_sys_ioctl+0x94/0xc8
  invoke_syscall+0x44/0x104
  el0_svc_common.constprop.0+0xb4/0xd4
  do_el0_svc+0x18/0x20
  el0_svc+0x3c/0xf0
  el0t_64_sync_handler+0xc0/0xc4
  el0t_64_sync+0x154/0x158
 irq event stamp: 7713
 hardirqs last  enabled at (7713): [<ffff800080170d94>] ktime_get_coarse_real_ts64+0xf0/0x10c
 hardirqs last disabled at (7712): [<ffff800080170d58>] ktime_get_coarse_real_ts64+0xb4/0x10c
 softirqs last  enabled at (7550): [<ffff8000800179d4>] fpsimd_restore_current_state+0x30/0xb8
 softirqs last disabled at (7548): [<ffff8000800179a8>] fpsimd_restore_current_state+0x4/0xb8
 ---[ end trace 0000000000000000 ]---

Fixes: 64c3259b5f86 ("ASoC: da7213: Add new kcontrol for tonegen")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/codecs/da7213.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index ca4cc954efa8..eb97ac73ec06 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -2203,6 +2203,8 @@ static int da7213_i2c_probe(struct i2c_client *i2c)
 		return ret;
 	}
 
+	mutex_init(&da7213->ctrl_lock);
+
 	pm_runtime_set_autosuspend_delay(&i2c->dev, 100);
 	pm_runtime_use_autosuspend(&i2c->dev);
 	pm_runtime_set_active(&i2c->dev);
-- 
2.43.0


