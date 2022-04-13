Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F713500010
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Apr 2022 22:38:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbiDMUka (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Apr 2022 16:40:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234149AbiDMUk3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Apr 2022 16:40:29 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 435314D61F
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Apr 2022 13:38:07 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id 12so2909214pll.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Apr 2022 13:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Pw6bvvmxZ1e9nnJpdnYO2SZTJUSW5iwFXB1gaocBkp4=;
        b=RtI1zhX3SGBdlp3x71ucrSpQZqH5dCwHlGyda4wN1gVgW71bdAHITB/ZWFvYkXDRW9
         /3SkpbHYnK3mmhDpo5jrA4u0Y9u5iOen1m9AI6rEKOXToZL0/X7sJWfp3lSY7lzI2QAo
         2nU1p2iZBhn2GLTW/hGW76LalAJlmg58zaC1qhsnfJyL6UVeEKXqofxy/PRZySB7jRF4
         wFBKQqpeGsWj8TuzduIuceE+Qlg/6YCXfjDa0D5h3znFFJ0/Xegj6MJqIegSofNOTsxL
         Q7gXp0nUUZsYQru+DXlwEt5/LkfZ/UcQC693+so3xtWSkS91YI/xG1qDs1JSydapiTBG
         3Erg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Pw6bvvmxZ1e9nnJpdnYO2SZTJUSW5iwFXB1gaocBkp4=;
        b=KgrGfoOX1PzGxO5IDznnXNncyatAjX7UVLt78jhElGUtwgAQi/vJWUQhswBX8Q/wXc
         TvSNOufHXU4Vrs8VhgAMAJI56D+aYqeWDI88mV/PLYjysA7K+MS678vJ6Pc4tcC21PbN
         g83K3iE0opEJGYWKMdxa/VvebYwc5qCbUd+Bf2nDmQWE/wvhci8oxVf1VwcfSfoc6ACw
         4Wa0G/oYv7CWPMLU71nDrEnHI3BeAetJ1nO5/ivitDWRziirgPWlhstQ/gLxUfIJCm/F
         tFbqJZ3LbGCjD6a6pyLHhpOOq79xJZoJa+Q7jSpFY10tHb5wsmgS0KeCKmVzAGWqdG9C
         da2Q==
X-Gm-Message-State: AOAM530OAD2BdUnk1se3F+W+nU8UTYH2GnfdF9C69QWSnEPV/9C7TQIK
        DMrfiUdwYKkLke1iZ71ommeCuEIE2ytwDMCs
X-Google-Smtp-Source: ABdhPJyUM6JRDx9+IMNzWLKxFfxX1SFNwnb9GMTViFKhe2zSp2Q1HKSXwPuSfTMLjpXvYcwDLEx5Ow==
X-Received: by 2002:a17:902:edd1:b0:158:8318:b51e with SMTP id q17-20020a170902edd100b001588318b51emr11469284plk.89.1649882286600;
        Wed, 13 Apr 2022 13:38:06 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z16-20020a056a00241000b004f3a647ae89sm45098694pfh.174.2022.04.13.13.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 13:38:06 -0700 (PDT)
Message-ID: <625734ae.1c69fb81.8039d.519b@mx.google.com>
Date:   Wed, 13 Apr 2022 13:38:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-04-13-v5.18-rc2
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 306 runs,
 4 regressions (renesas-devel-2022-04-13-v5.18-rc2)
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

renesas/master baseline: 306 runs, 4 regressions (renesas-devel-2022-04-13-=
v5.18-rc2)

Regressions Summary
-------------------

platform             | arch  | lab           | compiler | defconfig        =
          | regressions
---------------------+-------+---------------+----------+------------------=
----------+------------
meson-gxl-s905d-p230 | arm64 | lab-baylibre  | gcc-10   | defconfig+ima    =
          | 1          =

r8a77950-salvator-x  | arm64 | lab-baylibre  | gcc-10   | defconfig+ima    =
          | 1          =

r8a77950-salvator-x  | arm64 | lab-baylibre  | gcc-10   | defconfig+crypto =
          | 1          =

rk3399-gru-kevin     | arm64 | lab-collabora | gcc-10   | defconfig+arm64-c=
hromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-04-13-v5.18-rc2/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-04-13-v5.18-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      83f3d1f783134ab640a936201ad287ae8570cec3 =



Test Regressions
---------------- =



platform             | arch  | lab           | compiler | defconfig        =
          | regressions
---------------------+-------+---------------+----------+------------------=
----------+------------
meson-gxl-s905d-p230 | arm64 | lab-baylibre  | gcc-10   | defconfig+ima    =
          | 1          =


  Details:     https://kernelci.org/test/plan/id/625720fabf2b43c306ae067c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-13-v5.18-rc2/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-=
gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-13-v5.18-rc2/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-=
gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/625720fabf2b43c306ae0=
67d
        new failure (last pass: renesas-devel-2022-03-08-v5.17-rc7) =

 =



platform             | arch  | lab           | compiler | defconfig        =
          | regressions
---------------------+-------+---------------+----------+------------------=
----------+------------
r8a77950-salvator-x  | arm64 | lab-baylibre  | gcc-10   | defconfig+ima    =
          | 1          =


  Details:     https://kernelci.org/test/plan/id/625726e13c6ada844cae06a8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-13-v5.18-rc2/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a779=
50-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-13-v5.18-rc2/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a779=
50-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/625726e13c6ada844cae0=
6a9
        failing since 1 day (last pass: renesas-devel-2022-04-04-v5.18-rc1,=
 first fail: renesas-devel-2022-04-11-v5.18-rc2) =

 =



platform             | arch  | lab           | compiler | defconfig        =
          | regressions
---------------------+-------+---------------+----------+------------------=
----------+------------
r8a77950-salvator-x  | arm64 | lab-baylibre  | gcc-10   | defconfig+crypto =
          | 1          =


  Details:     https://kernelci.org/test/plan/id/62572c82e251547b74ae06b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-13-v5.18-rc2/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-r8a=
77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-13-v5.18-rc2/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-r8a=
77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62572c82e251547b74ae0=
6b3
        new failure (last pass: renesas-devel-2022-04-11-v5.18-rc2) =

 =



platform             | arch  | lab           | compiler | defconfig        =
          | regressions
---------------------+-------+---------------+----------+------------------=
----------+------------
rk3399-gru-kevin     | arm64 | lab-collabora | gcc-10   | defconfig+arm64-c=
hromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6257041fbab695dbe3ae0695

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-13-v5.18-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-13-v5.18-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/6257041fbab695dbe3ae06b7
        failing since 36 days (last pass: renesas-devel-2022-02-28-v5.17-rc=
6, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-04-13T17:10:46.275618  <8>[   34.299014] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-04-13T17:10:47.311680  /lava-6080239/1/../bin/lava-test-case   =

 =20
