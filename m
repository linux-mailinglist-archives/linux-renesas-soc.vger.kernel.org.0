Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E5A770C1F2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 May 2023 17:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231314AbjEVPHT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 May 2023 11:07:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233803AbjEVPHS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 May 2023 11:07:18 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD67FC6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 May 2023 08:07:13 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2533a03388dso4164527a91.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 May 2023 08:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1684768033; x=1687360033;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nkCg4wg6+ctNveap/id64j4EfOsXpxoMT+OvEN7RdWc=;
        b=zhbVNSUMh9nC7n3uTs06WRa5nermC9wp9cWxevbqU/fpjSRKMl1H7WHENSaVRTejhF
         FIobIMo6ZV3xTD01jO9RD8bgPq1uwZM93ti/CxUE5+e1lhHQ8xppfFBensdtmwQtgyqj
         D0xUdeZvmY5DVc6slumguUvlBcIkqH7CSwbJRmrDgqPJhMaI82jSgF2u/5k8OwshkANb
         S7mdHVTxENu7cp290OzPApsmJDTGfcT84EJTfpM9c5tTFhM1tSPqVNK9XoWc9OVBCh91
         NeKBXhMQaeJFNEHx+oIdVN+a1pPkBSNpRVDeErlCiliumP5bmfXNNCYwpN9p/F68woNg
         Xu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684768033; x=1687360033;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nkCg4wg6+ctNveap/id64j4EfOsXpxoMT+OvEN7RdWc=;
        b=a1KG3C0I7ORpavTGvQVNOoMHZJcS4SJMd6+HUlKOiK2QpJfs8tF3HdqQdqlVCNFQrQ
         JrlpFzyruzgEBCujwr1sCJVmnWpOPcYjwoesLulo8oKHDAmRPg8lSyY9Up0G+1TESQuY
         q6vAqZBU5IkUZZ6h02wcXLxWO0E2gq5qnDj99TvZzdTcaInuslQs5Y6koJH/juk0ANZz
         tGqucW9ipwStZiqUCvOnH3yf7wjOWxj7aovy/9ADXluk1FbokoD4XTuEB4hkwHA2cTir
         l8P6a+o2qAlQFteERHKP+4iM0lghi9nm5zIWSd9DwVMnwXhobXgofmZUWlKJ68IH+Na5
         E6NA==
X-Gm-Message-State: AC+VfDx5QheSn50SnATX9HGFGj2FzdS/nf9iKe0njuT8O8dKmgxignNA
        4r7tDdlh+s+wjqcWRGlt8sC2/Y8ffjiEpykJxcY7aA==
X-Google-Smtp-Source: ACHHUZ4hEFk2L8ZflVSmB6VMT5XsVqrATtCyl6kmfgA7knoq9rVqIREzxts7AaWJXexdAms6+HzhzQ==
X-Received: by 2002:a17:90a:6309:b0:24d:f1a5:e279 with SMTP id e9-20020a17090a630900b0024df1a5e279mr10157999pjj.12.1684768031266;
        Mon, 22 May 2023 08:07:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ei3-20020a17090ae54300b002528588560fsm4272767pjb.13.2023.05.22.08.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 08:07:10 -0700 (PDT)
Message-ID: <646b851e.170a0220.e9221.6601@mx.google.com>
Date:   Mon, 22 May 2023 08:07:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-05-22-v6.4-rc3
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 430 runs,
 55 regressions (renesas-devel-2023-05-22-v6.4-rc3)
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

renesas/master baseline: 430 runs, 55 regressions (renesas-devel-2023-05-22=
-v6.4-rc3)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+ima       | 2          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 2          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 2          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-05-22-v6.4-rc3/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-05-22-v6.4-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      44b93b667d845927e0168aa763b3a14e93b21a66 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4c762e6c0d74062e8626

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646b4c762e6c0d74062e862b
        failing since 52 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:05:17.187400  + set +x<8>[   14.264342] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10409280_1.4.2.3.1>

    2023-05-22T11:05:17.188056  =


    2023-05-22T11:05:17.295677  / # #

    2023-05-22T11:05:17.398434  export SHELL=3D/bin/sh

    2023-05-22T11:05:17.399219  #

    2023-05-22T11:05:17.500864  / # export SHELL=3D/bin/sh. /lava-10409280/=
environment

    2023-05-22T11:05:17.501618  =


    2023-05-22T11:05:17.603323  / # . /lava-10409280/environment/lava-10409=
280/bin/lava-test-runner /lava-10409280/1

    2023-05-22T11:05:17.604662  =


    2023-05-22T11:05:17.609861  / # /lava-10409280/bin/lava-test-runner /la=
