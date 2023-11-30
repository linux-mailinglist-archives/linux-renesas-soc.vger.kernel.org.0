Return-Path: <linux-renesas-soc+bounces-469-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DDC7FF850
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Nov 2023 18:32:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 845D3B20B5E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Nov 2023 17:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3DFC56777;
	Thu, 30 Nov 2023 17:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 945DA1700;
	Thu, 30 Nov 2023 09:32:41 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,239,1695654000"; 
   d="scan'208";a="188746418"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 01 Dec 2023 02:32:40 +0900
Received: from localhost.localdomain (unknown [10.226.92.210])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id C734A401786F;
	Fri,  1 Dec 2023 02:32:37 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] media: v4l: async: Fix double pointer free on v4l2_async_unregister_subdev()
Date: Thu, 30 Nov 2023 17:32:32 +0000
Message-Id: <20231130173232.130731-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The v4l2_async_unbind_subdev_one() deallocates the pointer
&asc->asc_subdev_entry. The same pointer is again used to
deallocate in list_del() leading to the below kernel crash.

Unable to handle kernel paging request at virtual address dead000000000108
v4l2_async_unregister_subdev+0xf8/0x164
rzg2l_csi2_remove+0x30/0x5c
platform_remove+0x28/0x64
device_remove+0x48/0x74
device_release_driver_internal+0x1d8/0x234
device_driver_detach+0x14/0x1c
unbind_store+0xac/0xb0

Fixes: 28a1295795d8 ("media: v4l: async: Allow multiple connections between entities")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 091e8cf4114b..8cfd593d293d 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -880,7 +880,6 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
 				  &asc->notifier->waiting_list);
 
 			v4l2_async_unbind_subdev_one(asc->notifier, asc);
-			list_del(&asc->asc_subdev_entry);
 		}
 	}
 
-- 
2.25.1


