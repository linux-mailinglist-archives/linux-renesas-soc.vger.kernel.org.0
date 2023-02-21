Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15E4869E383
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Feb 2023 16:34:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbjBUPeI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Feb 2023 10:34:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233346AbjBUPeH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Feb 2023 10:34:07 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 982E76A43
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Feb 2023 07:33:56 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id fb30so2641032pfb.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Feb 2023 07:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=009jnQmigo02bl3EXlnp0WTqRzQOgS0Yh2kdux9iKoE=;
        b=pSK1Ts62r9NgEbRWvgFLrY+hh8GlsNP951sxltke0bHJ6G12FbvEg4V5+p+N+TVKpX
         ctrpxnVR0FIdsx2J44Vya6Bpo2zh8y3vD1KdQJSKcpFqfpl1tSaoSgDfJNiXIDk70ocr
         ofYHqz8Iz8jeBIh5Ue54GPwqGHDpy3ei4clGLGBTnQO3vlB2ZswuqVpi+UeH/IbvzLQj
         RElg5EyO3IvP37m8BMKwyxbTLzHv0euoHJkKSVI9W3hElC+vCt683CdL8FMT6ZrX1pN3
         tdThfEJ1G9og4PJ+XIfnMaiMabzEAOTjBAWLmiQ6VNs10grQgqs8sL8dk3I0EOyw7Spz
         CsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=009jnQmigo02bl3EXlnp0WTqRzQOgS0Yh2kdux9iKoE=;
        b=IhjIhqop1le/4uzpmSzrSWVH3YhL4nPssN10B8xjbtSATK63mhvlMWMxDg8Ravwk4i
         1bf89xf26mXk9ryWcRwaIPp2iBRTY+Szt2UkySYwyIO2pd1wssLhEHjef877jgrtvpTi
         Sng8aa7Z2K4MF6LBOIMYlaXaT1yzZ+f1UTnt/Q8+zX5pjSwSVXmnmjU8L2fK9M3ZTxhF
         ieMvN81nZALTbkDN9se4Fsb5hlJ5tuYq0eQldoHKCnpHluvyNqQ0KniNSCxyL87DZqvc
         /vYFPfzJqgXy0XlzkU7Ef79uJ2SrRaf/BgsmIMnzI+ZYxIQMJ6Vov6OvziqPaPopMDw8
         ZJYw==
X-Gm-Message-State: AO0yUKXw7hnlFoRHo4iFlXPPziTSBI/hqoj9Gsa4EKm2/g3TfJ7lWYlX
        8SHoOmqrM++h1VOhWSEz/yF9yXPKKnxH+fbXDT0=
X-Google-Smtp-Source: AK7set8+KPvWeZrR9rT4keD+jPStMU3iWVkm/mHXMssXpJKlF+6XJDNXjdKgBe8en+pIF7q9+5aZVQ==
X-Received: by 2002:a62:5f86:0:b0:5a9:cb37:cfb7 with SMTP id t128-20020a625f86000000b005a9cb37cfb7mr6300290pfb.25.1676993635002;
        Tue, 21 Feb 2023 07:33:55 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q19-20020a62e113000000b005a8dc935ec1sm9739811pfh.62.2023.02.21.07.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 07:33:54 -0800 (PST)
Message-ID: <63f4e462.620a0220.efd24.13e2@mx.google.com>
Date:   Tue, 21 Feb 2023 07:33:54 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-02-21-v6.2
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 278 runs,
 47 regressions (renesas-devel-2023-02-21-v6.2)
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

renesas/master baseline: 278 runs, 47 regressions (renesas-devel-2023-02-21=
-v6.2)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =

imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

juno-uboot                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =

kontron-kswit...0-mmt-6g-2gs | arm    | lab-kontron     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_i386-uefi               | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig+debug         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | renesa=
s_defconfig            | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-02-21-v6.2/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-02-21-v6.2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      5b96f8a28064829e9c31a235f5b4a3f566743b9c =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4aeed04fb2c00178c8659

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-i=
mx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-i=
mx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f4aeed04fb2c00178c8662
        failing since 21 days (last pass: v6.1-rc8-929-g112502470f50, first=
 fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-02-21T11:45:28.488651  + set +x
    2023-02-21T11:45:28.488877  [   12.965024] <LAVA_SIGNAL_ENDRUN 0_dmesg =
910131_1.5.2.3.1>
    2023-02-21T11:45:28.597593  / # #
    2023-02-21T11:45:28.699283  export SHELL=3D/bin/sh
    2023-02-21T11:45:28.699722  #
    2023-02-21T11:45:28.801073  / # export SHELL=3D/bin/sh. /lava-910131/en=
vironment
    2023-02-21T11:45:28.801530  =

    2023-02-21T11:45:28.902903  / # . /lava-910131/environment/lava-910131/=
bin/lava-test-runner /lava-910131/1
    2023-02-21T11:45:28.903536  =

    2023-02-21T11:45:28.906712  / # /lava-910131/bin/lava-test-runner /lava=
-910131/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4af514926487a868c86c9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-p=
engutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-p=
engutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f4af514926487a868c86d2
        failing since 21 days (last pass: v6.1-rc8-929-g112502470f50, first=
 fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-02-21T11:47:07.923434  + set +x
    2023-02-21T11:47:07.923721  [   12.623694] <LAVA_SIGNAL_ENDRUN 0_dmesg =
910138_1.5.2.3.1>
    2023-02-21T11:47:08.030795  / # #
    2023-02-21T11:47:08.132285  export SHELL=3D/bin/sh
    2023-02-21T11:47:08.132674  #
    2023-02-21T11:47:08.233847  / # export SHELL=3D/bin/sh. /lava-910138/en=
vironment
    2023-02-21T11:47:08.234227  =

    2023-02-21T11:47:08.335661  / # . /lava-910138/environment/lava-910138/=
bin/lava-test-runner /lava-910138/1
    2023-02-21T11:47:08.336263  =

    2023-02-21T11:47:08.339398  / # /lava-910138/bin/lava-test-runner /lava=
-910138/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4afb586336a3b358c86dc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix=
/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix=
/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f4afb586336a3b358c86e5
        failing since 21 days (last pass: v6.1-rc8-929-g112502470f50, first=
 fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-02-21T11:48:47.432130  + set +x
    2023-02-21T11:48:47.432503  [   11.956255] <LAVA_SIGNAL_ENDRUN 0_dmesg =
910145_1.5.2.3.1>
    2023-02-21T11:48:47.539102  / # #
    2023-02-21T11:48:47.640979  export SHELL=3D/bin/sh
    2023-02-21T11:48:47.641523  #
    2023-02-21T11:48:47.742946  / # export SHELL=3D/bin/sh. /lava-910145/en=
vironment
    2023-02-21T11:48:47.743697  =

    2023-02-21T11:48:47.844956  / # . /lava-910145/environment/lava-910145/=
bin/lava-test-runner /lava-910145/1
    2023-02-21T11:48:47.845718  =

    2023-02-21T11:48:47.848630  / # /lava-910145/bin/lava-test-runner /lava=
-910145/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4b0e133104f202d8c863d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baselin=
e-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baselin=
e-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f4b0e133104f202d8c8646
        failing since 21 days (last pass: v6.1-rc8-929-g112502470f50, first=
 fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-02-21T11:53:51.897960  + set +x
    2023-02-21T11:53:51.898222  [   16.065291] <LAVA_SIGNAL_ENDRUN 0_dmesg =
910159_1.5.2.3.1>
    2023-02-21T11:53:52.005246  / # #
    2023-02-21T11:53:52.106797  export SHELL=3D/bin/sh
    2023-02-21T11:53:52.107214  #
    2023-02-21T11:53:52.208476  / # export SHELL=3D/bin/sh. /lava-910159/en=
vironment
    2023-02-21T11:53:52.208963  =

    2023-02-21T11:53:52.310371  / # . /lava-910159/environment/lava-910159/=
bin/lava-test-runner /lava-910159/1
    2023-02-21T11:53:52.310967  =

    2023-02-21T11:53:52.313880  / # /lava-910159/bin/lava-test-runner /lava=
-910159/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4b1457f02ad70348c867b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53=
-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53=
-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f4b1457f02ad70348c8684
        failing since 21 days (last pass: v6.1-rc8-929-g112502470f50, first=
 fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-02-21T11:55:28.563195  + set +x
    2023-02-21T11:55:28.563550  [   12.906412] <LAVA_SIGNAL_ENDRUN 0_dmesg =
910164_1.5.2.3.1>
    2023-02-21T11:55:28.671872  / # #
    2023-02-21T11:55:28.773686  export SHELL=3D/bin/sh
    2023-02-21T11:55:28.774091  #
    2023-02-21T11:55:28.875342  / # export SHELL=3D/bin/sh. /lava-910164/en=
vironment
    2023-02-21T11:55:28.875900  =

    2023-02-21T11:55:28.977214  / # . /lava-910164/environment/lava-910164/=
bin/lava-test-runner /lava-910164/1
    2023-02-21T11:55:28.977936  =

    2023-02-21T11:55:28.981106  / # /lava-910164/bin/lava-test-runner /lava=
-910164/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4ae26f81c05aafa8c8654

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline=
-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline=
-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4ae26f81c05aafa8c8=
655
        failing since 102 days (last pass: renesas-devel-2022-09-19-v6.0-rc=
6, first fail: renesas-devel-2022-11-10-v6.1-rc4) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4ad980a26353ca78c863c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-u=
doo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-u=
doo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4ad980a26353ca78c8=
63d
        failing since 161 days (last pass: renesas-devel-2022-07-05-v5.19-r=
c5, first fail: v6.0-rc5-843-g94f27a9ea269) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4ad804efcff38228c8642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-ud=
oo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-ud=
oo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4ad804efcff38228c8=
643
        failing since 161 days (last pass: renesas-devel-2022-09-02-v6.0-rc=
3, first fail: v6.0-rc5-843-g94f27a9ea269) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4ae255f2940d33a8c865f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline=
-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline=
-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4ae255f2940d33a8c8=
660
        failing since 102 days (last pass: renesas-devel-2022-09-19-v6.0-rc=
6, first fail: renesas-devel-2022-11-10-v6.1-rc4) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
juno-uboot                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4b19285eaa5949f8c8630

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-juno-uboo=
t.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-juno-uboo=
t.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f4b19285eaa5949f8c8639
        failing since 42 days (last pass: renesas-devel-2022-12-12-v6.1, fi=
rst fail: renesas-devel-2023-01-09-v6.2-rc3)

    2023-02-21T11:56:44.330673  / # #
    2023-02-21T11:56:44.433489  export SHELL=3D/bin/sh
    2023-02-21T11:56:44.434242  #
    2023-02-21T11:56:44.536282  / # export SHELL=3D/bin/sh. /lava-50564/env=
ironment
    2023-02-21T11:56:44.537061  =

    2023-02-21T11:56:44.639099  / # . /lava-50564/environment/lava-50564/bi=
n/lava-test-runner /lava-50564/1
    2023-02-21T11:56:44.640331  =

    2023-02-21T11:56:44.655281  / # /lava-50564/bin/lava-test-runner /lava-=
50564/1
    2023-02-21T11:56:44.720922  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-21T11:56:44.721447  + cd /lava-50564/1/tests/1_bootrr =

    ... (40 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm    | lab-kontron     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4b18059ad193a698c865c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig+crypto/gcc-10/lab-kontron/baseline-ko=
ntron-kswitch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig+crypto/gcc-10/lab-kontron/baseline-ko=
ntron-kswitch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4b18059ad193a698c8=
65d
        new failure (last pass: renesas-devel-2023-02-20-v6.2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4ad0a60d72ddba98c8645

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4ad0a60d72ddba98c8=
646
        failing since 7 days (last pass: renesas-devel-2023-01-30-v6.2-rc6,=
 first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4ad00c8d7caa7628c8665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4ad00c8d7caa7628c8=
666
        failing since 7 days (last pass: renesas-devel-2023-02-06-v6.2-rc7,=
 first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4b0115f4e850d9a8c863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qem=
u_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qem=
u_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4b0115f4e850d9a8c8=
63f
        failing since 126 days (last pass: renesas-devel-2022-09-27-v6.0-rc=
7, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4b0396b9b1c52bd8c864c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qem=
u_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qem=
u_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4b0396b9b1c52bd8c8=
64d
        failing since 126 days (last pass: renesas-devel-2022-10-04-v6.0, f=
irst fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4b0ed175d4f37f78c8653

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qem=
u_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qem=
u_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4b0ed175d4f37f78c8=
654
        failing since 126 days (last pass: renesas-devel-2022-10-04-v6.0, f=
irst fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4b0134732402ece8c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qem=
u_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qem=
u_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4b0134732402ece8c8=
631
        failing since 126 days (last pass: renesas-devel-2022-09-19-v6.0-rc=
6, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4ae0d9181ac76068c8657

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-q=
emu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-q=
emu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4ae0d9181ac76068c8=
658
        failing since 126 days (last pass: renesas-devel-2022-09-19-v6.0-rc=
6, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4a9f8988277d3448c8632

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/i386/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/i386/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4a9f8988277d3448c8=
633
        failing since 7 days (last pass: renesas-devel-2023-02-06-v6.2-rc7,=
 first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4af9a6f8cccffe68c864f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/i386/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i=
386-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/i386/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i=
386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4af9a6f8cccffe68c8=
650
        failing since 7 days (last pass: renesas-devel-2023-02-06-v6.2-rc7,=
 first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4ab64e43b7328688c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu=
_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu=
_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4ab64e43b7328688c8=
631
        failing since 7 days (last pass: renesas-devel-2023-02-06-v6.2-rc7,=
 first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4acb412a797c7f78c872f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-q=
emu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-q=
emu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4acb412a797c7f78c8=
730
        new failure (last pass: renesas-devel-2023-01-30-v6.2-rc6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4ad0460d72ddba98c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-q=
emu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-q=
emu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4ad0460d72ddba98c8=
630
        failing since 7 days (last pass: renesas-devel-2023-02-06-v6.2-rc7,=
 first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4ae5936c26a5eea8c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/bas=
eline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/bas=
eline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4ae5936c26a5eea8c8=
631
        failing since 7 days (last pass: renesas-devel-2023-02-06-v6.2-rc7,=
 first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4af85953b13248b8c8650

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4af85953b13248b8c8=
651
        failing since 7 days (last pass: renesas-devel-2023-02-06-v6.2-rc7,=
 first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4b24138dfe2b4a98c8635

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-bro=
onie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-bro=
onie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4b24138dfe2b4a98c8=
636
        new failure (last pass: renesas-devel-2023-01-30-v6.2-rc6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4b35be412d2e0f38c8634

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/ba=
seline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/ba=
seline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4b35be412d2e0f38c8=
635
        failing since 7 days (last pass: renesas-devel-2023-02-06-v6.2-rc7,=
 first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4b3aae641da28758c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86=
_64-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86=
_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4b3aae641da28758c8=
630
        failing since 1 day (last pass: renesas-devel-2023-02-06-v6.2-rc7, =
first fail: renesas-devel-2023-02-20-v6.2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4ac7d606d8adc1d8c863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline=
-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline=
-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4ac7d606d8adc1d8c8=
63e
        new failure (last pass: renesas-devel-2023-01-30-v6.2-rc6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4af127929369f888c8634

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4af127929369f888c8=
635
        new failure (last pass: renesas-devel-2023-01-30-v6.2-rc6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4afc53ae92e4db48c8645

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x=
86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x=
86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4afc53ae92e4db48c8=
646
        failing since 1 day (last pass: renesas-devel-2023-02-06-v6.2-rc7, =
first fail: renesas-devel-2023-02-20-v6.2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4ab4e0f9045ddd28c863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu=
_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu=
_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4ab4e0f9045ddd28c8=
63f
        failing since 7 days (last pass: renesas-devel-2023-02-06-v6.2-rc7,=
 first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4acc9e300155de68c8645

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-q=
emu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-q=
emu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4acc9e300155de68c8=
646
        failing since 7 days (last pass: renesas-devel-2023-02-06-v6.2-rc7,=
 first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4acf1db5b599d4e8c8634

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-q=
emu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-q=
emu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4acf1db5b599d4e8c8=
635
        failing since 7 days (last pass: renesas-devel-2023-02-06-v6.2-rc7,=
 first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4aea9e845d00c7b8c863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/bas=
eline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/bas=
eline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4aea9e845d00c7b8c8=
63f
        failing since 7 days (last pass: renesas-devel-2023-02-06-v6.2-rc7,=
 first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4af996f8cccffe68c8649

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4af996f8cccffe68c8=
64a
        failing since 7 days (last pass: renesas-devel-2023-02-06-v6.2-rc7,=
 first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4b219df05a933668c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-bro=
onie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-bro=
onie/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4b219df05a933668c8=
631
        failing since 7 days (last pass: renesas-devel-2023-02-06-v6.2-rc7,=
 first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4b36fe412d2e0f38c864e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/ba=
seline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/ba=
seline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4b36fe412d2e0f38c8=
64f
        failing since 7 days (last pass: renesas-devel-2023-02-06-v6.2-rc7,=
 first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4b3961bf35f7cb98c8654

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86=
_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86=
_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4b3961bf35f7cb98c8=
655
        failing since 7 days (last pass: renesas-devel-2023-02-06-v6.2-rc7,=
 first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4aafb02b510dfc38c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20=
d-q7.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20=
d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4aafb02b510dfc38c8=
630
        new failure (last pass: renesas-devel-2023-02-20-v6.2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | renesa=
s_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4d5f10fa153152e8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: renesas_defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4d5f10fa153152e8c8=
630
        new failure (last pass: renesas-devel-2023-02-20-v6.2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4b1085e4dec62ac8c8650

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4b1085e4dec62ac8c8=
651
        failing since 49 days (last pass: renesas-devel-2022-12-12-v6.1, fi=
rst fail: renesas-devel-2023-01-02-v6.2-rc2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4aeeb04fb2c00178c8652

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4aeeb04fb2c00178c8=
653
        failing since 49 days (last pass: renesas-devel-2022-12-12-v6.1, fi=
rst fail: renesas-devel-2023-01-02-v6.2-rc2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4ad13a90f4eebfe8c863c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collab=
ora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collab=
ora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4ad13a90f4eebfe8c8=
63d
        failing since 7 days (last pass: renesas-devel-2023-02-06-v6.2-rc7,=
 first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4acfedb5b599d4e8c8657

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collab=
ora/baseline-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collab=
ora/baseline-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4acfedb5b599d4e8c8=
658
        failing since 7 days (last pass: renesas-devel-2023-02-06-v6.2-rc7,=
 first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4ad0689f5e82a3d8c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collab=
ora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collab=
ora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4ad0789f5e82a3d8c8=
631
        failing since 7 days (last pass: renesas-devel-2023-02-06-v6.2-rc7,=
 first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4b03fc34080a4e48c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4b03fc34080a4e48c8=
631
        failing since 48 days (last pass: renesas-devel-2022-12-12-v6.1, fi=
rst fail: renesas-devel-2023-01-02-v6.2-rc2) =

 =20
