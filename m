Return-Path: <linux-renesas-soc+bounces-11860-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8328FA01927
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Jan 2025 12:11:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4795B1627A5
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Jan 2025 11:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E475A1F5F6;
	Sun,  5 Jan 2025 11:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="m4+VKHHH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48AB184F
	for <linux-renesas-soc@vger.kernel.org>; Sun,  5 Jan 2025 11:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736075465; cv=none; b=lyiProIf6j28uZecrcIfnElSw+1nN0r5Q774lRBoU3KwwHAkVfma6jzZksIiv7tIf/QSvfQgJZP5wLU+O/EEH4FcCkKM6BSjNHq6TEGKR9JL/xEc+bBsuhyD51uxXOZNQTwquiv950Ys+Ffi9xnbpW35S9bJ1/Wk1HJXqZsI12c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736075465; c=relaxed/simple;
	bh=4o6DYmOAE5OAUvlwkaikhb/Zn3zFRAiHlFM/7bohzFQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=O7t5xQkkwXngDPDxzzvjImQ1K3MtGaw9zyqEZTGyCnlyc1vQWvMISXTDa672OZKYaJMatj89vriis3vsezGdvnK2P8vL2yKtuYbfEQPu1Fodw8OGpI5DryMwk46QkUKF0mubkATyuqruMXu2brd+vEvG2BrbLnZ8iLiWmbbYw+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=m4+VKHHH; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2161eb95317so196672415ad.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 05 Jan 2025 03:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1736075463; x=1736680263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zP1KDTNtSFJoukup80e5sEo7Db7QT8RIHFC7fmb18To=;
        b=m4+VKHHHQfVfNtCrNO+2LEhxvEWDMtLt/+YrXjbCSWahHXgYb9NYVeMgGJ4gl/b5UW
         /vNKHry85cKrAj1IH5u/Xg2YBdgfv7npR3DBthEIb21sDgQ/Lfsu8J/Fb6WSpgmCg242
         fMG33Zj5mdqoT++pTe4owJumA2FfnQimwdCqBMPM3uiwpj9OJRGKyAuvrKgZdTDGpNyb
         TgaczyEOnwnfhggLKLQScnS/xfUaLGLAMQDgRzK/umpTxZjOxjGTfZ/gOyYdnvexRDct
         Me0ki9IB/i+axsd7sjsbJzK1Wgvo48FHP1CuL2x/AP35/0i7ewp6LETtPGp+fFFdvbTm
         /MXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736075463; x=1736680263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zP1KDTNtSFJoukup80e5sEo7Db7QT8RIHFC7fmb18To=;
        b=uOYnjWgq5lnYtYrt0grVEIoLiMwzyMO0nMqF98mLU/UyBYQxyl94Coz+2+fnWZPVqZ
         QDX3nxt+JLQUrEFRJ6RZYU85uzsjgdaBW7quQYk2SQfkx/zNSKxoaka7C8NfjUlOvfGz
         oi1SopVEfCcl2dRIay5JITmvS/HKWYUzx5hqS0jwJtYIyOxbJZORRRiAhS2kQr/GFbaM
         Wr9FjiXTL8qJuqjBulzeWG95RRCYUDFsUHG17LJEi1fC/oNw8RLxYrhA79OWE+yhZ052
         xgcPvCMRjXZXkN6/KHs2neNQF9cu44aFv1XkXwIawAz4+e6nsNLm6MQ4nFYpLJzaqrqq
         OcjA==
X-Gm-Message-State: AOJu0YyQOztwtSYBu41XuSoc6k+7NpqiG3bOwZW+DkxQqedU60glfi+3
	d382XnhA9vwVgYhm37nhGQFcHn3gFtzlCsNHAbOQfQfWcR+0gs+VP600CbNuiXpz7CSJUWw8DBb
	b
X-Gm-Gg: ASbGncsHfQd7ezNIngxYoYNpfWqSnD2ZbuVWJksChQtosOpQFi4HqLmtzGFPSnctkTp
	PU8huaYEBlujZKnZtifLFFKQHpcRNqUEiuhM8k3Vegpzd4whFuH02YgfCwN/T/J8SY4HjrGUPyo
	M3gK17vSBgAbhbBowTcnctz5kpGAqja/iNp0Iu7hQD/t7xsqHZbj6MJ7hCn5mWnI7el+Jt1aJR2
	KNVb+6GSa+vYiIA7n/e8F7clcJkG7oJDpkaXSbpl9nTz77heMBBkdQFjrTOXLeZvPAAHRhCe9u2
	GOTcIR76qof8B0afXpG4Za6WQehwIP9TETQzyB2O8wI=
X-Google-Smtp-Source: AGHT+IHtbxD1tRPM6HiIZMy8xIOzPFOfCBP+HE0ilDGuyAKEhrRSgJmAd35C0AwgqrgAR0cepaco3A==
X-Received: by 2002:a17:902:f607:b0:212:5786:7bbe with SMTP id d9443c01a7336-219e6ea1baamr840356595ad.24.1736075462715;
        Sun, 05 Jan 2025 03:11:02 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962933sm275118745ad.56.2025.01.05.03.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 03:11:02 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: fabrizio.castro.jz@renesas.com,
	mchehab@kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] media: rcar_drif: Fix an OF node leak in rcar_drif_bond_enabled()
Date: Sun,  5 Jan 2025 20:10:50 +0900
Message-Id: <20250105111050.3859712-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rcar_drif_bond_enabled() leaks an OF node reference when the
of_parse_phandle() returns a node and of_device_is_available() is false.
Add a of_node_put() call before returning NULL.

This was found by an experimental verifier that I am developing. Due to
the lack of the actual device, no runtime test was able to be performed.

Fixes: 7625ee981af1 ("[media] media: platform: rcar_drif: Add DRIF support")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/media/platform/renesas/rcar_drif.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/platform/renesas/rcar_drif.c
index fc8b6bbef793..c5d676eb1091 100644
--- a/drivers/media/platform/renesas/rcar_drif.c
+++ b/drivers/media/platform/renesas/rcar_drif.c
@@ -1246,6 +1246,7 @@ static struct device_node *rcar_drif_bond_enabled(struct platform_device *p)
 	if (np && of_device_is_available(np))
 		return np;
 
+	of_node_put(np);
 	return NULL;
 }
 
-- 
2.34.1


