Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3110D7487EE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jul 2023 17:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232757AbjGEP0d (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jul 2023 11:26:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232805AbjGEP0c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jul 2023 11:26:32 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDD50172B
        for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Jul 2023 08:26:27 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5979:7b6f:39a:b9cb])
        by laurent.telenet-ops.be with bizsmtp
        id HTSR2A00945Xpxs01TSRp7; Wed, 05 Jul 2023 17:26:25 +0200
Received: from rox.of.borg ([192.168.97.57] helo=rox)
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qH4Ob-000ck3-Ma;
        Wed, 05 Jul 2023 17:26:25 +0200
Received: from geert by rox with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qH4Of-00AwXT-8R;
        Wed, 05 Jul 2023 17:26:25 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     dri-devel@lists.freedesktop.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH libdrm 0/3] Add support for DRM_FORMAT_NV{24,42}
Date:   Wed,  5 Jul 2023 17:26:14 +0200
Message-Id: <cover.1688570702.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series adds support for semi-planar YUV formats with
non-subsampled chroma planes.

It has been tested with the shmob_drm driver on the R-Mobile A1-based
Atmark Techno Armadillo-800-EVA development board.

Thanks for your comments!

Geert Uytterhoeven (3):
  util: Add NV24 and NV42 frame buffer formats
  util: Add pattern support for DRM_FORMAT_NV{24,42}
  modetest: Add support for DRM_FORMAT_NV{24,42}

 tests/modetest/buffers.c | 20 ++++++++++++++++++++
 tests/util/format.c      |  2 ++
 tests/util/pattern.c     |  4 ++++
 3 files changed, 26 insertions(+)

-- 
2.34.1

