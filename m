Return-Path: <linux-renesas-soc+bounces-31235-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YG6KJLbI3GmcWQkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31235-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 12:43:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F5D3EAC41
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 12:43:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 95D45300729B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 10:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C383B6C03;
	Mon, 13 Apr 2026 10:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="HNuQHneO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B8E360745
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 10:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776076970; cv=none; b=Sgh1f20DeWXDT+HPHGGKdwL2M9fgRPhezR6Jih4H7kh+DKZruz6CsjCBxuEb26kX2IPZxF0GA3gh1lGVGvLzHaoIHPkyzERKo5KzaBu+2pBUanqCdu+e2R/BfzWctFyVfczBJXZ3+LNHq7qJpclyVGdOz/wWl7W840GPGrgCU00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776076970; c=relaxed/simple;
	bh=uBKWGdLMm4PJxExb0093mxoS8HcgyYVnd4KJazP2SpY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CXw60tq3JCJCeLO7JypgU23ttX/0Elspj3i9dqGhamAIN62yKJM1yjDUSehnJNvWSY0r2RkFGLo3vhf7pBTEUfp0Pnv/76tdHeDY4m8Yybv5xtatpZpSgMd296rdWyEu+gC/7dzi4H+qQQ4NyFPmexMwvticC2U9lY2oKLoinjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HNuQHneO; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=gRnXY6WJpr0ifu
	QAioam029LxiTt99t5dwcRgMCbbqA=; b=HNuQHneOj1QESGwRtdAslP+4osHRu5
	6B8wFJ3S9aKiurPP5E4DivwKSB44UR3TwR78vjB4qtWpoYAJn93qvMcjerl1dBrz
	7qkiMnBTkAac6ZqBX1b9aAa+2Q/RE412aCk3x82BErsaM5/gc/7NMCwyNXU9P8Qs
	wPkODgjn3iwLEk5+v/5Rq4APC8I2n0z6O6B3yadAKgvP45bleYgGgpp/r1Edd0Jl
	nZ+XePlD0+ZNtx3RC1r6CRkLTgBb4dhlZ2DM2eHaXq7WawY2aSRY+Z+g7IHFlY5p
	aDmlbyAJv6isn1OC8C/ne0SLqNIBJltlLeG4dAJkhmuMo/8gsdPuV1+A==
Received: (qmail 2255959 invoked from network); 13 Apr 2026 12:42:43 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Apr 2026 12:42:43 +0200
X-UD-Smtp-Session: l3s3148p1@vit7JFVPyr8ujnvz
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jassi Brar <jassisinghbrar@gmail.com>
Subject: [PATCH 0/2] mailbox: improvments around registering controllers
Date: Mon, 13 Apr 2026 12:42:37 +0200
Message-ID: <20260413104240.30493-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31235-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,sang-engineering.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 95F5D3EAC41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

While diving deeper into this subsystem, I manually found these two
issues which I wanted to fix right away. Please see patch descriptions
for details.


Wolfram Sang (2):
  mailbox: add sanity check for channel array
  mailbox: update kdoc for struct mbox_controller

 drivers/mailbox/mailbox.c          | 3 +--
 include/linux/mailbox_controller.h | 9 +++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.51.0


