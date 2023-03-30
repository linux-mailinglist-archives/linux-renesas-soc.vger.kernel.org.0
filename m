Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 101C46D1204
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Mar 2023 00:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbjC3WSS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Mar 2023 18:18:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjC3WSR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Mar 2023 18:18:17 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4098B47F
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Mar 2023 15:18:13 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id r7-20020a17090b050700b002404be7920aso19432992pjz.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Mar 2023 15:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1680214693;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2bzJyoFulb6zCwY3aPcfiXE3laWP7XnkxQR2/yRL82M=;
        b=l/1YG/SwY1dM8LUV4//q3mr1lgWbTTQJCn5Gnkxv35EOKanG1qfAxZtrtInKCcRHEm
         Ks4Amo/SjJMAzwIXFE56v7RZKZtUqazCa+cnuWzhd1MF/0f+MEKyCz5vywtTSmlbG/AT
         5axM7Y0fmoSDU1odg2Lu8wLpsgazZMKkf62FBsGRkvDcV1EN6VGTR76FrfwvERkQLUNt
         m+5GUTbnQvQP8paesd6nArU3VMtOZx+//BuO9EvcqrfMFjW86h/uLh5Dbrwg5d7aBcXq
         W1/1O0zjgoPtOa7Ss2Bt6dUEK5N4au0uxwlZvwUpgoM2ZvvYdKL8hvsJpz/WFxQmBqoY
         xI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680214693;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bzJyoFulb6zCwY3aPcfiXE3laWP7XnkxQR2/yRL82M=;
        b=zQzD++IXGWnFsSi9htyrUDt88VZnDGr7Z/e/hn9ljxD3UnO2aMF0rQflBy8Ms72rst
         WlZB69hnpzxOCCaAmWZ+krTttRl72q/iOuhihzipOUbM/ro0gnzMDldm416ZDAAnGgOR
         CS4eTZR1AFdbG1LIfMECoR2KKcR9Qh3EwO1hKFGg+9x3wZejUJJ9Uk71jWf7FYeDiUHR
         AhtZRPnljNZ/CouKZwdOMqc8jTfNxrP3wSKl4aErCXgK3Iu+gfJKC2I13m1Zi1NJrM5R
         hYJvil2HqIRbOZkvZ38saSBnXE6tkKaP9D1HwtJUuEEZA+yP89tyMvrGYV1NoUwQR9Yd
         hgiA==
X-Gm-Message-State: AAQBX9eZPePfebri5IMtRU6vshdEEr3L/xNAo8SmOGtAjs9zyAFs9JfD
        pCj+ZeKR/SR8NfZzMCM8RwzxrnAvYX4Bh4N8E9I=
X-Google-Smtp-Source: AKy350YsXoy/UMcMlayrOvNwvpTNB4ubYJW5jLalDjFZgUs928caC0mkhmJD2q80oRPws9b/eUlFxw==
X-Received: by 2002:a17:902:e5c8:b0:19e:29bd:8411 with SMTP id u8-20020a170902e5c800b0019e29bd8411mr29543705plf.30.1680214691825;
        Thu, 30 Mar 2023 15:18:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id iw4-20020a170903044400b001a1f830c9d0sm233222plb.13.2023.03.30.15.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 15:18:11 -0700 (PDT)
Message-ID: <64260aa3.170a0220.25199.1037@mx.google.com>
Date:   Thu, 30 Mar 2023 15:18:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2023-03-30-v6.3-rc1
Subject: renesas/next baseline-nfs: 140 runs,
 43 regressions (renesas-next-2023-03-30-v6.3-rc1)
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

renesas/next baseline-nfs: 140 runs, 43 regressions (renesas-next-2023-03-3=
0-v6.3-rc1)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 2          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

at91sam9g20ek                | arm    | lab-broonie   | gcc-10   | at91_dt_=
defconfig            | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+crypto             | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+videodec           | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+kselftest          | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+debug              | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g                    | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+videodec           | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 3          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 3          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+debug              | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-03-30-v6.3-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-03-30-v6.3-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2fd5359030e85226294411286259035a9a915ae8 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cf71361ec2661562f7e5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425cf71361ec2661562f7ea
        new failure (last pass: renesas-next-2023-03-16-v6.3-rc1)

    2023-03-30T18:05:12.135726  + set +x

    2023-03-30T18:05:12.141970  [   18.484842] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9821389_1.5.2.3.1>

    2023-03-30T18:05:12.248458  #

    2023-03-30T18:05:12.349622  / # #export SHELL=3D/bin/sh

    2023-03-30T18:05:12.349839  =


    2023-03-30T18:05:12.450780  / # export SHELL=3D/bin/sh. /lava-9821389/e=
