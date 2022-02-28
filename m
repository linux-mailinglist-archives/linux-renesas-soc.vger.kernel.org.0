Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48A484C6A77
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Feb 2022 12:29:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229903AbiB1L36 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Feb 2022 06:29:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231290AbiB1L36 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Feb 2022 06:29:58 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41BF74889F
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Feb 2022 03:29:19 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 020CF486;
        Mon, 28 Feb 2022 12:29:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646047757;
        bh=OUGD9ggTa2f/Ra39FQdgedH7he+PcLGql8gvuMySD3c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YpOyzso6jaT3OhsfvnzEYnDqDoS0gCuD645x0qfV3If/0eG1e40h4ZUe9SdwYJTjO
         3haC2wF7NymB08Q2x+82hsqyRFw+CCYb9pkk0g8wKaSAsYf8N6pEQ+HM0Afzwiu/b1
         CeooIh9i3/FjZMxc8ZvYFU2729ejm7UjgeuqM+yg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 2/3] gen-image: Crop input image before format conversion to YUV
Date:   Mon, 28 Feb 2022 13:29:00 +0200
Message-Id: <20220228112901.21289-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220228112901.21289-1-laurent.pinchart@ideasonboard.com>
References: <20220228112901.21289-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When converting the input image to a subsampled YUV format, chroma
components are averaged horizontally to emulate the VSP internal
conversion to YUV444. If the image is subsequently cropped to emulate
the RPF cropping, the edge chroma values end up effectively taking into
account pixels outside of the crop rectangle. This doesn't match the
hardware mode of operation which crops the image when reading it through
DMA, before performing any other operation.

Fix this by cropping the image just after reading it, before format
conversion.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 src/gen-image.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/src/gen-image.c b/src/gen-image.c
index d9f92253af46..170d69490399 100644
--- a/src/gen-image.c
+++ b/src/gen-image.c
@@ -1531,6 +1531,23 @@ static int process(const struct options *options)
 		goto done;
 	}
 
+	/* Crop */
+	if (options->crop) {
+		struct image *cropped;
+
+		cropped = image_new(format_by_name("RGB24"),
+				    options->inputcrop.width,
+				    options->inputcrop.height);
+		if (!cropped) {
+			ret = -ENOMEM;
+			goto done;
+		}
+
+		image_crop(input, cropped, &options->inputcrop);
+		image_delete(input);
+		input = cropped;
+	}
+
 	/* Convert colorspace */
 	if (options->input_format->type == FORMAT_YUV) {
 		struct image *yuv;
@@ -1561,22 +1578,6 @@ static int process(const struct options *options)
 		input = rgb;
 	}
 
-	/* Crop */
-	if (options->crop) {
-		struct image *cropped;
-
-		cropped = image_new(input->format, options->inputcrop.width,
-				options->inputcrop.height);
-		if (!cropped) {
-			ret = -ENOMEM;
-			goto done;
-		}
-
-		image_crop(input, cropped, &options->inputcrop);
-		image_delete(input);
-		input = cropped;
-	}
-
 	/* Scale */
 	if (options->output_width && options->output_height) {
 		output_width = options->output_width;
-- 
Regards,

Laurent Pinchart

