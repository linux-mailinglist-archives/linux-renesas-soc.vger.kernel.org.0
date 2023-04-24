Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F39F66ED02D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Apr 2023 16:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230500AbjDXOTO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Apr 2023 10:19:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230434AbjDXOTO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Apr 2023 10:19:14 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2201E5D
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Apr 2023 07:19:09 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-63b4960b015so3659556b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Apr 2023 07:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1682345948; x=1684937948;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HwvD7H4oIyYGvsQzNJZDI4I82AI2GwBZimaT5h5uJC4=;
        b=vQ8XoF/qeRwiYn1P+3nVYJWKL7UlPUtG2A5HHuYBTLgAQWEcApAxSHpIR4WO0z09aK
         tGyl6uZTeKz0BSMciro6oP5hYwx2ewzaEBwWg40y+u8CvIMgh09w5e3CKMbhEsDkeuo8
         BoZNYKXQ0f02N8bEeg9qKQ1d25aseHkm/EQTuRFDqU0loOg4RAJphLETM+hftizoM1Nj
         BXJ6cJq9ncMDBAG++LxNWZJaNhTy/9t95Qxjkk/rbG7OkBEMwcd6nfnOy3F2kFjgxkaR
         M/AokZ8MCt6rJBTXUnggotWOKKRxaMtQo1fYDQ2JkL2Q9TSGwncZAhhEhfPuelM72oH4
         Elpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682345948; x=1684937948;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HwvD7H4oIyYGvsQzNJZDI4I82AI2GwBZimaT5h5uJC4=;
        b=j3Q6e7D+YnSlFlFJt9eMrMUtolEHUmj5NZ4rA/RanwmBvQnMqFTpdqVA8+D8wSdj8P
         F2usOmnXvxuUuvb0xUs62I0UQ9AkFbiPeeR5ePxUhNMThDYQFAWUtdRnVhL5vMSq+NaW
         XfqQdt1NsbMwqc2beoqoemz9mdvKi27f7WpuMKmdxMZMEbs6SWH39wxrjp4JEn5vnyKs
         /8L22iCw4wMfkB/pmlRBycsBk9QuZQPAGIJlOqdVPhSd5C1quWf96DUzK1OV9WWeH2uq
         EU3h0osF6ABNEsjO3uEYlnWrEybFY0yLhO/7XPqdPMj9zXndj9+R73Hj9SGwWHP/Ogyj
         miWw==
X-Gm-Message-State: AC+VfDxpKWPcSO0Z7bIYyHt0pWVi0JEvYfEs5JLHzlupQGATPL9Swu9F
        3gl8UWe0gABk2qNIBIE/OvW+MA9Lp2E/euYyfauJNA==
X-Google-Smtp-Source: ACHHUZ5ZFS5lbYeMiadVqkhPx6CtEv30e6MpWe6Mf0KnCqR4/mcOTPTDjvEss4TnK6W/OwyzHh6j6w==
X-Received: by 2002:a05:6a00:84b:b0:640:defd:a6bd with SMTP id q11-20020a056a00084b00b00640defda6bdmr1942396pfk.12.1682345947650;
        Mon, 24 Apr 2023 07:19:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l4-20020a056a00140400b00622e01989cbsm7756324pfu.176.2023.04.24.07.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 07:19:07 -0700 (PDT)
Message-ID: <64468fdb.050a0220.8333c.e8f7@mx.google.com>
Date:   Mon, 24 Apr 2023 07:19:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-04-24-v6.3
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 374 runs,
 40 regressions (renesas-devel-2023-04-24-v6.3)
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

renesas/master baseline: 374 runs, 40 regressions (renesas-devel-2023-04-24=
-v6.3)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-04-24-v6.3/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-04-24-v6.3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      e5cb7b418f58d865520f56b1fb541616ee6f8754 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644654f4d81daca05f2e8663

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644654f4d81daca05f2e8668
        failing since 24 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:07:21.650456  <8>[   10.790272] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10101408_1.4.2.3.1>

    2023-04-24T10:07:21.653565  + set +x

    2023-04-24T10:07:21.759069  =


    2023-04-24T10:07:21.860649  / # #export SHELL=3D/bin/sh

    2023-04-24T10:07:21.861310  =


    2023-04-24T10:07:21.962670  / # export SHELL=3D/bin/sh. /lava-10101408/=
environment

    2023-04-24T10:07:21.963405  =


    2023-04-24T10:07:22.064896  / # . /lava-10101408/environment/lava-10101=
