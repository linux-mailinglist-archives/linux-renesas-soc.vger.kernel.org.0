Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C9161FF7AF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2020 17:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728699AbgFRPml (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Jun 2020 11:42:41 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:54849 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731675AbgFRPkf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Jun 2020 11:40:35 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200618154032euoutp01fbe97428b56d9bc3986a8a96fc963436~ZrZzvh2Z-1845318453euoutp01I
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2020 15:40:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200618154032euoutp01fbe97428b56d9bc3986a8a96fc963436~ZrZzvh2Z-1845318453euoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1592494832;
        bh=65zQC7AbXs+h4Aa/SkiEZNz20G0ZAx6H0WtGo6ycvZM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ys6tPDMppm6MDIKiMmLpGE88KOX2pjycGDf8E/idJDvMUlqOKgJxqmaqQXmHqFgvh
         ga6HQk+MK3hg6PLgGk1i2rnihS+WoQhW6ht09TRCDOU9uqK1dgwSsEfVoZtbqNZ23h
         Oa6FFb7DPAZiD4s7Vv2OtH3oIiT38Yk3Y9+bsiUw=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200618154032eucas1p1d3bfbecb45e593df35fc1a5d9bc32f82~ZrZzS1hLI1547315473eucas1p1j;
        Thu, 18 Jun 2020 15:40:32 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 18.DE.60679.0FA8BEE5; Thu, 18
        Jun 2020 16:40:32 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200618154032eucas1p25df137bd9c481bcbc39320f0167b225a~ZrZzCLLL-0608706087eucas1p2d;
        Thu, 18 Jun 2020 15:40:32 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200618154032eusmtrp23b5676a37b4a2f268e9c0909934bb080~ZrZzBbtPO0399203992eusmtrp2j;
        Thu, 18 Jun 2020 15:40:32 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-47-5eeb8af0ddf9
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id A3.FE.08375.FEA8BEE5; Thu, 18
        Jun 2020 16:40:31 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200618154031eusmtip1413e3ed550e7c80c9654005fa7787835~ZrZyTCItf0744107441eusmtip14;
        Thu, 18 Jun 2020 15:40:31 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Christoph Hellwig <hch@lst.de>,
        Robin Murphy <robin.murphy@arm.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v6 26/36] drm: rcar-du: fix common struct sg_table related
 issues
Date:   Thu, 18 Jun 2020 17:39:47 +0200
Message-Id: <20200618153956.29558-27-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200618153956.29558-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSe0hTYRjG+87ZOTsTt86m5JtJ1iIjQcsucsCykqBDYQRGN0pberLITdvS
        sv5ICmubt0xJnWYWlTU1bU0rxTQrl5grTE2xi2YXzSzRaSRLcx6t/37P8z4v78PHR+GyBsKd
        Oqw6xqlViig56SSoqP9t9RnU94cuL7VImBRrA8bczS4lmImKdJxpGflJMreLnmFMQU0AM9SW
        hBhd+nUhY2vpxhhTTxvBvK7MI5nksnKCKe/7gTElT98JmZsmO8Y8HvxErKfZ4vxixFaPFgjY
        XG0OwZqMOpK9P9pFsB+SLBh77/pptnO8B2cz2gsRW9WRQLKpZiNih03ztznvcVoTwUUdjuPU
        ywL3Ox0yt74hYybghMFmRwlozFWPRBTQq+BzwjVMj5woGX0LQbb+Ms4LG4LmhhsCXgwjaOt/
        IZhZ6a07Pz0oRHB1oAr7t2Iur0WOFEn7gX5ATzrYlU5E8DzF2cE4bcchK2+dHlGUCx0C79MW
        OmwBvRgepemm4mI6EFLrK0n+mCcUldXiDhZN+o2WRIL3PwrhZdVBnjeCtrp5upwLfLOYhTx7
        wMTDK1PdgD6LoNtaIuRFMoLXZ7IRnwqAt9Yx0lEIp5dCaeUy3t4AWXYbcthAS6B9QMrXl8DF
        iiyct8WgPSfj015gsNz5d/bxq2acZxYyDTNvlY7AZjWQF5Cn4f+xAoSMyI2L1SgjOc0KFXfc
        V6NQamJVkb7h0UoTmvxgjeMW2wNUaT9Qh2gKyZ3Fvdv7Q2WEIk4Tr6xDQOFyV3FQU2OoTByh
        iD/JqaPD1LFRnKYOzaMEcjfxymt9+2R0pOIYd4TjYjj1zBSjRO4JyEfhm//ZHLFwyaeOWTvm
        Fktzvvj7zF0b7NXZmbMvSDrniSF4t9/OFboRaU14qqjdI6zvadmvU5nRH9pb/4jOh9T3ZmiN
        /kpW1zW7rGnBV/GuAtp/a+7t1cpnknX3RoYk3PLWo3u9vys7itYuqtB2s5eaCncVjW5ReboE
        FwdsEsdtBrlAc0jh542rNYq/qF7emlwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRmVeSWpSXmKPExsVy+t/xu7rvu17HGWy/bmPRe+4kk8XGGetZ
        Lf5vm8hsceXrezaLlauPMlks2G9t8elaN6NF58Ql7BZfrjxkstj0+BqrxeVdc9gsejZsZbXY
        +vIdk8XaI3fZLZZt+sNkcfDDE1YHAY8189Yweuz9toDFY3bHTFaPTas62Ty2f3vA6nG/+ziT
        x+Yl9R63/z1m9ph8Yzmjx+6bDWwefVtWMXp83iQXwBOlZ1OUX1qSqpCRX1xiqxRtaGGkZ2hp
        oWdkYqlnaGwea2VkqqRvZ5OSmpNZllqkb5egl7Hl6nW2gv8SFbO+/GFsYPwl0sXIySEhYCLx
        4lA7SxcjF4eQwFJGiZatm5ghEjISJ6c1sELYwhJ/rnWxQRR9YpTYcqaNHSTBJmAo0fUWIiEi
        0MkoMa37IzuIwyzQwiLx4dNDFpAqYYFAiVsfPoB1sAioSuzr72QDsXkF7CT6ju1ig1ghL7F6
        wwGw1ZxA8dPHW8FWCwnYSjz/0MY2gZFvASPDKkaR1NLi3PTcYkO94sTc4tK8dL3k/NxNjMCo
        2nbs5+YdjJc2Bh9iFOBgVOLhfRHyOk6INbGsuDL3EKMEB7OSCK/T2dNxQrwpiZVVqUX58UWl
        OanFhxhNgY6ayCwlmpwPjPi8knhDU0NzC0tDc2NzYzMLJXHeDoGDMUIC6YklqdmpqQWpRTB9
        TBycUg2Meld2fPpktf16wftIt//XX8l27faWL79nwGQu93xv1v2q5ZrC7ZNNV86d0Wfqfrq+
        6fHrf2mXpDg11r9/uDj9RxKn7l7b66l6Sit+G33cmVtVOJdxbxuP0w4fVlGxzyseLXb6xKHp
        fF3zv/ObtzM0nC/NF+PeVZg3ZXHG37qpV4vE/yop6630UGIpzkg01GIuKk4EAIapYQbAAgAA
