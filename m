Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 415F917CF7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2019 17:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbfEHPVm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 May 2019 11:21:42 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.216]:13560 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbfEHPVm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 May 2019 11:21:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1557328900;
        s=strato-dkim-0002; d=fpond.eu;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=PqBZE6NhWzosKKTY8fgyr23SwEQXuP4OhdOutYbtHlU=;
        b=HOv8Yx4sy1h+yO0vk80Yw3KE7UyfOgLTFm3TfTAWUXrlvBSW107JBnTnlZyWrfoAyp
        saQuNqjkhDHygZ9otVFeIZxmKEPK1b9UX94VjwpOv/vsYxTV6T5X02JQ+SD6H8TkSr0s
        A/GRpO4BCkzcrGG0HwxLtkjA6U+vlMGnevxsuyfrsE15iLlF+9OnLScSQmbW14fmrz6n
        dtzl4eW8uefKLhIvkA7DRdFj7+h1yKF2j2BCjsTic/R/jHdBoBg+3aMhkI3nb8QLGnUF
        /G808NiP1r4KNWlpPrQ/e1LXfX3Ni3yjME+MqE6saTs2L1offJLuW8W1rj5Sgv6sAO0/
        xN/A==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR82Fdd8U4C/c="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 44.18 DYNA|AUTH)
        with ESMTPSA id y08c83v48FLNUG2
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Wed, 8 May 2019 17:21:23 +0200 (CEST)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     netdev@vger.kernel.org, davem@davemloft.net, wsa@the-dreams.de,
        horms@verge.net.au, magnus.damm@gmail.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH] ravb: implement MTU change while device is up
Date:   Wed,  8 May 2019 17:21:22 +0200
Message-Id: <1557328882-24307-1-git-send-email-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Uses the same method as various other drivers: shut the device down,
change the MTU, then bring it back up again.

Tested on Renesas D3 Draak board.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/net/ethernet/renesas/ravb_main.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index ef8f089..02c247c 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1810,13 +1810,16 @@ static int ravb_do_ioctl(struct net_device *ndev, struct ifreq *req, int cmd)
 
 static int ravb_change_mtu(struct net_device *ndev, int new_mtu)
 {
-	if (netif_running(ndev))
-		return -EBUSY;
+	if (!netif_running(ndev)) {
+		ndev->mtu = new_mtu;
+		netdev_update_features(ndev);
+		return 0;
+	}
 
+	ravb_close(ndev);
 	ndev->mtu = new_mtu;
-	netdev_update_features(ndev);
 
-	return 0;
+	return ravb_open(ndev);
 }
 
 static void ravb_set_rx_csum(struct net_device *ndev, bool enable)
-- 
2.7.4

