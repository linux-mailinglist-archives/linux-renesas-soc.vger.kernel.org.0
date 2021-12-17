Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB57B478977
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Dec 2021 12:07:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235099AbhLQLHV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Dec 2021 06:07:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235242AbhLQLHU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Dec 2021 06:07:20 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB48FC061574
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Dec 2021 03:07:19 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d13f:527c:5504:a743])
        by xavier.telenet-ops.be with bizsmtp
        id XP7H2600E250X3001P7HcS; Fri, 17 Dec 2021 12:07:17 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1myB53-005Y8V-69; Fri, 17 Dec 2021 12:07:17 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1myB52-00AQSi-JK; Fri, 17 Dec 2021 12:07:16 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/4] Renesas DT binding updates for v5.17 (take two)
Date:   Fri, 17 Dec 2021 12:07:15 +0100
Message-Id: <cover.1639736725.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639736716.git.geert+renesas@glider.be>
References: <cover.1639736716.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 217c7d1840b5377543eff84fe28409d0bd4d3433:

  dt-bindings: mmc: renesas,sdhi: Rename RZ/G2L clocks (2021-11-26 13:53:02 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.17-tag2

for you to fetch changes up to d01986bec3887a3dbf61cbd821979f91cf0bb2dc:

  dt-bindings: arm: renesas: Document Renesas Spider boards (2021-12-07 16:27:13 +0100)

----------------------------------------------------------------
Renesas DT binding updates for v5.17 (take two)

  - Document support for the R-Car S4-8 Spider CPU and BreakOut boards.

----------------------------------------------------------------
Yoshihiro Shimoda (1):
      dt-bindings: arm: renesas: Document Renesas Spider boards

 Documentation/devicetree/bindings/arm/renesas.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)
