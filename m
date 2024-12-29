Return-Path: <linux-renesas-soc+bounces-11741-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A629FDE85
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Dec 2024 11:13:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62C671619A5
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Dec 2024 10:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE1C15442C;
	Sun, 29 Dec 2024 10:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="j+NbuKnH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA8C13C914
	for <linux-renesas-soc@vger.kernel.org>; Sun, 29 Dec 2024 10:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735467170; cv=none; b=OOpkNcVThlCswbCjdQ7pOKITN1SZh7sYqfoWjDspAvIYL6YdX5iejdWhKzFjnmujIKhNiTyirfWB6CIIVqKstBvw5Dt83RPci6gCl3qeWERytFTwHfo81bOfBuz04qRMjXwTg+Hw6B3Vcemd+C0JyBqNJy4hSbX85MQz0tGqpHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735467170; c=relaxed/simple;
	bh=UJO9Wig/mq0HYbVQ/7InT45fcHvTZoo1GM3kp2C6elw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dE2aZGdlQ4tpMTtClRRf3xplMic3A1uRrwx+Qva9FPrnHW+z4vecn60hEGg7K0ucOT69jiBhEEpbAGGeiXbF0kgqTUwE1AeiESkqZOhh7C6g7tfAMe0CQskBkQFBhMPp/cXFfnXQWK/+SwWh89lX1PDfDVXLgckrNt+oF0oCaac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=j+NbuKnH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=2KA7hCNfCHGJ3bQ72rfcY2S2+sqyqP8iXHnm5KhmB1w=; b=j+NbuK
	nHFFnXj2Buk7ny77kDCnyJr4CiJIVLlIJTJECcVPJx3yxjP9uqYymNSEWjgMvHZ9
	wfSRch8zu9CDPWWyFbo6eSZdJ8s3no+8RNMGYMCsjO7nBDA6nw2fZJt/6c1hqDWR
	L/oPBkXlLCH/8z6So+iyDcukcmqW4ZxEUvOfedJHnVfpqurlKgJb2+6mb936azst
	shgdQOyhlJJ74qx76hVu4eF5YWA6W70eSxCdv4fNg3cDOrzYiEkJ+oRIL2WAWp4h
	1cRxW59DjtuaBB0PnhjYBBgQN1IItAZAOIewsgXNFCxCTJDKFGz+DqjIxMwSCtdv
	nAL71FubWrdxWwrA==
Received: (qmail 3656777 invoked from network); 29 Dec 2024 11:12:38 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Dec 2024 11:12:38 +0100
X-UD-Smtp-Session: l3s3148p1@e8CD72Uqle8ujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH RFT v2 5/5] i3c: cdns: use get_parity8 helper instead of open coding it
Date: Sun, 29 Dec 2024 11:12:33 +0100
Message-Id: <20241229101234.2896-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
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
Changes since v1:

* renamed from 'get_parity8' to 'parity8'
* rebased to 6.13-rc4

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
2.39.2


