Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DAB566AB85
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Jan 2023 14:23:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbjANNXT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 14 Jan 2023 08:23:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbjANNXR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 14 Jan 2023 08:23:17 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 231215BB1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Jan 2023 05:23:13 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id 8dP92900f4C55Sk01dP9xD; Sat, 14 Jan 2023 14:23:11 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pGgV0-003z7G-0D;
        Sat, 14 Jan 2023 14:23:09 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pGgV3-006HuN-Ng;
        Sat, 14 Jan 2023 14:23:09 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas driver updates for v6.3
Date:   Sat, 14 Jan 2023 14:22:58 +0100
Message-Id: <cover.1673702291.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1673702287.git.geert+renesas@glider.be>
References: <cover.1673702287.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.3-tag1

for you to fetch changes up to 499e364cd2508c2115ac251f42bb47c9548cf358:

  soc: renesas: r8a779g0-sysc: Add missing A3DUL power domain (2022-12-26 11:08:49 +0100)

----------------------------------------------------------------
Renesas driver updates for v6.3

  - Add missing A3DUL power domain on R-Car V4H.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      Merge tag 'renesas-r8a779g0-dt-binding-defs-tag2' into renesas-drivers-for-v6.3

Tam Nguyen (2):
      dt-bindings: power: r8a779g0: Add missing A3DUL power domain
      soc: renesas: r8a779g0-sysc: Add missing A3DUL power domain

 drivers/soc/renesas/r8a779g0-sysc.c       | 1 +
 include/dt-bindings/power/r8a779g0-sysc.h | 1 +
 2 files changed, 2 insertions(+)
