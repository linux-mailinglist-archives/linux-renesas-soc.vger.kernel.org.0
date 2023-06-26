Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A93173E18D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jun 2023 16:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbjFZOGj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Jun 2023 10:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbjFZOGi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Jun 2023 10:06:38 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 788F0BB
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jun 2023 07:06:33 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5577004e21bso993840a12.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jun 2023 07:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1687788392; x=1690380392;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bbxOLChSGH9d1+1RaMO7l276v86OZMKOh4MXpjrmzLg=;
        b=iYZsyDH+nAjp8wxWJpXpdyyF3d/p5kijm+mub7Sq0HRkuhoBdshHuKAVGooxi59qA1
         WoiUQcUL+fAvf2/RlmU8zD7jj82EU222yEVeMEbIenItp5FQeikZP860NbyQcb5IzOto
         IjDMj9fy1GEd+e215hgf0icuiIHf7fnqKLhyqnIhqOGFjirCihsoTnZmAnfwhF0KvpE+
         gPcvdqO3L2O/431MnbLDagG7ftdbh6VE9WqLc6yYmFqDotc5qaw0qlhBAokMqArUfENi
         kTxJZ3Ya3oD3Sjj8pohWx9hz62PBwHgcbmV+nohBgMUeo3uu6pnPMtnUJyfyLO8jQ3l3
         9lmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687788392; x=1690380392;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bbxOLChSGH9d1+1RaMO7l276v86OZMKOh4MXpjrmzLg=;
        b=a7oHGFaDhcKfYLOEykl2T6Cy5czvlQy1a0MEMdTbE0l4/tO5/YxUA2qcSwzonhf0og
         WezWwO74yTW4cPScs0PxSW+GAnQsxH+4E27DgF3T6DVHfMGcPV1Ri0v4Ycokgg05NJoN
         p8CM0v+XRk0nUHt4WotlorwGMmsOqn0BAyjSrKeB+Y/ha/nNeedRXZdGDt7ICPs6R4uE
         IQxJqmfqdv97MkoeAx/H+5/dIeZyadbiOc4AEAdcCaUPeJ1HuCXyd2CTVEYIf7NmZ6Wn
         8PbZ7bpzesc//dRlUPWrqfC0ZnqqhCJL4EhsT5vh9elnORrPucYIgfKdbiI8izd9zNiG
         LU5A==
X-Gm-Message-State: AC+VfDyYWw4C7voXQZ9ptZZn9T+KhUzYxPx5QeV3hGcfMusgMcj4fxKO
        rk1b2tAqTVWGcnQhC+KI0cJb4VzjOEahXnxZ0BGCmg==
X-Google-Smtp-Source: ACHHUZ7qacPQ1S1jn8iufn0qIFOtk3wOq/vC0jWU/BGLmhBlq3bqcEAXS8Qmfme65t0VzXdIxMPBNQ==
X-Received: by 2002:a17:90b:1957:b0:259:30e7:7348 with SMTP id nk23-20020a17090b195700b0025930e77348mr23044356pjb.9.1687788390829;
        Mon, 26 Jun 2023 07:06:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 6-20020a17090a018600b0025bd4db25f0sm4794841pjc.53.2023.06.26.07.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 07:06:30 -0700 (PDT)
Message-ID: <64999b66.170a0220.ae4ec.8073@mx.google.com>
Date:   Mon, 26 Jun 2023 07:06:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2023-06-26-v6.4
Subject: renesas/master baseline-nfs: 151 runs,
 30 regressions (renesas-devel-2023-06-26-v6.4)
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

renesas/master baseline-nfs: 151 runs, 30 regressions (renesas-devel-2023-0=
6-26-v6.4)

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

beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

beaglebone-black             | arm    | lab-cip         | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm    | lab-cip         | gcc-10   | multi_=
v7_defconfig           | 1          =

