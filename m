Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97A1626FD76
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Sep 2020 14:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbgIRMsS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Sep 2020 08:48:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726635AbgIRMsF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Sep 2020 08:48:05 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCBA7C06178B
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Sep 2020 05:48:04 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id VQo22300a4C55Sk06Qo2hV; Fri, 18 Sep 2020 14:48:02 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kJFo2-00025H-Gf; Fri, 18 Sep 2020 14:48:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kJFo2-00043z-FX; Fri, 18 Sep 2020 14:48:02 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/4] Renesas DT binding updates for v5.10
Date:   Fri, 18 Sep 2020 14:48:00 +0200
Message-Id: <20200918124800.15555-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200918124800.15555-1-geert+renesas@glider.be>
References: <20200918124800.15555-1-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.10-tag1

for you to fetch changes up to b08892556b3f19d95d356b33692247de8303fe05:

  dt-bindings: arm: renesas: Document Renesas Falcon boards (2020-09-10 18:55:53 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v5.10

  - Document core support for the R-Car V3U (R8A779A0) SoC and the
    Renesas Falcon CPU and BreakOut boards.

----------------------------------------------------------------
Yoshihiro Shimoda (4):
      dt-bindings: arm: renesas: Document R-Car V3U SoC DT bindings
      dt-bindings: power: renesas,rcar-sysc: Document r8a779a0 SYSC bindings
      dt-bindings: reset: renesas,rst: Document r8a779a0 reset module
      dt-bindings: arm: renesas: Document Renesas Falcon boards

 Documentation/devicetree/bindings/arm/renesas.yaml           | 12 ++++++++++++
 .../devicetree/bindings/power/renesas,rcar-sysc.yaml         |  1 +
 Documentation/devicetree/bindings/reset/renesas,rst.yaml     |  1 +
 3 files changed, 14 insertions(+)
