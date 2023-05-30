Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44E457162E6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 May 2023 16:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230515AbjE3OBr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 May 2023 10:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231708AbjE3OBp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 May 2023 10:01:45 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 508F8E8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 07:01:39 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-64f47448aeaso3259392b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 07:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1685455298; x=1688047298;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ehm9HHf+SWz8oWkADrdqcFsZKhhk2Ru4RlYNeN+7mpc=;
        b=XpMVR3EeBGtxOZudk9motUKutDajj4US0yJWWNiyK3N8EzOnqlc5DCFnexQYIDFaie
         Dqdvg44XA6zwzMTa8w2PxvfmuqCLe4/0KksXYiFMOQ52UlAiTU2VTerVVU1fxLEpQvvJ
         hueimZSUszmSK2hv0PYhzdB/q3WZUGHCkgwQdb2sa4idEs3rHi8MP6g9n9K4mbfD1MYo
         jIUM0YoDq4LAaC3k4n9Anhv7AFG06BiurxwHrsUKj7fxNBZlKMh4KoXqh+ZwyjVenALF
         hQIzNfiYI75LsPNMnxITbvv6D5NRKb1cK+UlLk/bXld7qdZcdlMdzzknf6mDDvPYdfr0
         XqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685455298; x=1688047298;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ehm9HHf+SWz8oWkADrdqcFsZKhhk2Ru4RlYNeN+7mpc=;
        b=fOFMpUeGatiGwXEMANPSU9ckBqqGPWViuKxd7RTotEg0c4prsQ21jq95z75YgKasLe
         4o4cciTi/n+TZOixFc/rucxTujt8fpvyUK3QJmUafcBAMaFKCNylY9tHK3JqRKniobLl
         ekf00m4ibwAaBvQjXORMn3zx11PbpdrLh6wJ/xzzD//ybyuiAmwqhtHlNMRS8ofFmy35
         wXtd0VmFw5wlRViapXoEkZghLO/foRecy+J8iNfsXIZ+mQMcKX+aEciTXX030sb/rUYm
         7RivMzaj2k3btwRoavueEQiPaigKkU5yzX27YfW+6MNnGpGyrfnjjL1MgvsS0N+xPtbG
         ofKA==
X-Gm-Message-State: AC+VfDzoxrKpY8d8cx0EVy5WapvwKa8nxNnf4rglzMPujb0Z7S4fOvV7
        SA7oGpSu1EWXaYP8UZpK7ZLRtgSSVksRGe2RFhwV8w==
X-Google-Smtp-Source: ACHHUZ5DEG8Wd83oq2m67qra8Qa6rftFvvJvMAAx29GmaJPA5IISSvRXyF70m1xzcmqjAxgceWOCcQ==
X-Received: by 2002:a05:6a21:9810:b0:104:873:c3b5 with SMTP id ue16-20020a056a21981000b001040873c3b5mr1995120pzb.44.1685455295848;
        Tue, 30 May 2023 07:01:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c5-20020aa781c5000000b0064fe06fe712sm1658592pfn.129.2023.05.30.07.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 07:01:35 -0700 (PDT)
Message-ID: <647601bf.a70a0220.12bec.2eb4@mx.google.com>
Date:   Tue, 30 May 2023 07:01:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-05-30-v6.4-rc4
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 185 runs,
 49 regressions (renesas-devel-2023-05-30-v6.4-rc4)
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

renesas/master baseline-nfs: 185 runs, 49 regressions (renesas-devel-2023-0=
5-30-v6.4-rc4)

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

beaglebone-black             | arm    | lab-broonie   | gcc-10   | multi_v7=
_defconfig           | 1          =

beaglebone-black             | arm    | lab-broonie   | gcc-10   | multi_v7=
_defconfig+crypto    | 1          =

beaglebone-black             | arm    | lab-broonie   | gcc-10   | multi_v7=
_defconfig+ima       | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10   | defconfi=
g+videodec           | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10   | defconfi=
g+crypto             | 2          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+videodec           | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-05-30-v6.4-rc4/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-05-30-v6.4-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      520bf28625c74fdd976c6c37fb519ccad1cef65b =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6475cd91e0cdab1b4a2e85ec

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-acer-cb317-1h-c3z6-dedede.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-acer-cb317-1h-c3z6-dedede.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6475cd91e0cdab1b4a2e85f1
        failing since 49 days (last pass: renesas-devel-2023-04-04-v6.3-rc5=
, first fail: renesas-devel-2023-04-10-v6.3-rc6)

    2023-05-30T10:18:40.077191  + set +x

    2023-05-30T10:18:40.083796  [   23.722048] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10523061_1.5.2.3.1>

    2023-05-30T10:18:40.189488  / # #

    2023-05-30T10:18:40.290335  export SHELL=3D/bin/sh

    2023-05-30T10:18:40.290527  #

    2023-05-30T10:18:40.391126  / # export SHELL=3D/bin/sh. /lava-10523061/=
environment

    2023-05-30T10:18:40.391289  =


    2023-05-30T10:18:40.491807  / # . /lava-10523061/environment/lava-10523=
