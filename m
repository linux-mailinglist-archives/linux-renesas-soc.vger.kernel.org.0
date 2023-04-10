Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53AAC6DC7B4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Apr 2023 16:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbjDJOOQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Apr 2023 10:14:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbjDJOOO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Apr 2023 10:14:14 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C05C610C6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Apr 2023 07:14:05 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id e18-20020a17090ac21200b00246952d917fso3122180pjt.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Apr 2023 07:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1681136045; x=1683728045;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Pa5e6L4emQaK9AYEE+kcJEFXdtOYChk8ctDnxfFcxO0=;
        b=BVTmLrMlxFNzJp8cNSx5WANx4BX3sHfU7uNc8sqrNNwdrPa1d/vX9NAj+jHiy8TfHd
         lAM2KehCa1jMtZf/3xGjisfkZxzfAFNfGOFrDuoBBqowAKlXn+w0rP67EkYCiPvd60vD
         Ma5t1Fhrt2Yln0qsILQXS3omZq+Ms3w+fvO0IgNzG9fdaSJ7D07WG+vLTOmU1q81/qQR
         B1jofMAPELOLiPpTAWrvGi8BYVc/6EWIBJJeEoIqp/076V2O92PtIcbPvJCeoAxFsjsh
         UF0H/7niXlcPQfJNRtSquma+deCdCdf8YRdmg2NwGSHV4+pxgOec3rkSMU1uWUW+4HBe
         N0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681136045; x=1683728045;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pa5e6L4emQaK9AYEE+kcJEFXdtOYChk8ctDnxfFcxO0=;
        b=rlPErqQCVWQ/lSE0wynsh4bns8mJR8Hq9XlEVEjsy9rqX4MzvUWTj48Ww5YTy9lNjx
         gi7AlXK/F/igQAV4yHomyvVyl68OQJMANYOCxEZeg6P4A3FMTk1/ss+O4UdBuy6I4B0V
         NoJXzQcxCZ1dVRUKibENoyfozlA/FyCPJ3VtHRjcph3/Wgvuku6nW9OQZwMhA9vSWAhD
         GMLkViOjzupbS8PkQuPpFboYMpGE77T15HMfcio0k9AOcLlFr/urhIL4vE6e7ixum8WS
         YegthUq2fAhbmFrVgiCsvFsPgjIznjZyrZukcWiGS3X4S4GFNMZVguAW6dDxkrBez7gv
         yToA==
X-Gm-Message-State: AAQBX9easXx6oe9HUBjaHLx3ejdr/poFcxzSdxmWG1KD/cT/VN8cvNm0
        FgSvPb09JSU+CeTh3X9bKOJ86F0AkJlS5+O6fO15+g==
X-Google-Smtp-Source: AKy350agx+700Cf8lUT6S2nqCzGGs3FyVDrGWZAejOUrpciTqROtG9tFPGO05YTC/TjhsECqBN6JAA==
X-Received: by 2002:a17:902:eccb:b0:19d:1720:3873 with SMTP id a11-20020a170902eccb00b0019d17203873mr16700320plh.57.1681136043832;
        Mon, 10 Apr 2023 07:14:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id iw3-20020a170903044300b0019a74841c9bsm7838651plb.192.2023.04.10.07.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 07:14:03 -0700 (PDT)
Message-ID: <643419ab.170a0220.95eb7.e21a@mx.google.com>
Date:   Mon, 10 Apr 2023 07:14:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2023-04-10-v6.3-rc6
Subject: renesas/master baseline-nfs: 160 runs,
 38 regressions (renesas-devel-2023-04-10-v6.3-rc6)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 160 runs, 38 regressions (renesas-devel-2023-0=
4-10-v6.3-rc6)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 2          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

at91sam9g20ek                | arm    | lab-broonie   | gcc-10   | at91_dt_=
defconfig            | 1          =

