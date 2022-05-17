Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7721652A4C1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 May 2022 16:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344754AbiEQOZk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 May 2022 10:25:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241347AbiEQOZj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 May 2022 10:25:39 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF3F9CE15
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 May 2022 07:25:37 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id w200so1137464pfc.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 May 2022 07:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=dmujmvnHVO24YMvW8lqnV0MsOp2phUIfXU/jAXX1hvg=;
        b=JS/Vn1JtNy3R2M4UWDw4yiHvQbpdWwUr+u+lz6NOdcKBE646f+FOlkz2wDDTXKUFlL
         555lizHPW6ZKFmrwd3+tL1PKP4hh4azzIaSn8WUKdvIsZbt1a1RcyT4kuwPOfNBWPUFX
         iyY/4shyZv6PKUxwPf22q/P4xpFlqDfdOpPPWU1McAJOPjDa6QxzAevp+F01DgKSo7iN
         veYSHKAtheznMOtrU9YFKb6Ke5i/I9t4krKGoxaFDytPco7wtWHG8vJThV0WblT85UnQ
         kqwr1j00pmWLQZBiJwiGBxd01286zDkBd9NR8H/0L0G17WjhfAJL5uCefihNKDDmmJCk
         PxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=dmujmvnHVO24YMvW8lqnV0MsOp2phUIfXU/jAXX1hvg=;
        b=aRPNSBXPDT143wtHRyDeBVPJdQNF6l9sv5zJPoes3kWYV1ZElPSBTrNd86YG8+u6gv
         2h1/bSkIUA5W5tPniqbdnWnixRV4VbWE1xMCS9nR5gBghzUi+DEyjLiph7TIBdXmc73w
         /0Hxjjuws5jAUCb8XchoRPt460A6/xuqpLW1qGEWphomSjOBjcftEScxXaCcjj91Q7PQ
         eklZLWny8WCy2iBKjjrzCIKB1QAXn540nHlH2w50oZzwwdWbChO6JBcrvFEVsCVt1mGz
         mRBDoaLXOgpMdfWOxnff7qEpduEbuotqdEZNLcaevUL6XzFqrftnzjw+XV+YeUluE1gm
         TqTg==
X-Gm-Message-State: AOAM532frZPqWYRCU+7fW4FC7Zw+GqhCNAtFg0Gyg8ZhEcurfanzW2Uo
        xr5i8pjFgkdQcWku27vVB8CAkBU1bOQIPFMG4ZQ=
X-Google-Smtp-Source: ABdhPJz7hAgZ/EHSHM59zM/1Xt7iZHJraK87bAwwxvbVjlH28x2CIQj0Z2W+AO+zDT8KTE586/9TTQ==
X-Received: by 2002:a63:df45:0:b0:3c5:1242:2282 with SMTP id h5-20020a63df45000000b003c512422282mr19570186pgj.435.1652797537196;
        Tue, 17 May 2022 07:25:37 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x1-20020a17090ab00100b001df58f4649fsm1755827pjq.18.2022.05.17.07.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 07:25:36 -0700 (PDT)
Message-ID: <6283b060.1c69fb81.ceafd.45a4@mx.google.com>
Date:   Tue, 17 May 2022 07:25:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-05-17-v5.18-rc7
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 75 runs,
 7 regressions (renesas-devel-2022-05-17-v5.18-rc7)
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

renesas/master baseline-nfs: 75 runs, 7 regressions (renesas-devel-2022-05-=
17-v5.18-rc7)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+crypto             | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-05-17-v5.18-rc7/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-05-17-v5.18-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6bd98cbba53cd9f63aaf4d82982dff95c824b92a =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62837b582120d5e657a39bfa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-17-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-nfs-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-17-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-nfs-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220513.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62837b582120d5e65=
7a39bfb
        failing since 0 day (last pass: renesas-devel-2022-05-09-v5.18-rc6,=
 first fail: renesas-devel-2022-05-16-v5.18-rc7) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62837b79b4defeb49aa39c12

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-17-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-17-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220513.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62837b79b4defeb49=
aa39c13
        failing since 0 day (last pass: renesas-devel-2022-05-09-v5.18-rc6,=
 first fail: renesas-devel-2022-05-16-v5.18-rc7) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/628385640c22cbcda2a39bd9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-17-v5.18-rc7/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-nfs-r8a7=
74a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-17-v5.18-rc7/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-nfs-r8a7=
74a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220513.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/628385640c22cbcda=
2a39bda
        new failure (last pass: renesas-devel-2022-05-16-v5.18-rc7) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62837c4a1a0e52a8d5a39bef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-17-v5.18-rc7/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-r8a779=
50-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-17-v5.18-rc7/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-r8a779=
50-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220513.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62837c4a1a0e52a8d=
5a39bf0
        new failure (last pass: renesas-devel-2022-05-16-v5.18-rc7) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/62837f2f73309f23bfa39c6a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-17-v5.18-rc7/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs=
-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-17-v5.18-rc7/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs=
-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220513.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62837f2f73309f23b=
fa39c6b
        new failure (last pass: renesas-devel-2022-05-16-v5.18-rc7) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/628384bcd124744b75a39bd4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-17-v5.18-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ba=
ylibre/baseline-nfs-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-17-v5.18-rc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ba=
ylibre/baseline-nfs-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220513.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/628384bcd124744b7=
5a39bd5
        new failure (last pass: renesas-devel-2022-04-19-v5.18-rc3) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62837ced6a23d262a1a39be2

  Results:     82 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-17-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-17-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220513.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/cas=
e/id/62837ced6a23d262a1a39c07
        failing since 69 days (last pass: renesas-devel-2022-02-28-v5.17-rc=
6, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-05-17T10:45:48.811881  /lava-6403041/1/../bin/lava-test-case
    2022-05-17T10:45:48.844204  <8>[   38.052339] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
