Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F9E16E4C2E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Apr 2023 16:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbjDQO7G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Apr 2023 10:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231159AbjDQO65 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Apr 2023 10:58:57 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A62E93E6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Apr 2023 07:58:29 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id v9so31199378pjk.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Apr 2023 07:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1681743505; x=1684335505;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F5VwrgMgiY0bDpch5foZbmoIHa1Vv9ZzEFAzkzD0iOo=;
        b=RlClguX9Gi2PDZjk0ATdXnfSsT7gZWVxQpfayCvkSAzU7l4jN9MppIOezK/VlmgDL0
         jjjaK6kjm3WG8IZZNpYExhDxgdf0OpYs3kEiYFzbEjvvZV91t3gTk9aDgZFKCjOxUmVw
         uqtL1EbfvoT+J3j2TK65ohJR5gKzpwcH56RfxFA5qicktowKlW0fpeL5oPIfBfdpn1xf
         O+Nc6sMLWks1wcB2DrXtV2aIuwcFVGS32wtljFff2N0cTKIcWr5AEabP9jJ0n/xy37s+
         cl+0B6D4QKdR+uFOe7JW+u1oeWqZpGEFeprqrE5S78H0ULKcoQNXKZcGStBHY/Ms5BGN
         /vCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681743505; x=1684335505;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F5VwrgMgiY0bDpch5foZbmoIHa1Vv9ZzEFAzkzD0iOo=;
        b=bwrpwhuMDMwnzhaPa1j/9nXHttRwBUQahbvOTuXib3gQtyvNpv65vb4//5GIUkLcUz
         QC6PzBs4ytOkmInk+xYYwnbUCYYT8bYwM58WmKVpFogQCHaVrYTDySARgnk8CVVujsaX
         954uLeUZGwPPY8Mgi3O0t+5iujLsGgwGhC+haL86nVxGcjUmoUzHud6BpqciixJsPgtF
         5p2varC10ytFzU0M0u2mxUZttnvqmdcCGkfT48/cmkdXJnbKrEfWO0qQOk/6FRAPPdVH
         VPaTm1YVvHMgqiyjeixBZ9xP32dLTgAtz+EJt64DaKNCRJ0eewbwGAmZTjh3GFKSUfi3
         0TFA==
X-Gm-Message-State: AAQBX9ddjI+KdwpW/n6x48Re8dJnK/ifWP0dFikoRRWUO1XCJz2lKyq8
        yzoWCXsvBh+G+AoV9VeYct6ipheInhPwYEwhnVLnCqUi
X-Google-Smtp-Source: AKy350bwYdphIQWQDNEZVgAh/YkRwHn4ZOHTvs/GZJmkF8mutNDD3IhKwvj+kJZuIRmKZbS5PAX8fA==
X-Received: by 2002:a17:902:ea0e:b0:1a6:f755:a49f with SMTP id s14-20020a170902ea0e00b001a6f755a49fmr647621plg.59.1681743503822;
        Mon, 17 Apr 2023 07:58:23 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 132-20020a63058a000000b0051ba16c35cfsm2741995pgf.29.2023.04.17.07.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 07:58:23 -0700 (PDT)
Message-ID: <643d5e8f.630a0220.3da95.540d@mx.google.com>
Date:   Mon, 17 Apr 2023 07:58:23 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-04-17-v6.3-rc7
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 443 runs,
 55 regressions (renesas-devel-2023-04-17-v6.3-rc7)
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

renesas/master baseline: 443 runs, 55 regressions (renesas-devel-2023-04-17=
-v6.3-rc7)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

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

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

juno-uboot                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+ima                | 2          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =

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

qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-04-17-v6.3-rc7/plan/baseline/

  Test:     baseline
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
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643d23826bafd576b12e85e7

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643d23826bafd576b12e85ec
        failing since 17 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-17T10:46:12.063995  + set +x

    2023-04-17T10:46:12.070442  <8>[   12.345342] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10018457_1.4.2.3.1>

    2023-04-17T10:46:12.175264  / # #

    2023-04-17T10:46:12.276352  export SHELL=3D/bin/sh

    2023-04-17T10:46:12.276553  #

    2023-04-17T10:46:12.377469  / # export SHELL=3D/bin/sh. /lava-10018457/=
