Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74A73724391
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Jun 2023 15:05:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236069AbjFFNFT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Jun 2023 09:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237890AbjFFNEv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Jun 2023 09:04:51 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1653FF4
        for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Jun 2023 06:04:46 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2563aaceda9so2348936a91.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Jun 2023 06:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1686056685; x=1688648685;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K/haTQxO7khNKczAq5zj/IaZ/4y70LdEHaaKTX+spUE=;
        b=lzQLA4jL4HkDsMIB/hAw3Z+6BihqqohMjcl6UrjEFe8EbCGZRb4gL2obCPGV+1B3aR
         dncG57mLumTyxjFnBNHGs8TLDb2rO0TwjB5mE3Sij9F+DMLXITp+xikRNShUrp/cekVZ
         ir0wp3x4zanQRYdZ2hbMyqVD2oBeH3n/7esRb8xmix8XtOnK+FlhRiZVmU+k90g7Kx4d
         2P4KLook0VEm+i6x8H39iyCcg/WUnkrERwpNW4t3uiuduVh/FBoAVSY3gF9lz+ch6uaG
         Cy1LBywu6ehHnsULHukKYP/Mr9jovOmIWChh5Vrp/oi48xoeSNB0+1OmFLWu0ohr7mh1
         BExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686056685; x=1688648685;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/haTQxO7khNKczAq5zj/IaZ/4y70LdEHaaKTX+spUE=;
        b=XGUfANlaLdwh3GNcgD6aKbSmsflUYKSAdlXaSrmeblW25er7Qp6jEjvtxqATFy7xfS
         ps8pSE+EEhPDph5o7xLSY6oaNML9thy4AZa4c7cVqEWjP78kMYtySfuqdX/KvqUaIVDt
         RYgw5l5dNL/VSCQXKChyi+FLpWXKogWp+DuRscchvJ5mNlEj76zFaLEc7mfrjRunjU3K
         mhbirD9kr7gt0wpvn0iIIf76bNzEyBpJii05rOYB9hHiDZVN59RsmmCcSwXsmUZ6C5Tj
         IZqKZaKj2sW7hwbKBof8i/F0nFDncsLl8hrOebKJw9zMGf7WxhGDfCB26mmrCSJBf0Yg
         qKKQ==
X-Gm-Message-State: AC+VfDyjWktxsvmj3N5T3SSUVh8ZFLscaSSj916sUrpJqw8jlyo4p1Jx
        1Qa7wCeLU9uRKk5rzwKU1re/WdZKvB4io6uQcy6Xtg==
X-Google-Smtp-Source: ACHHUZ7fpVOs8XHLhNmeVT9YjSlpfTceg8MrpxH8uVTHKoLbzttOx0PCBbeRRDHPzzvgOCF0bS3CZg==
X-Received: by 2002:a17:90a:ab12:b0:252:f7b1:943f with SMTP id m18-20020a17090aab1200b00252f7b1943fmr382496pjq.24.1686056683647;
        Tue, 06 Jun 2023 06:04:43 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id nn12-20020a17090b38cc00b0023b3d80c76csm7557484pjb.4.2023.06.06.06.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 06:04:42 -0700 (PDT)
Message-ID: <647f2eea.170a0220.d334.d56e@mx.google.com>
Date:   Tue, 06 Jun 2023 06:04:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2023-06-06-v6.4-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next baseline: 321 runs,
 45 regressions (renesas-next-2023-06-06-v6.4-rc1)
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

renesas/next baseline: 321 runs, 45 regressions (renesas-next-2023-06-06-v6=
.4-rc1)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10   | omap2p=
lus_defconfig          | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+ima                | 2          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 2          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-06-06-v6.4-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-06-06-v6.4-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      7762defcdaf029da668d5af3304d3d940d43199e =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef5388dd1a8ba85f5de32

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647ef5388dd1a8ba85f5de3b
        failing since 67 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-06T08:58:21.590551  <8>[   11.617872] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10602841_1.4.2.3.1>

    2023-06-06T08:58:21.594062  + set +x

    2023-06-06T08:58:21.695696  =


    2023-06-06T08:58:21.796261  / # #export SHELL=3D/bin/sh

    2023-06-06T08:58:21.796423  =


    2023-06-06T08:58:21.897020  / # export SHELL=3D/bin/sh. /lava-10602841/=
environment

    2023-06-06T08:58:21.897174  =


    2023-06-06T08:58:21.997857  / # . /lava-10602841/environment/lava-10602=
