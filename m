Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95D3C72C9E8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jun 2023 17:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235386AbjFLPZh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Jun 2023 11:25:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240345AbjFLPZF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jun 2023 11:25:05 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA5BB1734
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jun 2023 08:25:00 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-653bed78635so3038568b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jun 2023 08:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1686583500; x=1689175500;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c7na4yb6BdilxgzNJvkEuOYcPb+GbmKR+khpStmnD8g=;
        b=kjeDSFkEf2SQbKXLZ9rSJYF1jfGR8iP3VyGOCL8KIHRcLGRTiwMPPw8P1RinwoFcBT
         rJn9m8UqZHC4qRWQSLH1rzOhs0zpBPxmCP9bXyM54PxBrieeREpJ+ZJrnEb0yAOEb8Ui
         maN+F5PLUv/hqcqDOtYx5kWYm4ttM/rK1SO+wad2EpSI5Ciaks/UR6tqwKLwCq4HiF/5
         clyALK19R87Mt1QJR2cHxguaRpr4F13z7kVo5BNsegEGhhMNWvC+9j/Si0gV3fdLoxkW
         E3sk3vdb/WFZea+DSIehQpEjMQkZZM4X7DF0hrLZ4mhvODYbfYEfzbFP2BM5gJ/tvj6K
         fk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686583500; x=1689175500;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c7na4yb6BdilxgzNJvkEuOYcPb+GbmKR+khpStmnD8g=;
        b=VvnOt9aL2h5t/r/IVP/Fz1liYWKtPqb0PUfuI/OCCwfZ2TF3bkrP8LMkQcNHN1k6iu
         3JZ6xwY+DtsbK6hAdp4D5Y6dsW+XgZdJJ3EitvR4DsGefUYTrhOLuez9ugamjlCJvQqH
         pyGL5Z2ws4ctATV4DqSXVSjD4JS076Fmoq+ZKGgsaxWo5WwGMWDfk0hIFh4ez1ql9750
         OGvfThTupxUvghY7P0pZuCBT7BMtX1dj+WzmFYxB7efTL1tO/rhgELajhu34/cxoxS2f
         V+cCq/tzMrrVRN9y9JRAK2vIT1n2fGvy8LlTG/cknz6zMpjtrfLjdPxITHaVR0om4Io5
         ZcUw==
X-Gm-Message-State: AC+VfDxzaFrb+Ec1ez/c7hpfhilya9gLRbuoQm+H60HSvMWE2lBrLS9A
        HHgJHW+BUta8DSPQVeYJPCg5AcPmai0N6V+klYFc1g==
X-Google-Smtp-Source: ACHHUZ4LVWdgx5/27GGBuQIr8wXJgVrarQGW1OCdlKUKPiXrFCt93z506Uyte40rypAlHPBerAyd6w==
X-Received: by 2002:a17:90b:3887:b0:256:9b5c:2aa2 with SMTP id mu7-20020a17090b388700b002569b5c2aa2mr11243061pjb.6.1686583497130;
        Mon, 12 Jun 2023 08:24:57 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id s23-20020a17090a1c1700b0025be4c602d5sm2207573pjs.38.2023.06.12.08.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 08:24:56 -0700 (PDT)
Message-ID: <648738c8.170a0220.60616.3fed@mx.google.com>
Date:   Mon, 12 Jun 2023 08:24:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2023-06-12-v6.4-rc6
Subject: renesas/master baseline-nfs: 181 runs,
 51 regressions (renesas-devel-2023-06-12-v6.4-rc6)
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

renesas/master baseline-nfs: 181 runs, 51 regressions (renesas-devel-2023-0=
6-12-v6.4-rc6)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

at91sam9g20ek                | arm    | lab-broonie     | gcc-10   | at91_d=
t_defconfig            | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

beaglebone-black             | arm    | lab-cip         | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10   | omap2p=
lus_defconfig          | 1          =

beaglebone-black             | arm    | lab-cip         | gcc-10   | omap2p=
lus_defconfig          | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

kontron-kswitch-d10-mmt-8g   | arm    | lab-kontron     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 2          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-06-12-v6.4-rc6/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-06-12-v6.4-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      eec974413697190538e69788efc6048763f9b64e =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6487016e16ad80f989306163

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-acer-cb317-1h-c3z6-dedede.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-acer-cb317-1h-c3z6-dedede.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6487016e16ad80f989306168
        failing since 63 days (last pass: renesas-devel-2023-04-04-v6.3-rc5=
, first fail: renesas-devel-2023-04-10-v6.3-rc6)

    2023-06-12T11:28:39.123721  <8>[   24.320346] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10688449_1.5.2.3.1>

    2023-06-12T11:28:39.126933  + set +x

    2023-06-12T11:28:39.231600  / # #

    2023-06-12T11:28:39.334158  export SHELL=3D/bin/sh

    2023-06-12T11:28:39.334966  #

    2023-06-12T11:28:39.436504  / # export SHELL=3D/bin/sh. /lava-10688449/=
