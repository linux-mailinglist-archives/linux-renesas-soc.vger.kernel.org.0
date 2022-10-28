Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15A0961166E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Oct 2022 17:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229678AbiJ1P4Z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Oct 2022 11:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbiJ1P4Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Oct 2022 11:56:24 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCD531FAE5D
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Oct 2022 08:56:23 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id v28so4937330pfi.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Oct 2022 08:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CnmQVfYnqSn4drzkl9v2kbwjQVJIUfiLe27JwHmEREA=;
        b=ptxcQTms2rrqffZuUSh16p1qBcVh6pnEGnEvIgMlm4v+ZGXEvuWqs15/1H2qqwbbgF
         F0KaJO1a9cOXoMl2dwjHQh7cxAZRBZX/VKSlx4MvcKfIfW7vzu6BAHF+/Us1yauchxd5
         v6l62T3fEGpzd5uFGQnIAPFKWvFdt0lXrIYq9X0/nYb1u3X4h/Aa+PyxOYjLHlOGFa4W
         r6ilkQZSsxyLUsa3wl6jqMQ6gbvwXOyLWGtkBDsr5w5HV9gMr8IKtknmcKp+RBAc01FU
         FYFBc0K5avI8OvYTGhFFFsBF/Cydc0O/YRc3SJ7mgr90H5Stvy5jjob0YMTMkLGLr1Xy
         UFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CnmQVfYnqSn4drzkl9v2kbwjQVJIUfiLe27JwHmEREA=;
        b=JTBvIz04+GxKGG8QzpA/odjVvgfuB7gUA8z6v3Deyrk6wRtVDx9yGRhXQtW6zzK+F3
         qGtXjk6R04mYj44MFxDmKN7d4qboSiD7LpD9NmwJPv6nHZPnl/uDodmSfyhr5VJvrxZj
         GRBplyzPcI/BXcZqxd1PXQG8LHjPvnOu7CwXU0tHbuG7kTFmm5vddtZJIfdS8pNKNo2A
         Yqyfec+HHFHkzpPlz7ThOVHnv8CTDmmYXJkTzS8vXVed/KCfIaNx+K3b9NRw0Be2SGrI
         ij73LfLt66Afaw4B4u/QdSZqT2BkN/hOFTl8J3KrRovbHrUEGReHzKQCi964jB/P9aGE
         98cg==
X-Gm-Message-State: ACrzQf1g/Zl8c4B3NT6RQIlQdCvOYf2G77B1QVzroKpuMXSgyj5RlORU
        +ON95xaI1J6up85nuTY4WYIdUcr7LIUvo/jE
X-Google-Smtp-Source: AMsMyM4EvH4Vko1Oelp4qzUp2UysCu7Kmri76dOyIp2IupxJWspVFAJ6hmsnxkill0BSP3NGDs/x8Q==
X-Received: by 2002:a63:87c7:0:b0:46b:3cf1:e163 with SMTP id i190-20020a6387c7000000b0046b3cf1e163mr213183pge.112.1666972583171;
        Fri, 28 Oct 2022 08:56:23 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k5-20020aa79d05000000b0056c3a0dc65fsm3047755pfp.71.2022.10.28.08.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 08:56:22 -0700 (PDT)
Message-ID: <635bfba6.a70a0220.2acdb.6262@mx.google.com>
Date:   Fri, 28 Oct 2022 08:56:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-10-28-v6.1-rc2
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master cros-ec: 8 runs,
 4 regressions (renesas-devel-2022-10-28-v6.1-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master cros-ec: 8 runs, 4 regressions (renesas-devel-2022-10-28-v6.=
1-rc2)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-10-28-v6.1-rc2/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-10-28-v6.1-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      e3ee6a5b11b04ae5efa890cdfe9c94b77e36f136

  Test suite revisions:
    cros-ec-tests
      URL:  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/cros-ec-tests.git
      SHA:  86181a7fbd379fc42314c450740d2cea8cdf04c1 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/635be875e53c08c355e7db51

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-28-v6.1-rc2/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-28-v6.1-rc2/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221024.1/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
5be875e53c08c355e7db62
        failing since 73 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
35be875e53c08c355e7db64
        failing since 73 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-10-28T14:34:09.754095  / # =

    2022-10-28T14:34:09.758667  =

    2022-10-28T14:34:09.860393  / # #
    2022-10-28T14:34:09.865479  #
    2022-10-28T14:34:09.966077  / # export SHELL=3D/bin/sh
    2022-10-28T14:34:09.970765  export SHELL=3D/bin/sh
    2022-10-28T14:34:10.071745  / # . /lava-7760512/environment
    2022-10-28T14:34:10.076799  . /lava-7760512/environment
    2022-10-28T14:34:10.177792  / # /lava-7760512/bin/lava-test-runner /lav=
a-7760512/0
    2022-10-28T14:34:10.182800  /lava-7760512/bin/lava-test-runner /lava-77=
60512/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/635be9d531c0e0e0ffe7db63

  Results:     4 PASS, 2 FAIL, 10 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-28-v6.1-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-28-v6.1-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221024.1/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
5be9d531c0e0e0ffe7db71
        failing since 73 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
35be9d531c0e0e0ffe7db73
        failing since 73 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-10-28T14:40:10.226996  / # =

    2022-10-28T14:40:10.228954  =

    2022-10-28T14:40:10.332424  / ##
    2022-10-28T14:40:10.334164   #
    2022-10-28T14:40:10.436911  / #export SHELL=3D/bin/sh
    2022-10-28T14:40:10.440649   export SHELL=3D/bin/sh
    2022-10-28T14:40:10.544878  / # . /lava-7760795/environment
    2022-10-28T14:40:10.546939  . /lava-7760795/environment
    2022-10-28T14:40:10.650319  / # /lava-7760795/bin/lava-test-runner /lav=
a-7760795/0
    2022-10-28T14:40:10.650832  /lava-7760795/bin/lava-test-runner /lava-77=
60795/0<6>[   31.186147] mwifiex_pcie 0000:01:00.0: info: FW download over,=
 size 638992 bytes =

    ... (8 line(s) more)  =

 =20