environment

    2023-04-17T10:46:12.377724  =


    2023-04-17T10:46:12.478680  / # . /lava-10018457/environment/lava-10018=
457/bin/lava-test-runner /lava-10018457/1

    2023-04-17T10:46:12.478971  =


    2023-04-17T10:46:12.484762  / # /lava-10018457/bin/lava-test-runner /la=
va-10018457/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643d23df37c8bae09c2e863d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643d23df37c8bae09c2e8642
        failing since 17 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-17T10:47:42.445502  <8>[   10.076080] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10018562_1.4.2.3.1>

    2023-04-17T10:47:42.449091  + set +x

    2023-04-17T10:47:42.556830  / # #

    2023-04-17T10:47:42.659648  export SHELL=3D/bin/sh

    2023-04-17T10:47:42.660408  #

    2023-04-17T10:47:42.762445  / # export SHELL=3D/bin/sh. /lava-10018562/=
environment

    2023-04-17T10:47:42.763321  =


    2023-04-17T10:47:42.865339  / # . /lava-10018562/environment/lava-10018=
562/bin/lava-test-runner /lava-10018562/1

    2023-04-17T10:47:42.866549  =


    2023-04-17T10:47:42.872990  / # /lava-10018562/bin/lava-test-runner /la=
va-10018562/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/643d23836bafd576b12e85f5

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643d23836bafd576b12e85fa
        failing since 17 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-17T10:46:15.998050  + set +x

    2023-04-17T10:46:16.004878  <8>[   15.869381] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10018450_1.4.2.3.1>

    2023-04-17T10:46:16.112828  / # #

    2023-04-17T10:46:16.215185  export SHELL=3D/bin/sh

    2023-04-17T10:46:16.215830  #

    2023-04-17T10:46:16.317547  / # export SHELL=3D/bin/sh. /lava-10018450/=
environment

    2023-04-17T10:46:16.318213  =


    2023-04-17T10:46:16.420011  / # . /lava-10018450/environment/lava-10018=
450/bin/lava-test-runner /lava-10018450/1

    2023-04-17T10:46:16.421065  =


    2023-04-17T10:46:16.426411  / # /lava-10018450/bin/lava-test-runner /la=