beaglebone-black             | arm    | lab-cip       | gcc-10   | omap2plu=
s_defconfig          | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

juno-uboot                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+crypto             | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+crypto             | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+videodec           | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 3          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+debug              | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-04-10-v6.3-rc6/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-04-10-v6.3-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      5715ce18c1fd304f842f76a49a615fc0ace2320f =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6433e7b30494388f1c79e930

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-acer-cb317-1h-c3z6-dedede.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-acer-cb317-1h-c3z6-dedede.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6433e7b30494388f1c79e939
        new failure (last pass: renesas-devel-2023-04-04-v6.3-rc5)

    2023-04-10T10:40:34.100941  + set +x

    2023-04-10T10:40:34.107489  <8>[   21.668526] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9925574_1.5.2.3.1>

    2023-04-10T10:40:34.212350  / # #

    2023-04-10T10:40:34.313321  export SHELL=3D/bin/sh

    2023-04-10T10:40:34.313534  #

    2023-04-10T10:40:34.414344  / # export SHELL=3D/bin/sh. /lava-9925574/e=
nvironment

    2023-04-10T10:40:34.414569  =


    2023-04-10T10:40:34.515515  / # . /lava-9925574/environment/lava-992557=
4/bin/lava-test-runner /lava-9925574/1

    2023-04-10T10:40:34.515792  =


    2023-04-10T10:40:34.520878  / # /lava-9925574/bin/lava-test-runner /lav=
a-9925574/1
 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6433df0dede754956b79e971

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6433df0dede754956b79e97a
        failing since 10 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-10T10:03:37.384754  + set +x

    2023-04-10T10:03:37.391424  [   18.763443] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9924994_1.5.2.3.1>

    2023-04-10T10:03:37.499908  / # #

    2023-04-10T10:03:37.602798  export SHELL=3D/bin/sh

    2023-04-10T10:03:37.603479  #

    2023-04-10T10:03:37.705179  / # export SHELL=3D/bin/sh. /lava-9924994/e=
nvironment

    2023-04-10T10:03:37.705982  =


    2023-04-10T10:03:37.807851  / # . /lava-9924994/environment/lava-992499=
4/bin/lava-test-runner /lava-9924994/1

    2023-04-10T10:03:37.808153  =


    2023-04-10T10:03:37.814046  / # /lava-9924994/bin/lava-test-runner /lav=
a-9924994/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6433e0d4adff5f79c079ea88

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6433e0d4adff5f79c079ea91
        failing since 10 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-10T10:11:07.478387  + set +x

    2023-04-10T10:11:07.485287  <8>[   19.852245] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9925143_1.5.2.3.1>

    2023-04-10T10:11:07.596757  / # #

    2023-04-10T10:11:07.699675  export SHELL=3D/bin/sh

    2023-04-10T10:11:07.700571  #

    2023-04-10T10:11:07.802944  / # export SHELL=3D/bin/sh. /lava-9925143/e=
nvironment

    2023-04-10T10:11:07.803886  =


    2023-04-10T10:11:07.905891  / # . /lava-9925143/environment/lava-992514=
3/bin/lava-test-runner /lava-9925143/1

    2023-04-10T10:11:07.907315  =


    2023-04-10T10:11:07.913239  / # /lava-9925143/bin/lava-test-runner /lav=
a-9925143/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6433e7c99d3d8500e379e948

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6433e7c99d3d8500e379e951
        failing since 10 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-10T10:40:51.010828  + set +x

    2023-04-10T10:40:51.016619  <8>[   23.597288] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9925551_1.5.2.3.1>

    2023-04-10T10:40:51.124396  #

    2023-04-10T10:40:51.225583  / # #export SHELL=3D/bin/sh

    2023-04-10T10:40:51.225727  =


    2023-04-10T10:40:51.326671  / # export SHELL=3D/bin/sh. /lava-9925551/e=
