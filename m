Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5B606D1112
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Mar 2023 23:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbjC3VxF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Mar 2023 17:53:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjC3VxD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Mar 2023 17:53:03 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F12FAF772
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Mar 2023 14:52:59 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id c18so19426973ple.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Mar 2023 14:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1680213179;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h3JtLkDWa+3qZHBLXTh10cQ/X/MAl4pfQ864BamJ5Zs=;
        b=LV1mC5bOTjooDEUFeWqqLF5+X5UlpAioCndJvzLCw9arP6GEer58gQHBqPNAdd0Dou
         kbKsW7nejN3Z5OsIOZQNRuznLw2w8+8tQtzeyJd56HqVfumxFa76Lyv4RMPhD5o3uy6a
         pUqp0H2q4uoMPE/wVsjJFsGUq6guO7w190qPTe76/n4f8JoXfHqRsJEQlPpA0gRJ1ca4
         59eir1FjzohR7Uc3J9g3dzZOsauByAnW/bLi3FiucMIlShb547vKvHlpPm3190NQ0g4u
         iO8l/BoywbYoMQJvl9RKyFDt7srY56dFL77mOEAYBMXFijQkNZJqKquZqNP9ZqEOXnMb
         9vtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680213179;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h3JtLkDWa+3qZHBLXTh10cQ/X/MAl4pfQ864BamJ5Zs=;
        b=UYPHYYMhcZUnxu7Fbk5T3g89oDFuVhCymPl/I44trpjuPDIOIBSMD/AjZz3rIJDRLZ
         s+egeiU6feTzDUY6AK3JpsVtZlira8cbj/2GW6eYdYOsQzOANFRkWpH8Kb7KqTN5sGpg
         4K4wfadcqi80XMepIjsloUFDu0eUr7fMbyBu9Oy1NdlSDbxBYalJdCOpLbwSUUSrOuSx
         gKDbe7ZXCsswb3dC9Vo94R90uLUzwUoPRrcGzX0N3TIk/vM5ptHk/wvLqD3RZKKpCfH/
         t6hOZUPNDFfJezFp/1r+FmUo2JgudG19yyI78/qr0LIelDjKVqfv3ei3fUfMboHIkdv1
         tsjQ==
X-Gm-Message-State: AAQBX9dgoQBloh1Z/2+7SXKq85zx86cslswxACXWnY+eWLj+YMhmySVY
        mcma/2ya6h0AvznfUMgpIO4dAVHhY60XETZtUy8=
X-Google-Smtp-Source: AKy350ZhN/7AP4tlF11BFLTWzvZYsEWBFcoGAyzheBH0cXQ0nIZSsv3K5Ddkuy/eSV1z4CmYvLa2yg==
X-Received: by 2002:a17:903:3293:b0:1a0:428b:d8c5 with SMTP id jh19-20020a170903329300b001a0428bd8c5mr21209994plb.45.1680213178343;
        Thu, 30 Mar 2023 14:52:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id kr15-20020a170903080f00b001a1ca6dc38csm188567plb.118.2023.03.30.14.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 14:52:57 -0700 (PDT)
Message-ID: <642604b9.170a0220.a5637.0c97@mx.google.com>
Date:   Thu, 30 Mar 2023 14:52:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2023-03-30-v6.3-rc4
Subject: renesas/master baseline-nfs: 164 runs,
 30 regressions (renesas-devel-2023-03-30-v6.3-rc4)
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

renesas/master baseline-nfs: 164 runs, 30 regressions (renesas-devel-2023-0=
3-30-v6.3-rc4)

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

kontron-kswit...0-mmt-6g-2gs | arm    | lab-kontron   | gcc-10   | multi_v7=
_defconfig+crypto    | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 3          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-03-30-v6.3-rc4/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-03-30-v6.3-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      0bdeaa9d6106a95da9fe0d7e1fcf8a196e91805c =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cb05f9867958c562f7cc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425cb05f9867958c562f7d1
        new failure (last pass: renesas-devel-2023-03-27-v6.3-rc4)

    2023-03-30T17:46:38.795529  + set +x

    2023-03-30T17:46:38.802567  [   18.882180] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9820827_1.5.2.3.1>

    2023-03-30T17:46:38.913489  / # #

    2023-03-30T17:46:39.016502  export SHELL=3D/bin/sh

    2023-03-30T17:46:39.017564  #

    2023-03-30T17:46:39.119605  / # export SHELL=3D/bin/sh. /lava-9820827/e=
