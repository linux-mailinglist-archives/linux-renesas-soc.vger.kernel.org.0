Return-Path: <linux-renesas-soc+bounces-18882-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F82AEC9E7
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 21:20:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A89A179747
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 19:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54BEA23BCF4;
	Sat, 28 Jun 2025 19:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="L7AkFT0H"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F191A704B
	for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Jun 2025 19:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751138450; cv=none; b=Pj9g8BqA5DD0uuhQ0tjP+iQIMbH9HvnpSeCaARaeYivFZVPYj4ZMq4rIOHP3muRYr0iWRAQA8HLPKnzmOneuzgR76zTwGaCFnzYWM6Vw2uVUJM2sk6WHNeDRgr6bhMKJfA67piAmtcp9tv6IGHqaIIRsQM1zzglwxFyDMuQA7kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751138450; c=relaxed/simple;
	bh=9f1uE/eH8Kp8xCnClbF0rm3y7W7PS70gWCur4kMxKYw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VbSS7yVe1e5tPAgMD0Lh9dZWbpkxzG5t//0pbKiJUrXuIEI89W2aG+CsLfvoeM7uJkcy7yGLam38qb/ThrCt8f8Ujec1aYMXXHBvp9r8axT/oskaGrjtEmvy2UZ8+y7dOq2un3PeXZ8wx9fWEPV2PkkPZu/h/O7awjY0GO6BN1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=L7AkFT0H; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=rX23wz/SYUNw54
	bZGoh/2tSnXh1H/M5q2krRbd706sw=; b=L7AkFT0HM98cI4pWrwngdsHYFz9N2u
	Iv0s8H0z0OcLog9XBp0b4a6dAbS97voEU/OE8RK15U3WgdTd63jaUl8aSOaAjsBH
	Sc+fwLjHaWys+jcQB3pRc8l16zCooUxJNfZ48YmHaiMuoMEPw0rySGmXOtrsGM3y
	W3g0G6Tk4NCBh+EiuYsGp6xNtOP29hMsUpGNtG1IuRUZXEC7eusBveg8wq5u77IU
	v1lt2r1ahpcO1M1ngFTFSKF6RQAxO1uQRwBLkj9iY0JOGJXs2+zYH9VtvttZSA2i
	xnO6ADuK8QwPqgD5nwfi0c4gzd0R+LQS+tC6TG1O2/lou/+d4xiNUoLg==
Received: (qmail 1918934 invoked from network); 28 Jun 2025 21:20:43 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jun 2025 21:20:43 +0200
X-UD-Smtp-Session: l3s3148p1@O1jasKY4LIQtnPBw
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>
Subject: [PATCH v3 0/3] i3c: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP
Date: Sat, 28 Jun 2025 21:20:27 +0200
Message-ID: <20250628192027.3932-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v2:

* updated commit message again

This checkpatch warning makes sense here: "ENOTSUPP is not a SUSV4 error
code, prefer EOPNOTSUPP" We don't have a userspace interface yet, but we
probably will get one. So, let's convert these error codes now, before
it will be forgotten in the future, and they could slip through to
applications.

This is based on 6.16-rc3 plus "[PATCH] i3c: don't fail if GETHDRCAP is
unsupported" which I sent earlier. During its development, the issue
became apparent. Automatically generated and build tested only.

Looking forward to comments.

Wolfram Sang (3):
  i3c: master: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP
  i3c: dw: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP
  i3c: master: cdns: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP

 drivers/i3c/master.c                 | 20 ++++++++++----------
 drivers/i3c/master/dw-i3c-master.c   |  8 ++++----
 drivers/i3c/master/i3c-master-cdns.c | 12 ++++++------
 3 files changed, 20 insertions(+), 20 deletions(-)

-- 
2.47.2


