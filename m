Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80B7F77C8A1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Aug 2023 09:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235456AbjHOHfW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Aug 2023 03:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234809AbjHOHev (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Aug 2023 03:34:51 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1134110C
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Aug 2023 00:34:49 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,174,1684767600"; 
   d="scan'208";a="172983112"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 15 Aug 2023 16:34:49 +0900
Received: from localhost.localdomain (unknown [10.226.92.136])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 89837417C10C;
        Tue, 15 Aug 2023 16:34:47 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Lee Jones <lee@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Pavel Machek <pavel@denx.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/2] RZ/G2L MTU3 driver enhancements
Date:   Tue, 15 Aug 2023 08:34:43 +0100
Message-Id: <20230815073445.9579-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add improvements to RZ/G2L MTU3a driver:
 * Reduce crical sections on rz_mtu3_start_stop_ch() and
   rz_mtu3_is_enabled().
 * Replace raw_spin_lock->spin_lock().

This patch series is based on next.

Biju Das (2):
  mfd: rz-mtu3: Reduce critical sections
  mfd: rz-mtu3: Replace raw_spin_lock->spin_lock()

 drivers/mfd/rz-mtu3.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

-- 
2.25.1