nvironment

    2023-03-30T18:05:12.451031  =


    2023-03-30T18:05:12.551946  / # . /lava-9821389/environment/lava-982138=
9/bin/lava-test-runner /lava-9821389/1

    2023-03-30T18:05:12.552273  =


    2023-03-30T18:05:12.558193  / # /lava-9821389/bin/lava-test-runner /lav=
a-9821389/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6425d3d586db1ded8262f794

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425d3d586db1ded8262f799
        new failure (last pass: renesas-next-2023-03-16-v6.3-rc1)

    2023-03-30T18:24:03.533065  + set +x

    2023-03-30T18:24:03.539996  [   24.609962] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9821715_1.5.2.3.1>

    2023-03-30T18:24:03.654681  #

    2023-03-30T18:24:03.757614  / # #export SHELL=3D/bin/sh

    2023-03-30T18:24:03.758537  =


    2023-03-30T18:24:03.860491  / # export SHELL=3D/bin/sh. /lava-9821715/e=
nvironment

    2023-03-30T18:24:03.861286  =


    2023-03-30T18:24:03.962993  / # . /lava-9821715/environment/lava-982171=
5/bin/lava-test-runner /lava-9821715/1

    2023-03-30T18:24:03.964309  =


    2023-03-30T18:24:03.969991  / # /lava-9821715/bin/lava-test-runner /lav=
a-9821715/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6425d45240fa34d34862f76b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425d45240fa34d34862f76e
        new failure (last pass: renesas-next-2023-03-16-v6.3-rc1)

    2023-03-30T18:26:06.371057  + set +x

    2023-03-30T18:26:06.377562  [   19.389034] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9821775_1.5.2.3.1>

    2023-03-30T18:26:06.483912  / # #

    2023-03-30T18:26:06.585112  export SHELL=3D/bin/sh

    2023-03-30T18:26:06.585785  #

    2023-03-30T18:26:06.687293  / # export SHELL=3D/bin/sh. /lava-9821775/e=
nvironment

    2023-03-30T18:26:06.687553  =


    2023-03-30T18:26:06.788697  / # . /lava-9821775/environment/lava-982177=
5/bin/lava-test-runner /lava-9821775/1

    2023-03-30T18:26:06.789989  =


    2023-03-30T18:26:06.796097  / # /lava-9821775/bin/lava-test-runner /lav=
a-9821775/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cfabe9e49158c362f7a3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425cfabe9e49158c362f7a8
        failing since 76 days (last pass: renesas-next-2022-11-21-v6.1-rc1,=
 first fail: renesas-next-2023-01-12-v6.2-rc1)

    2023-03-30T18:06:09.792733  + set +x

    2023-03-30T18:06:09.798836  <8>[   20.012063] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9821423_1.5.2.3.1>

    2023-03-30T18:06:09.908043  / # #

    2023-03-30T18:06:10.009050  export SHELL=3D/bin/sh

    2023-03-30T18:06:10.009225  #

    2023-03-30T18:06:10.109926  / # export SHELL=3D/bin/sh. /lava-9821423/e=
nvironment

    2023-03-30T18:06:10.110109  =


    2023-03-30T18:06:10.210981  / # . /lava-9821423/environment/lava-982142=
3/bin/lava-test-runner /lava-9821423/1

    2023-03-30T18:06:10.211331  =


    2023-03-30T18:06:10.216512  / # /lava-9821423/bin/lava-test-runner /lav=
a-9821423/1
 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cf628b83e139cb62f79b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425cf628b83e139cb62f7a0
        new failure (last pass: renesas-next-2023-03-16-v6.3-rc1)

    2023-03-30T18:05:09.923505  [   18.590001] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9821356_1.5.2.3.1>

    2023-03-30T18:05:10.028419  / # #

    2023-03-30T18:05:10.129413  export SHELL=3D/bin/sh

    2023-03-30T18:05:10.129652  #

    2023-03-30T18:05:10.230565  / # export SHELL=3D/bin/sh. /lava-9821356/e=
