Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEAB25F33E0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Oct 2022 18:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbiJCQsF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Oct 2022 12:48:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbiJCQsA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Oct 2022 12:48:00 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A400303EA
        for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Oct 2022 09:47:59 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id 70so10368161pjo.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Oct 2022 09:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=W1HSEm9f3u0qIMXW2ATcrePLO9nczNzppEZTHrnnlWc=;
        b=mu6SCXDxBmvHnEXcUGSBd3og/yfmcSexvMY8h5m8rZC1nlp06tGBl5BmxS1Tl8FmqH
         Z4QjO2Yn4PEsUGsy9DueLKnxX9rZhVqoGVb5B/fsWgD+7wzdlqxhCykEdsRV6TrE9avm
         fxGrXHU9v0VMNS+4WrKwjBa+QgNaY+RQIs1DevgqyzLc0seoZYHsP6OraHOxh+/bfpXH
         Sb/7/S74rQUYFPjIMwGL1sftqL1xHHRU+hiUNRwD771bblwUYF+qK/2P1m+rWhQ/ecPC
         fCWVx027q0Zr4ZVbEjblym+rBAouzt+t7jcVidz1ON3JeRBRryg18grIHB7FOHvyojrn
         M1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=W1HSEm9f3u0qIMXW2ATcrePLO9nczNzppEZTHrnnlWc=;
        b=EyOFdUX7i2gGZe4mRODDuH1S+FsYL3CJryXjLiVC8pOd8g0B1VMWbCBL6u3dEYq2AM
         uOQi2YoVDlO53pT+FR+3M2aQoqpHBK6uRVwTbkPXEksba4TZRkExNmQxKg3FDUT7p0d5
         D93spIX+TVlF9F1s6bCoDanlZ6qTUz4Ddv7IwpGnauXqQVuS157rqbAUtiox4LrZq1xc
         1eMyPVbwGJYan2/68eF5X4uFlqgx3xv9IH5BIrSKMSTt3117A9D66uJL0ZVazBVlF9Af
         PjcbSj/txMAmNLK5Cr5vs5hRh9aKGPMnIvIl8sG7gq+d8sc8kZFyxuvScyGOvl8rI/HI
         +oEg==
X-Gm-Message-State: ACrzQf0azpMjV4PW+fOnzI/VxJIWqNepj4ENhV93a1aYOkJbW9xcY8wW
        KedbNS/JPkuvBj1iAAfXAq/0mqIt6nAjluTwNUY=
X-Google-Smtp-Source: AMsMyM6Ov0vGuIuQp3zM9a8lDSPN1M+ZTyuJzslFFlpukk6d9xPtbHwy2SJMjbGB28oOveX3JfjoUw==
X-Received: by 2002:a17:902:b942:b0:178:4a7e:da04 with SMTP id h2-20020a170902b94200b001784a7eda04mr23066797pls.8.1664815678491;
        Mon, 03 Oct 2022 09:47:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d23-20020a17090a02d700b001fd7e56da4csm10324364pjd.39.2022.10.03.09.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 09:47:58 -0700 (PDT)
Message-ID: <633b123e.170a0220.a6dad.17a3@mx.google.com>
Date:   Mon, 03 Oct 2022 09:47:58 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2022-10-03-v6.0
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 53 runs,
 7 regressions (renesas-devel-2022-10-03-v6.0)
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

renesas/master baseline-nfs: 53 runs, 7 regressions (renesas-devel-2022-10-=
03-v6.0)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | at91_dt_d=
efconfig          | 1          =

imx6dl-udoo                  | arm   | lab-broonie   | gcc-10   | imx_v6_v7=
_defconfig        | 1          =

imx6q-udoo                   | arm   | lab-broonie   | gcc-10   | imx_v6_v7=
_defconfig        | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+videodec         | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug            | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | renesas_d=
efconfig          | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-10-03-v6.0/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-10-03-v6.0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f0dbcd134f5abcdd4e2ad16bc81a158b2a23e2d9 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | at91_dt_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/633add7d926dcc61d8ec4ea7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at91sa=
m9g20ek.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at91sa=
m9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220923.1/armel/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/633add7d926dcc61d=
8ec4ea8
        new failure (last pass: renesas-devel-2022-09-27-v6.0-rc7) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx6dl-udoo                  | arm   | lab-broonie   | gcc-10   | imx_v6_v7=
_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/633ae94b1ec063a04dcab5fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-imx6=
dl-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-imx6=
dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220923.1/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/633ae94b1ec063a04=
dcab5fb
        failing since 14 days (last pass: v6.0-rc5-843-g94f27a9ea269, first=
 fail: renesas-devel-2022-09-19-v6.0-rc6) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx6q-udoo                   | arm   | lab-broonie   | gcc-10   | imx_v6_v7=
_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/633aea1331da6bbc58cab5ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-imx6=
q-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-imx6=
q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220923.1/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/633aea1331da6bbc5=
8cab5ed
        failing since 5 days (last pass: renesas-devel-2022-09-19-v6.0-rc6,=
 first fail: renesas-devel-2022-09-27-v6.0-rc7) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+videodec         | 1          =


  Details:     https://kernelci.org/test/plan/id/633ae58c447bda4044cab6a9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-nfs-me=
son-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-nfs-me=
son-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220923.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/633ae58c447bda404=
4cab6aa
        new failure (last pass: renesas-devel-2022-09-19-v6.0-rc6) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug            | 1          =


  Details:     https://kernelci.org/test/plan/id/633ae7088df975e5c3cab5f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-nfs-meson=
-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-nfs-meson=
-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220923.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/633ae7088df975e5c=
3cab5f2
        failing since 30 days (last pass: renesas-devel-2022-08-30-v6.0-rc3=
, first fail: renesas-devel-2022-09-02-v6.0-rc3) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/633ae0f75c6db1a6e5ec4ea9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseli=
ne-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseli=
ne-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220923.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/633ae0f75c6db1a6e=
5ec4eaa
        failing since 48 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | renesas_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/633ade4a569f832b9fec4ea6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: renesas_defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm64/renesas_defconfig/gcc-10/lab-baylibre/baseline-nfs-r8a=
77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm64/renesas_defconfig/gcc-10/lab-baylibre/baseline-nfs-r8a=
77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220923.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/633ade4a569f832b9=
fec4ea7
        new failure (last pass: renesas-devel-2022-09-27-v6.0-rc7) =

 =20
