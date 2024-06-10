Return-Path: <linux-renesas-soc+bounces-6013-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6812C9024EF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 17:06:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D199B20DCE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 15:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 594D2130AFC;
	Mon, 10 Jun 2024 15:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SJ7mwujy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC4D823DD
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jun 2024 15:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718031867; cv=none; b=LaoHQYiPwiKr3L4TVUhjStdyRNtFvFlrKictVxN/Dw3B7lU+oRHf8yrDeE+HU49SomoghQg/uiJXAH5C5U5elpf96SYYv4HiLM8lMNpFK4pul+O13koF35iVJ5yaDUWDBwp6FYupowfhf63XqWBDuKOit5gGJe8IDNM9NaVQczE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718031867; c=relaxed/simple;
	bh=0CZz6fw+7LQBCGyhxyakmhOUsemkkP5bzcqJ55ksXDY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bfDZWHRnK19RIUW1pKlSWo3gpHeH9ZCG2CIXyTHzzu9H2VOZ1/XcA5/rLlYBfpB/127IUJPbK1a8kG6EM3x/Or7cU3jnSPxVu6ZPdgaaSolPAzHFxk0pfcTL+KjG+CBEIcqLyXBQPUKNg1Uz6VoARHA7Q9OMT4+LN/dbb9zvxGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SJ7mwujy; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=cIJ/nk3afrFRki
	mdtl74K0AxDoomBJmwwsuEfKyi1+0=; b=SJ7mwujyN/j1MPysjU47gBFR+qy/zS
	lzBBBlFBqu4W9Y2U3J1cmqOGbGN7KBrHKKViURipze8wNIsY7A53BxuAuz2fwXD8
	P0iQGTn8Sctz4JJdWalofgDMjMGxtHzzU2oTiNVd+4tTOolPxthx01CHssJoG+gF
	CCsCAoZ4aV1nwpwP0JLaFNfbB8KAZ0+Qc18/vTs0ehXXatSpFg8cvb6LRAuQOvgn
	einKq4Kam2Io38TH21V6wYKaQ+OibOOQN4JM/5SWms5W0LQHdfZ5IkqpL1zxq0gp
	cTMgJ1nd8mjsAwzn+hMpK6PUQfhi3RS84e7vfhD9CLYKxsuASEuNG+2A==
Received: (qmail 118145 invoked from network); 10 Jun 2024 17:04:23 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Jun 2024 17:04:23 +0200
X-UD-Smtp-Session: l3s3148p1@6r7rdooa4qtehhrL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] checkpatch: really skip LONG_LINE_* when LONG_LINE is ignored
Date: Mon, 10 Jun 2024 17:02:09 +0200
Message-ID: <20240610150420.2279-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For a printout to happen, all types must be set to "show". So, AND is needed
for the flags, not OR, if we want to ignore something.

Fixes: 47e0c88b37a5 ("checkpatch: categorize some long line length checks")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Change since v1:
* removed now unneeded pair of braces (Thanks, Geert!)
* reworded commit message

 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 2b812210b412..375749e0a174 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3858,7 +3858,7 @@ sub process {
 			}
 
 			if ($msg_type ne "" &&
-			    (show_type("LONG_LINE") || show_type($msg_type))) {
+			    show_type("LONG_LINE") && show_type($msg_type)) {
 				my $msg_level = \&WARN;
 				$msg_level = \&CHK if ($file);
 				&{$msg_level}($msg_type,
-- 
2.43.0


