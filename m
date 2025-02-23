Return-Path: <linux-renesas-soc+bounces-13544-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C597A41244
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 00:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98FFC7A419D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 23 Feb 2025 23:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65F741FBEBB;
	Sun, 23 Feb 2025 23:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DX5BZ2v+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6765617588
	for <linux-renesas-soc@vger.kernel.org>; Sun, 23 Feb 2025 23:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740353821; cv=none; b=Qetqn3VLyfHt5h8sBev/Jd5HzvK2K1Jnz702IdwJ1wg416MZl+y5wzFqxQThD5tWFs7CeUxualzej6WnWlQml4xLnXoc09noCU/P/w847ord+kcjFM0k5E6MyA3JVPtlLdsa/LK9B2Bx9pc3xA/ruDe4FPZ6Y4/wLhJ715IakE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740353821; c=relaxed/simple;
	bh=Yop4/s+Sou9hbYrxOiyrJs6aEMFpqGj2bcNw28tiP8M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NgTYyrJqFzPkSRoMIpbtgLVKbqHZsHnDXKwy3QTTg4o93/byAh2v16RgFuzaeIuUUukHdnzVzk9nRq3OqEXymtH8dj1w//ExFHk/AMRzuoj+17NH5AWqP1VlT+3r+Q1Zp0W0JFprwSoggDzFneT882rvWJYtZe10XQ0NmJJBGQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DX5BZ2v+; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740353817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=grsJR/twTl2brq13919098Zme6VKzC6hvEwh05sMYbY=;
	b=DX5BZ2v+mQUIlO/ehTV1XQALgHmqYmtHOpF6dwJ1+9U96jvcS9z5JsD4ftaQfWD+PNKgOS
	RajwQ2m6VmvKQ543blqvE+cSKW8YZW7Vs3kcr5hK/Kj5ctPU6eJDyvZBFaZmK8lMGcZsfG
	O7tDVlE5LuokcqU7y1KrrR0Qnd67C50=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: ethernet: renesas: rcar_gen4_ptp: Remove bool conversion
Date: Mon, 24 Feb 2025 00:36:11 +0100
Message-ID: <20250223233613.100518-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove the unnecessary bool conversion and simplify the code.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/net/ethernet/renesas/rcar_gen4_ptp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/rcar_gen4_ptp.c b/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
index 72e7fcc56693..4c3e8cc5046f 100644
--- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
+++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
@@ -29,8 +29,8 @@ static const struct rcar_gen4_ptp_reg_offset gen4_offs = {
 static int rcar_gen4_ptp_adjfine(struct ptp_clock_info *ptp, long scaled_ppm)
 {
 	struct rcar_gen4_ptp_private *ptp_priv = ptp_to_priv(ptp);
-	bool neg_adj = scaled_ppm < 0 ? true : false;
 	s64 addend = ptp_priv->default_addend;
+	bool neg_adj = scaled_ppm < 0;
 	s64 diff;
 
 	if (neg_adj)
-- 
2.48.1