nvironment

    2023-04-10T10:40:51.326886  =


    2023-04-10T10:40:51.427871  / # . /lava-9925551/environment/lava-992555=
1/bin/lava-test-runner /lava-9925551/1

    2023-04-10T10:40:51.428322  =


    2023-04-10T10:40:51.434228  / # /lava-9925551/bin/lava-test-runner /lav=
a-9925551/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6433e043b67a6c7a4179e93a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6433e043b67a6c7a4179e943
        failing since 10 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-10T10:08:53.671624  + set +x

    2023-04-10T10:08:53.678151  <8>[   19.458718] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9925118_1.5.2.3.1>

    2023-04-10T10:08:53.783470  / # #

    2023-04-10T10:08:53.884492  export SHELL=3D/bin/sh

    2023-04-10T10:08:53.884668  #

    2023-04-10T10:08:53.985576  / # export SHELL=3D/bin/sh. /lava-9925118/e=
nvironment

    2023-04-10T10:08:53.985764  =


    2023-04-10T10:08:54.086677  / # . /lava-9925118/environment/lava-992511=
8/bin/lava-test-runner /lava-9925118/1

    2023-04-10T10:08:54.087080  =


    2023-04-10T10:08:54.091957  / # /lava-9925118/bin/lava-test-runner /lav=
a-9925118/1
 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6433df0f9585d7375679e942

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6433df0f9585d7375679e94b
        failing since 10 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-10T10:03:34.300624  [   18.803030] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9925004_1.5.2.3.1>

    2023-04-10T10:03:34.404966  / # #

    2023-04-10T10:03:34.507935  export SHELL=3D/bin/sh

    2023-04-10T10:03:34.508704  #

    2023-04-10T10:03:34.610424  / # export SHELL=3D/bin/sh. /lava-9925004/e=
nvironment

    2023-04-10T10:03:34.610578  =


    2023-04-10T10:03:34.711418  / # . /lava-9925004/environment/lava-992500=
4/bin/lava-test-runner /lava-9925004/1

    2023-04-10T10:03:34.712444  =


    2023-04-10T10:03:34.717804  / # /lava-9925004/bin/lava-test-runner /lav=
a-9925004/1

    2023-04-10T10:03:34.819129  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6433e055c08e65e8ec79e9a7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6433e055c08e65e8ec79e9b0
        failing since 10 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-10T10:09:15.619779  + <8>[   18.402467] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9925150_1.5.2.3.1>

    2023-04-10T10:09:15.619882  set +x

    2023-04-10T10:09:15.724429  / # #

    2023-04-10T10:09:15.825452  export SHELL=3D/bin/sh

    2023-04-10T10:09:15.825727  #

    2023-04-10T10:09:15.926714  / # export SHELL=3D/bin/sh. /lava-9925150/e=
nvironment

    2023-04-10T10:09:15.926934  =


    2023-04-10T10:09:16.027910  / # . /lava-9925150/environment/lava-992515=
0/bin/lava-test-runner /lava-9925150/1

    2023-04-10T10:09:16.028206  =


    2023-04-10T10:09:16.034046  / # /lava-9925150/bin/lava-test-runner /lav=
a-9925150/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/6433e7cf6b39afe86e79e940

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/6433e7cf6b3=
9afe86e79e943
        failing since 24 days (last pass: renesas-devel-2023-03-07-v6.3-rc1=
, first fail: renesas-devel-2023-03-16-v6.3-rc2)
        3 lines

    2023-04-10T10:41:05.733884  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-04-10T10:41:05.740726  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-04-10T10:41:05.747182  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-04-10T10:41:05.777706  [   25.106678] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =


  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6433e7cf6b39afe86e79e949
        failing since 10 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-10T10:41:05.784473  + [   25.116465] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 9925572_1.5.2.3.1>

    2023-04-10T10:41:05.784897  set +x

    2023-04-10T10:41:05.893979  / # #

    2023-04-10T10:41:05.996568  export SHELL=3D/bin/sh

    2023-04-10T10:41:05.996945  #

    2023-04-10T10:41:06.098374  / # export SHELL=3D/bin/sh. /lava-9925572/e=
