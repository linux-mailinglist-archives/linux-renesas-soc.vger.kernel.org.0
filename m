Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75FA06E4C2F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Apr 2023 16:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231146AbjDQO7H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Apr 2023 10:59:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231168AbjDQO7B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Apr 2023 10:59:01 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABEF14222
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Apr 2023 07:58:30 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id v21-20020a17090a459500b0024776162815so5056367pjg.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Apr 2023 07:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1681743508; x=1684335508;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H1yALZjsOwONdJwS09E7AKF6uMVF7WxOuRiDw7jv5UU=;
        b=x3vJE8zMsJvf4JmTEN6jjGpPrlSatpDM8VpblIQpJnPX2/pJDHaghPDzIizOia5q8C
         LWsm+d8Gzn1/EeS9SlOJETVzYh7V0NHgX2Wmu8mOy6H9z1fxsFKWGMNyMxJzDmojdDBM
         fRP0+KgdK3VNVrnAnKDgVIE2eJYt++ASAygkAK5eNxbFrIlmbitTa0b7MAbqR2JjzKYW
         HxVPWi0FvFy8KiKeaCTC5RdipLlYhuJQPMc6gHl8NaPHBzk0GK550IndNTTCIfDsUxbq
         dOw6+wpTlBiUjr6YwoyXmvZbqIjePmEbMRSXxDaoMwjq5GYlXtQaEKZ2UJdblzp6HF1e
         x/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681743508; x=1684335508;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H1yALZjsOwONdJwS09E7AKF6uMVF7WxOuRiDw7jv5UU=;
        b=G8m02BnZZlT1iVfrbXKLkzCRI0wlTV5oi8ryPZL/Ej5ivpOIxrsZfr/xh11FjV5dwT
         6YboZNCSxrwTcZYq/5RF2V0RDY9eX+3G2+H8Mf07DFHWj3OeqeaJLwBAIfsJlXlNqGZH
         vHJm1OTMXsb1674lBq7GcjnRL/zVE10SnwaUuvogQlC+srNW4usGWuHMopLdQfy9UUky
         wNoMrmU94LJtNKhc1hc0iZ4JjpmPoo6QGL2PV6Ph+j0ArdzE0T1xLgLbCINef9UZ4lnh
         czAu2D4602saoFSYnimz2J4/526ia1Ib6Rx2QPCMCuirffhl7cKGPmz/zE7T5FkBpYXp
         AuCg==
X-Gm-Message-State: AAQBX9ddInj20faqt0pBljzpB0GAoC7te+pb8n2kta1xKJ47y9ufDuCq
        qqI5/3HXLxsifLhgMFnq0cnilOE8gin12mfXYL1t0xPk
X-Google-Smtp-Source: AKy350YjewvzCGazr9mxUW1vvLBmqLSsucs1yxmFA334SNj3p5N8JoAE8Hkkd4msidtvUDzNIqdiYw==
X-Received: by 2002:a17:902:ea08:b0:1a6:f755:a4a0 with SMTP id s8-20020a170902ea0800b001a6f755a4a0mr566851plg.58.1681743507004;
        Mon, 17 Apr 2023 07:58:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902c18500b001a5000ba26esm7815382pld.264.2023.04.17.07.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 07:58:26 -0700 (PDT)
Message-ID: <643d5e92.170a0220.db438.0568@mx.google.com>
Date:   Mon, 17 Apr 2023 07:58:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-04-17-v6.3-rc7
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 178 runs,
 36 regressions (renesas-devel-2023-04-17-v6.3-rc7)
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

renesas/master baseline-nfs: 178 runs, 36 regressions (renesas-devel-2023-0=
4-17-v6.3-rc7)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 2          =