nvironment

    2023-03-30T17:46:39.120548  =


    2023-03-30T17:46:39.222536  / # . /lava-9820827/environment/lava-982082=
7/bin/lava-test-runner /lava-9820827/1

    2023-03-30T17:46:39.223903  =


    2023-03-30T17:46:39.230067  / # /lava-9820827/bin/lava-test-runner /lav=
a-9820827/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cc4911909c61e562f796

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425cc4911909c61e562f79b
        new failure (last pass: renesas-devel-2023-03-27-v6.3-rc4)

    2023-03-30T17:52:01.445113  [   19.040024] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9820946_1.5.2.3.1>

    2023-03-30T17:52:01.448401  + set +x

    2023-03-30T17:52:01.553751  / #

    2023-03-30T17:52:01.655143  # #export SHELL=3D/bin/sh

    2023-03-30T17:52:01.655365  =


    2023-03-30T17:52:01.756288  / # export SHELL=3D/bin/sh. /lava-9820946/e=
nvironment

    2023-03-30T17:52:01.756479  =


    2023-03-30T17:52:01.857395  / # . /lava-9820946/environment/lava-982094=
6/bin/lava-test-runner /lava-9820946/1

    2023-03-30T17:52:01.857746  =


    2023-03-30T17:52:01.863367  / # /lava-9820946/bin/lava-test-runner /lav=
a-9820946/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cecf6018c0fbde62f79a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425cecf6018c0fbde62f79f
        new failure (last pass: renesas-devel-2023-03-16-v6.3-rc2)

    2023-03-30T18:02:36.211259  + set +x

    2023-03-30T18:02:36.217879  [   22.870936] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9821261_1.5.2.3.1>

    2023-03-30T18:02:36.325764  #

    2023-03-30T18:02:36.427052  / # #export SHELL=3D/bin/sh

    2023-03-30T18:02:36.427268  =


    2023-03-30T18:02:36.528233  / # export SHELL=3D/bin/sh. /lava-9821261/e=
nvironment

    2023-03-30T18:02:36.528453  =


    2023-03-30T18:02:36.629402  / # . /lava-9821261/environment/lava-982126=
1/bin/lava-test-runner /lava-9821261/1

    2023-03-30T18:02:36.629769  =


    2023-03-30T18:02:36.635187  / # /lava-9821261/bin/lava-test-runner /lav=
a-9821261/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cbdc039838c80962f78f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425cbdc039838c80962f794
        new failure (last pass: renesas-devel-2023-03-27-v6.3-rc4)

    2023-03-30T17:50:06.792734  + set +x

    2023-03-30T17:50:06.798496  <8>[   20.157094] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9820909_1.5.2.3.1>

    2023-03-30T17:50:06.909254  / #

    2023-03-30T17:50:07.010448  # #export SHELL=3D/bin/sh

    2023-03-30T17:50:07.010633  =


    2023-03-30T17:50:07.111537  / # export SHELL=3D/bin/sh. /lava-9820909/e=
nvironment

    2023-03-30T17:50:07.111732  =


    2023-03-30T17:50:07.212636  / # . /lava-9820909/environment/lava-982090=
9/bin/lava-test-runner /lava-9820909/1

    2023-03-30T17:50:07.212952  =


    2023-03-30T17:50:07.215507  / # /lava-9820909/bin/lava-test-runner /lav=
