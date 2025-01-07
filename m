Return-Path: <linux-renesas-soc+bounces-11897-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27890A03A88
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 10:03:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66EF53A55F7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 09:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC3E1E501C;
	Tue,  7 Jan 2025 09:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Z8gPt1FW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212F81E3DE0
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jan 2025 09:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736240541; cv=none; b=mhcrU5RUOHok2G4hZ9b0jyLhXh8o349UUm4iJSB8+AlrHEWHuwtDEeIAMVMvUy4WVqBRAEQZ9IWsNSMm0QtHCq8+cPn/huq+quDIK2//09L5FsPmKWgPnyix5wUmizGJEsBhLvO35jBq/3nhMB1hWQ+BjxP5zO7o64xXMdtIfoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736240541; c=relaxed/simple;
	bh=6WBmBJ+wsYTTtFIZUHux4v1UVY1k3Ukb/r0cybJeNGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e63t1OPUmYM2Bq5pfis2Nz+I+fhM2Y4scvpcL74HgdE1rYkvkkzoIyHMlPkaPvX8coZHlnTENfdGDNf23nz3MgQ+2uNHiHhawPt/HrbDEg30yXBZYPJGEvOjeHzJcHFpiNr56WEdqXwmIbrMWuXRUXe0Yi8MgsA8cjFkTri6N44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Z8gPt1FW; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=4Ve5hf8pI9HFM2zjnWzNNrBkEoJuyyCP7A1G3jT4K4o=; b=Z8gPt1
	FWquGr7BRS4yH7e39qM/9RQNxP5W+CQKEFLBf1HkzQv7Z8BEfHyfJrElCw8RIqZg
	cOSxR9iYey/DFG2RUVfNtsV/kEXhPcW4b1kDPr1KAPmRdIHH9qgKugNFJcu3dBGz
	SFkqyrrX0LdUUKna3mnWKVdAKanSjEQd5Zztg7XCisIuLNUnyBEsQvze/nabB2sA
	qzY8KGSn89fqw6zDHKEy8BNmnFd/eIraJ+oFNJpH8ZB5t1avPtV90enfFRqmclLI
	Z7J2bjMwED/ofK6IsQVei9HinikT1XI0ykdRp7xEKVhzHOHQCXtxbxHo5HPUfiNj
	Cv1+ZdsrBZyVt/Qg==
Received: (qmail 2125387 invoked from network); 7 Jan 2025 10:02:10 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Jan 2025 10:02:10 +0100
X-UD-Smtp-Session: l3s3148p1@oRcSABorbJMgAwDPXw20AOMQ2KO98fSH
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v4 5/5] i3c: cdns: use parity8 helper instead of open coding it
Date: Tue,  7 Jan 2025 10:02:03 +0100
Message-ID: <20250107090204.6593-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250107090204.6593-1-wsa+renesas@sang-engineering.com>
References: <20250107090204.6593-1-wsa+renesas@sang-engineering.com>
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


