Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2690C624D0E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Nov 2022 22:33:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231304AbiKJVdr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Nov 2022 16:33:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232170AbiKJVdo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Nov 2022 16:33:44 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BA68BE39
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Nov 2022 13:33:43 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id z26so3205417pff.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Nov 2022 13:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NGiYdXyY5eNsWUJXIbafS7wdCrA0AKnHkSeSRER4DSI=;
        b=VUUc2AK+CF32iwH0eFf2HmplOM05fcuOwOqidibix7KCTS1HkuyJzImgBALn0nfhqN
         x/1no/QPCCVBaaPlweNTZd4lnRCIniTO+sc4IsAOqauJekED6PFJ6f0faBlzMSNySsX5
         qRJr+PQWuv7B+lgbWnsvhF7FhZUGHI5H57bJz1WkaVIQojsCB5dSdolLPUzGd/BVq9O4
         61pB7kMnf/+DmsrtfIGdtv0Qr5/yx3kFH6GEFAV7XqOGy5xY17sWCWC6WQF2q43zNIuc
         YzFZG5jTtFsZ2RoPGptGf6s9HFJfvnctpw0Yu6/B03Y2AB9RjlqToPcrJDRz8/jY5f3f
         zeeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NGiYdXyY5eNsWUJXIbafS7wdCrA0AKnHkSeSRER4DSI=;
        b=l6l0PXl5z1HFZjxXrF3S1OyY5iV1h02wM8iz+AJlLOOY8HM4JMFN1h22L5TOonHINI
         6pXz6EY3OpFuC6v8Ev7VzJlqE9wPhX6DjplxP0wiDfSmEJPQ8YwjPHHiHlhdnIp72PBg
         7S/cGjCdoua/V96jI4cXQjDwRZddb8smpnGx9FHkp7Q8G3mYvwncM2eC2XuzXwfNbaqw
         /EPYu8C7acoYr6gJ84Y4I7WSlSORqOFFK+ZZV01E+L7i8tWGr16wz9rXwc0xakPiMXuP
         2UsU7OCGVWjE85XnrkX/5onZUn66cP/EepnppADA2zt8C8jK396UsNYQLW79cp2/1OGT
         wpzQ==
X-Gm-Message-State: ACrzQf2/nUay1vNU4eIExh2LUkj2zbcP4KnI0t787nW4MyxpOs0WYrrg
        AsD7PABPCjX8sUiwWZIMnO3HhfnhKCrEt344CmA=
X-Google-Smtp-Source: AMsMyM4nATJN4YBJG2Zf4PZuViwI5x5MQKTA2nUb4fNPeyGleHKNPQOum/KlbRqALvASubDi+wQDig==
X-Received: by 2002:a05:6a00:981:b0:56b:e7e3:6602 with SMTP id u1-20020a056a00098100b0056be7e36602mr3656548pfg.16.1668116022383;
        Thu, 10 Nov 2022 13:33:42 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id oj2-20020a17090b4d8200b001df264610c4sm6053634pjb.0.2022.11.10.13.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 13:33:42 -0800 (PST)
Message-ID: <636d6e36.170a0220.65003.605e@mx.google.com>
Date:   Thu, 10 Nov 2022 13:33:42 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-11-10-v6.1-rc1
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next cros-ec: 8 runs,
 5 regressions (renesas-next-2022-11-10-v6.1-rc1)
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

renesas/next cros-ec: 8 runs, 5 regressions (renesas-next-2022-11-10-v6.1-r=
c1)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-11-10-v6.1-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-11-10-v6.1-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      bb90a1820bf922f55ba1355b83491aecbb6c9cf7

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


  Details:     https://kernelci.org/test/plan/id/636d5b0763bc020e25e7db78

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-10-v6.1-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-10-v6.1-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221024.1/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
6d5b0763bc020e25e7db89
        failing since 87 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
36d5b0763bc020e25e7db8b
        failing since 87 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-11-10T20:11:33.261975  / # =

    2022-11-10T20:11:33.266336  =

    2022-11-10T20:11:33.367860  / # #
    2022-11-10T20:11:33.372572  #
    2022-11-10T20:11:33.473571  / # export SHELL=3D/bin/sh
    2022-11-10T20:11:33.478008  export SHELL=3D/bin/sh
    2022-11-10T20:11:33.578917  / # . /lava-7937519/environment
    2022-11-10T20:11:33.583786  . /lava-7937519/environment
    2022-11-10T20:11:33.684535  / # /lava-7937519/bin/lava-test-runner /lav=
a-7937519/0
    2022-11-10T20:11:33.689045  /lava-7937519/bin/lava-test-runner /lava-79=
37519/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/636d5aaf9e2a65cf60e7dbad

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-10-v6.1-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-10-v6.1-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221024.1/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
6d5aaf9e2a65cf60e7dbbe
        failing since 87 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
36d5aaf9e2a65cf60e7dbc0
        failing since 87 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-11-10T20:10:07.144181  / # =

    2022-11-10T20:10:07.149623  =

    2022-11-10T20:10:07.251327  / # #
    2022-11-10T20:10:07.256325  #
    2022-11-10T20:10:07.357333  / # export SHELL=3D/bin/sh
    2022-11-10T20:10:07.363245  export SHELL=3D/bin/sh
    2022-11-10T20:10:07.464932  / # . /lava-7937550/environment
    2022-11-10T20:10:07.470859  . /lava-7937550/environment
    2022-11-10T20:10:07.571898  / # /lava-7937550/bin/lava-test-runner /lav=
a-7937550/0
    2022-11-10T20:10:07.577862  /lava-7937550/bin/lava-test-runner /lava-79=
37550/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/636d5e366881b2814be7db6b

  Results:     5 PASS, 2 FAIL, 10 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-10-v6.1-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-10-v6.1-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221024.1/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
36d5e366881b2814be7db7c
        failing since 87 days (last pass: renesas-next-2022-07-05-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-11-10T20:25:00.125561  / #
    2022-11-10T20:25:00.128818   =

    2022-11-10T20:25:00.129655  =

    2022-11-10T20:25:00.238525  / # #
    2022-11-10T20:25:00.241104  #
    2022-11-10T20:25:00.345315  / # export SHELL=3D/bin/sh
    2022-11-10T20:25:00.348697  export SHELL=3D/bin/sh
    2022-11-10T20:25:00.452238  / # . /lava-7937675/environment
    2022-11-10T20:25:00.455788  . /lava-7937675/environment
    2022-11-10T20:25:00.560276  / # /lava-7937675/bin/lava-test-runner /lav=
a-7937675/0 =

    ... (13 line(s) more)  =

 =20
