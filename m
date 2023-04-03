Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C6DC6D457C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Apr 2023 15:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231816AbjDCNUZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Apr 2023 09:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbjDCNUY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Apr 2023 09:20:24 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F036D1
        for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Apr 2023 06:20:21 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id j13so27191216pjd.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Apr 2023 06:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1680528020;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=go3QuKf5Rb2p+6ciCG095JbLYfyt5W5BK3quAFVFVnI=;
        b=fe/kkGNco6Iew0NN52X6dT9EPULth5AaHLXSCejby/ETciyF7Du6lkNv1YtopimliL
         AXyibvT4TbKw7FfcD3/ekT8fzzzzwcp7Xo3ka0odDPAESpb+0rTujAJdZ/vJlBndeNsg
         cOueo0XCvPOLuCZMxgn2mdGCaJdCtwszGQnLLIGcVZN2KL/BM+Vjwni9vdjWNigZe4W6
         E7kfW040BzB5m8+lZIrFMuZ2dEhscep0i6huObG9x3kpN2UK3wCe+M3gGyo01pR+yf1E
         0VPa4MX8GsoWY0nvtKqvhwUTfAJFHZquF8FRrLhH/jigisbe1FReAucXaYieLJxYb/hL
         v8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680528020;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=go3QuKf5Rb2p+6ciCG095JbLYfyt5W5BK3quAFVFVnI=;
        b=LyukpxAp4sZQPh2IsMWTH7ie1/RX2VH6U2g7iGNOxkUDVp0etPpoozvq6OG57WlV3X
         6OxWIe9sPDdrQtOviXIVAlDVpN7iE6D3fdHkxoaL9R/Ja5K+kWP9LVQdxMxicMdX70FX
         20iL0UPRtmXLr9Hm2bFcx3AcIibjvEPjsH6aXmZvOtKnG8iJx/BwB/0Efxc0auIluswI
         WXsW8++asy5nH1HlEki7BlmZzbgjfJ7BLqbOnkHN+S/xsD6jlpLUCwVvcRIfGp80+3Pw
         1E7sgEbDqtFNwwBj/xDgYwq+JB06EIjPu0DR1CPM6cJZMuGs2q0n4QeWch+4OVDvXkyr
         p1Qg==
X-Gm-Message-State: AAQBX9fH4E1gDWJvyhIreViB4fn7+faFCml3sfSARIZEzpqBpdaqbvYg
        nT48n0W8+QTV+Do8jMcWV3xwXDiu0X03yAgnSRY=
X-Google-Smtp-Source: AKy350ZPkHgckR4vUHPE9dzAEYw97iGKInO84vct7QHQcvpSZv1POEugOduPbjzdIpmIKVTFysJT3A==
X-Received: by 2002:a17:902:d488:b0:1a1:d366:b0a4 with SMTP id c8-20020a170902d48800b001a1d366b0a4mr40995107plg.51.1680528020113;
        Mon, 03 Apr 2023 06:20:20 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x16-20020a170902b41000b0019f3e339fb4sm6582027plr.187.2023.04.03.06.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 06:20:19 -0700 (PDT)
Message-ID: <642ad293.170a0220.fca47.cda4@mx.google.com>
Date:   Mon, 03 Apr 2023 06:20:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2023-04-03-v6.3-rc5
Subject: renesas/master baseline-nfs: 114 runs,
 16 regressions (renesas-devel-2023-04-03-v6.3-rc5)
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

renesas/master baseline-nfs: 114 runs, 16 regressions (renesas-devel-2023-0=
4-03-v6.3-rc5)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-04-03-v6.3-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-04-03-v6.3-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      afd92422804c35e1936a1650617642c7cde8fda7 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642a97ac82b0ed433962f785

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-03-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-03-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642a97ac82b0ed433962f78a
        failing since 3 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-03T09:08:35.818776  + set +x

    2023-04-03T09:08:35.825022  [   19.138132] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9848176_1.5.2.3.1>

    2023-04-03T09:08:35.930641  / # #

    2023-04-03T09:08:36.031765  export SHELL=3D/bin/sh

    2023-04-03T09:08:36.032044  #

    2023-04-03T09:08:36.133018  / # export SHELL=3D/bin/sh. /lava-9848176/e=
nvironment

    2023-04-03T09:08:36.133382  =


    2023-04-03T09:08:36.234413  / # . /lava-9848176/environment/lava-984817=
6/bin/lava-test-runner /lava-9848176/1

    2023-04-03T09:08:36.234951  =


    2023-04-03T09:08:36.239627  / # /lava-9848176/bin/lava-test-runner /lav=