061/bin/lava-test-runner /lava-10523061/1

    2023-05-30T10:18:40.492222  =


    2023-05-30T10:18:40.497073  / # /lava-10523061/bin/lava-test-runner /la=
va-10523061/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6475c9527217dad4c42e85ea

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6475c9527217dad4c42e85ef
        failing since 60 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-30T10:00:35.826073  [   19.690751] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10522570_1.5.2.3.1>

    2023-05-30T10:00:35.829317  + set +x

    2023-05-30T10:00:36.016576  / # #

    2023-05-30T10:00:36.117309  export SHELL=3D/bin/sh

    2023-05-30T10:00:36.117551  #

    2023-05-30T10:00:36.218079  / # export SHELL=3D/bin/sh. /lava-10522570/=
environment

    2023-05-30T10:00:36.218295  =


    2023-05-30T10:00:36.318853  / # . /lava-10522570/environment/lava-10522=
570/bin/lava-test-runner /lava-10522570/1

    2023-05-30T10:00:36.319168  =


    2023-05-30T10:00:36.325283  / # /lava-10522570/bin/lava-test-runner /la=
va-10522570/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6475c9de95a0ec86b72e8641

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6475c9de95a0ec86b72e8646
        failing since 60 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-30T10:02:46.265656  + set +x

    2023-05-30T10:02:46.272509  <8>[   19.056303] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10522701_1.5.2.3.1>

    2023-05-30T10:02:46.376314  / # #

    2023-05-30T10:02:46.477022  export SHELL=3D/bin/sh

    2023-05-30T10:02:46.477212  #

    2023-05-30T10:02:46.577754  / # export SHELL=3D/bin/sh. /lava-10522701/=
environment

    2023-05-30T10:02:46.577992  =


    2023-05-30T10:02:46.678629  / # . /lava-10522701/environment/lava-10522=
701/bin/lava-test-runner /lava-10522701/1

    2023-05-30T10:02:46.678968  =


    2023-05-30T10:02:46.683169  / # /lava-10522701/bin/lava-test-runner /la=
va-10522701/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6475cd9de0cdab1b4a2e8660

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6475cd9de0cdab1b4a2e8665
        failing since 60 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-30T10:18:46.408671  + set +x

    2023-05-30T10:18:46.415369  <8>[   24.762389] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10523045_1.5.2.3.1>

    2023-05-30T10:18:46.528102  #

    2023-05-30T10:18:46.630815  / # #export SHELL=3D/bin/sh

    2023-05-30T10:18:46.631556  =


    2023-05-30T10:18:46.733007  / # export SHELL=3D/bin/sh. /lava-10523045/=
environment

    2023-05-30T10:18:46.733761  =


    2023-05-30T10:18:46.835164  / # . /lava-10523045/environment/lava-10523=
045/bin/lava-test-runner /lava-10523045/1

    2023-05-30T10:18:46.836381  =


    2023-05-30T10:18:46.841994  / # /lava-10523045/bin/lava-test-runner /la=
va-10523045/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6475c93d3456eb9e552e862b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6475c93d3456eb9e552e8630
        failing since 60 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-30T10:00:23.202313  + set +x

    2023-05-30T10:00:23.208542  <8>[   19.676458] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10522630_1.5.2.3.1>

    2023-05-30T10:00:23.313699  / # #

    2023-05-30T10:00:23.414264  export SHELL=3D/bin/sh

    2023-05-30T10:00:23.414495  #

    2023-05-30T10:00:23.515028  / # export SHELL=3D/bin/sh. /lava-10522630/=
environment

    2023-05-30T10:00:23.515254  =


    2023-05-30T10:00:23.615816  / # . /lava-10522630/environment/lava-10522=
630/bin/lava-test-runner /lava-10522630/1

    2023-05-30T10:00:23.616097  =


    2023-05-30T10:00:23.620821  / # /lava-10522630/bin/lava-test-runner /la=
va-10522630/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6475cac16f2bacd4f22e8609

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6475cac16f2bacd4f22e860e
        failing since 60 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-30T10:06:32.411383  <8>[   19.337192] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10522609_1.5.2.3.1>

    2023-05-30T10:06:32.520658  / # #

    2023-05-30T10:06:32.623160  export SHELL=3D/bin/sh

    2023-05-30T10:06:32.623993  #

    2023-05-30T10:06:32.725781  / # export SHELL=3D/bin/sh. /lava-10522609/=
environment

    2023-05-30T10:06:32.726573  =


    2023-05-30T10:06:32.828201  / # . /lava-10522609/environment/lava-10522=
609/bin/lava-test-runner /lava-10522609/1

    2023-05-30T10:06:32.829655  =


    2023-05-30T10:06:32.834811  / # /lava-10522609/bin/lava-test-runner /la=