408/bin/lava-test-runner /lava-10101408/1

    2023-04-24T10:07:22.065944  =


    2023-04-24T10:07:22.071859  / # /lava-10101408/bin/lava-test-runner /la=
va-10101408/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64465749152e5a034f2e8662

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64465749152e5a034f2e8667
        failing since 24 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:17:20.957260  <8>[   10.507453] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10101668_1.4.2.3.1>

    2023-04-24T10:17:20.960664  + set +x

    2023-04-24T10:17:21.061870  #

    2023-04-24T10:17:21.062120  =


    2023-04-24T10:17:21.162679  / # #export SHELL=3D/bin/sh

    2023-04-24T10:17:21.162867  =


    2023-04-24T10:17:21.263371  / # export SHELL=3D/bin/sh. /lava-10101668/=
environment

    2023-04-24T10:17:21.263561  =


    2023-04-24T10:17:21.364087  / # . /lava-10101668/environment/lava-10101=
668/bin/lava-test-runner /lava-10101668/1

    2023-04-24T10:17:21.364365  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64465b6a5aaebbd52c2e85fd

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-=
collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-=
collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64465b6a5aaebbd52c2e8602
        failing since 24 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:35:05.380895  + set +x

    2023-04-24T10:35:05.387222  <8>[   12.873008] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10101943_1.4.2.3.1>

    2023-04-24T10:35:05.494683  / # #

    2023-04-24T10:35:05.595328  export SHELL=3D/bin/sh

    2023-04-24T10:35:05.595536  #

    2023-04-24T10:35:05.696064  / # export SHELL=3D/bin/sh. /lava-10101943/=
environment

    2023-04-24T10:35:05.696303  =


    2023-04-24T10:35:05.796851  / # . /lava-10101943/environment/lava-10101=
943/bin/lava-test-runner /lava-10101943/1

    2023-04-24T10:35:05.797111  =


    2023-04-24T10:35:05.803302  / # /lava-10101943/bin/lava-test-runner /la=
va-10101943/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644654dede5ae4d6162e85f8

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644654dede5ae4d6162e85fd
        failing since 24 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:07:17.460054  + set +x<8>[   12.189225] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10101434_1.4.2.3.1>

    2023-04-24T10:07:17.460188  =


    2023-04-24T10:07:17.565050  / # #

    2023-04-24T10:07:17.665868  export SHELL=3D/bin/sh

    2023-04-24T10:07:17.666147  #

    2023-04-24T10:07:17.766752  / # export SHELL=3D/bin/sh. /lava-10101434/=
environment

    2023-04-24T10:07:17.767027  =


    2023-04-24T10:07:17.867646  / # . /lava-10101434/environment/lava-10101=
434/bin/lava-test-runner /lava-10101434/1

    2023-04-24T10:07:17.868065  =


    2023-04-24T10:07:17.872801  / # /lava-10101434/bin/lava-test-runner /la=
va-10101434/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64465727cddfe222cd2e868d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64465727cddfe222cd2e8692
        failing since 24 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:16:52.145533  + set +x<8>[    8.954810] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10101638_1.4.2.3.1>

    2023-04-24T10:16:52.145967  =


    2023-04-24T10:16:52.253569  / # #

    2023-04-24T10:16:52.356366  export SHELL=3D/bin/sh

    2023-04-24T10:16:52.357084  #

    2023-04-24T10:16:52.458517  / # export SHELL=3D/bin/sh. /lava-10101638/=
environment

    2023-04-24T10:16:52.458723  =


    2023-04-24T10:16:52.559228  / # . /lava-10101638/environment/lava-10101=
638/bin/lava-test-runner /lava-10101638/1

    2023-04-24T10:16:52.559540  =


    2023-04-24T10:16:52.564927  / # /lava-10101638/bin/lava-test-runner /la=
va-10101638/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/64465b6560be4a43792e85e6

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-=
collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-=
collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64465b6560be4a43792e85eb
        failing since 24 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:34:54.612344  + set +x

    2023-04-24T10:34:54.619374  <8>[   15.460381] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10101914_1.4.2.3.1>

    2023-04-24T10:34:54.723857  / # #

    2023-04-24T10:34:54.824488  export SHELL=3D/bin/sh

    2023-04-24T10:34:54.824689  #

    2023-04-24T10:34:54.925178  / # export SHELL=3D/bin/sh. /lava-10101914/=