841/bin/lava-test-runner /lava-10602841/1

    2023-06-06T08:58:21.998102  =


    2023-06-06T08:58:22.003549  / # /lava-10602841/bin/lava-test-runner /la=
va-10602841/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef53c8dd1a8ba85f5de84

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647ef53c8dd1a8ba85f5de8d
        failing since 67 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-06T08:58:23.324805  + <8>[   11.398060] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10602838_1.4.2.3.1>

    2023-06-06T08:58:23.324889  set +x

    2023-06-06T08:58:23.428813  / # #

    2023-06-06T08:58:23.529441  export SHELL=3D/bin/sh

    2023-06-06T08:58:23.529585  #

    2023-06-06T08:58:23.630092  / # export SHELL=3D/bin/sh. /lava-10602838/=
environment

    2023-06-06T08:58:23.630231  =


    2023-06-06T08:58:23.730751  / # . /lava-10602838/environment/lava-10602=
838/bin/lava-test-runner /lava-10602838/1

    2023-06-06T08:58:23.730964  =


    2023-06-06T08:58:23.735452  / # /lava-10602838/bin/lava-test-runner /la=
va-10602838/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef5378dd1a8ba85f5de27

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647ef5378dd1a8ba85f5de30
        failing since 67 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-06T08:58:14.659419  <8>[   11.156914] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10602808_1.4.2.3.1>

    2023-06-06T08:58:14.662837  + set +x

    2023-06-06T08:58:14.768790  =


    2023-06-06T08:58:14.870994  / # #export SHELL=3D/bin/sh

    2023-06-06T08:58:14.871768  =


    2023-06-06T08:58:14.973524  / # export SHELL=3D/bin/sh. /lava-10602808/=
environment

    2023-06-06T08:58:14.974312  =


    2023-06-06T08:58:15.075947  / # . /lava-10602808/environment/lava-10602=
808/bin/lava-test-runner /lava-10602808/1

    2023-06-06T08:58:15.077257  =


    2023-06-06T08:58:15.082750  / # /lava-10602808/bin/lava-test-runner /la=
