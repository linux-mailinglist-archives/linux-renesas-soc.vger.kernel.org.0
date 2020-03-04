Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E0611791F6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2020 15:09:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725795AbgCDOJ3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Mar 2020 09:09:29 -0500
Received: from sauhun.de ([88.99.104.3]:33724 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728432AbgCDOJ3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Mar 2020 09:09:29 -0500
Received: from localhost (p54B331AD.dip0.t-ipconnect.de [84.179.49.173])
        by pokefinder.org (Postfix) with ESMTPSA id 477492C1F50;
        Wed,  4 Mar 2020 15:09:27 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-doc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dennis Zhou <dennis@kernel.org>
Subject: [PATCH 2/2] include/bitmap.h: add new functions to documentation
Date:   Wed,  4 Mar 2020 15:09:20 +0100
Message-Id: <20200304140920.6109-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200304140920.6109-1-wsa+renesas@sang-engineering.com>
References: <20200304140920.6109-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

I found these functions only by chance although I was looking exactly
for something like them. So, add them to the list of functions to make
them more visible.

Fixes: e837dfde15a4 ("bitmap: genericize percpu bitmap region iterators")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Dennis Zhou <dennis@kernel.org>
---
 include/linux/bitmap.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
index 804600f7dc35..71ba0ffaa22a 100644
--- a/include/linux/bitmap.h
+++ b/include/linux/bitmap.h
@@ -51,6 +51,12 @@
  *  bitmap_clear(dst, pos, nbits)               Clear specified bit area
  *  bitmap_find_next_zero_area(buf, len, pos, n, mask)  Find bit free area
  *  bitmap_find_next_zero_area_off(buf, len, pos, n, mask, mask_off)  as above
+ *  bitmap_next_clear_region(map, &start, &end, nbits)  Find next cleared region
+ *  bitmap_next_set_region(map, &start, &end, nbits)  Find next set region
+ *  bitmap_for_each_clear_region(map, rs, re, start, end)
+ *  						Iterate over all cleared regions
+ *  bitmap_for_each_set_region(map, rs, re, start, end)
+ *  						Iterate over all set regions
  *  bitmap_shift_right(dst, src, n, nbits)      *dst = *src >> n
  *  bitmap_shift_left(dst, src, n, nbits)       *dst = *src << n
  *  bitmap_cut(dst, src, first, n, nbits)       Cut n bits from first, copy rest
-- 
2.20.1

