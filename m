Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B05E6518278
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 May 2022 12:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234205AbiECKqV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 May 2022 06:46:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232740AbiECKqU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 May 2022 06:46:20 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A36C27CE1
        for <linux-renesas-soc@vger.kernel.org>; Tue,  3 May 2022 03:42:47 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id n8so14622224plh.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 May 2022 03:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Ix4pDrWMn39OWGDOlkQcYnjmi7kt4H8DZFeAKq9Sv1U=;
        b=UNpd0URPWBzVx19k6X4qX6kJq707LJc8C2UVdP8Vjs+MKU/FYqmZ5RN+4Bh2raxKYX
         ZkVPz3LRVETagQvNtyH2ixYmx6DM/mue6kARFqhrxoP6E4qE7OiNGXIDRpZ+jzpwE5xD
         Hs9Feno6KL3jM9nuZwLsce3KG0MIIjMAdWWMsr1pVB0ncrlJAg5AcISnRkxucMY3Jlsn
         4NJqiu8XKxSPLOg+QzIUt94sfJRuYH1BBPqEKqmvWZ3/SPZZh/hjIJMNuPwGYnK6N4W3
         DswLXX6qkhW+jCQiGwPiRWfl+ZCRhRc9+kHvEIwf5HTXRuOI9hkUyZd5RLqrtcZZZVt9
         T1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Ix4pDrWMn39OWGDOlkQcYnjmi7kt4H8DZFeAKq9Sv1U=;
        b=LaOFze5JG58mO+sp4myUDUqzV6SJ7C8YNeSPwSohwY7dPMpEJ3U9bdlDvNOyvzXQx1
         A+1lqQtCMHIGd/yuoqzEPrQ0NtBqgjS4EP9HWqFKO30MZqjcU5qL/ZfpHLFHlerA57zR
         skRfcMvRGmWrrwjTmLEFZOJ3kMqFK9HST/yXPgm+ahKMuvg8ljQH3rR0qhlgCLvzJyrx
         W5NhnApAsHYD9FSdiTA/g1Mv23KKZgKVO+2O87F+X48cUF2ziH4ac7fIPyKJxD3qewFz
         rUQNVetgXOsHo99tA2EOVxA7NxrlhYk9s0+16KoNrLlEuvDDHo/CGPA3JU5V8moC+Fwj
         hI8w==
X-Gm-Message-State: AOAM531MpSLP1vug6gzOKAybsL4p3PxmcZToo1HD3N7uxwOY0CuN4Y/R
        291A0CeT08jvD7CdlkXTvmvTO6sj1iiApf74zKQ=
X-Google-Smtp-Source: ABdhPJxNgeF+Cqf5jkUbEu2Xhku02JFAGOsOjbBArgoFs/fwx6r6cG9tL4MbZYoqxHrhUfLhkvtZCw==
X-Received: by 2002:a17:90b:384b:b0:1d2:df41:3213 with SMTP id nl11-20020a17090b384b00b001d2df413213mr4006785pjb.164.1651574566872;
        Tue, 03 May 2022 03:42:46 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t13-20020a17090340cd00b0015e8d4eb1c4sm5972607pld.14.2022.05.03.03.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 03:42:46 -0700 (PDT)
Message-ID: <62710726.1c69fb81.3097f.e732@mx.google.com>
Date:   Tue, 03 May 2022 03:42:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2022-05-02-v5.18-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 440 runs,
 5 regressions (renesas-devel-2022-05-02-v5.18-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 440 runs, 5 regressions (renesas-devel-2022-05-02-=
v5.18-rc5)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
am57xx-beagle-x15          | arm   | lab-baylibre  | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =

jetson-tk1                 | arm   | lab-baylibre  | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug              | 1          =

rk3399-gru-kevin           | arm64 | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-05-02-v5.18-rc5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-05-02-v5.18-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      838711889c2bcb04dfefc610d665ce457c28d274 =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
am57xx-beagle-x15          | arm   | lab-baylibre  | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6270d97990c531e2f9dc7b5a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-02-v5.18-rc5/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseli=
ne-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-02-v5.18-rc5/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseli=
ne-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6270d97990c531e2f9dc7=
b5b
        failing since 3 days (last pass: renesas-devel-2022-04-13-v5.18-rc2=
, first fail: renesas-devel-2022-04-29-v5.18-rc4) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
jetson-tk1                 | arm   | lab-baylibre  | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6270d66cbcc214ea3bdc7b22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-02-v5.18-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-02-v5.18-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6270d66cbcc214ea3bdc7=
b23
        failing since 3 days (last pass: renesas-devel-2022-04-13-v5.18-rc2=
, first fail: renesas-devel-2022-04-29-v5.18-rc4) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6270dfb430f084e846dc7b28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-02-v5.18-rc5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-02-v5.18-rc5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6270dfb430f084e846dc7=
b29
        failing since 77 days (last pass: renesas-devel-2022-02-08-v5.17-rc=
3, first fail: renesas-devel-2022-02-14-v5.17-rc4) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6270da7e1601f23903dc7b43

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-02-v5.18-rc5/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-02-v5.18-rc5/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6270da7e1601f23903dc7=
b44
        failing since 77 days (last pass: renesas-devel-2022-02-08-v5.17-rc=
3, first fail: renesas-devel-2022-02-14-v5.17-rc4) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
rk3399-gru-kevin           | arm64 | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6270d43a18d05904e3dc7b54

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-02-v5.18-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-02-v5.18-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/6270d43a18d05904e3dc7b7a
        failing since 55 days (last pass: renesas-devel-2022-02-28-v5.17-rc=
6, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-05-03T07:05:20.136035  <8>[   34.205418] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-05-03T07:05:21.162302  /lava-6245289/1/../bin/lava-test-case   =

 =20
