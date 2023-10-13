Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D95C7C85EB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Oct 2023 14:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231776AbjJMMj0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Oct 2023 08:39:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231768AbjJMMjZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Oct 2023 08:39:25 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85C00D7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Oct 2023 05:39:23 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:f151:5551:1af6:b316])
        by baptiste.telenet-ops.be with bizsmtp
        id xQfM2A00856FAx301QfML5; Fri, 13 Oct 2023 14:39:21 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qrHRl-006Ggc-Tb;
        Fri, 13 Oct 2023 14:39:21 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qrHRp-002Jo2-BP;
        Fri, 13 Oct 2023 14:39:21 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas DT binding updates for v6.7 (take two)
Date:   Fri, 13 Oct 2023 14:39:14 +0200
Message-Id: <cover.1697200121.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697200117.git.geert+renesas@glider.be>
References: <cover.1697200117.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 111287aa60004e1a58320048c89391056288c455:

  dt-bindings: soc: renesas: renesas,rzg2l-sysc: Document RZ/G3S SoC (2023-09-18 09:50:30 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.7-tag2

for you to fetch changes up to c0a2c7619666ae857a52219f344fbaa915cd181a:

  dt-bindings: soc: renesas: Document R-Car S4 Starter Kit (2023-10-05 11:37:42 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v6.7 (take two)

  - Document support for the Renesas RZ/G3S SMARC SoM and SMARC
    Carrier-II EVK development boards,
  - Document support for the Renesas R-Car S4 Starter Kit.

----------------------------------------------------------------
Claudiu Beznea (2):
      dt-bindings: soc: renesas: Document RZ/G3S SMARC SoM
      dt-bindings: soc: renesas: Document SMARC Carrier-II EVK

Kuninori Morimoto (1):
      dt-bindings: soc: renesas: Document R-Car S4 Starter Kit

 .../devicetree/bindings/soc/renesas/renesas.yaml     | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