environment

    2023-04-24T10:34:54.925369  =


    2023-04-24T10:34:55.025884  / # . /lava-10101914/environment/lava-10101=
914/bin/lava-test-runner /lava-10101914/1

    2023-04-24T10:34:55.026192  =


    2023-04-24T10:34:55.030488  / # /lava-10101914/bin/lava-test-runner /la=
va-10101914/1
 =

    ... (12 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64465b6560be4a4=
3792e85ed
        failing since 13 days (last pass: renesas-devel-2023-04-04-v6.3-rc5=
, first fail: renesas-devel-2023-04-10-v6.3-rc6)
        3 lines

    2023-04-24T10:34:54.589035  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-04-24T10:34:54.595516  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-04-24T10:34:54.601980  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-04-24T10:34:54.608606  <8>[   15.443191] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644654cf8cf32651482e8625

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644654cf8cf32651482e862a
        failing since 24 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:06:53.897368  <8>[   10.480390] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10101392_1.4.2.3.1>

    2023-04-24T10:06:53.900966  + set +x

    2023-04-24T10:06:54.004254  =


    2023-04-24T10:06:54.106039  / # #export SHELL=3D/bin/sh

    2023-04-24T10:06:54.106751  =


    2023-04-24T10:06:54.208221  / # export SHELL=3D/bin/sh. /lava-10101392/=
environment

    2023-04-24T10:06:54.208900  =


    2023-04-24T10:06:54.310268  / # . /lava-10101392/environment/lava-10101=
392/bin/lava-test-runner /lava-10101392/1

    2023-04-24T10:06:54.311310  =


    2023-04-24T10:06:54.316316  / # /lava-10101392/bin/lava-test-runner /la=
va-10101392/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6446572cea1c45c7212e8635

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446572cea1c45c7212e863a
        failing since 24 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:16:58.153716  <8>[    7.817321] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10101624_1.4.2.3.1>

    2023-04-24T10:16:58.156778  + set +x

    2023-04-24T10:16:58.262398  =


    2023-04-24T10:16:58.364739  / # #export SHELL=3D/bin/sh

    2023-04-24T10:16:58.365576  =


    2023-04-24T10:16:58.467118  / # export SHELL=3D/bin/sh. /lava-10101624/=
environment

    2023-04-24T10:16:58.467930  =


    2023-04-24T10:16:58.569486  / # . /lava-10101624/environment/lava-10101=
624/bin/lava-test-runner /lava-10101624/1

    2023-04-24T10:16:58.570745  =


    2023-04-24T10:16:58.575777  / # /lava-10101624/bin/lava-test-runner /la=
va-10101624/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64465b745aaebbd52c2e8613

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-=
collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-=
collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64465b745aaebbd52c2e8618
        failing since 24 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:35:14.980625  <8>[    9.580073] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10101931_1.4.2.3.1>

    2023-04-24T10:35:14.984308  + set +x

    2023-04-24T10:35:15.086055  #

    2023-04-24T10:35:15.086351  =


    2023-04-24T10:35:15.186940  / # #export SHELL=3D/bin/sh

    2023-04-24T10:35:15.187248  =


    2023-04-24T10:35:15.287880  / # export SHELL=3D/bin/sh. /lava-10101931/=
environment

    2023-04-24T10:35:15.288160  =


    2023-04-24T10:35:15.388777  / # . /lava-10101931/environment/lava-10101=
931/bin/lava-test-runner /lava-10101931/1

    2023-04-24T10:35:15.389139  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6446592b8b8d88f4ec2e8613

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-c=
ollabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-c=
ollabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446592b8b8d88f4ec2e8=
614
        failing since 48 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644654dcde5ae4d6162e85eb

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644654dcde5ae4d6162e85f0
        failing since 24 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:07:08.004010  + set +x

    2023-04-24T10:07:08.010469  <8>[   10.526136] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10101441_1.4.2.3.1>

    2023-04-24T10:07:08.119048  / # #

    2023-04-24T10:07:08.221363  export SHELL=3D/bin/sh

    2023-04-24T10:07:08.222124  #

    2023-04-24T10:07:08.323481  / # export SHELL=3D/bin/sh. /lava-10101441/=
environment

    2023-04-24T10:07:08.324278  =


    2023-04-24T10:07:08.425695  / # . /lava-10101441/environment/lava-10101=
441/bin/lava-test-runner /lava-10101441/1

    2023-04-24T10:07:08.426853  =


    2023-04-24T10:07:08.431562  / # /lava-10101441/bin/lava-test-runner /la=
va-10101441/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64465747152e5a034f2e8641

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64465747152e5a034f2e8646
        failing since 24 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:17:28.479789  + set +x

    2023-04-24T10:17:28.485817  <8>[   10.581790] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10101641_1.4.2.3.1>

    2023-04-24T10:17:28.590134  / # #

    2023-04-24T10:17:28.690738  export SHELL=3D/bin/sh

    2023-04-24T10:17:28.691036  #

    2023-04-24T10:17:28.791684  / # export SHELL=3D/bin/sh. /lava-10101641/=
environment

    2023-04-24T10:17:28.791930  =


    2023-04-24T10:17:28.892537  / # . /lava-10101641/environment/lava-10101=
641/bin/lava-test-runner /lava-10101641/1

    2023-04-24T10:17:28.893621  =


    2023-04-24T10:17:28.898476  / # /lava-10101641/bin/lava-test-runner /la=
va-10101641/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64465d58fa9b2b31e72e8703

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-=
collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-=
collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64465d58fa9b2b31e72e8708
        failing since 24 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:43:13.862475  + set +x

    2023-04-24T10:43:13.869448  <8>[   15.220339] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10101944_1.4.2.3.1>

    2023-04-24T10:43:13.975326  / # #

    2023-04-24T10:43:14.075938  export SHELL=3D/bin/sh

    2023-04-24T10:43:14.076147  #

    2023-04-24T10:43:14.176644  / # export SHELL=3D/bin/sh. /lava-10101944/=
environment

    2023-04-24T10:43:14.176885  =


    2023-04-24T10:43:14.277440  / # . /lava-10101944/environment/lava-10101=
944/bin/lava-test-runner /lava-10101944/1

    2023-04-24T10:43:14.277852  =


    2023-04-24T10:43:14.282457  / # /lava-10101944/bin/lava-test-runner /la=
va-10101944/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64465729ea1c45c7212e8628

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64465729ea1c45c7212e862d
        failing since 21 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-04-03-v6.3-rc5)

    2023-04-24T10:16:50.724651  <8>[    7.941381] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10101630_1.4.2.3.1>

    2023-04-24T10:16:50.727995  + set +x

    2023-04-24T10:16:50.833421  #

    2023-04-24T10:16:50.834780  =


    2023-04-24T10:16:50.936651  / # #export SHELL=3D/bin/sh

    2023-04-24T10:16:50.937520  =


    2023-04-24T10:16:51.039068  / # export SHELL=3D/bin/sh. /lava-10101630/=
