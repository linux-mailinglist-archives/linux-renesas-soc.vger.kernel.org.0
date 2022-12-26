Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04A5D65629E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Dec 2022 13:38:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232069AbiLZMiA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Dec 2022 07:38:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiLZMh7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Dec 2022 07:37:59 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B40255A3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Dec 2022 04:37:58 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id gt4so10589908pjb.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Dec 2022 04:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V/gNIEbgF3+Teu0JLkRedhuXWCpCIziZQsJHt0RSv24=;
        b=1v+75UbZA+OyK6xhN/YKVwOnRWDeNlopC09QMiHV4XSW3wWgAiDhNFf95SWENfo0WI
         d/EyEFM9YDefdSQ+2h38YYrYELWCw/gOeBhL9/JhfdHxC9rysaXPMBqXTjHMCml3WZ6r
         AdUoT8CE2yOLoKWI09vLOZvM5/4omZYU1+ZsyIPsrx7LOG+crU3nWRUITXzPVORAYKUd
         Dpua7OC1HCpieTNzQgtXLiJbPlfC+iW7+1srraBjeqVN1nIZnIAOP2nmZiMFri2IsfSf
         R6ZJNMOtOpANP7UFn7JbeTZubM9Mm0ugmBsY82sCgeYtTeFbtSP3te6yBPU2sGTJ6bEg
         3XoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V/gNIEbgF3+Teu0JLkRedhuXWCpCIziZQsJHt0RSv24=;
        b=s+SYT0Tdr3MBN60wB8dEh83o4wVujdBddTnJm2+/LL8EkQunvtLrFrquFRCHyuYm2s
         uzTvqCRgQxSVV1J/WJAm/V+4p0Y8mKyzVMuVo/AXQcKC3h7fv/aD9mLqtRPMGYrMqWTb
         l8aBQmLByg3AKHZfeQJJP5ipodYoZH8t9vjL9IdfDRkGtUh3zyzyy8tljg3GKVFDqqc1
         McsOR+oSpNnjAgZIPSr8gsMiiqJMn4Piy8OzXeXsRlXGtJWgwWtSmeZ1jQvDqzDxviwU
         TNlA7rjALiCiCbz6BZJyA+mFra2395757zDWX5FZwRNSJx+vjpfmUF3l5w2QZiIy4Klm
         R1Zg==
X-Gm-Message-State: AFqh2kqhOoXgckhr3T4z/TfMwSYkDw/0wn9FkpfvdXPZRLmOWtqAJt7N
        Ya8msPNM2FQO7ud1cuH1o4y9J1DMLdMPuBLjJNA=
X-Google-Smtp-Source: AMrXdXunKdh46np7Mh3q3yjhYNrNlab7orygJuF1oO5YdUEwUO9ZU3sABam4tAtWVxPbYCS4rDAyKw==
X-Received: by 2002:a17:90a:2bcd:b0:225:be4c:2586 with SMTP id n13-20020a17090a2bcd00b00225be4c2586mr14392164pje.45.1672058277612;
        Mon, 26 Dec 2022 04:37:57 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 8-20020a17090a0f0800b0021952b5e9bcsm8647450pjy.53.2022.12.26.04.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 04:37:56 -0800 (PST)
Message-ID: <63a995a4.170a0220.c8286.0544@mx.google.com>
Date:   Mon, 26 Dec 2022 04:37:56 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2022-12-26-v6.2-rc1
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Report-Type: test
Subject: renesas/next cros-ec: 16 runs,
 5 regressions (renesas-next-2022-12-26-v6.2-rc1)
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

renesas/next cros-ec: 16 runs, 5 regressions (renesas-next-2022-12-26-v6.2-=
rc1)

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
s-next-2022-12-26-v6.2-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-12-26-v6.2-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      7cf590dd42358e54ad3fa80910b9589add2b74a2

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


  Details:     https://kernelci.org/test/plan/id/63a98104221ffb77984eee3f

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221216.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
a98104221ffb77984eee50
        failing since 133 days (last pass: renesas-next-2022-07-07-v5.19-rc=
1, first fail: renesas-next-2022-08-15-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3a98104221ffb77984eee52
        failing since 133 days (last pass: renesas-next-2022-07-07-v5.19-rc=
1, first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-12-26T11:09:48.129280  / # =

    2022-12-26T11:09:48.134050  =

    2022-12-26T11:09:48.235672  / # #
    2022-12-26T11:09:48.241029  #
    2022-12-26T11:09:48.341989  / # export SHELL=3D/bin/sh
    2022-12-26T11:09:48.346651  export SHELL=3D/bin/sh
    2022-12-26T11:09:48.447556  / # . /lava-8473187/environment
    2022-12-26T11:09:48.452039  . /lava-8473187/environment
    2022-12-26T11:09:48.552826  / # /lava-8473187/bin/lava-test-runner /lav=
a-8473187/0
    2022-12-26T11:09:48.557542  /lava-8473187/bin/lava-test-runner /lava-84=
73187/0 =

    ... (8 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/63a97fb5cba6a1ad634eee20

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221216.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
a97fb5cba6a1ad634eee31
        failing since 133 days (last pass: renesas-next-2022-07-07-v5.19-rc=
1, first fail: renesas-next-2022-08-15-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3a97fb5cba6a1ad634eee33
        failing since 133 days (last pass: renesas-next-2022-07-07-v5.19-rc=
1, first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-12-26T11:03:58.285882  / # =

    2022-12-26T11:03:58.291415  =

    2022-12-26T11:03:58.392873  / # #
    2022-12-26T11:03:58.397696  #
    2022-12-26T11:03:58.498679  / # export SHELL=3D/bin/sh
    2022-12-26T11:03:58.504063  export SHELL=3D/bin/sh
    2022-12-26T11:03:58.604766  / # . /lava-8473138/environment
    2022-12-26T11:03:58.610157  . /lava-8473138/environment
    2022-12-26T11:03:58.711047  / # /lava-8473138/bin/lava-test-runner /lav=
a-8473138/0
    2022-12-26T11:03:58.716478  /lava-8473138/bin/lava-test-runner /lava-84=
73138/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63a983d9d8e99ff7824eee21

  Results:     5 PASS, 2 FAIL, 11 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221216.0/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3a983d9d8e99ff7824eee33
        failing since 133 days (last pass: renesas-next-2022-07-05-v5.19-rc=
1, first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-12-26T11:21:46.531435  / # =

    2022-12-26T11:21:46.533214  =

    2022-12-26T11:21:46.533866  =

    2022-12-26T11:21:46.637062  / # #
    2022-12-26T11:21:46.638795  #
    2022-12-26T11:21:46.741244  / # export SHELL=3D/bin/sh
    2022-12-26T11:21:46.741495  <6>[   29.399074] mwifiex_pcie 0000:01:00.0=
: info: FW download over, size 638992 bytes
    2022-12-26T11:21:46.743853  export SHELL=3D/bin/sh
    2022-12-26T11:21:46.744174  =

    2022-12-26T11:21:46.847179  / # . /lava-8473396/environment =

    ... (19 line(s) more)  =

 =20
