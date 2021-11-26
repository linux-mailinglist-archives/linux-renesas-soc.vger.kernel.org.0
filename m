Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACF9E45EB28
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Nov 2021 11:17:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376663AbhKZKUg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Nov 2021 05:20:36 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:49752 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233709AbhKZKSg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Nov 2021 05:18:36 -0500
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A372340;
        Fri, 26 Nov 2021 11:15:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637921722;
        bh=l9nerkEGB+XEJioBDr9MP8o5G22dGl+ylIENzT7Nr14=;
        h=From:To:Cc:Subject:Date:From;
        b=MZydxZiw7pyCH7LTkgGhhjEJ6v5n1I0cTEnIh/GwtvQTno/fpM3tz/hT9NYejRCHt
         pxgkHeETSSeJpDvkAx0lm+G/vwR4XNqIe+oj1lHXAMCFDhdrVUZwivQngZGvVbYwYZ
         NeS+l3+HKcGvxRpsOA9wI6e0LVUZLKZ1D+yLLF3Q=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 0/4] drm: rcar-du: mipi-dsi: Cleanup and Fixes
Date:   Fri, 26 Nov 2021 10:15:14 +0000
Message-Id: <20211126101518.938783-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

These patches are against the as-yet-unmerged posting from Laurent of
"drm: rcar-du: Add R-Car DSI driver" from [0]

[0] https://lore.kernel.org/all/20210623135639.17125-1-laurent.pinchart+renesas@ideasonboard.com/

Notably, the comments blocking the integration of the series on the
handling of bridge probe ordering have hopefully been solved by 4/4
here. This has been validated and is working on the Falcon-V3U with an
SN65DSI86 on a merge of the latest drm/drm-next and
drm-misc/drm-misc-next.

Other updates to the SN65DSI86 were also used to support the bridge
connecting to non-eDP, and have previously been posted by Laurent [1].
I've made no specific changes to those, so I'll refrain from reposting
them.

[1] https://lore.kernel.org/all/20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com/

Kieran Bingham (4):
  drm: rcar-du: Fix Makefile indentation for DSI
  drm: rcar-du: Select DRM_MIPI_DSI with DRM_RCAR_MIPI_DSI
  drm: rcar-du: mipi-dsi: Ensure correct fout is reported
  drm: rcar-du: mipi-dsi: Support bridge probe ordering

 drivers/gpu/drm/rcar-du/Kconfig         |  1 +
 drivers/gpu/drm/rcar-du/Makefile        |  2 +-
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 52 ++++++++++++++-----------
 3 files changed, 31 insertions(+), 24 deletions(-)

-- 
2.30.2