juno-uboot                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-04-17-v6.3-rc7/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-04-17-v6.3-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      53ed7cc3a28d0a629a2167e35a25cccbdc64ed42 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643d2397f1def088872e85f6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-acer-cb317-1h-c3z6-dedede.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-acer-cb317-1h-c3z6-dedede.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230407.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/643d2397f1def088872e85fb
        failing since 7 days (last pass: renesas-devel-2023-04-04-v6.3-rc5,=
 first fail: renesas-devel-2023-04-10-v6.3-rc6)

    2023-04-17T10:46:23.694003  + set +x

    2023-04-17T10:46:23.700137  [   19.876685] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10018425_1.5.2.3.1>

    2023-04-17T10:46:23.810728  / # #

    2023-04-17T10:46:23.913337  export SHELL=3D/bin/sh

    2023-04-17T10:46:23.914030  #

    2023-04-17T10:46:24.015840  / # export SHELL=3D/bin/sh. /lava-10018425/=
environment

    2023-04-17T10:46:24.016597  =


    2023-04-17T10:46:24.118429  / # . /lava-10018425/environment/lava-10018=
425/bin/lava-test-runner /lava-10018425/1

    2023-04-17T10:46:24.119665  =


    2023-04-17T10:46:24.126043  / # /lava-10018425/bin/lava-test-runner /la=
va-10018425/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643d23996906cfd9002e85f3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230407.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/643d23996906cfd9002e85f8
        failing since 17 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-17T10:46:31.337904  + set +x

    2023-04-17T10:46:31.344418  <8>[   24.417223] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10018426_1.5.2.3.1>

    2023-04-17T10:46:31.457670  #

    2023-04-17T10:46:31.560479  / # #export SHELL=3D/bin/sh

    2023-04-17T10:46:31.561206  =


    2023-04-17T10:46:31.663098  / # export SHELL=3D/bin/sh. /lava-10018426/=
environment

    2023-04-17T10:46:31.663741  =


    2023-04-17T10:46:31.765522  / # . /lava-10018426/environment/lava-10018=
426/bin/lava-test-runner /lava-10018426/1

    2023-04-17T10:46:31.766901  =


    2023-04-17T10:46:31.772569  / # /lava-10018426/bin/lava-test-runner /la=
va-10018426/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643d23f047730dea6b2e8607

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230407.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/643d23f047730dea6b2e860c
        failing since 17 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-17T10:47:54.436964  + set +x

    2023-04-17T10:47:54.443697  [   18.309587] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10018559_1.5.2.3.1>

    2023-04-17T10:47:54.549049  #

    2023-04-17T10:47:54.650260  / # #export SHELL=3D/bin/sh

    2023-04-17T10:47:54.650468  =


    2023-04-17T10:47:54.751425  / # export SHELL=3D/bin/sh. /lava-10018559/=
environment

    2023-04-17T10:47:54.751671  =


    2023-04-17T10:47:54.852394  / # . /lava-10018559/environment/lava-10018=
559/bin/lava-test-runner /lava-10018559/1

    2023-04-17T10:47:54.852706  =


    2023-04-17T10:47:54.858142  / # /lava-10018559/bin/lava-test-runner /la=
va-10018559/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643d23fa07777f893a2e8682

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230407.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/643d23fa07777f893a2e8687
        failing since 17 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-17T10:48:04.477927  + set +x

    2023-04-17T10:48:04.484800  <8>[   19.071783] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10018533_1.5.2.3.1>

    2023-04-17T10:48:04.589619  / # #

    2023-04-17T10:48:04.690655  export SHELL=3D/bin/sh

    2023-04-17T10:48:04.690853  #

    2023-04-17T10:48:04.791772  / # export SHELL=3D/bin/sh. /lava-10018533/=
environment

    2023-04-17T10:48:04.791998  =


    2023-04-17T10:48:04.892949  / # . /lava-10018533/environment/lava-10018=
533/bin/lava-test-runner /lava-10018533/1

    2023-04-17T10:48:04.893282  =


    2023-04-17T10:48:04.898419  / # /lava-10018533/bin/lava-test-runner /la=
