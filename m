Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59ED6611722
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Oct 2022 18:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230436AbiJ1QKW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Oct 2022 12:10:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230254AbiJ1QJt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Oct 2022 12:09:49 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C02892265AC
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Oct 2022 09:07:41 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id f9so5225144pgj.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Oct 2022 09:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F6EJTafWSbvI9tkoSTX3MS4LkV6UIvdTW7KPhdMgjOc=;
        b=B1a5JJey1TOedi5MsaqJ7RRJTfE94ALiX4ppy2KWTPV/3zqLRvmgKe2uxDNAYSkpmg
         p1mXIj+EJL18roGIkQHNd0w9s6IsWBK792gVEHa6Jk4ZlUmRmVKlyUUVS6jiNZObHCQT
         YdL10CYX7UEZeANEvmpOTnCNv9L+p8SHk1+A4KcEuJI9oCcrLmn5RJB+BL4o6+5n5ifj
         h1qhy/NaN9MrAJOdrv22X7xyt+ACKc9mqG3L562UUE465Mk8Nl5rtR9exuCMzPLTusAb
         M8IbHegKC9vIc1WJwOkAaBQaAgqxtJjMhsbACjcDDHEJpg2xFaf+pv70XcSMS3MGxZEP
         4iBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F6EJTafWSbvI9tkoSTX3MS4LkV6UIvdTW7KPhdMgjOc=;
        b=hssLDH9YIUWCDapZaKupCdC+4BbTH4WHCI1+eVqULDczZXXLS/oRFZFEcENHHx6Z4U
         r07XFiTlUgvphrpECQmWEP50jQ1Dknxt8aO7RIB27k9H13lGciNqL4oxDgrRUsA7Muej
         Ce8j5QTo8irbzGBtF4PdMdtGR7SbwSJCjzVXcyqo2UxHD+OeTeChEYzUzfmE7KvrJul+
         XiB1RPF9ldqZU5k9kHcKKT3R5oXoqrUNhFKivHdm/JEG5wLW9FE5whKtDiXYTDcBwEZz
         4Cc6EHXlbyt4uu1DCbur+46l89arrh/ISrnFq6FahyJiZYZ+XOiLBQgjPFo2/c7mNoeD
         GpEQ==
X-Gm-Message-State: ACrzQf12WEScbKfcGfXZL400os/nI+gZ0NCxbSIWCX6kQ5PspJszwhSp
        uqUVOmeV5aPukdvgSWUvHzuwgJqKLKG5GlUh
X-Google-Smtp-Source: AMsMyM55/C16Hd3Ny+N1tWIaQH8j0QYIlnVsxAH+ZeyJhbGMH4vrCw88JQQImXQIw3RLqL5cKEulwg==
X-Received: by 2002:a63:f921:0:b0:46b:18b:fe4d with SMTP id h33-20020a63f921000000b0046b018bfe4dmr188157pgi.573.1666973260972;
        Fri, 28 Oct 2022 09:07:40 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a32-20020a630b60000000b0043ae1797e2bsm2844331pgl.63.2022.10.28.09.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 09:07:40 -0700 (PDT)
Message-ID: <635bfe4c.630a0220.74fd1.5850@mx.google.com>
Date:   Fri, 28 Oct 2022 09:07:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-10-28-v6.1-rc1
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next cros-ec: 8 runs,
 5 regressions (renesas-next-2022-10-28-v6.1-rc1)
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

renesas/next cros-ec: 8 runs, 5 regressions (renesas-next-2022-10-28-v6.1-r=
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
s-next-2022-10-28-v6.1-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-10-28-v6.1-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      4bff929bc882c742102dbb29613c4cf8c0c92fa5

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


  Details:     https://kernelci.org/test/plan/id/635bece1e7df99d14ee7db5b

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-10-28-v6.1-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-10-28-v6.1-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221024.1/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
5bece2e7df99d14ee7db6c
        failing since 74 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
35bece2e7df99d14ee7db6e
        failing since 74 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-10-28T14:53:04.019198  / # =

    2022-10-28T14:53:04.024909  =

    2022-10-28T14:53:04.126699  / # #
    2022-10-28T14:53:04.132080  #
    2022-10-28T14:53:04.233113  / # export SHELL=3D/bin/sh
    2022-10-28T14:53:04.237627  export SHELL=3D/bin/sh
    2022-10-28T14:53:04.338568  / # . /lava-7761033/environment
    2022-10-28T14:53:04.343432  . /lava-7761033/environment
    2022-10-28T14:53:04.444343  / # /lava-7761033/bin/lava-test-runner /lav=
a-7761033/0
    2022-10-28T14:53:04.449460  /lava-7761033/bin/lava-test-runner /lava-77=
61033/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/635bea89efec7f049ce7db60

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-10-28-v6.1-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-10-28-v6.1-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221024.1/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
5bea89efec7f049ce7db71
        failing since 74 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
35bea89efec7f049ce7db73
        failing since 74 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-10-28T14:43:15.529927  / # =

    2022-10-28T14:43:15.536322  =

    2022-10-28T14:43:15.641713  / # #
    2022-10-28T14:43:15.647316  #
    2022-10-28T14:43:15.749164  / # export SHELL=3D/bin/sh
    2022-10-28T14:43:15.754269  export SHELL=3D/bin/sh
    2022-10-28T14:43:15.855109  / # . /lava-7761074/environment
    2022-10-28T14:43:15.860015  . /lava-7761074/environment
    2022-10-28T14:43:15.960781  / # /lava-7761074/bin/lava-test-runner /lav=
a-7761074/0
    2022-10-28T14:43:15.966108  /lava-7761074/bin/lava-test-runner /lava-77=
61074/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/635bf1b3936a654ea8e7db5a

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-10-28-v6.1-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-10-28-v6.1-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221024.1/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
35bf1b3936a654ea8e7db6d
        failing since 74 days (last pass: renesas-next-2022-07-05-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-10-28T15:13:34.188538  / # =

    2022-10-28T15:13:34.191240  =

    2022-10-28T15:13:34.294933  / ##
    2022-10-28T15:13:34.297388   #
    2022-10-28T15:13:34.400357  / # export SHELL=3D/bin/sh
    2022-10-28T15:13:34.402041  export SHELL=3D/bin/sh
    2022-10-28T15:13:34.506252  / # . /lava-7761596/environment
    2022-10-28T15:13:34.508729  . /lava-7761596/environment
    2022-10-28T15:13:34.611145  / # /lava-7761596/bin/lava-test-runner /lav=
a-7761596/0
    2022-10-28T15:13:34.613040  /lava-7761596/bin/lava-test-runner /lava-77=
61596/0 =

    ... (8 line(s) more)  =

 =20