va-10522609/1

    2023-05-30T10:06:32.941477  + export TESTRUN_ID=3D1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6475caf5d16da0f3642e85f3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6475caf5d16da0f3642e85f8
        failing since 60 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-30T10:07:34.123779  [   18.770172] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10522661_1.5.2.3.1>

    2023-05-30T10:07:34.228845  / # #

    2023-05-30T10:07:34.331420  export SHELL=3D/bin/sh

    2023-05-30T10:07:34.332258  #

    2023-05-30T10:07:34.433841  / # export SHELL=3D/bin/sh. /lava-10522661/=
environment

    2023-05-30T10:07:34.434625  =


    2023-05-30T10:07:34.536266  / # . /lava-10522661/environment/lava-10522=
661/bin/lava-test-runner /lava-10522661/1

    2023-05-30T10:07:34.537526  =


    2023-05-30T10:07:34.542922  / # /lava-10522661/bin/lava-test-runner /la=
va-10522661/1

    2023-05-30T10:07:34.643677  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/6475cd8ba28247db3c2e85f5

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6475cd8ba28247db3c2e85fa
        failing since 60 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-30T10:18:43.642058  + set +x

    2023-05-30T10:18:43.645417  [   24.760906] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10523058_1.5.2.3.1>

    2023-05-30T10:18:43.756183  / # #

    2023-05-30T10:18:43.858414  export SHELL=3D/bin/sh

    2023-05-30T10:18:43.859125  #

    2023-05-30T10:18:43.960446  / # export SHELL=3D/bin/sh. /lava-10523058/=
environment

    2023-05-30T10:18:43.960825  =


    2023-05-30T10:18:43.961001  / # [   25.020569] platform AMDI5682:00: de=
ferred probe pending

    2023-05-30T10:18:44.061977  . /lava-10523058/environment/lava-10523058/=
bin/lava-test-runner /lava-10523058/1

    2023-05-30T10:18:44.063172  =

 =

    ... (13 line(s) more)  =


  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/6475cd8ba28=
247db3c2e85fc
        failing since 74 days (last pass: renesas-devel-2023-03-07-v6.3-rc1=
, first fail: renesas-devel-2023-03-16-v6.3-rc2)
        3 lines

    2023-05-30T10:18:43.593118  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-05-30T10:18:43.599720  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-05-30T10:18:43.606763  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-05-30T10:18:43.638751  [   24.751199] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6475c954d78dd329402e8604

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6475c954d78dd329402e8609
        failing since 60 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-30T10:00:27.678133  <8>[   18.103411] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10522591_1.5.2.3.1>

    2023-05-30T10:00:27.681487  + set +x

    2023-05-30T10:00:27.791523  / # #

    2023-05-30T10:00:27.892194  export SHELL=3D/bin/sh

    2023-05-30T10:00:27.892437  #

    2023-05-30T10:00:27.993017  / # export SHELL=3D/bin/sh. /lava-10522591/=
environment

    2023-05-30T10:00:27.993261  =


    2023-05-30T10:00:28.093804  / # . /lava-10522591/environment/lava-10522=
591/bin/lava-test-runner /lava-10522591/1

    2023-05-30T10:00:28.094106  =


    2023-05-30T10:00:28.098730  / # /lava-10522591/bin/lava-test-runner /la=
va-10522591/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6475c99a3c458898232e8644

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6475c99a3c458898232e8649
        failing since 60 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-30T10:01:51.613971  <8>[   17.442983] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10522696_1.5.2.3.1>

    2023-05-30T10:01:51.617328  + set +x

    2023-05-30T10:01:51.727520  / # #

    2023-05-30T10:01:51.828145  export SHELL=3D/bin/sh

    2023-05-30T10:01:51.828401  #

    2023-05-30T10:01:51.928897  / # export SHELL=3D/bin/sh. /lava-10522696/=
environment

    2023-05-30T10:01:51.929201  =


    2023-05-30T10:01:52.029818  / # . /lava-10522696/environment/lava-10522=
696/bin/lava-test-runner /lava-10522696/1

    2023-05-30T10:01:52.030151  =


    2023-05-30T10:01:52.034765  / # /lava-10522696/bin/lava-test-runner /la=
va-10522696/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6475cd7c2033900d882e8660

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6475cd7c2033900d882e8665
        failing since 60 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-30T10:18:15.385565  + set +x

    2023-05-30T10:18:15.392010  [   18.829952] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10523042_1.5.2.3.1>

    2023-05-30T10:18:15.503354  / ##

    2023-05-30T10:18:15.605587  export SHELL=3D/bin/sh

    2023-05-30T10:18:15.606574   #

    2023-05-30T10:18:15.708394  / # export SHELL=3D/bin/sh. /lava-10523042/=
environment

    2023-05-30T10:18:15.709167  =


    2023-05-30T10:18:15.810787  / # . /lava-10523042/environment/lava-10523=
042/bin/lava-test-runner /lava-10523042/1

    2023-05-30T10:18:15.811944  =


    2023-05-30T10:18:15.817264  / # /lava-10523042/bin/lava-test-runner /la=
