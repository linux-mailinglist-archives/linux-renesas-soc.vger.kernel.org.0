Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9214121E368
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2020 01:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726356AbgGMXEz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Jul 2020 19:04:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726352AbgGMXEz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Jul 2020 19:04:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C8D7C061755
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2020 16:04:55 -0700 (PDT)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1BD12C9;
        Tue, 14 Jul 2020 01:04:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594681491;
        bh=z/sWiRcAzasgUzNozLfAVzhTStQvqUjDjxSETv5cQlY=;
        h=From:To:Cc:Subject:Date:From;
        b=XimzrWfBTnej57KrfwfTjZL4ffw5TtfGE8TavkMXnoTTD3nbKRlbkCHC0s59MmAfV
         SmziaCRYxOSusQ73GfK86SizPgmr2H6kATzqibYdsskzrvaPEQankAaTre+cHM4ewp
         PO49HbwIsDEl6yV0e2B+yWq2WqhXgVtSfE29GEGk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [kms-test] [PATCH] Add license and copyright information
Date:   Tue, 14 Jul 2020 02:04:38 +0300
Message-Id: <20200713230438.2087-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add SPDX tags to describe license and copyright information to all files
in the repository.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Makefile                         | 2 ++
 README                           | 3 +++
 tests/Makefile                   | 2 ++
 tests/kms-test-allplanes.py      | 2 ++
 tests/kms-test-brxalloc.py       | 2 ++
 tests/kms-test-connectors.py     | 2 ++
 tests/kms-test-crc.py            | 2 ++
 tests/kms-test-formats.py        | 2 ++
 tests/kms-test-legacy-modeset.py | 2 ++
 tests/kms-test-modes.py          | 2 ++
 tests/kms-test-modeset.py        | 2 ++
 tests/kms-test-pageflip.py       | 2 ++
 tests/kms-test-planeposition.py  | 2 ++
 tests/kms-test-routing.py        | 2 ++
 tests/kmstest.py                 | 2 ++
 15 files changed, 31 insertions(+)

diff --git a/Makefile b/Makefile
index 3fe6ed9604bc..1f0da15546b8 100644
--- a/Makefile
+++ b/Makefile
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: CC0-1.0
+
 SUBDIRS=tests
 
 recursive=all clean install
diff --git a/README b/README
index 69a3bc5eef6c..7f770d4170a3 100644
--- a/README
+++ b/README
@@ -1,3 +1,6 @@
+.. SPDX-License-Identifier: CC-BY-SA-4.0
+.. SPDX-FileCopyrightText: 2017 Renesas Electronics Corporation
+
 du-tests
 --------
 
diff --git a/tests/Makefile b/tests/Makefile
index 521761af28cf..0a921e5f56cd 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: CC0-1.0
+
 SCRIPTS=$(wildcard *.py)
 
 all:
diff --git a/tests/kms-test-allplanes.py b/tests/kms-test-allplanes.py
index ca7baa07af42..d88326293782 100755
--- a/tests/kms-test-allplanes.py
+++ b/tests/kms-test-allplanes.py
@@ -1,4 +1,6 @@
 #!/usr/bin/python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2019 Renesas Electronics Corporation
 
 import kmstest
 import pykms
diff --git a/tests/kms-test-brxalloc.py b/tests/kms-test-brxalloc.py
index a0ae46a8b53e..dbdc78946b04 100755
--- a/tests/kms-test-brxalloc.py
+++ b/tests/kms-test-brxalloc.py
@@ -1,4 +1,6 @@
 #!/usr/bin/python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2018-2019 Renesas Electronics Corporation
 
 import kmstest
 import pykms
diff --git a/tests/kms-test-connectors.py b/tests/kms-test-connectors.py
index 25fc5dc8f60e..4c58b99f8fbf 100755
--- a/tests/kms-test-connectors.py
+++ b/tests/kms-test-connectors.py
@@ -1,4 +1,6 @@
 #!/usr/bin/python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017 Renesas Electronics Corporation
 
 import kmstest
 import pykms
diff --git a/tests/kms-test-crc.py b/tests/kms-test-crc.py
index e0e0eabd9950..d936d1d4fb90 100755
--- a/tests/kms-test-crc.py
+++ b/tests/kms-test-crc.py
@@ -1,4 +1,6 @@
 #!/usr/bin/python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2019 Renesas Electronics Corporation
 
 import kmstest
 import pykms
diff --git a/tests/kms-test-formats.py b/tests/kms-test-formats.py
index 15e6f591aea9..77c9fe775a7c 100755
--- a/tests/kms-test-formats.py
+++ b/tests/kms-test-formats.py
@@ -1,4 +1,6 @@
 #!/usr/bin/python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2019 Renesas Electronics Corporation
 
 import kmstest
 import pykms
diff --git a/tests/kms-test-legacy-modeset.py b/tests/kms-test-legacy-modeset.py
index 17a81792a2b8..4b5605345391 100755
--- a/tests/kms-test-legacy-modeset.py
+++ b/tests/kms-test-legacy-modeset.py
@@ -1,4 +1,6 @@
 #!/usr/bin/python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2018-2019 Renesas Electronics Corporation
 
 import kmstest
 import pykms
diff --git a/tests/kms-test-modes.py b/tests/kms-test-modes.py
index 82a1a3b21e93..b298a19beedf 100755
--- a/tests/kms-test-modes.py
+++ b/tests/kms-test-modes.py
@@ -1,4 +1,6 @@
 #!/usr/bin/python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2019 Renesas Electronics Corporation
 
 import kmstest
 import pykms
diff --git a/tests/kms-test-modeset.py b/tests/kms-test-modeset.py
index 224b39143a8e..0dbe67fb2a4f 100755
--- a/tests/kms-test-modeset.py
+++ b/tests/kms-test-modeset.py
@@ -1,4 +1,6 @@
 #!/usr/bin/python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2019 Renesas Electronics Corporation
 
 import kmstest
 import pykms
diff --git a/tests/kms-test-pageflip.py b/tests/kms-test-pageflip.py
index bef1f4990a10..19c3adaa601f 100755
--- a/tests/kms-test-pageflip.py
+++ b/tests/kms-test-pageflip.py
@@ -1,4 +1,6 @@
 #!/usr/bin/python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2019 Renesas Electronics Corporation
 
 import kmstest
 import pykms
diff --git a/tests/kms-test-planeposition.py b/tests/kms-test-planeposition.py
index ac4b4d0eb407..a7cc11113aa9 100755
--- a/tests/kms-test-planeposition.py
+++ b/tests/kms-test-planeposition.py
@@ -1,4 +1,6 @@
 #!/usr/bin/python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2019 Renesas Electronics Corporation
 
 import kmstest
 import pykms
diff --git a/tests/kms-test-routing.py b/tests/kms-test-routing.py
index a24dc1c0fb1e..806adb8c68a8 100755
--- a/tests/kms-test-routing.py
+++ b/tests/kms-test-routing.py
@@ -1,4 +1,6 @@
 #!/usr/bin/python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2019 Renesas Electronics Corporation
 
 import kmstest
 import pykms
diff --git a/tests/kmstest.py b/tests/kmstest.py
index 8a483d7b5259..f13e3fb7aa32 100755
--- a/tests/kmstest.py
+++ b/tests/kmstest.py
@@ -1,4 +1,6 @@
 #!/usr/bin/python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2019 Renesas Electronics Corporation
 
 import collections.abc
 import errno
-- 
Regards,

Laurent Pinchart