environment

    2023-06-12T11:28:39.437307  =


    2023-06-12T11:28:39.538870  / # . /lava-10688449/environment/lava-10688=
449/bin/lava-test-runner /lava-10688449/1

    2023-06-12T11:28:39.540142  =


    2023-06-12T11:28:39.546078  / # /lava-10688449/bin/lava-test-runner /la=
va-10688449/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6486ffb552a6f104c030616e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6486ffb552a6f104c0306173
        failing since 73 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-12T11:21:10.934896  + set +x

    2023-06-12T11:21:10.942209  [   19.295556] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10688318_1.5.2.3.1>

    2023-06-12T11:21:11.051211  / # #

    2023-06-12T11:21:11.153919  export SHELL=3D/bin/sh

    2023-06-12T11:21:11.154749  #

    2023-06-12T11:21:11.256471  / # export SHELL=3D/bin/sh. /lava-10688318/=
environment

    2023-06-12T11:21:11.257303  =


    2023-06-12T11:21:11.359124  / # . /lava-10688318/environment/lava-10688=
318/bin/lava-test-runner /lava-10688318/1

    2023-06-12T11:21:11.360403  =


    2023-06-12T11:21:11.366916  / # /lava-10688318/bin/lava-test-runner /la=
va-10688318/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6487016f3eee4807fc306130

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6487016f3eee4807fc306135
        failing since 73 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-12T11:28:35.038648  + set +x

    2023-06-12T11:28:35.045042  <8>[   25.646286] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10688447_1.5.2.3.1>

    2023-06-12T11:28:35.157624  #

    2023-06-12T11:28:35.260233  / # #export SHELL=3D/bin/sh

    2023-06-12T11:28:35.260945  =


    2023-06-12T11:28:35.362267  / # export SHELL=3D/bin/sh. /lava-10688447/=
environment

    2023-06-12T11:28:35.362980  =


    2023-06-12T11:28:35.464517  / # . /lava-10688447/environment/lava-10688=
447/bin/lava-test-runner /lava-10688447/1

    2023-06-12T11:28:35.465979  =


    2023-06-12T11:28:35.507855  / # /lava-10688447/bin/lava-test-runner /la=
va-10688447/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6487043eca735370ba306143

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6487043eca735370ba306148
        failing since 73 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-12T11:40:38.699659  + set +x

    2023-06-12T11:40:38.706359  [   18.793957] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10688754_1.5.2.3.1>

    2023-06-12T11:40:38.817016  / # #

    2023-06-12T11:40:38.919208  export SHELL=3D/bin/sh

    2023-06-12T11:40:38.919981  #

    2023-06-12T11:40:39.021457  / # export SHELL=3D/bin/sh. /lava-10688754/=
environment

    2023-06-12T11:40:39.022263  =


    2023-06-12T11:40:39.123750  / # . /lava-10688754/environment/lava-10688=
754/bin/lava-test-runner /lava-10688754/1

    2023-06-12T11:40:39.125015  =


    2023-06-12T11:40:39.130450  / # /lava-10688754/bin/lava-test-runner /la=
va-10688754/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6486ffc9b0b1e38ba6306172

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6486ffc9b0b1e38ba6306177
        failing since 73 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-12T11:21:27.546935  + set +x

    2023-06-12T11:21:27.553236  <8>[   24.350748] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10688342_1.5.2.3.1>

    2023-06-12T11:21:27.662795  / # #

    2023-06-12T11:21:27.765315  export SHELL=3D/bin/sh

    2023-06-12T11:21:27.766104  #

    2023-06-12T11:21:27.867641  / # export SHELL=3D/bin/sh. /lava-10688342/=
environment

    2023-06-12T11:21:27.868413  =


    2023-06-12T11:21:27.969985  / # . /lava-10688342/environment/lava-10688=
342/bin/lava-test-runner /lava-10688342/1

    2023-06-12T11:21:27.971208  =


    2023-06-12T11:21:27.976552  / # /lava-10688342/bin/lava-test-runner /la=
va-10688342/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6486ffa64b1982036130612f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6486ffa64b19820361306134
        failing since 73 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-12T11:20:59.009476  <8>[   18.096957] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10688355_1.5.2.3.1>

    2023-06-12T11:20:59.114272  / # #

    2023-06-12T11:20:59.214841  export SHELL=3D/bin/sh

    2023-06-12T11:20:59.214987  #

    2023-06-12T11:20:59.315491  / # export SHELL=3D/bin/sh. /lava-10688355/=
environment

    2023-06-12T11:20:59.315631  =


    2023-06-12T11:20:59.416136  / # . /lava-10688355/environment/lava-10688=
355/bin/lava-test-runner /lava-10688355/1

    2023-06-12T11:20:59.416428  =


    2023-06-12T11:20:59.421203  / # /lava-10688355/bin/lava-test-runner /la=