beaglebone-black             | arm    | lab-cip         | gcc-10   | omap2p=
lus_defconfig          | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-06-26-v6.4/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-06-26-v6.4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      10028679766543b0f6c7b33a01d9b19cf7d35851 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6499616aa857394aed306194

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230609.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6499616aa857394aed30619d
        failing since 87 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-26T09:58:46.445159  + set +x

    2023-06-26T09:58:46.451606  [   20.255851] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10910721_1.5.2.3.1>

    2023-06-26T09:58:46.560870  / # #

    2023-06-26T09:58:46.663546  export SHELL=3D/bin/sh

    2023-06-26T09:58:46.664378  #

    2023-06-26T09:58:46.766004  / # export SHELL=3D/bin/sh. /lava-10910721/=
environment

    2023-06-26T09:58:46.766795  =


    2023-06-26T09:58:46.868320  / # . /lava-10910721/environment/lava-10910=
721/bin/lava-test-runner /lava-10910721/1

    2023-06-26T09:58:46.869608  =


    2023-06-26T09:58:46.875142  / # /lava-10910721/bin/lava-test-runner /la=
va-10910721/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64996329829cd241ba306140

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230609.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64996329829cd241ba306149
        failing since 87 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-26T10:06:14.468673  + set +x

    2023-06-26T10:06:14.475427  [   19.395780] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10910820_1.5.2.3.1>

    2023-06-26T10:06:14.584972  / # #

    2023-06-26T10:06:14.687517  export SHELL=3D/bin/sh

    2023-06-26T10:06:14.688334  #

    2023-06-26T10:06:14.688868  / # export SHELL=3D/bin/sh[   19.589628] i2=
c i2c-10EC5682:00: deferred probe pending

    2023-06-26T10:06:14.790456  . /lava-10910820/environment

    2023-06-26T10:06:14.791289  =


    2023-06-26T10:06:14.893177  / # . /lava-10910820/environment/lava-10910=
820/bin/lava-test-runner /lava-10910820/1

    2023-06-26T10:06:14.894531  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/649961c523f588d707306132

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-nfs-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-nfs-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230609.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/649961c523f588d70730613b
        failing since 87 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-26T10:00:20.353235  + set +x

    2023-06-26T10:00:20.360095  <8>[   21.901667] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10910737_1.5.2.3.1>

    2023-06-26T10:00:20.469443  / # #

    2023-06-26T10:00:20.572282  export SHELL=3D/bin/sh

    2023-06-26T10:00:20.573155  #

    2023-06-26T10:00:20.674814  / # export SHELL=3D/bin/sh. /lava-10910737/=
environment

    2023-06-26T10:00:20.675640  =


    2023-06-26T10:00:20.777470  / # . /lava-10910737/environment/lava-10910=
737/bin/lava-test-runner /lava-10910737/1

    2023-06-26T10:00:20.777901  =


    2023-06-26T10:00:20.782892  / # /lava-10910737/bin/lava-test-runner /la=
va-10910737/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6499612cfe7acd67c930613a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230609.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6499612cfe7acd67c9306143
        failing since 87 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-26T09:57:57.121651  [   18.428199] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10910747_1.5.2.3.1>

    2023-06-26T09:57:57.227284  / # #

    2023-06-26T09:57:57.328563  export SHELL=3D/bin/sh

    2023-06-26T09:57:57.329335  #

    2023-06-26T09:57:57.430768  / # export SHELL=3D/bin/sh. /lava-10910747/=
environment

    2023-06-26T09:57:57.431009  =


    2023-06-26T09:57:57.531914  / # . /lava-10910747/environment/lava-10910=
747/bin/lava-test-runner /lava-10910747/1

    2023-06-26T09:57:57.533245  =


    2023-06-26T09:57:57.538430  / # /lava-10910747/bin/lava-test-runner /la=