a-9848176/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642a9951d36e93ba5562f793

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-03-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-03-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642a9951d36e93ba5562f798
        failing since 3 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-03T09:15:35.564328  + set +x

    2023-04-03T09:15:35.571125  <8>[   18.974410] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9848428_1.5.2.3.1>

    2023-04-03T09:15:35.676692  #

    2023-04-03T09:15:35.777967  / # #export SHELL=3D/bin/sh

    2023-04-03T09:15:35.778184  =


    2023-04-03T09:15:35.879136  / # export SHELL=3D/bin/sh. /lava-9848428/e=
nvironment

    2023-04-03T09:15:35.879360  =


    2023-04-03T09:15:35.980331  / # . /lava-9848428/environment/lava-984842=
8/bin/lava-test-runner /lava-9848428/1

    2023-04-03T09:15:35.980654  =


    2023-04-03T09:15:35.986037  / # /lava-9848428/bin/lava-test-runner /lav=
a-9848428/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642a991675262c408362f7d1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-03-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-03-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642a991675262c408362f7d6
        failing since 3 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-03T09:14:36.455527  + set +x

    2023-04-03T09:14:36.462548  <8>[   19.005609] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9848391_1.5.2.3.1>

    2023-04-03T09:14:36.569048  / # #

    2023-04-03T09:14:36.671622  export SHELL=3D/bin/sh

    2023-04-03T09:14:36.672470  #

    2023-04-03T09:14:36.774300  / # export SHELL=3D/bin/sh. /lava-9848391/e=
nvironment

    2023-04-03T09:14:36.775122  =


    2023-04-03T09:14:36.876961  / # . /lava-9848391/environment/lava-984839=
1/bin/lava-test-runner /lava-9848391/1

    2023-04-03T09:14:36.878170  =


    2023-04-03T09:14:36.882905  / # /lava-9848391/bin/lava-test-runner /lav=
a-9848391/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642a9780f7bf50a52862f770

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-03-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-03-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642a9780f7bf50a52862f775
        failing since 3 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-03T09:07:51.712345  <8>[   18.787607] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9848181_1.5.2.3.1>

    2023-04-03T09:07:51.817576  / # #

    2023-04-03T09:07:51.920058  export SHELL=3D/bin/sh

    2023-04-03T09:07:51.920259  #

    2023-04-03T09:07:52.021242  / # export SHELL=3D/bin/sh. /lava-9848181/e=
nvironment

    2023-04-03T09:07:52.021772  =


    2023-04-03T09:07:52.123109  / # . /lava-9848181/environment/lava-984818=
1/bin/lava-test-runner /lava-9848181/1

    2023-04-03T09:07:52.123407  =


    2023-04-03T09:07:52.128160  / # /lava-9848181/bin/lava-test-runner /lav=
a-9848181/1

    2023-04-03T09:07:52.208984  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642a98dbf5dde9a29c62f7a5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-03-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-03-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642a98dbf5dde9a29c62f7aa
        failing since 3 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-03T09:13:43.260425  + set[   17.475700] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9848364_1.5.2.3.1>

    2023-04-03T09:13:43.260528   +x

    2023-04-03T09:13:43.365422  / # #

    2023-04-03T09:13:43.466504  export SHELL=3D/bin/sh

    2023-04-03T09:13:43.466727  #

    2023-04-03T09:13:43.567664  / # export SHELL=3D/bin/sh. /lava-9848364/e=
nvironment

    2023-04-03T09:13:43.567889  =


    2023-04-03T09:13:43.668692  / # . /lava-9848364/environment/lava-984836=
4/bin/lava-test-runner /lava-9848364/1

    2023-04-03T09:13:43.669053  =


    2023-04-03T09:13:43.674192  / # /lava-9848364/bin/lava-test-runner /lav=
a-9848364/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642a9752487e5eb19562f7db

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-03-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-03-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642a9752487e5eb19562f7e0
        failing since 3 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-03T09:07:18.741700  + set +x

    2023-04-03T09:07:18.748190  [   17.594961] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9848214_1.5.2.3.1>

    2023-04-03T09:07:18.852940  / # #

    2023-04-03T09:07:18.953898  export SHELL=3D/bin/sh

    2023-04-03T09:07:18.954090  #

    2023-04-03T09:07:19.055069  / # export SHELL=3D/bin/sh. /lava-9848214/e=
nvironment

    2023-04-03T09:07:19.055308  =


    2023-04-03T09:07:19.156269  / # . /lava-9848214/environment/lava-984821=