X-CMS-MailID: 20200618154032eucas1p25df137bd9c481bcbc39320f0167b225a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200618154032eucas1p25df137bd9c481bcbc39320f0167b225a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200618154032eucas1p25df137bd9c481bcbc39320f0167b225a
References: <20200618153956.29558-1-m.szyprowski@samsung.com>
        <CGME20200618154032eucas1p25df137bd9c481bcbc39320f0167b225a@eucas1p2.samsung.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The Documentation/DMA-API-HOWTO.txt states that the dma_map_sg() function
returns the number of the created entries in the DMA address space.
However the subsequent calls to the dma_sync_sg_for_{device,cpu}() and
dma_unmap_sg must be called with the original number of the entries
passed to the dma_map_sg().

struct sg_table is a common structure used for describing a non-contiguous
memory buffer, used commonly in the DRM and graphics subsystems. It
consists of a scatterlist with memory pages and DMA addresses (sgl entry),
as well as the number of scatterlist entries: CPU pages (orig_nents entry)
and DMA mapped pages (nents entry).

It turned out that it was a common mistake to misuse nents and orig_nents
entries, calling DMA-mapping functions with a wrong number of entries or
ignoring the number of mapped entries returned by the dma_map_sg()
function.

To avoid such issues, lets use a common dma-mapping wrappers operating
directly on the struct sg_table objects and use scatterlist page
iterators where possible. This, almost always, hides references to the
nents and orig_nents entries, making the code robust, easier to follow
and copy/paste safe.

dma_map_sgtable() function returns zero or an error code, so adjust the
return value check for the vsp1_du_map_sg() function.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c  | 3 +--
 drivers/media/platform/vsp1/vsp1_drm.c | 8 ++++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index f1a81c9b184d..a27bff999649 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -197,9 +197,8 @@ int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
 			goto fail;
 
 		ret = vsp1_du_map_sg(vsp->vsp, sgt);
-		if (!ret) {
+		if (ret) {
 			sg_free_table(sgt);
-			ret = -ENOMEM;
 			goto fail;
 		}
 	}
diff --git a/drivers/media/platform/vsp1/vsp1_drm.c b/drivers/media/platform/vsp1/vsp1_drm.c
index a4a45d68a6ef..86d5e3f4b1ff 100644
--- a/drivers/media/platform/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/vsp1/vsp1_drm.c
@@ -912,8 +912,8 @@ int vsp1_du_map_sg(struct device *dev, struct sg_table *sgt)
 	 * skip cache sync. This will need to be revisited when support for
 	 * non-coherent buffers will be added to the DU driver.
 	 */
-	return dma_map_sg_attrs(vsp1->bus_master, sgt->sgl, sgt->nents,
-				DMA_TO_DEVICE, DMA_ATTR_SKIP_CPU_SYNC);
+	return dma_map_sgtable(vsp1->bus_master, sgt, DMA_TO_DEVICE,
+			       DMA_ATTR_SKIP_CPU_SYNC);
 }
 EXPORT_SYMBOL_GPL(vsp1_du_map_sg);
 
@@ -921,8 +921,8 @@ void vsp1_du_unmap_sg(struct device *dev, struct sg_table *sgt)
 {
 	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
 
-	dma_unmap_sg_attrs(vsp1->bus_master, sgt->sgl, sgt->nents,
-			   DMA_TO_DEVICE, DMA_ATTR_SKIP_CPU_SYNC);
+	dma_unmap_sgtable(vsp1->bus_master, sgt, DMA_TO_DEVICE,
+			  DMA_ATTR_SKIP_CPU_SYNC);
 }
 EXPORT_SYMBOL_GPL(vsp1_du_unmap_sg);
 
-- 
2.17.1

