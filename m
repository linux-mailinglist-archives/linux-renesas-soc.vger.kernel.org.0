Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBA4B3DB93D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jul 2021 15:19:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238946AbhG3NTe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Jul 2021 09:19:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238968AbhG3NTU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Jul 2021 09:19:20 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BAA0C061796
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jul 2021 06:19:10 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:69f0:c617:e432:6919])
        by baptiste.telenet-ops.be with bizsmtp
        id bRK62500B2oLRg901RK65G; Fri, 30 Jul 2021 15:19:06 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m9SPp-002GQs-Vp; Fri, 30 Jul 2021 15:19:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m9SPp-00HJs6-Ho; Fri, 30 Jul 2021 15:19:05 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas DT binding updates for v5.15
Date:   Fri, 30 Jul 2021 15:18:56 +0200
Message-Id: <cover.1627650706.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627650695.git.geert+renesas@glider.be>
References: <cover.1627650695.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.15-tag1

for you to fetch changes up to 3e82868e8523d5426f76866863704b02adacac3e:

  dt-bindings: arm: renesas: Document R-Car H3e-2G and M3e-2G SoCs and boards (2021-07-27 09:26:16 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v5.15

  - Document support for the new R-Car H3e-2G and M3e-2G SoCs and
    boards.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      dt-bindings: arm: renesas: Document R-Car H3e-2G and M3e-2G SoCs and boards

 Documentation/devicetree/bindings/arm/renesas.yaml | 50 +++++++++++++++++-----
 1 file changed, 39 insertions(+), 11 deletions(-)
