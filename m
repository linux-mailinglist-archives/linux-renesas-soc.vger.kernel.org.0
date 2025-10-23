Return-Path: <linux-renesas-soc+bounces-23558-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00652C03B06
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 00:40:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDBBB1AA4137
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 22:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0D4D25F78F;
	Thu, 23 Oct 2025 22:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="v0K9wHgR";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Edb9PGSj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DA823C4F3;
	Thu, 23 Oct 2025 22:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761259245; cv=none; b=tZZ9pEoAHJWu+3aDLFlqHoA3cEycDm3Z8KwSxYPO7hqRUj7OoU3QjFnb1S452VkOghyN+MlQbEOLAPbFEx2y9KYToQ0DspF5Wszo7eG2jvQASZSKk05C4OrqwZdL1evX63tn1ZhzXSmGYLAH8SrqQX5rs3DqbeO+tqzlAuiLb6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761259245; c=relaxed/simple;
	bh=Pk6kw8jl8gTalk+B9iAiGFcYs/f1+SPAtpxnMWOU8N8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lV+BIAF9l6kBdJdTIi6Fa2Aiv8pIlckorctL5n5mBqKLvAn5utuL6KDljF0NrCqLEgqXSrLnwYbtDT8HNFLusP2UiuMQFF7sexBSUUHjXwu9/4qoBS5dhaEkjtwWqah/sTHXT+VUjo/Jy5GqY9+zftHfdw1YB4ovumftmrL/XV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=v0K9wHgR; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Edb9PGSj; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ct1G13qw3z9t8J;
	Fri, 24 Oct 2025 00:40:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761259241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HrSRitxA410IgZWjNy6T/E8TCtsXIYs0nf8Te4i2F+s=;
	b=v0K9wHgRGvfxGsgU6+fvmfl9K5kWtVTtbdL0+vVmX5GjZxUScMLcqXU4EXohbAo7GMxAbn
	pYH6v+GgJRALH5fg6/AHrZLND70MlHit/sOAi3Rd0hmben0eyQJXhEndOzx98wl322+tVj
	QTKh69O7VS4mGqj4QpEjxVI0Xn3WNL7TVahb+gc7Hb6Kwao8WkDaj27WVXnzOjJZ2aaijs
	a0hIlhmSwiCIaEtK+xemFD8RvVBivOp0lv115zVPcxi66c5I/KJFffZPZ5htQsQKCXH0gm
	IHOLnoAIfJ51hr7YPVSqjDV640YZymBYZXHVCSp5LZQiM3yBGr8JuKqTQhQV2g==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=Edb9PGSj;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761259239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HrSRitxA410IgZWjNy6T/E8TCtsXIYs0nf8Te4i2F+s=;
	b=Edb9PGSjSE+tBs8HzLEZ6yv1kNv4l6grSa8WgbpfXofG3u/iLxvIffC5QOL1j9UCBaG7hh
	ELmZIgC7NRFNC5jQJd13jgQaTdrVMNqvlOclMJ4EoNmckE4dZMScQif6zOoHCId4/SuI0L
	ETDqIk7t/NHDllR53qycMJ9/jjXlUYGUYZnlvPOkViy+u/T/P+bSduiXEKgM6gPE3HCSWU
	7Pdkl0YyZkMQD+0AifNrMLr6gJXtu+J+/VFuX9uasWLYlLc6v3C9hxk+tY8U81pJTuYQTR
	XGTUQWNmPEJWtK1fEHrVWoETY02hdb4RsyduX0BlPrYNjZhhGcten8/ClahDkA==
To: netdev@vger.kernel.org
Cc: Thanh Quan <thanh.quan.xn@renesas.com>,
	Hai Pham <hai.pham.ud@renesas.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Dan Murphy <dmurphy@ti.com>,
	Eric Dumazet <edumazet@google.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-renesas-soc@vger.kernel.org
Subject: [net,PATCH] net: phy: dp83869: fix STRAP_OPMODE bitmask
Date: Fri, 24 Oct 2025 00:39:45 +0200
Message-ID: <20251023224018.192899-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 6c771f7464063db6468
X-MBO-RS-META: sfhow7epi4cpq6i5xuymx7f5nibx51oq
X-Rspamd-Queue-Id: 4ct1G13qw3z9t8J

From: Thanh Quan <thanh.quan.xn@renesas.com>

According to the TI DP83869HM datasheet Revision D (June 2025), section
7.6.1.41 STRAP_STS Register, the STRAP_OPMODE bitmask is bit [11:9].
Fix this.

Fixes: 0eaf8ccf2047 ("net: phy: dp83869: Set opmode from straps")
Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org> # Port from U-Boot to Linux
---
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/net/phy/dp83869.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/dp83869.c b/drivers/net/phy/dp83869.c
index a2cd1cc35cde1..1f381d7b13ff3 100644
--- a/drivers/net/phy/dp83869.c
+++ b/drivers/net/phy/dp83869.c
@@ -84,7 +84,7 @@
 #define DP83869_CLK_DELAY_DEF			7
 
 /* STRAP_STS1 bits */
-#define DP83869_STRAP_OP_MODE_MASK		GENMASK(2, 0)
+#define DP83869_STRAP_OP_MODE_MASK		GENMASK(11, 9)
 #define DP83869_STRAP_STS1_RESERVED		BIT(11)
 #define DP83869_STRAP_MIRROR_ENABLED           BIT(12)
 
@@ -528,7 +528,7 @@ static int dp83869_set_strapped_mode(struct phy_device *phydev)
 	if (val < 0)
 		return val;
 
-	dp83869->mode = val & DP83869_STRAP_OP_MODE_MASK;
+	dp83869->mode = FIELD_GET(DP83869_STRAP_OP_MODE_MASK, val);
 
 	return 0;
 }
-- 
2.51.0


