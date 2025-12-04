Return-Path: <linux-renesas-soc+bounces-25555-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DE4CA42FB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Dec 2025 16:14:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0ED9E3005F20
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Dec 2025 15:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 847FC29ACC6;
	Thu,  4 Dec 2025 15:14:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D1D277CB0;
	Thu,  4 Dec 2025 15:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764861247; cv=none; b=Uj788xn8kEkqgwwgGYuUh0Ns33njkinTPviAVuxaC3frDoCx8vQM/fe9lQ/ztkMVx13uyF0K24uYcU/THd1P31XV9IPqGwcSC2ZWK67uvDhLzDHV2tNtbRKGk4/IyGxErfc9jgTljE8MbjoVEHlWkDTtgatftfU6fc5pt6AyE9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764861247; c=relaxed/simple;
	bh=nkadmEomxwETEzmfGO5mM+yNZFnMxG3znRQZq8FbyOY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kbIPgkvfObtGWSiyNmpgRgIgJ5jI7tT9s+OtthjO2rUrCaUMB4Kh2pggbwCkEBv7s4y5jtF7Cvj5ub2aOuw9ismepLye73fTmiKB0qZr7w7/VA/IXTdsVCgi29BMdsaIdj+vNm/nka8Z694tMMPZpobMr+Tl9L8wmrPFTf2BJA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEE0BC4CEFB;
	Thu,  4 Dec 2025 15:14:05 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Jonathan Corbet <corbet@lwn.net>,
	Thierry Reding <treding@nvidia.com>,
	Jassi Brar <jaswinder.singh@linaro.org>
Cc: linux-doc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] Documentation: mailbox: mbox_chan_ops.flush() is optional
Date: Thu,  4 Dec 2025 16:14:02 +0100
Message-ID: <6a50a5d4f0d0da26e5cccf348550879e53792e6e.1764861174.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the optional .flush() method was added to the mbox_chan structure,
the documentation was not updated.

Fixes: a8803d7421cc2be2 ("mailbox: Support blocking transfers in atomic context")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/driver-api/mailbox.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/mailbox.rst b/Documentation/driver-api/mailbox.rst
index 0ed95009cc307a41..463dd032b96cd45d 100644
--- a/Documentation/driver-api/mailbox.rst
+++ b/Documentation/driver-api/mailbox.rst
@@ -27,7 +27,7 @@ Controller Driver (See include/linux/mailbox_controller.h)
 
 
 Allocate mbox_controller and the array of mbox_chan.
-Populate mbox_chan_ops, except peek_data() all are mandatory.
+Populate mbox_chan_ops, except flush() and peek_data() all are mandatory.
 The controller driver might know a message has been consumed
 by the remote by getting an IRQ or polling some hardware flag
 or it can never know (the client knows by way of the protocol).
-- 
2.43.0


