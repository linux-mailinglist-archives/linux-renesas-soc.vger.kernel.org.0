Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A07E5458B2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jun 2022 01:40:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbiFIXkv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Jun 2022 19:40:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237871AbiFIXku (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Jun 2022 19:40:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF841205F89
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jun 2022 16:40:44 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D1DA6CF;
        Fri, 10 Jun 2022 01:40:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1654818041;
        bh=XE9Uvxx1J5+NimtfKqd2//A7eI/gUa7UITlxXd1LDC8=;
        h=From:To:Cc:Subject:Date:From;
        b=liwZlFieX1mhbYu/GCsYX2vzwIrC3Hcpk5pxeSOWqClhllW5gv4/kVW1KAGBTKOxo
         4EfNW/0cwEu0ZdbBtjiaRiu0qKo203xQJGzdOwUGEv13DtZh1WEyZ3g2FZSzJI+Msk
         zF+3EGo5vfldFpbVPm9yeaTBA5fRjeoXLsC+RjxE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [kms-test] [PATCH 00/10] Test plane alpha and zpos control
Date:   Fri, 10 Jun 2022 02:40:21 +0300
Message-Id: <20220609234031.14803-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This patch series extends the kms-test scripts ([1]) with two tests, for
plane alpha and zpos control.

The first two patches are cleanups, and patch 03/10 improves logging in
the allplanes test. Patches 04/10 to 06/10 prepare the test library for
alpha support, and patch 07/10 adds the alpha test. Similarly, patches
08/10 and 09/10 respectively add zpos support to the library and in a
new test. Finally, patch 10/10 renames the planeposition test file to
match the naming scheme of other tests.

[1] https://git.ideasonboard.com/renesas/kms-tests.git

Laurent Pinchart (10):
  tests: Replace double quotes with single quotes
  tests: Convert to formatted string literals
  tests: allplanes: Log the plane IDs
  kmstest: Move props value formatting to AtomicRequest
  kmstest: Support specifying property values in percents
  kmstest: Support specifying alpha value for planes
  tests: Add plane alpha test
  kmstest: Support specifying zpos value for planes
  tests: Add plane zpos test
  tests: Rename kms-test-planeposition.py to kms-test-plane-position.py

 tests/kms-test-allplanes.py                   |  23 ++--
 tests/kms-test-brxalloc.py                    |  38 +++----
 tests/kms-test-connectors.py                  |   6 +-
 tests/kms-test-crc.py                         |  33 +++---
 tests/kms-test-formats.py                     |  18 +--
 tests/kms-test-legacy-modeset.py              |  20 ++--
 tests/kms-test-modes.py                       |  20 ++--
 tests/kms-test-modeset.py                     |  20 ++--
 tests/kms-test-pageflip.py                    |  28 ++---
 tests/kms-test-plane-alpha.py                 |  97 +++++++++++++++++
 ...position.py => kms-test-plane-position.py} |  32 +++---
 tests/kms-test-plane-zpos.py                  | 102 +++++++++++++++++
 tests/kms-test-routing.py                     |  16 +--
 tests/kmstest.py                              | 103 +++++++++++-------
 14 files changed, 388 insertions(+), 168 deletions(-)
 create mode 100755 tests/kms-test-plane-alpha.py
 rename tests/{kms-test-planeposition.py => kms-test-plane-position.py} (77%)
 create mode 100755 tests/kms-test-plane-zpos.py


base-commit: 322821a1381f81c4dd480d065bec13803c7e69dc
-- 
Regards,

Laurent Pinchart