va-10409280/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4ca5bceab040012e85fd

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646b4ca5bceab040012e8602
        failing since 52 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:05:55.374426  + set +x

    2023-05-22T11:05:55.381143  <8>[   10.509184] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10409337_1.4.2.3.1>

    2023-05-22T11:05:55.482866  #

    2023-05-22T11:05:55.583725  / # #export SHELL=3D/bin/sh

    2023-05-22T11:05:55.583954  =


    2023-05-22T11:05:55.684493  / # export SHELL=3D/bin/sh. /lava-10409337/=
environment

    2023-05-22T11:05:55.684711  =


    2023-05-22T11:05:55.785295  / # . /lava-10409337/environment/lava-10409=
337/bin/lava-test-runner /lava-10409337/1

    2023-05-22T11:05:55.785609  =


    2023-05-22T11:05:55.825708  / # /lava-10409337/bin/lava-test-runner /la=
va-10409337/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4db883d0b8a30b2e8609

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646b4db883d0b8a30b2e860e
        failing since 52 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:10:33.823003  <8>[   10.593866] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10409496_1.4.2.3.1>

    2023-05-22T11:10:33.826002  + set +x

    2023-05-22T11:10:33.927178  #

    2023-05-22T11:10:33.927477  =


    2023-05-22T11:10:34.028112  / # #export SHELL=3D/bin/sh

    2023-05-22T11:10:34.028289  =


    2023-05-22T11:10:34.128817  / # export SHELL=3D/bin/sh. /lava-10409496/=
environment

    2023-05-22T11:10:34.129026  =


    2023-05-22T11:10:34.229534  / # . /lava-10409496/environment/lava-10409=
496/bin/lava-test-runner /lava-10409496/1

    2023-05-22T11:10:34.229824  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/646b4c772cb07313162e85f3

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646b4c772cb07313162e85f8
        failing since 52 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:05:10.287400  + set +x

    2023-05-22T11:05:10.293867  <8>[   14.904593] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10409305_1.4.2.3.1>

    2023-05-22T11:05:10.403463  / # #

    2023-05-22T11:05:10.506100  export SHELL=3D/bin/sh

    2023-05-22T11:05:10.506928  #

    2023-05-22T11:05:10.608541  / # export SHELL=3D/bin/sh. /lava-10409305/=
environment

    2023-05-22T11:05:10.609335  =


    2023-05-22T11:05:10.710861  / # . /lava-10409305/environment/lava-10409=
305/bin/lava-test-runner /lava-10409305/1

    2023-05-22T11:05:10.711225  =


    2023-05-22T11:05:10.715748  / # /lava-10409305/bin/lava-test-runner /la=
