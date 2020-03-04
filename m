Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 540CE1791F3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2020 15:09:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729471AbgCDOJ3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Mar 2020 09:09:29 -0500
Received: from sauhun.de ([88.99.104.3]:33712 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726440AbgCDOJ3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Mar 2020 09:09:29 -0500
Received: from localhost (p54B331AD.dip0.t-ipconnect.de [84.179.49.173])
        by pokefinder.org (Postfix) with ESMTPSA id B564B2C1F4F;
        Wed,  4 Mar 2020 15:09:26 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-doc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/2] include/bitmap.h: add missing parameter in docs
Date:   Wed,  4 Mar 2020 15:09:19 +0100
Message-Id: <20200304140920.6109-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200304140920.6109-1-wsa+renesas@sang-engineering.com>
References: <20200304140920.6109-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

bitmap_find_next_zero_area_off() has an additional parameter which was
not specified in the list of functions. Add it.

Fixes: 5e19b013f55a ("lib: bitmap: add alignment offset for bitmap_find_next_zero_area()")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 include/linux/bitmap.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
index e52ceb1a73d3..804600f7dc35 100644
--- a/include/linux/bitmap.h
+++ b/include/linux/bitmap.h
@@ -50,7 +50,7 @@
  *  bitmap_set(dst, pos, nbits)                 Set specified bit area
  *  bitmap_clear(dst, pos, nbits)               Clear specified bit area
  *  bitmap_find_next_zero_area(buf, len, pos, n, mask)  Find bit free area
- *  bitmap_find_next_zero_area_off(buf, len, pos, n, mask)  as above
+ *  bitmap_find_next_zero_area_off(buf, len, pos, n, mask, mask_off)  as above
  *  bitmap_shift_right(dst, src, n, nbits)      *dst = *src >> n
  *  bitmap_shift_left(dst, src, n, nbits)       *dst = *src << n
  *  bitmap_cut(dst, src, first, n, nbits)       Cut n bits from first, copy rest
-- 
2.20.1

