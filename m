Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36D9721E381
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2020 01:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbgGMXIV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Jul 2020 19:08:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726376AbgGMXIU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Jul 2020 19:08:20 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61D33C061755
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2020 16:08:20 -0700 (PDT)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD5E757B;
        Tue, 14 Jul 2020 01:08:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594681698;
        bh=0dKnwwUnQSk98hOgaXzgoeFhaDgRLrJc4f0EU099Xdk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JZFx1ZZq6D7bT550+uhvG3/hSvLVxJ5VzPM3tf27sqR84cTcx09DCHyezepoq5mTm
         P5oQULRj83tOGGMlBsESUCOBHlEkjl0Bpq4NGc7ijYp678EW967u3Y1RupTzg9veRs
         /E21sWNjwQZpX28i6b43JwfowKaWtuUlqiiNBUkI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [vsp-tests] [PATCH 2/2] gen-image: Replace copyright text with SPDX tags
Date:   Tue, 14 Jul 2020 02:08:08 +0300
Message-Id: <20200713230808.2570-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200713230808.2570-1-laurent.pinchart@ideasonboard.com>
References: <20200713230808.2570-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Standardize on the usage of SPDX tags. No change in copyright is
included.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 src/gen-image.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/src/gen-image.c b/src/gen-image.c
index 0ee97749ebbf..d9f92253af46 100644
--- a/src/gen-image.c
+++ b/src/gen-image.c
@@ -1,11 +1,5 @@
-/*
- * Copyright (C) 2016 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- */
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* SPDX-FileCopyrightText: 2016 Laurent Pinchart <laurent.pinchart@ideasonboard.com> */
 
 #include <ctype.h>
 #include <errno.h>
-- 
Regards,

Laurent Pinchart