va-10910747/1

    2023-06-26T09:57:57.641174  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/649963021d5e5538b7306193

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230609.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/649963021d5e5538b730619c
        failing since 87 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-26T10:05:50.751762  + set[   18.071028] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10910844_1.5.2.3.1>

    2023-06-26T10:05:50.752283   +x

    2023-06-26T10:05:50.860290  / # #

    2023-06-26T10:05:50.963029  export SHELL=3D/bin/sh

    2023-06-26T10:05:50.963816  #

    2023-06-26T10:05:51.065337  / # export SHELL=3D/bin/sh. /lava-10910844/=
environment

    2023-06-26T10:05:51.065986  =


    2023-06-26T10:05:51.167400  / # . /lava-10910844/environment/lava-10910=
844/bin/lava-test-runner /lava-10910844/1

    2023-06-26T10:05:51.168639  =


    2023-06-26T10:05:51.173905  / # /lava-10910844/bin/lava-test-runner /la=
va-10910844/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6499612cfe7acd67c930612f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230609.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6499612cfe7acd67c9306138
        failing since 87 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-26T09:57:42.279744  + set +x

    2023-06-26T09:57:42.286419  <8>[   17.662777] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10910709_1.5.2.3.1>

    2023-06-26T09:57:42.391294  / # #

    2023-06-26T09:57:42.491874  export SHELL=3D/bin/sh

    2023-06-26T09:57:42.492048  #

    2023-06-26T09:57:42.592553  / # export SHELL=3D/bin/sh. /lava-10910709/=
environment

    2023-06-26T09:57:42.592752  =


    2023-06-26T09:57:42.693231  / # . /lava-10910709/environment/lava-10910=
709/bin/lava-test-runner /lava-10910709/1

    2023-06-26T09:57:42.693488  =


    2023-06-26T09:57:42.698615  / # /lava-10910709/bin/lava-test-runner /la=
va-10910709/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/649963014f5944bad8306193

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230609.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/649963014f5944bad830619c
        failing since 87 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-26T10:05:29.044060  [   17.325601] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10910824_1.5.2.3.1>

    2023-06-26T10:05:29.046999  + set +x

    2023-06-26T10:05:29.158242  / # #

    2023-06-26T10:05:29.260694  export SHELL=3D/bin/sh

    2023-06-26T10:05:29.261382  #

    2023-06-26T10:05:29.362891  / # export SHELL=3D/bin/sh. /lava-10910824/=
environment

    2023-06-26T10:05:29.363587  =


    2023-06-26T10:05:29.464842  / # . /lava-10910824/environment/lava-10910=
824/bin/lava-test-runner /lava-10910824/1

    2023-06-26T10:05:29.465146  =


    2023-06-26T10:05:29.470286  / # /lava-10910824/bin/lava-test-runner /la=