va-10018533/1
 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/643d239bf1def088872e8616

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230407.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/643d239bf1def088872e861b
        failing since 17 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-17T10:46:35.554867  + <8>[   25.574362] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10018431_1.5.2.3.1>

    2023-04-17T10:46:35.554969  set +x

    2023-04-17T10:46:35.661639  / # #

    2023-04-17T10:46:35.762755  export SHELL=3D/bin/sh

    2023-04-17T10:46:35.763002  <6>[   25.592917] platform AMDI5682:00: def=
erred probe pending

    2023-04-17T10:46:35.763092  #

    2023-04-17T10:46:35.864054  / # export SHELL=3D/bin/sh. /lava-10018431/=
environment

    2023-04-17T10:46:35.864269  =


    2023-04-17T10:46:35.965288  / # . /lava-10018431/environment/lava-10018=
431/bin/lava-test-runner /lava-10018431/1

    2023-04-17T10:46:35.965630  =

 =

    ... (13 line(s) more)  =


  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/643d239bf1d=
ef088872e861d
        failing since 31 days (last pass: renesas-devel-2023-03-07-v6.3-rc1=
, first fail: renesas-devel-2023-03-16-v6.3-rc2)
        3 lines

    2023-04-17T10:46:35.508321  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-04-17T10:46:35.514919  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-04-17T10:46:35.521390  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-04-17T10:46:35.548259  <8>[   25.564541] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643d23d773cbbef6da2e85e6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230407.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/643d23d773cbbef6da2e85eb
        failing since 17 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-17T10:47:42.969439  + set +x[   15.403540] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10018538_1.5.2.3.1>

    2023-04-17T10:47:42.969528  =


    2023-04-17T10:47:43.073610  / # #

    2023-04-17T10:47:43.176310  export SHELL=3D/bin/sh

    2023-04-17T10:47:43.177012  #

    2023-04-17T10:47:43.278824  / # export SHELL=3D/bin/sh. /lava-10018538/=
environment

    2023-04-17T10:47:43.279611  =


    2023-04-17T10:47:43.381577  / # . /lava-10018538/environment/lava-10018=
538/bin/lava-test-runner /lava-10018538/1

    2023-04-17T10:47:43.382710  =


    2023-04-17T10:47:43.388019  / # /lava-10018538/bin/lava-test-runner /la=
va-10018538/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643d238fc6aef70d1e2e863f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230407.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/643d238fc6aef70d1e2e8644
        failing since 17 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-17T10:46:12.597320  [   20.969671] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10018432_1.5.2.3.1>

    2023-04-17T10:46:12.600513  + set +x

    2023-04-17T10:46:12.709600  / # #

    2023-04-17T10:46:12.812434  export SHELL=3D/bin/sh

    2023-04-17T10:46:12.813199  #

    2023-04-17T10:46:12.915195  / # export SHELL=3D/bin/sh. /lava-10018432/=
environment

    2023-04-17T10:46:12.915998  =


    2023-04-17T10:46:13.018161  / # . /lava-10018432/environment[   21.2914=
74] i2c i2c-10EC5682:00/lava-10018432/bin/lava-test-runner /lava-10018432/1

    2023-04-17T10:46:13.019401  : deferred probe pending

    2023-04-17T10:46:13.019786  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643d23fddbb4b4105b2e85e9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230407.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/643d23fddbb4b4105b2e85ee
        failing since 17 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-17T10:48:08.846651  <8>[   18.379666] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10018532_1.5.2.3.1>

    2023-04-17T10:48:08.849200  + set +x

    2023-04-17T10:48:08.954414  / # #

    2023-04-17T10:48:09.055447  export SHELL=3D/bin/sh

    2023-04-17T10:48:09.055661  #

    2023-04-17T10:48:09.156543  / # export SHELL=3D/bin/sh. /lava-10018532/=
environment

    2023-04-17T10:48:09.156730  =


    2023-04-17T10:48:09.257681  / # . /lava-10018532/environment/lava-10018=
532/bin/lava-test-runner /lava-10018532/1

    2023-04-17T10:48:09.257959  =


    2023-04-17T10:48:09.262696  / # /lava-10018532/bin/lava-test-runner /la=