a-9820909/1
 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cadbad1e17675562f793

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425cadbad1e17675562f798
        new failure (last pass: renesas-devel-2023-03-27-v6.3-rc4)

    2023-03-30T17:45:36.637273  [   18.599926] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9820812_1.5.2.3.1>

    2023-03-30T17:45:36.743189  / # #

    2023-03-30T17:45:36.844960  export SHELL=3D/bin/sh

    2023-03-30T17:45:36.845213  #

    2023-03-30T17:45:36.946161  / # export SHELL=3D/bin/sh. /lava-9820812/e=
nvironment

    2023-03-30T17:45:36.946449  =


    2023-03-30T17:45:37.047384  / # . /lava-9820812/environment/lava-982081=
2/bin/lava-test-runner /lava-9820812/1

    2023-03-30T17:45:37.047759  =


    2023-03-30T17:45:37.053091  / # /lava-9820812/bin/lava-test-runner /lav=
a-9820812/1

    2023-03-30T17:45:37.144265  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cbbc40fb79943c62f879

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425cbbc40fb79943c62f87e
        new failure (last pass: renesas-devel-2023-03-27-v6.3-rc4)

    2023-03-30T17:49:22.204904  [   17.460694] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9820886_1.5.2.3.1>

    2023-03-30T17:49:22.309411  / # #

    2023-03-30T17:49:22.410401  export SHELL=3D/bin/sh

    2023-03-30T17:49:22.410628  #

    2023-03-30T17:49:22.511508  / # export SHELL=3D/bin/sh. /lava-9820886/e=
nvironment

    2023-03-30T17:49:22.511729  =


    2023-03-30T17:49:22.612619  / # . /lava-9820886/environment/lava-982088=
6/bin/lava-test-runner /lava-9820886/1

    2023-03-30T17:49:22.612945  =


    2023-03-30T17:49:22.617984  / # /lava-9820886/bin/lava-test-runner /lav=
a-9820886/1

    2023-03-30T17:49:22.696474  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/6425cecd6018c0fbde62f78f

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425cecd6018c0fbde62f794
        new failure (last pass: renesas-devel-2023-03-16-v6.3-rc2)

    2023-03-30T18:02:29.630609  + set +x

    2023-03-30T18:02:29.634080  [   24.620268] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9821254_1.5.2.3.1>

    2023-03-30T18:02:29.741447  / # #

    2023-03-30T18:02:29.844372  export SHELL=3D/bin/sh

    2023-03-30T18:02:29.845220  #

    2023-03-30T18:02:29.947238  / # export SHELL=3D/bin/sh. /lava-9821254/e=
nvironment

    2023-03-30T18:02:29.948297  =


    2023-03-30T18:02:30.050395  / # . /lava-9821254/environment/lava-982125=
4/bin/lava-test-runner /lava-9821254/1

    2023-03-30T18:02:30.051747  =


    2023-03-30T18:02:30.052301  / # [   24.987858] platform AMDI5682:00: de=
ferred probe pending
 =

    ... (13 line(s) more)  =


  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/6425cecd601=
8c0fbde62f796
        failing since 14 days (last pass: renesas-devel-2023-03-07-v6.3-rc1=
, first fail: renesas-devel-2023-03-16-v6.3-rc2)
        3 lines

    2023-03-30T18:02:29.581386  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-03-30T18:02:29.588256  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-03-30T18:02:29.594784  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-03-30T18:02:29.627484  [   24.610657] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cae6509134307562f7e1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425cae6509134307562f7e6
        new failure (last pass: renesas-devel-2023-03-27-v6.3-rc4)

    2023-03-30T17:45:57.857823  [   17.803842] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9820792_1.5.2.3.1>

    2023-03-30T17:45:57.861763  + set +x

    2023-03-30T17:45:57.970937  / # #

    2023-03-30T17:45:58.071710  export SHELL=3D/bin/sh

    2023-03-30T17:45:58.071885  #

    2023-03-30T17:45:58.172743  / # export SHELL=3D/bin/sh. /lava-9820792/e=
nvironment

    2023-03-30T17:45:58.172919  =


    2023-03-30T17:45:58.273816  / # . /lava-9820792/environment/lava-982079=
2/bin/lava-test-runner /lava-9820792/1

    2023-03-30T17:45:58.274073  =


    2023-03-30T17:45:58.278744  / # /lava-9820792/bin/lava-test-runner /lav=
