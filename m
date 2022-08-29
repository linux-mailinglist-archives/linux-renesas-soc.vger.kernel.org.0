Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2968E5A4774
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Aug 2022 12:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbiH2Kpq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Aug 2022 06:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbiH2Kpp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 06:45:45 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F223B2982E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 03:45:43 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 202so7333956pgc.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 03:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=EBHVVtQB86+bAzg4reYvz60J8CTesDG0vAUkCPHNHR8=;
        b=lsL/s2Y/gDXahdMxKm3GYvN590FI44mFfMPDC9CTLv/SkCxNpaxHgOH7rqE0j/slWV
         6hUa/S4ogZ6c4Mao8Ct7EIO86srzs9XGrsacKjlGgeFqJnnlvAK0MbatBM+H/XJLivXT
         MqfNZR1STs3zszMprKlDjbCzPKkxdMJtygiQjKzNZRP9uAKZ0rXk7MKAdPa9rKwZzfaV
         iq2se77nu/09gJRCSQioz9DlgRRmGnpQ/6925i96SJQtEad3rs9rDhxlrnsHoVh33PTg
         KvocDFiR0uyI9FpvYPPxhOL2iD5zEvN/cXcBmUr95l1OMO4AiutNaiiGz+2iwYl6HGNP
         pw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=EBHVVtQB86+bAzg4reYvz60J8CTesDG0vAUkCPHNHR8=;
        b=kellwbZmn8WDqWjk6c6fZVFRGCBh2ZFMnjnhfzJnKJkSI/nzL5wYp45I8ugTP3dDSQ
         FhEx9vCQvpnaqvCZX2n4LpA0A9GN08Ndk0CD59ZlI60E575vAdDr6f5yADaIFW5mQezL
         uZFlPFMDCnh+dGGYxExxprWIEk2MOvwPCSwmhTv5Ev/Dc9UIXdFcMEF8Upezl0v1S2jh
         MgnCTnA+RiaOkZaj932C2lz7RezuPUCukteLqePjMzHkk2aQ2788AWzXMf/0LhUvfEGz
         lppvGrR0LdygbTb6yRzMD/dWvxqX9b8m0Y4cJdPhmTwY2cyQ7WcB1mYROXWX2TWZPW9e
         Jzpg==
X-Gm-Message-State: ACgBeo1XRMw684TFQ42Li+JAfhkUx6SOslsPAOtf4sVzyml0QSPMAKCf
        imAXmua7DXxRVcE17omlJAV1zvTiUMr32CC1psw=
X-Google-Smtp-Source: AA6agR7/Rr51YcducekXGqF16wDeFFYDkT80wgn+qzfwxnD4Jxu7vh8fLri4tbl8TuZBQEjZCYM/iA==
X-Received: by 2002:a05:6a00:2316:b0:538:6966:80e4 with SMTP id h22-20020a056a00231600b00538696680e4mr910390pfh.11.1661769943279;
        Mon, 29 Aug 2022 03:45:43 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y187-20020a6232c4000000b00537daf64e8esm5556073pfy.188.2022.08.29.03.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 03:45:42 -0700 (PDT)
Message-ID: <630c98d6.620a0220.e7c70.93df@mx.google.com>
Date:   Mon, 29 Aug 2022 03:45:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-08-29-v6.0-rc1
Subject: renesas/next cros-ec: 10 runs,
 7 regressions (renesas-next-2022-08-29-v6.0-rc1)
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

renesas/next cros-ec: 10 runs, 7 regressions (renesas-next-2022-08-29-v6.0-=
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

mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-08-29-v6.0-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-08-29-v6.0-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      43507165562bd8bcf2ce73ba7706033127363710

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


  Details:     https://kernelci.org/test/plan/id/630c8366355bbafd18355645

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-29-v6.0-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-29-v6.0-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220812.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
0c8367355bbafd18355656
        failing since 13 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
30c8367355bbafd18355658
        failing since 13 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-08-29T09:14:02.829134  / # =

    2022-08-29T09:14:02.834078  =

    2022-08-29T09:14:02.937383  / # #
    2022-08-29T09:14:02.942794  #
    2022-08-29T09:14:03.045009  / # export SHELL=3D/bin/sh
    2022-08-29T09:14:03.051277  export SHELL=3D/bin/sh
    2022-08-29T09:14:03.153148  / # . /lava-7123634/environment
    2022-08-29T09:14:03.159279  . /lava-7123634/environment
    2022-08-29T09:14:03.261218  / # /lava-7123634/bin/lava-test-runner /lav=
a-7123634/0
    2022-08-29T09:14:03.267308  /lava-7123634/bin/lava-test-runner /lava-71=
23634/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/630c83899df225c16635564a

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-29-v6.0-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-29-v6.0-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220812.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
0c83899df225c16635565b
        failing since 13 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
30c83899df225c16635565d
        failing since 13 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-08-29T09:14:36.682164  / # =

    2022-08-29T09:14:36.686788  =

    2022-08-29T09:14:36.788478  / # #
    2022-08-29T09:14:36.793907  #
    2022-08-29T09:14:36.894881  / # export SHELL=3D/bin/sh
    2022-08-29T09:14:36.900151  export SHELL=3D/bin/sh
    2022-08-29T09:14:37.000840  / # . /lava-7123674/environment
    2022-08-29T09:14:37.006295  . /lava-7123674/environment
    2022-08-29T09:14:37.107139  / # /lava-7123674/bin/lava-test-runner /lav=
a-7123674/0
    2022-08-29T09:14:37.112275  /lava-7123674/bin/lava-test-runner /lava-71=
23674/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/630c88b2f4607fe54835566d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-29-v6.0-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-29-v6.0-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220812.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/630c88b2f4607fe5483556=
6e
        failing since 13 days (last pass: renesas-next-2022-07-05-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/630c88b0f4607fe548355656

  Results:     5 PASS, 2 FAIL, 11 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-29-v6.0-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-29-v6.0-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220812.0/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
0c88b1f4607fe548355666
        failing since 13 days (last pass: renesas-next-2022-07-05-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
30c88b1f4607fe548355668
        failing since 13 days (last pass: renesas-next-2022-07-05-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-08-29T09:36:38.260194  / # =

    2022-08-29T09:36:38.263418  =

    2022-08-29T09:36:38.372576  / # #
    2022-08-29T09:36:38.377013  #
    2022-08-29T09:36:38.480612  / # export SHELL=3D/bin/sh
    2022-08-29T09:36:38.481544  export SHELL=3D/bin/sh<6>[   20.842149] mwi=
fiex_pcie 0000:01:00.0: info: FW download over, size 638992 bytes
    2022-08-29T09:36:38.484616  =

    2022-08-29T09:36:38.587484  / # . /lava-7123916/environment
    2022-08-29T09:36:38.591273  . /lava-7123916/environment
    2022-08-29T09:36:38.694985  / # /lava-7123916/bin/lava-test-runner /lav=
a-7123916/0 =

    ... (14 line(s) more)  =

 =20