nvironment

    2023-04-10T10:41:06.099095  =


    2023-04-10T10:41:06.200879  / # . /lava-9925572/environment/lava-992557=
2/bin/lava-test-runner /lava-9925572/1

    2023-04-10T10:41:06.202002  =


    2023-04-10T10:41:06.207082  / # /lava-9925572/bin/lava-test-runner /lav=
a-9925572/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6433defcd81c1e547a79ea38

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6433defcd81c1e547a79ea41
        failing since 10 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-10T10:03:29.177884  [   18.454551] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9925012_1.5.2.3.1>

    2023-04-10T10:03:29.181407  + set +x

    2023-04-10T10:03:29.288936  / # #

    2023-04-10T10:03:29.391711  export SHELL=3D/bin/sh

    2023-04-10T10:03:29.392535  #

    2023-04-10T10:03:29.494568  / # export SHELL=3D/bin/sh. /lava-9925012/e=
nvironment

    2023-04-10T10:03:29.495434  =


    2023-04-10T10:03:29.597565  / # . /lava-9925012/environment/lava-992501=
2/bin/lava-test-runner /lava-9925012/1

    2023-04-10T10:03:29.598834  =


    2023-04-10T10:03:29.603912  / # /lava-9925012/bin/lava-test-runner /lav=
a-9925012/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6433e048b67a6c7a4179e95b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6433e048b67a6c7a4179e964
        failing since 10 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-10T10:09:04.495091  + set +x

    2023-04-10T10:09:04.501737  <8>[   17.255962] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9925109_1.5.2.3.1>

    2023-04-10T10:09:04.606427  / # #

    2023-04-10T10:09:04.708943  export SHELL=3D/bin/sh

    2023-04-10T10:09:04.709478  #

    2023-04-10T10:09:04.810759  / # export SHELL=3D/bin/sh. /lava-9925109/e=
nvironment

    2023-04-10T10:09:04.810927  =


    2023-04-10T10:09:04.911882  / # . /lava-9925109/environment/lava-992510=
9/bin/lava-test-runner /lava-9925109/1

    2023-04-10T10:09:04.912134  =


    2023-04-10T10:09:04.916936  / # /lava-9925109/bin/lava-test-runner /lav=
a-9925109/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6433e7b10494388f1c79e922

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6433e7b10494388f1c79e92b
        failing since 10 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-10T10:40:40.448620  [   21.210106] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9925543_1.5.2.3.1>

    2023-04-10T10:40:40.451888  + set +x

    2023-04-10T10:40:40.557724  / # #

    2023-04-10T10:40:40.660414  export SHELL=3D/bin/sh

    2023-04-10T10:40:40.660590  #

    2023-04-10T10:40:40.761499  / # export SHELL=3D/bin/sh. /lava-9925543/e=
nvironment

    2023-04-10T10:40:40.761700  =


    2023-04-10T10:40:40.862619  / # . /lava-9925543/environment/lava-992554=
3/bin/lava-test-runner /lava-9925543/1

    2023-04-10T10:40:40.862884  =


    2023-04-10T10:40:40.868201  / # /lava-9925543/bin/lava-test-runner /lav=
a-9925543/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
at91sam9g20ek                | arm    | lab-broonie   | gcc-10   | at91_dt_=
defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6433df3794c08da8df79e99f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at=
91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at=
91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/armel/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6433df3794c08da8d=
f79e9a0
        failing since 5 days (last pass: renesas-devel-2023-04-03-v6.3-rc5,=
 first fail: renesas-devel-2023-04-04-v6.3-rc5) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beaglebone-black             | arm    | lab-cip       | gcc-10   | omap2plu=