va-10523042/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beaglebone-black             | arm    | lab-broonie   | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6475cc1526bcaa68922e85fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-b=
eaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-b=
eaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6475cc1526bcaa689=
22e85fc
        new failure (last pass: renesas-devel-2023-05-22-v6.4-rc3) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beaglebone-black             | arm    | lab-broonie   | gcc-10   | multi_v7=
_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6475ce09b1ddadd7572e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baselin=
e-nfs-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baselin=
e-nfs-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6475ce09b1ddadd75=
72e85e8
        failing since 20 days (last pass: renesas-devel-2023-04-21-v6.3-rc7=
, first fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beaglebone-black             | arm    | lab-broonie   | gcc-10   | multi_v7=
_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/6475ce968faaa91d1d2e862e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm/multi_v7_defconfig+ima/gcc-10/lab-broonie/baseline-n=
fs-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm/multi_v7_defconfig+ima/gcc-10/lab-broonie/baseline-n=
fs-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6475ce968faaa91d1=
d2e862f
        new failure (last pass: renesas-devel-2023-05-22-v6.4-rc3) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6475cc776156738f2b2e862b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6475cc776156738f2b2e8630
        failing since 60 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-30T10:13:57.946894  + set[   38.001771] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10522613_1.5.2.3.1>

    2023-05-30T10:13:57.946994   +x

    2023-05-30T10:13:58.051406  / # #

    2023-05-30T10:13:58.152129  export SHELL=3D/bin/sh

    2023-05-30T10:13:58.152364  #

    2023-05-30T10:13:58.252944  / # export SHELL=3D/bin/sh. /lava-10522613/=
environment

    2023-05-30T10:13:58.253188  =


    2023-05-30T10:13:58.353769  / # . /lava-10522613/environment/lava-10522=
613/bin/lava-test-runner /lava-10522613/1

    2023-05-30T10:13:58.354101  =


    2023-05-30T10:13:58.358733  / # /lava-10522613/bin/lava-test-runner /la=
va-10522613/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6475ccdcf5f0e18a972e865d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6475ccdcf5f0e18a972e8662
        failing since 60 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-30T10:15:38.846192  + set +x

    2023-05-30T10:15:38.852637  <8>[   18.904303] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10522649_1.5.2.3.1>

    2023-05-30T10:15:38.957841  / # #

    2023-05-30T10:15:39.060011  export SHELL=3D/bin/sh

    2023-05-30T10:15:39.060770  #

    2023-05-30T10:15:39.162104  / # export SHELL=3D/bin/sh. /lava-10522649/=
environment

    2023-05-30T10:15:39.162414  =


    2023-05-30T10:15:39.263144  / # . /lava-10522649/environment/lava-10522=
649/bin/lava-test-runner /lava-10522649/1

    2023-05-30T10:15:39.263435  =


    2023-05-30T10:15:39.267664  / # /lava-10522649/bin/lava-test-runner /la=
va-10522649/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6475ce58eb7cc69c102e85fe

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6475ce58eb7cc69c102e8603
        failing since 60 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-30T10:22:03.625852  + set +x

    2023-05-30T10:22:03.632108  [   37.941966] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10523036_1.5.2.3.1>

    2023-05-30T10:22:03.740884  #

    2023-05-30T10:22:03.841620  / # #export SHELL=3D/bin/sh

    2023-05-30T10:22:03.841832  =


    2023-05-30T10:22:03.942355  / # export SHELL=3D/bin/sh. /lava-10523036/=
environment

    2023-05-30T10:22:03.942564  =


    2023-05-30T10:22:04.043096  / # . /lava-10523036/environment/lava-10523=
036/bin/lava-test-runner /lava-10523036/1

    2023-05-30T10:22:04.043402  =


    2023-05-30T10:22:04.047559  / # /lava-10523036/bin/lava-test-runner /la=
va-10523036/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6475ca847f9ace78de2e85fd

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6475ca847f9ace78de2e8602
        failing since 60 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-30T10:05:31.386002  + <8>[   17.232672] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10522579_1.5.2.3.1>

    2023-05-30T10:05:31.386089  set +x

    2023-05-30T10:05:31.489936  / # #

    2023-05-30T10:05:31.590549  export SHELL=3D/bin/sh

    2023-05-30T10:05:31.590745  #

    2023-05-30T10:05:31.691343  / # export SHELL=3D/bin/sh. /lava-10522579/=
environment

    2023-05-30T10:05:31.691549  =


    2023-05-30T10:05:31.792138  / # . /lava-10522579/environment/lava-10522=
579/bin/lava-test-runner /lava-10522579/1

    2023-05-30T10:05:31.793241  =


    2023-05-30T10:05:31.797894  / # /lava-10522579/bin/lava-test-runner /la=
va-10522579/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6475cd6ae3a5b443a02e8624

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6475cd6ae3a5b443a02e8629
        failing since 60 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-30T10:18:04.517985  + set +x

    2023-05-30T10:18:04.524782  <8>[   31.734253] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10523074_1.5.2.3.1>

    2023-05-30T10:18:04.637097  #

    2023-05-30T10:18:04.740142  / # #export SHELL=3D/bin/sh

    2023-05-30T10:18:04.741019  =


    2023-05-30T10:18:04.842396  / # export SHELL=3D/bin/sh. /lava-10523074/=
environment

    2023-05-30T10:18:04.842620  =


    2023-05-30T10:18:04.943258  / # . /lava-10523074/environment/lava-10523=
074/bin/lava-test-runner /lava-10523074/1

    2023-05-30T10:18:04.944690  =


    2023-05-30T10:18:04.949699  / # /lava-10523074/bin/lava-test-runner /la=
va-10523074/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6475c9435d9ff0ed252e8602

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6475c9435d9ff0ed252e8607
        failing since 60 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-30T10:00:28.084692  <8>[   22.488258] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10522656_1.5.2.3.1>

    2023-05-30T10:00:28.189707  / # #

    2023-05-30T10:00:28.290497  export SHELL=3D/bin/sh

    2023-05-30T10:00:28.290704  #

    2023-05-30T10:00:28.391233  / # export SHELL=3D/bin/sh. /lava-10522656/=
environment

    2023-05-30T10:00:28.391451  =


    2023-05-30T10:00:28.491970  / # . /lava-10522656/environment/lava-10522=
656/bin/lava-test-runner /lava-10522656/1

    2023-05-30T10:00:28.492342  =


    2023-05-30T10:00:28.497020  / # /lava-10522656/bin/lava-test-runner /la=
va-10522656/1

    2023-05-30T10:00:28.587320  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6475c9453456eb9e552e865d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6475c9453456eb9e552e8662
        failing since 60 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-30T10:00:23.473066  <8>[   18.286154] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10522587_1.5.2.3.1>

    2023-05-30T10:00:23.582785  / # #

    2023-05-30T10:00:23.685315  export SHELL=3D/bin/sh

    2023-05-30T10:00:23.685563  #

    2023-05-30T10:00:23.786254  / # export SHELL=3D/bin/sh. /lava-10522587/=
environment

    2023-05-30T10:00:23.787034  =


    2023-05-30T10:00:23.888687  / # . /lava-10522587/environment/lava-10522=
587/bin/lava-test-runner /lava-10522587/1

    2023-05-30T10:00:23.889905  =


    2023-05-30T10:00:23.894794  / # /lava-10522587/bin/lava-test-runner /la=
va-10522587/1

    2023-05-30T10:00:23.988084  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6475cd7e19b48275212e8621

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6475cd7e19b48275212e8626
        failing since 60 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-30T10:18:15.918778  + set[   23.396702] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10523049_1.5.2.3.1>

    2023-05-30T10:18:15.919269   +x

    2023-05-30T10:18:16.029520  / # #

    2023-05-30T10:18:16.131928  export SHELL=3D/bin/sh

    2023-05-30T10:18:16.132741  #

    2023-05-30T10:18:16.234226  / # export SHELL=3D/bin/sh. /lava-10523049/=
environment

    2023-05-30T10:18:16.235009  =


    2023-05-30T10:18:16.336520  / # . /lava-10523049/environment/lava-10523=
049/bin/lava-test-runner /lava-10523049/1

    2023-05-30T10:18:16.337682  =


    2023-05-30T10:18:16.343082  / # /lava-10523049/bin/lava-test-runner /la=
va-10523049/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6475caac8bc2e7344c2e8652

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kon=
tron/baseline-nfs-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kon=
tron/baseline-nfs-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6475caac8bc2e7344c2e8655
        new failure (last pass: renesas-devel-2023-05-22-v6.4-rc3)

    2023-05-30T10:06:12.490646  + set<8>[   17.158780] <LAVA_SIGNAL_ENDRUN =
0_dmesg 346656_1.6.2.4.1>
    2023-05-30T10:06:12.490947   +x
    2023-05-30T10:06:12.597761  / # #
    2023-05-30T10:06:12.700222  export SHELL=3D/bin/sh
    2023-05-30T10:06:12.701029  #
    2023-05-30T10:06:12.802939  / # export SHELL=3D/bin/sh. /lava-346656/en=
vironment
    2023-05-30T10:06:12.803766  =

    2023-05-30T10:06:12.905708  / # . /lava-346656/environment/lava-346656/=
bin/lava-test-runner /lava-346656/1
    2023-05-30T10:06:12.907037  =

    2023-05-30T10:06:12.923761  / # /lava-346656/bin/lava-test-runner /lava=
-346656/1 =

    ... (14 line(s) more)  =


  * baseline-nfs.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id=
/6475caac8bc2e7344c2e8665
        new failure (last pass: renesas-devel-2023-05-22-v6.4-rc3)

    2023-05-30T10:06:17.237952  /lava-346656/1/../bin/lava-test-case
    2023-05-30T10:06:17.292897  <8>[   22.165894] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6475c9d065981170212e8605

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6475c9d065981170212e860a
        failing since 60 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-30T10:02:33.441398  + [   17.800707] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 10522633_1.5.2.3.1>

    2023-05-30T10:02:33.441485  set +x

    2023-05-30T10:02:33.546119  / # #

    2023-05-30T10:02:33.646661  export SHELL=3D/bin/sh

    2023-05-30T10:02:33.646859  #

    2023-05-30T10:02:33.747387  / # export SHELL=3D/bin/sh. /lava-10522633/=
environment

    2023-05-30T10:02:33.747582  =


    2023-05-30T10:02:33.848144  / # . /lava-10522633/environment/lava-10522=
633/bin/lava-test-runner /lava-10522633/1

    2023-05-30T10:02:33.848474  =


    2023-05-30T10:02:33.853129  / # /lava-10522633/bin/lava-test-runner /la=
va-10522633/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6475c9e472d4dd922a2e8602

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6475c9e472d4dd922a2e8607
        failing since 60 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-30T10:02:53.761575  <8>[   14.919534] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10522705_1.5.2.3.1>

    2023-05-30T10:02:53.870382  / # #

    2023-05-30T10:02:53.972522  export SHELL=3D/bin/sh

    2023-05-30T10:02:53.973211  #

    2023-05-30T10:02:54.074566  / # export SHELL=3D/bin/sh. /lava-10522705/=
environment

    2023-05-30T10:02:54.075256  =


    2023-05-30T10:02:54.176719  / # . /lava-10522705/environment/lava-10522=
705/bin/lava-test-runner /lava-10522705/1

    2023-05-30T10:02:54.177947  =


    2023-05-30T10:02:54.182675  / # /lava-10522705/bin/lava-test-runner /la=
va-10522705/1

    2023-05-30T10:02:54.243664  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6475cd68e3a5b443a02e8619

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6475cd68e3a5b443a02e861e
        failing since 60 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-30T10:17:56.821456  + [   22.181559] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 10523050_1.5.2.3.1>

    2023-05-30T10:17:56.821539  set +x

    2023-05-30T10:17:56.927173  / # #

    2023-05-30T10:17:57.027778  export SHELL=3D/bin/sh

    2023-05-30T10:17:57.027965  #

    2023-05-30T10:17:57.128579  / # export SHELL=3D/bin/sh. /lava-10523050/=
environment

    2023-05-30T10:17:57.129371  =


    2023-05-30T10:17:57.231022  / # . /lava-10523050/environment/lava-10523=
050/bin/lava-test-runner /lava-10523050/1

    2023-05-30T10:17:57.232512  =


    2023-05-30T10:17:57.237572  / # /lava-10523050/bin/lava-test-runner /la=
va-10523050/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/6475cda7e0444c1b272e85fc

  Results:     28 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6475cda7e0444c1b272e8618
        new failure (last pass: renesas-devel-2023-05-22-v6.4-rc3)

    2023-05-30T10:18:59.047423  [   28.052607] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>

    2023-05-30T10:18:59.050727  + set +x

    2023-05-30T10:18:59.055961  [   28.063356] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10523010_1.6.2.3.1>

    2023-05-30T10:18:59.169778  #

    2023-05-30T10:18:59.170179  =


    2023-05-30T10:18:59.270945  / # #export SHELL=3D/bin/sh

    2023-05-30T10:18:59.271234  =


    2023-05-30T10:18:59.371870  / # export SHELL=3D/bin/sh. /lava-10523010/=
environment

    2023-05-30T10:18:59.372154  =


    2023-05-30T10:18:59.472802  / # . /lava-10523010/environment/lava-10523=
010/bin/lava-test-runner /lava-10523010/1
 =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6475ccb5af79eb32b72e85e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6475ccb5af79eb32b=
72e85e9
        failing since 20 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/6475cf989c0c609e512e866e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6475cf989c0c609e5=
12e866f
        failing since 20 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6475ccb53978a6bfb12e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6475ccb53978a6bfb=
12e85e7
        failing since 20 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/6475ce8f8faaa91d1d2e85f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6475ce8f8faaa91d1=
d2e85f7
        failing since 20 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/6475cbe59da2bc44ce2e85ee

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/6475cbe59da=
2bc44ce2e8645
        failing since 20 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1)
        2 lines

    2023-05-30T10:11:28.496017  kern  :alert<8>[   31.393098] <LAVA_SIGNAL_=
TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>

    2023-05-30T10:11:28.500016   :   FSC =3D 0x04: level 0 translation fault

    2023-05-30T10:11:28.502884  kern  :alert : Data abort info:

    2023-05-30T10:11:28.507673  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004

    2023-05-30T10:11:28.510274  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-05-30T10:11:28.518261  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D00000000099ba000

    2023-05-30T10:11:28.525111  kern  :alert : [0000000000000008] pgd=3D000=
0000000000000, p4d=3D0000000000000000

    2023-05-30T10:11:28.547142  kern  :emerg : Internal error: Oops: 000000=
0096000004 [#1] PREEMPT SMP

    2023-05-30T10:11:28.553818  kern  :emerg : Code: 97fde110 f9405680 5286=
4a61 72a686c1 (b9400800) =

   =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/6475cbe59da=
2bc44ce2e8646
        failing since 20 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1)
        12 lines

    2023-05-30T10:11:28.408268  <8>[   31.308799] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>

    2023-05-30T10:11:28.465092  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-30T10:11:28.468212  kern  :alert : Mem abort info:

    2023-05-30T10:11:28.472047  kern  :alert :   ESR =3D 0x0000000096000004

    2023-05-30T10:11:28.477392  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-30T10:11:28.481596  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-30T10:11:28.484814  kern  :alert :   EA =3D 0, S1PTW =3D 0
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 2          =


  Details:     https://kernelci.org/test/plan/id/6475ce46fa8ff8dc032e8679

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/6475ce46fa8=
ff8dc032e86d0
        failing since 20 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1)
        2 lines

    2023-05-30T10:21:30.599897  kern  :[   31.493486] <LAVA_SIGNAL_TESTCASE=
 TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>

    2023-05-30T10:21:30.603082  alert :   CM =3D 0, WnR =3D 0

    2023-05-30T10:21:30.609399  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000006cb5000

    2023-05-30T10:21:30.617300  kern  :alert : [0000000000000008] pgd=3D000=
