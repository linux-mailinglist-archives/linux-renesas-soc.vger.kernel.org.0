Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1192AD1BB9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Oct 2019 00:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731542AbfJIW1n (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 18:27:43 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:13651 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730809AbfJIW1n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 18:27:43 -0400
X-Halon-ID: d7d78308-eae3-11e9-837a-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [84.172.88.101])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id d7d78308-eae3-11e9-837a-0050569116f7;
        Thu, 10 Oct 2019 00:26:35 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/2] rcar-vin: Support V4L2_FIELD_SEQ_{TB,BT}
Date:   Thu, 10 Oct 2019 00:27:32 +0200
Message-Id: <20191009222734.1911060-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

This series add support for sequential filed formats to rcar-vin. The
series is based on the media-tree and tested on both R-Car Gen2 and Gen3 
boards without regressions.

Patch 1/2 prepares for the new filed formats by reworking and renaming
an existing struct member while 2/2 adds support for the two new field
formats.

Niklas Söderlund (2):
  rcar-vin: Move hardware buffer tracking to own struct
  rcar-vin: Add support for V4L2_FIELD_SEQ_{TB,BT}

 drivers/media/platform/rcar-vin/rcar-dma.c  | 80 ++++++++++++++++-----
 drivers/media/platform/rcar-vin/rcar-v4l2.c |  7 +-
 drivers/media/platform/rcar-vin/rcar-vin.h  | 28 ++++++--
 3 files changed, 91 insertions(+), 24 deletions(-)

-- 
2.23.0