va-10018450/1
 =

    ... (12 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643d23836bafd57=
6b12e85fc
        failing since 7 days (last pass: renesas-devel-2023-04-04-v6.3-rc5,=
 first fail: renesas-devel-2023-04-10-v6.3-rc6)
        3 lines

    2023-04-17T10:46:15.974272  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-04-17T10:46:15.981157  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-04-17T10:46:15.987496  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-04-17T10:46:15.994090  <8>[   15.852350] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643d23e573cbbef6da2e861a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643d23e573cbbef6da2e861f
        failing since 17 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-17T10:47:52.270754  + set<8>[   11.552833] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10018551_1.4.2.3.1>

    2023-04-17T10:47:52.270839   +x

    2023-04-17T10:47:52.375531  / # #

    2023-04-17T10:47:52.476639  export SHELL=3D/bin/sh

    2023-04-17T10:47:52.476857  #

    2023-04-17T10:47:52.577573  / # export SHELL=3D/bin/sh. /lava-10018551/=
environment

    2023-04-17T10:47:52.577762  =


    2023-04-17T10:47:52.678638  / # . /lava-10018551/environment/lava-10018=
551/bin/lava-test-runner /lava-10018551/1

    2023-04-17T10:47:52.678925  =


    2023-04-17T10:47:52.683680  / # /lava-10018551/bin/lava-test-runner /la=
va-10018551/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643d23842ee61680682e85ef

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643d23852ee61680682e85f4
        failing since 17 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-17T10:46:14.974967  + set +x

    2023-04-17T10:46:14.981015  <8>[   13.614674] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10018466_1.4.2.3.1>

    2023-04-17T10:46:15.085922  / # #

    2023-04-17T10:46:15.186904  export SHELL=3D/bin/sh

    2023-04-17T10:46:15.187126  #

    2023-04-17T10:46:15.288155  / # export SHELL=3D/bin/sh. /lava-10018466/=
environment

    2023-04-17T10:46:15.288875  =


    2023-04-17T10:46:15.390617  / # . /lava-10018466/environment/lava-10018=
466/bin/lava-test-runner /lava-10018466/1

    2023-04-17T10:46:15.391829  =


    2023-04-17T10:46:15.397509  / # /lava-10018466/bin/lava-test-runner /la=
va-10018466/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643d23e837c8bae09c2e8651

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643d23e837c8bae09c2e8656
        failing since 17 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-17T10:47:51.695253  <8>[   10.523881] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10018592_1.4.2.3.1>

    2023-04-17T10:47:51.698915  + set +x

    2023-04-17T10:47:51.800561  #

    2023-04-17T10:47:51.800791  =


    2023-04-17T10:47:51.901713  / # #export SHELL=3D/bin/sh

    2023-04-17T10:47:51.901860  =


    2023-04-17T10:47:52.002775  / # export SHELL=3D/bin/sh. /lava-10018592/=
environment

    2023-04-17T10:47:52.002930  =


    2023-04-17T10:47:52.103836  / # . /lava-10018592/environment/lava-10018=
592/bin/lava-test-runner /lava-10018592/1

    2023-04-17T10:47:52.104063  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/643d24064222b3715f2e85fc

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm283=
5-rpi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm283=
5-rpi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643d24064222b3715f2e862f
        failing since 14 days (last pass: renesas-devel-2023-03-30-v6.3-rc4=
, first fail: renesas-devel-2023-04-03-v6.3-rc5)

    2023-04-17T10:48:14.827543  + set +x
    2023-04-17T10:48:14.831300  <8>[   19.054924] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 342270_1.5.2.4.1>
    2023-04-17T10:48:14.968249  / # #
    2023-04-17T10:48:15.070966  export SHELL=3D/bin/sh
    2023-04-17T10:48:15.072029  #
    2023-04-17T10:48:15.176223  / # export SHELL=3D/bin/sh. /lava-342270/en=
vironment
    2023-04-17T10:48:15.178362  =

    2023-04-17T10:48:15.280586  / # . /lava-342270/environment/lava-342270/=
bin/lava-test-runner /lava-342270/1
    2023-04-17T10:48:15.281881  =

    2023-04-17T10:48:15.287832  / # /lava-342270/bin/lava-test-runner /lava=
-342270/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643d2836c7848deee92e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643d2836c7848deee92e8=
5e7
        failing since 41 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643d2366bc6293e2c62e85ec

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643d2366bc6293e2c62e85f1
        failing since 17 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-17T10:45:43.469850  + set +x

    2023-04-17T10:45:43.476379  <8>[   15.092412] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10018424_1.4.2.3.1>

    2023-04-17T10:45:43.582323  / # #

    2023-04-17T10:45:43.683408  export SHELL=3D/bin/sh

    2023-04-17T10:45:43.683637  #

    2023-04-17T10:45:43.784519  / # export SHELL=3D/bin/sh. /lava-10018424/=
environment

    2023-04-17T10:45:43.784769  =


    2023-04-17T10:45:43.885690  / # . /lava-10018424/environment/lava-10018=
424/bin/lava-test-runner /lava-10018424/1

    2023-04-17T10:45:43.886049  =


    2023-04-17T10:45:43.890364  / # /lava-10018424/bin/lava-test-runner /la=
va-10018424/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643d23e918e1031ede2e8625

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643d23e918e1031ede2e862a
        failing since 17 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-17T10:47:55.963236  + set +x

    2023-04-17T10:47:55.969400  <8>[   10.556364] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10018557_1.4.2.3.1>

    2023-04-17T10:47:56.074751  / # #

    2023-04-17T10:47:56.175829  export SHELL=3D/bin/sh

    2023-04-17T10:47:56.176044  #

    2023-04-17T10:47:56.276966  / # export SHELL=3D/bin/sh. /lava-10018557/=
environment

    2023-04-17T10:47:56.277192  =


    2023-04-17T10:47:56.378117  / # . /lava-10018557/environment/lava-10018=
557/bin/lava-test-runner /lava-10018557/1

    2023-04-17T10:47:56.378421  =


    2023-04-17T10:47:56.383196  / # /lava-10018557/bin/lava-test-runner /la=
va-10018557/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643d2372990a1a2dff2e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643d2372990a1a2dff2e85eb
        failing since 17 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-17T10:45:53.485437  + set +x

    2023-04-17T10:45:53.492863  <8>[   13.898595] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10018438_1.4.2.3.1>

    2023-04-17T10:45:53.596797  / # #

    2023-04-17T10:45:53.697878  export SHELL=3D/bin/sh

    2023-04-17T10:45:53.698132  #

    2023-04-17T10:45:53.799104  / # export SHELL=3D/bin/sh. /lava-10018438/=
environment

    2023-04-17T10:45:53.799344  =


    2023-04-17T10:45:53.900348  / # . /lava-10018438/environment/lava-10018=
438/bin/lava-test-runner /lava-10018438/1

    2023-04-17T10:45:53.900694  =


    2023-04-17T10:45:53.905747  / # /lava-10018438/bin/lava-test-runner /la=
va-10018438/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643d23c4c802ba2c422e86c1

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643d23c4c802ba2c422e86c6
        failing since 14 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-04-03-v6.3-rc5)

    2023-04-17T10:47:14.268774  + set +x

    2023-04-17T10:47:14.275199  <8>[   10.722675] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10018600_1.4.2.3.1>

    2023-04-17T10:47:14.379981  / # #

    2023-04-17T10:47:14.481053  export SHELL=3D/bin/sh

    2023-04-17T10:47:14.481266  #

    2023-04-17T10:47:14.582224  / # export SHELL=3D/bin/sh. /lava-10018600/=
