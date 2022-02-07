Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3354AC690
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Feb 2022 17:59:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234523AbiBGQ6F (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Feb 2022 11:58:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1391397AbiBGQq1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Feb 2022 11:46:27 -0500
X-Greylist: delayed 602 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 07 Feb 2022 08:46:12 PST
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com [64.147.123.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0108C03FEC3
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Feb 2022 08:46:12 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.west.internal (Postfix) with ESMTP id A75632B0014F;
        Mon,  7 Feb 2022 11:36:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 07 Feb 2022 11:36:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=3ECsOgE6DiFXZvAslMe1/R9Cbtn2FP
        rfKSgkACIPH+M=; b=aWPv/V+MBXUmywDI6fVrx2Z6lGwT0ik6Kj/4rm/zuEKmWM
        8gqtyv+HwtCgr7XBzxUOHJh8INlp4xA/m2hDgeNrk+lLEg75VsDxZSkuTLmrCIG5
        SOPGCaMIVfR96zmpbiWNUo4A7mpEixydBwFn1x23KE1BRkZX/TjkKCXxqqUOdWb6
        SxNRL5n6PXP9k9ocQhavxq1W0TtoN/xLt+vnZCUCbqHtYcHN4AaqxOIfYuSjaD2s
        XacfZiLCRjSCgtY9xXHceBEkV6zHzm2RwveSb4wuCYNURpnLzzcKS6ehrjypTcb5
        deEXcC81WwF3aq55ui4WuXDpyzXjqX5l4qGyGmFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=3ECsOg
        E6DiFXZvAslMe1/R9Cbtn2FPrfKSgkACIPH+M=; b=GArr8k/Jy8ef71AAKZ48EA
        BCdgEpXhDCpruogFWDhwHaocGMNPlViPzFbXWcSAq72hPfkjkch9JajrItsB2QME
        nZX/gqOdc/79WdVvxjolbrmLmtDjsc87ZoCieD1XPUPJWoxAw2iHMRXiF6FGWvaj
        stiISLf79oiCdSUmJIPfawE38DOaTQiUByc4828a1nfALtKYYquNo+zcABX7tyoY
        ntuRoAKP2Nj0Bx8vFmSdPETiQm3qrKCwqjWcAYiiron8k4RMfUaVbP9ayY3yiQb6
        4FzQH56PyMvCR8ofY9Sbo8bhWialA7bV683C8GUpVCmDW7rRTPzIHVAk08ET6KtQ
        ==
X-ME-Sender: <xms:eEoBYr0nr5iONbJECYx_lRdndmoregh4za46cY8cwglnQqzCkFI4Kw>
    <xme:eEoBYqHVeTChSYdv2P8gINnwaEd6UBBfb3WI4SvmGRIpAFh1mlb5BtSaLHdAP5O2r
    cg2-A_Xhva84Jy5BuY>
X-ME-Received: <xmr:eEoBYr7zmp-vaOfUXF2YqYe8Q5yeKhXEWX6Sk3MrW6fSrnjqQPEuy5msPJqR145t6ji82VvU2ZqHHiGbHYUQfE_kq5CG7LkhSlUu4QA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdekkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:eEoBYg3oAehT3kFOw-ggEwioQNcT8K5UQ6v9j4oX9BPUkunMpseB0A>
    <xmx:eEoBYuE_i-0NE8Fz8MdSeo9dWznQ3NBUorkS_5h8HLJqZVLnSZ4ouw>
    <xmx:eEoBYh_1AMIv3a8MxKlNiel4aCjWkWOP7rGPwfaaxAXNoUPCnzNC4Q>
    <xmx:eEoBYp-NyjTPupmenEjHYw8oK40K106qVUjAgPaOk1yVjvZGnZsVay42rnA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 11:36:07 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Cc:     dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 16/23] drm/rcar: plane: Remove redundant zpos initialisation
Date:   Mon,  7 Feb 2022 17:35:08 +0100
Message-Id: <20220207163515.1038648-17-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207163515.1038648-1-maxime@cerno.tech>
References: <20220207163515.1038648-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The rcar-du KMS driver will call drm_plane_create_zpos_property() with an
init value depending on the plane type.

Since the initial value wasn't carried over in the state, the driver had
to set it again in rcar_du_plane_reset() and rcar_du_vsp_plane_reset().
However, the helpers have been adjusted to set it properly at reset, so
this is not needed anymore.

Cc: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/rcar-du/rcar_du_plane.c | 1 -
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index 862197be1e01..9dda5e06457d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -696,7 +696,6 @@ static void rcar_du_plane_reset(struct drm_plane *plane)
 	state->hwindex = -1;
 	state->source = RCAR_DU_PLANE_MEMORY;
 	state->colorkey = RCAR_DU_COLORKEY_NONE;
-	state->state.zpos = plane->type == DRM_PLANE_TYPE_PRIMARY ? 0 : 1;
 }
 
 static int rcar_du_plane_atomic_set_property(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index b7fc5b069cbc..719c60034952 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -362,7 +362,6 @@ static void rcar_du_vsp_plane_reset(struct drm_plane *plane)
 		return;
 
 	__drm_atomic_helper_plane_reset(plane, &state->state);
-	state->state.zpos = plane->type == DRM_PLANE_TYPE_PRIMARY ? 0 : 1;
 }
 
 static const struct drm_plane_funcs rcar_du_vsp_plane_funcs = {
-- 
2.34.1

