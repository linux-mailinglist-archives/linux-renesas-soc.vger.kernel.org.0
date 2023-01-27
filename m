Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53CF867EAE0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jan 2023 17:28:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232974AbjA0Q2d (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Jan 2023 11:28:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234068AbjA0Q2b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Jan 2023 11:28:31 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C0AD21A11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Jan 2023 08:28:29 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:a160:4e65:21d4:30bf])
        by albert.telenet-ops.be with bizsmtp
        id DsUT2900C2rBNjs06sUTVC; Fri, 27 Jan 2023 17:28:27 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pLRaG-007Zke-Mi;
        Fri, 27 Jan 2023 17:28:24 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pLRaS-005TaX-Fq;
        Fri, 27 Jan 2023 17:28:24 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas driver updates for v6.3 (take two)
Date:   Fri, 27 Jan 2023 17:28:12 +0100
Message-Id: <cover.1674815095.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1674815093.git.geert+renesas@glider.be>
References: <cover.1674815093.git.geert+renesas@glider.be>
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

The following changes since commit 499e364cd2508c2115ac251f42bb47c9548cf358:

  soc: renesas: r8a779g0-sysc: Add missing A3DUL power domain (2022-12-26 11:08:49 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.3-tag2

for you to fetch changes up to 0c56f949f626e59ef7c5b18e2706fed2a6afc4a2:

  soc: renesas: Add PWC support for RZ/V2M (2023-01-23 09:28:28 +0100)

----------------------------------------------------------------
Renesas driver updates for v6.3 (take two)

  - Add support for the Renesas RZ/V2M External Power Sequence
    Controller (PWC).

----------------------------------------------------------------
Fabrizio Castro (1):
      soc: renesas: Add PWC support for RZ/V2M

 drivers/soc/renesas/Kconfig     |   4 ++
 drivers/soc/renesas/Makefile    |   1 +
 drivers/soc/renesas/pwc-rzv2m.c | 141 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 146 insertions(+)
 create mode 100644 drivers/soc/renesas/pwc-rzv2m.c