va-10018532/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643d23a07f7edc7c2f2e85f4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230407.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/643d23a07f7edc7c2f2e85f9
        failing since 17 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-17T10:46:37.901231  + set +x

    2023-04-17T10:46:37.907412  <8>[   32.216727] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10018448_1.5.2.3.1>

    2023-04-17T10:46:38.016803  #

    2023-04-17T10:46:38.117956  / # #export SHELL=3D/bin/sh

    2023-04-17T10:46:38.118131  =


    2023-04-17T10:46:38.219043  / # export SHELL=3D/bin/sh. /lava-10018448/=
environment

    2023-04-17T10:46:38.219220  =


    2023-04-17T10:46:38.320149  / # . /lava-10018448/environment/lava-10018=
448/bin/lava-test-runner /lava-10018448/1

    2023-04-17T10:46:38.320439  =


    2023-04-17T10:46:38.325444  / # /lava-10018448/bin/lava-test-runner /la=
va-10018448/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643d24041fe5408a002e85e6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230407.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/643d24041fe5408a002e85eb
        failing since 17 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-17T10:48:15.967595  + set +x<8>[   16.062343] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10018573_1.5.2.3.1>

    2023-04-17T10:48:15.968094  =


    2023-04-17T10:48:16.076441  / # #

    2023-04-17T10:48:16.179256  export SHELL=3D/bin/sh

    2023-04-17T10:48:16.180072  #

    2023-04-17T10:48:16.282046  / # export SHELL=3D/bin/sh. /lava-10018573/=
environment

    2023-04-17T10:48:16.282826  =


    2023-04-17T10:48:16.384732  / # . /lava-10018573/environment/lava-10018=
573/bin/lava-test-runner /lava-10018573/1

    2023-04-17T10:48:16.385948  =


    2023-04-17T10:48:16.390628  / # /lava-10018573/bin/lava-test-runner /la=
va-10018573/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643d23673a96c277f52e860f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230407.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/643d23673a96c277f52e8614
        failing since 17 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-17T10:45:49.865839  + set +x

    2023-04-17T10:45:49.872652  <8>[   20.039198] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10018453_1.5.2.3.1>

    2023-04-17T10:45:49.978020  / # #

    2023-04-17T10:45:50.078990  export SHELL=3D/bin/sh

    2023-04-17T10:45:50.079151  #

    2023-04-17T10:45:50.180082  / # export SHELL=3D/bin/sh. /lava-10018453/=
environment

    2023-04-17T10:45:50.180252  =


    2023-04-17T10:45:50.281173  / # . /lava-10018453/environment/lava-10018=
453/bin/lava-test-runner /lava-10018453/1

    2023-04-17T10:45:50.281428  =


    2023-04-17T10:45:50.286547  / # /lava-10018453/bin/lava-test-runner /la=
va-10018453/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643d23ea18e1031ede2e8630

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230407.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/643d23ea18e1031ede2e8635
        failing since 17 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-17T10:47:52.681304  + set +x

    2023-04-17T10:47:52.687624  <8>[   17.994089] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10018598_1.5.2.3.1>

    2023-04-17T10:47:52.792469  / # #

    2023-04-17T10:47:52.893558  export SHELL=3D/bin/sh

    2023-04-17T10:47:52.893770  #

    2023-04-17T10:47:52.994721  / # export SHELL=3D/bin/sh. /lava-10018598/=
environment

    2023-04-17T10:47:52.994932  =


    2023-04-17T10:47:53.095879  / # . /lava-10018598/environment/lava-10018=
598/bin/lava-test-runner /lava-10018598/1

    2023-04-17T10:47:53.096197  =


    2023-04-17T10:47:53.100896  / # /lava-10018598/bin/lava-test-runner /la=
va-10018598/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643d237aec5f668f262e85f3

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230407.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/643d237aec5f668f262e85f8
        failing since 17 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-17T10:46:11.079106  + <8>[   23.410416] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10018441_1.5.2.3.1>

    2023-04-17T10:46:11.079190  set +x

    2023-04-17T10:46:11.190419  / # #

    2023-04-17T10:46:11.291373  export SHELL=3D/bin/sh

    2023-04-17T10:46:11.291600  #

    2023-04-17T10:46:11.392541  / # export SHELL=3D/bin/sh. /lava-10018441/=
