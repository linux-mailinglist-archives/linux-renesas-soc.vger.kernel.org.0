Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC75B175738
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2020 10:35:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbgCBJfh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Mar 2020 04:35:37 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:35336 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727115AbgCBJfh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Mar 2020 04:35:37 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id 9Mbb2200N5USYZQ01Mbbxs; Mon, 02 Mar 2020 10:35:35 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j8hU7-0008PX-Ap; Mon, 02 Mar 2020 10:35:35 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j8hU7-0002Ms-8H; Mon, 02 Mar 2020 10:35:35 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] mmc: renesas_sdhi: Use BITS_PER_LONG helper
Date:   Mon,  2 Mar 2020 10:35:34 +0100
Message-Id: <20200302093534.9055-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use the existing BITS_PER_LONG helper definition instead of calculating
this value.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/mmc/host/renesas_sdhi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 7a1a741547f25de5..2a4c83a5f32ef8e2 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -60,7 +60,7 @@ struct renesas_sdhi {
 	bool doing_tune;
 
 	/* Tuning values: 1 for success, 0 for failure */
-	DECLARE_BITMAP(taps, BITS_PER_BYTE * sizeof(long));
+	DECLARE_BITMAP(taps, BITS_PER_LONG);
 	unsigned int tap_num;
 	unsigned long tap_set;
 };
-- 
2.17.1