va-10409305/1
 =

    ... (12 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646b4c772cb0731=
3162e85fa
        failing since 42 days (last pass: renesas-devel-2023-04-04-v6.3-rc5=
, first fail: renesas-devel-2023-04-10-v6.3-rc6)
        3 lines

    2023-05-22T11:05:10.263682  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-05-22T11:05:10.270535  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-05-22T11:05:10.277329  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-05-22T11:05:10.283621  <8>[   14.887940] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4ca0ffe12f316f2e8624

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646b4ca0ffe12f316f2e8629
        failing since 52 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:05:50.562034  + <8>[    9.574190] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10409335_1.4.2.3.1>

    2023-05-22T11:05:50.562194  set +x

    2023-05-22T11:05:50.667314  / # #

    2023-05-22T11:05:50.768233  export SHELL=3D/bin/sh

    2023-05-22T11:05:50.768555  #

    2023-05-22T11:05:50.869219  / # export SHELL=3D/bin/sh. /lava-10409335/=
environment

    2023-05-22T11:05:50.869534  =


    2023-05-22T11:05:50.970213  / # . /lava-10409335/environment/lava-10409=
335/bin/lava-test-runner /lava-10409335/1

    2023-05-22T11:05:50.970685  =


    2023-05-22T11:05:50.975104  / # /lava-10409335/bin/lava-test-runner /la=
va-10409335/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4daa0b2487d7902e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646b4daa0b2487d7902e85eb
        failing since 52 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:10:22.776455  + set<8>[    8.886165] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10409423_1.4.2.3.1>

    2023-05-22T11:10:22.776566   +x

    2023-05-22T11:10:22.880667  / # #

    2023-05-22T11:10:22.981227  export SHELL=3D/bin/sh

    2023-05-22T11:10:22.981392  #

    2023-05-22T11:10:23.081942  / # export SHELL=3D/bin/sh. /lava-10409423/=
environment

    2023-05-22T11:10:23.082101  =


    2023-05-22T11:10:23.182614  / # . /lava-10409423/environment/lava-10409=
423/bin/lava-test-runner /lava-10409423/1

    2023-05-22T11:10:23.182850  =


    2023-05-22T11:10:23.187372  / # /lava-10409423/bin/lava-test-runner /la=
va-10409423/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4c7d2e6c0d74062e865b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646b4c7d2e6c0d74062e8660
        failing since 52 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:05:23.485545  <8>[   12.744273] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10409319_1.4.2.3.1>

    2023-05-22T11:05:23.489032  + set +x

    2023-05-22T11:05:23.590239  #

    2023-05-22T11:05:23.590495  =


    2023-05-22T11:05:23.691095  / # #export SHELL=3D/bin/sh

    2023-05-22T11:05:23.691307  =


    2023-05-22T11:05:23.791805  / # export SHELL=3D/bin/sh. /lava-10409319/=
environment

    2023-05-22T11:05:23.791966  =


    2023-05-22T11:05:23.892433  / # . /lava-10409319/environment/lava-10409=
319/bin/lava-test-runner /lava-10409319/1

    2023-05-22T11:05:23.892675  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4cbae0e6fa88262e85ff

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646b4cbae0e6fa88262e8604
        failing since 52 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:06:15.192481  <8>[   11.309015] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10409330_1.4.2.3.1>

    2023-05-22T11:06:15.195961  + set +x

    2023-05-22T11:06:15.297559  =


    2023-05-22T11:06:15.398123  / # #export SHELL=3D/bin/sh

    2023-05-22T11:06:15.398325  =


    2023-05-22T11:06:15.498845  / # export SHELL=3D/bin/sh. /lava-10409330/=
environment

    2023-05-22T11:06:15.499071  =


    2023-05-22T11:06:15.599613  / # . /lava-10409330/environment/lava-10409=
330/bin/lava-test-runner /lava-10409330/1

    2023-05-22T11:06:15.599861  =


    2023-05-22T11:06:15.604756  / # /lava-10409330/bin/lava-test-runner /la=
va-10409330/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4db983d0b8a30b2e861f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646b4db983d0b8a30b2e8624
        failing since 52 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:10:26.135578  <8>[    9.989174] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10409437_1.4.2.3.1>

    2023-05-22T11:10:26.139011  + set +x

    2023-05-22T11:10:26.243783  #

    2023-05-22T11:10:26.244965  =


    2023-05-22T11:10:26.346637  / # #export SHELL=3D/bin/sh

    2023-05-22T11:10:26.347293  =


    2023-05-22T11:10:26.448601  / # export SHELL=3D/bin/sh. /lava-10409437/=
environment

    2023-05-22T11:10:26.449289  =


    2023-05-22T11:10:26.550656  / # . /lava-10409437/environment/lava-10409=
437/bin/lava-test-runner /lava-10409437/1

    2023-05-22T11:10:26.552097  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4df150c2db2adf2e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646b4df150c2db2adf2e8=
5e8
        failing since 76 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4c64eaf8bb39b02e863c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646b4c64eaf8bb39b02e8641
        failing since 52 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:05:00.882238  + set +x

    2023-05-22T11:05:00.889044  <8>[   17.121229] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10409318_1.4.2.3.1>

    2023-05-22T11:05:00.995572  / # #

    2023-05-22T11:05:01.096220  export SHELL=3D/bin/sh

    2023-05-22T11:05:01.096455  #

    2023-05-22T11:05:01.196987  / # export SHELL=3D/bin/sh. /lava-10409318/=
environment

    2023-05-22T11:05:01.197218  =


    2023-05-22T11:05:01.297861  / # . /lava-10409318/environment/lava-10409=
318/bin/lava-test-runner /lava-10409318/1

    2023-05-22T11:05:01.298222  =


    2023-05-22T11:05:01.302564  / # /lava-10409318/bin/lava-test-runner /la=
va-10409318/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4ca26d29ab80572e85fc

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646b4ca26d29ab80572e8601
        failing since 52 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:05:59.819902  + set +x

    2023-05-22T11:05:59.826302  <8>[    8.061834] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10409366_1.4.2.3.1>

    2023-05-22T11:05:59.930657  / # #

    2023-05-22T11:06:00.031339  export SHELL=3D/bin/sh

    2023-05-22T11:06:00.031528  #

    2023-05-22T11:06:00.132036  / # export SHELL=3D/bin/sh. /lava-10409366/=
environment

    2023-05-22T11:06:00.132274  =


    2023-05-22T11:06:00.232797  / # . /lava-10409366/environment/lava-10409=
366/bin/lava-test-runner /lava-10409366/1

    2023-05-22T11:06:00.233122  =


    2023-05-22T11:06:00.238354  / # /lava-10409366/bin/lava-test-runner /la=
va-10409366/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4dac0b2487d7902e85f3

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646b4dac0b2487d7902e85f8
        failing since 52 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:10:26.957238  + set +x

    2023-05-22T11:10:26.963985  <8>[   10.812652] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10409466_1.4.2.3.1>

    2023-05-22T11:10:27.068021  / # #

    2023-05-22T11:10:27.168631  export SHELL=3D/bin/sh

    2023-05-22T11:10:27.168820  #

    2023-05-22T11:10:27.269359  / # export SHELL=3D/bin/sh. /lava-10409466/=
environment

    2023-05-22T11:10:27.269619  =


    2023-05-22T11:10:27.370237  / # . /lava-10409466/environment/lava-10409=
466/bin/lava-test-runner /lava-10409466/1

    2023-05-22T11:10:27.370590  =


    2023-05-22T11:10:27.374934  / # /lava-10409466/bin/lava-test-runner /la=
va-10409466/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4c61cdac36489a2e8601

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646b4c61cdac36489a2e8606
        failing since 52 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:04:53.311445  + set +x

    2023-05-22T11:04:53.317576  <8>[   14.219333] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10409269_1.4.2.3.1>

    2023-05-22T11:04:53.422006  / # #

    2023-05-22T11:04:53.522570  export SHELL=3D/bin/sh

    2023-05-22T11:04:53.522789  #

    2023-05-22T11:04:53.623308  / # export SHELL=3D/bin/sh. /lava-10409269/=
environment

    2023-05-22T11:04:53.623523  =


    2023-05-22T11:04:53.724062  / # . /lava-10409269/environment/lava-10409=
269/bin/lava-test-runner /lava-10409269/1

    2023-05-22T11:04:53.724421  =


    2023-05-22T11:04:53.729823  / # /lava-10409269/bin/lava-test-runner /la=
va-10409269/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4cb4fcf6a8eeae2e85f2

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646b4cb4fcf6a8eeae2e85f7
        failing since 52 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:06:06.268863  + set +x

    2023-05-22T11:06:06.276012  <8>[   10.048979] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10409355_1.4.2.3.1>

    2023-05-22T11:06:06.377770  #

    2023-05-22T11:06:06.378083  =


    2023-05-22T11:06:06.478633  / # #export SHELL=3D/bin/sh

    2023-05-22T11:06:06.478860  =


    2023-05-22T11:06:06.579395  / # export SHELL=3D/bin/sh. /lava-10409355/=
environment

    2023-05-22T11:06:06.579635  =


    2023-05-22T11:06:06.680133  / # . /lava-10409355/environment/lava-10409=
355/bin/lava-test-runner /lava-10409355/1

    2023-05-22T11:06:06.680431  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4da6b7771c728f2e8625

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646b4da6b7771c728f2e862a
        failing since 49 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-04-03-v6.3-rc5)

    2023-05-22T11:10:18.339761  <8>[   10.387937] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10409452_1.4.2.3.1>

    2023-05-22T11:10:18.342727  + set +x

    2023-05-22T11:10:18.448041  =


    2023-05-22T11:10:18.549639  / # #export SHELL=3D/bin/sh

    2023-05-22T11:10:18.550338  =


    2023-05-22T11:10:18.651644  / # export SHELL=3D/bin/sh. /lava-10409452/=
