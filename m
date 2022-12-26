Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6AC6562AD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Dec 2022 13:54:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbiLZMyA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Dec 2022 07:54:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiLZMx7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Dec 2022 07:53:59 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E26B424A
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Dec 2022 04:53:57 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id b145so3107531pfb.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Dec 2022 04:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5YWX4SweKoYeTcs1T6x2YClkjzaEyG2GMAchv6bmts=;
        b=69/Uhv35C1uR/hnwddC5NIVYxe5cbkYRruIOqWhGvN6AVPqVzg8GtvhnPldwnst+Mh
         4hLP205bn495N6JESYlxGpCzuV+K7F7WkbaK4KYpa+9vkWL2pOJyxpv+SH/81DwL1sWR
         wfeZveWlnbIZdpuy/6I1GHW06SMZcACE9LqFzkQMxrkZG0OxWX3YBgQphOAWMcynFiki
         XDIh+NfidXnWcBRer3eu9IM1BIMcaqXuR8qcY+h+9KjWldNfnbrTQANwG5oimBsrU8c0
         pRbRSFVxo/ZoZW1BggUkB0swI5Snes2KEUNjeP+dzXubsHvFwaMwGAv60Ld7mvMNf9Z9
         imiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q5YWX4SweKoYeTcs1T6x2YClkjzaEyG2GMAchv6bmts=;
        b=inaR0m3MOew04Fiyd29ort07NfZz7P8yphIYPdIChf68b9YI6AVksK5SeP/jCcdXTi
         lcptN0fDXHSYz61yLsjbBvUmm27yzuMpShOx+TO5S0h/3nYOQ5rioG+ojPXWa5MN+Izc
         2b1qnpAo4Ydoe1JBzJw3bDWtbM98Kjw4I3dLBq3I+AM76eXLW/21w6I3i6BE3/ypwEyS
         ugyaY6oanTi/qDq0WJpRHy/3pyaOmPr0VP4+NyWIlp8Ue9Y0I3sekB/oLlJ6sxv7SdYx
         c5HbuZPBWPQfGXyDKhpuz0BtdVm54HtefJvOJO3IKq/XpJu+kx5AXieW+MataNXw+cvb
         Gzvw==
X-Gm-Message-State: AFqh2koVebZW3Nk1TP7TN8TFlwyMVpfE0DN3EurFBtOkG6k96a+qPcK3
        Dz9wMDpfZZmRsAx0DW70O+3MkxvYV+rg3yQU/3A=
X-Google-Smtp-Source: AMrXdXvDp7OWXnZLElSygLV2tDkzs0TV11LFT9J7LFWhLufbSEW12PXXSBE6c5kbUGttBrdWV605Uw==
X-Received: by 2002:a62:794e:0:b0:581:5b79:a7ad with SMTP id u75-20020a62794e000000b005815b79a7admr6752pfc.8.1672059237142;
        Mon, 26 Dec 2022 04:53:57 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 193-20020a6218ca000000b00571cdbd0771sm1557728pfy.102.2022.12.26.04.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 04:53:56 -0800 (PST)
Message-ID: <63a99964.620a0220.98f36.295e@mx.google.com>
Date:   Mon, 26 Dec 2022 04:53:56 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2022-12-26-v6.2-rc1
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: renesas/master cros-ec: 16 runs,
 4 regressions (renesas-devel-2022-12-26-v6.2-rc1)
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

renesas/master cros-ec: 16 runs, 4 regressions (renesas-devel-2022-12-26-v6=
.2-rc1)

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
sas-devel-2022-12-26-v6.2-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-12-26-v6.2-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b0aba6507e1ff279b0c30d78c75eb192aaedf22b

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


  Details:     https://kernelci.org/test/plan/id/63a984075567ff2a494eee26

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-12-26-v6.2-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-12-26-v6.2-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221216.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
a984075567ff2a494eee37
        failing since 132 days (last pass: renesas-devel-2022-08-11-v5.19, =
first fail: renesas-devel-2022-08-16-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3a984075567ff2a494eee39
        failing since 132 days (last pass: renesas-devel-2022-08-11-v5.19, =
first fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-12-26T11:22:32.667187  / # =

    2022-12-26T11:22:32.671711  =

    2022-12-26T11:22:32.773497  / # #
    2022-12-26T11:22:32.777993  #
    2022-12-26T11:22:32.879010  / # export SHELL=3D/bin/sh
    2022-12-26T11:22:32.883824  export SHELL=3D/bin/sh
    2022-12-26T11:22:32.984582  / # . /lava-8473646/environment
    2022-12-26T11:22:32.988954  . /lava-8473646/environment
    2022-12-26T11:22:33.089870  / # /lava-8473646/bin/lava-test-runner /lav=
a-8473646/0
    2022-12-26T11:22:33.094677  /lava-8473646/bin/lava-test-runner /lava-84=
73646/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/63a98d2703f4a9ffc64eee30

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-12-26-v6.2-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-12-26-v6.2-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221216.0/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
a98d2703f4a9ffc64eee41
        failing since 132 days (last pass: renesas-devel-2022-08-11-v5.19, =
first fail: renesas-devel-2022-08-16-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3a98d2703f4a9ffc64eee43
        failing since 132 days (last pass: renesas-devel-2022-08-11-v5.19, =
first fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-12-26T12:01:23.728755  / # =

    2022-12-26T12:01:23.730329  =

    2022-12-26T12:01:23.730596  =

    2022-12-26T12:01:23.834784  / # #
    2022-12-26T12:01:23.836693  #
    2022-12-26T12:01:23.837337  =

    2022-12-26T12:01:23.939169  / # export SHELL=3D/bin/sh
    2022-12-26T12:01:23.941135  export SHELL=3D/bin/sh
    2022-12-26T12:01:23.941449  =

    2022-12-26T12:01:24.044204  / # . /lava-8474078/environment =

    ... (19 line(s) more)  =

 =20