s_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6433e08ec25733a93979e974

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/arm/omap2plus_defconfig/gcc-10/lab-cip/baseline-nfs-beag=
lebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/arm/omap2plus_defconfig/gcc-10/lab-cip/baseline-nfs-beag=
lebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6433e08ec25733a93=
979e975
        new failure (last pass: renesas-devel-2023-04-04-v6.3-rc5) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6433def4d81c1e547a79e9ad

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6433def4d81c1e547a79e9b6
        failing since 10 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-10T10:03:18.835448  + set +x

    2023-04-10T10:03:18.841948  [   18.025890] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9924991_1.5.2.3.1>

    2023-04-10T10:03:18.947179  / # #

    2023-04-10T10:03:19.049661  export SHELL=3D/bin/sh

    2023-04-10T10:03:19.049829  #

    2023-04-10T10:03:19.150791  / # export SHELL=3D/bin/sh. /lava-9924991/e=
nvironment

    2023-04-10T10:03:19.150987  =


    2023-04-10T10:03:19.252019  / # . /lava-9924991/environment/lava-992499=
1/bin/lava-test-runner /lava-9924991/1

    2023-04-10T10:03:19.253268  =


    2023-04-10T10:03:19.257908  / # /lava-9924991/bin/lava-test-runner /lav=
a-9924991/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6433e13a198e6da18079e922

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6433e13a198e6da18079e92b
        failing since 10 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-10T10:12:52.850119  + set[   18.654999] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9925152_1.5.2.3.1>

    2023-04-10T10:12:52.853428   +x

    2023-04-10T10:12:52.958684  / # #

    2023-04-10T10:12:53.059686  export SHELL=3D/bin/sh

    2023-04-10T10:12:53.059884  #

    2023-04-10T10:12:53.160834  / # export SHELL=3D/bin/sh. /lava-9925152/e=
nvironment

    2023-04-10T10:12:53.161715  =


    2023-04-10T10:12:53.263654  / # . /lava-9925152/environment/lava-992515=
2/bin/lava-test-runner /lava-9925152/1

    2023-04-10T10:12:53.264120  =


    2023-04-10T10:12:53.268649  / # /lava-9925152/bin/lava-test-runner /lav=
a-9925152/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6433e7cb6b39afe86e79e933

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6433e7cb6b39afe86e79e93c
        failing since 10 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-10T10:40:55.984577  + set +x

    2023-04-10T10:40:55.990963  <8>[   34.508256] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9925553_1.5.2.3.1>

    2023-04-10T10:40:56.103722  #

    2023-04-10T10:40:56.206644  / # #export SHELL=3D/bin/sh

    2023-04-10T10:40:56.206813  =


    2023-04-10T10:40:56.307730  / # export SHELL=3D/bin/sh. /lava-9925553/e=
nvironment

    2023-04-10T10:40:56.307902  =


    2023-04-10T10:40:56.408866  / # . /lava-9925553/environment/lava-992555=
3/bin/lava-test-runner /lava-9925553/1

    2023-04-10T10:40:56.409110  =


    2023-04-10T10:40:56.413928  / # /lava-9925553/bin/lava-test-runner /lav=
a-9925553/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6433defad81c1e547a79ea2d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6433defad81c1e547a79ea34
        failing since 10 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-10T10:03:13.868620  + set +x[   17.790883] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9925006_1.5.2.3.1>

    2023-04-10T10:03:13.869135  =


    2023-04-10T10:03:13.977757  / # #

    2023-04-10T10:03:14.080755  export SHELL=3D/bin/sh

    2023-04-10T10:03:14.080967  #

    2023-04-10T10:03:14.181772  / # export SHELL=3D/bin/sh. /lava-9925006/e=
nvironment

    2023-04-10T10:03:14.182590  =


    2023-04-10T10:03:14.284280  / # . /lava-9925006/environment/lava-992500=
