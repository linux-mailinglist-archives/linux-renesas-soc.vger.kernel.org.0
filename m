Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35D6C36008
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2019 17:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728529AbfFEPOn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jun 2019 11:14:43 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.165]:25957 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728553AbfFEPOn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jun 2019 11:14:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1559747678;
        s=strato-dkim-0002; d=fpond.eu;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=6QLl30ammr5VgUAthBs6M8MMgp7CqG1eEV3tOWy5HEY=;
        b=ET5pkhrJqFzeiqz3kDyEZhU+/VWGfvg5/4hzNoh+PCL0hx0xg4ukU0r02OUpRA6Z4+
        Jn7jnPAyd3oP26/7LfNWXfto3BeFj9hUkethMNRA3nivgroCvvXLauSIN4rsgn0ufKZf
        imo8LAD+mC0owKs4FUY/ucopVtCoCtDpq4Sp/rEZWXqLeWKW3BqdWPLfhJIfH4lwtbwE
        vhG9d6dyLewE/Opz2FpCeJ/d3hfBDMZYKVC6znxo/AGEyBVWsSfeuF1P9hojgIMfZhpC
        ypdM/YJKJq9KOJ5lAlhNUEL7BqStnDjB7cY/UJJKd0T5RYfxZAFDGotBSPLF6Lprqxdh
        zuBw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR82VcdxqguoQ="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 44.18 DYNA|AUTH)
        with ESMTPSA id y08c83v55FEOvhb
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Wed, 5 Jun 2019 17:14:24 +0200 (CEST)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     netdev@vger.kernel.org, davem@davemloft.net,
        sergei.shtylyov@cogentembedded.com, niklas.soderlund@ragnatech.se,
        wsa@the-dreams.de, horms@verge.net.au, magnus.damm@gmail.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v2] ravb: implement MTU change while device is up
Date:   Wed,  5 Jun 2019 17:14:20 +0200
Message-Id: <1559747660-17875-1-git-send-email-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Uses the same method as various other drivers: shut the device down,
change the MTU, then bring it back up again.

Tested on Renesas D3 Draak board.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---

Hi!

This revision incorporates Simon's and Sergei's suggestions, namely calling
netdev_update_features() whether the device is up or not. Thanks to
reviewers!

CU
Uli


 drivers/net/ethernet/renesas/ravb_main.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index ef8f089..00427e7 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1811,11 +1811,14 @@ static int ravb_do_ioctl(struct net_device *ndev, struct ifreq *req, int cmd)
 static int ravb_change_mtu(struct net_device *ndev, int new_mtu)
 {
 	if (netif_running(ndev))
-		return -EBUSY;
+		ravb_close(ndev);
 
 	ndev->mtu = new_mtu;
 	netdev_update_features(ndev);
 
+	if (netif_running(ndev))
+		return ravb_open(ndev);
+
 	return 0;
 }
 
-- 
2.7.4