0000000000000, p4d=3D0000000000000000

    2023-05-30T10:21:30.661853  kern  :emerg : Internal error: Oops: 000000=
0096000004 [#1] PREEMPT SMP

    2023-05-30T10:21:30.668222  kern  :emerg : Code: 97fb0910 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-30T10:21:30.688708  [   31.588323] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
   =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/6475ce46fa8=
ff8dc032e86d1
        failing since 20 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1)
        12 lines

    2023-05-30T10:21:30.500147  [   31.397947] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>

    2023-05-30T10:21:30.556621  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-30T10:21:30.560164  kern  :alert : Mem abort info:

    2023-05-30T10:21:30.564414  kern  :alert :   ESR =3D 0x0000000096000004

    2023-05-30T10:21:30.570070  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-30T10:21:30.573148  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-30T10:21:30.576581  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-30T10:21:30.582570  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault

    2023-05-30T10:21:30.585852  kern  :alert : Data abort info:

    2023-05-30T10:21:30.590088  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6475cb588403fdb2ea2e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-col=
labora/baseline-nfs-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-col=
labora/baseline-nfs-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6475cb588403fdb2e=
a2e85e7
        new failure (last pass: renesas-devel-2023-05-22-v6.4-rc3) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10   | defconfi=
g+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/6475cc0d270cb8d7142e863e

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-n=
fs-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-n=
fs-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/6475cc0d270=
cb8d7142e8645
        failing since 7 days (last pass: renesas-devel-2023-04-24-v6.3, fir=
st fail: renesas-devel-2023-05-22-v6.4-rc3)
        2 lines

    2023-05-30T10:12:16.300127  kern  :emerg : Internal error: Oops: 000000=