environment

    2023-05-22T11:10:18.652259  =


    2023-05-22T11:10:18.753551  / # . /lava-10409452/environment/lava-10409=
452/bin/lava-test-runner /lava-10409452/1

    2023-05-22T11:10:18.754796  =


    2023-05-22T11:10:18.760140  / # /lava-10409452/bin/lava-test-runner /la=
va-10409452/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4c7e2e6c0d74062e8666

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646b4c7e2e6c0d74062e866b
        failing since 52 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:05:20.487320  + set +x

    2023-05-22T11:05:20.493861  <8>[   13.812164] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10409286_1.4.2.3.1>

    2023-05-22T11:05:20.598040  / # #

    2023-05-22T11:05:20.698654  export SHELL=3D/bin/sh

    2023-05-22T11:05:20.698867  #

    2023-05-22T11:05:20.799409  / # export SHELL=3D/bin/sh. /lava-10409286/=
environment

    2023-05-22T11:05:20.799611  =


    2023-05-22T11:05:20.900098  / # . /lava-10409286/environment/lava-10409=
286/bin/lava-test-runner /lava-10409286/1

    2023-05-22T11:05:20.900415  =


    2023-05-22T11:05:20.905084  / # /lava-10409286/bin/lava-test-runner /la=
va-10409286/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4cb3ca038a63162e864e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646b4cb3ca038a63162e8653
        failing since 52 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:06:04.583560  + set<8>[   11.477988] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10409344_1.4.2.3.1>

    2023-05-22T11:06:04.583644   +x

    2023-05-22T11:06:04.687979  / # #

    2023-05-22T11:06:04.788575  export SHELL=3D/bin/sh

    2023-05-22T11:06:04.788747  #

    2023-05-22T11:06:04.889266  / # export SHELL=3D/bin/sh. /lava-10409344/=
