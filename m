Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BEC8521080
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 May 2022 11:17:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238553AbiEJJVS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 May 2022 05:21:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238541AbiEJJVP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 May 2022 05:21:15 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52CED209B72
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 May 2022 02:17:18 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id 15so14153121pgf.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 May 2022 02:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=S9ekuMVGhvMceGCmcuhW0X17/0uRhFB0oQvZNQ7p010=;
        b=7JZ5npiPr26GtDPA/NTiZUaEdIpY+jdKN/QqE3734241xhNKtuJoSucJI/sBHQ4Y9d
         tTPZxXR8JoMrWfAs9PzS+7HjZzraC/qjieKgRmBXwA+8S2BjR4dnDUsmhRg2d5R12eTM
         qeE6y9kRU/l6xBlEarfevq3KbYe9jaOFw3szNojxSdiI2Gr21fgzZVpPZsHj6xFhaGFj
         tIojc3G719eDysKlCPFZW+FYQQCivIz/WNPtHIH1LlZhWrJAPodC7PMNW+8/Ixii6K9A
         6S/SPmwo8+uooSh1nPtWXxWpnFRc5Rn00q52PQ81LnskEXblUynxIA1TFSfClJ0E+G4S
         YnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=S9ekuMVGhvMceGCmcuhW0X17/0uRhFB0oQvZNQ7p010=;
        b=nZmgDPiG0S046NRdhPGW7ApZ9JhI1HV1pgjRx5Ei00XsgKzrZOSnASC588Tb59QEhJ
         E9gw6hqhvj9mk4fH3aUQucfylZXq+rJI0/g4gaEL1qIRgejw5KsGgzqXolzzjhy9+XcJ
         DKKhCdFk5DOt5JJ/acLraUDVh64gU9ZhYy6Nxk/UyiGP1oVxzcbiR6SfLj1Ve84TVNO7
         Zzu7QAqLFvTa4caVM13ymzS3v9OZRvMGxxlmLCNAX8KfD3PWpe0i4gH4OzEnDVhXYDtQ
         GuLxC5DkpCsYGnv1O6ZwBjF0fQvCiE/FlW/W0NbU3HqZYRYs1vrJWsxjzQ8VUt/19/Iz
         yljw==
X-Gm-Message-State: AOAM531cjye7cZfwXsI0eG03p3ryPM+IlwpPzcSM0P+4k/dfBg2NHnoo
        peALZEFfhWwh+933R7etSQwivJB14jswhCsbnPw=
X-Google-Smtp-Source: ABdhPJxV4RYcJc9yRv2OudR+g/BY9Jc/2Y+K/H3LlUiydoqo+NiIWbFxTJoDKiA+mn2uKvYp3wppAg==
X-Received: by 2002:a05:6a00:22c6:b0:510:3c78:638d with SMTP id f6-20020a056a0022c600b005103c78638dmr19806724pfj.54.1652174237638;
        Tue, 10 May 2022 02:17:17 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q6-20020a17090a430600b001dbe7ccdd4dsm1311285pjg.10.2022.05.10.02.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 02:17:17 -0700 (PDT)
Message-ID: <627a2d9d.1c69fb81.d84a.3321@mx.google.com>
Date:   Tue, 10 May 2022 02:17:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-05-09-v5.18-rc6
Subject: renesas/master baseline-nfs: 87 runs,
 5 regressions (renesas-devel-2022-05-09-v5.18-rc6)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 87 runs, 5 regressions (renesas-devel-2022-05-=
09-v5.18-rc6)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug            | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-10   | defconfig=
+debug            | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
                  | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
                  | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-05-09-v5.18-rc6/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-05-09-v5.18-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      96a98dbdcdfa4ace2fe647058d40c5950b1204cd =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug            | 1          =


  Details:     https://kernelci.org/test/plan/id/6279814c548ac7efad8f571d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-09-v5.18-rc6/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-nfs-=
meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-09-v5.18-rc6/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-nfs-=
meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220506.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6279814c548ac7efa=
d8f571e
        new failure (last pass: renesas-devel-2022-05-05-v5.18-rc5) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-10   | defconfig=
+debug            | 1          =


  Details:     https://kernelci.org/test/plan/id/6279792ada7da0fdac8f573d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-09-v5.18-rc6/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-nfs=
-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-09-v5.18-rc6/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-nfs=
-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220506.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6279792ada7da0fda=
c8f573e
        new failure (last pass: renesas-devel-2022-05-05-v5.18-rc5) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/627974e884c19e1c218f5717

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-09-v5.18-rc6/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-=
gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-09-v5.18-rc6/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-=
gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220506.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/627974e884c19e1c2=
18f5718
        failing since 4 days (last pass: renesas-devel-2022-05-03-v5.18-rc5=
, first fail: renesas-devel-2022-05-05-v5.18-rc5) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/627974acefff98db238f574b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-09-v5.18-rc6/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-r8a779=
50-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-09-v5.18-rc6/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-r8a779=
50-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220506.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/627974acefff98db2=
38f574c
        new failure (last pass: renesas-devel-2022-05-05-v5.18-rc5) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62797db5e102059cca8f574d

  Results:     82 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-09-v5.18-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-09-v5.18-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220506.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/cas=
e/id/62797db5e102059cca8f57a2
        failing since 62 days (last pass: renesas-devel-2022-02-28-v5.17-rc=
6, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-05-09T20:46:32.964647  <8>[   35.092545] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-05-09T20:46:34.003222  /lava-6313066/1/../bin/lava-test-case
    2022-05-09T20:46:34.031697  <8>[   36.159958] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
