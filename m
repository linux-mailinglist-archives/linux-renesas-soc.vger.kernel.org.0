Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFE5C5EC015
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Sep 2022 12:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbiI0Ks1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Sep 2022 06:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbiI0KsZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Sep 2022 06:48:25 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBA1E10911A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Sep 2022 03:48:23 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id b21so8717523plz.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Sep 2022 03:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=EeRRX2CHaF1KwusItoiEUCPxFNEPFhKB3rn6gXLNbN0=;
        b=PNf1birLgLOev6Ayk/j4wfRMvKdszkAz8h/Hthf0DQFRvUoV9uIflKCiJb/mGDPXd8
         k74oNumFgK4oBdQxXWeBvdOqaYjn5q5HpJMB7lhZlpa7AdiNFQq5tJZDOryjnNBMdoPK
         2O99Rwfy5iyjscESHKZE/vEyqxbleNemqgpk6/20PjpgnELrPPWfdRjMdzjC+s/ZfYkx
         AKQVVzNUhzO6UjluCK0nOfHCyL9keWMjMZWlEkKj9L+HGGCeq76GUVLNwmcQ3a73nRNe
         W+8aWf16J4/oLsjjs7SNVdA49sLJJg0HcueMIqC7Ke47eM/YYZu2NNvA6WXEHxafQqJZ
         ypcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=EeRRX2CHaF1KwusItoiEUCPxFNEPFhKB3rn6gXLNbN0=;
        b=nrCGrTNWxcnlm0p8U1eFRxs+7hcNMbkqUtdaHsy+kYImbn4t/maXzs4+iX5eZi3gsP
         OxNaHfdFbN2GYSOEnE7B0cSzz99a2LMkfvX9f0Os4oeC+I9OOY6AN0vFuMV80nqc33jh
         RluLHj8OmOL8TNClNubqo1/7HFiHr6ODVa1rmQIQY7jrQ5HUpcK6iTrLDKnckbNDmEfg
         KYRM3Q0b+1ZrDUX92DhFXai/81l0klM6AyXwNTIy74jy+zcBt2ZeQmikwVdodiMaReMa
         nuXhonllYSBg2crl3ZXTCPRm5PdSnESGy/UIp1gZvHjaCayCdxmiAhZN4PXJnl9DC5NI
         SGZw==
X-Gm-Message-State: ACrzQf2bCT9esstNYFsqWrj0VofNn9jRjcUNqNKYSL148dzmw4pNw9q2
        B7lZfWKP14iCuE/lOfcmxBp9VXqs5oaMYdU6
X-Google-Smtp-Source: AMsMyM62yvi4iXAotmwxckx15xnaHLno09Bb7F67n2SmweenW8DLMdcFyBlmpeqwX/CXaZqEho0HUA==
X-Received: by 2002:a17:903:1105:b0:178:ae31:aad with SMTP id n5-20020a170903110500b00178ae310aadmr26635150plh.3.1664275703163;
        Tue, 27 Sep 2022 03:48:23 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u2-20020a170902bf4200b00178b6ccc8a0sm1194109pls.51.2022.09.27.03.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 03:48:22 -0700 (PDT)
Message-ID: <6332d4f6.170a0220.84139.1bf8@mx.google.com>
Date:   Tue, 27 Sep 2022 03:48:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-09-27-v6.0-rc7
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master cros-ec: 7 runs,
 4 regressions (renesas-devel-2022-09-27-v6.0-rc7)
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

renesas/master cros-ec: 7 runs, 4 regressions (renesas-devel-2022-09-27-v6.=
0-rc7)

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
sas-devel-2022-09-27-v6.0-rc7/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-09-27-v6.0-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      021286ccf6c17f224e1137ebdbbbecae1e64612f

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


  Details:     https://kernelci.org/test/plan/id/6332d0caa71400ff9eec4efd

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-27-v6.0-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-27-v6.0-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220923.1/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
32d0caa71400ff9eec4f0e
        failing since 42 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
332d0caa71400ff9eec4f10
        failing since 42 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-09-27T10:30:14.864777  / # =

    2022-09-27T10:30:14.869544  =

    2022-09-27T10:30:14.971195  / # #
    2022-09-27T10:30:14.975981  #
    2022-09-27T10:30:15.076892  / # export SHELL=3D/bin/sh
    2022-09-27T10:30:15.081721  export SHELL=3D/bin/sh
    2022-09-27T10:30:15.182669  / # . /lava-7420415/environment
    2022-09-27T10:30:15.187796  . /lava-7420415/environment
    2022-09-27T10:30:15.288738  / # /lava-7420415/bin/lava-test-runner /lav=
a-7420415/0
    2022-09-27T10:30:15.293812  /lava-7420415/bin/lava-test-runner /lava-74=
20415/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/6332c996df6ee9a7e8ec4ecb

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-27-v6.0-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-27-v6.0-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220923.1/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
32c996df6ee9a7e8ec4edc
        failing since 42 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
332c996df6ee9a7e8ec4ede
        failing since 42 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-09-27T09:59:32.367110  / # =

    2022-09-27T09:59:32.369557  =

    2022-09-27T09:59:32.472499  / # #
    2022-09-27T09:59:32.474557  #
    2022-09-27T09:59:32.578771  / # export SHELL=3D/bin/sh
    2022-09-27T09:59:32.581026  export SHELL=3D/bin/sh
    2022-09-27T09:59:32.684065  / # . /lava-7420500/environment
    2022-09-27T09:59:32.686448  . /lava-7420500/environment
    2022-09-27T09:59:32.788843  / # /lava-7420500/bin/lava-test-runner /lav=
a-7420500/0
    2022-09-27T09:59:32.790919  /lava-7420500/bin/lava-test-runner /lava-74=
20500/0 =

    ... (8 line(s) more)  =

 =20
