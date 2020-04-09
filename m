Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C95661A2D08
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2020 02:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbgDIAq0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Apr 2020 20:46:26 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39600 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbgDIAq0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Apr 2020 20:46:26 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44AB02DC;
        Thu,  9 Apr 2020 02:46:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586393184;
        bh=XrImY9BvJeKbhh8QnJm/IVyeaDkiA3BMUm0hl4NRemY=;
        h=From:To:Cc:Subject:Date:From;
        b=uWTJR6WfIbrGc6PfSOY/8QElBelrCrO2EYtcfL/UQe6sA/Z9mAcZq+38t6Am94rtP
         xJj0A4Q/HhvjAC9ESjB5d+crmS5gEVkx7DRsaFeUOM9CagW96+DdomWfocD6N1mRsJ
         fFuqpl+1vTt5QdWHsCMsBJpGU0YByMJ2YivIWmAg=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH 0/4] drm: bridge: adv7511: Enable usage with DRM bridge connector helper
Date:   Thu,  9 Apr 2020 03:46:06 +0300
Message-Id: <20200409004610.12346-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This patch series enables usage of the adv7511 driver with the DRM
bridge connector helper (drm_bridge_connector.c).

Patch 1/4 and 2/4 start by splitting EDID read and connector creation to
separate functions to ease review of 3/4 and 4/4. Patch 3/4 performs the
bulk of the work by implementing the DRM bridge connector-related
operations, and patch 4/4 then makes connector creation optional.

I've had trouble wrapping my head around the HPD handling code in the
av7511 driver (this is why I've CC'ed Rob and Sean who last touched
this). The split of the code between the .detect() operation and the HPD
IRQ seems a bit weird to me, and I haven't dared touching it as it also
appears fragile.

In particular, I'm not sure why we need to retrieve modes in the
.detect() operation. git blame didn't help, as the code has been there
since the beginning. I'd like to remove that completely, but to avoid
breakages, patch 3/4 only does so when the adv7511 is used without
creating a DRM connector.

Usage of both adv7511->status and adv7511->connector.status in the two
operations also seems awkward, and I would like to drop usage of the
latter in the new code path, but I also haven't dared refactoring that
yet. Feedback would be welcome.

Laurent Pinchart (4):
  drm: bridge: adv7511: Split EDID read to a separate function
  drm: bridge: adv7511: Split connector creation to a separate function
  drm: bridge: adv7511: Implement bridge connector operations
  drm: bridge: adv7511: Make connector creation optional

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 137 +++++++++++++------
 1 file changed, 98 insertions(+), 39 deletions(-)

-- 
Regards,

Laurent Pinchart