environment

    2023-04-24T10:16:51.039970  =


    2023-04-24T10:16:51.141832  / # . /lava-10101630/environment/lava-10101=
630/bin/lava-test-runner /lava-10101630/1

    2023-04-24T10:16:51.143095  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64465b4669467710052e869a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-=
collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-=
collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64465b4669467710052e869f
        failing since 24 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:34:34.632914  + set +x

    2023-04-24T10:34:34.639024  <8>[   13.789204] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10101923_1.4.2.3.1>

    2023-04-24T10:34:34.743618  / # #

    2023-04-24T10:34:34.844255  export SHELL=3D/bin/sh

    2023-04-24T10:34:34.844529  #

    2023-04-24T10:34:34.945093  / # export SHELL=3D/bin/sh. /lava-10101923/=
environment

    2023-04-24T10:34:34.945319  =


    2023-04-24T10:34:35.045882  / # . /lava-10101923/environment/lava-10101=
923/bin/lava-test-runner /lava-10101923/1

    2023-04-24T10:34:35.046202  =


    2023-04-24T10:34:35.051437  / # /lava-10101923/bin/lava-test-runner /la=
va-10101923/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644654de68c90ae3752e85f2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644654de68c90ae3752e85f7
        failing since 24 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:07:17.196126  + <8>[   10.938441] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10101394_1.4.2.3.1>

    2023-04-24T10:07:17.196211  set +x

    2023-04-24T10:07:17.300156  / # #

    2023-04-24T10:07:17.400865  export SHELL=3D/bin/sh

    2023-04-24T10:07:17.401032  #

    2023-04-24T10:07:17.501519  / # export SHELL=3D/bin/sh. /lava-10101394/=