a-9820792/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cbc2d7cc95973362ffd4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425cbc2d7cc95973362ffd9
        new failure (last pass: renesas-devel-2023-03-27-v6.3-rc4)

    2023-03-30T17:49:36.581383  [   19.000366] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9820910_1.5.2.3.1>

    2023-03-30T17:49:36.584449  + set +x

    2023-03-30T17:49:36.692647  / # #

    2023-03-30T17:49:36.795493  export SHELL=3D/bin/sh

    2023-03-30T17:49:36.796388  #

    2023-03-30T17:49:36.898286  / # export SHELL=3D/bin/sh. /lava-9820910/e=
nvironment

    2023-03-30T17:49:36.899172  =


    2023-03-30T17:49:37.001174  / # . /lava-9820910/environment/lava-982091=
0/bin/lava-test-runner /lava-9820910/1

    2023-03-30T17:49:37.002408  =


    2023-03-30T17:49:37.007678  / # /lava-9820910/bin/lava-test-runner /lav=
a-9820910/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cea15e27d1f45e62f7a9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425cea15e27d1f45e62f7ae
        new failure (last pass: renesas-devel-2023-03-16-v6.3-rc2)

    2023-03-30T18:01:56.699049  + set +x

    2023-03-30T18:01:56.706018  [   17.575419] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9821270_1.5.2.3.1>

    2023-03-30T18:01:56.815369  / # #

    2023-03-30T18:01:56.918673  export SHELL=3D/bin/sh

    2023-03-30T18:01:56.919643  #

    2023-03-30T18:01:57.021876  / # export SHELL=3D/bin/sh. /lava-9821270/e=
nvironment

    2023-03-30T18:01:57.022855  =


    2023-03-30T18:01:57.124972  / # . /lava-9821270/environment/lava-982127=
0/bin/lava-test-runner /lava-9821270/1

    2023-03-30T18:01:57.126340  =


    2023-03-30T18:01:57.131238  / # /lava-9821270/bin/lava-test-runner /lav=
a-9821270/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6425ccb832a38e36e362f816

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425ccb832a38e36e362f81b
        new failure (last pass: renesas-devel-2023-03-27-v6.3-rc4)

    2023-03-30T17:53:37.898580  + set +x<8>[   16.087648] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 9820797_1.5.2.3.1>

    2023-03-30T17:53:37.898697  =


    2023-03-30T17:53:38.003394  / # #

    2023-03-30T17:53:38.106210  export SHELL=3D/bin/sh

    2023-03-30T17:53:38.107106  #

    2023-03-30T17:53:38.209272  / # export SHELL=3D/bin/sh. /lava-9820797/e=
nvironment

    2023-03-30T17:53:38.210202  =


    2023-03-30T17:53:38.312464  / # . /lava-9820797/environment/lava-982079=
7/bin/lava-test-runner /lava-9820797/1

    2023-03-30T17:53:38.313896  =


    2023-03-30T17:53:38.318335  / # /lava-9820797/bin/lava-test-runner /lav=
a-9820797/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cd0102979c98db62f7da

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425cd0102979c98db62f7df
        new failure (last pass: renesas-devel-2023-03-27-v6.3-rc4)

    2023-03-30T17:54:54.380673  + <8>[   18.425950] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9820930_1.5.2.3.1>

    2023-03-30T17:54:54.380758  set +x

    2023-03-30T17:54:54.485539  / # #

    2023-03-30T17:54:54.586549  export SHELL=3D/bin/sh

    2023-03-30T17:54:54.586776  #

    2023-03-30T17:54:54.687661  / # export SHELL=3D/bin/sh. /lava-9820930/e=
nvironment

    2023-03-30T17:54:54.687943  =


    2023-03-30T17:54:54.788879  / # . /lava-9820930/environment/lava-982093=
0/bin/lava-test-runner /lava-9820930/1

    2023-03-30T17:54:54.789199  =


    2023-03-30T17:54:54.793597  / # /lava-9820930/bin/lava-test-runner /lav=