nvironment

    2023-03-30T18:05:10.230813  =


    2023-03-30T18:05:10.331768  / # . /lava-9821356/environment/lava-982135=
6/bin/lava-test-runner /lava-9821356/1

    2023-03-30T18:05:10.332125  =


    2023-03-30T18:05:10.337389  / # /lava-9821356/bin/lava-test-runner /lav=
a-9821356/1

    2023-03-30T18:05:10.414565  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6425d530e6a0f5ec7662f76e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425d530e6a0f5ec7662f773
        new failure (last pass: renesas-next-2023-03-16-v6.3-rc1)

    2023-03-30T18:29:57.041425  [   15.526967] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9821786_1.5.2.3.1>

    2023-03-30T18:29:57.147452  / # #

    2023-03-30T18:29:57.250401  export SHELL=3D/bin/sh

    2023-03-30T18:29:57.251221  #

    2023-03-30T18:29:57.352798  / # export SHELL=3D/bin/sh. /lava-9821786/e=
nvironment

    2023-03-30T18:29:57.353037  =


    2023-03-30T18:29:57.454052  / # . /lava-9821786/environment/lava-982178=
6/bin/lava-test-runner /lava-9821786/1

    2023-03-30T18:29:57.454516  =


    2023-03-30T18:29:57.459103  / # /lava-9821786/bin/lava-test-runner /lav=
a-9821786/1

    2023-03-30T18:29:57.567274  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/6425d54a0e456ccfef62f784

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425d54a0e456ccfef62f789
        new failure (last pass: renesas-next-2023-03-16-v6.3-rc1)

    2023-03-30T18:30:23.923672  + set +x

    2023-03-30T18:30:23.926887  <8>[   23.092178] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9821736_1.5.2.3.1>

    2023-03-30T18:30:24.035277  / # #

    2023-03-30T18:30:24.136244  export SHELL=3D/bin/sh

    2023-03-30T18:30:24.136426  #

    2023-03-30T18:30:24.237356  / # export SHELL=3D/bin/sh. /lava-9821736/e=
nvironment

    2023-03-30T18:30:24.237549  =


    2023-03-30T18:30:24.338481  / # . /lava-9821736/environment/lava-982173=
6/bin/lava-test-runner /lava-9821736/1

    2023-03-30T18:30:24.338802  =


    2023-03-30T18:30:24.343742  / # /lava-9821736/bin/lava-test-runner /lav=
a-9821736/1
 =

    ... (12 line(s) more)  =


  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/6425d54a0e4=
56ccfef62f78b
        failing since 19 days (last pass: renesas-next-2023-03-06-v6.3-rc1,=
 first fail: renesas-next-2023-03-10-v6.3-rc1)
        3 lines

    2023-03-30T18:30:23.867634  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-03-30T18:30:23.874105  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-03-30T18:30:23.880913  <6>[   23.040072] platform AMDI5682:00: def=
erred probe pending

    2023-03-30T18:30:23.884045  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-03-30T18:30:23.920322  <8>[   23.082105] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cf57320f81a7da62f76b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425cf57320f81a7da62f770
        new failure (last pass: renesas-next-2023-03-16-v6.3-rc1)

    2023-03-30T18:05:03.151293  <8>[   17.172678] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9821375_1.5.2.3.1>

    2023-03-30T18:05:03.154717  + set +x

    2023-03-30T18:05:03.259395  / # #

    2023-03-30T18:05:03.360390  export SHELL=3D/bin/sh

    2023-03-30T18:05:03.360599  #

    2023-03-30T18:05:03.461485  / # export SHELL=3D/bin/sh. /lava-9821375/e=
nvironment

    2023-03-30T18:05:03.461687  =


    2023-03-30T18:05:03.562632  / # . /lava-9821375/environment/lava-982137=
5/bin/lava-test-runner /lava-9821375/1

    2023-03-30T18:05:03.562894  =


    2023-03-30T18:05:03.567856  / # /lava-9821375/bin/lava-test-runner /lav=
