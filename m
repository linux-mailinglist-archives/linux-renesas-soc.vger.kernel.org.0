Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A75B67EAE1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jan 2023 17:28:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234025AbjA0Q2e (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Jan 2023 11:28:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234831AbjA0Q2c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Jan 2023 11:28:32 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FEB77D6D9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Jan 2023 08:28:31 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:a160:4e65:21d4:30bf])
        by xavier.telenet-ops.be with bizsmtp
        id DsUV2900A2rBNjs01sUVNC; Fri, 27 Jan 2023 17:28:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pLRaG-007Zkh-N4;
        Fri, 27 Jan 2023 17:28:24 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pLRaS-005Taa-GQ;
        Fri, 27 Jan 2023 17:28:24 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas DT binding updates for v6.3
Date:   Fri, 27 Jan 2023 17:28:13 +0100
Message-Id: <cover.1674815097.git.geert+renesas@glider.be>
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

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.3-tag1

for you to fetch changes up to 6e1456f9251966d8fbfde2ae4750ba540b588533:

  dt-bindings: soc: renesas: Add RZ/V2M PWC (2023-01-23 09:25:27 +0100)

----------------------------------------------------------------
Renesas DT binding updates for v6.3

  - Document support for the Renesas RZ/V2M External Power Sequence
    Controller (PWC).

----------------------------------------------------------------
Fabrizio Castro (1):
      dt-bindings: soc: renesas: Add RZ/V2M PWC

 .../bindings/soc/renesas/renesas,rzv2m-pwc.yaml    | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,rzv2m-pwc.yaml
