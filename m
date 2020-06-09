Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 229831F3AFA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2020 14:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729683AbgFIMqs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Jun 2020 08:46:48 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54322 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729657AbgFIMqp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jun 2020 08:46:45 -0400
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7FFA11961;
        Tue,  9 Jun 2020 14:46:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591706802;
        bh=o3rQt9ZqeHfXswLnqtP5Cp6Q+jIrrdpM8L1/nY/stUQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PNMXbYDyKeMN+LcSJGlAjGDFbtOCQYKvr3/CcnjmGFoyTiOvK94nPDPNC4ynr/8/e
         BuyEhLgCUNs8QmwroXhaYTdZ+E5YSZ0Lmek0T1nMyS+Z2Cb5INhhtw+k5TdczY8fzI
         9GEMjckAf2Huwl2QoaFxJdkH/q91w6DiDVQJ4lts=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jiri Kosina <trivial@kernel.org>,
        virtualization@lists.linux-foundation.org (open list:VIRTIO CORE AND
        NET DRIVERS), linux-mm@kvack.org (open list:MEMORY MANAGEMENT),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 15/17] mm: Fix trivial spelling
Date:   Tue,  9 Jun 2020 13:46:08 +0100
Message-Id: <20200609124610.3445662-16-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The word 'descriptor' is misspelled throughout the tree.

Fix it up accordingly:
    decriptors -> descriptors

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 mm/balloon_compaction.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index 26de020aae7b..907fefde2572 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -58,7 +58,7 @@ EXPORT_SYMBOL_GPL(balloon_page_list_enqueue);
 /**
  * balloon_page_list_dequeue() - removes pages from balloon's page list and
  *				 returns a list of the pages.
- * @b_dev_info: balloon device decriptor where we will grab a page from.
+ * @b_dev_info: balloon device descriptor where we will grab a page from.
  * @pages: pointer to the list of pages that would be returned to the caller.
  * @n_req_pages: number of requested pages.
  *
@@ -157,7 +157,7 @@ EXPORT_SYMBOL_GPL(balloon_page_enqueue);
 /*
  * balloon_page_dequeue - removes a page from balloon's page list and returns
  *			  its address to allow the driver to release the page.
- * @b_dev_info: balloon device decriptor where we will grab a page from.
+ * @b_dev_info: balloon device descriptor where we will grab a page from.
  *
  * Driver must call this function to properly dequeue a previously enqueued page
  * before definitively releasing it back to the guest system.
-- 
2.25.1