a-9821375/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6425d3cf86db1ded8262f786

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425d3cf86db1ded8262f78b
        new failure (last pass: renesas-next-2023-03-16-v6.3-rc1)

    2023-03-30T18:23:50.385526  + set +x

    2023-03-30T18:23:50.392352  <8>[   21.666108] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9821739_1.5.2.3.1>

    2023-03-30T18:23:50.498199  / # #

    2023-03-30T18:23:50.600817  export SHELL=3D/bin/sh

    2023-03-30T18:23:50.601686  #

    2023-03-30T18:23:50.703600  / # export SHELL=3D/bin/sh. /lava-9821739/e=
nvironment

    2023-03-30T18:23:50.704512  =


    2023-03-30T18:23:50.806253  / # . /lava-9821739/environment/lava-982173=
9/bin/lava-test-runner /lava-9821739/1

    2023-03-30T18:23:50.807444  =


    2023-03-30T18:23:50.812405  / # /lava-9821739/bin/lava-test-runner /lav=
a-9821739/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6425d43e7afe66faad62f76d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425d43e7afe66faad62f772
        new failure (last pass: renesas-next-2023-03-16-v6.3-rc1)

    2023-03-30T18:25:46.236181  [   16.460476] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9821772_1.5.2.3.1>

    2023-03-30T18:25:46.239795  + set +x

    2023-03-30T18:25:46.342515  =


    2023-03-30T18:25:46.443698  / # #export SHELL=3D/bin/sh

    2023-03-30T18:25:46.443919  =


    2023-03-30T18:25:46.544839  / # export SHELL=3D/bin/sh. /lava-9821772/e=
nvironment

    2023-03-30T18:25:46.545109  =


    2023-03-30T18:25:46.646105  / # . /lava-9821772/environment/lava-982177=
2/bin/lava-test-runner /lava-9821772/1

    2023-03-30T18:25:46.646383  =


    2023-03-30T18:25:46.651337  / # /lava-9821772/bin/lava-test-runner /lav=