environment

    2023-04-17T10:46:11.392725  =


    2023-04-17T10:46:11.493627  / # . /lava-10018441/environment/lava-10018=
441/bin/lava-test-runner /lava-10018441/1

    2023-04-17T10:46:11.493923  =


    2023-04-17T10:46:11.498678  / # /lava-10018441/bin/lava-test-runner /la=
va-10018441/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643d23d84bb712b75d2e8614

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230407.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/643d23d84bb712b75d2e8619
        failing since 17 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-17T10:47:44.079853  [   18.070307] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10018550_1.5.2.3.1>

    2023-04-17T10:47:44.184664  / # #

    2023-04-17T10:47:44.285615  export SHELL=3D/bin/sh

    2023-04-17T10:47:44.285806  #

    2023-04-17T10:47:44.386655  / # export SHELL=3D/bin/sh. /lava-10018550/=
environment

    2023-04-17T10:47:44.386810  =


    2023-04-17T10:47:44.487677  / # . /lava-10018550/environment/lava-10018=
550/bin/lava-test-runner /lava-10018550/1

    2023-04-17T10:47:44.487924  =


    2023-04-17T10:47:44.492818  / # /lava-10018550/bin/lava-test-runner /la=
va-10018550/1

    2023-04-17T10:47:44.578170  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643d277e4815d8f59a2e8624

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230407.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/643d277e4815d8f59a2e8629
        failing since 41 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-17T11:03:03.266871  + set +x
    2023-04-17T11:03:03.267130  [   27.090231] <LAVA_SIGNAL_ENDRUN 0_dmesg =
928461_1.6.2.3.1>
    2023-04-17T11:03:03.375566  #
    2023-04-17T11:03:03.477492  / # #export SHELL=3D/bin/sh
    2023-04-17T11:03:03.478095  =

    2023-04-17T11:03:03.579450  / # export SHELL=3D/bin/sh. /lava-928461/en=
vironment
    2023-04-17T11:03:03.579951  =

    2023-04-17T11:03:03.681210  / # . /lava-928461/environment/lava-928461/=
bin/lava-test-runner /lava-928461/1
    2023-04-17T11:03:03.681847  =

    2023-04-17T11:03:03.684691  / # /lava-928461/bin/lava-test-runner /lava=
-928461/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/643d2b5101e6dbaa092e865d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230407.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/643d2b5101e6dbaa092e8662
        failing since 41 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-17T11:19:28.810121  + set +x
    2023-04-17T11:19:28.810286  [   29.602678] <LAVA_SIGNAL_ENDRUN 0_dmesg =
928469_1.6.2.3.1>
    2023-04-17T11:19:28.920670  #
    2023-04-17T11:19:29.022510  / # #export SHELL=3D/bin/sh
    2023-04-17T11:19:29.022993  =

    2023-04-17T11:19:29.124271  / # export SHELL=3D/bin/sh. /lava-928469/en=
vironment
    2023-04-17T11:19:29.124736  =

    2023-04-17T11:19:29.225927  / # . /lava-928469/environment/lava-928469/=
bin/lava-test-runner /lava-928469/1
    2023-04-17T11:19:29.226509  =

    2023-04-17T11:19:29.229621  / # /lava-928469/bin/lava-test-runner /lava=
-928469/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643d2e994c80b3d3c82e85e7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230407.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/643d2e994c80b3d3c82e85ec
        failing since 41 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-17T11:33:23.728860  + set +x
    2023-04-17T11:33:23.729282  [   28.786007] <LAVA_SIGNAL_ENDRUN 0_dmesg =
928475_1.6.2.3.1>
    2023-04-17T11:33:23.843565  #
    2023-04-17T11:33:23.945292  / # #export SHELL=3D/bin/sh
    2023-04-17T11:33:23.945672  =

    2023-04-17T11:33:24.046871  / # export SHELL=3D/bin/sh. /lava-928475/en=
