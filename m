Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3435559902
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jun 2022 14:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbiFXMBr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Jun 2022 08:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbiFXMBp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Jun 2022 08:01:45 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6EBB7E02E
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Jun 2022 05:01:43 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id n01e2700D4C55Sk0601e0F; Fri, 24 Jun 2022 14:01:40 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1o4i0I-000gWb-Dd; Fri, 24 Jun 2022 14:01:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1o4i0H-009mqF-T5; Fri, 24 Jun 2022 14:01:37 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/4] Renesas driver updates for v5.20
Date:   Fri, 24 Jun 2022 14:01:31 +0200
Message-Id: <cover.1656069638.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656069631.git.geert+renesas@glider.be>
References: <cover.1656069631.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.20-tag1

for you to fetch changes up to 4f5bc54d28ecd0739c99dc71ed93c2ebb5d9ba32:

  soc: renesas: rcar-sysc: Optimize rcar_sysc_area struct sizes (2022-06-13 11:43:50 +0200)

----------------------------------------------------------------
Renesas driver updates for v5.20

  - Small fixes and improvements.

----------------------------------------------------------------
Geert Uytterhoeven (2):
      soc: renesas: r8a779a0-sysc: Fix A2DP1 and A2CV[2357] PDR values
      soc: renesas: rcar-sysc: Optimize rcar_sysc_area struct sizes

 drivers/soc/renesas/r8a779a0-sysc.c  | 10 +++++-----
 drivers/soc/renesas/rcar-gen4-sysc.h |  4 ++--
 drivers/soc/renesas/rcar-sysc.h      |  4 ++--
 3 files changed, 9 insertions(+), 9 deletions(-)
