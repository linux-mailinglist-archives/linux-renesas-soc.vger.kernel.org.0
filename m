Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89BD93551C8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Apr 2021 13:18:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241781AbhDFLSU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Apr 2021 07:18:20 -0400
Received: from mail-lf1-f48.google.com ([209.85.167.48]:39468 "EHLO
        mail-lf1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233034AbhDFLSU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Apr 2021 07:18:20 -0400
Received: by mail-lf1-f48.google.com with SMTP id b4so22095002lfi.6;
        Tue, 06 Apr 2021 04:18:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=fOH0QNUd5bq+px8fnNPfuKQrdVwby3/E/YtSvSbv3R0=;
        b=DV8iYXtdlFuYGG9KQzWUOqxdm9cMlv5f+nXRZzWK88iuH9eWoeGsaxLqotdvPpzp0O
         7MYDnJIslExoqvGyzAbR5nmWxLaSh9N5dpeQX5VYbLA5w1UYHeuiwKjTARD63WyKJLaF
         Sbu+0l/RjG8Gv7CwLZH/O967LnIVzoV1X61g8FBKpI85c2cJiAGV6OanrT9BuGw10r4m
         uCgZv644BVO5f/vvuzcI7fKnLG5uaXkKkRiKoZiAjw3LhTZ93R34UeIKmc6Fw9EfDde2
         3639iysyNB3iyhgwp/G/Ne4nZX2be5x2O9/qbLB8mvCI8V84qRANdpw0kA4Qupht4CAh
         kebw==
X-Gm-Message-State: AOAM531Yz87COfh+0z82iUbye7M8qynMtDDC9YssbULSFfvIa+P2zQuw
        ujNE2I5goFq19IaiA8nHr04=
X-Google-Smtp-Source: ABdhPJxaRMmR+59SVhi794cFaFZwCNC+6BOhXMWcjdeuPL3p/igeMdJgwFJRmfBs1GmFpqAXVIEW2g==
X-Received: by 2002:a05:6512:31cf:: with SMTP id j15mr20981571lfe.14.1617707891040;
        Tue, 06 Apr 2021 04:18:11 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id 3sm2123247lfq.1.2021.04.06.04.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 04:18:10 -0700 (PDT)
Date:   Tue, 6 Apr 2021 14:18:04 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 0/7] Extend regulator notification support
Message-ID: <cover.1617707724.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Extend regulator notification support

This series extends the regulator notification and error flag support. Initial
discussion on the topic can be found here:
https://lore.kernel.org/lkml/6046836e22b8252983f08d5621c35ececb97820d.camel@fi.rohmeurope.com/

This series is built on top of the BD9576MUF support patch series v9
which is currently in MFD tree at immutable branch ib-mfd-watchdog-5.13
https://lore.kernel.org/lkml/cover.1615219345.git.matti.vaittinen@fi.rohmeurope.com/
(The series should apply without those patches but there is compile time
dependency to definitions brought in at the last patch of the BD9576
series. This should be Ok though as there is a Kconfig dependency in
BD9576 regulator driver)

In a nutshell - the series adds:

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
Patch 7 is related to MFD change which is not really related to the RFC
here. It was added to this series in order to avoid potential conflicts.

Changelog v5:
   - Fix the badly formatted pr_emerg() call.
Changelog v4:
   - rebased on v5.12-rc6
   - dropped RFC
   - fix external FET DT-binding.
   - improve prints for cases when expecting HW failure.
   - styling and typos
Changelog v3:
  Regulator core:
   - Fix dangling pointer access at regulator_irq_helper()
  stpmic1_regulator:
   - fix function prototype (compile error)
  bd9576-regulator:
   - Update over current limits to what was given in new data-sheet
     (REV00K)
   - Allow over-current monitoring without external FET. Set limits to
     values given in data-sheet (REV00K).

Changelog v2:
  Generic:
  - rebase on v5.12-rc2 + BD9576 series
  - Split devm variant of delayed wq to own series
  Regulator framework:
  - Provide non devm variant of IRQ notification helpers
  - shorten dt-property names as suggested by Rob
  - unconditionally call map_event in IRQ handling and require it to be
    populated
  BD9576 regulators:
  - change the FET resistance property to micro-ohms
  - fix voltage computation in OC limit setting

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
 .../regulator/rohm,bd9576-regulator.yaml      |    6 +
 drivers/regulator/Makefile                    |    2 +-
 drivers/regulator/bd9576-regulator.c          | 1060 +++++++++++++++--
 drivers/regulator/core.c                      |  146 ++-
 drivers/regulator/irq_helpers.c               |  432 +++++++
 drivers/regulator/of_regulator.c              |   58 +
 drivers/regulator/qcom-labibb-regulator.c     |   10 +-
 drivers/regulator/qcom_spmi-regulator.c       |    6 +-
 drivers/regulator/stpmic1_regulator.c         |   20 +-
 include/linux/regulator/consumer.h            |   14 +
 include/linux/regulator/driver.h              |  176 ++-
 include/linux/regulator/machine.h             |   26 +
 13 files changed, 1896 insertions(+), 142 deletions(-)
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
