Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13E95318AEC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Feb 2021 13:41:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbhBKMi1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Feb 2021 07:38:27 -0500
Received: from mail-lj1-f173.google.com ([209.85.208.173]:40563 "EHLO
        mail-lj1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231731AbhBKMen (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Feb 2021 07:34:43 -0500
Received: by mail-lj1-f173.google.com with SMTP id s18so7146077ljg.7;
        Thu, 11 Feb 2021 04:34:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=Vfzvo58svu0cI4ektpdyAWp8bMlg9yHoVOYTB38z9Ac=;
        b=OLuZaeSGQxW636TorJxWplWt8D+FAFG7KVR7iWXrIM+8Qoky9cgn90zqaWtYSqBXiF
         +RGC1VFSt5mw1UdJNTXfjPH4XJV+62wPSilLpIM7z3x8Uwgob6tfaaYKqZdeYryPwHWr
         Xw56B+iafDiuLinwRmoJqOTt0IrSJ10QrASA2pdyUzQSyE6eoZkF2FmiTrJS9ShivSkB
         N6YxoJ2BCEdicbpGh2izIYiN+XewMKoAp2CzTf4dtajyzzntTdyLgBMv/s6/K8bs77aa
         QFyVFSsLp99Y9nVs6sfgbGKROyy2qOPureRQUbvlHGXu6UbMs0Xah7xi2ImSwAlss6Wl
         xcMw==
X-Gm-Message-State: AOAM533N6CLxlbke+7O77ie/+Ac3SVTXbyMbBVtTeUE+gmwZtUT8nSmo
        vnZbTuyTkUb1gitL8g6jvCY=
X-Google-Smtp-Source: ABdhPJzHrY+i8lXDbk3HhnSOBszJblF0GoFyWsjEXEiAT6oOCw77CztVBIUuVhV8buqRz4p4H9eXiQ==
X-Received: by 2002:a05:651c:1029:: with SMTP id w9mr5010944ljm.142.1613046840288;
        Thu, 11 Feb 2021 04:34:00 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id t13sm628114lfc.147.2021.02.11.04.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 04:33:59 -0800 (PST)
Date:   Thu, 11 Feb 2021 14:33:53 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     mazziesaccount@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [RFC PATCH 0/7] Extend regulator notification support
Message-ID: <cover.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Extend regulator notification support

This is an RFC series for getting feedback on extending the regulator
notification and error flag support. Initial discussion on the topic can
be found here:
https://lore.kernel.org/lkml/6046836e22b8252983f08d5621c35ececb97820d.camel@fi.rohmeurope.com/

This series is built on top of the:
commit 7aa382cfe714 ("regulator: mt6315: Add support for MT6315 regulator")
regulator tree for-5.12 branch + The BD9576MUF support patch series v8
which is not yet in-tree
Here:
https://lore.kernel.org/lkml/cover.1613031055.git.matti.vaittinen@fi.rohmeurope.com/

In a nutshell - the RFC adds:

1. WARNING level events/error flags. (Patch 2)
  Current regulator 'ERROR' event notifications for over/under
  voltage, over current and over temperature are used to indicate
  condition where monitored entity is so badly "off" that it actually
  indicates a hardware error which can not be recovered. The most
  typical hanling for that is believed to be a (graceful)
  system-shutdown. Here we add set of 'WARNING' level flags to allow
  sending notifications to consumers before things are 'that badly off'
  so that consumer drivers can implement recovery-actions.
2. Device-tree properties for specifying limit values. (Patches 1, 4)
  Add limits for above mentioned 'ERROR' and 'WARNING' levels (which
  send notifications to consumers) and also for a 'PROTECTION' level
  (which will be used to immediately shut-down the regulator(s) W/O
  informing consumer drivers. Typically implemented by hardware).
  Property parsing is implemented in regulator core which then calls
  callback operations for limit setting from the IC drivers. A
  warning is emitted if protection is requested by device tree but the
  underlying IC does not support configuring requested protection.
3. Helpers which can be registered by IC. (Patch 3)
  Target is to avoid implementing IRQ handling and IRQ storm protection
  in each IC driver. (Many of the ICs implementin these IRQs do not allow
  masking or acking the IRQ but keep the IRQ asserted for the whole
  duration of problem keeping the processor in IRQ handling loop).

The helper was attempted to be done so it could be used to implement
roughly same logic as is used in qcom-labibb regulator. This means
amongst other things a safety shut-down if IC registers are not readable.
Using these shut-down retry counters are optional. The idea is that the
helper could be also used by simpler ICs which do not provide status
register(s) which can be used to check if error is still active.

ICs which do not have such status register can simply omit the 'renable'
callback (and retry-counts etc) - and helper assumes the situation is Ok
and re-enables IRQ after given time period. If problem persists the
handler is ran again and another notification is sent - but at least the
delay allows processor to avoid IRQ loop.

Patch 6 takes this notification support in use at BD9576MUF.

--

Matti Vaittinen (7):
  dt_bindings: Add protection limit properties
  regulator: add warning flags
  regulator: IRQ based event/error notification helpers
  regulator: add property parsing and callbacks to set protection limits
  dt-bindings: regulator: bd9576 add FET ON-resistance for OCW
  regulator: bd9576: Support error reporting
  regulator: bd9576: Fix the driver name in id table

 .../bindings/regulator/regulator.yaml         |   82 ++
 .../regulator/rohm,bd9576-regulator.yaml      |    5 +
 drivers/regulator/Makefile                    |    2 +-
 drivers/regulator/bd9576-regulator.c          | 1030 ++++++++++++++---
 drivers/regulator/core.c                      |  146 ++-
 drivers/regulator/irq_helpers.c               |  396 +++++++
 drivers/regulator/of_regulator.c              |   58 +
 drivers/regulator/qcom-labibb-regulator.c     |   10 +-
 drivers/regulator/stpmic1_regulator.c         |   17 +-
 include/linux/regulator/consumer.h            |   14 +
 include/linux/regulator/driver.h              |  170 ++-
 include/linux/regulator/machine.h             |   26 +
 12 files changed, 1816 insertions(+), 140 deletions(-)
 create mode 100644 drivers/regulator/irq_helpers.c

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
