Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD59592E9B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Aug 2022 14:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241521AbiHOMB6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Aug 2022 08:01:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232120AbiHOMB4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Aug 2022 08:01:56 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08DD724BEC
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Aug 2022 05:01:55 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id u133so6452483pfc.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Aug 2022 05:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=eDf/Thc2f95bB7QDin0VdlDbrHkC0QLHvhTZ511H8iQ=;
        b=t+dEDkOpcDEaQdEHQoO3ql2QL6m+/8dJCQXguaCnVUehNA7EATahrSnlPYF0BL9OXN
         t6LIsZVTbno1Vs+cMJ9sykJOBBo/CU5KzBAfIvrviFBPQ4mxrn6uBRbuHIVrcpabwVjm
         ZO1e86K3WCDwfzXqv70JB+s2D2+kGqwBhfcbuRPr8UOGW95cXME2eFqbUvtcMm8Tsy+9
         L5na3Ssv2dM2cHRkHN+4KNPke2oP25ikYAn6PHvepMCH3BC5rtRf4g4op38ZIGUeMARm
         fEzY8xkMmWv0su9dxyFKjKC1NM29XeGpPi/sIBIqYi/eK6BRMC+bIGKQh8jj1DgAQrCy
         bE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=eDf/Thc2f95bB7QDin0VdlDbrHkC0QLHvhTZ511H8iQ=;
        b=Cx9Xhks5WkhiDys8xC1LUkex0+o/6lb8mkLudt+pgW7rTw2RwTL+//p6rEeeaTgCTa
         GeIEt5z/veSzHmqiPdQ9t9lLcFqkXHdTpTWJgMDXm1JgZIRXr+H2a11Ok/1AhDfNXFm8
         1CW/MNpleKt0CO8diyty+t8RdIpE6QJLogILbfbSyu7AuSg4fXWodrIbZectySEExuUX
         /fzCYVhU7afKy2PNGd5r5Jk7IFjQFsmJnLUEWw4HQEdWnQVcc5XbMRcL69nw4RgtsFJ6
         DXfTf1eur1xQJE5XeDj3r7goje52eFspNr1VSY2fcw+XDAkZtP9XvhJQnyt8cxeLfyVA
         s6ng==
X-Gm-Message-State: ACgBeo0FglUTG8sMAKT7ROBg8LZB0TMI4E8sPH7wtTSEvfPWIfDhrtB8
        ePgVRov7kVTJLy/8wAwoDGoc6BFOTiVU1Fus
X-Google-Smtp-Source: AA6agR7d+zPvu8CqNJ7iCGlWabrrtkjPhgx6Fp72kWFYvab/zxaHT++n7ObUHxZYI8sGAAhgOpD8rQ==
X-Received: by 2002:a63:8648:0:b0:41d:259:754 with SMTP id x69-20020a638648000000b0041d02590754mr13250178pgd.422.1660564913767;
        Mon, 15 Aug 2022 05:01:53 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g8-20020aa796a8000000b0050dc76281e0sm6414383pfk.186.2022.08.15.05.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 05:01:53 -0700 (PDT)
Message-ID: <62fa35b1.a70a0220.e7232.a892@mx.google.com>
Date:   Mon, 15 Aug 2022 05:01:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-08-15-v6.0-rc1
Subject: renesas/next cros-ec: 10 runs,
 7 regressions (renesas-next-2022-08-15-v6.0-rc1)
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

renesas/next cros-ec: 10 runs, 7 regressions (renesas-next-2022-08-15-v6.0-=
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
s-next-2022-08-15-v6.0-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-08-15-v6.0-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a856c5f264405e55734da632683232c2e69eb68b

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


  Details:     https://kernelci.org/test/plan/id/62fa245a2579be12d0daf0e9

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-15-v6.0-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-15-v6.0-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220805.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/62=
fa245a2579be12d0daf0fa
        new failure (last pass: renesas-next-2022-07-07-v5.19-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
2fa245a2579be12d0daf0fc
        new failure (last pass: renesas-next-2022-07-07-v5.19-rc1)

    2022-08-15T10:47:35.544483  / # =

    2022-08-15T10:47:35.550925  =

    2022-08-15T10:47:35.657277  / # #
    2022-08-15T10:47:35.663429  #
    2022-08-15T10:47:35.766151  / # export SHELL=3D/bin/sh
    2022-08-15T10:47:35.772222  export SHELL=3D/bin/sh
    2022-08-15T10:47:35.874336  / # . /lava-7036511/environment
    2022-08-15T10:47:35.880697  . /lava-7036511/environment
    2022-08-15T10:47:35.982707  / # /lava-7036511/bin/lava-test-runner /lav=
a-7036511/0
    2022-08-15T10:47:35.989083  /lava-7036511/bin/lava-test-runner /lava-70=
36511/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/62fa1ecff787f71609daf05b

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-15-v6.0-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-15-v6.0-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220805.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/62=
fa1ecff787f71609daf06c
        new failure (last pass: renesas-next-2022-07-07-v5.19-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
2fa1ecff787f71609daf06e
        new failure (last pass: renesas-next-2022-07-07-v5.19-rc1)

    2022-08-15T10:23:53.634260  / # =

    2022-08-15T10:23:53.639244  =

    2022-08-15T10:23:53.740935  / # #
    2022-08-15T10:23:53.745542  #
    2022-08-15T10:23:53.846557  / # export SHELL=3D/bin/sh
    2022-08-15T10:23:53.851290  export SHELL=3D/bin/sh
    2022-08-15T10:23:53.952201  / # . /lava-7036492/environment
    2022-08-15T10:23:53.957288  . /lava-7036492/environment
    2022-08-15T10:23:54.058210  / # /lava-7036492/bin/lava-test-runner /lav=
a-7036492/0
    2022-08-15T10:23:54.063149  /lava-7036492/bin/lava-test-runner /lava-70=
36492/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62fa1f7f0ee64d60e1daf08f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-15-v6.0-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-15-v6.0-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220805.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/62fa1f7f0ee64d60e1daf0=
90
        new failure (last pass: renesas-next-2022-07-05-v5.19-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/62fa205b52d10878e1daf06d

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-15-v6.0-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-15-v6.0-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220805.0/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/62=
fa205b52d10878e1daf07e
        new failure (last pass: renesas-next-2022-07-05-v5.19-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
2fa205b52d10878e1daf080
        new failure (last pass: renesas-next-2022-07-05-v5.19-rc1)

    2022-08-15T10:30:39.666328  / # =

    2022-08-15T10:30:39.667844  =

    2022-08-15T10:30:39.771595  / # #
    2022-08-15T10:30:39.773301  #
    2022-08-15T10:30:39.876961  / # export SHELL=3D/bin/sh
    2022-08-15T10:30:39.879138  export SHELL=3D/bin/sh
    2022-08-15T10:30:39.981248  / # . /lava-7036615/environment
    2022-08-15T10:30:39.983573  . /lava-7036615/environment
    2022-08-15T10:30:40.087414  / # /lava-7036615/bin/lava-test-runner /lav=
a-7036615/0
    2022-08-15T10:30:40.089683  /lava-7036615/bin/lava-test-runner /lava-70=
36615/0 =

    ... (10 line(s) more)  =

 =20
