Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4522F3CEF07
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jul 2021 00:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234342AbhGSVXT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Jul 2021 17:23:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382011AbhGSSHQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jul 2021 14:07:16 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E32EC0613DC
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jul 2021 11:33:23 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id e14so7294501plh.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jul 2021 11:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=h8kV8kt34ZPshv6RxaGqNJErbZHGPV15Q6EpZYM3tXE=;
        b=OhcF/Q+P+AdOrK8oC1S9Zq+v/s74U+7M3b8V3FixbuZGCpqGHMcgvKhEbqM9CJCVme
         xD/k7yP49mtsk1N/m6x/smzBEGV3M9v8Yqp75GsfNUYsMN7bSWTDJyedn0OFcWom5F+3
         nSD1vkl34uqdbBavmx/07YttG8C1nTTrjUxcu7X3NiRm3PgTilctQsxg9XHKpuEPp3WY
         N/OZRqn0KAQMJO3yevJBI/x/i8KeZLJjwJfpukGujvlcNl9m2MK4IRFXKGAvSU+pu08v
         kE+QWDYGWVNY3l3Uc8g00mA4re4+zTz2n8AwxwzCA2KF0M/X5CcpHkl8Cy95pLHAn29V
         nRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=h8kV8kt34ZPshv6RxaGqNJErbZHGPV15Q6EpZYM3tXE=;
        b=a4O/TuOTyf0bbN5YDnvzRyoTH5M+Kh3N48UUWnhfkdAecUBSoQIQCF+tEAASOy902Q
         m2EZpVYwJX13zTxQCsoBk+3kMbQrOvxmsKfMWmqgX6lHobfPcmS9CqTLOEWGRjZMyg/q
         XNc+rZo6jSCEBJrX87Uy4ncMqinTwb1fvRKR8HuO7AxFTECKibmAg4pxuZFRUmvdzN/N
         9QF5i3zt/0p4tmTPp4w+SjET95AEdEFvbxKj0MFt3duUGlSf7/Z+TklP0lVjT65O1Hgl
         DMVPM9mWe+JYWgfK6UubwV0Y8WZ1ccS0+6wVCC81pghXmLM9ld1AcOSg+3ZEucON4Ymz
         X8Fw==
X-Gm-Message-State: AOAM530EcUTsxEdkh+0lTs/pMyR1vSOB26GoTxDaai36d6I+dLg+G7KX
        MlswB5wKOnwrA4Ltw/mjGZ7GdZLYNMrEsGJ6
X-Google-Smtp-Source: ABdhPJya2XbvdWWJw4gv7Ipj7wLIECOg/ewi6Ui1xcxc8GNL6fml8wtoz4fOr9kMpDqOUML0mr9UBw==
X-Received: by 2002:a17:90b:1482:: with SMTP id js2mr31482237pjb.85.1626720338949;
        Mon, 19 Jul 2021 11:45:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y187sm20553010pfb.185.2021.07.19.11.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 11:45:38 -0700 (PDT)
Message-ID: <60f5c852.1c69fb81.eb107.cb4e@mx.google.com>
Date:   Mon, 19 Jul 2021 11:45:38 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-07-19-v5.14-rc1
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next cros-ec: 7 runs,
 1 regressions (renesas-next-2021-07-19-v5.14-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next cros-ec: 7 runs, 1 regressions (renesas-next-2021-07-19-v5.14-=
rc1)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
asus-C523NA-A20057-coral | x86_64 | lab-collabora | gcc-8    | x86_64_defco=
n...6-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-07-19-v5.14-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-07-19-v5.14-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2a022240886d918d1f09a50b86a4065256caac42

  Test suite revisions:
    cros-ec-tests
      URL:  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/cros-ec-tests.git
      SHA:  e4c91962f6e19466c1e43629a2c6cd04ff012e06 =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
asus-C523NA-A20057-coral | x86_64 | lab-collabora | gcc-8    | x86_64_defco=
n...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/60f5b30cf989ecb8be1160a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-19-v5.14-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora=
/cros-ec-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-19-v5.14-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora=
/cros-ec-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-cros=
-ec/20210709.0/amd64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/60f5b30cf989ecb8be1160=
a7
        failing since 5 days (last pass: v5.14-rc1-17-gcd117793e1ac, first =
fail: renesas-next-2021-07-13-v5.14-rc1) =

 =20
