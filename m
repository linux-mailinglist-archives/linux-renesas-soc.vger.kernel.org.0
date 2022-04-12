Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1A2A4FDB7D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Apr 2022 12:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231666AbiDLKES (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Apr 2022 06:04:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387738AbiDLJJL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Apr 2022 05:09:11 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA95AF8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Apr 2022 01:22:30 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id z16so16865339pfh.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Apr 2022 01:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=X4Z32MVZgg6AYw1EOfZjAnsU3XPcNV7oDMYtotSG5Pw=;
        b=mTeCIu0RrWI4KgrpEsoxxnzHliDVTv/8hTJix8CnK0LDAFl7fieWAHXkGUcEBSJYgw
         BzDvgrtkP/4SoQD5YkQ9EG16tFEr7JfcCT1yNQek2ahnMXGaw/I0jHbWQVLMJjTZx+7g
         m8qfxhOmuZGsfVtnUoZU8vIx7O8jMbXHSLe8DDbM61gkDk1IS5kcSoxxfOS0s9Dwdh3n
         ZMOvK/aKCEntaihWGdZ+jJdE7bPdCx5vJmqeW7DKGwKpXCeYNSby+kXrINH+3Z2ShQxd
         0yX2KeKhkipYE82kx4LlZPLshnhe9nxtRs4jr1N05I/ILRNJcECkWkMtbE3cejEq+p2F
         fltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=X4Z32MVZgg6AYw1EOfZjAnsU3XPcNV7oDMYtotSG5Pw=;
        b=bvWk4FrZIU9Ykfq5g9sUzsD+aTNpxqhFPkLYn0i9GZpVT40/FIs+DIqYs4qO3ENQLn
         klkCqgbLIREGnHLdrYhlce+c3FijOMU1peiMDSxMfYyrI7+bc0uWoeaSPJkX9tSxrJsR
         fUtKuBGTUR9SkP052P0jC/6k6mhrzvc2BhB/VCXVLO/irfmyoEEwy58taJqIBElpF1zJ
         cgTEHRzNoMpjVUgfTg/DvNr6ngf/yED/9+hluQa4CUWcJVv218SyBLLH/W1ahxvljv4N
         hd5oi34NG9SYvRoK6KJUyoHyRgxKbant1ace1yN99Hw5TTZ48Vlr17H9DwLTKn5dAgUz
         cQqg==
X-Gm-Message-State: AOAM533bRNXTRLHzPdupWaZ0B5013Iyku1j1RUxXM/rrEsp+QWlgRylR
        fezAsmPFtB0sNJ8raGgeYbng7BAQTh83AAwG
X-Google-Smtp-Source: ABdhPJw0o8y0xiN+J6CrJ58Tn9+lem4vJAK+4KhFQnml8rrQaHYKZ+crOFE8UBwc5KLwjvrcSbtVJg==
X-Received: by 2002:a65:6051:0:b0:39d:1b00:e473 with SMTP id a17-20020a656051000000b0039d1b00e473mr12505414pgp.578.1649751750042;
        Tue, 12 Apr 2022 01:22:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z16-20020a637e10000000b00382b21c6b0bsm1997249pgc.51.2022.04.12.01.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 01:22:29 -0700 (PDT)
Message-ID: <625536c5.1c69fb81.8b511.5ea5@mx.google.com>
Date:   Tue, 12 Apr 2022 01:22:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-04-11-v5.18-rc2
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 315 runs,
 6 regressions (renesas-devel-2022-04-11-v5.18-rc2)
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

renesas/master baseline: 315 runs, 6 regressions (renesas-devel-2022-04-11-=
v5.18-rc2)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug            | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug            | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug            | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug            | 1          =

r8a77950-salvator-x        | arm64 | lab-baylibre  | gcc-10   | defconfig+i=
ma              | 1          =

rk3399-gru-kevin           | arm64 | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-04-11-v5.18-rc2/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-04-11-v5.18-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ea5bee24e7143e88663f6497f6f9defd9ae0f77a =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug            | 1          =


  Details:     https://kernelci.org/test/plan/id/6254f641ecd074f0e6ae0702

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-11-v5.18-rc2/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-11-v5.18-rc2/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6254f641ecd074f0e6ae0=
703
        failing since 56 days (last pass: renesas-devel-2022-02-08-v5.17-rc=
3, first fail: renesas-devel-2022-02-14-v5.17-rc4) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug            | 1          =


  Details:     https://kernelci.org/test/plan/id/6254f2a4b4e1b07f50ae067c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-11-v5.18-rc2/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-11-v5.18-rc2/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6254f2a4b4e1b07f50ae0=
67d
        failing since 56 days (last pass: renesas-devel-2022-02-08-v5.17-rc=
3, first fail: renesas-devel-2022-02-14-v5.17-rc4) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug            | 1          =


  Details:     https://kernelci.org/test/plan/id/6254f62d2614504751ae06a0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-11-v5.18-rc2/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-11-v5.18-rc2/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6254f62d2614504751ae0=
6a1
        failing since 56 days (last pass: renesas-devel-2022-02-08-v5.17-rc=
3, first fail: renesas-devel-2022-02-14-v5.17-rc4) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug            | 1          =


  Details:     https://kernelci.org/test/plan/id/6254f27b1a90c06793ae0703

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-11-v5.18-rc2/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-11-v5.18-rc2/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6254f27b1a90c06793ae0=
704
        failing since 56 days (last pass: renesas-devel-2022-02-08-v5.17-rc=
3, first fail: renesas-devel-2022-02-14-v5.17-rc4) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
r8a77950-salvator-x        | arm64 | lab-baylibre  | gcc-10   | defconfig+i=
ma              | 1          =


  Details:     https://kernelci.org/test/plan/id/6254fb9b53c0878a04ae06dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-11-v5.18-rc2/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a779=
50-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-11-v5.18-rc2/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a779=
50-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6254fb9b53c0878a04ae0=
6dd
        new failure (last pass: renesas-devel-2022-04-04-v5.18-rc1) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
rk3399-gru-kevin           | arm64 | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6254f2621a90c06793ae0689

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-11-v5.18-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-11-v5.18-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/6254f2621a90c06793ae06ab
        failing since 34 days (last pass: renesas-devel-2022-02-28-v5.17-rc=
6, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-04-12T03:30:16.002656  /lava-6069418/1/../bin/lava-test-case
    2022-04-12T03:30:16.013463  <8>[   35.620785] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
