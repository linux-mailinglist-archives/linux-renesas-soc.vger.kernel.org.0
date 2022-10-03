Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C30C5F31D4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Oct 2022 16:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbiJCOSE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Oct 2022 10:18:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbiJCOSA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Oct 2022 10:18:00 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C00DF4CA33
        for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Oct 2022 07:17:59 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id w2so10344926pfb.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Oct 2022 07:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=p8fYKgqgGQ+x+gagBAsd70Q/v8gz4OF1qDXYjQiJrXA=;
        b=5yhVcsbzc8b0QkD1pgPAjXseV5joF0zPOvoX38f5QPmlanUt41bkVFsHbMM9Dg+6uu
         6OEhqTkkQH9RY7i05JDuS8aSgp5h4y6ibTnj7DBs6LGq3qItenkqIpANnILrNk8MXJ0P
         vU1NLet7E/oieV49W65S71VRVai7QQjHuhUoWTjSlNSZA5c80Qt1LweMcoPDUMPWwd0/
         e5VcImcnjV2GLV01bOH0Jr99rr/AlyrpnK2CM6r1iEGFcEyf3TPoldSqxqzd2IQb/J3D
         1w2iwcLAtyHswvPRxjkKge5naLN0bcE9ddQN6QHap9A1Tos4COK2puzrWzRx/sm0Mcm/
         dcsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=p8fYKgqgGQ+x+gagBAsd70Q/v8gz4OF1qDXYjQiJrXA=;
        b=LVGV9Vg3ZZiOzY0v5a2F+L+JJJC1pio6SfUAeasAlBg/px32ODmCRI//C0opwAKC5Z
         zTnhDSm+jMC22nYLIE3eaBubb7siCm1olrSXjPWinKyqV42R6GkW8s+jIGPnfV8VX+im
         kDYJ+XFs7F0fESzEbS4uKaa8MMgMzPYO+3d1K9c8sqPwd0OIDWX4dPc39PkFInzJqNoX
         udMkHYX4+6aR5Cxq2wIZk0a2jjF65rjRQ2WMQEOlXsSV1FOXyN9QhEbtMT8Dk6ssiSNd
         5kDCpD0+oK2vUDlM/Kbh8cgsKw9tD/mBM+nR3Oed/TbNrcq808qYwzPCnva41JUYnDEz
         wOZw==
X-Gm-Message-State: ACrzQf24rU0NxfAqt8HuJVdqDxFoq2xtVL/0BavvtF9LoDyuO1/XzPLj
        4k3SGVVh9QLpQ6At1P3E0oP/85zt/sdg5IBmphU=
X-Google-Smtp-Source: AMsMyM4Lq2IkswgkbjsV8gmoGi3kbFIONuYTtvEK6KWv1gfNN93jkirYdq62kwJh4f/gz2T0T5KTBw==
X-Received: by 2002:a63:4e18:0:b0:43c:2fc7:2eea with SMTP id c24-20020a634e18000000b0043c2fc72eeamr19442189pgb.119.1664806679140;
        Mon, 03 Oct 2022 07:17:59 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b2-20020a170902d50200b0016d9b101413sm7272116plg.200.2022.10.03.07.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 07:17:58 -0700 (PDT)
Message-ID: <633aef16.170a0220.dd41f.c202@mx.google.com>
Date:   Mon, 03 Oct 2022 07:17:58 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2022-10-03-v6.0
X-Kernelci-Report-Type: test
Subject: renesas/master cros-ec: 8 runs,
 4 regressions (renesas-devel-2022-10-03-v6.0)
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

renesas/master cros-ec: 8 runs, 4 regressions (renesas-devel-2022-10-03-v6.=
0)

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
sas-devel-2022-10-03-v6.0/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-10-03-v6.0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f0dbcd134f5abcdd4e2ad16bc81a158b2a23e2d9

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


  Details:     https://kernelci.org/test/plan/id/633adbd97e05a830bbec4eaa

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220923.1/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
3adbd97e05a830bbec4ebb
        failing since 48 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
33adbd97e05a830bbec4ebd
        failing since 48 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-10-03T12:55:37.173078  / # =

    2022-10-03T12:55:37.177766  =

    2022-10-03T12:55:37.279469  / # #
    2022-10-03T12:55:37.283861  #
    2022-10-03T12:55:37.384873  / # export SHELL=3D/bin/sh
    2022-10-03T12:55:37.389396  export SHELL=3D/bin/sh
    2022-10-03T12:55:37.490333  / # . /lava-7483784/environment
    2022-10-03T12:55:37.495138  . /lava-7483784/environment
    2022-10-03T12:55:37.596091  / # /lava-7483784/bin/lava-test-runner /lav=
a-7483784/0
    2022-10-03T12:55:37.600806  /lava-7483784/bin/lava-test-runner /lava-74=
83784/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/633ae313861e74b354cab5ec

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-e=
c-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-e=
c-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220923.1/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
3ae313861e74b354cab5fd
        failing since 48 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
33ae313861e74b354cab5ff
        failing since 48 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-10-03T13:26:27.163716  / # =

    2022-10-03T13:26:27.166445  =

    2022-10-03T13:26:27.269827  / # #
    2022-10-03T13:26:27.272375  #
    2022-10-03T13:26:27.375273  / # export SHELL=3D/bin/sh
    2022-10-03T13:26:27.376861  export SHELL=3D/bin/sh
    2022-10-03T13:26:27.479814  / # . /lava-7484091/environment
    2022-10-03T13:26:27.481931  . /lava-7484091/environment
    2022-10-03T13:26:27.585256  / # /lava-7484091/bin/lava-test-runner /lav=
a-7484091/0
    2022-10-03T13:26:27.587369  /lava-7484091/bin/lava-test-runner /lava-74=
84091/0 =

    ... (8 line(s) more)  =

 =20
