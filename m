Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD319605CC0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Oct 2022 12:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230454AbiJTKiJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 Oct 2022 06:38:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230376AbiJTKiG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Oct 2022 06:38:06 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D34241D2B42;
        Thu, 20 Oct 2022 03:38:00 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id B282722B42;
        Thu, 20 Oct 2022 10:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1666262278; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dfNCfewKdF4qrRIFBcdy7kMwlQEEw/he+rN8lqzuO0c=;
        b=sT2vIrk7gnJPmpN3+w8QkaaTa6QUjGrubtLOteaO8q4FcNJyLa4bQ5A3cJng6/bv4x1ZRW
        Lz3p/ro9/w3xl+AVVT9FPWpjAMPcA8qn3cc/ebFvAESW96dJmzCi9Vt9UP6A/tQvx+rg4o
        YGUKbfUA6e96QHnR/bkR596lb9w56ZA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1666262278;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dfNCfewKdF4qrRIFBcdy7kMwlQEEw/he+rN8lqzuO0c=;
        b=R9wURktsZ4GUuQFrOAQNChz7Mxyve21ulKCwP98mDiqGdgQ9gW2RRTX44wOhGGfIABxhoh
        cnNyRpZaMJHX9BCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3F55713B72;
        Thu, 20 Oct 2022 10:37:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id qG2kDgYlUWPPYwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 20 Oct 2022 10:37:58 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, airlied@gmail.com, sam@ravnborg.org,
        javierm@redhat.com, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com
Cc:     dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        etnaviv@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        spice-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        xen-devel@lists.xenproject.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 03/21] drm/ingenic: Don't set struct drm_driver.lastclose
Date:   Thu, 20 Oct 2022 12:37:37 +0200
Message-Id: <20221020103755.24058-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221020103755.24058-1-tzimmermann@suse.de>
References: <20221020103755.24058-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Don't set struct drm_mode_config.output_poll_changed. It's used to
inform the fbdev console about conncetor changes. But as ingenic
uses generic fbdev emulation, the console is being informed by the
DRM client helpers already. See the calls to drm_client_dev_hotplug()
in drm_probe_helper.c.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index ab0515d2c420a..99f86f1ba8bee 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1018,7 +1018,6 @@ static const struct drm_bridge_funcs ingenic_drm_bridge_funcs = {
 
 static const struct drm_mode_config_funcs ingenic_drm_mode_config_funcs = {
 	.fb_create		= ingenic_drm_gem_fb_create,
-	.output_poll_changed	= drm_fb_helper_output_poll_changed,
 	.atomic_check		= drm_atomic_helper_check,
 	.atomic_commit		= drm_atomic_helper_commit,
 };
-- 
2.38.0

