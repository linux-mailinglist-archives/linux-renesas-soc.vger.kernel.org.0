Return-Path: <linux-renesas-soc+bounces-22328-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25493B9A02A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 15:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF1864C364C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 13:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFBAE3043B9;
	Wed, 24 Sep 2025 13:19:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7FF304BA8;
	Wed, 24 Sep 2025 13:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758719977; cv=none; b=bSoNO6uN8djBaOgvI3rJMnqL7x8cZrXgg4b7EsLpPGSpxoXnGxiM2Tqcc0931mLUdQUJtCC1o0Av7UaaxpXBKckcmd6EUo9xPFJ/iFd0tgpAwwhGKx09XhZL4NlcmXpBCQIVoCr6wN5hY83d23M5L3rCdGtcAYNPDvWDUCmHR5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758719977; c=relaxed/simple;
	bh=BM8Wcnq/5WBXMEv91PoKN60uQW0Qu0p3WPLEYWEo/to=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DyVaJneNudSB1C8ILPwX5co/Q3Gxy5P6kRSvzytt3khuw/tNvonYP18cElnrNGb8g3jUJd4FWMqeDUyLpYjThlPnK4KYj1+9tNFTM9KuZwsxnAubiUW7tu16gPDS/QqubSK1hmCvwdS6aFFJ7uATLyXxaePAHoBq651ypToPo/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EA3BC116D0;
	Wed, 24 Sep 2025 13:19:34 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Michael Dege <michael.dege@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] [net-next] net: renesas: rswitch: Remove unneeded semicolons
Date: Wed, 24 Sep 2025 15:19:30 +0200
Message-ID: <e6b57123f319c03b3f078981cb452be49e86253b.1758719832.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Semicolons after end of function braces are not needed, remove them.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/net/ethernet/renesas/rswitch_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index 69676db20fec635a..8d8acc2124b8fdaa 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -1629,7 +1629,7 @@ static int rswitch_open(struct net_device *ndev)
 		rswitch_update_l2_offload(rdev->priv);
 
 	return 0;
-};
+}
 
 static int rswitch_stop(struct net_device *ndev)
 {
@@ -1664,7 +1664,7 @@ static int rswitch_stop(struct net_device *ndev)
 	}
 
 	return 0;
-};
+}
 
 static bool rswitch_ext_desc_set_info1(struct rswitch_device *rdev,
 				       struct sk_buff *skb,
-- 
2.43.0