6/bin/lava-test-runner /lava-9925006/1

    2023-04-10T10:03:14.285320  =


    2023-04-10T10:03:14.290901  / # /lava-9925006/bin/lava-test-runner /lav=
a-9925006/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6433e041b67a6c7a4179e92f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6433e041b67a6c7a4179e938
        failing since 10 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-10T10:08:46.843181  + set[   16.980918] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9925076_1.5.2.3.1>

    2023-04-10T10:08:46.845868   +x

    2023-04-10T10:08:46.951085  / # #

    2023-04-10T10:08:47.053660  export SHELL=3D/bin/sh

    2023-04-10T10:08:47.054373  #

    2023-04-10T10:08:47.156036  / # export SHELL=3D/bin/sh. /lava-9925076/e=
nvironment

    2023-04-10T10:08:47.156710  =


    2023-04-10T10:08:47.258566  / # . /lava-9925076/environment/lava-992507=
6/bin/lava-test-runner /lava-9925076/1

    2023-04-10T10:08:47.259138  =


    2023-04-10T10:08:47.263928  / # /lava-9925076/bin/lava-test-runner /lav=
a-9925076/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6433e7b408133585ee79e9a1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6433e7b408133585ee79e9aa
        failing since 10 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-10T10:40:34.971661  + set[   22.533721] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9925580_1.5.2.3.1>

    2023-04-10T10:40:34.971747   +x

    2023-04-10T10:40:35.076692  / # #

    2023-04-10T10:40:35.177752  export SHELL=3D/bin/sh

    2023-04-10T10:40:35.177962  #

    2023-04-10T10:40:35.278907  / # export SHELL=3D/bin/sh. /lava-9925580/e=
nvironment

    2023-04-10T10:40:35.279091  =


    2023-04-10T10:40:35.380022  / # . /lava-9925580/environment/lava-992558=
0/bin/lava-test-runner /lava-9925580/1

    2023-04-10T10:40:35.380357  =


    2023-04-10T10:40:35.385632  / # /lava-9925580/bin/lava-test-runner /lav=
a-9925580/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6433df012b22cca6ad79e933

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6433df012b22cca6ad79e93c
        failing since 10 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-10T10:03:33.565341  <8>[   15.733193] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9925018_1.5.2.3.1>

    2023-04-10T10:03:33.673699  / # #

    2023-04-10T10:03:33.776928  export SHELL=3D/bin/sh

    2023-04-10T10:03:33.777754  #

    2023-04-10T10:03:33.879763  / # export SHELL=3D/bin/sh. /lava-9925018/e=
nvironment

    2023-04-10T10:03:33.880611  =


    2023-04-10T10:03:33.982575  / # . /lava-9925018/environment/lava-992501=
8/bin/lava-test-runner /lava-9925018/1

    2023-04-10T10:03:33.983939  =


    2023-04-10T10:03:33.988882  / # /lava-9925018/bin/lava-test-runner /lav=
a-9925018/1

    2023-04-10T10:03:34.085344  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6433e065a7c065d0c879e981

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6433e065a7c065d0c879e98a
        failing since 10 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-10T10:09:27.011885  [   18.042386] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9925145_1.5.2.3.1>

    2023-04-10T10:09:27.116952  / # #

    2023-04-10T10:09:27.219347  export SHELL=3D/bin/sh

    2023-04-10T10:09:27.219629  #

    2023-04-10T10:09:27.320956  / # export SHELL=3D/bin/sh. /lava-9925145/e=
nvironment

    2023-04-10T10:09:27.321739  =


    2023-04-10T10:09:27.423435  / # . /lava-9925145/environment/lava-992514=
5/bin/lava-test-runner /lava-9925145/1

    2023-04-10T10:09:27.424682  =


    2023-04-10T10:09:27.430294  / # /lava-9925145/bin/lava-test-runner /lav=
