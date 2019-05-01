Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1FBA10645
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 May 2019 11:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbfEAJYP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 May 2019 05:24:15 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34811 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbfEAJYP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 May 2019 05:24:15 -0400
Received: by mail-pf1-f195.google.com with SMTP id b3so8385052pfd.1;
        Wed, 01 May 2019 02:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=npCKuEhBLbCVZt2YPdcZ3HRYomc+RD/O9XeiPEqtF8w=;
        b=WvyBO6DaVpyVwichyh5oygw7YvmjbYRTsg4TMuJE2lUwaT29VmB6RTgNDQZ8bB8UNw
         4oc7EUIDh22RmrpCDJLRr8S31K56fCdDv9XnAaSeegTmQZPj+6VWnCwGEkR+iOoXpIcu
         q2as/fgD0Pamgcga9ZE4SsMljZRXB/fwBWkH2ykefGqY4XUvZTISM/hOX5bdt3+eNldm
         IxVpBV9zTPhlyyUiUNwpWAkEMxqoBK/QOeg6vKtW2a9IKaOsJBOlF/AIaT17q0X0UVft
         lxMPu3vh+cYUPNOO9f+my5iUKKwRNvp94G+RQwqqVuTLtkRYPm/RkunYATVESsiTYQxy
         WJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=npCKuEhBLbCVZt2YPdcZ3HRYomc+RD/O9XeiPEqtF8w=;
        b=lGOv+enfvdZvTP0KgFgr2QxQ2DC1K2yf4uAzhrZTe+JibR9Hv2J35cYo73ErOobD6a
         A1HYRcsZwaI5Mc92+8NDxB0DQ+PmtB2EHH/dHUmctsw9VbcZTbaVuRzC4RkK5DDQUjBg
         77Umo7n1A+01WJOSGMWM6GogMWvtiqumuWR9xq00EPAdNnSyczf0bqtohzDOPXWMxXxA
         XUQgbMqprDApE41bUNksXRFM3z6uOTEXHNxgFwe7ai7LMkyLXnOG89Q9U+PqIQ09Cj/8
         +0PD85ly4MO8ugSrtfLUlM3auctVbzvWbVj049+FawEL2Ng76Gf6mFwn5vaqZv1MzuAB
         7+Vw==
X-Gm-Message-State: APjAAAXZJIsloGBJc4jCjrEzYDuGT5ehWc6KCyZECA2jro7fGd0p+UPA
        W3cAvM141x9PQDpT1WL+ZLU=
X-Google-Smtp-Source: APXvYqyN1RS02J0XD6PXRrfceL6wCLQkjjCBn4Q3NI0NKZ/pPbbNvCvGgS4mXb6m547cLib3zVRNGg==
X-Received: by 2002:aa7:8251:: with SMTP id e17mr40151508pfn.147.1556702654443;
        Wed, 01 May 2019 02:24:14 -0700 (PDT)
Received: from nishad ([106.51.235.3])
        by smtp.gmail.com with ESMTPSA id x6sm19377938pfm.114.2019.05.01.02.24.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 May 2019 02:24:13 -0700 (PDT)
Date:   Wed, 1 May 2019 14:54:07 +0530
From:   Nishad Kamdar <nishadkamdar@gmail.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: renesas: Use the correct style for SPDX License
 Identifier
Message-ID: <20190501092359.GA8152@nishad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch corrects the SPDX License Identifier style
in header files related to Clock Drivers for Renesas Socs.
For C header files Documentation/process/license-rules.rst
mandates C-like comments (opposed to C source files where
C++ style should be used)

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 drivers/clk/renesas/rcar-gen2-cpg.h    | 4 ++--
 drivers/clk/renesas/rcar-gen3-cpg.h    | 4 ++--
 drivers/clk/renesas/renesas-cpg-mssr.h | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen2-cpg.h b/drivers/clk/renesas/rcar-gen2-cpg.h
index bff9551c7a38..db2f57ef2f99 100644
--- a/drivers/clk/renesas/rcar-gen2-cpg.h
+++ b/drivers/clk/renesas/rcar-gen2-cpg.h
@@ -1,5 +1,5 @@
-/* SPDX-License-Identifier: GPL-2.0
- *
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
  * R-Car Gen2 Clock Pulse Generator
  *
  * Copyright (C) 2016 Cogent Embedded Inc.
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.h b/drivers/clk/renesas/rcar-gen3-cpg.h
index 15700d219a05..c4ac80cac6a0 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.h
+++ b/drivers/clk/renesas/rcar-gen3-cpg.h
@@ -1,5 +1,5 @@
-/* SPDX-License-Identifier: GPL-2.0
- *
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
  * R-Car Gen3 Clock Pulse Generator
  *
  * Copyright (C) 2015-2018 Glider bvba
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index c4ec9df146fd..4ddcdf3bfb95 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.h
+++ b/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -1,5 +1,5 @@
-/* SPDX-License-Identifier: GPL-2.0
- *
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
  * Renesas Clock Pulse Generator / Module Standby and Software Reset
  *
  * Copyright (C) 2015 Glider bvba
-- 
2.17.1

