Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09C0B69FFB1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Feb 2023 00:42:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbjBVXmQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Feb 2023 18:42:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbjBVXmQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Feb 2023 18:42:16 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB09376B8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Feb 2023 15:42:15 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C25BA25;
        Thu, 23 Feb 2023 00:42:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677109334;
        bh=gCMAwIH0zLLLlggmNKPdgNSuCPZbcYroWdm2MwM5M+0=;
        h=From:To:Cc:Subject:Date:From;
        b=PXgz8eq8xi05svtYBl3hfiDYPpPFC+DzPzHcoHe6iOh26PSU3deltF20GOjFpC0QC
         4mhiR2FaLZlNgNRjH67BjB6w47NvgG7XwS4ITBaG8wcuBcN85//XnAVLWi52iO3xkk
         XA1wZ6BbJX8NnmCN4ingvWevH0F6TyKrqLzj89eM=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 0/2] drm: rcar-du: Fix more invalid register writes
Date:   Thu, 23 Feb 2023 01:42:10 +0200
Message-Id: <20230222234212.5461-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

Following the "[PATCH 0/2] drm: rcar-du: Avoid writing reserved register
fields" series ([1]), this series addresses more invalid register
writes in the R-Car DU driver. Patch 1/2 first renames some register
field macros to increase readability, and patch 2/2 fixes the invalid
writes.

The rationale is the same as for the previous series: the current
implementation is likely fine, but doesn't pass the functional safety
requirements as it doesn't match the documentation.

The series supersedes the patch "[PATCH] drm: rcar-du: Write correct
values in DORCR reserved fields" ([2]) that I have just sent, which was
messing the 1/2 dependency. Patch 2/2 is otherwise identical to [2].

[1] https://lore.kernel.org/dri-devel/20230222050623.29080-1-laurent.pinchart+renesas@ideasonboard.com/T/#t
[2] https://lore.kernel.org/dri-devel/20230222233113.4737-1-laurent.pinchart+renesas@ideasonboard.com/T/#u

Laurent Pinchart (2):
  drm: rcar-du: Rename DORCR fields to make them 0-based
  drm: rcar-du: Write correct values in DORCR reserved fields

 drivers/gpu/drm/rcar-du/rcar_du_group.c | 16 +++++++++++----
 drivers/gpu/drm/rcar-du/rcar_du_regs.h  | 26 ++++++++++++-------------
 2 files changed, 25 insertions(+), 17 deletions(-)

-- 
Regards,

Laurent Pinchart