environment

    2023-04-24T10:07:17.501690  =


    2023-04-24T10:07:17.602192  / # . /lava-10101394/environment/lava-10101=
394/bin/lava-test-runner /lava-10101394/1

    2023-04-24T10:07:17.602485  =


    2023-04-24T10:07:17.607198  / # /lava-10101394/bin/lava-test-runner /la=
va-10101394/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6446573494679df4fb2e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446573594679df4fb2e85eb
        failing since 24 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:17:12.410069  + <8>[   10.555224] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10101647_1.4.2.3.1>

    2023-04-24T10:17:12.410182  set +x

    2023-04-24T10:17:12.514719  / # #

    2023-04-24T10:17:12.615298  export SHELL=3D/bin/sh

    2023-04-24T10:17:12.615492  #

    2023-04-24T10:17:12.716006  / # export SHELL=3D/bin/sh. /lava-10101647/=
environment

    2023-04-24T10:17:12.716184  =


    2023-04-24T10:17:12.816677  / # . /lava-10101647/environment/lava-10101=
647/bin/lava-test-runner /lava-10101647/1

    2023-04-24T10:17:12.816934  =


    2023-04-24T10:17:12.821471  / # /lava-10101647/bin/lava-test-runner /la=
va-10101647/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64465b5ee9331ac1eb2e8663

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-=
collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-=
collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64465b5ee9331ac1eb2e8668
        failing since 24 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:34:55.129931  + set +x

    2023-04-24T10:34:55.136132  <8>[   14.317913] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10101946_1.4.2.3.1>

    2023-04-24T10:34:55.237663  =


    2023-04-24T10:34:55.338456  / # #export SHELL=3D/bin/sh

    2023-04-24T10:34:55.339233  =


    2023-04-24T10:34:55.440494  / # export SHELL=3D/bin/sh. /lava-10101946/=
environment

    2023-04-24T10:34:55.441184  =


    2023-04-24T10:34:55.542612  / # . /lava-10101946/environment/lava-10101=
946/bin/lava-test-runner /lava-10101946/1

    2023-04-24T10:34:55.543823  =


    2023-04-24T10:34:55.549034  / # /lava-10101946/bin/lava-test-runner /la=