a-9820930/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cef1eb5c1e741b62f87d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425cef1eb5c1e741b62f882
        new failure (last pass: renesas-devel-2023-03-16-v6.3-rc2)

    2023-03-30T18:03:20.714457  + set +x

    2023-03-30T18:03:20.721028  <8>[   34.522899] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9821264_1.5.2.3.1>

    2023-03-30T18:03:20.829653  #

    2023-03-30T18:03:20.930885  / # #export SHELL=3D/bin/sh

    2023-03-30T18:03:20.931091  =


    2023-03-30T18:03:21.032032  / # export SHELL=3D/bin/sh. /lava-9821264/e=
nvironment

    2023-03-30T18:03:21.032269  =


    2023-03-30T18:03:21.133236  / # . /lava-9821264/environment/lava-982126=
4/bin/lava-test-runner /lava-9821264/1

    2023-03-30T18:03:21.133532  =


    2023-03-30T18:03:21.138127  / # /lava-9821264/bin/lava-test-runner /lav=
a-9821264/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cccdabfc9db78f62f76b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425cccdabfc9db78f62f770
        new failure (last pass: renesas-devel-2023-03-27-v6.3-rc4)

    2023-03-30T17:54:14.016505  + set +x[   16.885769] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9820810_1.5.2.3.1>

    2023-03-30T17:54:14.016596  =


    2023-03-30T17:54:14.120803  / # #

    2023-03-30T17:54:14.221822  export SHELL=3D/bin/sh

    2023-03-30T17:54:14.222039  #

    2023-03-30T17:54:14.322927  / # export SHELL=3D/bin/sh. /lava-9820810/e=
nvironment

    2023-03-30T17:54:14.323156  =


    2023-03-30T17:54:14.424124  / # . /lava-9820810/environment/lava-982081=
0/bin/lava-test-runner /lava-9820810/1

    2023-03-30T17:54:14.424390  =


    2023-03-30T17:54:14.429602  / # /lava-9820810/bin/lava-test-runner /lav=
a-9820810/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6425ccfa02979c98db62f795

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425ccfa02979c98db62f79a
        new failure (last pass: renesas-devel-2023-03-27-v6.3-rc4)

    2023-03-30T17:55:00.979426  + set +x[   17.624462] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9820938_1.5.2.3.1>

    2023-03-30T17:55:00.979989  =


    2023-03-30T17:55:01.087970  / # #

    2023-03-30T17:55:01.191167  export SHELL=3D/bin/sh

    2023-03-30T17:55:01.192012  #

    2023-03-30T17:55:01.293766  / # export SHELL=3D/bin/sh. /lava-9820938/e=
nvironment

    2023-03-30T17:55:01.294622  =


    2023-03-30T17:55:01.396516  / # . /lava-9820938/environment/lava-982093=
8/bin/lava-test-runner /lava-9820938/1

    2023-03-30T17:55:01.396851  =


    2023-03-30T17:55:01.401764  / # /lava-9820938/bin/lava-test-runner /lav=
a-9820938/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cec36ee481711b62f76f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425cec36ee481711b62f774
        new failure (last pass: renesas-devel-2023-03-16-v6.3-rc2)

    2023-03-30T18:02:18.757839  + set[   22.123353] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9821268_1.5.2.3.1>

    2023-03-30T18:02:18.761049   +x

    2023-03-30T18:02:18.865955  / # #

    2023-03-30T18:02:18.967005  export SHELL=3D/bin/sh

    2023-03-30T18:02:18.967235  #

    2023-03-30T18:02:19.068192  / # export SHELL=3D/bin/sh. /lava-9821268/e=
nvironment

    2023-03-30T18:02:19.068413  =


    2023-03-30T18:02:19.169239  / # . /lava-9821268/environment/lava-982126=
8/bin/lava-test-runner /lava-9821268/1

    2023-03-30T18:02:19.169512  =


    2023-03-30T18:02:19.174641  / # /lava-9821268/bin/lava-test-runner /lav=
