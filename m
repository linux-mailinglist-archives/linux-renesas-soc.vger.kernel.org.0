Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BDAE6A3F24
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Feb 2023 11:07:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbjB0KHK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Feb 2023 05:07:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229916AbjB0KHH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Feb 2023 05:07:07 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52A091EBC5;
        Mon, 27 Feb 2023 02:07:05 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id q16so5585729wrw.2;
        Mon, 27 Feb 2023 02:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qAMEtyjFDybUtWkpyE6ui7qLzDRJJ6qwM16U5VTuzlg=;
        b=e4tBYEn47Bz7XTq/47q1gAg4ykFpvq98gzdqcMJUJkKWlNHPZ9h/rzex1SoseIKQRF
         VYJFEwDvVBRz7cTK2Cfzu6dqM9fBtoLXH/S4fiNCCn+i+6X7WzO8FLO+ez0/buSL8DL2
         HhpyW9+QVXe3hTM5DqCgk09LjZaWh0USZKDutYXCqmNXVlWkW/aXTiDCjFGUoXsjVdfF
         oqZoSuspvzd4EKLS52srDlSPTtRkAm8qWb6MbadaEdOegQm1JKcaw0EHQNwGZTVAunYX
         lpZIdjozf+vlbWvvcUihfQ1u1KcELVlc72ntGEzUvzhjm84blJgS06n3uvi2F0M5Y1FQ
         mByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qAMEtyjFDybUtWkpyE6ui7qLzDRJJ6qwM16U5VTuzlg=;
        b=6OmlpuUBVLbm4IDDqX7/p8MqK5ZKq2XZ5NvCuYLaPCmW+5iYkX/P6j1VRohi70WlFv
         AUjRvtISZGISR+VylX9guCOJVXbWelN0gbb7EDenO3dXzuc8N96aoDUaz0WIqw+QCWJU
         RmM4Lv6Bki4EO5fsOPO0Q3qRGHdoXos6aPbnACAV/klsgZ9Nn566mxq9xzFCZp7t594c
         fHHaWm6AgYKuZmAIX3V+JCDb2DbZ6VKop+3SRu2Iq2GkNoGfYo1hzmxBr7JhuCNQaAAk
         waoI140UGbBrIG0FA0PEe9Ue1+jpJVJJlI9CeVejaJBQfFXW2lMfGq1ntceNnO5NUdC1
         Jp7Q==
X-Gm-Message-State: AO0yUKWHcxvPwgfaETgY/nrEERBLY45kx1JPiEMrils+lbfjNTRBVp1M
        6bojCU2VPcFGNdZY+fkS2NA=
X-Google-Smtp-Source: AK7set+/ftDBmse6dEgq46GZHTuU3FWLKVD5J/HGxegFqt+baaFGyw9PDDL9gTRiJnuitgx1/F6bOg==
X-Received: by 2002:a05:6000:15c4:b0:2c5:3fce:423b with SMTP id y4-20020a05600015c400b002c53fce423bmr7345353wry.4.1677492423829;
        Mon, 27 Feb 2023 02:07:03 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p10-20020a5d458a000000b002c559def236sm6630643wrq.57.2023.02.27.02.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 02:07:02 -0800 (PST)
Date:   Mon, 27 Feb 2023 13:06:59 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] drm: rcar-du: Fix a NULL vs IS_ERR() bug
Message-ID: <Y/yAw6sHu82OnOWj@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The drmm_encoder_alloc() function returns error pointers.  It never
returns NULL.  Fix the check accordingly.

Fixes: 7a1adbd23990 ("drm: rcar-du: Use drmm_encoder_alloc() to manage encoder")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index b1787be31e92..7ecec7b04a8d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -109,8 +109,8 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 	renc = drmm_encoder_alloc(&rcdu->ddev, struct rcar_du_encoder, base,
 				  &rcar_du_encoder_funcs, DRM_MODE_ENCODER_NONE,
 				  NULL);
-	if (!renc)
-		return -ENOMEM;
+	if (IS_ERR(renc))
+		return PTR_ERR(renc);
 
 	renc->output = output;
 
-- 
2.39.1

