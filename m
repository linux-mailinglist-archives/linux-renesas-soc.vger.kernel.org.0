Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4A9463BAE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Nov 2021 17:25:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238587AbhK3Q2n (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Nov 2021 11:28:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238472AbhK3Q2m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Nov 2021 11:28:42 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84966C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Nov 2021 08:25:22 -0800 (PST)
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E80DF2FD;
        Tue, 30 Nov 2021 17:25:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638289521;
        bh=0XHkeRFapeCOWan2bCvkB9iBYpLGmbZv1/tVwNZxkzo=;
        h=From:To:Cc:Subject:Date:From;
        b=UBRoRp/Zgwx4NfphfSo5hnUMVmoC0aLXRkelQdtmtL8aomm4OboLQTcgrbEFC4xSS
         XOEFGUT3dnjhWV0JTHsrCiCkclLTFNjNxHz6YJkhUiwynrm27gVL8VhPWCMoR+Sdrl
         ehgQsIm9SOP28NKAzm0kYViqmcdfsE2pscOavxXw=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v2 0/2]  drm: rcar-du: mipi-dsi: Cleanup and Fixes
Date:   Tue, 30 Nov 2021 16:25:11 +0000
Message-Id: <20211130162513.2898302-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Following on from the earlier version of this series, is an updated
patch to move the bridge registration from rcar_mipi_dsi_probe() to
rcar_mipi_dsi_host_attach() followed by an immediate update to that code
to refactor it to use the new devm_drm_of_get_bridge helper.

These two patches are kept distinct to support review, and are both
expected to be squashed directly into the still-to-be-posted update of
the DSI driver by Laurent [0].

[0] https://lore.kernel.org/all/20210623135639.17125-1-laurent.pinchart+renesas@ideasonboard.com/

The previous patches 1/4, 2/4 and 3/4 from the v1 of this series have
already been accepted by Laurent and squashed into his tree, so are not
reposted.

Kieran Bingham (2):
  drm: rcar-du: mipi-dsi: Support bridge probe ordering
  drm: rcar-du: mipi-dsi: Use devm_drm_of_get_bridge helper

 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 38 ++++++++++---------------
 1 file changed, 15 insertions(+), 23 deletions(-)

-- 
2.30.2

