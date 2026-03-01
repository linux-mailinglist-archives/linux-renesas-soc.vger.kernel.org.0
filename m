Return-Path: <linux-renesas-soc+bounces-28610-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBB9OzCZo2neHgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28610-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 01 Mar 2026 02:41:04 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 170F11CB536
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 01 Mar 2026 02:41:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02C7D31B509D
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  1 Mar 2026 01:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D6F1EDA0F;
	Sun,  1 Mar 2026 01:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZCojlGCZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B492B13B58A;
	Sun,  1 Mar 2026 01:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328617; cv=none; b=LrQr4YV+jXbLpynR/aJd7My0dVYfrVBD9n2rpifJ7inrPw7/4PEuha85PywtK+WxSFlIHZ6VM0npu+XpcsKhOAzoT/LBQpVMIdP4mO8BKSyQdmcCTbo7oU2QxPApxTCSstMyk3Xo7GVp1oh61J7qmY9Wn7Pp4w9OkuBxPFo286o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328617; c=relaxed/simple;
	bh=Mn//afI2TfMreNTiemEzn8uwD8NcUG9QuPWmMtvn80w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aufZopIxHc7L5rNMWQD7jhvpbpE56gn6/DQ8TtpVGYYgRfSshQJCCU3W88u0Xcv6yNkJsiCmzLnOyCq23GHPxWxn3PErSmfM/5VhupUctdCniZJbxqujjXfa0Bn84ps0vK2DXFqgEpEetj+kc4PjO1AyNM8IqJuLM747KgJbfGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZCojlGCZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED931C19421;
	Sun,  1 Mar 2026 01:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328617;
	bh=Mn//afI2TfMreNTiemEzn8uwD8NcUG9QuPWmMtvn80w=;
	h=From:To:Cc:Subject:Date:From;
	b=ZCojlGCZHTQudUmy+8fY5e8OzsGr/zU2JnCKgd+75PbBNLvhjKaJYTh0arnSqgAMD
	 VbJfZxiBU5EYPtM9P0za9f8LnVZAziDhmlpEakl423oeU7qEx0Fz6d7jg7hkbgR6tU
	 MqEiZmgnpWT2CgSRCwhgBXwWys0Tnjo1DFpmjO5yVrSP4xZgfbfIzGfzPLOE0T0x5m
	 ZK5vJXGaVx38YesDTXaUc29HVlOujyBJkrWRQAOdMOatMbxRVbW/rscV66SHqIJQI0
	 LuB2/nn/C+cz1lI6cjdtfM/6UxZ/LaakyKehJjKEGNj8BoPIPo/4bNURzsZ/s/Aopa
	 mxnrGjGu+Tp/g==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	chris.brandt@renesas.com
Cc: Hugo Villeneuve <hugo@hugovil.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: FAILED: Patch "clk: renesas: rzg2l: Fix intin variable size" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:30:15 -0500
Message-ID: <20260301013015.1688256-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-28610-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 170F11CB536
X-Rspamd-Action: no action

The patch below does not apply to the 6.6-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From a00655d98cd885472c311f01dff3e668d1288d0a Mon Sep 17 00:00:00 2001
From: Chris Brandt <chris.brandt@renesas.com>
Date: Fri, 14 Nov 2025 14:37:11 -0500
Subject: [PATCH] clk: renesas: rzg2l: Fix intin variable size

INTIN is a 12-bit register value, so u8 is too small.

Fixes: 1561380ee72f ("clk: renesas: rzg2l: Add FOUTPOSTDIV clk support")
Cc: stable@vger.kernel.org
Reported-by: Hugo Villeneuve <hugo@hugovil.com>
Closes: https://lore.kernel.org/20251107113058.f334957151d1a8dd94dd740b@hugovil.com
Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Link: https://patch.msgid.link/20251114193711.3277912-1-chris.brandt@renesas.com
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/rzg2l-cpg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 64d1ef6e4c943..dfe0f5e87d8cf 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -122,8 +122,8 @@ struct div_hw_data {
 
 struct rzg2l_pll5_param {
 	u32 pl5_fracin;
+	u16 pl5_intin;
 	u8 pl5_refdiv;
-	u8 pl5_intin;
 	u8 pl5_postdiv1;
 	u8 pl5_postdiv2;
 	u8 pl5_spread;
-- 
2.51.0