environment

    2023-04-17T10:47:14.582464  =


    2023-04-17T10:47:14.683470  / # . /lava-10018600/environment/lava-10018=
600/bin/lava-test-runner /lava-10018600/1

    2023-04-17T10:47:14.683766  =


    2023-04-17T10:47:14.689171  / # /lava-10018600/bin/lava-test-runner /la=
va-10018600/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643d237f990a1a2dff2e860d

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643d237f990a1a2dff2e8611
        failing since 17 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-17T10:46:05.053606  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-04-17T10:46:05.059717  <8>[   14.167415] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10018433_1.4.2.3.1>

    2023-04-17T10:46:05.059816  + set +x

    2023-04-17T10:46:05.164605  / # #

    2023-04-17T10:46:05.266072  export SHELL=3D/bin/sh

    2023-04-17T10:46:05.266865  #

    2023-04-17T10:46:05.368727  / # export SHELL=3D/bin/sh. /lava-10018433/=
environment

    2023-04-17T10:46:05.369478  =


    2023-04-17T10:46:05.471371  / # . /lava-10018433/environment/lava-10018=
433/bin/lava-test-runner /lava-10018433/1

    2023-04-17T10:46:05.472577  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643d23fb49fb0b976f2e85fc

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643d23fb49fb0b976f2e8601
        failing since 17 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-17T10:48:06.388526  + <8>[   11.402660] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10018537_1.4.2.3.1>

    2023-04-17T10:48:06.389050  set +x

    2023-04-17T10:48:06.497592  / # #

    2023-04-17T10:48:06.600263  export SHELL=3D/bin/sh

    2023-04-17T10:48:06.600916  #

    2023-04-17T10:48:06.702722  / # export SHELL=3D/bin/sh. /lava-10018537/=
environment

    2023-04-17T10:48:06.703590  =


    2023-04-17T10:48:06.805537  / # . /lava-10018537/environment/lava-10018=
537/bin/lava-test-runner /lava-10018537/1

    2023-04-17T10:48:06.806798  =


    2023-04-17T10:48:06.811420  / # /lava-10018537/bin/lava-test-runner /la=