0096000004 [#1] PREEMPT SMP

    2023-05-30T10:12:16.300704  kern  :emerg : Code: 97fc1d10 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-30T10:12:16.350283  [   32.522550] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-30T10:12:16.350808  + set +x

    2023-05-30T10:12:16.351151  [   32.528352] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10522907_1.6.2.4.1>
   =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/6475cc0d270=
cb8d7142e8646
        failing since 7 days (last pass: renesas-devel-2023-04-24-v6.3, fir=
st fail: renesas-devel-2023-05-22-v6.4-rc3)
        12 lines

    2023-05-30T10:12:16.175879  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-30T10:12:16.176475  kern  :alert : Mem abort info:

    2023-05-30T10:12:16.176838  kern  :alert :   ESR =3D 0x0000000096000004

    2023-05-30T10:12:16.177158  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-30T10:12:16.177550  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-30T10:12:16.177868  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-30T10:12:16.178166  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault

    2023-05-30T10:12:16.178459  kern  :alert : Data abort info:

    2023-05-30T10:12:16.178744  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004

    2023-05-30T10:12:16.179028  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 2          =


  Details:     https://kernelci.org/test/plan/id/6475cd9ae0cdab1b4a2e864a

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig/gcc-10/lab-collabora/baseline-nfs-rk3399=
-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig/gcc-10/lab-collabora/baseline-nfs-rk3399=
-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/6475cd9ae0c=
dab1b4a2e8651
        failing since 7 days (last pass: renesas-devel-2023-04-17-v6.3-rc7,=
 first fail: renesas-devel-2023-05-22-v6.4-rc3)
        2 lines

    2023-05-30T10:18:49.667695  kern  :emerg : Internal error: Oops: 000000=
0096000004 [#1] PREEMPT SMP

    2023-05-30T10:18:49.667863  kern  :emerg : Code: 97faf910 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-30T10:18:49.711617  <8>[   34.518244] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-30T10:18:49.711711  + set +x

    2023-05-30T10:18:49.711784  <8>[   34.520853] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10523012_1.6.2.4.1>
   =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/6475cd9ae0c=
dab1b4a2e8652
        failing since 7 days (last pass: renesas-devel-2023-04-17-v6.3-rc7,=
 first fail: renesas-devel-2023-05-22-v6.4-rc3)
        12 lines

    2023-05-30T10:18:49.561054  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-30T10:18:49.561188  kern  :alert : Mem abort info:

    2023-05-30T10:18:49.561270  kern  :alert :   ESR =3D 0x0000000096000004

    2023-05-30T10:18:49.561354  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-30T10:18:49.561428  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-30T10:18:49.561499  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-30T10:18:49.561569  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault

    2023-05-30T10:18:49.561637  kern  :alert : Data abort info:

    2023-05-30T10:18:49.561705  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004

    2023-05-30T10:18:49.561772  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10   | defconfi=
g+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/6475cff5d2f66cf2fb2e85f2

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-nfs=
-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-nfs=
-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/6475cff5d2f=
66cf2fb2e85f9
        new failure (last pass: renesas-devel-2023-04-17-v6.3-rc7)
        2 lines

    2023-05-30T10:29:03.437408  kern  :emerg : Internal error: Oops: 000000=
0096000004 [#1] PREEMPT SMP

    2023-05-30T10:29:03.437916  kern  :emerg : Code: 97fbc910 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-30T10:29:03.490141  <8>[   37.565155] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-30T10:29:03.491005  + set +x

    2023-05-30T10:29:03.491739  <8>[   37.567245] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10523120_1.6.2.4.1>
   =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/6475cff5d2f=
66cf2fb2e85fa
        new failure (last pass: renesas-devel-2023-04-17-v6.3-rc7)
        12 lines

    2023-05-30T10:29:03.317616  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-30T10:29:03.318117  kern  :alert : Mem abort info:

    2023-05-30T10:29:03.318430  kern  :alert :   ESR =3D 0x0000000096000004

    2023-05-30T10:29:03.318718  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-30T10:29:03.318996  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-30T10:29:03.319266  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-30T10:29:03.319534  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault

    2023-05-30T10:29:03.319797  kern  :alert : Data abort info:

    2023-05-30T10:29:03.320058  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004

    2023-05-30T10:29:03.320313  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6475cbd8e0814c90a52e866b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6475cbd8e0814c90a52e8670
        failing since 7 days (last pass: renesas-devel-2023-05-09-v6.4-rc1,=
 first fail: renesas-devel-2023-05-22-v6.4-rc3)

    2023-05-30T10:11:18.666935  + <8>[   32.195528] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10522883_1.6.2.3.1>

    2023-05-30T10:11:18.669791  set +x

    2023-05-30T10:11:18.774718  / # #

    2023-05-30T10:11:18.875330  export SHELL=3D/bin/sh

    2023-05-30T10:11:18.875513  #

    2023-05-30T10:11:18.976004  / # export SHELL=3D/bin/sh. /lava-10522883/=
environment

    2023-05-30T10:11:18.976183  =


    2023-05-30T10:11:19.076658  / # . /lava-10522883/environment/lava-10522=
883/bin/lava-test-runner /lava-10522883/1

    2023-05-30T10:11:19.076962  =


    2023-05-30T10:11:19.082925  / # /lava-10522883/bin/lava-test-runner /la=
va-10522883/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/6475cda5e0444c1b272e85ee

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6475cda5e0444c1b272e85f3
        failing since 7 days (last pass: renesas-devel-2023-05-09-v6.4-rc1,=
 first fail: renesas-devel-2023-05-22-v6.4-rc3)

    2023-05-30T10:19:06.379732  + set +x

    2023-05-30T10:19:06.382532  [   31.117571] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10523005_1.6.2.3.1>

    2023-05-30T10:19:06.491260  / # #

    2023-05-30T10:19:06.592090  export SHELL=3D/bin/sh

    2023-05-30T10:19:06.592344  #

    2023-05-30T10:19:06.692980  / # export SHELL=3D/bin/sh. /lava-10523005/=
environment

    2023-05-30T10:19:06.693246  =


    2023-05-30T10:19:06.793891  / # . /lava-10523005/environment/lava-10523=
005/bin/lava-test-runner /lava-10523005/1

    2023-05-30T10:19:06.794310  =


    2023-05-30T10:19:06.800585  / # /lava-10523005/bin/lava-test-runner /la=
va-10523005/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6475d347a0ffc319362e85f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bro=
onie/baseline-nfs-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bro=
onie/baseline-nfs-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6475d347a0ffc3193=
62e85f8
        new failure (last pass: renesas-devel-2023-05-22-v6.4-rc3) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6475d705429cf726ce2e85e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-nfs=
-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-nfs=
-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6475d705429cf726c=
e2e85e9
        new failure (last pass: renesas-devel-2023-05-22-v6.4-rc3) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6475cdf438e2147d3b2e85f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-nfs=
-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-nfs=
-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6475cdf438e2147d3=
b2e85f2
        failing since 7 days (last pass: renesas-devel-2023-04-21-v6.3-rc7,=
 first fail: renesas-devel-2023-05-22-v6.4-rc3) =

 =20