4/bin/lava-test-runner /lava-9848214/1

    2023-04-03T09:07:19.156596  =


    2023-04-03T09:07:19.161357  / # /lava-9848214/bin/lava-test-runner /lav=
a-9848214/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642a98c3b7d57166e062f790

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-03-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-03-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642a98c3b7d57166e062f795
        failing since 3 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-03T09:13:33.868276  <8>[   16.857568] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9848418_1.5.2.3.1>

    2023-04-03T09:13:33.871814  + set +x

    2023-04-03T09:13:33.976341  / # #

    2023-04-03T09:13:34.077386  export SHELL=3D/bin/sh

    2023-04-03T09:13:34.077789  #

    2023-04-03T09:13:34.179172  / # export SHELL=3D/bin/sh. /lava-9848418/e=
nvironment

    2023-04-03T09:13:34.179796  =


    2023-04-03T09:13:34.281610  / # . /lava-9848418/environment/lava-984841=
8/bin/lava-test-runner /lava-9848418/1

    2023-04-03T09:13:34.282959  =


    2023-04-03T09:13:34.287743  / # /lava-9848418/bin/lava-test-runner /lav=
a-9848418/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642a993d0e9a9eb7c062f794

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-03-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-03-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642a993d0e9a9eb7c062f799
        failing since 3 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-03T09:15:21.821200  + set +x

    2023-04-03T09:15:21.827493  [   18.274848] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9848170_1.5.2.3.1>

    2023-04-03T09:15:21.932990  / # #

    2023-04-03T09:15:22.034157  export SHELL=3D/bin/sh

    2023-04-03T09:15:22.034434  #

    2023-04-03T09:15:22.135142  / # export SHELL=3D/bin/sh. /lava-9848170/e=
nvironment

    2023-04-03T09:15:22.135405  =


    2023-04-03T09:15:22.236402  / # . /lava-9848170/environment/lava-984817=
0/bin/lava-test-runner /lava-9848170/1

    2023-04-03T09:15:22.236776  =


    2023-04-03T09:15:22.241716  / # /lava-9848170/bin/lava-test-runner /lav=
a-9848170/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642a99a14e2f7b0a3062f77d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-03-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-03-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642a99a14e2f7b0a3062f782
        failing since 3 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-03T09:17:02.626508  + <8>[   18.811743] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9848354_1.5.2.3.1>

    2023-04-03T09:17:02.630168  set +x

    2023-04-03T09:17:02.734341  / # #

    2023-04-03T09:17:02.835416  export SHELL=3D/bin/sh

    2023-04-03T09:17:02.835648  #

    2023-04-03T09:17:02.936607  / # export SHELL=3D/bin/sh. /lava-9848354/e=
nvironment

    2023-04-03T09:17:02.936839  =


    2023-04-03T09:17:03.037803  / # . /lava-9848354/environment/lava-984835=
4/bin/lava-test-runner /lava-9848354/1

    2023-04-03T09:17:03.038121  =


    2023-04-03T09:17:03.043188  / # /lava-9848354/bin/lava-test-runner /lav=
a-9848354/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642a98709a681eac4d62f770

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-03-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-03-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642a98709a681eac4d62f775
        failing since 3 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-03T09:12:07.365444  + set +x

    2023-04-03T09:12:07.371990  [   16.815356] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9848215_1.5.2.3.1>

    2023-04-03T09:12:07.477273  / # #

    2023-04-03T09:12:07.578160  export SHELL=3D/bin/sh

    2023-04-03T09:12:07.578391  #

    2023-04-03T09:12:07.679337  / # export SHELL=3D/bin/sh. /lava-9848215/e=
nvironment

    2023-04-03T09:12:07.679553  =


    2023-04-03T09:12:07.780438  / # . /lava-9848215/environment/lava-984821=
5/bin/lava-test-runner /lava-9848215/1

    2023-04-03T09:12:07.780745  =


    2023-04-03T09:12:07.785580  / # /lava-9848215/bin/lava-test-runner /lav=
a-9848215/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642a98e970b5a8101362f783

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-03-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-03-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642a98e970b5a8101362f788
        failing since 3 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-03T09:14:04.595923  + set +x

    2023-04-03T09:14:04.602704  [   17.910976] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9848387_1.5.2.3.1>

    2023-04-03T09:14:04.707587  / # #

    2023-04-03T09:14:04.808399  export SHELL=3D/bin/sh

    2023-04-03T09:14:04.808618  #

    2023-04-03T09:14:04.909494  / # export SHELL=3D/bin/sh. /lava-9848387/e=
