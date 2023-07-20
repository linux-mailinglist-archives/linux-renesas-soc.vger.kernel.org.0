Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E830975B6D3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jul 2023 20:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230444AbjGTSbj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 Jul 2023 14:31:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232086AbjGTSbi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Jul 2023 14:31:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 221F6E44;
        Thu, 20 Jul 2023 11:31:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7242F61B7D;
        Thu, 20 Jul 2023 18:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64F95C433C8;
        Thu, 20 Jul 2023 18:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689877891;
        bh=Yy0Vrrja3V6+idxx5vJnEHPlP9VLbaf+aWnAhD5uHD4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h2dJrFwUajipk90MTnvnklGJshVV/AZLViRDX7hmV16x9s4AVmfb9252czPhXlX3H
         iKHlyWQktxsiDT0NbE5Svhgfyj4mTfwWjwh5H5ItPzsft+L9VtABA/Nu8f/xnGZFSp
         bfG/PkiZULaRggmzulJKuSFyTjllEyuPSbzMRnOIzR3fNIyo1LjoLLOPWJ67HE9YW0
         1O79AXOaAx89jPM/DwMHe2UA1/7m3zEynO6JMJtbYxjoI9KjSG2zcDkp7Osh/Qx5xG
         d4AveHujzpW4ubY793gLaUM2YaOLZxM+1Iy+7WKUKzBPKl9EsfI5+FqWWx58ALJfaa
         /Rb3nTyBEoe3w==
Received: (nullmailer pid 3064494 invoked by uid 1000);
        Thu, 20 Jul 2023 18:31:30 -0000
Date:   Thu, 20 Jul 2023 12:31:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 06/13] of: unittest: Merge
 of_unittest_apply{,_revert}_overlay_check()
Message-ID: <20230720183130.GA2939849-robh@kernel.org>
References: <cover.1689776064.git.geert+renesas@glider.be>
 <b733ee0b398ace191a787cce965829f2777fc49e.1689776064.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b733ee0b398ace191a787cce965829f2777fc49e.1689776064.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 19, 2023 at 05:00:06PM +0200, Geert Uytterhoeven wrote:
> of_unittest_apply_overlay_check() and the first part of
> of_unittest_apply_revert_overlay_check() are identical.
> Reduce code duplication by replacing them by two wrappers around a
> common helper.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/of/unittest.c | 61 ++++++++++++++++---------------------------
>  1 file changed, 22 insertions(+), 39 deletions(-)

I would do something like this instead:

8<-------------------------------------------------------------------
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index a406a12eb208..a9635935aa26 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -2102,7 +2102,7 @@ static int __init of_unittest_apply_overlay(int overlay_nr, int *ovcs_id)
 }
 
 /* apply an overlay while checking before and after states */
-static int __init of_unittest_apply_overlay_check(int overlay_nr,
+static int __init _of_unittest_apply_overlay_check(int overlay_nr,
 		int unittest_nr, int before, int after,
 		enum overlay_type ovtype)
 {
@@ -2133,6 +2133,16 @@ static int __init of_unittest_apply_overlay_check(int overlay_nr,
 		return -EINVAL;
 	}
 
+	return ovcs_id;
+}
+
+static int __init of_unittest_apply_overlay_check(int overlay_nr,
+		int unittest_nr, int before, int after,
+		enum overlay_type ovtype)
+{
+	int ovcs_id = _of_unittest_apply_overlay_check(overlay_nr, unittest_nr, before, after, ovtype);
+	if (ovcs_id < 0)
+		return ovcs_id;
 	return 0;
 }
 
@@ -2143,31 +2153,9 @@ static int __init of_unittest_apply_revert_overlay_check(int overlay_nr,
 {
 	int ret, ovcs_id, save_ovcs_id;
 
-	/* unittest device must be in before state */
-	if (of_unittest_device_exists(unittest_nr, ovtype) != before) {
-		unittest(0, "%s with device @\"%s\" %s\n",
-				overlay_name_from_nr(overlay_nr),
-				unittest_path(unittest_nr, ovtype),
-				!before ? "enabled" : "disabled");
-		return -EINVAL;
-	}
-
-	/* apply the overlay */
-	ovcs_id = 0;
-	ret = of_unittest_apply_overlay(overlay_nr, &ovcs_id);
-	if (ret != 0) {
-		/* of_unittest_apply_overlay already called unittest() */
-		return ret;
-	}
-
-	/* unittest device must be in after state */
-	if (of_unittest_device_exists(unittest_nr, ovtype) != after) {
-		unittest(0, "%s failed to create @\"%s\" %s\n",
-				overlay_name_from_nr(overlay_nr),
-				unittest_path(unittest_nr, ovtype),
-				!after ? "enabled" : "disabled");
-		return -EINVAL;
-	}
+	ovcs_id = _of_unittest_apply_overlay_check(overlay_nr, unittest_nr, before, after, ovtype);
+	if (ovcs_id < 0)
+		return ovcs_id;
 
 	save_ovcs_id = ovcs_id;
 	ret = of_overlay_remove(&ovcs_id);