va-10018537/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643d25ee0ba4bc461f2e8655

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643d25ee0ba4bc461f2e865a
        failing since 76 days (last pass: v6.1-rc8-929-g112502470f50, first=
 fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-04-17T10:56:21.844341  + set +x
    2023-04-17T10:56:21.844661  [   12.141184] <LAVA_SIGNAL_ENDRUN 0_dmesg =
928466_1.5.2.3.1>
    2023-04-17T10:56:21.951559  / # #
    2023-04-17T10:56:22.053162  export SHELL=3D/bin/sh
    2023-04-17T10:56:22.053660  #
    2023-04-17T10:56:22.154844  / # export SHELL=3D/bin/sh. /lava-928466/en=
vironment
    2023-04-17T10:56:22.155338  =

    2023-04-17T10:56:22.256734  / # . /lava-928466/environment/lava-928466/=
bin/lava-test-runner /lava-928466/1
    2023-04-17T10:56:22.257428  =

    2023-04-17T10:56:22.260983  / # /lava-928466/bin/lava-test-runner /lava=
-928466/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/643d263e867ee7dc002e85fe

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643d263e867ee7dc002e8603
        failing since 76 days (last pass: v6.1-rc8-929-g112502470f50, first=
 fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-04-17T10:57:44.037125  + set +x
    2023-04-17T10:57:44.037291  [   13.067798] <LAVA_SIGNAL_ENDRUN 0_dmesg =
928471_1.5.2.3.1>
    2023-04-17T10:57:44.144520  / # #
    2023-04-17T10:57:44.246078  export SHELL=3D/bin/sh
    2023-04-17T10:57:44.246579  #
    2023-04-17T10:57:44.347890  / # export SHELL=3D/bin/sh. /lava-928471/en=
vironment
    2023-04-17T10:57:44.348284  =

    2023-04-17T10:57:44.449524  / # . /lava-928471/environment/lava-928471/=
bin/lava-test-runner /lava-928471/1
    2023-04-17T10:57:44.450289  =

    2023-04-17T10:57:44.453611  / # /lava-928471/bin/lava-test-runner /lava=
-928471/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643d27f5eaaeb741d12e85f3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643d27f5eaaeb741d12e85f8
        failing since 76 days (last pass: v6.1-rc8-929-g112502470f50, first=
 fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-04-17T11:05:10.898175  + set +x
    2023-04-17T11:05:10.898511  [   12.893247] <LAVA_SIGNAL_ENDRUN 0_dmesg =
928476_1.5.2.3.1>
    2023-04-17T11:05:11.006079  / # #
    2023-04-17T11:05:11.108003  export SHELL=3D/bin/sh
    2023-04-17T11:05:11.108568  #
    2023-04-17T11:05:11.209665  / # export SHELL=3D/bin/sh. /lava-928476/en=
vironment
    2023-04-17T11:05:11.210241  =

    2023-04-17T11:05:11.311568  / # . /lava-928476/environment/lava-928476/=
bin/lava-test-runner /lava-928476/1
    2023-04-17T11:05:11.312248  =

    2023-04-17T11:05:11.315250  / # /lava-928476/bin/lava-test-runner /lava=
-928476/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/643d2846c7848deee92e86be

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643d2846c7848deee92e86c3
        failing since 76 days (last pass: v6.1-rc8-929-g112502470f50, first=
 fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-04-17T11:06:27.464177  + set +x
    2023-04-17T11:06:27.464358  [   16.349491] <LAVA_SIGNAL_ENDRUN 0_dmesg =
928485_1.5.2.3.1>
    2023-04-17T11:06:27.572154  / # #
    2023-04-17T11:06:27.673970  export SHELL=3D/bin/sh
    2023-04-17T11:06:27.674603  #
    2023-04-17T11:06:27.776107  / # export SHELL=3D/bin/sh. /lava-928485/en=
vironment
    2023-04-17T11:06:27.776694  =

    2023-04-17T11:06:27.878241  / # . /lava-928485/environment/lava-928485/=
bin/lava-test-runner /lava-928485/1
    2023-04-17T11:06:27.879226  =

    2023-04-17T11:06:27.882567  / # /lava-928485/bin/lava-test-runner /lava=
-928485/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/643d281d992285c5cd2e863d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643d281d992285c5cd2e8642
        new failure (last pass: renesas-devel-2023-03-07-v6.3-rc1)

    2023-04-17T11:05:55.762649  + set[   27.264875] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 928487_1.5.2.3.1>
    2023-04-17T11:05:55.762834   +x
    2023-04-17T11:05:55.868769  / # #
    2023-04-17T11:05:55.970535  export SHELL=3D/bin/sh
    2023-04-17T11:05:55.971070  #
    2023-04-17T11:05:56.072413  / # export SHELL=3D/bin/sh. /lava-928487/en=
vironment
    2023-04-17T11:05:56.072931  =

    2023-04-17T11:05:56.174244  / # . /lava-928487/environment/lava-928487/=
bin/lava-test-runner /lava-928487/1
    2023-04-17T11:05:56.174992  =

    2023-04-17T11:05:56.178521  / # /lava-928487/bin/lava-test-runner /lava=
-928487/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/643d2d81adcc9061372e8603

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/base=
line-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/base=
line-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643d2d81adcc9061372e8=
604
        failing since 157 days (last pass: renesas-devel-2022-09-19-v6.0-rc=
6, first fail: renesas-devel-2022-11-10-v6.1-rc4) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/643d2bca515ac2ce472e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/base=
line-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/base=
line-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643d2bca515ac2ce472e8=
5e8
        failing since 157 days (last pass: renesas-devel-2022-09-19-v6.0-rc=
6, first fail: renesas-devel-2022-11-10-v6.1-rc4) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
juno-uboot                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/643d292737cc9024192e85e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-juno-=
uboot.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-juno-=
uboot.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643d292737cc9024192e8=
5ea
        new failure (last pass: renesas-devel-2023-04-10-v6.3-rc6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/643d272ca2b921e00e2e8618

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643d272ca2b921e00e2e861b
        new failure (last pass: renesas-devel-2023-04-10-v6.3-rc6)

    2023-04-17T11:01:52.036669  / # #
    2023-04-17T11:01:52.139637  export SHELL=3D/bin/sh
    2023-04-17T11:01:52.140443  #
    2023-04-17T11:01:52.242355  / # export SHELL=3D/bin/sh. /lava-320442/en=
vironment
    2023-04-17T11:01:52.243183  =

    2023-04-17T11:01:52.344964  / # . /lava-320442/environment/lava-320442/=
bin/lava-test-runner /lava-320442/1
    2023-04-17T11:01:52.346311  =

    2023-04-17T11:01:52.362184  / # /lava-320442/bin/lava-test-runner /lava=
-320442/1
    2023-04-17T11:01:52.416901  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-17T11:01:52.417370  + cd /lava-320442/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/643=
d272ca2b921e00e2e862b
        new failure (last pass: renesas-devel-2023-04-10-v6.3-rc6)

    2023-04-17T11:01:54.802149  /lava-320442/1/../bin/lava-test-case
    2023-04-17T11:01:54.802629  <8>[   18.271137] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-04-17T11:01:54.803031  /lava-320442/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643d23648dd16d2d922e8629

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643d23648dd16d2d922e862e
        failing since 17 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-17T10:45:38.173372  + set +x

    2023-04-17T10:45:38.176525  <8>[   14.522802] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10018423_1.4.2.3.1>

    2023-04-17T10:45:38.285999  / # #

    2023-04-17T10:45:38.389079  export SHELL=3D/bin/sh

    2023-04-17T10:45:38.389887  #

    2023-04-17T10:45:38.491860  / # export SHELL=3D/bin/sh. /lava-10018423/=
environment

    2023-04-17T10:45:38.492734  =


    2023-04-17T10:45:38.594542  / # . /lava-10018423/environment/lava-10018=
423/bin/lava-test-runner /lava-10018423/1

    2023-04-17T10:45:38.595759  =


    2023-04-17T10:45:38.600171  / # /lava-10018423/bin/lava-test-runner /la=
va-10018423/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643d23c8737dc4f8bc2e867f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643d23c8737dc4f8bc2e8684
        failing since 17 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-17T10:47:24.272651  <8>[   11.805125] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10018547_1.4.2.3.1>

    2023-04-17T10:47:24.377277  / # #

    2023-04-17T10:47:24.478446  export SHELL=3D/bin/sh

    2023-04-17T10:47:24.478710  #

    2023-04-17T10:47:24.579680  / # export SHELL=3D/bin/sh. /lava-10018547/=
environment

    2023-04-17T10:47:24.579987  =


    2023-04-17T10:47:24.681056  / # . /lava-10018547/environment/lava-10018=
547/bin/lava-test-runner /lava-10018547/1

    2023-04-17T10:47:24.681504  =


    2023-04-17T10:47:24.686067  / # /lava-10018547/bin/lava-test-runner /la=
va-10018547/1

    2023-04-17T10:47:24.692451  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/643d27d23f2d0a760c2e8652

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-=
meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-=
meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643d27d23f2d0a760c2e8=
653
        failing since 55 days (last pass: renesas-devel-2023-02-06-v6.2-rc7=
, first fail: renesas-devel-2023-02-20-v6.2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/643d2744f440e8fe852e85fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-me=
son-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-me=
son-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643d2744f440e8fe852e8=
5fb
        failing since 55 days (last pass: renesas-devel-2023-02-06-v6.2-rc7=
, first fail: renesas-devel-2023-02-20-v6.2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/643d2839c7848deee92e85ff

  Results:     166 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/643=
d2839c7848deee92e864f
        failing since 41 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-17T11:06:18.064477  /lava-10018789/1/../bin/lava-test-case

    2023-04-17T11:06:18.074194  <8>[   23.449117] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/test/ca=
se/id/643d283ac7848deee92e86a0
        failing since 41 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-17T11:06:15.185937  /lava-10018789/1/../bin/lava-test-case

    2023-04-17T11:06:15.196530  <8>[   20.571551] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/test/c=
ase/id/643d283ac7848deee92e86a1
        failing since 41 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-17T11:06:13.965566  <3>[   19.343589] Bluetooth: hci0: command =
0x0c14 tx timeout

    2023-04-17T11:06:13.974622  <3>[   19.343587] Bluetooth: hci0: Opcode 0=
x c14 failed: -110

    2023-04-17T11:06:14.156666  /lava-10018789/1/../bin/lava-test-case

    2023-04-17T11:06:14.166736  <8>[   19.541697] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643d294f479d90e7fe2e8835

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643d294f479d90e7fe2e8=
836
        failing since 62 days (last pass: renesas-devel-2023-01-30-v6.2-rc6=
, first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643d2924cddd36e8032e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643d2924cddd36e8032e8=
5e7
        failing since 62 days (last pass: renesas-devel-2023-02-06-v6.2-rc7=
, first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/643d2b2058d2910a2f2e8616

  Results:     177 PASS, 9 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/test/ca=
se/id/643d2b2058d2910a2f2e86aa
        failing since 41 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-17T11:18:00.957055  /lava-10018944/1/../bin/lava-test-case

    2023-04-17T11:18:00.963097  <8>[   20.982853] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/test/c=
ase/id/643d2b2058d2910a2f2e86ac
        failing since 41 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-17T11:17:59.937642  /lava-10018944/1/../bin/lava-test-case

    2023-04-17T11:17:59.944206  <8>[   19.963752] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/test/c=
ase/id/643d2b2058d2910a2f2e86ad
        failing since 41 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-17T11:17:58.917999  /lava-10018944/1/../bin/lava-test-case

    2023-04-17T11:17:58.924962  <8>[   18.943586] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/643d31486cb126be4e2e8622

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643d31486cb126be4e2e8=
623
        failing since 181 days (last pass: renesas-devel-2022-09-27-v6.0-rc=
7, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/643d2b91297d967e2c2e8617

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643d2b91297d967e2c2e8=
618
        failing since 181 days (last pass: renesas-devel-2022-09-27-v6.0-rc=
7, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/643d32b1e203aeeeae2e8604

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643d32b1e203aeeeae2e8=
605
        failing since 181 days (last pass: renesas-devel-2022-09-19-v6.0-rc=
6, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/643d2b944e4480e68d2e85f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643d2b944e4480e68d2e8=
5fa
        failing since 181 days (last pass: renesas-devel-2022-09-19-v6.0-rc=
6, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/643d3184b7a5cc6b1c2e8626

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643d3184b7a5cc6b1c2e8=
627
        failing since 181 days (last pass: renesas-devel-2022-09-27-v6.0-rc=
7, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/643d2b924e4480e68d2e85e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643d2b924e4480e68d2e8=
5e9
        failing since 181 days (last pass: renesas-devel-2022-09-27-v6.0-rc=
7, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/643d3199b7a5cc6b1c2e8629

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643d3199b7a5cc6b1c2e8=
62a
        failing since 181 days (last pass: renesas-devel-2022-09-19-v6.0-rc=
6, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/643d2b934e4480e68d2e85eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643d2b934e4480e68d2e8=
5ec
        failing since 181 days (last pass: renesas-devel-2022-09-19-v6.0-rc=
6, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/643d244cf5d8fa38db2e8647

  Results:     4 PASS, 1 FAIL, 2 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_=
mips-malta.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_=
mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/mipsel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643d244cf5d8fa3=
8db2e864f
        failing since 7 days (last pass: renesas-devel-2023-04-04-v6.3-rc5,=
 first fail: renesas-devel-2023-04-10-v6.3-rc6)
        1 lines

    2023-04-17T10:49:25.438062  kern  :alert : CPU 0 Unable to handle kerne=
l paging request at virtual address 23f256b4, epc =3D=3D 801ff7a8, ra =3D=
=3D 8020216c
    2023-04-17T10:49:25.438274  =


    2023-04-17T10:49:25.478273  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2023-04-17T10:49:25.478477  =

   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643d2842c7848deee92e86ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-i=
wg20d-q7.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-i=
wg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643d2842c7848deee92e8=
6bb
        failing since 14 days (last pass: renesas-devel-2023-03-30-v6.3-rc4=
, first fail: renesas-devel-2023-04-03-v6.3-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643d25f2d2f40fcd9d2e8620

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643d25f2d2f40fcd9d2e8=
621
        failing since 104 days (last pass: renesas-devel-2022-12-12-v6.1, f=
irst fail: renesas-devel-2023-01-02-v6.2-rc2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643d24eea9ce6238212e8672

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643d24eea9ce6238212e8=
673
        failing since 104 days (last pass: renesas-devel-2022-12-12-v6.1, f=
irst fail: renesas-devel-2023-01-02-v6.2-rc2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643d2985f1b42bd8a32e85f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643d2985f1b42bd8a32e8=
5f4
        failing since 62 days (last pass: renesas-devel-2023-02-06-v6.2-rc7=
, first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/643d2745f440e8fe852e85fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-=
rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-=
rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643d2745f440e8fe852e8=
5fe
        failing since 55 days (last pass: renesas-devel-2023-02-06-v6.2-rc7=
, first fail: renesas-devel-2023-02-20-v6.2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643d292e4fc72e968b2e863a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643d292e4fc72e968b2e8=
63b
        failing since 62 days (last pass: renesas-devel-2023-02-06-v6.2-rc7=
, first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643d296073021f0fc52e8621

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643d296073021f0fc52e8=
622
        failing since 62 days (last pass: renesas-devel-2023-02-06-v6.2-rc7=
, first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/643d2803928fbe465e2e85ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-su=
n50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-su=
n50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643d2803928fbe465e2e8=
600
        failing since 55 days (last pass: renesas-devel-2023-02-06-v6.2-rc7=
, first fail: renesas-devel-2023-02-20-v6.2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/643d274d21390d3a302e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-su=
n50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-17-v6.3-rc7/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-su=
n50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643d274d21390d3a302e8=
5e7
        failing since 41 days (last pass: renesas-devel-2023-02-06-v6.2-rc7=
, first fail: renesas-devel-2023-03-06-v6.3-rc1) =

 =20
