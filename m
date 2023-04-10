Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B19C6DC40D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Apr 2023 09:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbjDJHzr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Apr 2023 03:55:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbjDJHzq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Apr 2023 03:55:46 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF8CC3C20
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Apr 2023 00:55:44 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by baptiste.telenet-ops.be with bizsmtp
        id ivvj2900G1C8whw01vvj4D; Mon, 10 Apr 2023 09:55:43 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1plmMW-00GRry-Jc;
        Mon, 10 Apr 2023 09:55:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1plmNL-008PVK-5q;
        Mon, 10 Apr 2023 09:55:43 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas driver updates for v6.4 (take two)
Date:   Mon, 10 Apr 2023 09:55:27 +0200
Message-Id: <cover.1681113115.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1681113111.git.geert+renesas@glider.be>
References: <cover.1681113111.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 2653d5bf1c9d123c0d8b8c1634cf54dacfcfdb52:

  soc: renesas: Use "#ifdef" for single-symbol definition checks (2023-03-16 16:58:42 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.4-tag2

for you to fetch changes up to fc187a46a8e682f0f1167b230792b88de01ceaa0:

  soc: renesas: renesas-soc: Release 'chipid' from ioremap() (2023-04-04 10:01:58 +0200)

----------------------------------------------------------------
Renesas driver updates for v6.4 (take two)

  - Add "renesas," file contents pattern to MAINTAINERS,
  - Fix a small leak on OOM.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      MAINTAINERS: renesas: Add "renesas," file contents pattern

Li Yang (1):
      soc: renesas: renesas-soc: Release 'chipid' from ioremap()

 MAINTAINERS                       | 1 +
 drivers/soc/renesas/renesas-soc.c | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)