vironment
    2023-04-17T11:33:24.047336  =

    2023-04-17T11:33:24.148685  / # . /lava-928475/environment/lava-928475/=
bin/lava-test-runner /lava-928475/1
    2023-04-17T11:33:24.149280  =

    2023-04-17T11:33:24.152307  / # /lava-928475/bin/lava-test-runner /lava=
-928475/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/643d30517f471cc2052e85f7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230407.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/643d30517f471cc2052e85fc
        failing since 41 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-17T11:40:40.604526  + set +x
    2023-04-17T11:40:40.604923  [   32.928069] <LAVA_SIGNAL_ENDRUN 0_dmesg =
928484_1.6.2.3.1>
    2023-04-17T11:40:40.727228  #
    2023-04-17T11:40:40.829569  / # #export SHELL=3D/bin/sh
    2023-04-17T11:40:40.830064  =

    2023-04-17T11:40:40.931161  / # export SHELL=3D/bin/sh. /lava-928484/en=
vironment
    2023-04-17T11:40:40.931638  =

    2023-04-17T11:40:41.032953  / # . /lava-928484/environment/lava-928484/=
bin/lava-test-runner /lava-928484/1
    2023-04-17T11:40:41.034024  =

    2023-04-17T11:40:41.036865  / # /lava-928484/bin/lava-test-runner /lava=
-928484/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/643d2f52b994255c002e85e6

  Results:     29 PASS, 4 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie=
/baseline-nfs-imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie=
/baseline-nfs-imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230407.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.sound-card: https://kernelci.org/test/case/id/643d2=
f52b994255c002e85ef
        new failure (last pass: renesas-devel-2023-04-10-v6.3-rc6)

    2023-04-17T11:36:18.933109  /lava-342307/1/../bin/lava-test-case
    2023-04-17T11:36:19.794804  [   90.378104] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dsound-card RESULT=3Dfail>   =


  * baseline-nfs.bootrr.sound-card-probed: https://kernelci.org/test/case/i=
d/643d2f52b994255c002e85f0
        new failure (last pass: renesas-devel-2023-04-10-v6.3-rc6)

    2023-04-17T11:36:16.816388  /lava-342307/1/../bin/lava-test-case
    2023-04-17T11:36:17.896819  [   88.479847] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dsound-card-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
