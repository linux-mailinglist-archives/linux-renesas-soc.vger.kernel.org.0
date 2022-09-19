Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12CB35BC9A3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Sep 2022 12:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbiISKjs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Sep 2022 06:39:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbiISKhq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Sep 2022 06:37:46 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 472CA248FA
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Sep 2022 03:21:17 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id w20so15410107ply.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Sep 2022 03:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=TIWcxSZEHO5I8EqX35iCBwZJzdTR4+q+EAUyK/gnI8g=;
        b=VyNkIDrZlYpiN7DXa2090fbRFXBWBVoVvUFBndpqkm43NPufV0UNNTc8i1K7w854iu
         PJ3/1m79KoHX3oWQr5Jsjq+Gw06RxpuJnmlJhOORxZZRmEXToXCNRVxgG33jfNvwcEKG
         zciTQmvA7n9k3NJiFTeX+A+Ngl337OPQoMB2JV46/jzcVYyz0QZAsfMktyoEmaLfFkiY
         wwJonU3C3gu/IytaHm7T4EW1WqBma7XMhBs5//uMS7t6yAWT9VwUgLgFcnrUC4pCBGhi
         J4ztSkeVPxZ2sTGzTt5ZrVBFuUKY54k5gO/3PbCwYT0LydRLEye6tuqhbaPt7U3IXs5C
         cHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=TIWcxSZEHO5I8EqX35iCBwZJzdTR4+q+EAUyK/gnI8g=;
        b=L/OhZ7ODXFofnsYaJ3r7wXe+g6Nfce+DtQPpwjcAnOOgkEZvis9z415TuoPaiz5Wyv
         9FyANkwmKiKUhiG+VRZiEXLeTHPPTsnAni/9OCmbAJ0Fp76YQ5ey3xYJcTRAel8BIVDG
         S/RjcWhRnHrpm2IP2R+fZDMhwWejrMfeo5omIs5j+FnvRh4A6VNeCAxsyfEXWAQxyZHs
         6Xw8oC10A8dWdggm53pP8RCz8I1Qekd+KntSkCw2r0ue3lxmfhr4I9pvqa9JrFaFtKLc
         OW8A1pTpZxuvRyiWuRy0vzW3ZoC8/zO7iBERZ0LY+AdAoz1agPLu5YvPWHOqWflKtt6n
         blUA==
X-Gm-Message-State: ACrzQf2MyeC1z5c/klGUNsKTT9rylwAyiWGzrntn0siZWbHbBDWpsPOS
        f2iN9ZmBdNnLgOmLnJd3Ks9wM30A1d1VNp/r7k0=
X-Google-Smtp-Source: AMsMyM7O/VOWeOouz5gwP720v22VP5czfAaPB989UXu+lLjjNbBk/pDrei7KqvR4vw1Pgt3uQ7uwbg==
X-Received: by 2002:a17:902:e14c:b0:177:e7be:2ab6 with SMTP id d12-20020a170902e14c00b00177e7be2ab6mr12127726pla.25.1663582872082;
        Mon, 19 Sep 2022 03:21:12 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n13-20020a170902d2cd00b0017894903949sm3683513plc.157.2022.09.19.03.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 03:21:11 -0700 (PDT)
Message-ID: <63284297.170a0220.3d689.52c0@mx.google.com>
Date:   Mon, 19 Sep 2022 03:21:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-09-19-v6.0-rc6
Subject: renesas/master cros-ec: 10 runs,
 4 regressions (renesas-devel-2022-09-19-v6.0-rc6)
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

renesas/master cros-ec: 10 runs, 4 regressions (renesas-devel-2022-09-19-v6=
.0-rc6)

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
sas-devel-2022-09-19-v6.0-rc6/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-09-19-v6.0-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      5c8e5995413313a628eb0f9ea0d9ae6641854298

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


  Details:     https://kernelci.org/test/plan/id/63282ebef8b140b68a355649

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-19-v6.0-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-19-v6.0-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220826.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
282ebef8b140b68a35565a
        failing since 33 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3282ebef8b140b68a35565c
        failing since 33 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-09-19T08:56:12.052680  / # =

    2022-09-19T08:56:12.058847  =

    2022-09-19T08:56:12.164625  / # #
    2022-09-19T08:56:12.170865  #
    2022-09-19T08:56:12.273129  / # export SHELL=3D/bin/sh
    2022-09-19T08:56:12.279757  export SHELL=3D/bin/sh
    2022-09-19T08:56:12.381956  / # . /lava-7311730/environment
    2022-09-19T08:56:12.387987  . /lava-7311730/environment
    2022-09-19T08:56:12.490103  / # /lava-7311730/bin/lava-test-runner /lav=
a-7311730/0
    2022-09-19T08:56:12.495984  /lava-7311730/bin/lava-test-runner /lava-73=
11730/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/6328353bb481450e45355644

  Results:     4 PASS, 2 FAIL, 11 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-19-v6.0-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-19-v6.0-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220826.0/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
28353bb481450e45355653
        failing since 33 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
328353bb481450e45355655
        failing since 33 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-09-19T09:23:48.268578  / # =

    2022-09-19T09:23:48.269211  <6>[   20.598767] mwifiex_pcie 0000:01:00.0=
: info: FW download over, size 638992 bytes
    2022-09-19T09:23:48.271499  =

    2022-09-19T09:23:48.376040  / # #
    2022-09-19T09:23:48.380474  #
    2022-09-19T09:23:48.484052  / # export SHELL=3D/bin/sh
    2022-09-19T09:23:48.487941  export SHELL=3D/bin/sh
    2022-09-19T09:23:48.591602  / #. /lava-7312062/environment
    2022-09-19T09:23:48.595484   . /lava-7312062/environment
    2022-09-19T09:23:48.699165  / # /lava-7312062/bin/lava-test-runner /lav=
a-7312062/0 =

    ... (15 line(s) more)  =

 =20
