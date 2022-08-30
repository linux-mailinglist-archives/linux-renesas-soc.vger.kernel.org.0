Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 402AE5A647D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Aug 2022 15:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbiH3NQK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Aug 2022 09:16:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbiH3NQJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2022 09:16:09 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 951E7B2777
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 06:16:05 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id i5-20020a17090a2a0500b001fd8708ffdfso8700217pjd.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 06:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=fI7SlfNyU6DBX2dpGsfvJpZpUqvnCojhPieBxSuVuTI=;
        b=ypNSjHxWx8fdYvLGKVvVvxhWySi0jSP3TT4xJKhN4Fix/7PhdQYjp1z6L+ICOBM20T
         DOmYfVs75aV7Z6eYzYK4mhTL35CYpnsilEvLk4WGq+ciWc3sr0ocqXC015Yk6WL5AUK4
         UzDx/O5Ai9nmSRWdtgAksn/8lxx6aRJjptudPCABjVddh0xmUwxOugTedoELFoKhoeH+
         3RuYN7TACOXLGR/vtEM5NaDRH0glW0/mG5in+s3cHL/rEpHVX/Vv/JrPC32tbeVWvqHa
         b4xap/2P1JNhg2pHP2HyqzAwEoiAy14uQS92SEvHXb2ql7G+oU9M0RQZmYlXNcCz51f4
         zesg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=fI7SlfNyU6DBX2dpGsfvJpZpUqvnCojhPieBxSuVuTI=;
        b=tJ6RwXz2IoaD2FiRvZEnSVOJo9tLhN5bjYcwRKJvYQ/mziaumvVZDHTIHYqh97mj69
         mbdR4KDWh/g3v7+d6PjhR8fZB3SD0lqoPFaamP2l6eMmYOioMnlI4EIKPWVoddblYArp
         9mJqO7J1P5R+VQiDMODAfkSPVkaeOjul3KEmXPmVj2S1txh3PUTUZ/lMg9gOrpqEoUqo
         4RyXlL6bZBsNFrvwDh2b7wa/0HX2qSZ7GL4I0HQzZfADSkFQYxrr/l/s7H5uSfDdzgAo
         vZAxkSRzbAiFi/i5Y7pGzWIoUmGz9RiBucdcVn2bqWnxVwW+gpibf/3C96g6sYGtBj+1
         H/SA==
X-Gm-Message-State: ACgBeo0MUM88PbKf71Z41pPoMEvnUOdCnBdSYH4POOtlc1mFBJb9vlJT
        ww62MS+ST3whFTP5fFH6LbtZEyn0jTGzryRjsC0=
X-Google-Smtp-Source: AA6agR48Rw+Tdct7FlgWBTqwXc/MCWk/awanCshcuTTAdmT8pSnr/hG1ZFidpyKvjC2XuCGumxcycg==
X-Received: by 2002:a17:90b:1c04:b0:1fb:6b2c:ca8f with SMTP id oc4-20020a17090b1c0400b001fb6b2cca8fmr23248157pjb.88.1661865364687;
        Tue, 30 Aug 2022 06:16:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a8-20020aa794a8000000b005371689d70fsm9257586pfl.120.2022.08.30.06.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 06:16:03 -0700 (PDT)
Message-ID: <630e0d93.a70a0220.31c4e.0026@mx.google.com>
Date:   Tue, 30 Aug 2022 06:16:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-08-30-v6.0-rc3
Subject: renesas/master baseline-nfs: 137 runs,
 18 regressions (renesas-devel-2022-08-30-v6.0-rc3)
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

renesas/master baseline-nfs: 137 runs, 18 regressions (renesas-devel-2022-0=
8-30-v6.0-rc3)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beaglebone-black             | arm    | lab-cip       | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm    | lab-cip       | gcc-10   | multi_v7=
_defconfig+ima       | 1          =

beaglebone-black             | arm    | lab-cip       | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

beaglebone-black             | arm    | lab-cip       | gcc-10   | multi_v7=
_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+crypto             | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+ima                | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+ima                | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | gcc-10   | renesas_=
defconfig            | 1          =

r8a77950-salvator-x          | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+crypto             | 1          =

r8a77950-salvator-x          | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+ima                | 1          =

r8a77950-salvator-x          | arm64  | lab-baylibre  | gcc-10   | renesas_=
defconfig            | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-08-30-v6.0-rc3/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-08-30-v6.0-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      87c1cb103bc6896ad3e45e0cc1417b57696d733a =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beaglebone-black             | arm    | lab-cip       | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/630dd717219594734535565d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-cip/baseline-nfs-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-cip/baseline-nfs-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220826.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/630dd717219594734=
535565e
        failing since 13 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beaglebone-black             | arm    | lab-cip       | gcc-10   | multi_v7=
_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/630dd85c1446973590355644

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+ima/gcc-10/lab-cip/baseline-nfs-b=
eaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+ima/gcc-10/lab-cip/baseline-nfs-b=
eaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220826.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/630dd85c144697359=
0355645
        failing since 7 days (last pass: renesas-devel-2022-08-11-v5.19, fi=
rst fail: renesas-devel-2022-08-22-v6.0-rc2) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beaglebone-black             | arm    | lab-cip       | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/630ddb3be86d881ce93556cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/bas=
eline-nfs-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/bas=
eline-nfs-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220826.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/630ddb3be86d881ce=
93556d0
        failing since 14 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beaglebone-black             | arm    | lab-cip       | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/630ddc6c34893e47ca35566a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-nfs-beagl=
ebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-nfs-beagl=
ebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220826.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/630ddc6c34893e47c=
a35566b
        failing since 13 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
cubietruck                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/630de11017b214b5db3556a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibr=
e/baseline-nfs-cubietruck.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibr=
e/baseline-nfs-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220826.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/630de11017b214b5d=
b3556a7
        new failure (last pass: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
cubietruck                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/630de2857830ba99c1355687

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220826.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/630de2857830ba99c=
1355688
        new failure (last pass: renesas-devel-2022-08-22-v6.0-rc2) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/630dde2560439ff2fa355683

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220826.0/amd64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/630dde25604=
39ff2fa355688
        new failure (last pass: renesas-devel-2022-08-22-v6.0-rc2)
        1 lines

    2022-08-30T09:53:31.293403  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector
    2022-08-30T09:53:31.308857  <8>[   16.791100] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/630dd7b0c664f11923355642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-=
meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-=
meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220826.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/630dd7b0c664f1192=
3355643
        new failure (last pass: renesas-devel-2022-08-22-v6.0-rc2) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/630dd92c59cef2eb2035567b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-mes=
on-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-mes=
on-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220826.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/630dd92c59cef2eb2=
035567c
        new failure (last pass: renesas-devel-2022-08-22-v6.0-rc2) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/630dd74d101ce8d0ba3556a5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-mes=
on-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-mes=
on-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220826.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/630dd74d101ce8d0b=
a3556a6
        failing since 18 days (last pass: renesas-devel-2021-12-14-v5.16-rc=
5, first fail: renesas-devel-2022-08-11-v5.19-rc8) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/630dd7c568ab6fe09335565b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bay=
libre/baseline-nfs-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bay=
libre/baseline-nfs-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220826.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/630dd7c568ab6fe09=
335565c
        failing since 18 days (last pass: renesas-devel-2021-12-14-v5.16-rc=
5, first fail: renesas-devel-2022-08-11-v5.19-rc8) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/630dd7c6c664f11923355688

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-g=
xm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-g=
xm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220826.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/630dd7c6c664f1192=
3355689
        failing since 18 days (last pass: renesas-devel-2021-12-06-v5.16-rc=
4-15-g9f95ae4ce1f1, first fail: renesas-devel-2022-08-11-v5.19-rc8) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/630dd7d867e71076f435571b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220826.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/630dd7d867e71076f=
435571c
        failing since 13 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | gcc-10   | renesas_=
defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/630de4d1852afcc089355645

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: renesas_defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-nfs-r8a7=
74a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-nfs-r8a7=
74a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220826.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/630de4d1852=
afcc08935564c
        new failure (last pass: renesas-devel-2022-08-16-v6.0-rc1)
        1 lines

    2022-08-30T10:21:40.103018  kern  :emerg : Disabling IRQ #33
    2022-08-30T10:21:40.364213  [   45.501200] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77950-salvator-x          | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/630dd7d068ab6fe093355674

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-=
r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-=
r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220826.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/630dd7d068ab6fe09=
3355675
        failing since 7 days (last pass: renesas-devel-2022-08-16-v6.0-rc1,=
 first fail: renesas-devel-2022-08-22-v6.0-rc2) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77950-salvator-x          | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/630ddd9931fc24cc2335568b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-r8a=
77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-r8a=
77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220826.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/630ddd9931fc24cc2=
335568c
        new failure (last pass: renesas-devel-2022-08-22-v6.0-rc2) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77950-salvator-x          | arm64  | lab-baylibre  | gcc-10   | renesas_=
defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/630ddbb94821434aa935566c

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: renesas_defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/renesas_defconfig/gcc-10/lab-baylibre/baseline-nfs=
-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/renesas_defconfig/gcc-10/lab-baylibre/baseline-nfs=
-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220826.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/630ddbb9482=
1434aa9355671
        failing since 13 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1)
        2 lines

    2022-08-30T09:43:11.450640  kern  :emerg : BUG: spinlock already unlock=
ed on CPU#0, kworker/u16:0/8
    2022-08-30T09:43:11.453843  kern  :emerg :  lock: sci_ports+0x0/0x4f50,=
 .magic: dead4ead, .owner: <none>/-1, .owner_cpu: -1
    2022-08-30T09:43:11.506316  <8>[   20.352119] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/630dddb5451b9eaefa35565e

  Results:     68 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-collabora/baseline-nfs-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-collabora/baseline-nfs-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220826.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case=
/id/630dddb5451b9eaefa355682
        new failure (last pass: renesas-devel-2022-08-16-v6.0-rc1)

    2022-08-30T09:51:32.611295  /lava-7135260/1/../bin/lava-test-case
    2022-08-30T09:51:32.653923  <8>[   25.330784] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-keyb-probed RESULT=3Dfail>   =

 =20
