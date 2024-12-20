Return-Path: <linux-renesas-soc+bounces-11635-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 017EE9F915D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 12:32:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 115371891DFE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 11:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D215E1C2456;
	Fri, 20 Dec 2024 11:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Rfb4poHg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC6E1C5CDC
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 11:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734694231; cv=none; b=fhSwl25KPcZf1A2skszb4HPd2LPRSVv8TcLJP2VlnJhAIdQb9SMYmpRjZqTc94KlIVthetqYeP8P3fdNSLN0PBnb2wHXoJCbaw3hFkU7ZxtE8/nLXBovusLNNHOM2FcJenQacipZaiuAPF3Tcp4BzacbBGkCYTfwrQj8W/gd3Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734694231; c=relaxed/simple;
	bh=nuc0RZ7/2GFIN6GG8WZzbZFnq0y+SsYQBbRS2ZzaVq4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Wf6UaK8i3vXStU9JiP/zlUba6Axs6OIZORwjG1P9hujkuUXhWa95J+VFj2k/XSHQcTkiTPTJ+gxxD5Ew1b7D3XUbCNiwF2x4sZzAK6nHx4fO9aIV7lAVzaHov5XqbGDURlWS8CFyECkQtJcI4Zdrf2ySY1BnRFUn1xneB/ZIQBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Rfb4poHg; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=rsDE8URaHTqtvoHB8Si3sxcYn73y38+s7yQFTYbHb2I=; b=Rfb4po
	HgqpyesKVuDDivS2ZFzUzRwZK7+gL8A5R6A6xlwpQ6wO5eid5OpOVKmeuteAdAl3
	Sg9fLQ+khYWj8Q3wWPByxRFDBN5B3Npg7pAo+KTFkxgjFY5fmJXfXx72bPPVG/Kg
	T+d8/T4ORf2/PtY+mNYgA2oHQ38RpqjBxrBT03witTgpNw4y2xJRENMuDv5Wky3E
	spD/IaJAr/j0iLFYkle6O7IVQiJJIFcYL+Etv/YZEhREjqjTEq4ktJ8p3LgphRkJ
	2WY4UP07xLe/3PG9Dkdx7rTNxaOm6ROoB5wJK80/exqzLJsWfFU4JHXKvW+uOYPh
	iIO6DsADxkxy5T3g==
Received: (qmail 989817 invoked from network); 20 Dec 2024 12:30:22 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2024 12:30:22 +0100
X-UD-Smtp-Session: l3s3148p1@I5Pi+LEpFp8ujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH RFT 5/5] i3c: cdns: use get_parity8 helper instead of open coding it
Date: Fri, 20 Dec 2024 12:29:59 +0100
Message-Id: <20241220113000.17537-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241220113000.17537-1-wsa+renesas@sang-engineering.com>
References: <20241220113000.17537-1-wsa+renesas@sang-engineering.com>
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


