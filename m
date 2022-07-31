Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05740585F72
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 31 Jul 2022 17:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236795AbiGaPUf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 31 Jul 2022 11:20:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232548AbiGaPUd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 31 Jul 2022 11:20:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ADBF260D
        for <linux-renesas-soc@vger.kernel.org>; Sun, 31 Jul 2022 08:20:32 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CEA50415;
        Sun, 31 Jul 2022 17:20:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659280830;
        bh=i4Tk2GDqR5D4OJsGjdKVdONmY+mMHX8gqPBnQXhUhaE=;
        h=From:To:Cc:Subject:Date:From;
        b=Ywwe3Q5lX86friwFY1pdrPcRAKrVxcsds4K6st5bwoRdT23xOfbbkQQ4aci97hQSa
         L7xJmhOpem2BiKRgREayuMmp2TBASt5fAAN2w4G/QqZu/IIbTR65UqecfI8CkyCTUc
         iHbyh4KFjwY1W6y4hGOiW+4OQfF2anF6/zmajey0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [kms-test] [PATCH 0/7] Miscellaneous fixes and improvements
Date:   Sun, 31 Jul 2022 18:20:17 +0300
Message-Id: <20220731152024.24090-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This series fixes miscellaneous issues in the kms-test suite ([1]).

Patches 1/7 to 3/7 are direct bug fixes, patches 4/7 and 5/7 improve
handling of CRC reader failures by properly handling exceptions, and
patches 6/7 and 7/7 implement a test runner. Please see individual
patches for details.

[1] https://git.ideasonboard.com/renesas/kms-tests.git

Laurent Pinchart (7):
  tests: brxalloc: Fix test start log message
  tests: modes: Fix access to RuntimeError message text
  kmstest: Fix CRC directory name string
  kmstest: Fix exception handling in CRCReader constructor and
    destructor
  tests: crc: Skip test if CRC support isn't available
  tests: Only call execute() if the test is run directly
  kmstest: Implement test runner when executed directly

 tests/kms-test-allplanes.py      |  4 ++-
 tests/kms-test-brxalloc.py       |  6 ++--
 tests/kms-test-connectors.py     |  3 +-
 tests/kms-test-crc.py            | 12 ++++++--
 tests/kms-test-formats.py        |  4 ++-
 tests/kms-test-legacy-modeset.py |  4 ++-
 tests/kms-test-modes.py          |  6 ++--
 tests/kms-test-modeset.py        |  4 ++-
 tests/kms-test-pageflip.py       |  4 ++-
 tests/kms-test-plane-alpha.py    |  4 ++-
 tests/kms-test-plane-position.py |  4 ++-
 tests/kms-test-plane-zpos.py     |  4 ++-
 tests/kms-test-routing.py        |  3 +-
 tests/kmstest.py                 | 52 +++++++++++++++++++++++++++++---
 14 files changed, 94 insertions(+), 20 deletions(-)


base-commit: 70afa1a51f4ffc4db404514af0b2990b23d56fee
-- 
Regards,

Laurent Pinchart

