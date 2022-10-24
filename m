Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52A4A60AF6A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Oct 2022 17:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbiJXPtW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Oct 2022 11:49:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231686AbiJXPsl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Oct 2022 11:48:41 -0400
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF1F7EF580
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Oct 2022 07:41:51 -0700 (PDT)
Received: by mail-pj1-f42.google.com with SMTP id v13-20020a17090a6b0d00b0021332e5388fso389445pjj.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Oct 2022 07:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ME8ZKh/vmw6V2GdJRN3ePtwZQR1dIq/YZE19ax8t1jQ=;
        b=t7TTAZqsQvy/oQimAqaiCrK3vu1fTJNH339h/XFzLdUoo5zTMPRiFzAM02zpUopeGu
         0/n4bOYEA7nE2qE7sfxtqRGUsjJNtfcSatHC2BYRi9Iu8n7dfMnDZwihHo0PyVBNUgwb
         mQCfS8Y1RLYNx8GMYhKFJdt2r6Y0/hBELlr2GPes7pb2gxoCg7jNmg9Nauf4pN+ZV6DX
         aRJlX4saTYVzcGO9qhjlmkFf+oMEn6Eb29ogiyZDRR2Qf1MmCnGGR2m2+qqHbPsOrSCL
         hI/ZVQg1ZrKmriVFLFLJSp3fPsr6yXjVnBnZtXTDRVgLIodXm/2/0b3OcAyEX9cDiVu3
         NcqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ME8ZKh/vmw6V2GdJRN3ePtwZQR1dIq/YZE19ax8t1jQ=;
        b=BOK+aZ+Caw/mWxDL1S/osktJukJZdyTLiC5wMlhtDGbS8KyFOpphF7+eGQaFXXLpDG
         oalnaE/N8OVfomlYYmzfRpy26noVmTbqMsNdDzddFbdjnbIecpZ4CkOKjsDl90Mh4jPO
         SvOYS9DQ9k+gAVxXRtlwhsHXQEdr4zzES9/8doAwBqMnqUDOg5fAt809UZv+HuBdNHlG
         WJbQEREkGUf8xdNQbdkU29yjNlTh5+/DkkI+x3iQZbYvBm/i31a2PCd/CKMfeaWPy15H
         qIGx+Y6xDmLZhKxHdD5+v/NmsvQV5Y6BmfAzKu+6KGlU52xb770LUat2TRfAhpwdF0hL
         83SQ==
X-Gm-Message-State: ACrzQf1ofWlArAzJ10DCM1ez9WJw5p/HDegi2gR7LOp/4UMPoUi89lCv
        ThxnrGCM63E0ppkwx3u4YeTiCLsoDP8P9YGE
X-Google-Smtp-Source: AMsMyM5Vrf5ICu4ISKaQz++xz+i+fjVTV1yg7kisdme2U/gfrxzergDteb88PiS4EFjDKbfLCrCiGw==
X-Received: by 2002:a17:902:ce08:b0:179:ed2b:8cd8 with SMTP id k8-20020a170902ce0800b00179ed2b8cd8mr33711247plg.23.1666622336675;
        Mon, 24 Oct 2022 07:38:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b9-20020a1709027e0900b001780e4e6b65sm19303683plm.114.2022.10.24.07.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 07:38:56 -0700 (PDT)
Message-ID: <6356a380.170a0220.bca35.4bcb@mx.google.com>
Date:   Mon, 24 Oct 2022 07:38:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-10-24-v6.1-rc2
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 125 runs,
 9 regressions (renesas-devel-2022-10-24-v6.1-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 125 runs, 9 regressions (renesas-devel-2022-10=
-24-v6.1-rc2)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
cubietruck                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+ima       | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+videodec           | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie   | gcc-10   | defconfig=
+debug              | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-10-24-v6.1-rc2/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-10-24-v6.1-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      547a476a7857aadfcaa264982527697926c55d6a =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
cubietruck                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/635670bcc3de7d3e705e5b5a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseli=
ne-nfs-cubietruck.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseli=
ne-nfs-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221007.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/635670bcc3de7d3e7=
05e5b5b
        new failure (last pass: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63566caf1110aef00c5e5b98

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibr=
e/baseline-nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibr=
e/baseline-nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221007.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63566caf1110aef00=
c5e5b99
        failing since 6 days (last pass: renesas-devel-2022-09-27-v6.0-rc7,=
 first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63567054bdb4878f075e5b92

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseli=
ne-nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseli=
ne-nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221007.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63567054bdb4878f0=
75e5b93
        new failure (last pass: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6356728a0db3b9aa885e5b86

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs-=
jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs-=
jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221007.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6356728a0db3b9aa8=
85e5b87
        failing since 27 days (last pass: renesas-devel-2022-09-19-v6.0-rc6=
, first fail: renesas-devel-2022-09-27-v6.0-rc7) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/635676fcef70afdfd55e5bb6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-=
nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-=
nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221007.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/635676fcef70afdfd=
55e5bb7
        new failure (last pass: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63566d677f3fdfad595e5b67

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-nf=
s-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-nf=
s-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221007.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63566d677f3fdfad5=
95e5b68
        failing since 20 days (last pass: renesas-devel-2022-09-19-v6.0-rc6=
, first fail: renesas-devel-2022-10-03-v6.0) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/635674298a7d39481e5e5b57

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bay=
libre/baseline-nfs-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bay=
libre/baseline-nfs-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221007.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/635674298a7d39481=
e5e5b58
        failing since 27 days (last pass: renesas-devel-2022-09-19-v6.0-rc6=
, first fail: renesas-devel-2022-09-27-v6.0-rc7) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63566ccd33aa1660b05e5b3a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221007.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63566ccd33aa1660b=
05e5b3b
        failing since 69 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie   | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6356772eaa346bb8215e5b47

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-nfs-su=
n50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-nfs-su=
n50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221007.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6356772eaa346bb82=
15e5b48
        new failure (last pass: renesas-devel-2022-09-19-v6.0-rc6) =

 =20
