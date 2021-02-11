Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A8D23187D5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Feb 2021 11:13:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbhBKKNA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Feb 2021 05:13:00 -0500
Received: from mail-lf1-f41.google.com ([209.85.167.41]:38671 "EHLO
        mail-lf1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbhBKKK7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Feb 2021 05:10:59 -0500
Received: by mail-lf1-f41.google.com with SMTP id m22so7316922lfg.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Feb 2021 02:10:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=0dULax139aKZnoGmMduZUSLkCc9CbvDqrF+KDWO+EWk=;
        b=XWkH/wAMPtj/WcCmb0bzC+gtqKBFf48wOfk0jk40uBi70uiGVEsZnMc/DTxoTpNJ2a
         H1uAYeihdaSGH2Px6UaqbCqQCanzDebD/SMSMLhysvr2PJue7MGoTN+bUs6jjv/507w5
         XfFFzEYurxF1/t/+xl2LvZf8Y4L9rgXLvNzefsM6CKk+pS/0z84UYE/TUwzhPVfLqOEo
         A+qW+aeIkeicYeVq6QiEcpVt6wVJUk0hVdXxhaykVA4402nxlD71nwW5dF1KlBWmavW3
         I/UYoYstPsJgrap0M5OvW3Y7oZ0hnrtb3YLYxj2ybngIEj0IZpwkQGOd/+YoUazwpS5/
         CCGg==
X-Gm-Message-State: AOAM530ruQWiKK40VAS0WCVVhQruZw++le//WDdhkXr9ShXI64n/G2Vl
        lmyXHcUGMUAdpctiTtVqPgE=
X-Google-Smtp-Source: ABdhPJybRVRbZKW+k0pll8kSQKQcG88gq4hZN4gdTvqyJf8ZShPtKVkF7ANLAo/j9ObnlmEnT3mYHg==
X-Received: by 2002:a05:6512:1315:: with SMTP id x21mr4050613lfu.511.1613038216661;
        Thu, 11 Feb 2021 02:10:16 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id p14sm870075lji.0.2021.02.11.02.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 02:10:16 -0800 (PST)
Date:   Thu, 11 Feb 2021 12:10:10 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [PATCH v8 0/6] Support ROHM BD9576MUF and BD9573MUF PMICs
Message-ID: <cover.1613031055.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

First of all, Sorry folks!

My memory is great - but short. I forgot to add the
Renesas list to all of the patches. Sending these separately to the
renesas list. Reason why the list is included is Geert. Well, Actually,
reason is that the BD9576 and BD9573 are intended to be used to power
R-Car SoCs. But Geert can be blamed anyways as he suggested me to add
this list ;)


Initial support for ROHM BD9576MUF and BD9573MUF PMICs.

These PMICs are primarily intended to be used to power the R-Car family
processors. BD9576MUF includes some additional safety features the
BD9573MUF does not have. This initial version of drivers provides
temperature, over voltage and under voltage warnings is IRQ information
is passed via DT.

This patch series includes MFD and watchdog drivers. Regulator part was
already applied.

This series brings in the IRQ support which will be utilized by the
regulator driver(s). The regulator part was splitted in own series as it
contains some changes to drivers which are not yet in other trees.

WDG supports
- Enabling and pinging the watchdog
- configuring watchog timeout / window from device-tree

Please note that not all of the boards are expected to be utilizing the
warning IRQs. Thus populating the IRQ information from DT is optional.

Changelog v8:
  - Drop regulator driver changes which are covered by the separate RFC series.
  - Renamed regulator driver cell. Regulator driver change will be
    brought in in the RFC series to avoid conflicts.
  - Add patch introducing register definitions required by the regulator RFC
    series.
  - Cleaned comments at MFD as was suggested by Lee
  - Do not abort MFD probe if IRQ information for BD9573 is populated
  - MFD driver/header styling

Changelog v7:
  - Added interrupt handling
  - Added notifications and error_flag getter to regulators

Changelog v6:
  - Fixed watchdog timeout

Changelog v5:
  - rebased on top of v5.10-rc2
  - few styling fixes in MFD as suggested by Lee

Changelog v4:
  - rebased on top of 5.10-rc1
  - Fix typo (repeated word maximum) from the DT binding doc

Changelog v3:
  - use only one binding to specify watchdog time-out window.

Changelog v2:
  - dropped already applied regulator part
  - dt_bindings: Fix case for regulator-names in the example
  - watchdod: unify probe error check and revise includes

---


Matti Vaittinen (6):
  dt_bindings: mfd: Add ROHM BD9576MUF and BD9573MUF PMICs
  mfd: Support ROHM BD9576MUF and BD9573MUF
  mfd: bd9576: Add IRQ support
  wdt: Support wdt on ROHM BD9576MUF and BD9573MUF
  MAINTAINERS: Add ROHM BD9576MUF and BD9573MUF drivers
  mfd: bd9576: Add safety limit/monitoring registers

 .../bindings/mfd/rohm,bd9576-pmic.yaml        | 123 ++++++++
 MAINTAINERS                                   |   4 +
 drivers/mfd/Kconfig                           |  11 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/rohm-bd9576.c                     | 187 +++++++++++
 drivers/watchdog/Kconfig                      |  13 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/bd9576_wdt.c                 | 291 ++++++++++++++++++
 include/linux/mfd/rohm-bd957x.h               | 140 +++++++++
 include/linux/mfd/rohm-generic.h              |   2 +
 10 files changed, 773 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
 create mode 100644 drivers/mfd/rohm-bd9576.c
 create mode 100644 drivers/watchdog/bd9576_wdt.c
 create mode 100644 include/linux/mfd/rohm-bd957x.h

-- 
2.25.4


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
