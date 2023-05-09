Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4E096FCBDF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 May 2023 18:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbjEIQ4b (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 May 2023 12:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbjEIQ4a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 May 2023 12:56:30 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C39D25252
        for <linux-renesas-soc@vger.kernel.org>; Tue,  9 May 2023 09:56:00 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-51f6461af24so4322958a12.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 May 2023 09:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1683651359; x=1686243359;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o1Y8+a91kzSdmZfR2nzc44n6hv2wVeUG1Rqk617LRwM=;
        b=HWzEndVIABimHoxOFvVjjYoKeeau95AiJaNf556FnCGE0ZH1R9m8RsccFIQUQRudru
         MBwr38xRhfHXSuaZOJFdoKeyzQ5KIDKT1GhLPLl0clq2IxptSB6ac7buYMJ7wMhZZRfK
         fIy9juMgNYcazspZ3CAy+SGQv/d7Es5/5bhM599cQ9JLE181ugsgn2k1QkZwUAHqsHYb
         /EHXxf/PghQyA3pcMTD/H5TJK+8jREHPQF1Razvj3jWbLTH/IYi2269D9FsP3ZaRMx3C
         XOEpyqn3ZQJquounCWg3wBJisGouM3psUvUk2MA69004G6e3zIHRnUS3ManXxYPHDZ6x
         +jeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683651359; x=1686243359;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o1Y8+a91kzSdmZfR2nzc44n6hv2wVeUG1Rqk617LRwM=;
        b=cw1eWAVN9Ml3kE6SIkGhSLPOnCvU2hULFYYJFASSUDJ3fOUxppFPfWZDkT1FXY7o9J
         RXUGxgAsnx/kJAOWlO0NVLNLfj6wa/HdoKixA+kn8oR+uPDemG0bU4yfUuDyz7otSEKT
         qE0tGZx0sPywqgwT6q19MXP6Q7dvNHigtxJisTYmaLC+jr6JcxyVR79UlDi5PHY0etn/
         0FbJWEu8ighOHKLKQjCdCVRs00G017IxgS++3JvT2fcaOHeD+HAdeJlVyGILPv5qvJ5t
         8IhPAl21hFgS6Y2hgQkuRQlBzEUfzMgWTahPMN5A/WkH7PGPIckKggsAu51d6cmexV8p
         z/Pg==
X-Gm-Message-State: AC+VfDy5/qZlh+ECt3wfHeUIMKVSd7iGFiOS/Q+p+eauUY5TZloP8t8F
        6enMjXZb/00PiFoUMU7yFp3xPxdHCmDCa7bfFOmtLA==
X-Google-Smtp-Source: ACHHUZ5tXrcCGbui0ReLAEGOMVdHO7N6xNjnc+/JbjNRM+btEjPyMnuj/xH163vX9sbVsk3XSKsc1Q==
X-Received: by 2002:a17:902:e741:b0:1ac:40f7:8b52 with SMTP id p1-20020a170902e74100b001ac40f78b52mr15747400plf.64.1683651358722;
        Tue, 09 May 2023 09:55:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q4-20020a170902788400b001a69d1bc32csm1824017pll.238.2023.05.09.09.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 09:55:57 -0700 (PDT)
Message-ID: <645a7b1d.170a0220.581d7.362b@mx.google.com>
Date:   Tue, 09 May 2023 09:55:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-05-09-v6.4-rc1
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 98 runs,
 31 regressions (renesas-devel-2023-05-09-v6.4-rc1)
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

renesas/master baseline-nfs: 98 runs, 31 regressions (renesas-devel-2023-05=
-09-v6.4-rc1)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10   | omap2p=
lus_defconfig          | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 2          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-05-09-v6.4-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-05-09-v6.4-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      dce70215cdd5598b16b34f41c88d168ad124cd45 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645a4295c224326e962e85f3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/645a4295c224326e962e85f8
        failing since 39 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-09T12:54:23.532051  <8>[   24.161636] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10258256_1.5.2.3.1>

    2023-05-09T12:54:23.535535  + set +x

    2023-05-09T12:54:24.509522  / # #

    2023-05-09T12:54:24.610321  export SHELL=3D/bin/sh

    2023-05-09T12:54:24.610588  #

    2023-05-09T12:54:24.711097  / # export SHELL=3D/bin/sh. /lava-10258256/=
environment

    2023-05-09T12:54:24.711315  =


    2023-05-09T12:54:24.811878  / # . /lava-10258256/environment/lava-10258=
256/bin/lava-test-runner /lava-10258256/1

    2023-05-09T12:54:24.812278  =


    2023-05-09T12:54:24.818193  / # /lava-10258256/bin/lava-test-runner /la=
va-10258256/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645a44c6e8b4be09392e85f1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/645a44c6e8b4be09392e85f6
        failing since 39 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-09T13:03:40.541760  + set +x

    2023-05-09T13:03:40.548219  [   33.168670] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10258377_1.5.2.3.1>

    2023-05-09T13:03:40.653041  / # #

    2023-05-09T13:03:40.753697  export SHELL=3D/bin/sh

    2023-05-09T13:03:40.754395  #

    2023-05-09T13:03:40.855935  / # export SHELL=3D/bin/sh. /lava-10258377/=
environment

    2023-05-09T13:03:40.856796  =


    2023-05-09T13:03:40.958442  / # . /lava-10258377/environment/lava-10258=
377/bin/lava-test-runner /lava-10258377/1

    2023-05-09T13:03:40.959603  =


    2023-05-09T13:03:40.959979  / # [   33.537541] i2c i2c-10EC5682:00: def=
erred probe pending
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645a42950812bda0b02e8626

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/645a42950812bda0b02e862b
        failing since 39 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-09T12:54:26.638364  + set +x

    2023-05-09T12:54:26.644719  [   22.040574] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10258255_1.5.2.3.1>

    2023-05-09T12:54:26.751229  / ##

    2023-05-09T12:54:26.851845  export SHELL=3D/bin/sh

    2023-05-09T12:54:26.852046   #

    2023-05-09T12:54:26.852125  / # export SHELL=3D/bin/sh[   22.225589] sd=
hci-pci 0000:00:1b.0: SDHCI controller found [8086:5aca] (rev b)

    2023-05-09T12:54:26.852208  [   22.225915] platform MX98357A:00: deferr=
ed probe pending

    2023-05-09T12:54:26.952707  . /lava-10258255/environment

    2023-05-09T12:54:26.952955  =


    2023-05-09T12:54:27.053493  / # . /lava-10258255/environment/lava-10258=
255/bin/lava-test-runner /lava-10258255/1
 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645a42e2fa8b76c18f2e8619

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/645a42e2fa8b76c18f2e861e
        failing since 39 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-09T12:55:38.657140  <8>[   19.113044] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10258195_1.5.2.3.1>

    2023-05-09T12:55:38.763326  / # #

    2023-05-09T12:55:38.864203  export SHELL=3D/bin/sh

    2023-05-09T12:55:38.864505  #

    2023-05-09T12:55:38.965142  / # export SHELL=3D/bin/sh. /lava-10258195/=
environment

    2023-05-09T12:55:38.965467  =


    2023-05-09T12:55:39.066125  / # . /lava-10258195/environment/lava-10258=
195/bin/lava-test-runner /lava-10258195/1

    2023-05-09T12:55:39.066591  =


    2023-05-09T12:55:39.070996  / # /lava-10258195/bin/lava-test-runner /la=
va-10258195/1

    2023-05-09T12:55:39.179321  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645a4422121dd5b6542e85e7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/645a4422121dd5b6542e85ec
        failing since 39 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-09T13:01:10.379129  [   19.250814] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10258370_1.5.2.3.1>

    2023-05-09T13:01:10.484783  / # #

    2023-05-09T13:01:10.585705  export SHELL=3D/bin/sh

    2023-05-09T13:01:10.586002  #

    2023-05-09T13:01:10.686639  / # export SHELL=3D/bin/sh. /lava-10258370/=
environment

    2023-05-09T13:01:10.686920  =


    2023-05-09T13:01:10.787492  / # . /lava-10258370/environment/lava-10258=
370/bin/lava-test-runner /lava-10258370/1

    2023-05-09T13:01:10.787856  =


    2023-05-09T13:01:10.792460  / # /lava-10258370/bin/lava-test-runner /la=
va-10258370/1

    2023-05-09T13:01:10.904823  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645a426fde2cf38ff02e8602

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/645a426fde2cf38ff02e8607
        failing since 39 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-09T12:53:48.806949  [   18.879194] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10258230_1.5.2.3.1>

    2023-05-09T12:53:48.809752  + set +x

    2023-05-09T12:53:48.919804  / # #

    2023-05-09T12:53:49.020535  export SHELL=3D/bin/sh

    2023-05-09T12:53:49.020766  #

    2023-05-09T12:53:49.121349  / # export SHELL=3D/bin/sh. /lava-10258230/=
environment

    2023-05-09T12:53:49.121549  =


    2023-05-09T12:53:49.222154  / # . /lava-10258230/environment/lava-10258=
230/bin/lava-test-runner /lava-10258230/1

    2023-05-09T12:53:49.222475  =


    2023-05-09T12:53:49.227165  / # /lava-10258230/bin/lava-test-runner /la=
va-10258230/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645a4423121dd5b6542e85f3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/645a4423121dd5b6542e85f8
        failing since 39 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-09T13:01:04.490223  <8>[   19.621863] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10258396_1.5.2.3.1>

    2023-05-09T13:01:04.493393  + set +x

    2023-05-09T13:01:04.597626  / # #

    2023-05-09T13:01:04.698352  export SHELL=3D/bin/sh

    2023-05-09T13:01:04.698567  #

    2023-05-09T13:01:04.799299  / # export SHELL=3D/bin/sh. /lava-10258396/=
environment

    2023-05-09T13:01:04.800125  =


    2023-05-09T13:01:04.901846  / # . /lava-10258396/environment/lava-10258=
396/bin/lava-test-runner /lava-10258396/1

    2023-05-09T13:01:04.902330  =


    2023-05-09T13:01:04.907066  / # /lava-10258396/bin/lava-test-runner /la=
va-10258396/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/645a45136c7a92ab5f2e8603

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baselin=
e-nfs-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baselin=
e-nfs-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/645a45136c7a92ab5=
f2e8604
        new failure (last pass: renesas-devel-2023-04-21-v6.3-rc7) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/645a42ba5292b0a7182e8605

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm/omap2plus_defconfig/gcc-10/lab-broonie/baseline-nfs-=
beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm/omap2plus_defconfig/gcc-10/lab-broonie/baseline-nfs-=
beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/645a42ba5292b0a71=
82e8606
        new failure (last pass: renesas-devel-2023-04-21-v6.3-rc7) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645a452f88b296bff02e869e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/645a452f88b296bff02e86a3
        failing since 39 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-09T13:05:27.181343  + set +x<8>[   18.120623] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10258228_1.5.2.3.1>

    2023-05-09T13:05:27.181493  =


    2023-05-09T13:05:27.285816  / # #

    2023-05-09T13:05:27.386489  export SHELL=3D/bin/sh

    2023-05-09T13:05:27.386698  #

    2023-05-09T13:05:27.487284  / # export SHELL=3D/bin/sh. /lava-10258228/=
environment

    2023-05-09T13:05:27.487467  =


    2023-05-09T13:05:27.587992  / # . /lava-10258228/environment/lava-10258=
228/bin/lava-test-runner /lava-10258228/1

    2023-05-09T13:05:27.588256  =


    2023-05-09T13:05:27.593481  / # /lava-10258228/bin/lava-test-runner /la=
va-10258228/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645a457a0bc5d029d02e8638

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/645a457a0bc5d029d02e863d
        failing since 39 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-09T13:06:45.482570  + set +x[   17.869965] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10258367_1.5.2.3.1>

    2023-05-09T13:06:45.482690  =


    2023-05-09T13:06:45.587437  / # #

    2023-05-09T13:06:45.688203  export SHELL=3D/bin/sh

    2023-05-09T13:06:45.688464  #

    2023-05-09T13:06:45.789012  / # export SHELL=3D/bin/sh. /lava-10258367/=
environment

    2023-05-09T13:06:45.789227  =


    2023-05-09T13:06:45.889785  / # . /lava-10258367/environment/lava-10258=
367/bin/lava-test-runner /lava-10258367/1

    2023-05-09T13:06:45.890124  =


    2023-05-09T13:06:45.894568  / # /lava-10258367/bin/lava-test-runner /la=
va-10258367/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645a44601be80aee402e85e6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/645a44601be80aee402e85eb
        failing since 39 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-09T13:02:00.899334  + set +x

    2023-05-09T13:02:00.905896  <8>[   18.078115] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10258363_1.5.2.3.1>

    2023-05-09T13:02:01.016409  / # #

    2023-05-09T13:02:01.117024  export SHELL=3D/bin/sh

    2023-05-09T13:02:01.117225  #

    2023-05-09T13:02:01.217733  / # export SHELL=3D/bin/sh. /lava-10258363/=
environment

    2023-05-09T13:02:01.218061  =


    2023-05-09T13:02:01.319075  / # . /lava-10258363/environment/lava-10258=
363/bin/lava-test-runner /lava-10258363/1

    2023-05-09T13:02:01.319636  =


    2023-05-09T13:02:01.324733  / # /lava-10258363/bin/lava-test-runner /la=
va-10258363/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645a426dde2cf38ff02e85f7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/645a426dde2cf38ff02e85fc
        failing since 39 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-09T12:53:45.675947  + <8>[   17.695197] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10258204_1.5.2.3.1>

    2023-05-09T12:53:45.676251  set +x

    2023-05-09T12:53:45.782494  / # #

    2023-05-09T12:53:45.884248  export SHELL=3D/bin/sh

    2023-05-09T12:53:45.884442  #

    2023-05-09T12:53:45.985044  / # export SHELL=3D/bin/sh. /lava-10258204/=
environment

    2023-05-09T12:53:45.985289  =


    2023-05-09T12:53:46.085823  / # . /lava-10258204/environment/lava-10258=
204/bin/lava-test-runner /lava-10258204/1

    2023-05-09T12:53:46.086126  =


    2023-05-09T12:53:46.090601  / # /lava-10258204/bin/lava-test-runner /la=
va-10258204/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645a442f1e1aabe87d2e85ee

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/645a442f1e1aabe87d2e85f3
        failing since 39 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-09T13:01:18.071419  + set +x[   15.355059] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10258399_1.5.2.3.1>

    2023-05-09T13:01:18.071540  =


    2023-05-09T13:01:18.176103  / # #

    2023-05-09T13:01:18.276731  export SHELL=3D/bin/sh

    2023-05-09T13:01:18.277055  #

    2023-05-09T13:01:18.377605  / # export SHELL=3D/bin/sh. /lava-10258399/=
environment

    2023-05-09T13:01:18.377862  =


    2023-05-09T13:01:18.478410  / # . /lava-10258399/environment/lava-10258=
399/bin/lava-test-runner /lava-10258399/1

    2023-05-09T13:01:18.478777  =


    2023-05-09T13:01:18.483177  / # /lava-10258399/bin/lava-test-runner /la=
va-10258399/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/645a4ca9b0e81cca3e2e8659

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/645a4ca9b0e81cca3e2e865e
        failing since 63 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-05-09T13:37:26.717131  + set +x
    2023-05-09T13:37:26.717303  [   27.380634] <LAVA_SIGNAL_ENDRUN 0_dmesg =
945345_1.6.2.3.1>
    2023-05-09T13:37:26.826134  #
    2023-05-09T13:37:26.927840  / # #export SHELL=3D/bin/sh
    2023-05-09T13:37:26.928256  =

    2023-05-09T13:37:27.029573  / # export SHELL=3D/bin/sh. /lava-945345/en=
vironment
    2023-05-09T13:37:27.030038  =

    2023-05-09T13:37:27.131316  / # . /lava-945345/environment/lava-945345/=
bin/lava-test-runner /lava-945345/1
    2023-05-09T13:37:27.131877  =

    2023-05-09T13:37:27.134833  / # /lava-945345/bin/lava-test-runner /lava=
-945345/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/645a53d924b0af7ffe2e8668

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/645a53d924b0af7ffe2e866d
        failing since 63 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-05-09T14:08:02.544324  + set +x
    2023-05-09T14:08:02.544500  [   30.720630] <LAVA_SIGNAL_ENDRUN 0_dmesg =
945393_1.6.2.3.1>
    2023-05-09T14:08:02.654416  #
    2023-05-09T14:08:02.756314  / # #export SHELL=3D/bin/sh
    2023-05-09T14:08:02.756792  =

    2023-05-09T14:08:02.858083  / # export SHELL=3D/bin/sh. /lava-945393/en=
vironment
    2023-05-09T14:08:02.858542  =

    2023-05-09T14:08:02.959828  / # . /lava-945393/environment/lava-945393/=
bin/lava-test-runner /lava-945393/1
    2023-05-09T14:08:02.960444  =

    2023-05-09T14:08:02.963708  / # /lava-945393/bin/lava-test-runner /lava=
-945393/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/645a5465a1a9c131d22e867a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/645a5465a1a9c131d22e867f
        failing since 63 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-05-09T14:10:24.076217  + set +x
    2023-05-09T14:10:24.076424  [   29.627933] <LAVA_SIGNAL_ENDRUN 0_dmesg =
945398_1.6.2.3.1>
    2023-05-09T14:10:24.190764  #
    2023-05-09T14:10:24.292713  / # #export SHELL=3D/bin/sh
    2023-05-09T14:10:24.293157  =

    2023-05-09T14:10:24.394437  / # export SHELL=3D/bin/sh. /lava-945398/en=
vironment
    2023-05-09T14:10:24.394927  =

    2023-05-09T14:10:24.496368  / # . /lava-945398/environment/lava-945398/=
bin/lava-test-runner /lava-945398/1
    2023-05-09T14:10:24.496946  =

    2023-05-09T14:10:24.499821  / # /lava-945398/bin/lava-test-runner /lava=
-945398/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645a54dd95728812202e8616

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/645a54dd95728812202e861b
        failing since 63 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-05-09T14:12:20.285947  + set +x
    2023-05-09T14:12:20.286109  [   28.399606] <LAVA_SIGNAL_ENDRUN 0_dmesg =
945405_1.6.2.3.1>
    2023-05-09T14:12:20.396153  #
    2023-05-09T14:12:20.498059  / # #export SHELL=3D/bin/sh
    2023-05-09T14:12:20.498423  =

    2023-05-09T14:12:20.599642  / # export SHELL=3D/bin/sh. /lava-945405/en=
vironment
    2023-05-09T14:12:20.600072  =

    2023-05-09T14:12:20.701269  / # . /lava-945405/environment/lava-945405/=
bin/lava-test-runner /lava-945405/1
    2023-05-09T14:12:20.701912  =

    2023-05-09T14:12:20.704662  / # /lava-945405/bin/lava-test-runner /lava=
-945405/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/645a55e151249e6c902e8629

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/645a55e151249e6c902e862e
        failing since 63 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-05-09T14:16:40.017611  + set +x
    2023-05-09T14:16:40.017816  [   29.357835] <LAVA_SIGNAL_ENDRUN 0_dmesg =
945415_1.6.2.3.1>
    2023-05-09T14:16:40.127306  #
    2023-05-09T14:16:40.228986  / # #export SHELL=3D/bin/sh
    2023-05-09T14:16:40.229476  =

    2023-05-09T14:16:40.330829  / # export SHELL=3D/bin/sh. /lava-945415/en=
vironment
    2023-05-09T14:16:40.331241  =

    2023-05-09T14:16:40.432408  / # . /lava-945415/environment/lava-945415/=
bin/lava-test-runner /lava-945415/1
    2023-05-09T14:16:40.432958  =

    2023-05-09T14:16:40.436168  / # /lava-945415/bin/lava-test-runner /lava=
-945415/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/645a49b201ce534b872e871c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/645a49b201ce534b872e8721
        failing since 15 days (last pass: renesas-devel-2023-04-21-v6.3-rc7=
, first fail: renesas-devel-2023-04-24-v6.3)

    2023-05-09T13:24:58.649939  + set[   26.004759] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 945349_1.6.2.3.1>
    2023-05-09T13:24:58.650126   +x
    2023-05-09T13:24:58.757747  / # #
    2023-05-09T13:24:58.859259  export SHELL=3D/bin/sh
    2023-05-09T13:24:58.859666  #
    2023-05-09T13:24:58.960826  / # export SHELL=3D/bin/sh. /lava-945349/en=
vironment
    2023-05-09T13:24:58.961247  =

    2023-05-09T13:24:59.062461  / # . /lava-945349/environment/lava-945349/=
bin/lava-test-runner /lava-945349/1
    2023-05-09T13:24:59.063031  =

    2023-05-09T13:24:59.066160  / # /lava-945349/bin/lava-test-runner /lava=
-945349/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645a44f00e18d15af02e85fa

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/645a44f00e18d15af02e85ff
        failing since 39 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-09T13:04:25.236749  + set[   17.032889] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10258223_1.5.2.3.1>

    2023-05-09T13:04:25.236876   +x

    2023-05-09T13:04:25.341335  / # #

    2023-05-09T13:04:25.441948  export SHELL=3D/bin/sh

    2023-05-09T13:04:25.442148  #

    2023-05-09T13:04:25.542633  / # export SHELL=3D/bin/sh. /lava-10258223/=
environment

    2023-05-09T13:04:25.542860  =


    2023-05-09T13:04:25.643434  / # . /lava-10258223/environment/lava-10258=
223/bin/lava-test-runner /lava-10258223/1

    2023-05-09T13:04:25.643792  =


    2023-05-09T13:04:25.648289  / # /lava-10258223/bin/lava-test-runner /la=
va-10258223/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645a450c6c7a92ab5f2e85f7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/645a450c6c7a92ab5f2e85fc
        failing since 39 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-09T13:04:51.546019  + <8>[   17.623272] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10258351_1.5.2.3.1>

    2023-05-09T13:04:51.546104  set +x

    2023-05-09T13:04:51.650395  / # #

    2023-05-09T13:04:51.750938  export SHELL=3D/bin/sh

    2023-05-09T13:04:51.751085  #

    2023-05-09T13:04:51.851562  / # export SHELL=3D/bin/sh. /lava-10258351/=
environment

    2023-05-09T13:04:51.851721  =


    2023-05-09T13:04:51.952271  / # . /lava-10258351/environment/lava-10258=
351/bin/lava-test-runner /lava-10258351/1

    2023-05-09T13:04:51.952532  =


    2023-05-09T13:04:51.957207  / # /lava-10258351/bin/lava-test-runner /la=
va-10258351/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/645a46f66049a0b7792e860f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/645a46f66049a0b77=
92e8610
        new failure (last pass: renesas-devel-2023-04-24-v6.3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/645a485e774b703ae52e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/645a485e774b703ae=
52e85e8
        new failure (last pass: renesas-devel-2023-04-24-v6.3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/645a46d96c66f4f3a82e85ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/645a46d96c66f4f3a=
82e85ee
        new failure (last pass: renesas-devel-2023-04-24-v6.3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/645a4780c73e21d3852e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/645a4780c73e21d38=
52e85e8
        new failure (last pass: renesas-devel-2023-04-24-v6.3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/645a4808e6485fb4442e8616

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline=
-nfs-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline=
-nfs-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/645a4808e6485fb4442e8619
        new failure (last pass: renesas-devel-2023-04-24-v6.3)

    2023-05-09T13:17:34.949147  + set +x
    2023-05-09T13:17:34.949307  [   57.831163] <LAVA_SIGNAL_ENDRUN 0_dmesg =
927365_1.6.2.4.1>
    2023-05-09T13:17:35.192598  / # #
    2023-05-09T13:17:36.651748  export SHELL=3D/bin/sh
    2023-05-09T13:17:36.672188  #
    2023-05-09T13:17:36.672393  / # export SHELL=3D/bin/sh
    2023-05-09T13:17:38.553665  / # . /lava-927365/environment
    2023-05-09T13:17:42.003308  /lava-927365/bin/lava-test-runner /lava-927=
365/1
    2023-05-09T13:17:42.023904  . /lava-927365/environment
    2023-05-09T13:17:42.024118  / # /lava-927365/bin/lava-test-runner /lava=
-927365/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 2          =


  Details:     https://kernelci.org/test/plan/id/645a45b644eb4b2ae82e8600

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/645a45b644e=
b4b2ae82e8657
        new failure (last pass: renesas-devel-2023-04-24-v6.3)
        2 lines

    2023-05-09T13:07:47.248098  , 48-bit VAs, pgdp=3D000000000b606000

    2023-05-09T13:07:47.255418  kern  :alert : [0000000000000008] pgd=3D000=
0000000000000, p4d=3D0000000000000000

    2023-05-09T13:07:47.304510  kern  :emerg : Internal error: Oops: 000000=
0096000004 [#1] PREEMPT SMP

    2023-05-09T13:07:47.311295  kern  :emerg : Code: 97fcc110 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-09T13:07:47.349725  <8>[   31.706366] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
   =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/645a45b644e=
b4b2ae82e8658
        new failure (last pass: renesas-devel-2023-04-24-v6.3)
        12 lines

    2023-05-09T13:07:47.195488  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-09T13:07:47.197756  kern  :alert : Mem abort info:

    2023-05-09T13:07:47.202226  kern  :alert :   ESR =3D 0x0000000096000004

    2023-05-09T13:07:47.208156  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-09T13:07:47.212220  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-09T13:07:47.214887  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-09T13:07:47.220671  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault

    2023-05-09T13:07:47.224195  kern  :alert : Data abort info:

    2023-05-09T13:07:47.228864  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004

    2023-05-09T13:07:47.231210  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (1 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/645a4709a0877a248e2e862b

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/645a4709a08=
77a248e2e8682
        new failure (last pass: renesas-devel-2023-04-24-v6.3)
        2 lines

    2023-05-09T13:13:31.018862  kern  :alert : Data <8>[   30.648785] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>

    2023-05-09T13:13:31.020661  abort info:

    2023-05-09T13:13:31.024735  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004

    2023-05-09T13:13:31.027407  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-05-09T13:13:31.035166  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000007c0b000

    2023-05-09T13:13:31.042837  kern  :alert : [0000000000000008] pgd=3D000=
0000000000000, p4d=3D0000000000000000

    2023-05-09T13:13:31.068550  kern  :emerg : Internal error: Oops: 000000=
0096000004 [#1] PREEMPT SMP

    2023-05-09T13:13:31.075497  kern  :emerg : Code: 97fc3110 f9405680 5286=
4a61 72a686c1 (b9400800) =

   =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/645a4709a08=
77a248e2e8683
        new failure (last pass: renesas-devel-2023-04-24-v6.3)
        12 lines

    2023-05-09T13:13:30.916212  <8>[   30.551597] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>

    2023-05-09T13:13:30.982005  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-09T13:13:30.984903  kern  :alert : Mem abort info:

    2023-05-09T13:13:30.989098  kern  :alert :   ESR =3D 0x0000000096000004

    2023-05-09T13:13:30.994565  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-09T13:13:30.998132  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-09T13:13:31.001760  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-09T13:13:31.007285  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
   =

 =20
