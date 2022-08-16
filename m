Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B72B595A42
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Aug 2022 13:35:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234246AbiHPLea (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Aug 2022 07:34:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234644AbiHPLeA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Aug 2022 07:34:00 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 929A27C1F5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Aug 2022 03:56:05 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id f65so8881963pgc.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Aug 2022 03:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=6oKJhqS1xg4i+FoQfSH+oJVezAIPpTebZd+IfGxx3X0=;
        b=2Zgowl5pbuZ9T+tp39pd1tWy53caVXzEnRluftQOqlAGC10HVAEIS6SneVRAEv+pTo
         MVt1+AJKuq/WTJ1rLJsXW2Ak0lf4YVnwPfsZdhF6jKsAwsfl+6+8FMizpxnKDUvnXgwr
         Zw7NSM7nfxkkjJfl8Q7x276eiqfUgsM9UoI0EumzvOm+tI2ZPtuOUQCLGZifpu5x9xzg
         8h21D0dGtezD+zF3jyXfa7Ycwd89qeJoIxvi/FBPE/Db9k4d/5Yn/G64ejwBV5InZJ5v
         A1GlcQXrx3FGHCLkMRDg0zT/C2IAUtDVkJcqwHQWXwkiH/paov+5/Tf1oB9/72WC68Nq
         4rqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=6oKJhqS1xg4i+FoQfSH+oJVezAIPpTebZd+IfGxx3X0=;
        b=msMdeXAq0vXI1sNbewDPt8d4pA0vm48m7XwLGOEPodBR0K3YUXm9TrT6qWHlLV9zie
         71rCDZ0EoUR7oFtlWQbMtEv1FDa4GRBTA7BIZiR/9QcIlKzbF3C7kmyul5FtyESCCS5W
         AeO7PIXmDI/70+Clq/lxOxyj7inRb6pD39Cf/3WrL2ahxbf9jU/PoGAeubAkC4vyfRj2
         bFMP0dMsu8IzE1iePHLrn38cnzbkxjA0SnPDTDQdbqiL0LtpGgVyU8iIL3P0zvB4xB44
         tH2mqd6Z8RlPu3n9yoT1QooULZYLY5lkmUm1ACbzOZtiyx+WSQkyfM6N6feqBDOPBUuM
         CHyg==
X-Gm-Message-State: ACgBeo0+1x4E9adOK/eO31d1cYWU2PiEGp4JxgIJsKLLvnj7RcU+7wxp
        xJnw/FSNP5lan1xXHkfHCr7al7so6sMYiFnn
X-Google-Smtp-Source: AA6agR4xSaPWtIZxRB7yzN2UO0r9XrZYF5Wf3cFFLdCUTcpwcH6m07imWH5C8c5WBcL8DwAtBFvzdQ==
X-Received: by 2002:a63:b95e:0:b0:41d:6498:2ad5 with SMTP id v30-20020a63b95e000000b0041d64982ad5mr17221676pgo.446.1660647364754;
        Tue, 16 Aug 2022 03:56:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r61-20020a17090a43c300b001f207d1860fsm6003282pjg.45.2022.08.16.03.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 03:56:04 -0700 (PDT)
Message-ID: <62fb77c4.170a0220.37253.9809@mx.google.com>
Date:   Tue, 16 Aug 2022 03:56:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-08-16-v6.0-rc1
Subject: renesas/master cros-ec: 8 runs,
 6 regressions (renesas-devel-2022-08-16-v6.0-rc1)
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

renesas/master cros-ec: 8 runs, 6 regressions (renesas-devel-2022-08-16-v6.=
0-rc1)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-08-16-v6.0-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-08-16-v6.0-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a9c4a500b27ef2b4904a076bc44eb14dfefdff68

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


  Details:     https://kernelci.org/test/plan/id/62fb61a10c2fc7ec9a355675

  Results:     4 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-16-v6.0-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-16-v6.0-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220812.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/62=
fb61a10c2fc7ec9a355685
        new failure (last pass: renesas-devel-2022-08-11-v5.19) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
2fb61a10c2fc7ec9a355687
        new failure (last pass: renesas-devel-2022-08-11-v5.19)

    2022-08-16T09:21:20.883178  / # =

    2022-08-16T09:21:20.887721  =

    2022-08-16T09:21:20.989378  / # #
    2022-08-16T09:21:20.993854  #
    2022-08-16T09:21:21.094888  / # export SHELL=3D/bin/sh
    2022-08-16T09:21:21.099886  export SHELL=3D/bin/sh
    2022-08-16T09:21:21.200798  / # . /lava-7047376/environment
    2022-08-16T09:21:21.205213  . /lava-7047376/environment
    2022-08-16T09:21:21.306178  / # /lava-7047376/bin/lava-test-runner /lav=
a-7047376/0
    2022-08-16T09:21:21.311252  /lava-7047376/bin/lava-test-runner /lava-70=
47376/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb63a4c729ea20723556d8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-16-v6.0-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/cros-ec-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-16-v6.0-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/cros-ec-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220812.0/amd64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/62fb63a4c729ea20723556=
d9
        new failure (last pass: renesas-devel-2022-08-11-v5.19) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb63f42dae7eb04d3556c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-16-v6.0-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-16-v6.0-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220812.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/62fb63f42dae7eb04d3556=
c6
        failing since 4 days (last pass: renesas-devel-2022-08-11-v5.19-rc8=
, first fail: renesas-devel-2022-08-11-v5.19) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/62fb62f31f1c8dbb7e355682

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-16-v6.0-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-16-v6.0-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220812.0/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/62=
fb62f31f1c8dbb7e355693
        new failure (last pass: renesas-devel-2022-08-11-v5.19) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
2fb62f31f1c8dbb7e355695
        new failure (last pass: renesas-devel-2022-08-11-v5.19)

    2022-08-16T09:26:58.245476  / # =

    2022-08-16T09:26:58.248651  =

    2022-08-16T09:26:58.357867  / # #
    2022-08-16T09:26:58.362102  #
    2022-08-16T09:26:58.464530  / # export SHELL=3D/bin/sh
    2022-08-16T09:26:58.468263  export SHELL=3D/bin/sh
    2022-08-16T09:26:58.571840  / # . /lava-7047506/environment
    2022-08-16T09:26:58.575454  . /lava-7047506/environment
    2022-08-16T09:26:58.679152  / # /lava-7047506/bin/lava-test-runner /lav=
a-7047506/0
    2022-08-16T09:26:58.681533  /lava-7047506/bin/lava-test-runner /lava-70=
47506/0 =

    ... (8 line(s) more)  =

 =20