environment

    2023-05-22T11:06:04.889438  =


    2023-05-22T11:06:04.989980  / # . /lava-10409344/environment/lava-10409=
344/bin/lava-test-runner /lava-10409344/1

    2023-05-22T11:06:04.990246  =


    2023-05-22T11:06:04.995106  / # /lava-10409344/bin/lava-test-runner /la=
va-10409344/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4dbeffc78f5d3a2e85f1

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646b4dbeffc78f5d3a2e85f6
        failing since 52 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:10:36.126536  + <8>[   11.300619] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10409438_1.4.2.3.1>

    2023-05-22T11:10:36.126625  set +x

    2023-05-22T11:10:36.230424  / # #

    2023-05-22T11:10:36.331197  export SHELL=3D/bin/sh

    2023-05-22T11:10:36.331446  #

    2023-05-22T11:10:36.432052  / # export SHELL=3D/bin/sh. /lava-10409438/=
environment

    2023-05-22T11:10:36.432304  =


    2023-05-22T11:10:36.532982  / # . /lava-10409438/environment/lava-10409=
438/bin/lava-test-runner /lava-10409438/1

    2023-05-22T11:10:36.533367  =


    2023-05-22T11:10:36.538025  / # /lava-10409438/bin/lava-test-runner /la=
va-10409438/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4aa1e69a3d62c62e8628

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-i=
mx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-i=
mx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646b4aa1e69a3d62c62e862d
        failing since 111 days (last pass: v6.1-rc8-929-g112502470f50, firs=
t fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-05-22T10:57:14.029919  + set +x
    2023-05-22T10:57:14.030274  [   13.158932] <LAVA_SIGNAL_ENDRUN 0_dmesg =
956118_1.5.2.3.1>
    2023-05-22T10:57:14.138288  / # #
    2023-05-22T10:57:14.239773  export SHELL=3D/bin/sh
    2023-05-22T10:57:14.240066  #
    2023-05-22T10:57:14.341226  / # export SHELL=3D/bin/sh. /lava-956118/en=
vironment
    2023-05-22T10:57:14.341767  =

    2023-05-22T10:57:14.443066  / # . /lava-956118/environment/lava-956118/=
bin/lava-test-runner /lava-956118/1
    2023-05-22T10:57:14.443584  =

    2023-05-22T10:57:14.447217  / # /lava-956118/bin/lava-test-runner /lava=
-956118/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4d33bc575620072e868a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646b4d33bc575620072e868f
        failing since 111 days (last pass: v6.1-rc8-929-g112502470f50, firs=
t fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-05-22T11:08:21.180293  + set +x
    2023-05-22T11:08:21.180672  [   12.866728] <LAVA_SIGNAL_ENDRUN 0_dmesg =
956129_1.5.2.3.1>
    2023-05-22T11:08:21.289097  / # #
    2023-05-22T11:08:21.391288  export SHELL=3D/bin/sh
    2023-05-22T11:08:21.391929  #
    2023-05-22T11:08:21.493533  / # export SHELL=3D/bin/sh. /lava-956129/en=
vironment
    2023-05-22T11:08:21.494164  =

    2023-05-22T11:08:21.595718  / # . /lava-956129/environment/lava-956129/=
bin/lava-test-runner /lava-956129/1
    2023-05-22T11:08:21.596405  =

    2023-05-22T11:08:21.600068  / # /lava-956129/bin/lava-test-runner /lava=
-956129/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4e5e9989bd49572e861e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646b4e5e9989bd49572e8623
        failing since 111 days (last pass: v6.1-rc8-929-g112502470f50, firs=
t fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-05-22T11:13:18.785132  + set +x
    2023-05-22T11:13:18.785296  [   14.427439] <LAVA_SIGNAL_ENDRUN 0_dmesg =
956139_1.5.2.3.1>
    2023-05-22T11:13:18.892649  / # #
    2023-05-22T11:13:18.994528  export SHELL=3D/bin/sh
    2023-05-22T11:13:18.995007  #
    2023-05-22T11:13:19.096162  / # export SHELL=3D/bin/sh. /lava-956139/en=
vironment
    2023-05-22T11:13:19.096548  =

    2023-05-22T11:13:19.197780  / # . /lava-956139/environment/lava-956139/=
bin/lava-test-runner /lava-956139/1
    2023-05-22T11:13:19.198425  =

    2023-05-22T11:13:19.201702  / # /lava-956139/bin/lava-test-runner /lava=
-956139/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4eb1a6855658922e85f9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646b4eb1a6855658922e85fe
        failing since 111 days (last pass: v6.1-rc8-929-g112502470f50, firs=
t fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-05-22T11:14:31.739508  + set +x
    2023-05-22T11:14:31.739666  [   12.127846] <LAVA_SIGNAL_ENDRUN 0_dmesg =
956150_1.5.2.3.1>
    2023-05-22T11:14:31.846591  / # #
    2023-05-22T11:14:31.948104  export SHELL=3D/bin/sh
    2023-05-22T11:14:31.948534  #
    2023-05-22T11:14:32.049854  / # export SHELL=3D/bin/sh. /lava-956150/en=
vironment
    2023-05-22T11:14:32.050308  =

    2023-05-22T11:14:32.151556  / # . /lava-956150/environment/lava-956150/=
bin/lava-test-runner /lava-956150/1
    2023-05-22T11:14:32.152138  =

    2023-05-22T11:14:32.155564  / # /lava-956150/bin/lava-test-runner /lava=
-956150/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4fee2ee2a6a5ef2e892f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646b4fee2ee2a6a5ef2e8934
        failing since 111 days (last pass: v6.1-rc8-929-g112502470f50, firs=
t fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-05-22T11:19:50.676972  + set +x
    2023-05-22T11:19:50.677232  [   13.120290] <LAVA_SIGNAL_ENDRUN 0_dmesg =
956158_1.5.2.3.1>
    2023-05-22T11:19:50.783941  / # #
    2023-05-22T11:19:50.885551  export SHELL=3D/bin/sh
    2023-05-22T11:19:50.886046  #
    2023-05-22T11:19:50.987379  / # export SHELL=3D/bin/sh. /lava-956158/en=
vironment
    2023-05-22T11:19:50.987939  =

    2023-05-22T11:19:51.089232  / # . /lava-956158/environment/lava-956158/=
bin/lava-test-runner /lava-956158/1
    2023-05-22T11:19:51.089827  =

    2023-05-22T11:19:51.093157  / # /lava-956158/bin/lava-test-runner /lava=
-956158/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+ima       | 2          =


  Details:     https://kernelci.org/test/plan/id/646b5f9d46387f456b2e85e6

  Results:     29 PASS, 4 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/multi_v7_defconfig+ima/gcc-10/lab-broonie/baseline-i=
mx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/multi_v7_defconfig+ima/gcc-10/lab-broonie/baseline-i=
mx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/64=
6b5f9d46387f456b2e8605
        new failure (last pass: renesas-devel-2023-04-24-v6.3)

    2023-05-22T12:27:02.900371  /lava-494073/1/../bin/lava-test-case
    2023-05-22T12:27:02.929709  <8>[   24.204127] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =


  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/646b5f9d4=
6387f456b2e8606
        new failure (last pass: renesas-devel-2023-04-24-v6.3)

    2023-05-22T12:27:03.951958  /lava-494073/1/../bin/lava-test-case
    2023-05-22T12:27:03.980942  <8>[   25.256214] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4c652e6c0d74062e8604

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646b4c652e6c0d74062e8609
        failing since 52 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:04:56.176669  + set +x

    2023-05-22T11:04:56.180253  <8>[   14.169869] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10409316_1.4.2.3.1>

    2023-05-22T11:04:56.286088  / # #

    2023-05-22T11:04:56.386786  export SHELL=3D/bin/sh

    2023-05-22T11:04:56.386983  #

    2023-05-22T11:04:56.487489  / # export SHELL=3D/bin/sh. /lava-10409316/=
environment

    2023-05-22T11:04:56.487714  =


    2023-05-22T11:04:56.588267  / # . /lava-10409316/environment/lava-10409=
316/bin/lava-test-runner /lava-10409316/1

    2023-05-22T11:04:56.588569  =


    2023-05-22T11:04:56.593234  / # /lava-10409316/bin/lava-test-runner /la=
va-10409316/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4c9dffe12f316f2e8617

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646b4c9dffe12f316f2e861c
        failing since 52 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:05:47.648648  <8>[   11.435817] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10409331_1.4.2.3.1>

    2023-05-22T11:05:47.753116  / # #

    2023-05-22T11:05:47.853760  export SHELL=3D/bin/sh

    2023-05-22T11:05:47.853976  #

    2023-05-22T11:05:47.954460  / # export SHELL=3D/bin/sh. /lava-10409331/=
environment

    2023-05-22T11:05:47.954667  =


    2023-05-22T11:05:48.055179  / # . /lava-10409331/environment/lava-10409=
331/bin/lava-test-runner /lava-10409331/1

    2023-05-22T11:05:48.055493  =


    2023-05-22T11:05:48.059865  / # /lava-10409331/bin/lava-test-runner /la=
va-10409331/1

    2023-05-22T11:05:48.066509  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4da56bbbe376de2e869e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646b4da56bbbe376de2e86a3
        failing since 52 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:10:20.101863  + set +x<8>[   10.783375] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10409476_1.4.2.3.1>

    2023-05-22T11:10:20.101970  =


    2023-05-22T11:10:20.206109  / # #

    2023-05-22T11:10:20.306758  export SHELL=3D/bin/sh

    2023-05-22T11:10:20.307059  #

    2023-05-22T11:10:20.407666  / # export SHELL=3D/bin/sh. /lava-10409476/=
environment

    2023-05-22T11:10:20.407887  =


    2023-05-22T11:10:20.508452  / # . /lava-10409476/environment/lava-10409=
476/bin/lava-test-runner /lava-10409476/1

    2023-05-22T11:10:20.508792  =


    2023-05-22T11:10:20.513580  / # /lava-10409476/bin/lava-test-runner /la=
va-10409476/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4c7a88d26bea332e85f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646b4c7a88d26bea332e8=
5fa
        failing since 12 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/646b53cf43188fcd7e2e8616

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646b53cf43188fcd7e2e8=
617
        failing since 97 days (last pass: renesas-devel-2023-01-30-v6.2-rc6=
, first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/646b55117c4f20fd0b2e8603

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646b55117c4f20fd0b2e8=
604
        failing since 12 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4c8e8e0d1f0c952e860f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646b4c8e8e0d1f0c952e8=
610
        failing since 12 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/646b5312d82fc09c6a2e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646b5312d82fc09c6a2e8=
5e7
        failing since 97 days (last pass: renesas-devel-2023-02-06-v6.2-rc7=
, first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/646b54293a47cdb15e2e85f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646b54293a47cdb15e2e8=
5f4
        failing since 12 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4aa1d391cca6e62e8609

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-i=
wg20d-q7.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-i=
wg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646b4aa1d391cca6e62e8=
60a
        failing since 49 days (last pass: renesas-devel-2023-03-30-v6.3-rc4=
, first fail: renesas-devel-2023-04-03-v6.3-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4d151017c3b0a42e867d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646b4d151017c3b0a42e8=
67e
        failing since 139 days (last pass: renesas-devel-2022-12-12-v6.1, f=
irst fail: renesas-devel-2023-01-02-v6.2-rc2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4c11bfa8a2144b2e8659

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646b4c11bfa8a2144b2e8=
65a
        failing since 139 days (last pass: renesas-devel-2022-12-12-v6.1, f=
irst fail: renesas-devel-2023-01-02-v6.2-rc2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 2          =


  Details:     https://kernelci.org/test/plan/id/646b4ba350a7defd0e2e8773

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646b4ba350a7def=
d0e2e87ca
        failing since 12 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1)
        2 lines

    2023-05-22T11:01:21.543098  fo:

    2023-05-22T11:01:21.547541  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-22T11:01:21.553608  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-22T11:01:21.556497  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-22T11:01:21.559782  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-22T11:01:21.565260  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-22T11:01:21.568687  kern  :alert : Data abort info:

    2023-05-22T11:01:21.573394  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-22T11:01:21.583815  kern  :<8>[   19.538194] <LAVA_SIGNAL_TESTC=
ASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/646b4ba350a7def=
d0e2e87cb
        failing since 12 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1)
        12 lines

    2023-05-22T11:01:21.495441  <8>[   19.450396] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>

    2023-05-22T11:01:21.530081  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-22T11:01:21.542498  kern  :alert : Mem abort in<8>[   19.491459=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/646b545cbe8eed85a62e8690

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646b545cbe8eed8=
5a62e86e7
        failing since 12 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1)
        2 lines

    2023-05-22T11:38:41.821781  fo:

    2023-05-22T11:38:41.826236  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-22T11:38:41.831742  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-22T11:38:41.834989  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-22T11:38:41.839090  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-22T11:38:41.844432  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-22T11:38:41.847039  kern  :alert : Data abort info:

    2023-05-22T11:38:41.851696  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-22T11:38:41.855330  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-05-22T11:38:41.868075  kern  :alert : user pgtable: 4k pages<8>[  =
 18.371217] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/646b545cbe8eed8=
5a62e86e8
        failing since 12 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1)
        12 lines

    2023-05-22T11:38:41.768309  <8>[   18.274763] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>

    2023-05-22T11:38:41.808865  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-22T11:38:41.821248  kern  :alert : Mem abort in<8>[   18.322614=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/646b55257c4f20fd0b2e8623

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646b55257c4f20fd0b2e8=
624
        failing since 97 days (last pass: renesas-devel-2023-02-06-v6.2-rc7=
, first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/646b4b40550ef855a32e86ea

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-roc=
k-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-roc=
k-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646b4b40550ef85=
5a32e86f1
        new failure (last pass: renesas-devel-2023-04-17-v6.3-rc7)
        2 lines

    2023-05-22T10:59:56.567724  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-22T10:59:56.567984  kern  :emerg : Code: 97fc2110 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-22T10:59:56.568190  <8>[   21.692313] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-22T10:59:56.568382  + set +x

    2023-05-22T10:59:56.568570  <8>[   21.694377] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10409210_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/646b4b40550ef85=
5a32e86f2
        new failure (last pass: renesas-devel-2023-04-17-v6.3-rc7)
        12 lines

    2023-05-22T10:59:56.539634  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-22T10:59:56.539750  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-05-22T10:59:56.539841  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D000000007933a000

    2023-05-22T10:59:56.539928  kern  :alert : [0000000000000008] pgd=3D080=
000007934f003, p4d=3D080000007934f003, pud=3D080000007934e003, pmd=3D000000=
0000000000

    2023-05-22T10:59:56.540013  <8>[   21.666489] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/646b4dce521998261c2e8626

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-r=
k3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-r=
k3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646b4dce5219982=
61c2e862d
        new failure (last pass: renesas-devel-2023-04-24-v6.3)
        2 lines

    2023-05-22T11:10:58.117739  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-22T11:10:58.118273  kern  :emerg : Code: 97fb0110 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-22T11:10:58.118616  <8>[   23.928067] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-22T11:10:58.118939  + set +x

    2023-05-22T11:10:58.119244  <8>[   23.930016] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10409414_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/646b4dce5219982=
61c2e862e
        new failure (last pass: renesas-devel-2023-04-24-v6.3)
        12 lines

    2023-05-22T11:10:58.072320  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-22T11:10:58.072855  kern  :alert : Mem abort info:

    2023-05-22T11:10:58.073197  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-22T11:10:58.073551  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-22T11:10:58.073861  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-22T11:10:58.074163  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-22T11:10:58.074457  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-22T11:10:58.074745  kern  :alert : Data abort info:

    2023-05-22T11:10:58.075027  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-22T11:10:58.075308  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/646b51f2af03d2a4662e860d

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-col=
labora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-col=
labora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646b51f2af03d2a=
4662e8614
        new failure (last pass: renesas-devel-2023-04-24-v6.3)
        2 lines

    2023-05-22T11:28:40.396448  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-22T11:28:40.396969  kern  :emerg : Code: 97fe2110 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-22T11:28:40.397314  <8>[   20.640008] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-22T11:28:40.397683  + set +x

    2023-05-22T11:28:40.397995  <8>[   20.642039] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10409669_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/646b51f2af03d2a=
4662e8615
        new failure (last pass: renesas-devel-2023-04-24-v6.3)
        12 lines

    2023-05-22T11:28:40.350286  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-22T11:28:40.350810  kern  :alert : Mem abort info:

    2023-05-22T11:28:40.351154  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-22T11:28:40.351474  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-22T11:28:40.351778  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-22T11:28:40.352073  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-22T11:28:40.352363  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-22T11:28:40.352649  kern  :alert : Data abort info:

    2023-05-22T11:28:40.352933  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-22T11:28:40.353215  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/646b533390765b97212e8625

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646b533390765b9=
7212e862c
        new failure (last pass: renesas-devel-2023-04-24-v6.3)
        2 lines

    2023-05-22T11:33:46.903128  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-22T11:33:46.903656  kern  :emerg : Code: 97fd9d10 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-22T11:33:46.904005  <8>[   24.091476] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-22T11:33:46.904336  + set +x

    2023-05-22T11:33:46.904651  <8>[   24.093258] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10409697_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/646b533390765b9=
7212e862d
        new failure (last pass: renesas-devel-2023-04-24-v6.3)
        12 lines

    2023-05-22T11:33:46.860639  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-22T11:33:46.861169  kern  :alert : Mem abort info:

    2023-05-22T11:33:46.861548  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-22T11:33:46.861870  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-22T11:33:46.862180  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-22T11:33:46.862483  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-22T11:33:46.862781  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-22T11:33:46.863074  kern  :alert : Data abort info:

    2023-05-22T11:33:46.863362  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-22T11:33:46.863652  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/646b5979a44b0b38932e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646b5979a44b0b38932e8=
5e7
        failing since 97 days (last pass: renesas-devel-2023-02-06-v6.2-rc7=
, first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4cedd90d2d3a272e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-p=
ine64-plus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-p=
ine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646b4cedd90d2d3a272e8=
5e7
        new failure (last pass: renesas-devel-2023-04-17-v6.3-rc7) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4ea554c04dc7352e85f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-s=
un50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-s=
un50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646b4ea554c04dc7352e8=
5f6
        new failure (last pass: renesas-devel-2023-04-24-v6.3) =

 =20
