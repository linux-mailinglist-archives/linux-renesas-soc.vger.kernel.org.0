Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51F3E3D838C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jul 2021 00:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232198AbhG0W7o (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Jul 2021 18:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232314AbhG0W7n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Jul 2021 18:59:43 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF32C061757
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jul 2021 15:59:43 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id m2-20020a17090a71c2b0290175cf22899cso1515888pjs.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jul 2021 15:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=nFKmv6UyuBMb4jtdOm1hryrG68kc/0LB+ebf89CdlcU=;
        b=b0AcTTd8G0tAxjwBTx3o+fN2HejIF4QhqLkUEjUUjqCvhVPQKLgf6FQExssFgL+H2c
         hm+vwsC2qewEzI4/6c7zoq/1lligC9mpI/eHguRw3a5FXmbClFgAxHR0JJWWZGS5b/hQ
         j0o15SW4WbqRejmeaxEMeRD8ep5s7/n+oxn77s1gVhHQ9vO28MfE9PTieda54qNStXYb
         eLm0Hg5hUkKqXtB43k1ueL8IWerTMK6dT5N3x2kuCet1Puz6vEC1O9GbGPKvsMHwGJ4p
         G6OcLci4ZoyHfpzSigpejPzGWcJMkEVWhUff6crE0m74GIH7y3hNv1TBmcjwWJAyQiSL
         teyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=nFKmv6UyuBMb4jtdOm1hryrG68kc/0LB+ebf89CdlcU=;
        b=Bio4kUzBy1OD9289gKWBKv5MVrpsg3L0CoHzYY/uDiYEePUT+08pYaTi4rsVPz+SJP
         VF6Sz8pOSLqd8qylfln+7Mt8McEvB2Zhe6+d0+aVNxStMxWmxtz0AMqd6e8dxnRumTy8
         Nu6xGWRqiP5LO9vKhJtSHSLqF4T1yHKhacaFJUx7j7fDFoyK8mWvE0sLZYBX4MvktYkY
         gQD+VX2LkHu9fJYuKa2te70mh2p6PpZEjY3TAMEAUz6VKVuSovdUpefc4HHN/XZPPevB
         E9Rdu+yZo+HoD+YSnWScgd70i0RKFKas5pzvACYPsSk4ITlbAlR1Bvoovwnms0IDJtmC
         i5ew==
X-Gm-Message-State: AOAM531DfwxmNMrS5Ui2eS9aZ0wLcL7B6JUbdgSANPOYlBwNKQ/cRZqT
        VF/JyhaasxbWcXVNEP07zlJSK60PLhEZpEYE
X-Google-Smtp-Source: ABdhPJyX8bpVdbSs54LzCylWDXufcaOzSbPlknPNOc1uKiIzjHB9ys//A3s2IWNnCZQ3dHHR5+gqqA==
X-Received: by 2002:a17:902:ce86:b029:12b:b41b:2e68 with SMTP id f6-20020a170902ce86b029012bb41b2e68mr20488961plg.1.1627426782615;
        Tue, 27 Jul 2021 15:59:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p25sm4582042pff.120.2021.07.27.15.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 15:59:42 -0700 (PDT)
Message-ID: <61008fde.1c69fb81.14b99.f57b@mx.google.com>
Date:   Tue, 27 Jul 2021 15:59:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-07-27-v5.14-rc1
Subject: renesas/next cros-ec: 5 runs,
 1 regressions (renesas-next-2021-07-27-v5.14-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next cros-ec: 5 runs, 1 regressions (renesas-next-2021-07-27-v5.14-=
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
s-next-2021-07-27-v5.14-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-07-27-v5.14-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b1f6bead1fb4976611429f459a1865daadedbb48

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


  Details:     https://kernelci.org/test/plan/id/6100791709b236f04c5018c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora=
/cros-ec-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora=
/cros-ec-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-cros=
-ec/20210722.0/amd64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/6100791709b236f04c5018=
c3
        failing since 13 days (last pass: v5.14-rc1-17-gcd117793e1ac, first=
 fail: renesas-next-2021-07-13-v5.14-rc1) =

 =20
