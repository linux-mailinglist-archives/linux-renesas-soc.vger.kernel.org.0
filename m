Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D8DF3EC6C3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Aug 2021 04:49:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232750AbhHOCuP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 14 Aug 2021 22:50:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230079AbhHOCuP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 14 Aug 2021 22:50:15 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD72EC0613CF
        for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Aug 2021 19:49:45 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id r7so18692857wrs.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Aug 2021 19:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+uWJKEuzVCQFca12BS6BPlTfrO9jNYAl/Ixczig0hiA=;
        b=bld7193XBVPHLgBbM+bbRrNbFzpcvOzTeE2m3NgTJko8+5+H0jlqpm5qOoFB4zD08h
         tSplXU3C/fnmyUj/keLIgiDHgFEQbpBo0Oxh5dVyganmznmh3tg57t8VgmP8ZYT7vxCv
         KjrFnxm9uAcd0fPt8XFhEPkQiTS19PnCYq6+axK/cxrRjLEsyO7MTDJXyhOJPvpJFfrL
         SDOCnNP6YZXTOJ2kRkLoCF1TmzK5efxTf8USWOMPfFQyLNxZ0YHbnpow5YW/uZkXDGg8
         GJpkSQaW6I/w5Otno+7iajXeEl9uPFkvYtjKfAcXm3j/MpvgRe6nDpOPsxbqKnFYg7WZ
         acTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+uWJKEuzVCQFca12BS6BPlTfrO9jNYAl/Ixczig0hiA=;
        b=EVCXSHzhhENe/N3La8QKbROfBWp4+PH60CpxedYUbiLNPp96CGxBcz3wzJRXIEEiHd
         vtR3Up4k+lUACRXnmpvFz+OE6IrMkKmdRp3DwitPtls3qnQLKIM4LswBJ7G15jaRZwPN
         5ZUZJiDIEV3HzTo531udyWmuOyDDdP5INKiZKwNuTaHkpM1tczfGLo5p8m5hYMVl2XGc
         UKPP5TE4bQPZibeGZzZ9YZ03O3BX1TdxwjbPx+Ad3GiG8tceHLe1us7R7Rq5zHgDOSzQ
         dY9RMO6CKuvnw+DW7WsjQocN/PpLW3BR1052tE4q5+Xyg0xYmGiuQ5GFxcfX6y4IPDHw
         Sm4A==
X-Gm-Message-State: AOAM5308iEziDs1H7jMWy8dzeWUDGYcmK9N18I5BTLXl35c73CSBOgRs
        UU8OX+F56ATUV38maosTRhSTkQ==
X-Google-Smtp-Source: ABdhPJx//7m+Zn+R4N5G7obBEucwKrCJ7l41gv2uEizQydXEex3ty54p+mMmjAjgJm/cWssalg+xgA==
X-Received: by 2002:a05:6000:1b02:: with SMTP id f2mr10876770wrz.274.1628995784318;
        Sat, 14 Aug 2021 19:49:44 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id h9sm5866342wmb.35.2021.08.14.19.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Aug 2021 19:49:44 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] media: rcar-csi2: Serialize access to set_fmt and get_fmt
Date:   Sun, 15 Aug 2021 04:49:15 +0200
Message-Id: <20210815024915.1183417-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210815024915.1183417-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210815024915.1183417-1-niklas.soderlund+renesas@ragnatech.se>
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
2.32.0