a-9925145/1

    2023-04-10T10:09:27.522479  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6433e7e49d3d8500e379e9b9

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6433e7e49d3d8500e379e9c2
        failing since 10 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-10T10:41:19.060149  + set +x

    2023-04-10T10:41:19.063627  [   23.245335] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9925584_1.5.2.3.1>

    2023-04-10T10:41:19.170909  / # #

    2023-04-10T10:41:19.271939  export SHELL=3D/bin/sh

    2023-04-10T10:41:19.272115  #

    2023-04-10T10:41:19.373035  / # export SHELL=3D/bin/sh. /lava-9925584/e=
nvironment

    2023-04-10T10:41:19.373222  =


    2023-04-10T10:41:19.474355  / # . /lava-9925584/environment/lava-992558=
4/bin/lava-test-runner /lava-9925584/1

    2023-04-10T10:41:19.475563  =


    2023-04-10T10:41:19.475992  / # [   23.578134] platform AMDI5682:00: de=
ferred probe pending
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
juno-uboot                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6433e0eff033ae9b7f79e956

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-nfs-j=
uno-uboot.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-nfs-j=
uno-uboot.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6433e0eff033ae9b7=
f79e957
        failing since 75 days (last pass: renesas-devel-2023-01-09-v6.2-rc3=
, first fail: renesas-devel-2023-01-24-v6.2-rc5) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6433def7d81c1e547a79ea00

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6433def7d81c1e547a79ea09
        failing since 10 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-10T10:03:20.529450  <8>[   17.562343] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9925024_1.5.2.3.1>

    2023-04-10T10:03:20.633952  / # #

    2023-04-10T10:03:20.734963  export SHELL=3D/bin/sh

    2023-04-10T10:03:20.735152  #

    2023-04-10T10:03:20.835890  / # export SHELL=3D/bin/sh. /lava-9925024/e=
nvironment

    2023-04-10T10:03:20.836085  =


    2023-04-10T10:03:20.937003  / # . /lava-9925024/environment/lava-992502=
4/bin/lava-test-runner /lava-9925024/1

    2023-04-10T10:03:20.937304  =


    2023-04-10T10:03:20.941988  / # /lava-9925024/bin/lava-test-runner /lav=
a-9925024/1

    2023-04-10T10:03:20.985663  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6433e04c8fd1c3ffe079e92c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6433e04c8fd1c3ffe079e935
        failing since 10 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-10T10:08:59.537795  <8>[   17.632842] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9925108_1.5.2.3.1>

    2023-04-10T10:08:59.643685  / # #

    2023-04-10T10:08:59.746234  export SHELL=3D/bin/sh

    2023-04-10T10:08:59.746915  #

    2023-04-10T10:08:59.848742  / # export SHELL=3D/bin/sh. /lava-9925108/e=
nvironment

    2023-04-10T10:08:59.849443  =


    2023-04-10T10:08:59.951210  / # . /lava-9925108/environment/lava-992510=
8/bin/lava-test-runner /lava-9925108/1

    2023-04-10T10:08:59.952316  =


    2023-04-10T10:08:59.957386  / # /lava-9925108/bin/lava-test-runner /lav=
a-9925108/1

    2023-04-10T10:09:00.013674  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6433e7bbb6eec52fb279e92f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6433e7bbb6eec52fb279e938
        failing since 10 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-10T10:40:43.781117  + set[   21.942624] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9925577_1.5.2.3.1>

    2023-04-10T10:40:43.781589   +x

    2023-04-10T10:40:43.898258  / # #

    2023-04-10T10:40:44.001313  export SHELL=3D/bin/sh

    2023-04-10T10:40:44.002176  #

    2023-04-10T10:40:44.104117  / # export SHELL=3D/bin/sh. /lava-9925577/e=
nvironment

    2023-04-10T10:40:44.104931  =


    2023-04-10T10:40:44.206846  / # . /lava-9925577/environment/lava-992557=
