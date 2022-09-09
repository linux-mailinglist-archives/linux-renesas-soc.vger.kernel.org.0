Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 649C85B35EF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Sep 2022 13:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229710AbiIILAL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Sep 2022 07:00:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230005AbiIIK7z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Sep 2022 06:59:55 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2B9343E62
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Sep 2022 03:59:51 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 21D211F8ED;
        Fri,  9 Sep 2022 10:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1662721190; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=zcklK0igaHTbQ2iuS8heNX/ARpP8l73OuHcy3e9aS0M=;
        b=AbQyVi66YZ32baMchZF1jI8F2A1vwhkiYSO/j0ZsomB21XfbOfC/rCN0mLR6tnThI1o3ne
        VzQ/YNJ2otvB2ufBb8C5Gqi3SJQeTtjpc6xfWi4/FsMpknN6BxySTfarPj6UyaEKc4jqh0
        2UcaM4R9Ykn8RquQmha0ZGrQZwndT9Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1662721190;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=zcklK0igaHTbQ2iuS8heNX/ARpP8l73OuHcy3e9aS0M=;
        b=w+/zJt1utMZltSI6p2nZyeT5KpLyK9fVfh929S/Z9jAkhADVe/IK0AhW0Ukwlx7/SIGafs
        M8CTHLzYz+tSaMBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CDA0B139D5;
        Fri,  9 Sep 2022 10:59:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id fA1SMaUcG2M0BwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Fri, 09 Sep 2022 10:59:49 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, bskeggs@redhat.com,
        kherbst@redhat.com, lyude@redhat.com,
        laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jyri.sarha@iki.fi,
        tomba@kernel.org, sam@ravnborg.org
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/4] drm/plane: Remove drm_plane_init(), plus other cleanups
Date:   Fri,  9 Sep 2022 12:59:43 +0200
Message-Id: <20220909105947.6487-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patchset does cleanups to the plane code, most noteably it removes
drm_plane_init(). The function is a small wrapper, which can easily be
inlined into the few callers. Patch #1 fixes this.

The other clean-up patches #2 to #4 affect plane creation. Modesetting
helpers and nouveau share some plane-allocation code that can be shared as
helper function. While the function is already outdated, it's now at least
well documented. As suggested by Daniel, patch #3 adds a warning to
non-atomic plane helpers when they are being called from atomic drivers.
Patch #4 adds an initializer macro for non-atomic plane functions. It
should not be used in new drivers, but at least documents the current
practice.

Tested with nouveau on Nvidia G72 hardware.

A possible next step would be the inlining of drm_crtc_init() and the
removal of drm_plane.format_default.

Thomas Zimmermann (4):
  drm/plane: Remove drm_plane_init()
  drm/plane: Allocate planes with drm_universal_plane_alloc()
  drm/plane-helper: Warn if atomic drivers call non-atomic helpers
  drm/plane-helper: Provide DRM_PLANE_NON_ATOMIC_FUNCS initializer macro

 drivers/gpu/drm/drm_modeset_helper.c       | 68 +++++++++------------
 drivers/gpu/drm/drm_plane.c                | 70 ++++++++++++----------
 drivers/gpu/drm/drm_plane_helper.c         | 10 ++++
 drivers/gpu/drm/nouveau/dispnv04/crtc.c    | 45 +++++---------
 drivers/gpu/drm/nouveau/dispnv04/overlay.c | 13 ++--
 drivers/gpu/drm/shmobile/shmob_drm_plane.c |  7 ++-
 drivers/gpu/drm/tilcdc/tilcdc_plane.c      |  9 ++-
 include/drm/drm_plane.h                    | 52 +++++++++++++---
 include/drm/drm_plane_helper.h             | 12 ++++
 9 files changed, 162 insertions(+), 124 deletions(-)


base-commit: f2c3a05d33693ad51996fa7d12d3b2d4b0f372eb
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: 3f204510fcbf9530d6540bd8e6128cce598988b6
-- 
2.37.2

