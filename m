Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD05226E2E3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Sep 2020 19:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbgIQRu2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Sep 2020 13:50:28 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:25866 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726471AbgIQRnC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Sep 2020 13:43:02 -0400
X-IronPort-AV: E=Sophos;i="5.77,271,1596466800"; 
   d="scan'208";a="57335089"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 18 Sep 2020 02:42:30 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7F24340BC9E0;
        Fri, 18 Sep 2020 02:42:28 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: [PATCH v6 0/3] media: i2c: ov772x: Enable BT.656 mode and test pattern support
Date:   Thu, 17 Sep 2020 18:42:21 +0100
Message-Id: <20200917174224.11430-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

This patch series adds support for BT.656 mode in the ov772x sensor
and also enables color bar test pattern control.

Cheers,
Prabhakar

v5->v6
* Introduced new function ov772x_parse_dt()
* Moved the backward compatibility comment from 1/3 to 2/3

v4->v5:
* Put the ep instance back using fwnode_handle_put()
* Renamed BT656 to BT.656
* Correctly handled backward compatibility case falling
  back to parallel mode.

v3->v4:
* New patch 1/3 to fallback in parallel mode.
* Switched to v4l2_fwnode_endpoint_alloc_parse() for parsing the ep.
* Dropped support for pdat for test pattern control.
* DT documentation patches [1].

v2->v3:
* Dropped DT binding documentation patch as this is handled by Jacopo.
* Fixed review comments pointed by Jacopo.

v2:
 https://patchwork.kernel.org/project/linux-renesas-soc/
 list/?series=328133

 v1:
https://patchwork.kernel.org/project/linux-renesas-soc/
list/?series=323807

[1] https://patchwork.kernel.org/project/
    linux-renesas-soc/list/?series=346809

Lad Prabhakar (3):
  media: i2c: ov772x: Parse endpoint properties
  media: i2c: ov772x: Add support for BT.656 mode
  media: i2c: ov772x: Add test pattern control

 drivers/media/i2c/ov772x.c | 70 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

-- 
2.17.1