va-10101946/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64465904066a9351602e85f3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-p=
engutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-p=
engutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64465904066a9351602e85f8
        failing since 83 days (last pass: v6.1-rc8-929-g112502470f50, first=
 fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-04-24T10:24:44.261469  + set +x
    2023-04-24T10:24:44.261648  [   12.851406] <LAVA_SIGNAL_ENDRUN 0_dmesg =
935558_1.5.2.3.1>
    2023-04-24T10:24:44.369244  / # #
    2023-04-24T10:24:44.471385  export SHELL=3D/bin/sh
    2023-04-24T10:24:44.471868  #
    2023-04-24T10:24:44.573055  / # export SHELL=3D/bin/sh. /lava-935558/en=
vironment
    2023-04-24T10:24:44.573510  =

    2023-04-24T10:24:44.674772  / # . /lava-935558/environment/lava-935558/=
bin/lava-test-runner /lava-935558/1
    2023-04-24T10:24:44.675600  =

    2023-04-24T10:24:44.678897  / # /lava-935558/bin/lava-test-runner /lava=
-935558/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64465954db31fc719b2e8627

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53=
-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53=
-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64465954db31fc719b2e862c
        failing since 83 days (last pass: v6.1-rc8-929-g112502470f50, first=
 fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-04-24T10:26:05.566013  + set +x
    2023-04-24T10:26:05.566212  [   13.097784] <LAVA_SIGNAL_ENDRUN 0_dmesg =
935564_1.5.2.3.1>
    2023-04-24T10:26:05.673391  / # #
    2023-04-24T10:26:05.775128  export SHELL=3D/bin/sh
    2023-04-24T10:26:05.775665  #
    2023-04-24T10:26:05.877138  / # export SHELL=3D/bin/sh. /lava-935564/en=
vironment
    2023-04-24T10:26:05.877646  =

    2023-04-24T10:26:05.979021  / # . /lava-935564/environment/lava-935564/=
bin/lava-test-runner /lava-935564/1
    2023-04-24T10:26:05.979850  =

    2023-04-24T10:26:05.982970  / # /lava-935564/bin/lava-test-runner /lava=
-935564/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/644659a4f7a91ca2622e85ef

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-i=
mx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-i=
mx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644659a4f7a91ca2622e85f4
        failing since 83 days (last pass: v6.1-rc8-929-g112502470f50, first=
 fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-04-24T10:27:25.003539  + set +x
    2023-04-24T10:27:25.003789  [   13.067515] <LAVA_SIGNAL_ENDRUN 0_dmesg =
935574_1.5.2.3.1>
    2023-04-24T10:27:25.110649  / # #
    2023-04-24T10:27:25.212367  export SHELL=3D/bin/sh
    2023-04-24T10:27:25.212854  #
    2023-04-24T10:27:25.314256  / # export SHELL=3D/bin/sh. /lava-935574/en=
vironment
    2023-04-24T10:27:25.314771  =

    2023-04-24T10:27:25.416076  / # . /lava-935574/environment/lava-935574/=
bin/lava-test-runner /lava-935574/1
    2023-04-24T10:27:25.416744  =

    2023-04-24T10:27:25.420538  / # /lava-935574/bin/lava-test-runner /lava=
-935574/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/644659e0057bf3ce132e8749

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix=
/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix=
/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644659e0057bf3ce132e874e
        failing since 83 days (last pass: v6.1-rc8-929-g112502470f50, first=
 fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-04-24T10:28:42.600629  + set +x
    2023-04-24T10:28:42.600792  [   12.239015] <LAVA_SIGNAL_ENDRUN 0_dmesg =
935577_1.5.2.3.1>
    2023-04-24T10:28:42.708086  / # #
    2023-04-24T10:28:42.809704  export SHELL=3D/bin/sh
    2023-04-24T10:28:42.810331  #
    2023-04-24T10:28:42.911776  / # export SHELL=3D/bin/sh. /lava-935577/en=
vironment
    2023-04-24T10:28:42.912292  =

    2023-04-24T10:28:43.013595  / # . /lava-935577/environment/lava-935577/=
bin/lava-test-runner /lava-935577/1
    2023-04-24T10:28:43.014272  =

    2023-04-24T10:28:43.017270  / # /lava-935577/bin/lava-test-runner /lava=
-935577/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644654d48cf32651482e8915

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644654d48cf32651482e891a
        failing since 24 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:06:54.067533  + set<8>[   11.738670] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10101395_1.4.2.3.1>

    2023-04-24T10:06:54.067645   +x

    2023-04-24T10:06:54.171692  / # #

    2023-04-24T10:06:54.272292  export SHELL=3D/bin/sh

    2023-04-24T10:06:54.272494  #

    2023-04-24T10:06:54.372992  / # export SHELL=3D/bin/sh. /lava-10101395/=
environment

    2023-04-24T10:06:54.373197  =


    2023-04-24T10:06:54.473712  / # . /lava-10101395/environment/lava-10101=
395/bin/lava-test-runner /lava-10101395/1

    2023-04-24T10:06:54.474003  =


    2023-04-24T10:06:54.478424  / # /lava-10101395/bin/lava-test-runner /la=
va-10101395/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64465732cddfe222cd2e86c0

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64465732cddfe222cd2e86c5
        failing since 24 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:17:04.403765  <8>[   11.803951] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10101677_1.4.2.3.1>

    2023-04-24T10:17:04.508436  / # #

    2023-04-24T10:17:04.609039  export SHELL=3D/bin/sh

    2023-04-24T10:17:04.609230  #

    2023-04-24T10:17:04.709748  / # export SHELL=3D/bin/sh. /lava-10101677/=
environment

    2023-04-24T10:17:04.709967  =


    2023-04-24T10:17:04.810461  / # . /lava-10101677/environment/lava-10101=
677/bin/lava-test-runner /lava-10101677/1

    2023-04-24T10:17:04.810791  =


    2023-04-24T10:17:04.815178  / # /lava-10101677/bin/lava-test-runner /la=
va-10101677/1

    2023-04-24T10:17:04.821353  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64465b4f09c57043cb2e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-=
collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-=
collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64465b4f09c57043cb2e85eb
        failing since 24 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:34:31.687346  + <8>[   13.432245] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10101938_1.4.2.3.1>

    2023-04-24T10:34:31.687455  set +x

    2023-04-24T10:34:31.791621  / # #

    2023-04-24T10:34:31.892269  export SHELL=3D/bin/sh

    2023-04-24T10:34:31.892466  #

    2023-04-24T10:34:31.992946  / # export SHELL=3D/bin/sh. /lava-10101938/=
environment

    2023-04-24T10:34:31.993156  =


    2023-04-24T10:34:32.093718  / # . /lava-10101938/environment/lava-10101=
938/bin/lava-test-runner /lava-10101938/1

    2023-04-24T10:34:32.094003  =


    2023-04-24T10:34:32.098016  / # /lava-10101938/bin/lava-test-runner /la=
va-10101938/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64465e686dd674f3552e8620

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-meso=
n-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-meso=
n-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64465e686dd674f3552e8=
621
        failing since 62 days (last pass: renesas-devel-2023-02-06-v6.2-rc7=
, first fail: renesas-devel-2023-02-20-v6.2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64465e50f2965eed132e85ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-=
gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-=
gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64465e50f2965eed132e8=
5ef
        failing since 62 days (last pass: renesas-devel-2023-02-06-v6.2-rc7=
, first fail: renesas-devel-2023-02-20-v6.2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/64465d1c490a0afdb62e86aa

  Results:     166 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseli=
ne-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseli=
ne-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/644=
65d1c490a0afdb62e86fa
        failing since 48 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-24T10:42:11.331147  /lava-10102116/1/../bin/lava-test-case

    2023-04-24T10:42:11.341303  <8>[   23.422923] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/test/ca=
se/id/64465d1c490a0afdb62e874c
        failing since 48 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-24T10:42:08.486742  /lava-10102116/1/../bin/lava-test-case

    2023-04-24T10:42:08.498025  <8>[   20.579279] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/test/c=
ase/id/64465d1c490a0afdb62e874d
        failing since 48 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-24T10:42:07.418578  <3>[   19.502978] Bluetooth: hci0: command =
0x0c14 tx timeout

    2023-04-24T10:42:07.426827  <3>[   19.502978] Bluetooth: hci0: Opcode 0=
x c14 failed: -110

    2023-04-24T10:42:07.456717  /lava-10102116/1/../bin/lava-test-case

    2023-04-24T10:42:07.466519  <8>[   19.547856] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/64465d34b43a64e4002e85f3

  Results:     177 PASS, 9 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabo=
ra/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabo=
ra/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/test/ca=
se/id/64465d34b43a64e4002e86a5
        failing since 48 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-24T10:42:27.418605  /lava-10102037/1/../bin/lava-test-case

    2023-04-24T10:42:27.425330  <8>[   20.951415] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/test/c=
ase/id/64465d34b43a64e4002e86a6
        failing since 48 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-24T10:42:26.399309  /lava-10102037/1/../bin/lava-test-case

    2023-04-24T10:42:26.405838  <8>[   19.931995] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/test/c=
ase/id/64465d34b43a64e4002e86a7
        failing since 48 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-24T10:42:25.379617  /lava-10102037/1/../bin/lava-test-case

    2023-04-24T10:42:25.386255  <8>[   18.912661] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64465692875588ee9b2e866f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20=
d-q7.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20=
d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64465692875588ee9b2e8=
670
        failing since 21 days (last pass: renesas-devel-2023-03-30-v6.3-rc4=
, first fail: renesas-devel-2023-04-03-v6.3-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64465bfb77e0358f912e865e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64465bfb77e0358f912e8=
65f
        failing since 111 days (last pass: renesas-devel-2022-12-12-v6.1, f=
irst fail: renesas-devel-2023-01-02-v6.2-rc2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64465a0805065bbc642e8624

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64465a0805065bbc642e8=
625
        failing since 111 days (last pass: renesas-devel-2022-12-12-v6.1, f=
irst fail: renesas-devel-2023-01-02-v6.2-rc2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64465dcd8585fa2a892e85ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk33=
99-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk33=
99-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64465dcd8585fa2a892e8=
5eb
        failing since 62 days (last pass: renesas-devel-2023-02-06-v6.2-rc7=
, first fail: renesas-devel-2023-02-20-v6.2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64465e0e578527f1482e8606

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i=
-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i=
-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64465e0e578527f1482e8=
607
        failing since 62 days (last pass: renesas-devel-2023-02-06-v6.2-rc7=
, first fail: renesas-devel-2023-02-20-v6.2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64465dfa578527f1482e85f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i=
-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i=
-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64465dfa578527f1482e8=
5f2
        failing since 48 days (last pass: renesas-devel-2023-02-06-v6.2-rc7=
, first fail: renesas-devel-2023-03-06-v6.3-rc1) =

 =20
