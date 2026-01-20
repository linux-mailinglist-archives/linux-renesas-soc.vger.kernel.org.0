Return-Path: <linux-renesas-soc+bounces-27091-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EF46DD3C335
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 10:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B8DF9689EB6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 09:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C4DE3BFE2F;
	Tue, 20 Jan 2026 09:05:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9A83BF309;
	Tue, 20 Jan 2026 09:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768899912; cv=none; b=KhxjahH5SkqDElYrSBUib/0+SBKFnLXp/nxu3+YZm9i8AmkEv0fxysXtNehltTCpp8EVJidHDKZVd3Iy6ogiS6dR8I32uGyexMGV0qPjKdRif9yICZY843jNBVhwd4Gw8VUvNHlvstIq+YroUO+zmU0fGnNMekXxrg244mn1lwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768899912; c=relaxed/simple;
	bh=j1/ltLmUQ4NDICNpGgctEnKWnTWiMEJ8AXCw2JKfPfg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KegE9SJf/OPfM/e7emz8nDrHKNPVTuv74kwxQ2bDJ4tg/aQcso4G6vai3pCxmfepocq8milHxxDdMT41fSx0pBuaxI7ic3UvSjddntXMMNKn3sVO6JwmicUk/pUUINSxd7G6uXgxe3TwDzxectF02lw54Ojb88ZW2PbehrZItCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A9CC16AAE;
	Tue, 20 Jan 2026 09:05:09 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Marek Vasut <marex@denx.de>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] clk: rs9: Add clock index range check to rs9_of_clk_get()
Date: Tue, 20 Jan 2026 10:05:06 +0100
Message-ID: <4cb63bd8b1e49407831431fbc88b218f720a74fd.1768899891.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rs9_of_clk_get() does not validate the clock index in the passed
DT clock specifier.  If DT specifies an incorrect and out-of-range
index, this will access memory beyond the end of the clk_dif[] array.

Fix by this adding a range check to rs9_of_clk_get().

Fixes: 892e0ddea1aa6f70 ("clk: rs9: Add Renesas 9-series PCIe clock generator driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This is v2 of "[PATCH] clk: rs9: Convert to clk_hw_onecell_data and
of_clk_hw_onecell_get()"
(https://lore.kernel.org/a6dce17b15d29a257d09fe0edc199a14c297f1a8.1768836042.git.geert+renesas@glider.be)

v2:
  - Just add the missing range check; the conversion to
    of_clk_hw_onecell_get() can be done later.
---
 drivers/clk/clk-renesas-pcie.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index aa108df12e44fb9f..1adc5365ba1a3d59 100644
--- a/drivers/clk/clk-renesas-pcie.c
+++ b/drivers/clk/clk-renesas-pcie.c
@@ -277,6 +277,9 @@ rs9_of_clk_get(struct of_phandle_args *clkspec, void *data)
 	struct rs9_driver_data *rs9 = data;
 	unsigned int idx = clkspec->args[0];
 
+	if (idx >= rs9->chip_info->num_clks)
+		return ERR_PTR(-EINVAL);
+
 	return rs9->clk_dif[idx];
 }
 
-- 
2.43.0


