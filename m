Return-Path: <linux-renesas-soc+bounces-11645-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA1E9F916F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 12:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC8D57A1F2B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 11:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02BC71C07CD;
	Fri, 20 Dec 2024 11:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="EO5MSgyf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28751B043C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 11:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734694422; cv=none; b=KXxOlfaobOkdBtllBqVi1WOr0z7o9NFNV7Xd9QB7Mt2eCNgvxZqoER5MiSqPtu4GeLo1UBLWqSpi4RXAWl/BKLw2dO9F7sUvw4z3PbU6MKsdKTLjLra2zPIN1jpNHZzXe4oTCQn7LzYq0mPQBjsXrFSUrjtRxwcE+tZ5dpFRIhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734694422; c=relaxed/simple;
	bh=nuc0RZ7/2GFIN6GG8WZzbZFnq0y+SsYQBbRS2ZzaVq4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h8d+y3r9H+GN+LdVp+lKbXM9nRBPo7HI0arbsN/ELqkVYJW2fQ7biXDQQrcO28L0nJ/n7GKUEXDXmM8kX3qg0gPyF5/NwZoxlOnIqGqZ+WCUixkDzGAA+nzt8Q6keBxkJnZvw/xBsyG8BJgs1gN+vSrSZ87Hq1gohBB5gdUF0lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=EO5MSgyf; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=rsDE8URaHTqtvoHB8Si3sxcYn73y38+s7yQFTYbHb2I=; b=EO5MSg
	yfoTmozbzfM4TSszr5SUnGJnfT+gYqAPQz9gKubm0iAh8efyTxEwJJMSqR25rk5C
	LFUdM0AdlVzSrV27Y5uFQZapXHcucaHNWZVDYJtFuwCf/2Y163Wu43ul5KIOd0DY
	GBWq/PROenKtq8uUpuwSfz1QUYnhXJ3NxR90D6+Vx2a1VVshNfdcwFWDBiSEZXky
	d2d1g+Lkw7eYyU+p6To8fF22etZxQZqsBrRJvAaN/lcNXtVze7jx1aVMVa0WNKie
	8u3ZEXcn7jp+N6HHKvVfymGUo/FhLPo3xi2HccTH05em5jyV+Uzthoz2BRohWauk
	FZVS9J6r8oKLlmSg==
Received: (qmail 991033 invoked from network); 20 Dec 2024 12:33:38 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2024 12:33:38 +0100
X-UD-Smtp-Session: l3s3148p1@C8CcBLIp1uIujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	linux-i3c@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH RFT RESEND 5/5] i3c: cdns: use get_parity8 helper instead of open coding it
Date: Fri, 20 Dec 2024 12:33:33 +0100
Message-Id: <20241220113335.17937-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241220113335.17937-1-wsa+renesas@sang-engineering.com>
References: <20241220113335.17937-1-wsa+renesas@sang-engineering.com>
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

Can't the '& 0x7f' be left out here?

 drivers/i3c/master/i3c-master-cdns.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 06c0592487d3..abeef6f70b53 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -889,8 +889,7 @@ static u32 prepare_rr0_dev_address(u32 addr)
 	ret |= (addr & GENMASK(9, 7)) << 6;
 
 	/* RR0[0] = ~XOR(addr[6:0]) */
-	if (!(hweight8(addr & 0x7f) & 1))
-		ret |= 1;
+	ret |= get_parity8(addr & 0x7f) ? 0 : BIT(0);
 
 	return ret;
 }
-- 
2.39.2