a-9821772/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
at91sam9g20ek                | arm    | lab-broonie   | gcc-10   | at91_dt_=
defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6425d2e95c38161b4362f828

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at91s=
am9g20ek.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at91s=
am9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/armel/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6425d2e95c38161b4=
362f829
        new failure (last pass: renesas-next-2023-03-16-v6.3-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cfa9e9e49158c362f796

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425cfa9e9e49158c362f79b
        new failure (last pass: renesas-next-2023-03-16-v6.3-rc1)

    2023-03-30T18:06:08.728213  + set<8>[   18.203829] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9821406_1.5.2.3.1>

    2023-03-30T18:06:08.728311   +x

    2023-03-30T18:06:08.832584  / # #

    2023-03-30T18:06:08.933691  export SHELL=3D/bin/sh

    2023-03-30T18:06:08.933877  #

    2023-03-30T18:06:09.034740  / # export SHELL=3D/bin/sh. /lava-9821406/e=
nvironment

    2023-03-30T18:06:09.034924  =


    2023-03-30T18:06:09.135606  / # . /lava-9821406/environment/lava-982140=
6/bin/lava-test-runner /lava-9821406/1

    2023-03-30T18:06:09.135885  =


    2023-03-30T18:06:09.140561  / # /lava-9821406/bin/lava-test-runner /lav=
a-9821406/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6425d3f770a361e7ce62f77b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425d3f770a361e7ce62f77e
        new failure (last pass: renesas-next-2023-03-16-v6.3-rc1)

    2023-03-30T18:24:47.304573  + set +x

    2023-03-30T18:24:47.310945  <8>[   40.902625] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9821722_1.5.2.3.1>

    2023-03-30T18:24:47.421952  #

    2023-03-30T18:24:47.523262  / # #export SHELL=3D/bin/sh

    2023-03-30T18:24:47.523548  =


    2023-03-30T18:24:47.624437  / # export SHELL=3D/bin/sh. /lava-9821722/e=
nvironment

    2023-03-30T18:24:47.624652  =


    2023-03-30T18:24:47.725564  / # . /lava-9821722/environment/lava-982172=
2/bin/lava-test-runner /lava-9821722/1

    2023-03-30T18:24:47.725907  =


    2023-03-30T18:24:47.731873  / # /lava-9821722/bin/lava-test-runner /lav=
a-9821722/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6425d48b37bf8cab2262f793

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425d48b37bf8cab2262f798
        new failure (last pass: renesas-next-2023-03-16-v6.3-rc1)

    2023-03-30T18:27:02.217521  + set +x[   18.657264] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9821776_1.5.2.3.1>

    2023-03-30T18:27:02.217963  =


    2023-03-30T18:27:02.325675  / # #

    2023-03-30T18:27:02.428549  export SHELL=3D/bin/sh

    2023-03-30T18:27:02.429317  #

    2023-03-30T18:27:02.531240  / # export SHELL=3D/bin/sh. /lava-9821776/e=
nvironment

    2023-03-30T18:27:02.531927  =


    2023-03-30T18:27:02.633709  / # . /lava-9821776/environment/lava-982177=
6/bin/lava-test-runner /lava-9821776/1

    2023-03-30T18:27:02.634780  =


    2023-03-30T18:27:02.639426  / # /lava-9821776/bin/lava-test-runner /lav=
a-9821776/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cf53efd0acca2262f7dc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425cf53efd0acca2262f7e1
        new failure (last pass: renesas-next-2023-03-16-v6.3-rc1)

    2023-03-30T18:04:47.657096  + set +x[   17.442735] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9821399_1.5.2.3.1>

    2023-03-30T18:04:47.657186  =


    2023-03-30T18:04:47.761896  / # #

    2023-03-30T18:04:47.863194  export SHELL=3D/bin/sh

    2023-03-30T18:04:47.863422  #

    2023-03-30T18:04:47.964290  / # export SHELL=3D/bin/sh. /lava-9821399/e=
nvironment

    2023-03-30T18:04:47.964520  =


    2023-03-30T18:04:48.065418  / # . /lava-9821399/environment/lava-982139=
9/bin/lava-test-runner /lava-9821399/1

    2023-03-30T18:04:48.065759  =


    2023-03-30T18:04:48.070974  / # /lava-9821399/bin/lava-test-runner /lav=
a-9821399/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6425d3eb746cbee34862f7f4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425d3eb746cbee34862f7f9
        new failure (last pass: renesas-next-2023-03-16-v6.3-rc1)

    2023-03-30T18:24:33.081555  + <8>[   98.369585] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9821730_1.5.2.3.1>

    2023-03-30T18:24:33.084999  set +x

    2023-03-30T18:24:33.194167  / # #

    2023-03-30T18:24:33.297092  export SHELL=3D/bin/sh

    2023-03-30T18:24:33.297966  #

    2023-03-30T18:24:33.399806  / # export SHELL=3D/bin/sh. /lava-9821730/e=
nvironment

    2023-03-30T18:24:33.400702  =


    2023-03-30T18:24:33.502475  / # . /lava-9821730/environment/lava-982173=
0/bin/lava-test-runner /lava-9821730/1

    2023-03-30T18:24:33.503909  =


    2023-03-30T18:24:33.509028  / # /lava-9821730/bin/lava-test-runner /lav=
a-9821730/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6425d434d64cc4221162f7ea

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425d434d64cc4221162f7ef
        new failure (last pass: renesas-next-2023-03-16-v6.3-rc1)

    2023-03-30T18:25:48.836837  + set +x

    2023-03-30T18:25:48.842789  <8>[   17.301450] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9821803_1.5.2.3.1>

    2023-03-30T18:25:48.947986  / # #

    2023-03-30T18:25:49.049036  export SHELL=3D/bin/sh

    2023-03-30T18:25:49.049334  #

    2023-03-30T18:25:49.150118  / # export SHELL=3D/bin/sh. /lava-9821803/e=
nvironment

    2023-03-30T18:25:49.150402  =


    2023-03-30T18:25:49.251409  / # . /lava-9821803/environment/lava-982180=
3/bin/lava-test-runner /lava-9821803/1

    2023-03-30T18:25:49.251802  =


    2023-03-30T18:25:49.256667  / # /lava-9821803/bin/lava-test-runner /lav=
a-9821803/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cf648b83e139cb62f7a6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425cf648b83e139cb62f7ab
        new failure (last pass: renesas-next-2023-03-16-v6.3-rc1)

    2023-03-30T18:04:58.447926  <8>[   17.995604] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9821365_1.5.2.3.1>

    2023-03-30T18:04:58.557337  / # #

    2023-03-30T18:04:58.659617  export SHELL=3D/bin/sh

    2023-03-30T18:04:58.660525  #

    2023-03-30T18:04:58.762476  / # export SHELL=3D/bin/sh. /lava-9821365/e=
nvironment

    2023-03-30T18:04:58.763409  =


    2023-03-30T18:04:58.865447  / # . /lava-9821365/environment/lava-982136=
5/bin/lava-test-runner /lava-9821365/1

    2023-03-30T18:04:58.866875  =


    2023-03-30T18:04:58.871869  / # /lava-9821365/bin/lava-test-runner /lav=
a-9821365/1

    2023-03-30T18:04:58.974045  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6425d3b7f6753be89462f791

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425d3b7f6753be89462f796
        new failure (last pass: renesas-next-2023-03-16-v6.3-rc1)

    2023-03-30T18:23:44.781088  + set +x

    2023-03-30T18:23:44.784247  <8>[   24.572109] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9821737_1.5.2.3.1>

    2023-03-30T18:23:44.893200  / # #

    2023-03-30T18:23:44.995769  export SHELL=3D/bin/sh

    2023-03-30T18:23:44.996591  #

    2023-03-30T18:23:45.098489  / # export SHELL=3D/bin/sh. /lava-9821737/e=
nvironment

    2023-03-30T18:23:45.099299  =


    2023-03-30T18:23:45.201342  / # . /lava-9821737/environment/lava-982173=
7/bin/lava-test-runner /lava-9821737/1

    2023-03-30T18:23:45.202557  =


    2023-03-30T18:23:45.207845  / # /lava-9821737/bin/lava-test-runner /lav=
a-9821737/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6425d442d9f4c9d28962f7b1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425d442d9f4c9d28962f7b6
        new failure (last pass: renesas-next-2023-03-06-v6.3-rc1)

    2023-03-30T18:25:58.719356  [   18.089373] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9821787_1.5.2.3.1>

    2023-03-30T18:25:58.823902  / # #

    2023-03-30T18:25:58.924943  export SHELL=3D/bin/sh

    2023-03-30T18:25:58.925143  #

    2023-03-30T18:25:59.025952  / # export SHELL=3D/bin/sh. /lava-9821787/e=
nvironment

    2023-03-30T18:25:59.026162  =


    2023-03-30T18:25:59.127082  / # . /lava-9821787/environment/lava-982178=
7/bin/lava-test-runner /lava-9821787/1

    2023-03-30T18:25:59.127389  =


    2023-03-30T18:25:59.131843  / # /lava-9821787/bin/lava-test-runner /lav=
a-9821787/1

    2023-03-30T18:25:59.207248  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6425e3827b117c7a3f62f792

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-nfs-kont=
ron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-nfs-kont=
ron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6425e3827b117c7a3=
f62f793
        failing since 19 days (last pass: renesas-next-2023-01-24-v6.2-rc1,=
 first fail: renesas-next-2023-03-10-v6.3-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6425e52752dcc5338462f76d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-nfs-ko=
ntron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-nfs-ko=
ntron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6425e52752dcc5338=
462f76e
        failing since 14 days (last pass: renesas-next-2023-01-30-v6.2-rc1,=
 first fail: renesas-next-2023-03-16-v6.3-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6425e88393e3fa524762f76f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/arm64/defconfig+kselftest/gcc-10/lab-kontron/baseline-nfs-k=
ontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/arm64/defconfig+kselftest/gcc-10/lab-kontron/baseline-nfs-k=
ontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6425e88393e3fa524=
762f770
        failing since 19 days (last pass: renesas-next-2023-01-30-v6.2-rc1,=
 first fail: renesas-next-2023-03-10-v6.3-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6425e9d7587384390b62f76b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-nfs-kontr=
on-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-nfs-kontr=
on-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6425e9d7587384390=
b62f76c
        failing since 19 days (last pass: renesas-next-2023-01-30-v6.2-rc1,=
 first fail: renesas-next-2023-03-10-v6.3-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6425eade2975e0bc3062f812

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kbo=
x-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kbo=
x-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6425eade2975e0bc3=
062f813
        failing since 19 days (last pass: renesas-next-2023-01-24-v6.2-rc1,=
 first fail: renesas-next-2023-03-10-v6.3-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cf55b2652fff9b62f7ad

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425cf55b2652fff9b62f7b2
        new failure (last pass: renesas-next-2023-03-16-v6.3-rc1)

    2023-03-30T18:05:03.620577  + set[   17.831432] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9821364_1.5.2.3.1>

    2023-03-30T18:05:03.620661   +x

    2023-03-30T18:05:03.724981  / # #

    2023-03-30T18:05:03.825878  export SHELL=3D/bin/sh

    2023-03-30T18:05:03.826062  #

    2023-03-30T18:05:03.926968  / # export SHELL=3D/bin/sh. /lava-9821364/e=
nvironment

    2023-03-30T18:05:03.927140  =


    2023-03-30T18:05:04.028199  / # . /lava-9821364/environment/lava-982136=
4/bin/lava-test-runner /lava-9821364/1

    2023-03-30T18:05:04.028449  =


    2023-03-30T18:05:04.033632  / # /lava-9821364/bin/lava-test-runner /lav=
a-9821364/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6425d3aad7f8eaa1b762f789

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425d3aad7f8eaa1b762f78e
        new failure (last pass: renesas-next-2023-03-16-v6.3-rc1)

    2023-03-30T18:23:33.448011  + set +x

    2023-03-30T18:23:33.451558  [   23.279868] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9821701_1.5.2.3.1>

    2023-03-30T18:23:33.558658  / # #

    2023-03-30T18:23:33.659957  export SHELL=3D/bin/sh

    2023-03-30T18:23:33.660165  #

    2023-03-30T18:23:33.761163  / # export SHELL=3D/bin/sh. /lava-9821701/e=
nvironment

    2023-03-30T18:23:33.761925  =


    2023-03-30T18:23:33.863723  / # . /lava-9821701/environment/lava-982170=
1/bin/lava-test-runner /lava-9821701/1

    2023-03-30T18:23:33.864574  =


    2023-03-30T18:23:33.869911  / # /lava-9821701/bin/lava-test-runner /lav=
a-9821701/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6425d44b0913ae90f662f77b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6425d44b0913ae90f662f780
        new failure (last pass: renesas-next-2023-03-16-v6.3-rc1)

    2023-03-30T18:26:06.355610  [   15.571360] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9821785_1.5.2.3.1>

    2023-03-30T18:26:06.460166  / # #

    2023-03-30T18:26:06.561308  export SHELL=3D/bin/sh

    2023-03-30T18:26:06.561558  #

    2023-03-30T18:26:06.662517  / # export SHELL=3D/bin/sh. /lava-9821785/e=
nvironment

    2023-03-30T18:26:06.662738  =


    2023-03-30T18:26:06.763691  / # . /lava-9821785/environment/lava-982178=
5/bin/lava-test-runner /lava-9821785/1

    2023-03-30T18:26:06.763995  =


    2023-03-30T18:26:06.769457  / # /lava-9821785/bin/lava-test-runner /lav=
a-9821785/1

    2023-03-30T18:26:06.817520  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6425db4af862057d0162f779

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-nfs-me=
son-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-nfs-me=
son-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6425db4af862057d0=
162f77a
        new failure (last pass: renesas-next-2023-03-16-v6.3-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/6425d1918201036d3462f832

  Results:     165 PASS, 6 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.panel-edp-probed: https://kernelci.org/test/case/id=
/6425d1918201036d3462f876
        failing since 24 days (last pass: renesas-next-2023-01-24-v6.2-rc1,=
 first fail: renesas-next-2023-03-06-v6.3-rc1)

    2023-03-30T18:14:09.918359  /lava-9821531/1/../bin/lava-test-case

    2023-03-30T18:14:09.952250  <8>[   38.459750] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/tes=
t/case/id/6425d1918201036d3462f8d4
        failing since 24 days (last pass: renesas-next-2023-01-24-v6.2-rc1,=
 first fail: renesas-next-2023-03-06-v6.3-rc1)

    2023-03-30T18:14:03.529182  /lava-9821531/1/../bin/lava-test-case

    2023-03-30T18:14:03.563163  <8>[   32.070861] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/te=
st/case/id/6425d1918201036d3462f8d5
        failing since 24 days (last pass: renesas-next-2023-01-24-v6.2-rc1,=
 first fail: renesas-next-2023-03-06-v6.3-rc1)

    2023-03-30T18:14:02.430704  /lava-9821531/1/../bin/lava-test-case

    2023-03-30T18:14:02.463828  <8>[   30.971838] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/6425d56cd31cdf092562f7a8

  Results:     165 PASS, 6 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.panel-edp-probed: https://kernelci.org/test/case/id=
/6425d56cd31cdf092562f7f3
        failing since 19 days (last pass: renesas-next-2023-01-30-v6.2-rc1,=
 first fail: renesas-next-2023-03-10-v6.3-rc1)

    2023-03-30T18:30:37.956827  /lava-9821860/1/../bin/lava-test-case

    2023-03-30T18:30:37.992827  [   39.578724] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/tes=
t/case/id/6425d56cd31cdf092562f822
        failing since 19 days (last pass: renesas-next-2023-01-30-v6.2-rc1,=
 first fail: renesas-next-2023-03-10-v6.3-rc1)

    2023-03-30T18:30:31.646331  /lava-9821860/1/../bin/lava-test-case

    2023-03-30T18:30:31.678450  [   33.264503] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/te=
st/case/id/6425d56cd31cdf092562f823
        failing since 19 days (last pass: renesas-next-2023-01-30-v6.2-rc1,=
 first fail: renesas-next-2023-03-10-v6.3-rc1)

    2023-03-30T18:30:30.561026  /lava-9821860/1/../bin/lava-test-case

    2023-03-30T18:30:30.590281  [   32.176808] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/6425d1a932cad8876462f7b2

  Results:     176 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/te=
st/case/id/6425d1a932cad8876462f82f
        failing since 24 days (last pass: renesas-next-2023-01-24-v6.2-rc1,=
 first fail: renesas-next-2023-03-06-v6.3-rc1)

    2023-03-30T18:14:23.686408  /lava-9821572/1/../bin/lava-test-case

    2023-03-30T18:14:23.715067  [   30.056763] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/te=
st/case/id/6425d1a932cad8876462f830
        failing since 24 days (last pass: renesas-next-2023-01-24-v6.2-rc1,=
 first fail: renesas-next-2023-03-06-v6.3-rc1)

    2023-03-30T18:14:22.605553  /lava-9821572/1/../bin/lava-test-case

    2023-03-30T18:14:22.638885  [   28.980529] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/tes=
t/case/id/6425d1a932cad8876462f843
        failing since 24 days (last pass: renesas-next-2023-01-24-v6.2-rc1,=
 first fail: renesas-next-2023-03-06-v6.3-rc1)

    2023-03-30T18:14:24.756838  /lava-9821572/1/../bin/lava-test-case

    2023-03-30T18:14:24.784288  [   31.126401] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/6425d641ce6b9f24ce62f77a

  Results:     176 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/te=
st/case/id/6425d641ce6b9f24ce62f7e7
        failing since 19 days (last pass: renesas-next-2023-01-30-v6.2-rc1,=
 first fail: renesas-next-2023-03-10-v6.3-rc1)

    2023-03-30T18:34:08.812722  /lava-9821855/1/../bin/lava-test-case

    2023-03-30T18:34:08.852410  [   29.838276] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/tes=
t/case/id/6425d641ce6b9f24ce62f80e
        failing since 19 days (last pass: renesas-next-2023-01-30-v6.2-rc1,=
 first fail: renesas-next-2023-03-10-v6.3-rc1)

    2023-03-30T18:34:10.976339  /lava-9821855/1/../bin/lava-test-case

    2023-03-30T18:34:11.016694  [   32.002353] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/te=
st/case/id/6425d641ce6b9f24ce62f80f
        failing since 19 days (last pass: renesas-next-2023-01-30-v6.2-rc1,=
 first fail: renesas-next-2023-03-10-v6.3-rc1)

    2023-03-30T18:34:09.896055  /lava-9821855/1/../bin/lava-test-case

    2023-03-30T18:34:09.935832  [   30.921873] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6425fafa580378886862f77d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-nfs-sun50=
i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-nfs-sun50=
i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6425fafa580378886=
862f77e
        new failure (last pass: renesas-next-2023-03-10-v6.3-rc1) =

 =20