juno-uboot                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/643d2f6869fd5a80f72e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-nfs-j=
uno-uboot.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-nfs-j=
uno-uboot.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230407.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/643d2f6869fd5a80f=
72e85e8
        failing since 82 days (last pass: renesas-devel-2023-01-09-v6.2-rc3=
, first fail: renesas-devel-2023-01-24-v6.2-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643d238a6bafd576b12e8629

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230407.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/643d238a6bafd576b12e862d
        failing since 17 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-17T10:46:06.661984  + <8>[   21.825383] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10018463_1.5.2.3.1>

    2023-04-17T10:46:06.662079  set +x

    2023-04-17T10:46:06.768274  / # #

    2023-04-17T10:46:06.869264  export SHELL=3D/bin/sh

    2023-04-17T10:46:06.869485  #

    2023-04-17T10:46:06.970419  / # export SHELL=3D/bin/sh. /lava-10018463/=
environment

    2023-04-17T10:46:06.970596  =


    2023-04-17T10:46:07.071609  / # . /lava-10018463/environment/lava-10018=
463/bin/lava-test-runner /lava-10018463/1

    2023-04-17T10:46:07.071878  =


    2023-04-17T10:46:07.076640  / # /lava-10018463/bin/lava-test-runner /la=
va-10018463/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643d23e518e1031ede2e8605

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230407.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/643d23e518e1031ede2e860a
        failing since 17 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-17T10:47:46.137837  <8>[   17.905442] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10018563_1.5.2.3.1>

    2023-04-17T10:47:46.242532  / # #

    2023-04-17T10:47:46.343520  export SHELL=3D/bin/sh

    2023-04-17T10:47:46.343726  #

    2023-04-17T10:47:46.444622  / # export SHELL=3D/bin/sh. /lava-10018563/=
environment

    2023-04-17T10:47:46.444816  =


    2023-04-17T10:47:46.545796  / # . /lava-10018563/environment/lava-10018=
563/bin/lava-test-runner /lava-10018563/1

    2023-04-17T10:47:46.546114  =


    2023-04-17T10:47:46.550980  / # /lava-10018563/bin/lava-test-runner /la=
va-10018563/1

    2023-04-17T10:47:46.597397  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/643d284cc7848deee92e8711

  Results:     165 PASS, 6 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230407.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.panel-edp-probed: https://kernelci.org/test/case/id=
/643d284cc7848deee92e8761
        failing since 41 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-17T11:06:36.468508  <6>[   46.160164] vaux18: disabling

    2023-04-17T11:06:36.474136  <6>[   46.166366] vio28: disabling

    2023-04-17T11:06:36.681927  /lava-10018796/1/../bin/lava-test-case

    2023-04-17T11:06:36.712272  <8>[   46.397453] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/tes=
t/case/id/643d284cc7848deee92e87b3
        failing since 41 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-17T11:06:30.865036  /lava-10018796/1/../bin/lava-test-case

    2023-04-17T11:06:30.896018  <8>[   40.580941] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/te=
st/case/id/643d284cc7848deee92e87b4
        failing since 41 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-17T11:06:29.778314  /lava-10018796/1/../bin/lava-test-case

    2023-04-17T11:06:29.806357  <8>[   39.491847] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/643d2b964e4480e68d2e85fc

  Results:     165 PASS, 6 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230407.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.panel-edp-probed: https://kernelci.org/test/case/id=
/643d2b964e4480e68d2e864c
        failing since 41 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-17T11:20:27.284909  /lava-10018948/1/../bin/lava-test-case

    2023-04-17T11:20:27.315264  <8>[   48.147125] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/tes=
t/case/id/643d2b964e4480e68d2e869d
        failing since 41 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-17T11:20:21.090843  /lava-10018948/1/../bin/lava-test-case

    2023-04-17T11:20:21.125243  <8>[   41.956541] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/te=
st/case/id/643d2b964e4480e68d2e869e
        failing since 41 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-17T11:20:19.993973  /lava-10018948/1/../bin/lava-test-case

    2023-04-17T11:20:20.027643  <8>[   40.859625] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/643d288b428654841f2e8607

  Results:     176 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230407.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/tes=
t/case/id/643d288b428654841f2e86b9
        failing since 41 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-17T11:07:22.943087  /lava-10018766/1/../bin/lava-test-case

    2023-04-17T11:07:22.982049  <8>[   31.464260] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/te=
st/case/id/643d288c428654841f2e86ba
        failing since 41 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-17T11:07:21.826846  /lava-10018766/1/../bin/lava-test-case

    2023-04-17T11:07:21.861009  <8>[   30.343496] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/te=
st/case/id/643d288c428654841f2e86bb
        failing since 41 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-17T11:07:20.721180  /lava-10018766/1/../bin/lava-test-case

    2023-04-17T11:07:20.751595  <8>[   29.234297] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/643d2b331f8ad73e932e8600

  Results:     172 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230407.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/tes=
t/case/id/643d2b331f8ad73e932e86a7
        failing since 41 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-17T11:18:36.946289  /lava-10018939/1/../bin/lava-test-case

    2023-04-17T11:18:36.972467  [   31.806024] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/te=
st/case/id/643d2b331f8ad73e932e86a8
        failing since 41 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-17T11:18:35.869282  /lava-10018939/1/../bin/lava-test-case

    2023-04-17T11:18:35.900469  [   30.733854] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/te=
st/case/id/643d2b331f8ad73e932e86a9
        failing since 41 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-17T11:18:34.799233  /lava-10018939/1/../bin/lava-test-case

    2023-04-17T11:18:34.828464  [   29.661548] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =

 =20