7/bin/lava-test-runner /lava-9925577/1

    2023-04-10T10:40:44.208071  =


    2023-04-10T10:40:44.213034  / # /lava-9925577/bin/lava-test-runner /lav=
a-9925577/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6433e0b2770a797aae79e943

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-nfs-m=
eson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-nfs-m=
eson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6433e0b2770a797aa=
e79e944
        new failure (last pass: renesas-devel-2023-03-30-v6.3-rc4) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6433e834c7aa32512279e953

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-nfs=
-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-nfs=
-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6433e834c7aa32512=
279e954
        new failure (last pass: renesas-devel-2023-04-04-v6.3-rc5) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6433eac8eb7ac3549f79e973

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bro=
onie/baseline-nfs-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bro=
onie/baseline-nfs-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6433eac8eb7ac3549=
f79e974
        failing since 24 days (last pass: renesas-devel-2023-03-10-v6.3-rc1=
, first fail: renesas-devel-2023-03-16-v6.3-rc2) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/6433e1fc1d5ff91d4c79e934

  Results:     165 PASS, 6 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.panel-edp-probed: https://kernelci.org/test/case/id=
/6433e1fc1d5ff91d4c79e988
        failing since 34 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-10T10:16:15.505455  /lava-9925277/1/../bin/lava-test-case

    2023-04-10T10:16:15.530289  <8>[   37.175512] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/tes=
t/case/id/6433e1fd1d5ff91d4c79e9d8
        failing since 34 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-10T10:16:10.293796  /lava-9925277/1/../bin/lava-test-case

    2023-04-10T10:16:10.322375  <8>[   31.967273] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/te=
st/case/id/6433e1fd1d5ff91d4c79e9d9
        failing since 34 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-10T10:16:09.205494  /lava-9925277/1/../bin/lava-test-case

    2023-04-10T10:16:09.228656  <8>[   30.874215] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/6433e263a5f700631e79e9c5

  Results:     176 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/tes=
t/case/id/6433e263a5f700631e79ea6d
        failing since 34 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-10T10:17:38.342672  /lava-9925307/1/../bin/lava-test-case

    2023-04-10T10:17:38.366212  <8>[   31.264202] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/te=
st/case/id/6433e263a5f700631e79ea7b
        failing since 34 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-10T10:17:37.292060  /lava-9925307/1/../bin/lava-test-case

    2023-04-10T10:17:37.316180  <8>[   30.213682] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/te=
st/case/id/6433e263a5f700631e79ea7c
        failing since 34 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-10T10:17:36.235961  /lava-9925307/1/../bin/lava-test-case

    2023-04-10T10:17:36.258451  <8>[   29.156079] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6433ec82539c96259479e944

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline=
-nfs-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline=
-nfs-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6433ec82539c96259479e94d
        new failure (last pass: renesas-devel-2023-04-04-v6.3-rc5)

    2023-04-10T11:00:59.198104  + set +x
    2023-04-10T11:00:59.198322  [   56.316046] <LAVA_SIGNAL_ENDRUN 0_dmesg =
901545_1.6.2.4.1>
    2023-04-10T11:00:59.357559  / # #
    2023-04-10T11:01:00.819540  export SHELL=3D/bin/sh
    2023-04-10T11:01:00.840113  #
    2023-04-10T11:01:00.840333  / # export SHELL=3D/bin/sh
    2023-04-10T11:01:02.725640  / # . /lava-901545/environment
    2023-04-10T11:01:06.183596  /lava-901545/bin/lava-test-runner /lava-901=
545/1
    2023-04-10T11:01:06.204334  . /lava-901545/environment
    2023-04-10T11:01:06.204461  / # /lava-901545/bin/lava-test-runner /lava=
-901545/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6433e6cc825551028e79e92a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-nfs-su=
n50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-10-v6.3-rc6/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-nfs-su=
n50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6433e6cc825551028=
e79e92b
        new failure (last pass: renesas-devel-2023-04-04-v6.3-rc5) =

 =20
