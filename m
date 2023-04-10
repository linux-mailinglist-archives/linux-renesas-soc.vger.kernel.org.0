Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4461C6DC40C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Apr 2023 09:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbjDJHzr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Apr 2023 03:55:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjDJHzq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Apr 2023 03:55:46 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCB75172E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Apr 2023 00:55:44 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by baptiste.telenet-ops.be with bizsmtp
        id ivvj2900E1C8whw01vvj4B; Mon, 10 Apr 2023 09:55:43 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1plmMW-00GRrs-Ih;
        Mon, 10 Apr 2023 09:55:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1plmNL-008PVD-4U;
        Mon, 10 Apr 2023 09:55:43 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas ARM SoC updates for v6.4
Date:   Mon, 10 Apr 2023 09:55:26 +0200
Message-Id: <cover.1681113113.git.geert+renesas@glider.be>
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

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-soc-for-v6.4-tag1

for you to fetch changes up to 6050cb1c7ad40b5673cd6ee7cfd36db3ca9be5fe:

  ARM: sh-mobile: Use of_cpu_node_to_id() to read CPU node 'reg' (2023-03-30 16:02:42 +0200)

----------------------------------------------------------------
Renesas ARM SoC updates for v6.4

  - Use of_cpu_node_to_id() to read CPU node 'reg'.

----------------------------------------------------------------
Rob Herring (1):
      ARM: sh-mobile: Use of_cpu_node_to_id() to read CPU node 'reg'

 arch/arm/mach-shmobile/platsmp-apmu.c | 36 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 20 deletions(-)