va-10910824/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6499667a19da8bb764306187

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baseline-nf=
s-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baseline-nf=
s-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230609.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6499667a19da8bb76=
4306188
        failing since 47 days (last pass: renesas-devel-2023-04-21-v6.3-rc7=
, first fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/6499668e3e6d46c83f30613d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+ima/gcc-10/lab-broonie/baseline-nfs-b=
eaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+ima/gcc-10/lab-broonie/baseline-nfs-b=
eaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230609.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6499668e3e6d46c83=
f30613e
        failing since 26 days (last pass: renesas-devel-2023-05-22-v6.4-rc3=
, first fail: renesas-devel-2023-05-30-v6.4-rc4) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-cip         | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6499787e3e1a3b089f306144

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-c=
ip/baseline-nfs-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-c=
ip/baseline-nfs-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230609.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6499787e3e1a3b089=
f306145
        new failure (last pass: renesas-devel-2023-06-12-v6.4-rc6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-cip         | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6499921f97dbade53e306262

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-nfs-beaglebon=
e-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-nfs-beaglebon=
e-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230609.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6499921f97dbade53=
e306263
        new failure (last pass: renesas-devel-2023-06-12-v6.4-rc6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-cip         | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/649972f231e30c26c7306134

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/omap2plus_defconfig/gcc-10/lab-cip/baseline-nfs-beaglebo=
ne-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/omap2plus_defconfig/gcc-10/lab-cip/baseline-nfs-beaglebo=
ne-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230609.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/649972f231e30c26c=
7306135
        failing since 13 days (last pass: renesas-devel-2023-06-05-v6.4-rc5=
, first fail: renesas-devel-2023-06-12-v6.4-rc6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/649961e023f588d707306146

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230609.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/649961e023f588d70730614f
        failing since 87 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-26T10:00:45.848782  + <8>[   18.978817] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10910722_1.5.2.3.1>

    2023-06-26T10:00:45.849136  set +x

    2023-06-26T10:00:45.956804  / # #

    2023-06-26T10:00:46.057649  export SHELL=3D/bin/sh

    2023-06-26T10:00:46.057956  #

    2023-06-26T10:00:46.158720  / # export SHELL=3D/bin/sh. /lava-10910722/=
environment

    2023-06-26T10:00:46.159008  =


    2023-06-26T10:00:46.259719  / # . /lava-10910722/environment/lava-10910=
722/bin/lava-test-runner /lava-10910722/1

    2023-06-26T10:00:46.260051  =


    2023-06-26T10:00:46.264410  / # /lava-10910722/bin/lava-test-runner /la=
va-10910722/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6499637d36d081ffee3061fb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230609.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6499637d36d081ffee306204
        failing since 87 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-26T10:07:42.339190  + set +x

    2023-06-26T10:07:42.345891  [   18.974342] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10910847_1.5.2.3.1>

    2023-06-26T10:07:42.450909  / # #

    2023-06-26T10:07:42.551680  export SHELL=3D/bin/sh

    2023-06-26T10:07:42.551919  #

    2023-06-26T10:07:42.652501  / # export SHELL=3D/bin/sh. /lava-10910847/=
environment

    2023-06-26T10:07:42.652739  =


    2023-06-26T10:07:42.753338  / # . /lava-10910847/environment/lava-10910=
847/bin/lava-test-runner /lava-10910847/1

    2023-06-26T10:07:42.753665  =


    2023-06-26T10:07:42.758495  / # /lava-10910847/bin/lava-test-runner /la=
va-10910847/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6499613603553cd737306131

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230609.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6499613603553cd73730613a
        failing since 87 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-26T09:58:03.403354  + <8>[   17.815349] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10910759_1.5.2.3.1>

    2023-06-26T09:58:03.403441  set +x

    2023-06-26T09:58:03.507444  / # #

    2023-06-26T09:58:03.608023  export SHELL=3D/bin/sh

    2023-06-26T09:58:03.608225  #

    2023-06-26T09:58:03.708813  / # export SHELL=3D/bin/sh. /lava-10910759/=
environment

    2023-06-26T09:58:03.708982  =


    2023-06-26T09:58:03.809471  / # . /lava-10910759/environment/lava-10910=
759/bin/lava-test-runner /lava-10910759/1

    2023-06-26T09:58:03.809780  =


    2023-06-26T09:58:03.814739  / # /lava-10910759/bin/lava-test-runner /la=
va-10910759/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6499630122281533a2306175

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230609.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6499630122281533a230617e
        failing since 87 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-26T10:05:43.180301  + <8>[   18.528877] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10910863_1.5.2.3.1>

    2023-06-26T10:05:43.180817  set +x

    2023-06-26T10:05:43.288613  / # #

    2023-06-26T10:05:43.390847  export SHELL=3D/bin/sh

    2023-06-26T10:05:43.391569  #

    2023-06-26T10:05:43.493012  / # export SHELL=3D/bin/sh. /lava-10910863/=
environment

    2023-06-26T10:05:43.493734  =


    2023-06-26T10:05:43.595163  / # . /lava-10910863/environment/lava-10910=
863/bin/lava-test-runner /lava-10910863/1

    2023-06-26T10:05:43.596425  =


    2023-06-26T10:05:43.601512  / # /lava-10910863/bin/lava-test-runner /la=
va-10910863/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/649963c8555cf352773061fa

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix=
/baseline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix=
/baseline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230609.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/649963c8555cf35277306203
        failing since 111 days (last pass: renesas-devel-2023-02-21-v6.2, f=
irst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-06-26T10:08:50.858153  + set +x
    2023-06-26T10:08:50.858367  [   27.987240] <LAVA_SIGNAL_ENDRUN 0_dmesg =
988146_1.6.2.3.1>
    2023-06-26T10:08:50.968152  #
    2023-06-26T10:08:51.070091  / # #export SHELL=3D/bin/sh
    2023-06-26T10:08:51.070671  =

    2023-06-26T10:08:51.172195  / # export SHELL=3D/bin/sh. /lava-988146/en=
vironment
    2023-06-26T10:08:51.172677  =

    2023-06-26T10:08:51.273983  / # . /lava-988146/environment/lava-988146/=
bin/lava-test-runner /lava-988146/1
    2023-06-26T10:08:51.274619  =

    2023-06-26T10:08:51.277642  / # /lava-988146/bin/lava-test-runner /lava=
-988146/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64996c9cb142974e5530612e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-p=
engutronix/baseline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-p=
engutronix/baseline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230609.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64996c9cb142974e55306137
        failing since 111 days (last pass: renesas-devel-2023-02-21-v6.2, f=
irst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-06-26T10:46:42.265464  + set +x
    2023-06-26T10:46:42.265648  [   28.309525] <LAVA_SIGNAL_ENDRUN 0_dmesg =
988178_1.6.2.3.1>
    2023-06-26T10:46:42.375604  #
    2023-06-26T10:46:42.477498  / # #export SHELL=3D/bin/sh
    2023-06-26T10:46:42.477989  =

    2023-06-26T10:46:42.579218  / # export SHELL=3D/bin/sh. /lava-988178/en=
vironment
    2023-06-26T10:46:42.579694  =

    2023-06-26T10:46:42.680985  / # . /lava-988178/environment/lava-988178/=
bin/lava-test-runner /lava-988178/1
    2023-06-26T10:46:42.681612  =

    2023-06-26T10:46:42.684803  / # /lava-988178/bin/lava-test-runner /lava=
-988178/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/64996dc86508ab5e7530618b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baselin=
e-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baselin=
e-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230609.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64996dc86508ab5e75306194
        failing since 111 days (last pass: renesas-devel-2023-02-21-v6.2, f=
irst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-06-26T10:51:40.455404  + set +x
    2023-06-26T10:51:40.455672  [   34.554066] <LAVA_SIGNAL_ENDRUN 0_dmesg =
988187_1.6.2.3.1>
    2023-06-26T10:51:40.566178  #
    2023-06-26T10:51:40.668143  / # #export SHELL=3D/bin/sh
    2023-06-26T10:51:40.668582  =

    2023-06-26T10:51:40.769792  / # export SHELL=3D/bin/sh. /lava-988187/en=
vironment
    2023-06-26T10:51:40.770277  =

    2023-06-26T10:51:40.871567  / # . /lava-988187/environment/lava-988187/=
bin/lava-test-runner /lava-988187/1
    2023-06-26T10:51:40.872472  =

    2023-06-26T10:51:40.875390  / # /lava-988187/bin/lava-test-runner /lava=
-988187/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/64996eb8a6b8d7722f30613f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-n=
fs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-n=
fs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230609.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64996eb8a6b8d7722f306148
        failing since 111 days (last pass: renesas-devel-2023-02-21-v6.2, f=
irst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-06-26T10:55:29.659257  + set +x
    2023-06-26T10:55:29.659476  [   29.408489] <LAVA_SIGNAL_ENDRUN 0_dmesg =
988198_1.6.2.3.1>
    2023-06-26T10:55:29.776012  #
    2023-06-26T10:55:29.878167  / # #export SHELL=3D/bin/sh
    2023-06-26T10:55:29.878657  =

    2023-06-26T10:55:29.979991  / # export SHELL=3D/bin/sh. /lava-988198/en=
vironment
    2023-06-26T10:55:29.980479  =

    2023-06-26T10:55:30.081914  / # . /lava-988198/environment/lava-988198/=
bin/lava-test-runner /lava-988198/1
    2023-06-26T10:55:30.082562  =

    2023-06-26T10:55:30.085990  / # /lava-988198/bin/lava-test-runner /lava=
-988198/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/649971b0e33263c478306131

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-nfs-i=
mx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-nfs-i=
mx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230609.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/649971b0e33263c47830613a
        failing since 111 days (last pass: renesas-devel-2023-02-21-v6.2, f=
irst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-06-26T11:08:20.733665  + set +x
    2023-06-26T11:08:20.733873  [   29.506224] <LAVA_SIGNAL_ENDRUN 0_dmesg =
988221_1.6.2.3.1>
    2023-06-26T11:08:20.847882  #
    2023-06-26T11:08:20.949748  / # #export SHELL=3D/bin/sh
    2023-06-26T11:08:20.950339  =

    2023-06-26T11:08:21.051756  / # export SHELL=3D/bin/sh. /lava-988221/en=
vironment
    2023-06-26T11:08:21.052193  =

    2023-06-26T11:08:21.153458  / # . /lava-988221/environment/lava-988221/=
bin/lava-test-runner /lava-988221/1
    2023-06-26T11:08:21.154078  =

    2023-06-26T11:08:21.157322  / # /lava-988221/bin/lava-test-runner /lava=
-988221/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/64996e040fdf1f142d30612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baselin=
e-nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baselin=
e-nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230609.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/64996e040fdf1f142=
d30612f
        new failure (last pass: renesas-devel-2023-06-12-v6.4-rc6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6499611a0b119c3aeb306160

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230609.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6499611a0b119c3aeb306169
        failing since 87 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-26T09:57:27.925649  [   17.532886] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10910704_1.5.2.3.1>

    2023-06-26T09:57:28.029647  / # #

    2023-06-26T09:57:28.130280  export SHELL=3D/bin/sh

    2023-06-26T09:57:28.130502  #

    2023-06-26T09:57:28.231083  / # export SHELL=3D/bin/sh. /lava-10910704/=
environment

    2023-06-26T09:57:28.231284  =


    2023-06-26T09:57:28.331837  / # . /lava-10910704/environment/lava-10910=
704/bin/lava-test-runner /lava-10910704/1

    2023-06-26T09:57:28.332159  =


    2023-06-26T09:57:28.337002  / # /lava-10910704/bin/lava-test-runner /la=
va-10910704/1

    2023-06-26T09:57:28.384747  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/649962e5fb978ee5ea306151

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230609.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/649962e5fb978ee5ea30615a
        failing since 87 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-26T10:05:18.908942  [   17.745945] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10910849_1.5.2.3.1>

    2023-06-26T10:05:19.012739  / # #

    2023-06-26T10:05:19.113422  export SHELL=3D/bin/sh

    2023-06-26T10:05:19.113632  #

    2023-06-26T10:05:19.214156  / # export SHELL=3D/bin/sh. /lava-10910849/=
environment

    2023-06-26T10:05:19.214368  =


    2023-06-26T10:05:19.314919  / # . /lava-10910849/environment/lava-10910=
849/bin/lava-test-runner /lava-10910849/1

    2023-06-26T10:05:19.315223  =


    2023-06-26T10:05:19.319923  / # /lava-10910849/bin/lava-test-runner /la=
va-10910849/1

    2023-06-26T10:05:19.363714  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/64996840e2172cecad30612f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabo=
ra/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabo=
ra/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230609.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/64996840e2172ceca=
d306130
        failing since 47 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/64996854e2172cecad30613b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabo=
ra/baseline-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabo=
ra/baseline-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230609.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/64996854e2172ceca=
d30613c
        failing since 47 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/64997dffb9e20d572030613f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-cip/bas=
eline-nfs-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-cip/bas=
eline-nfs-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230609.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64997dffb9e20d5720306146
        new failure (last pass: renesas-devel-2023-06-12-v6.4-rc6)

    2023-06-26T12:00:46.228041  + set +x
    2023-06-26T12:00:46.228169  <8>[   49.131527] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 974408_1.6.2.4.1>
    2023-06-26T12:00:46.509697  / # #
    2023-06-26T12:00:47.968808  export SHELL=3D/bin/sh
    2023-06-26T12:00:47.989218  #
    2023-06-26T12:00:47.989374  / # export SHELL=3D/bin/sh
    2023-06-26T12:00:49.870893  / # . /lava-974408/environment
    2023-06-26T12:00:53.321378  /lava-974408/bin/lava-test-runner /lava-974=
408/1
    2023-06-26T12:00:53.342068  . /lava-974408/environment
    2023-06-26T12:00:53.342185  / # /lava-974408/bin/lava-test-runner /lava=
-974408/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/6499677485432afe97306156

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabo=
ra/baseline-nfs-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabo=
ra/baseline-nfs-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230609.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6499677485432afe9730615f
        new failure (last pass: renesas-devel-2023-04-24-v6.3)

    2023-06-26T10:25:01.237275  + set +x

    2023-06-26T10:25:01.243814  <8>[   30.901202] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10911093_1.6.2.3.1>

    2023-06-26T10:25:01.350910  / # #

    2023-06-26T10:25:01.453051  export SHELL=3D/bin/sh

    2023-06-26T10:25:01.453847  #

    2023-06-26T10:25:01.555575  / # export SHELL=3D/bin/sh. /lava-10911093/=
environment

    2023-06-26T10:25:01.556247  =


    2023-06-26T10:25:01.657637  / # . /lava-10911093/environment/lava-10911=
093/bin/lava-test-runner /lava-10911093/1

    2023-06-26T10:25:01.658832  =


    2023-06-26T10:25:01.665778  / # /lava-10911093/bin/lava-test-runner /la=
va-10911093/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/649967757570de3df8306141

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabo=
ra/baseline-nfs-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabo=
ra/baseline-nfs-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230609.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/649967767570de3df830614a
        failing since 34 days (last pass: renesas-devel-2023-05-09-v6.4-rc1=
, first fail: renesas-devel-2023-05-22-v6.4-rc3)

    2023-06-26T10:24:42.555047  + set +x

    2023-06-26T10:24:42.561505  <8>[   33.213066] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10911095_1.6.2.3.1>

    2023-06-26T10:24:42.673551  / # #

    2023-06-26T10:24:42.776197  export SHELL=3D/bin/sh

    2023-06-26T10:24:42.777001  #

    2023-06-26T10:24:42.878696  / # export SHELL=3D/bin/sh. /lava-10911095/=
environment

    2023-06-26T10:24:42.879506  =


    2023-06-26T10:24:42.981385  / # . /lava-10911095/environment/lava-10911=
095/bin/lava-test-runner /lava-10911095/1

    2023-06-26T10:24:42.982619  =


    2023-06-26T10:24:42.990036  / # /lava-10911095/bin/lava-test-runner /la=
va-10911095/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/649966295cb5ab713e306152

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-nfs-sun50=
i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-nfs-sun50=
i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230609.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/649966295cb5ab713=
e306153
        failing since 20 days (last pass: renesas-devel-2023-04-17-v6.3-rc7=
, first fail: renesas-devel-2023-06-06-v6.4-rc5) =

 =20
