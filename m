Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1B2D4A6F21
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Feb 2022 11:48:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243165AbiBBKrT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Feb 2022 05:47:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240081AbiBBKrS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Feb 2022 05:47:18 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0ACEC06173B
        for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Feb 2022 02:47:17 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id p27so39812264lfa.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Feb 2022 02:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yv9CJkTA34A5RzRG7XItJLyzPP8c4yOqEtb0dgEMVtA=;
        b=hsRBWewEhi0L0fXWokAVChGocpjD1gZcIoNItYN1sx8yfacO5cc1QO7CKZ4GqmiZ6a
         vPl6SJMkQPrFXUJNcA0HInSJ6LKBwRXxhXxAtAVWubQI0RGaCZfjqDHtvbRHIxwbkocZ
         9IlEHxnDjHkABfVU8cFBrdMvMbfrRkq/PtiFHyVfC63aj1PCOfk5x5+lsJXLsRCjYRTp
         6MPa8KTyYH+QyL7N9j2nXwi++h1CHxaUL4AjKWVKm5uQ3n+Yu0UtiiuoKEoxpzwa2lJB
         uAVGjKKwi+TEOLeCET+XtyY7bHcVcSMUyn4Gq9urNk2S9ledKWmnyBTSCC6JlUcjRWjo
         Ue2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yv9CJkTA34A5RzRG7XItJLyzPP8c4yOqEtb0dgEMVtA=;
        b=Pxd3PIkuzJc88wYvAEdpR0GsAkkvuSdBhGm7LkUi4hPQ8w3oaAwPsQIhR2ZjEF7Vod
         zc/auT17Yua6ResAnLAF4YmAPbydQOXI+OPwpq7CQPQVVV9moba0fgnjSp8FnrKp9ELV
         1qY1KDfeXgBCLI/TjqeuImwdhPOFMpEDNuZh64BShgMcXJn7B+gTdxEizWyy+I3hCrf4
         6bzuxRlNtzZTrCzblYAJI8EUl2L5x8jKq+ciLvBSj1hjyMAKr2BA4nHvbD1p6zJEt/TH
         72pF4AofWyjNskT34xz8PCZ+mDewX5f2CLr4vjSwoKiFMXUWWgHoscPAk7AzaQyz+pOC
         OJ1A==
X-Gm-Message-State: AOAM533Vhb33ZXIGuYwr4HnpBuXP9rxCxOMssaPCWkSMH+J5grxFDOPx
        xRRTo1+tOUDVsZK9T9lplXcU2g==
X-Google-Smtp-Source: ABdhPJwmRvDR5kh3gu0N9Ob6zzWoEJRtqALJTSm03MXoav1csitHbCd7sukTsMwhJozmjUDTr7584Q==
X-Received: by 2002:a05:6512:2821:: with SMTP id cf33mr22093956lfb.37.1643798836263;
        Wed, 02 Feb 2022 02:47:16 -0800 (PST)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id v5sm2844143lfg.124.2022.02.02.02.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 02:47:15 -0800 (PST)
From:   Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH] media: rcar-vin: require master VIN only for CSI source
Date:   Wed,  2 Feb 2022 13:47:00 +0300
Message-Id: <20220202104700.3329055-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hardware limitations on VINs that can be used at the same time cover only
CSI data source. For parallel source, any single VIN can work.

This patch moves check for master VIN availability in
rvin_csi2_link_notify() below processing the parallel case.

This fixes media-ctl usage on KF board when both CSI and parallel cameras
are in use on the same system. In such a setup, VINs 0-3 are used for
CSI cameras and VIN5 is used for parallel camera.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 0186ae235113..038ee187f95a 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -826,11 +826,6 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
 	vin = container_of(vdev, struct rvin_dev, vdev);
 	master_id = rvin_group_id_to_master(vin->id);
 
-	if (WARN_ON(!group->vin[master_id])) {
-		ret = -ENODEV;
-		goto out;
-	}
-
 	/* Build a mask for already enabled links. */
 	for (i = master_id; i < master_id + 4; i++) {
 		if (!group->vin[i])
@@ -878,6 +873,11 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
 		goto out;
 	}
 
+	if (WARN_ON(!group->vin[master_id])) {
+		ret = -ENODEV;
+		goto out;
+	}
+
 	channel = rvin_group_csi_pad_to_channel(link->source->index);
 	mask_new = mask & rvin_csi2_get_mask(vin, csi_id, channel);
 	vin_dbg(vin, "Try link change mask: 0x%x new: 0x%x\n", mask, mask_new);
-- 
2.30.2