a-9821268/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cac48ef790b9aa62f76c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425cac48ef790b9aa62f771
        new failure (last pass: renesas-devel-2023-03-27-v6.3-rc4)

    2023-03-30T17:45:33.823615  <8>[   17.663385] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9820799_1.5.2.3.1>

    2023-03-30T17:45:33.929026  / # #

    2023-03-30T17:45:34.030068  export SHELL=3D/bin/sh

    2023-03-30T17:45:34.030299  #

    2023-03-30T17:45:34.131215  / # export SHELL=3D/bin/sh. /lava-9820799/e=
nvironment

    2023-03-30T17:45:34.131448  =


    2023-03-30T17:45:34.232388  / # . /lava-9820799/environment/lava-982079=
9/bin/lava-test-runner /lava-9820799/1

    2023-03-30T17:45:34.232739  =


    2023-03-30T17:45:34.238336  / # /lava-9820799/bin/lava-test-runner /lav=
a-9820799/1

    2023-03-30T17:45:34.314422  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cbc2254d76c41b62f7a6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425cbc2254d76c41b62f7ab
        new failure (last pass: renesas-devel-2023-03-27-v6.3-rc4)

    2023-03-30T17:49:43.859672  + [   17.371633] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 9820947_1.5.2.3.1>

    2023-03-30T17:49:43.860247  set +x

    2023-03-30T17:49:43.969042  / # #

    2023-03-30T17:49:44.072294  export SHELL=3D/bin/sh

    2023-03-30T17:49:44.073235  #

    2023-03-30T17:49:44.175222  / # export SHELL=3D/bin/sh. /lava-9820947/e=
nvironment

    2023-03-30T17:49:44.176152  =


    2023-03-30T17:49:44.278093  / # . /lava-9820947/environment/lava-982094=
7/bin/lava-test-runner /lava-9820947/1

    2023-03-30T17:49:44.279568  =


    2023-03-30T17:49:44.284371  / # /lava-9820947/bin/lava-test-runner /lav=
a-9820947/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6425ced4eb5c1e741b62f81c

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425ced4eb5c1e741b62f821
        new failure (last pass: renesas-devel-2023-03-16-v6.3-rc2)

    2023-03-30T18:02:38.428942  + [   23.399714] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 9821260_1.5.2.3.1>

    2023-03-30T18:02:38.429027  set +x

    2023-03-30T18:02:38.536058  / # #

    2023-03-30T18:02:38.637008  export SHELL=3D/bin/sh

    2023-03-30T18:02:38.637221  #

    2023-03-30T18:02:38.738162  / # export SHELL=3D/bin/sh. /lava-9821260/e=
nvironment

    2023-03-30T18:02:38.738336  =


    2023-03-30T18:02:38.839280  / # . /lava-9821260/environment/lava-982126=
0/bin/lava-test-runner /lava-9821260/1

    2023-03-30T18:02:38.839566  =


    2023-03-30T18:02:38.844708  / # /lava-9821260/bin/lava-test-runner /lav=
a-9821260/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm    | lab-kontron   | gcc-10   | multi_v7=
_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6425da99e54feef16762f77b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm/multi_v7_defconfig+crypto/gcc-10/lab-kontron/baselin=
e-nfs-kontron-kswitch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm/multi_v7_defconfig+crypto/gcc-10/lab-kontron/baselin=
e-nfs-kontron-kswitch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6425da99e54feef16=
762f77c
        new failure (last pass: renesas-devel-2023-03-27-v6.3-rc4) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cb634bd7edc7ef62f7c7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425cb634bd7edc7ef62f7cc
        new failure (last pass: renesas-devel-2023-03-27-v6.3-rc4)

    2023-03-30T17:47:53.222384  <8>[   18.607520] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9820781_1.5.2.3.1>

    2023-03-30T17:47:53.327117  / # #

    2023-03-30T17:47:53.428210  export SHELL=3D/bin/sh

    2023-03-30T17:47:53.428420  #

    2023-03-30T17:47:53.529346  / # export SHELL=3D/bin/sh. /lava-9820781/e=
