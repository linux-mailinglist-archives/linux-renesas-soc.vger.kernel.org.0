Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC3A5117854
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2019 22:22:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbfLIVWd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Dec 2019 16:22:33 -0500
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:63213 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726619AbfLIVWd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Dec 2019 16:22:33 -0500
X-Halon-ID: fe83faaf-1ac9-11ea-8e92-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p54ac5865.dip0.t-ipconnect.de [84.172.88.101])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id fe83faaf-1ac9-11ea-8e92-005056917f90;
        Mon, 09 Dec 2019 22:22:29 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] yavta: Fix usage documentation for --field option
Date:   Mon,  9 Dec 2019 22:22:22 +0100
Message-Id: <20191209212222.9857-1-niklas.soderlund@ragnatech.se>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The --field option takes an argument selecting the field order. Update
the usage text to reflect this.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 yavta.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/yavta.c b/yavta.c
index f83e143c051396c4..196345c323c662d3 100644
--- a/yavta.c
+++ b/yavta.c
@@ -2286,7 +2286,7 @@ static void usage(const char *argv0)
 	printf("    --enum-formats		Enumerate formats\n");
 	printf("    --enum-inputs		Enumerate inputs\n");
 	printf("    --fd                        Use a numeric file descriptor insted of a device\n");
-	printf("    --field			Interlaced format field order\n");
+	printf("    --field field		Set the format field order\n");
 	printf("    --log-status		Log device status\n");
 	printf("    --no-query			Don't query capabilities on open\n");
 	printf("    --offset			User pointer buffer offset from page start\n");
-- 
2.24.0

