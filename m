Return-Path: <linux-renesas-soc+bounces-18830-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1D6AEB61B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 13:18:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9B703B969D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 11:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CACB3294A1C;
	Fri, 27 Jun 2025 11:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="i8qefWdm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566131A841C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Jun 2025 11:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751023097; cv=none; b=mwvDzmFgx+QCAcGnQ1gNi2ThZ9ts/T/xs3Nc1lFtiRs4IJ3Xq1WAOuD70yf7NBpcJqfvnICV4lh6T4ULTa6MJlbLyGGZ8LKOs8EnV/78EIhyncT/RzOJFQycReTi/2pN2zm63s5IlnyfCMs/9GZXCZ5BEOvpf5yy15BvS+nHaNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751023097; c=relaxed/simple;
	bh=b9RTNKi0JzfqMydhTFfizJzNvNuVPjp26d4uB75AGvM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ILp0aSMxqtxHDuH94Ls2UwCZsvmlfvW1CUlxe+PvUEO2sHQKFNXCIlQCjTHj0vIvf28JLcLgx0JkGNTTop+KEo1CmNLh6tpcjiR9zjDi/9GpGqUXLJDr2T01pdlLaDkLUw5WaAl4EgW46iQ5EVpAAkT/sHrKgVzq518KHy+/fF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=i8qefWdm; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=92ohitJ95DsLOl
	FaNlsKGYTwxrhgaxccrLi2DdPtkvQ=; b=i8qefWdmmp+N59JDwcN50XHzoUg0Qz
	Sk5tfjewNQXfgim0dA9qIlm6RBBapwsxXQb/TJTpk3ufyrPGFpgQpqBNH4LZQYHx
	1o/LfknOjwL9ZzyDFcdvdrb4/Ll9yBxyKk1T/AtpV7mAbM5n8owt92a3ILstYLy6
	xs7a25AaRe4PXRns5+wp+CgNH4wpb6C66UScSjLPypwlStCG5egftp3JUrXhJDlN
	NgqURrUU3B3AaELndPtBZpgKcCxjqNbv8ZbMt9F1dPzFX+etI8k4cOtRt2UySiOj
	L4W+6SA3s6KD90xAMfjMJzGXu9QZwohmFLjuvj6vOEWj6pGbz3hGkYtw==
Received: (qmail 1443517 invoked from network); 27 Jun 2025 13:18:10 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jun 2025 13:18:10 +0200
X-UD-Smtp-Session: l3s3148p1@jG9L1Ys4foMgAwDPXzuUAOCQSK0rM+sw
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>
Subject: [PATCH v2 0/3] i3c: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP
Date: Fri, 27 Jun 2025 13:17:55 +0200
Message-ID: <20250627111755.16535-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v1:

* updated commit message

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


