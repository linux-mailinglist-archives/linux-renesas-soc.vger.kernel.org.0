Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE77123F527
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Aug 2020 01:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbgHGXVh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Aug 2020 19:21:37 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48942 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726078AbgHGXVh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Aug 2020 19:21:37 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A164854E;
        Sat,  8 Aug 2020 01:21:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596842495;
        bh=V9OuvQTGJ7rLvaqcGXVUtLP38CblrYdkIOjS3l9o1DM=;
        h=From:To:Cc:Subject:Date:From;
        b=dToalwc/nE8Iq3RjT8P/Q/tqj2LY7ePiIhtNudXSLXvKZ+EK9vg2NjZhKGbXzuiLl
         adxV3Rydq5AmqoZdRyFh7rYHbCeLkDzRphRRZb3tenO7Nc7ISZoMrXC16vtggL1w4J
         qVhYY0ZOglxNwar4rqo2gh6axVDUS2bpeOqnOUII=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [kms-tests] [PATCH 0/7] Improve CRC (DISCOM) test
Date:   Sat,  8 Aug 2020 02:21:13 +0300
Message-Id: <20200807232119.28854-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This patch series improves the test of the CRC calculation performed by
the DISCOM.

For DU channels backed by a VSP, the VSP can calculate the CRC of frames
using the DISCOM hardware block. The frame on which the CRC is computed
can be an input to the VSP (a DRM plane) or the output of the VSP (the
DU channel output). This is useful to verify that the screen, or a
portion of it, contains the expected data.

The test suite already contains a CRC test case, but it only verifies
that consecutive CRC values without any page flip do not vary. This
series extends the test to verify the actual CRC value.

Patches 1/6 and 2/6 improve the geometry helper classes in kmstest.
Patches 3/6 and then ensures that the CRC test leaves all CRTC disabled
even when it fails, to avoid cross-interactions between tests.

Patch 4/6 introduces a Composer class in the CRC test, to group all code
related to composition of the display. This is a small refactoring that
prepares for patch 5/6 that computes reference CRC values in the
Composer class, and compares them with the values computed by the
hardware.

The last patch, 6/6, adds a C utility to compute the CRC value of a
frame. This is useful when using the DISCOM to calculate the expected
CRC values, either during development or at runtime. The CRC calculation
code is generated with the Python crcmod module, using it only requires
a single line of code to compute a CRC on a data buffer:

	crc = calculate_crc(image, size, 0);

Note that the CRC test requires extensions to kmsxx that haven't been
merged upstream yet (one of them has actually not even been posted). The
kmsxx patches can be found at

	git://git.ideasonboard.com/renesas/kmsxx.git

I will work on upstreaming them.

Laurent Pinchart (6):
  kmstest: Extend Rect class
  kmstest: Add additional geometry classes
  tests: crc: Disable CRTC regarless of test status
  tests: crc: Introduce Composer class
  tests: crc: Compute reference CRC values and compare them
  crc: Add a utility to compute the CRC of a frame

 Makefile              |   2 +-
 README                |   1 +
 crc/Makefile          |  32 +++++
 crc/gen-crc.py        |  14 +++
 crc/main.c            | 271 ++++++++++++++++++++++++++++++++++++++++++
 tests/kms-test-crc.py | 145 +++++++++++++++++++---
 tests/kmstest.py      |  38 ++++++
 7 files changed, 488 insertions(+), 15 deletions(-)
 create mode 100644 crc/Makefile
 create mode 100755 crc/gen-crc.py
 create mode 100644 crc/main.c

-- 
Regards,

Laurent Pinchart

