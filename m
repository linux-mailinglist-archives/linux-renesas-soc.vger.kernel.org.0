Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B21A666887B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jan 2023 01:34:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232708AbjAMAeC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Jan 2023 19:34:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233217AbjAMAdq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2023 19:33:46 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ECB86144B
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 16:33:45 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id s3so12522282pfd.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 16:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AFtwV69bMIsSzAfqfnEyRcHaD27M68+NitSG2WOcyBI=;
        b=tiK9Gnmrglo/BWl0Epn9FzVVnAAFvXoxx3U451P8VH4QpZK9a1N1/iNYPEPjDCnI0a
         4ieUl2e7jb84MhEl5SQH/Y0pa7++pOgx8kD4hqDl4pn8o70+auprL7RRb5d/hLyabGsz
         EEq/9BHVytKV5HTKzmH4PuR7+eBmyYGgBh0j4CzFlzf7MsJWbfh97R2kabKfxJvXk10Q
         EnsdAstuVBmA2EyisWncU743v1Mo2oLdA5zvmd6x0t2KeufBSlBGtzm2ZowGpceUBepy
         p9YPKS0pqlvASuKey1Pt422HEBdPMvKzc0rz4a+pNckyVw1WYddYG3o7wQNfdzKSNUIy
         383w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AFtwV69bMIsSzAfqfnEyRcHaD27M68+NitSG2WOcyBI=;
        b=3iIwJmZEpHfDoyJL99ca1jAG9HK6OjVctrMcCLaijHr1RXHVz8hfCerculaB6AjQzc
         2LUNN9Bo8zJhlVvYVd+76UQjDHqFv2s51F6II+C5KOn78dxcrDiEQLF+ANbIL9pdeSlE
         tkeBpTngNUo63T3ME5JL1AfAsGTdfW7nC/3natVABv+1EcI0Cffp5jp4pRg45eZt+7W0
         cLkITOG1FF4MovLyRnWg/KWQ81YMFAwhiYq70zvKpVzKNUv6u3ud5Pu6dCO8wOsLR2+n
         T7boG0IuLg+1HRMlF9TGhbeiid3V9UYg5k26AKkaC4v/MFVzA0RLqKjU4TEszxl+pQZK
         p1gA==
X-Gm-Message-State: AFqh2koyJ04CvSbK5noBYqfl0dcuw9reb+XDe3R3vjLcCiymSkW5D7io
        A4OTxM8sBVOgqIkaj2QCAd/I+PNS65u4nSkE9D5qiA==
X-Google-Smtp-Source: AMrXdXtVb4XDcNEkJ8zbZXlCbDJHsPBSMEz1kQZsEovQzCvteoR1IUCO1oqioTLQfWg1fCGkm1NBmA==
X-Received: by 2002:a05:6a00:1485:b0:575:b783:b6b3 with SMTP id v5-20020a056a00148500b00575b783b6b3mr98505440pfu.28.1673570024393;
        Thu, 12 Jan 2023 16:33:44 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s64-20020a625e43000000b0056da63c8515sm12552588pfb.91.2023.01.12.16.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 16:33:44 -0800 (PST)
Message-ID: <63c0a6e8.620a0220.addf0.4804@mx.google.com>
Date:   Thu, 12 Jan 2023 16:33:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2023-01-12-v6.2-rc3
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 94 runs,
 5 regressions (renesas-devel-2023-01-12-v6.2-rc3)
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

renesas/master baseline-nfs: 94 runs, 5 regressions (renesas-devel-2023-01-=
12-v6.2-rc3)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91sam9g20ek                | arm   | lab-broonie     | gcc-10   | at91_dt=
_defconfig            | 1          =

imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-01-12-v6.2-rc3/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-01-12-v6.2-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      5268d311d704e178f1b4c5afcf0ca9073238412b =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91sam9g20ek                | arm   | lab-broonie     | gcc-10   | at91_dt=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63c06fb42e442f4f961d3a3c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-12-v6.2-rc3/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at=
91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-12-v6.2-rc3/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at=
91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230109.0/armel/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63c06fb42e442f4f9=
61d3a3d
        new failure (last pass: renesas-devel-2023-01-09-v6.2-rc3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63c06fe782fd31b4201d39d1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-12-v6.2-rc3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-12-v6.2-rc3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230109.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/63c06fe782fd31b4201d39d6
        new failure (last pass: renesas-devel-2023-01-09-v6.2-rc3)

    2023-01-12T20:38:50.792650  + set[   26.642971] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 878327_1.6.2.3.1>
    2023-01-12T20:38:50.792918   +x
    2023-01-12T20:38:50.903397  / # #
    2023-01-12T20:38:51.005090  export SHELL=3D/bin/sh
    2023-01-12T20:38:51.005568  #
    2023-01-12T20:38:51.106865  / # export SHELL=3D/bin/sh. /lava-878327/en=
vironment
    2023-01-12T20:38:51.107344  =

    2023-01-12T20:38:51.208614  / # . /lava-878327/environment/lava-878327/=
bin/lava-test-runner /lava-878327/1
    2023-01-12T20:38:51.209253  =

    2023-01-12T20:38:51.212422  / # /lava-878327/bin/lava-test-runner /lava=
-878327/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63c074f03352254d011d39d9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-12-v6.2-rc3/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-=
imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-12-v6.2-rc3/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-=
imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230109.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63c074f03352254d0=
11d39da
        new failure (last pass: renesas-devel-2023-01-09-v6.2-rc3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0760ba9cedef8371d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-12-v6.2-rc3/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-=
imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-12-v6.2-rc3/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-=
imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230109.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63c0760ba9cedef83=
71d39c3
        new failure (last pass: renesas-devel-2023-01-09-v6.2-rc3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63c07288ed2594eeb91d39e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-12-v6.2-rc3/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-nfs-su=
n50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-12-v6.2-rc3/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-nfs-su=
n50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230109.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63c07288ed2594eeb=
91d39e5
        failing since 17 days (last pass: v6.1-rc8-929-g112502470f50, first=
 fail: renesas-devel-2022-12-26-v6.2-rc1) =

 =20