nvironment

    2023-04-03T09:14:04.909708  =


    2023-04-03T09:14:05.010597  / # . /lava-9848387/environment/lava-984838=
7/bin/lava-test-runner /lava-9848387/1

    2023-04-03T09:14:05.010902  =


    2023-04-03T09:14:05.015277  / # /lava-9848387/bin/lava-test-runner /lav=
a-9848387/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642a978282b0ed433962f76b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-03-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-03-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642a978282b0ed433962f770
        failing since 3 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-03T09:07:49.766581  + [   18.644292] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 9848201_1.5.2.3.1>

    2023-04-03T09:07:49.766664  set +x

    2023-04-03T09:07:49.871533  / # #

    2023-04-03T09:07:49.972529  export SHELL=3D/bin/sh

    2023-04-03T09:07:49.972722  #

    2023-04-03T09:07:50.073591  / # export SHELL=3D/bin/sh. /lava-9848201/e=
nvironment

    2023-04-03T09:07:50.073833  =


    2023-04-03T09:07:50.174617  / # . /lava-9848201/environment/lava-984820=
1/bin/lava-test-runner /lava-9848201/1

    2023-04-03T09:07:50.174935  =


    2023-04-03T09:07:50.179663  / # /lava-9848201/bin/lava-test-runner /lav=
a-9848201/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642a98d8f5dde9a29c62f78f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-03-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-03-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642a98d8f5dde9a29c62f794
        failing since 3 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-03T09:13:48.961037  <8>[   17.932445] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9848416_1.5.2.3.1>

    2023-04-03T09:13:49.066538  / # #

    2023-04-03T09:13:49.167539  export SHELL=3D/bin/sh

    2023-04-03T09:13:49.167743  #

    2023-04-03T09:13:49.268696  / # export SHELL=3D/bin/sh. /lava-9848416/e=
nvironment

    2023-04-03T09:13:49.268901  =


    2023-04-03T09:13:49.369923  / # . /lava-9848416/environment/lava-984841=
6/bin/lava-test-runner /lava-9848416/1

    2023-04-03T09:13:49.370173  =


    2023-04-03T09:13:49.375028  / # /lava-9848416/bin/lava-test-runner /lav=
a-9848416/1

    2023-04-03T09:13:49.458661  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642a97e804efba687162f78d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-03-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-03-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642a97e804efba687162f792
        failing since 3 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-03T09:09:35.793576  [   18.344222] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9848191_1.5.2.3.1>

    2023-04-03T09:09:35.899174  / # #

    2023-04-03T09:09:36.000224  export SHELL=3D/bin/sh

    2023-04-03T09:09:36.000489  #

    2023-04-03T09:09:36.101488  / # export SHELL=3D/bin/sh. /lava-9848191/e=
nvironment

    2023-04-03T09:09:36.101773  =


    2023-04-03T09:09:36.202807  / # . /lava-9848191/environment/lava-984819=
1/bin/lava-test-runner /lava-9848191/1

    2023-04-03T09:09:36.203089  =


    2023-04-03T09:09:36.208835  / # /lava-9848191/bin/lava-test-runner /lav=
a-9848191/1

    2023-04-03T09:09:36.252101  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642a98ee70b5a8101362f7b2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-03-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-03-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642a98ee70b5a8101362f7b7
        failing since 3 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-03T09:13:55.877552  + set[   18.311980] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9848403_1.5.2.3.1>

    2023-04-03T09:13:55.877993   +x

    2023-04-03T09:13:55.986496  / # #

    2023-04-03T09:13:56.089329  export SHELL=3D/bin/sh

    2023-04-03T09:13:56.089978  #

    2023-04-03T09:13:56.191667  / # export SHELL=3D/bin/sh. /lava-9848403/e=
nvironment

    2023-04-03T09:13:56.192345  =


    2023-04-03T09:13:56.294193  / # . /lava-9848403/environment/lava-984840=
3/bin/lava-test-runner /lava-9848403/1

    2023-04-03T09:13:56.295241  =


    2023-04-03T09:13:56.300412  / # /lava-9848403/bin/lava-test-runner /lav=
a-9848403/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/642a9e32782798b5a862f76b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-03-v6.3-rc5/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-meson-gx=
l-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-03-v6.3-rc5/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-meson-gx=
l-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/642a9e32782798b5a=
862f76c
        new failure (last pass: renesas-devel-2023-03-10-v6.3-rc1) =

 =20
