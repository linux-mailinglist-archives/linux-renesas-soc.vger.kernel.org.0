Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9688940BD5C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Sep 2021 03:50:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234031AbhIOBwA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Sep 2021 21:52:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233895AbhIOBwA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Sep 2021 21:52:00 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E278DC061762
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Sep 2021 18:50:41 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id g19-20020a1c9d13000000b003075062d4daso900742wme.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Sep 2021 18:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zM8FsXiM9O4eBZdkXaqFVNn1tTornIe046XH9M/vUAo=;
        b=ITTklQFgG3s6JDx1la106SAbbJymHKIxsXGMVxvhhjWdDYHTqhnC+9/zigBbwHNwsC
         j7ksWU2Ygjjtcgu2SZokKjzBzjIXIuXUyZ5cul0byJs4VQ5JO/6x524dmwzYshLXeMq1
         1eYOL1kL9NJTUyoZuTKkj2vP60nk1WotYueH8uCxMtc42YNRf9c75QoVl3Z4NjKasqcQ
         AkLlpjRi6E4kXsIl8alY0Dx3Lc8S9hsBIAP/RYeoY+QxktgieHW0ulgpj5jDDqG9nura
         xr0QPnaeJH58Q0hRzvL0bZeRxZr4YFFeZMXCHwZ3bwYwWzTDCXw3vuLtJFx7xLD+PRkB
         0m9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zM8FsXiM9O4eBZdkXaqFVNn1tTornIe046XH9M/vUAo=;
        b=NfjZbjSlHEsdArNpfdORAO9s7P2vOubs4XRX9VDlFV+zMygjGIFs+DLA3ijLIJDGPD
         2Eszt4BIhBgFGujZMP4YGgmQWFZoOwcbnv1r9iN1KJ+joEY9CweNCNy39Cy9CW/0E5hB
         RYNiWprIS73OGqkNCu7Dkiv8BP7NAg8V91ici4eUBxyCeuXxx1Vv7LeYXp6/bJOBjpaw
         NUTr2O9g43P8eJvt4/K33zGtivqTDJOb6rkw65zNkftOy6lpAhbhUG1JjD/V+zl4KEH/
         tMsr6F3NuBVpc8uMEXvGT8dTxiCA7brs2+nmHS1cxhjpNuI07Ocag/wfMP9CHnLnnkD9
         bEFQ==
X-Gm-Message-State: AOAM5300wcDp1VdqALNZx6cZ7L7Kj8mL9+7lDYvBT9oHLMBMs93270Yw
        yXP05mrfUSP+QfTfUkUHLSwuwA==
X-Google-Smtp-Source: ABdhPJwbRo5NrwKJhg2n6ORF2bczxZ4tl+VhEo+No1jKxRFo79yONd7Liw3MJQ42pjX/XDzUkco6OQ==
X-Received: by 2002:a7b:c30b:: with SMTP id k11mr1747912wmj.49.1631670640385;
        Tue, 14 Sep 2021 18:50:40 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id k17sm3486863wmj.0.2021.09.14.18.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 18:50:40 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v2 2/2] media: rcar-csi2: Serialize access to set_fmt and get_fmt
Date:   Wed, 15 Sep 2021 03:50:13 +0200
Message-Id: <20210915015013.3169934-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210915015013.3169934-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210915015013.3169934-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The access to the internal storage of the format rcar_csi2.mf should be
serialized, extend the exciting lock mutex to also cover this.

While at it document the mutex.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index a02573dbd5da4f62..2fdfdc38de424c72 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -370,9 +370,8 @@ struct rcar_csi2 {
 	struct v4l2_subdev *remote;
 	unsigned int remote_pad;
 
+	struct mutex lock; /* Protects mf and stream_count. */
 	struct v4l2_mbus_framefmt mf;
-
-	struct mutex lock;
 	int stream_count;
 
 	unsigned short lanes;
@@ -725,6 +724,8 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
 	struct rcar_csi2 *priv = sd_to_csi2(sd);
 	struct v4l2_mbus_framefmt *framefmt;
 
+	mutex_lock(&priv->lock);
+
 	if (!rcsi2_code_to_fmt(format->format.code))
 		format->format.code = rcar_csi2_formats[0].code;
 
@@ -735,6 +736,8 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
 		*framefmt = format->format;
 	}
 
+	mutex_unlock(&priv->lock);
+
 	return 0;
 }
 
@@ -744,11 +747,15 @@ static int rcsi2_get_pad_format(struct v4l2_subdev *sd,
 {
 	struct rcar_csi2 *priv = sd_to_csi2(sd);
 
+	mutex_lock(&priv->lock);
+
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		format->format = priv->mf;
 	else
 		format->format = *v4l2_subdev_get_try_format(sd, sd_state, 0);
 
+	mutex_unlock(&priv->lock);
+
 	return 0;
 }
 
-- 
2.33.0