va-10602808/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/647efd03511117c885f5de97

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/ba=
seline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/ba=
seline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647efd03511117c885f5d=
e98
        new failure (last pass: renesas-next-2023-06-02-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/647efd8c4689a3d7eff5de5c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baseline-b=
eaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baseline-b=
eaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647efd8c4689a3d7eff5d=
e5d
        new failure (last pass: renesas-next-2023-06-02-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef83be9f6f98769f5de27

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/omap2plus_defconfig/gcc-10/lab-broonie/baseline-beagleb=
one-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/omap2plus_defconfig/gcc-10/lab-broonie/baseline-beagleb=
one-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647ef83be9f6f98769f5d=
e28
        new failure (last pass: renesas-next-2023-06-02-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/647eff8915895bc276f5de34

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647eff8915895bc276f5d=
e35
        failing since 126 days (last pass: renesas-next-2022-11-21-v6.1-rc1=
, first fail: renesas-next-2023-01-30-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef542bef717c4edf5de51

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647ef542bef717c4edf5de5a
        failing since 67 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-06T08:58:28.524962  + set +x

    2023-06-06T08:58:28.531531  <8>[   10.895749] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10602837_1.4.2.3.1>

    2023-06-06T08:58:28.639901  / # #

    2023-06-06T08:58:28.741990  export SHELL=3D/bin/sh

    2023-06-06T08:58:28.742705  #

    2023-06-06T08:58:28.844274  / # export SHELL=3D/bin/sh. /lava-10602837/=
environment

    2023-06-06T08:58:28.845038  =


    2023-06-06T08:58:28.946541  / # . /lava-10602837/environment/lava-10602=
837/bin/lava-test-runner /lava-10602837/1

    2023-06-06T08:58:28.947593  =


    2023-06-06T08:58:28.952892  / # /lava-10602837/bin/lava-test-runner /la=
va-10602837/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef527f91105b579f5de8c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647ef527f91105b579f5de95
        failing since 67 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-06T08:58:02.508396  + set +x

    2023-06-06T08:58:02.515202  <8>[   10.525735] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10602828_1.4.2.3.1>

    2023-06-06T08:58:02.619384  / # #

    2023-06-06T08:58:02.720107  export SHELL=3D/bin/sh

    2023-06-06T08:58:02.720316  #

    2023-06-06T08:58:02.820810  / # export SHELL=3D/bin/sh. /lava-10602828/=
environment

    2023-06-06T08:58:02.820984  =


    2023-06-06T08:58:02.921487  / # . /lava-10602828/environment/lava-10602=
828/bin/lava-test-runner /lava-10602828/1

    2023-06-06T08:58:02.921814  =


    2023-06-06T08:58:02.926945  / # /lava-10602828/bin/lava-test-runner /la=
va-10602828/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef53b8dd1a8ba85f5de77

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647ef53b8dd1a8ba85f5de80
        failing since 67 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-06T08:58:19.144044  + set<8>[   10.968438] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10602796_1.4.2.3.1>

    2023-06-06T08:58:19.144128   +x

    2023-06-06T08:58:19.248399  / # #

    2023-06-06T08:58:19.350675  export SHELL=3D/bin/sh

    2023-06-06T08:58:19.351371  #

    2023-06-06T08:58:19.452705  / # export SHELL=3D/bin/sh. /lava-10602796/=
environment

    2023-06-06T08:58:19.453558  =


    2023-06-06T08:58:19.555001  / # . /lava-10602796/environment/lava-10602=
796/bin/lava-test-runner /lava-10602796/1

    2023-06-06T08:58:19.556443  =


    2023-06-06T08:58:19.560403  / # /lava-10602796/bin/lava-test-runner /la=
va-10602796/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/647efb6346dd937a1cf5de5e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647efb6346dd937a1cf5de67
        failing since 126 days (last pass: renesas-next-2022-11-21-v6.1-rc1=
, first fail: renesas-next-2023-01-30-v6.2-rc1)

    2023-06-06T09:24:26.552067  + set +x
    2023-06-06T09:24:26.552241  [   12.190573] <LAVA_SIGNAL_ENDRUN 0_dmesg =
968745_1.5.2.3.1>
    2023-06-06T09:24:26.659493  / # #
    2023-06-06T09:24:26.761074  export SHELL=3D/bin/sh
    2023-06-06T09:24:26.761561  #
    2023-06-06T09:24:26.862815  / # export SHELL=3D/bin/sh. /lava-968745/en=
vironment
    2023-06-06T09:24:26.863272  =

    2023-06-06T09:24:26.964484  / # . /lava-968745/environment/lava-968745/=
bin/lava-test-runner /lava-968745/1
    2023-06-06T09:24:26.965247  =

    2023-06-06T09:24:26.968171  / # /lava-968745/bin/lava-test-runner /lava=
-968745/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/647efbb1f37fc31542f5de33

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647efbb1f37fc31542f5de3c
        failing since 3 days (last pass: renesas-next-2023-03-06-v6.3-rc1, =
first fail: renesas-next-2023-06-02-v6.4-rc1)

    2023-06-06T09:25:51.245500  + set +x
    2023-06-06T09:25:51.245693  [   13.090543] <LAVA_SIGNAL_ENDRUN 0_dmesg =
968749_1.5.2.3.1>
    2023-06-06T09:25:51.352968  / # #
    2023-06-06T09:25:51.454815  export SHELL=3D/bin/sh
    2023-06-06T09:25:51.455297  #
    2023-06-06T09:25:51.556642  / # export SHELL=3D/bin/sh. /lava-968749/en=
vironment
    2023-06-06T09:25:51.557452  =

    2023-06-06T09:25:51.658840  / # . /lava-968749/environment/lava-968749/=
bin/lava-test-runner /lava-968749/1
    2023-06-06T09:25:51.659535  =

    2023-06-06T09:25:51.662697  / # /lava-968749/bin/lava-test-runner /lava=
-968749/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/647efc547e7e0319bef5de30

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647efc547e7e0319bef5de39
        failing since 3 days (last pass: renesas-next-2023-03-06-v6.3-rc1, =
first fail: renesas-next-2023-06-02-v6.4-rc1)

    2023-06-06T09:28:32.579226  + set +x
    2023-06-06T09:28:32.579384  [   14.425610] <LAVA_SIGNAL_ENDRUN 0_dmesg =
968766_1.5.2.3.1>
    2023-06-06T09:28:32.687376  / # #
    2023-06-06T09:28:32.789032  export SHELL=3D/bin/sh
    2023-06-06T09:28:32.789492  #
    2023-06-06T09:28:32.890819  / # export SHELL=3D/bin/sh. /lava-968766/en=
vironment
    2023-06-06T09:28:32.891239  =

    2023-06-06T09:28:32.992481  / # . /lava-968766/environment/lava-968766/=
bin/lava-test-runner /lava-968766/1
    2023-06-06T09:28:32.993210  =

    2023-06-06T09:28:32.996593  / # /lava-968766/bin/lava-test-runner /lava=
-968766/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/647efca438d8b0ca56f5de33

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647efca438d8b0ca56f5de3c
        failing since 3 days (last pass: renesas-next-2023-03-06-v6.3-rc1, =
first fail: renesas-next-2023-06-02-v6.4-rc1)

    2023-06-06T09:29:45.789310  + set +x
    2023-06-06T09:29:45.789470  [   13.080153] <LAVA_SIGNAL_ENDRUN 0_dmesg =
968778_1.5.2.3.1>
    2023-06-06T09:29:45.897288  / # #
    2023-06-06T09:29:45.998801  export SHELL=3D/bin/sh
    2023-06-06T09:29:45.999202  #
    2023-06-06T09:29:46.100382  / # export SHELL=3D/bin/sh. /lava-968778/en=
vironment
    2023-06-06T09:29:46.100792  =

    2023-06-06T09:29:46.202163  / # . /lava-968778/environment/lava-968778/=
bin/lava-test-runner /lava-968778/1
    2023-06-06T09:29:46.202716  =

    2023-06-06T09:29:46.206067  / # /lava-968778/bin/lava-test-runner /lava=
-968778/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/647efeaab859fa59a3f5de5c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647efeaab859fa59a3f5d=
e5d
        failing since 260 days (last pass: renesas-next-2022-08-30-v6.0-rc1=
, first fail: renesas-next-2022-09-18-v6.0-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/647efe81473e5776a3f5de82

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647efe81473e5776a3f5d=
e83
        failing since 280 days (last pass: renesas-next-2022-08-29-v6.0-rc1=
, first fail: renesas-next-2022-08-30-v6.0-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/647ef5810b5a77d95ff5de26

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pit=
x-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pit=
x-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647ef5810b5a77d95ff5de2d
        new failure (last pass: renesas-next-2023-03-10-v6.3-rc1)

    2023-06-06T08:59:36.581987  / # #
    2023-06-06T08:59:36.684725  export SHELL=3D/bin/sh
    2023-06-06T08:59:36.685445  #
    2023-06-06T08:59:36.787170  / # export SHELL=3D/bin/sh. /lava-351223/en=
vironment
    2023-06-06T08:59:36.788319  =

    2023-06-06T08:59:36.890272  / # . /lava-351223/environment/lava-351223/=
bin/lava-test-runner /lava-351223/1
    2023-06-06T08:59:36.891242  =

    2023-06-06T08:59:36.907873  / # /lava-351223/bin/lava-test-runner /lava=
-351223/1
    2023-06-06T08:59:36.963008  + export 'TESTRUN_ID=3D1_bootrr'
    2023-06-06T08:59:36.963557  + cd /l<8>[   15.891583] <LAVA_SIGNAL_START=
RUN 1_bootrr 351223_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/647=
ef5810b5a77d95ff5de3d
        new failure (last pass: renesas-next-2023-03-10-v6.3-rc1)

    2023-06-06T08:59:39.355152  /lava-351223/1/../bin/lava-test-case
    2023-06-06T08:59:39.355854  <8>[   18.379302] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-06-06T08:59:39.356293  /lava-351223/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef52849ac57b19ef5de26

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647ef52949ac57b19ef5de2f
        failing since 67 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-06T08:58:04.907111  + set<8>[    9.262527] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10602832_1.4.2.3.1>

    2023-06-06T08:58:04.907225   +x

    2023-06-06T08:58:05.011403  / # #

    2023-06-06T08:58:05.112006  export SHELL=3D/bin/sh

    2023-06-06T08:58:05.112219  #

    2023-06-06T08:58:05.212780  / # export SHELL=3D/bin/sh. /lava-10602832/=
environment

    2023-06-06T08:58:05.213010  =


    2023-06-06T08:58:05.313586  / # . /lava-10602832/environment/lava-10602=
832/bin/lava-test-runner /lava-10602832/1

    2023-06-06T08:58:05.313950  =


    2023-06-06T08:58:05.318331  / # /lava-10602832/bin/lava-test-runner /la=
va-10602832/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef5bc13e940e88bf5de32

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647ef5bc13e940e88bf5d=
e33
        failing since 3 days (last pass: renesas-next-2023-03-30-v6.3-rc1, =
first fail: renesas-next-2023-06-02-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef5bbe6daba37bdf5de34

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647ef5bbe6daba37bdf5d=
e35
        failing since 3 days (last pass: renesas-next-2023-03-30-v6.3-rc1, =
first fail: renesas-next-2023-06-02-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/647f0036d16d9e00a7f5deb4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647f0036d16d9e00a7f5d=
eb5
        failing since 207 days (last pass: renesas-next-2022-09-26-v6.0-rc1=
, first fail: renesas-next-2022-11-10-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/647efe5ed0f3a0a49ef5de27

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647efe5ed0f3a0a49ef5d=
e28
        failing since 207 days (last pass: renesas-next-2022-09-26-v6.0-rc1=
, first fail: renesas-next-2022-11-10-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/647f0038d16d9e00a7f5deb7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647f0038d16d9e00a7f5d=
eb8
        failing since 207 days (last pass: renesas-next-2022-09-26-v6.0-rc1=
, first fail: renesas-next-2022-11-10-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/647efe60d0f3a0a49ef5de2d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647efe60d0f3a0a49ef5d=
e2e
        failing since 207 days (last pass: renesas-next-2022-09-26-v6.0-rc1=
, first fail: renesas-next-2022-11-10-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/647f0039d16d9e00a7f5deba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647f0039d16d9e00a7f5d=
ebb
        failing since 207 days (last pass: renesas-next-2022-09-26-v6.0-rc1=
, first fail: renesas-next-2022-11-10-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/647efe614c0daf89a5f5de61

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647efe614c0daf89a5f5d=
e62
        failing since 207 days (last pass: renesas-next-2022-09-26-v6.0-rc1=
, first fail: renesas-next-2022-11-10-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/647f0086c210a0e439f5de57

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647f0086c210a0e439f5d=
e58
        failing since 252 days (last pass: renesas-next-2022-09-18-v6.0-rc1=
, first fail: renesas-next-2022-09-26-v6.0-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/647efe5f4c0daf89a5f5de59

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647efe5f4c0daf89a5f5d=
e5a
        failing since 252 days (last pass: renesas-next-2022-09-18-v6.0-rc1=
, first fail: renesas-next-2022-09-26-v6.0-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/647f01f1b991c97e1cf5de32

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647f01f1b991c97e1cf5d=
e33
        failing since 67 days (last pass: renesas-next-2023-03-06-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/647eff64bff88bee55f5de25

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647eff64bff88bee55f5d=
e26
        failing since 67 days (last pass: renesas-next-2023-03-06-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef7f9d10897912bf5dfba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647ef7f9d10897912bf5d=
fbb
        failing since 161 days (last pass: renesas-next-2022-11-21-v6.1-rc1=
, first fail: renesas-next-2022-12-26-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef6f559adfee130f5de66

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647ef6f559adfee130f5d=
e67
        failing since 161 days (last pass: renesas-next-2022-11-21-v6.1-rc1=
, first fail: renesas-next-2022-12-26-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/647ef4d3455e4f1b78f5de34

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/647ef4d3455e4f1=
b78f5de37
        failing since 3 days (last pass: renesas-next-2023-03-30-v6.3-rc1, =
first fail: renesas-next-2023-06-02-v6.4-rc1)
        2 lines

    2023-06-06T08:56:30.756362  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   19.142294] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>

    2023-06-06T08:56:30.759753  at virtual address 0000000000000008

    2023-06-06T08:56:30.762689  kern  :alert : Mem abort info:

    2023-06-06T08:56:30.766949  kern  :alert :   ESR =3D 0x0000000096000006

    2023-06-06T08:56:30.773180  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-06-06T08:56:30.776682  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-06-06T08:56:30.779915  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-06-06T08:56:30.785512  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-06-06T08:56:30.788623  kern  :alert : Data abort info:

    2023-06-06T08:56:30.792763  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/647ef4d3455e4f1=
b78f5de38
        failing since 3 days (last pass: renesas-next-2023-03-30-v6.3-rc1, =
first fail: renesas-next-2023-06-02-v6.4-rc1)
        12 lines

    2023-06-06T08:56:30.708478  <8>[   19.094824] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/647ef5b2976a4d70f8f5de33

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-ro=
ck-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-ro=
ck-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/647ef5b2976a4d7=
0f8f5de36
        new failure (last pass: renesas-next-2023-03-10-v6.3-rc1)
        2 lines

    2023-06-06T09:00:25.084077  <8>[   27.099582] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-06-06T09:00:25.084438  + set +x

    2023-06-06T09:00:25.084731  <8>[   27.101714] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10602845_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/647ef5b2976a4d7=
0f8f5de37
        new failure (last pass: renesas-next-2023-03-10-v6.3-rc1)
        12 lines

    2023-06-06T09:00:25.015487  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-06-06T09:00:25.015614  kern  :alert : Mem abort info:

    2023-06-06T09:00:25.015711  kern  :alert :   ESR =3D 0x0000000096000006

    2023-06-06T09:00:25.015783  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-06-06T09:00:25.015870  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-06-06T09:00:25.015938  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-06-06T09:00:25.016001  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-06-06T09:00:25.016065  kern  :alert : Data abort info:

    2023-06-06T09:00:25.016138  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-06-06T09:00:25.016204  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (5 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/647ef95fb2a6c62ea2f5de25

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-rk33=
99-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-rk33=
99-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/647ef95fb2a6c62=
ea2f5de28
        failing since 21 days (last pass: renesas-next-2023-03-30-v6.3-rc1,=
 first fail: renesas-next-2023-05-15-v6.4-rc1)
        2 lines

    2023-06-06T09:15:53.986226  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-06-06T09:15:53.986748  kern  :emerg : Code: 97fc1110 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-06-06T09:15:53.987092  <8>[   29.843670] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-06-06T09:15:53.987421  + set +x

    2023-06-06T09:15:53.987761  <8>[   29.846073] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10603059_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/647ef95fb2a6c62=
ea2f5de29
        failing since 21 days (last pass: renesas-next-2023-03-30-v6.3-rc1,=
 first fail: renesas-next-2023-05-15-v6.4-rc1)
        12 lines

    2023-06-06T09:15:53.955208  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-06-06T09:15:53.955749  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-06-06T09:15:53.956096  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000078c93000

    2023-06-06T09:15:53.956415  kern  :alert : [0000000000000008] pgd=3D080=
0000078c99003, p4d=3D0800000078c99003, pud=3D0800000078c9a003, pmd=3D000000=
0000000000

    2023-06-06T09:15:53.956720  <8>[   29.815341] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/647efba32a878e0ef5f5e08d

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-p=
i-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-p=
i-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/647efba32a878e0=
ef5f5e090
        failing since 3 days (last pass: renesas-next-2023-03-30-v6.3-rc1, =
first fail: renesas-next-2023-06-02-v6.4-rc1)
        2 lines

    2023-06-06T09:25:46.411762  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-06-06T09:25:46.411934  kern  :emerg : Code: 97fdb910 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-06-06T09:25:46.412077  <8>[   29.652719] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-06-06T09:25:46.412201  + set +x

    2023-06-06T09:25:46.412317  <8>[   29.655078] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10603299_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/647efba32a878e0=
ef5f5e091
        failing since 3 days (last pass: renesas-next-2023-03-30-v6.3-rc1, =
first fail: renesas-next-2023-06-02-v6.4-rc1)
        12 lines

    2023-06-06T09:25:46.363771  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-06-06T09:25:46.363869  kern  :alert : Mem abort info:

    2023-06-06T09:25:46.363941  kern  :alert :   ESR =3D 0x0000000096000006

    2023-06-06T09:25:46.364009  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-06-06T09:25:46.364074  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-06-06T09:25:46.364137  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-06-06T09:25:46.364215  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-06-06T09:25:46.364277  kern  :alert : Data abort info:

    2023-06-06T09:25:46.364338  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-06-06T09:25:46.364397  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef69d562821d677f5de75

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-h5-l=
ibretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-h5-l=
ibretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647ef69d562821d677f5d=
e76
        new failure (last pass: renesas-next-2023-03-10-v6.3-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/647efa826213af00a5f5de3b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-sun50i=
-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-sun50i=
-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647efa826213af00a5f5d=
e3c
        new failure (last pass: renesas-next-2023-03-30-v6.3-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/647efca031c6a9413bf5de52

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libre=
tech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libre=
tech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647efca031c6a9413bf5d=
e53
        new failure (last pass: renesas-next-2023-03-16-v6.3-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef691f91457cdecf5de38

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-sun50i-h6=
-pine-h64.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-sun50i-h6=
-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647ef691f91457cdecf5d=
e39
        new failure (last pass: renesas-next-2023-03-10-v6.3-rc1) =

 =20
