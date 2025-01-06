Return-Path: <linux-renesas-soc+bounces-11869-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B22A021CD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 10:27:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C9287A18CD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 09:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9D91D9665;
	Mon,  6 Jan 2025 09:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="RNPmz+s1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87551D90BE
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jan 2025 09:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736155659; cv=none; b=YpohMM5HFiXjN2yGKKdYrItV8vrXowHEOXhLiovwmcqVAzQPOTpjwn2hpOSVbmjYKVKM+URZFEdyie36KpC4A1/dq/Ttp2wCvA/EDpNeKkm2+HE9FImQ0qpO8NmOMfRtjkaCd/Lr2NY9js0t+jee+xsMz3fAExeXFFoN3Hod0CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736155659; c=relaxed/simple;
	bh=6WBmBJ+wsYTTtFIZUHux4v1UVY1k3Ukb/r0cybJeNGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NEsxCaSpG4/5lYwskJfJtBi64evun0f3/YGhZ22qPfjPPEKzInr8XYr2CuSKzeQ6p35OyHvoe6CBC+Z1eaTUCqTrelEboUakrSMPsbERg9Z3laCzNpWV2UC0eY6Tq8KLi16N0vIBXqON3oa9FVnjyz/nxVTWHCgFzKz+RSZ4v2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=RNPmz+s1; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=4Ve5hf8pI9HFM2zjnWzNNrBkEoJuyyCP7A1G3jT4K4o=; b=RNPmz+
	s1OJyMvaf2h72opfmkKaB+XXlnlb0Cj8eqFQOXvJKA+nDFa4XlMUNHUziAmhuZJ2
	adB9bZOOBaxcNwXRNYPMdgOfMdFPcvRRv4tHjdxH2ThdeUXtkosq5Ttz6WWOK4RB
	rtFCCfPICOdxKJDPdMJfEm5+Yyds3UcHnq+wF3L4hZfQMc8G5fFeMOARvFJthgvX
	QM+V6BrfEmBzZ6iBcR3DnscecEV5X8MmIPx0iAC8RjIxuoHEthQW5SVPZeDdKsK7
	1wV9zAMPjYt9UV82van6NqoDDe/p7azNjlV2Es1B7A9kaTlf9fakZSbTXAJdw+MW
	kMDM2it+fZoy13Qg==
Received: (qmail 1727987 invoked from network); 6 Jan 2025 10:27:30 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jan 2025 10:27:30 +0100
X-UD-Smtp-Session: l3s3148p1@1QbHPAYrCJwgAwDPXw20AOMQ2KO98fSH
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v3 5/5] i3c: cdns: use parity8 helper instead of open coding it
Date: Mon,  6 Jan 2025 10:27:23 +0100
Message-ID: <20250106092725.22869-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250106092725.22869-1-wsa+renesas@sang-engineering.com>
References: <20250106092725.22869-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel has now a generic helper for getting parity with easier to
understand semantics. Make use of it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i3c/master/i3c-master-cdns.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 06c0592487d3..fedbe6624a1c 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -889,8 +889,7 @@ static u32 prepare_rr0_dev_address(u32 addr)
 	ret |= (addr & GENMASK(9, 7)) << 6;
 
 	/* RR0[0] = ~XOR(addr[6:0]) */
-	if (!(hweight8(addr & 0x7f) & 1))
-		ret |= 1;
+	ret |= parity8(addr & 0x7f) ? 0 : BIT(0);
 
 	return ret;
 }
-- 
2.45.2