va-10688355/1

    2023-06-12T11:20:59.498575  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/6487015fc81373d2a6306139

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6487015fc81373d2a630613e
        failing since 73 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-12T11:28:20.252630  + <8>[   25.461047] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10688464_1.5.2.3.1>

    2023-06-12T11:28:20.253203  set +x

    2023-06-12T11:28:20.363788  / # #

    2023-06-12T11:28:20.466228  export SHELL=3D/bin/sh

    2023-06-12T11:28:20.467043  #<6>[   25.577486] platform AMDI5682:00: de=
ferred probe pending

    2023-06-12T11:28:20.467476  =


    2023-06-12T11:28:20.569079  / # export SHELL=3D/bin/sh. /lava-10688464/=
environment

    2023-06-12T11:28:20.569917  =


    2023-06-12T11:28:20.671661  / # . /lava-10688464/environment/lava-10688=
464/bin/lava-test-runner /lava-10688464/1

    2023-06-12T11:28:20.672905  =

 =

    ... (13 line(s) more)  =


  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/6487015fc81=
373d2a6306140
        failing since 87 days (last pass: renesas-devel-2023-03-07-v6.3-rc1=
, first fail: renesas-devel-2023-03-16-v6.3-rc2)
        3 lines

    2023-06-12T11:28:20.199154  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-06-12T11:28:20.205611  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-06-12T11:28:20.212163  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-06-12T11:28:20.246141  <8>[   25.451207] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64870452ce54f4b10130617b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64870452ce54f4b101306180
        failing since 73 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-12T11:40:43.538817  + <8>[   19.116182] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10688798_1.5.2.3.1>

    2023-06-12T11:40:43.539396  set +x

    2023-06-12T11:40:43.649449  / # #

    2023-06-12T11:40:43.751968  export SHELL=3D/bin/sh

    2023-06-12T11:40:43.752775  #

    2023-06-12T11:40:43.854428  / # export SHELL=3D/bin/sh. /lava-10688798/=
environment

    2023-06-12T11:40:43.855215  =


    2023-06-12T11:40:43.956812  / # . /lava-10688798/environment/lava-10688=
798/bin/lava-test-runner /lava-10688798/1

    2023-06-12T11:40:43.958099  =


    2023-06-12T11:40:43.963664  / # /lava-10688798/bin/lava-test-runner /la=
va-10688798/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6486ffb552a6f104c0306163

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6486ffb552a6f104c0306168
        failing since 73 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-12T11:21:15.249904  + set +x

    2023-06-12T11:21:15.256276  <8>[   21.836609] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10688328_1.5.2.3.1>

    2023-06-12T11:21:15.366578  / # #

    2023-06-12T11:21:15.467147  export SHELL=3D/bin/sh

    2023-06-12T11:21:15.467326  #

    2023-06-12T11:21:15.567814  / # export SHELL=3D/bin/sh. /lava-10688328/=
environment

    2023-06-12T11:21:15.567987  =


    2023-06-12T11:21:15.668512  / # . /lava-10688328/environment/lava-10688=
328/bin/lava-test-runner /lava-10688328/1

    2023-06-12T11:21:15.668876  =


    2023-06-12T11:21:15.674087  / # /lava-10688328/bin/lava-test-runner /la=
va-10688328/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64870163c81373d2a630614a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64870163c81373d2a630614f
        failing since 73 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-12T11:28:15.422207  <8>[   22.934388] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10688471_1.5.2.3.1>

    2023-06-12T11:28:15.425374  + set +x

    2023-06-12T11:28:15.529951  / # #

    2023-06-12T11:28:15.630553  export SHELL=3D/bin/sh

    2023-06-12T11:28:15.630785  #

    2023-06-12T11:28:15.731306  / # export SHELL=3D/bin/sh. /lava-10688471/=
environment

    2023-06-12T11:28:15.731503  =


    2023-06-12T11:28:15.831995  / # . /lava-10688471/environment/lava-10688=
471/bin/lava-test-runner /lava-10688471/1

    2023-06-12T11:28:15.832280  =


    2023-06-12T11:28:15.837500  / # /lava-10688471/bin/lava-test-runner /la=
va-10688471/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64870440bb140ef42230615a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64870440bb140ef42230615f
        failing since 73 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-12T11:40:39.133741  [   20.409184] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10688763_1.5.2.3.1>

    2023-06-12T11:40:39.136447  + set +x

    2023-06-12T11:40:39.240863  / # #

    2023-06-12T11:40:39.341498  export SHELL=3D/bin/sh

    2023-06-12T11:40:39.341708  #

    2023-06-12T11:40:39.442324  / # export SHELL=3D/bin/sh. /lava-10688763/=
environment

    2023-06-12T11:40:39.442512  =


    2023-06-12T11:40:39.543009  / # . /lava-10688763/environment/lava-10688=
763/bin/lava-test-runner /lava-10688763/1

    2023-06-12T11:40:39.543266  =


    2023-06-12T11:40:39.548263  / # /lava-10688763/bin/lava-test-runner /la=
