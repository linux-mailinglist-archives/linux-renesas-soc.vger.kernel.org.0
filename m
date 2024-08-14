Return-Path: <linux-renesas-soc+bounces-7829-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 381919521F5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Aug 2024 20:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEF481F245CC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Aug 2024 18:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B9CA1BD4E2;
	Wed, 14 Aug 2024 18:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ezrR7SeF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4C71B0111
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Aug 2024 18:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723659737; cv=none; b=UmImt10Ro+jvyt3jLis+Nr2lPu2NreGSy6uUmetDY6YC134eEYOo2e6xy/4VVNJH6RHP8cygyg9sDLwmnTq0K8aVI1DSmk3T/GGg9f6XBg1sJneDyO8lA5n/2VF27WzQ/kBXaJNdMV3ChHTvK6Vku3fLyx/DN7nrusJPgWtunMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723659737; c=relaxed/simple;
	bh=c6OQZefza+adnkSkZ5sGm1MjzvG3yjQNLK1qIleCkjM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V4ADsvBFyGR+I+Gk6Wrjh+K1VyFUt9PPrNEOy0Webe82ixjYBSFsanQsWhNtP+3XPuFMJhapTNSJJAvFrD+lIYBfpH0VrpGM+kTCJDsszPboSIbfhbO+aFhO1ubj7X6hOLov2/A3A2XD2ZuQX19ZS7p3sTTJuV/qrK2JZah5NS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ezrR7SeF; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=SK8IexRvAKlKnh
	4m7J442KZI4xYCyLd87gulEF1hTLs=; b=ezrR7SeFU35ZwRDBF5nknfNlMxOsBq
	1UqV0Bn0VVUSelXOME61VO7lkFcyaXpqX+Rrp7l3fNMneC1KdW9YCPuzTRZjkyBM
	NaH1/s5TbzEoPAm4eoV4HzG24Mqe4vtM6FdwiApUCFssDvwkvHc9ZhKMU2+tlq9w
	Oj3do4L/7q3YxboM0K5PkZu7ernYSufBegR5pFuY/NeHSAI09RyN+vqlBzf2TOgN
	2tz1apsKX3gu3JsZlsfyA136vMoh0n/xEq0dvycdUktfcVIqXP7qN0JTePA5cUQE
	AeaT5AxnwaQQqSvcBEy9tVz3PItMVo3rlqvYDsZH5S1i9369Tcd/Egmw==
Received: (qmail 2065449 invoked from network); 14 Aug 2024 20:22:11 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Aug 2024 20:22:11 +0200
X-UD-Smtp-Session: l3s3148p1@c2oDzqgfcrYgAQnoAHipAGJRnFk/ZdC8
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH 0/3] i2c: testunit: let it trigger SMBusAlerts
Date: Wed, 14 Aug 2024 20:22:06 +0200
Message-ID: <20240814182210.15382-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Finally, after all the prerequisites, here is now the series to let the
testunit trigger SMBusAlerts. First two patches are preparations, third
one is the real thing.

The patches are based on i2c/for-next and have been tested on a Renesas
Lager board (R-Car H2) and a Renesas Falcon board (R-Car V3U).

Next and final step is to update/clarify DT bindings so GPIOs are
recognized as custom SMBALERT# pins. Code is all there already.

Looking forward to comments!


Wolfram Sang (3):
  i2c: testunit: describe fwnode based instantiation
  i2c: testunit: move code to avoid a forward declaration
  i2c: testunit: add SMBusAlert trigger

 Documentation/i2c/slave-testunit-backend.rst |  60 +++++++++
 drivers/i2c/i2c-slave-testunit.c             | 123 ++++++++++++++-----
 2 files changed, 151 insertions(+), 32 deletions(-)

-- 
2.43.0


