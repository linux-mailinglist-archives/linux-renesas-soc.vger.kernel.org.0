Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03C404BE116
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Feb 2022 18:53:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354368AbiBUKjQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Feb 2022 05:39:16 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355304AbiBUKjC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Feb 2022 05:39:02 -0500
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6259B473A5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Feb 2022 02:00:55 -0800 (PST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id C1D8A580261;
        Mon, 21 Feb 2022 04:59:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 21 Feb 2022 04:59:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=lZx6QJtY1OfVXkk4liNafMSMojXN0L
        YL8ej+OsuKSTs=; b=o3T+u2xCPGKJpW3Ad+/ePTsbc3R4zBSrqz0qPGJQF72QPD
        FR3QcXRio/DseBsFY600wAuchj4uWvQVReCeDOKd43MBrs6b2veiO8MkOmXeNuAB
        LcnA8bbc8bz7GwF5bh17Oj0xgyZknhlxPOnY/aTJKcWR3isIa4ls7/7b/0XiwNRU
        GTZEOLcBOIjRKD0ZJ5+1cKE+8cW9wcaR1lWclQeq8aazVz03QgW8ldJyyb8aDznQ
        77ADP6+WuXW1je2fNO33D8kYWiSO4li0JQc7cMvmJgTMfHaRaHIQqIym3A6CZ9RY
        VdjdE0qjT6JwODHFuYkcdqp28+fbspa+EqvbPCaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=lZx6QJ
        tY1OfVXkk4liNafMSMojXN0LYL8ej+OsuKSTs=; b=cIqFvO6Cz18A312yduXARt
        mzPlgpbYcrb+1MpSItVgPr5oY9OlXkGc6ZWtlv5t7Zhwtt54ZngcxlX558iebSRh
        aOg64zg/krWGbpOyyuOxNw0tZsYAdid/bSdoee3ppuXvOiN0GsNampaGMNp570Eb
        ZDVcydekyjkywvyT40FRe09N2Un7zVar02dquZdte5qpY6OjX49lNO1myjn8IMfw
        acz73LvOrADNRqeRr+uhXYGOApy3yZHIPom85Pifk6oC3OwvH8WRXDLvE9yAiJ2A
        Ix9trPBgX9JH/UDOCQg/7C8VCavK9zeY4C1YrWmeWZ3p47+lu9JZActu4fWJzhOA
        ==
X-ME-Sender: <xms:m2ITYlviEYzWQvejmzsBBYT6kS61fd2E_RNO48O1hhqXsZUq7C2b6A>
    <xme:m2ITYuc-1ZKMNGnzHXCZiRGXDTXzYL4CPzPxYTHV-qC8O4ID_s-k4shqxd_FAMz0X
    gdhk29KQmGAgoDPu3s>
X-ME-Received: <xmr:m2ITYoyqo2Ffjba_eG8sgJ4RFYsvvS020D3jksA07zb7UBib6KZItkUkQZbAZ3ICRJH-WaM-ZPsTSnJLXW5Mp7Gh6dltc7aERLVlIDw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigddtlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:m2ITYsPR3INsVkYdqxV4R0cuXM4OJt4RVi4nrxG8I7RP8WQhMIayUg>
    <xmx:m2ITYl9Ggj8SL_xUFB77KcsuYBUMwuNezNPliTKWBLbEoBrvuHC0Og>
    <xmx:m2ITYsXsK9iaSZSimaNfKCB1IbaxJU0AlxxXUaCUOXm6tbKHc18DkA>
    <xmx:m2ITYsW62qJvRunI2p6YKYSZmlWpUL7KSIa6z4BWC4VN28h9DZsJuQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 04:59:55 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 15/22] drm/rcar: plane: Remove redundant zpos initialisation
Date:   Mon, 21 Feb 2022 10:59:11 +0100
Message-Id: <20220221095918.18763-16-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221095918.18763-1-maxime@cerno.tech>
References: <20220221095918.18763-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
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
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
2.35.1