va-10688763/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91sam9g20ek                | arm    | lab-broonie     | gcc-10   | at91_d=
t_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6486ffd07c93984b2330612f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at=
91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at=
91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armel/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6486ffd07c93984b2=
3306130
        new failure (last pass: renesas-devel-2023-06-06-v6.4-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/648705b35fef00383e306146

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/multi_v7_defconfig+ima/gcc-10/lab-broonie/baseline-n=
fs-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/multi_v7_defconfig+ima/gcc-10/lab-broonie/baseline-n=
fs-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/648705b35fef00383=
e306147
        failing since 13 days (last pass: renesas-devel-2023-05-22-v6.4-rc3=
, first fail: renesas-devel-2023-05-30-v6.4-rc4) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/648706087dd28e740230620c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baselin=
e-nfs-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baselin=
e-nfs-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/648706087dd28e740=
230620d
        failing since 33 days (last pass: renesas-devel-2023-04-21-v6.3-rc7=
, first fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-cip         | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6487035d3e650e6567306172

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/bas=
eline-nfs-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/bas=
eline-nfs-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6487035d3e650e656=
7306173
        failing since 6 days (last pass: renesas-devel-2023-06-05-v6.4-rc5,=
 first fail: renesas-devel-2023-06-06-v6.4-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/648704a0d056edc53b306138

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/omap2plus_defconfig/gcc-10/lab-broonie/baseline-nfs-=
beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/omap2plus_defconfig/gcc-10/lab-broonie/baseline-nfs-=
beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/648704a0d056edc53=
b306139
        new failure (last pass: renesas-devel-2023-06-05-v6.4-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-cip         | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6487062ac0c604a62e306137

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/omap2plus_defconfig/gcc-10/lab-cip/baseline-nfs-beag=
lebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/omap2plus_defconfig/gcc-10/lab-cip/baseline-nfs-beag=
lebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6487062ac0c604a62=
e306138
        new failure (last pass: renesas-devel-2023-06-05-v6.4-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6486ffa1e6d8b5b5af306142

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6486ffa1e6d8b5b5af306147
        failing since 73 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-12T11:20:57.322802  + [   18.314593] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 10688335_1.5.2.3.1>

    2023-06-12T11:20:57.326558  set +x

    2023-06-12T11:20:57.431050  / # #

    2023-06-12T11:20:57.531988  export SHELL=3D/bin/sh

    2023-06-12T11:20:57.532674  #

    2023-06-12T11:20:57.634043  / # export SHELL=3D/bin/sh. /lava-10688335/=
environment

    2023-06-12T11:20:57.634741  =


    2023-06-12T11:20:57.736061  / # . /lava-10688335/environment/lava-10688=
335/bin/lava-test-runner /lava-10688335/1

    2023-06-12T11:20:57.737177  =


    2023-06-12T11:20:57.741915  / # /lava-10688335/bin/lava-test-runner /la=
va-10688335/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64870181220e42d745306159

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64870181220e42d74530615e
        failing since 73 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-12T11:28:48.200899  + set +x

    2023-06-12T11:28:48.207751  <8>[   36.541358] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10688453_1.5.2.3.1>

    2023-06-12T11:28:48.320097  #

    2023-06-12T11:28:48.422692  / # #export SHELL=3D/bin/sh

    2023-06-12T11:28:48.423414  =


    2023-06-12T11:28:48.524786  / # export SHELL=3D/bin/sh. /lava-10688453/=
environment

    2023-06-12T11:28:48.525474  =


    2023-06-12T11:28:48.626769  / # . /lava-10688453/environment/lava-10688=
453/bin/lava-test-runner /lava-10688453/1

    2023-06-12T11:28:48.627085  =


    2023-06-12T11:28:48.631872  / # /lava-10688453/bin/lava-test-runner /la=
va-10688453/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64870430bb140ef42230613f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64870430bb140ef422306144
        failing since 73 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-12T11:40:11.727883  + set +x[   22.896607] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10688800_1.5.2.3.1>

    2023-06-12T11:40:11.727984  =


    2023-06-12T11:40:11.832399  / # #

    2023-06-12T11:40:11.933041  export SHELL=3D/bin/sh

    2023-06-12T11:40:11.933255  #

    2023-06-12T11:40:12.033756  / # export SHELL=3D/bin/sh. /lava-10688800/=
environment

    2023-06-12T11:40:12.033964  =


    2023-06-12T11:40:12.134523  / # . /lava-10688800/environment/lava-10688=
800/bin/lava-test-runner /lava-10688800/1

    2023-06-12T11:40:12.134860  =


    2023-06-12T11:40:12.139475  / # /lava-10688800/bin/lava-test-runner /la=
va-10688800/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6487015bca5b9c32d63061d1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6487015bca5b9c32d63061d6
        failing since 73 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-12T11:28:14.333834  + set[   32.416842] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10688455_1.5.2.3.1>

    2023-06-12T11:28:14.333913   +x

    2023-06-12T11:28:14.438245  / # #

    2023-06-12T11:28:14.538821  export SHELL=3D/bin/sh

    2023-06-12T11:28:14.539009  #

    2023-06-12T11:28:14.639529  / # export SHELL=3D/bin/sh. /lava-10688455/=
environment

    2023-06-12T11:28:14.639726  =


    2023-06-12T11:28:14.740252  / # . /lava-10688455/environment/lava-10688=
455/bin/lava-test-runner /lava-10688455/1

    2023-06-12T11:28:14.740550  =


    2023-06-12T11:28:14.745376  / # /lava-10688455/bin/lava-test-runner /la=
va-10688455/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6487042a90fce0d4fa306183

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6487042a90fce0d4fa306188
        failing since 73 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-12T11:40:11.732264  + [   17.579312] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 10688773_1.5.2.3.1>

    2023-06-12T11:40:11.735695  set +x

    2023-06-12T11:40:11.841065  / # #

    2023-06-12T11:40:11.943284  export SHELL=3D/bin/sh

    2023-06-12T11:40:11.943959  #

    2023-06-12T11:40:12.045533  / # export SHELL=3D/bin/sh. /lava-10688773/=
environment

    2023-06-12T11:40:12.046222  =


    2023-06-12T11:40:12.147700  / # . /lava-10688773/environment/lava-10688=
773/bin/lava-test-runner /lava-10688773/1

    2023-06-12T11:40:12.148773  =


    2023-06-12T11:40:12.154188  / # /lava-10688773/bin/lava-test-runner /la=
va-10688773/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6486ffa8e6d8b5b5af306179

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6486ffa8e6d8b5b5af30617e
        failing since 73 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-12T11:20:58.164690  [   18.091505] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10688362_1.5.2.3.1>

    2023-06-12T11:20:58.268696  / # #

    2023-06-12T11:20:58.369263  export SHELL=3D/bin/sh

    2023-06-12T11:20:58.369425  #

    2023-06-12T11:20:58.469969  / # export SHELL=3D/bin/sh. /lava-10688362/=
environment

    2023-06-12T11:20:58.470138  =


    2023-06-12T11:20:58.570663  / # . /lava-10688362/environment/lava-10688=
362/bin/lava-test-runner /lava-10688362/1

    2023-06-12T11:20:58.570902  =


    2023-06-12T11:20:58.576361  / # /lava-10688362/bin/lava-test-runner /la=
va-10688362/1

    2023-06-12T11:20:58.652641  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64870180220e42d74530614b

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64870180220e42d745306150
        failing since 73 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-12T11:28:53.148449  + set +x

    2023-06-12T11:28:53.151681  [   23.365955] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10688491_1.5.2.3.1>

    2023-06-12T11:28:53.266636  / # #

    2023-06-12T11:28:53.368604  export SHELL=3D/bin/sh

    2023-06-12T11:28:53.368800  #

    2023-06-12T11:28:53.368878  / # export SHELL=3D/bin/sh[   23.553931] pl=
atform AMDI5682:00: deferred probe pending

    2023-06-12T11:28:53.469331  . /lava-10688491/environment

    2023-06-12T11:28:53.469520  =


    2023-06-12T11:28:53.570024  / # . /lava-10688491/environment/lava-10688=
491/bin/lava-test-runner /lava-10688491/1

    2023-06-12T11:28:53.570314  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6487042e90fce0d4fa3061b9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6487042e90fce0d4fa3061be
        failing since 73 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-12T11:40:18.983170  [   17.264166] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10688794_1.5.2.3.1>

    2023-06-12T11:40:19.087388  / # #

    2023-06-12T11:40:19.188057  export SHELL=3D/bin/sh

    2023-06-12T11:40:19.188280  #

    2023-06-12T11:40:19.288849  / # export SHELL=3D/bin/sh. /lava-10688794/=
environment

    2023-06-12T11:40:19.289057  =


    2023-06-12T11:40:19.389621  / # . /lava-10688794/environment/lava-10688=
794/bin/lava-test-runner /lava-10688794/1

    2023-06-12T11:40:19.389950  =


    2023-06-12T11:40:19.394701  / # /lava-10688794/bin/lava-test-runner /la=
va-10688794/1

    2023-06-12T11:40:19.471074  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6487029c4f62e959ce30626e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6487029c4f62e959ce306273
        failing since 97 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-06-12T11:33:39.296612  + set +x
    2023-06-12T11:33:39.296944  [   27.215912] <LAVA_SIGNAL_ENDRUN 0_dmesg =
974304_1.6.2.3.1>
    2023-06-12T11:33:39.413292  #
    2023-06-12T11:33:39.515056  / # #export SHELL=3D/bin/sh
    2023-06-12T11:33:39.515546  =

    2023-06-12T11:33:39.616703  / # export SHELL=3D/bin/sh. /lava-974304/en=
vironment
    2023-06-12T11:33:39.617139  =

    2023-06-12T11:33:39.718298  / # . /lava-974304/environment/lava-974304/=
bin/lava-test-runner /lava-974304/1
    2023-06-12T11:33:39.718791  =

    2023-06-12T11:33:39.721788  / # /lava-974304/bin/lava-test-runner /lava=
-974304/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64870738e6780391a530613c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64870738e6780391a5306141
        failing since 97 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-06-12T11:53:14.177581  + set +x
    2023-06-12T11:53:14.177776  [   28.296064] <LAVA_SIGNAL_ENDRUN 0_dmesg =
974313_1.6.2.3.1>
    2023-06-12T11:53:14.292129  #
    2023-06-12T11:53:14.393945  / # #export SHELL=3D/bin/sh
    2023-06-12T11:53:14.394321  =

    2023-06-12T11:53:14.495506  / # export SHELL=3D/bin/sh. /lava-974313/en=
vironment
    2023-06-12T11:53:14.495937  =

    2023-06-12T11:53:14.597305  / # . /lava-974313/environment/lava-974313/=
bin/lava-test-runner /lava-974313/1
    2023-06-12T11:53:14.597978  =

    2023-06-12T11:53:14.601073  / # /lava-974313/bin/lava-test-runner /lava=
-974313/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/648709905c9103ec1e306130

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/648709905c9103ec1e306135
        failing since 97 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-06-12T12:03:03.361676  + set +x
    2023-06-12T12:03:03.362012  [   29.850668] <LAVA_SIGNAL_ENDRUN 0_dmesg =
974330_1.6.2.3.1>
    2023-06-12T12:03:03.471634  #
    2023-06-12T12:03:03.573548  / # #export SHELL=3D/bin/sh
    2023-06-12T12:03:03.574048  =

    2023-06-12T12:03:03.675362  / # export SHELL=3D/bin/sh. /lava-974330/en=
vironment
    2023-06-12T12:03:03.675905  =

    2023-06-12T12:03:03.777305  / # . /lava-974330/environment/lava-974330/=
bin/lava-test-runner /lava-974330/1
    2023-06-12T12:03:03.778073  =

    2023-06-12T12:03:03.781338  / # /lava-974330/bin/lava-test-runner /lava=
-974330/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/64870e2ceeb1b6a8a9306147

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64870e2ceeb1b6a8a930614c
        failing since 97 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-06-12T12:22:51.097817  + set +x
    2023-06-12T12:22:51.098051  [   30.840084] <LAVA_SIGNAL_ENDRUN 0_dmesg =
974343_1.6.2.3.1>
    2023-06-12T12:22:51.212975  #
    2023-06-12T12:22:51.314986  / # #export SHELL=3D/bin/sh
    2023-06-12T12:22:51.315468  =

    2023-06-12T12:22:51.416673  / # export SHELL=3D/bin/sh. /lava-974343/en=
vironment
    2023-06-12T12:22:51.417158  =

    2023-06-12T12:22:51.518440  / # . /lava-974343/environment/lava-974343/=
bin/lava-test-runner /lava-974343/1
    2023-06-12T12:22:51.519185  =

    2023-06-12T12:22:51.522169  / # /lava-974343/bin/lava-test-runner /lava=
-974343/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64870ea4e2db53c316306147

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64870ea4e2db53c31630614c
        failing since 97 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-06-12T12:24:41.871104  + set +x
    2023-06-12T12:24:41.871307  [   29.631308] <LAVA_SIGNAL_ENDRUN 0_dmesg =
974358_1.6.2.3.1>
    2023-06-12T12:24:41.980952  #
    2023-06-12T12:24:42.082924  / # #export SHELL=3D/bin/sh
    2023-06-12T12:24:42.083431  =

    2023-06-12T12:24:42.184783  / # export SHELL=3D/bin/sh. /lava-974358/en=
vironment
    2023-06-12T12:24:42.185250  =

    2023-06-12T12:24:42.286485  / # . /lava-974358/environment/lava-974358/=
bin/lava-test-runner /lava-974358/1
    2023-06-12T12:24:42.287174  =

    2023-06-12T12:24:42.290002  / # /lava-974358/bin/lava-test-runner /lava=
-974358/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kswitch-d10-mmt-8g   | arm    | lab-kontron     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/64870e93e2db53c31630613d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/multi_v7_defconfig+crypto/gcc-10/lab-kontron/baselin=
e-nfs-kontron-kswitch-d10-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/multi_v7_defconfig+crypto/gcc-10/lab-kontron/baselin=
e-nfs-kontron-kswitch-d10-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/64870e93e2db53c31=
630613e
        new failure (last pass: renesas-devel-2023-06-06-v6.4-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/648700aa1a9a45c2693061c6

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-nfs=
-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-nfs=
-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/648700aa1a9a45c2693061c9
        new failure (last pass: renesas-devel-2023-06-06-v6.4-rc5)

    2023-06-12T11:25:11.808936  / # #
    2023-06-12T11:25:11.910132  export SHELL=3D/bin/sh
    2023-06-12T11:25:11.910389  #
    2023-06-12T11:25:12.011320  / # export SHELL=3D/bin/sh. /lava-355229/en=
vironment
    2023-06-12T11:25:12.011557  =

    2023-06-12T11:25:12.112895  / # . /lava-355229/environment/lava-355229/=
bin/lava-test-runner /lava-355229/1
    2023-06-12T11:25:12.114161  =

    2023-06-12T11:25:12.123133  / # /lava-355229/bin/lava-test-runner /lava=
-355229/1
    2023-06-12T11:25:12.350733  + export TESTRUN_ID=3D1_bootrr
    2023-06-12T11:25:12.353794  + cd /lava-355229/1/tests/1_bootrr =

    ... (12 line(s) more)  =


  * baseline-nfs.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id=
/648700aa1a9a45c2693061d9
        new failure (last pass: renesas-devel-2023-06-06-v6.4-rc5)

    2023-06-12T11:25:16.292477  /lava-355229/1/../bin/lava-test-case
    2023-06-12T11:25:16.346376  [   22.224792] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6486ffa7e6d8b5b5af30616b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6486ffa7e6d8b5b5af306170
        failing since 73 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-12T11:21:04.197729  <8>[   18.400033] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10688354_1.5.2.3.1>

    2023-06-12T11:21:04.302566  / # #

    2023-06-12T11:21:04.403198  export SHELL=3D/bin/sh

    2023-06-12T11:21:04.403401  #

    2023-06-12T11:21:04.503926  / # export SHELL=3D/bin/sh. /lava-10688354/=
environment

    2023-06-12T11:21:04.504104  =


    2023-06-12T11:21:04.604628  / # . /lava-10688354/environment/lava-10688=
354/bin/lava-test-runner /lava-10688354/1

    2023-06-12T11:21:04.604896  =


    2023-06-12T11:21:04.610018  / # /lava-10688354/bin/lava-test-runner /la=
va-10688354/1

    2023-06-12T11:21:04.689320  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64870159ca5b9c32d63061bb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64870159ca5b9c32d63061c0
        failing since 73 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-12T11:28:09.163104  + set +x

    2023-06-12T11:28:09.166338  <8>[   22.341403] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10688446_1.5.2.3.1>

    2023-06-12T11:28:09.273196  / # #

    2023-06-12T11:28:09.375218  export SHELL=3D/bin/sh

    2023-06-12T11:28:09.375947  #

    2023-06-12T11:28:09.477211  / # export SHELL=3D/bin/sh. /lava-10688446/=
environment

    2023-06-12T11:28:09.477989  =


    2023-06-12T11:28:09.579404  / # . /lava-10688446/environment/lava-10688=
446/bin/lava-test-runner /lava-10688446/1

    2023-06-12T11:28:09.580485  =


    2023-06-12T11:28:09.586067  / # /lava-10688446/bin/lava-test-runner /la=
va-10688446/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6487042c899a8c0f3c306154

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6487042c899a8c0f3c306159
        failing since 73 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-12T11:40:06.900493  [   17.783978] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10688791_1.5.2.3.1>

    2023-06-12T11:40:07.005558  / # #

    2023-06-12T11:40:07.106250  export SHELL=3D/bin/sh

    2023-06-12T11:40:07.106462  #

    2023-06-12T11:40:07.207002  / # export SHELL=3D/bin/sh. /lava-10688791/=
environment

    2023-06-12T11:40:07.207260  =


    2023-06-12T11:40:07.307765  / # . /lava-10688791/environment/lava-10688=
791/bin/lava-test-runner /lava-10688791/1

    2023-06-12T11:40:07.308053  =


    2023-06-12T11:40:07.312864  / # /lava-10688791/bin/lava-test-runner /la=
va-10688791/1

    2023-06-12T11:40:07.356730  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64870400d11b8ae77d30612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-broonie/base=
line-nfs-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-broonie/base=
line-nfs-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/64870400d11b8ae77=
d30612f
        new failure (last pass: renesas-devel-2023-06-05-v6.4-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/648706f86da5a2b356306132

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-bro=
onie/baseline-nfs-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-bro=
onie/baseline-nfs-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/648706f86da5a2b35=
6306133
        new failure (last pass: renesas-devel-2023-06-06-v6.4-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/648702ef5c4407a8993061be

  Results:     28 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/648702ef5c4407a8993061d8
        new failure (last pass: renesas-devel-2023-06-05-v6.4-rc5)

    2023-06-12T11:34:49.888118  + set +x

    2023-06-12T11:34:49.894141  <8>[   28.187601] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10688613_1.6.2.3.1>

    2023-06-12T11:34:50.000766  #

    2023-06-12T11:34:50.101474  / # #export SHELL=3D/bin/sh

    2023-06-12T11:34:50.101622  =


    2023-06-12T11:34:50.202071  / # export SHELL=3D/bin/sh. /lava-10688613/=
environment

    2023-06-12T11:34:50.202218  =


    2023-06-12T11:34:50.302684  / # . /lava-10688613/environment/lava-10688=
613/bin/lava-test-runner /lava-10688613/1

    2023-06-12T11:34:50.302952  =


    2023-06-12T11:34:50.304451  / # /lava-10688613/bin/lava-test-runner /la=
va-10688613/1
 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/648703776b040824593061e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/648703776b0408245=
93061e4
        failing since 33 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/648706829586f48396306175

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/648706829586f4839=
6306176
        failing since 33 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64870365c7523d3324306143

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/64870365c7523d332=
4306144
        failing since 33 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/64870669a7767c4dc630612f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/64870669a7767c4dc=
6306130
        failing since 33 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64870bb9faa55c0413306185

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline=
-nfs-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline=
-nfs-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64870bb9faa55c0413306188
        new failure (last pass: renesas-devel-2023-06-05-v6.4-rc5)

    2023-06-12T12:12:10.346638  + set +x
    2023-06-12T12:12:10.346762  [   52.450892] <LAVA_SIGNAL_ENDRUN 0_dmesg =
960391_1.6.2.4.1>
    2023-06-12T12:12:10.530883  / # #
    2023-06-12T12:12:11.990551  export SHELL=3D/bin/sh
    2023-06-12T12:12:12.011032  #
    2023-06-12T12:12:12.011197  / # export SHELL=3D/bin/sh
    2023-06-12T12:12:13.893063  / # . /lava-960391/environment
    2023-06-12T12:12:17.344573  /lava-960391/bin/lava-test-runner /lava-960=
391/1
    2023-06-12T12:12:17.365379  . /lava-960391/environment
    2023-06-12T12:12:17.365594  / # /lava-960391/bin/lava-test-runner /lava=
-960391/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6487027b36014d1aff306163

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6487027b36014d1aff306168
        failing since 20 days (last pass: renesas-devel-2023-05-09-v6.4-rc1=
, first fail: renesas-devel-2023-05-22-v6.4-rc3)

    2023-06-12T11:33:06.667160  + <8>[   31.230118] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10688554_1.6.2.3.1>

    2023-06-12T11:33:06.671639  set +x

    2023-06-12T11:33:06.782458  / # #

    2023-06-12T11:33:06.885193  export SHELL=3D/bin/sh

    2023-06-12T11:33:06.886118  #

    2023-06-12T11:33:06.987743  / # export SHELL=3D/bin/sh. /lava-10688554/=
environment

    2023-06-12T11:33:06.988676  =


    2023-06-12T11:33:07.090333  / # . /lava-10688554/environment/lava-10688=
554/bin/lava-test-runner /lava-10688554/1

    2023-06-12T11:33:07.091584  =


    2023-06-12T11:33:07.098228  / # /lava-10688554/bin/lava-test-runner /la=
va-10688554/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/6487057f21492bc65e3061bd

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6487057f21492bc65e3061c2
        failing since 21 days (last pass: renesas-devel-2023-05-09-v6.4-rc1=
, first fail: renesas-devel-2023-05-22-v6.4-rc3)

    2023-06-12T11:45:50.050208  + set +x

    2023-06-12T11:45:50.056287  [   31.251711] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10688918_1.6.2.3.1>

    2023-06-12T11:45:50.161243  / # #

    2023-06-12T11:45:50.261974  export SHELL=3D/bin/sh

    2023-06-12T11:45:50.262201  #

    2023-06-12T11:45:50.362778  / # export SHELL=3D/bin/sh. /lava-10688918/=
environment

    2023-06-12T11:45:50.363002  =


    2023-06-12T11:45:50.463596  / # . /lava-10688918/environment/lava-10688=
918/bin/lava-test-runner /lava-10688918/1

    2023-06-12T11:45:50.463988  =


    2023-06-12T11:45:50.470641  / # /lava-10688918/bin/lava-test-runner /la=
va-10688918/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/648700bc48188cfe0e3061be

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-nfs=
-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-nfs=
-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/648700bc48188cfe0=
e3061bf
        new failure (last pass: renesas-devel-2023-06-06-v6.4-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648703b38957813994306183

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bro=
onie/baseline-nfs-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bro=
onie/baseline-nfs-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/648703b3895781399=
4306184
        failing since 6 days (last pass: renesas-devel-2023-06-05-v6.4-rc5,=
 first fail: renesas-devel-2023-06-06-v6.4-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6487041782c5441d74306145

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-nfs-sun5=
0i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-nfs-sun5=
0i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6487041782c5441d7=
4306146
        failing since 6 days (last pass: renesas-devel-2023-05-22-v6.4-rc3,=
 first fail: renesas-devel-2023-06-06-v6.4-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/648705ba5fef00383e306161

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-sun50i-h=
5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-sun50i-h=
5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/648705ba5fef00383=
e306162
        failing since 6 days (last pass: renesas-devel-2023-05-22-v6.4-rc3,=
 first fail: renesas-devel-2023-06-05-v6.4-rc5) =

 =20