nvironment

    2023-03-30T17:47:53.529584  =


    2023-03-30T17:47:53.630542  / # . /lava-9820781/environment/lava-982078=
1/bin/lava-test-runner /lava-9820781/1

    2023-03-30T17:47:53.630847  =


    2023-03-30T17:47:53.635288  / # /lava-9820781/bin/lava-test-runner /lav=
a-9820781/1

    2023-03-30T17:47:53.680090  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cbf07ad84f73e962f793

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425cbf07ad84f73e962f798
        new failure (last pass: renesas-devel-2023-03-27-v6.3-rc4)

    2023-03-30T17:50:35.243262  + set[   17.954300] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9820934_1.5.2.3.1>

    2023-03-30T17:50:35.243736   +x

    2023-03-30T17:50:35.352085  / # #

    2023-03-30T17:50:35.455286  export SHELL=3D/bin/sh

    2023-03-30T17:50:35.456205  #

    2023-03-30T17:50:35.558048  / # export SHELL=3D/bin/sh. /lava-9820934/e=
nvironment

    2023-03-30T17:50:35.558829  =


    2023-03-30T17:50:35.660740  / # . /lava-9820934/environment/lava-982093=
4/bin/lava-test-runner /lava-9820934/1

    2023-03-30T17:50:35.661998  =


    2023-03-30T17:50:35.667300  / # /lava-9820934/bin/lava-test-runner /lav=
a-9820934/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cec5bacb650fa862f76b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425cec5bacb650fa862f770
        new failure (last pass: renesas-devel-2023-03-16-v6.3-rc2)

    2023-03-30T18:02:19.522465  + set<8>[   22.290963] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9821269_1.5.2.3.1>

    2023-03-30T18:02:19.522578   +x

    2023-03-30T18:02:19.627485  / # #

    2023-03-30T18:02:19.728560  export SHELL=3D/bin/sh

    2023-03-30T18:02:19.728744  #

    2023-03-30T18:02:19.829684  / # export SHELL=3D/bin/sh. /lava-9821269/e=
nvironment

    2023-03-30T18:02:19.829882  =


    2023-03-30T18:02:19.930870  / # . /lava-9821269/environment/lava-982126=
9/bin/lava-test-runner /lava-9821269/1

    2023-03-30T18:02:19.931195  =


    2023-03-30T18:02:19.937063  / # /lava-9821269/bin/lava-test-runner /lav=
a-9821269/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/6425cf258ad765175f62f7d4

  Results:     165 PASS, 6 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.panel-edp-probed: https://kernelci.org/test/case/id=
/6425cf258ad765175f62f85b
        failing since 24 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-30T18:03:58.772948  /lava-9821282/1/../bin/lava-test-case

    2023-03-30T18:03:58.806796  [   45.643368] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/tes=
t/case/id/6425cf258ad765175f62f876
        failing since 24 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-30T18:03:53.655105  /lava-9821282/1/../bin/lava-test-case

    2023-03-30T18:03:53.682992  [   40.520050] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/te=
st/case/id/6425cf258ad765175f62f877
        failing since 24 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-30T18:03:52.573084  /lava-9821282/1/../bin/lava-test-case

    2023-03-30T18:03:52.597760  [   39.435300] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/6425cf0c17d391ad0062f782

  Results:     176 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/tes=
t/case/id/6425cf0d17d391ad0062f834
        failing since 24 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-30T18:03:27.768886  /lava-9821281/1/../bin/lava-test-case

    2023-03-30T18:03:27.794294  [   31.022468] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/te=
st/case/id/6425cf0d17d391ad0062f835
        failing since 24 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-30T18:03:26.705822  /lava-9821281/1/../bin/lava-test-case

    2023-03-30T18:03:26.730740  [   29.959361] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/te=
st/case/id/6425cf0d17d391ad0062f836
        failing since 24 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-30T18:03:25.650183  /lava-9821281/1/../bin/lava-test-case

    2023-03-30T18:03:25.677082  [   28.905356] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =

 =20
