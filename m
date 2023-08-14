Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FCA977BF5C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Aug 2023 19:53:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231440AbjHNRxJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Aug 2023 13:53:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231801AbjHNRxF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Aug 2023 13:53:05 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67707E0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Aug 2023 10:53:04 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-686ba97e4feso4423436b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Aug 2023 10:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1692035583; x=1692640383;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mpu5BGBzNodOX35Get1QWjQAt5vvAbp9WBRuasWYofU=;
        b=kJycpoDZP8r3PKXJb1TJb2DoJPE8BttplfYlk4+AmDyMcZsqiikddG1Ah233NP8YWs
         UcdUnyuF+2+iQG4irlwUyh1iGQEFCwZmS0AfpMkOeUlABfHuibniU9obrZTBT5Bj9sqb
         iRffgEt1R3abxLIYtg5UsCKaliYsukKaU0hL+CYRMT+5B+5WAzLo7pW3tUGlcPL1/3Ew
         PfPppGkMKBJ901as9dQx4vHRA/4fRC9OEBxSi0dOlI59/gmInerNZMbtU+V7oKsiyYnC
         87t1Pqg2zq5xvO1C67abujjOQn5qjsdGMycOXgpqpXfI/Cuiq6gXXw43sc6x7UftQLKn
         wb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692035583; x=1692640383;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mpu5BGBzNodOX35Get1QWjQAt5vvAbp9WBRuasWYofU=;
        b=WBPYO3xK/lCa+TEpttUDgmkTAOtuAJ/cUrKjA1ZX2KGUUh9ASGn77rbd6E0uZEJ2iN
         kp7sbHdYp26bD31dpUoZRNwmPK/KrzwdwT8p72fqJ4uxyy7RW7+aSasMMcBTeu/UIEOg
         bhtHPyxuXvSSzAfR8OttcHovgC8jon8JBWFpQCHWz4C7b6Oo67ZG4H5dUrcbzaMMHmif
         Cos9Y8ss3gq5U4oqF5NxpgYDVOwvT2FLkrnAVGnUILACN2AYF25IqLfBiGb1IOto0U9u
         DKGwvyAOSlhOnojzefgPksz8sqVZ+elU/DVLhX7/YMhQCWJCAMfJQTF+oDuSwqnWMUTK
         6pEA==
X-Gm-Message-State: AOJu0YyQFdhOylFSG46FBN8YAJ7TZ+Br8upaz3q3myW9+X08SHSyr9KY
        g43RRmkhhd1sTU2ZM5VHD4J3agWY8aHbrNtl6vLqJw==
X-Google-Smtp-Source: AGHT+IGTCT69bY3vG/5kL4zwlEJ0fO0J3/TDaNzynk8upUoGLVLM195xTxN4oS2nEBwZjW5zL3Icaw==
X-Received: by 2002:a05:6a20:325a:b0:138:48d7:4a31 with SMTP id hm26-20020a056a20325a00b0013848d74a31mr11475323pzc.62.1692035583245;
        Mon, 14 Aug 2023 10:53:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 17-20020aa79111000000b00677af363905sm8066870pfh.59.2023.08.14.10.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 10:53:02 -0700 (PDT)
Message-ID: <64da69fe.a70a0220.83852.e0af@mx.google.com>
Date:   Mon, 14 Aug 2023 10:53:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2023-08-14-v6.5-rc4
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline: 36 runs,
 4 regressions (renesas-devel-2023-08-14-v6.5-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 36 runs, 4 regressions (renesas-devel-2023-08-14-v=
6.5-rc4)

Regressions Summary
-------------------

platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
fsl-ls2088a-rdb    | arm64 | lab-nxp       | gcc-10   | defconfig | 1      =
    =

r8a774c0-ek874     | arm64 | lab-cip       | gcc-10   | defconfig | 1      =
    =

r8a779m1-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =

sun50i-h6-pine-h64 | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-08-14-v6.5-rc4/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-08-14-v6.5-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6b779d56ab44b3b21cc3ef91a626d1b2a32bb24c =



Test Regressions
---------------- =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
fsl-ls2088a-rdb    | arm64 | lab-nxp       | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/64da35c8d3c8e7c4e735b1db

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-14-v6.5-rc4/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.=
txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-14-v6.5-rc4/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64da35c8d3c8e7c4e735b1de
        failing since 27 days (last pass: renesas-devel-2022-09-05-v6.0-rc4=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-08-14T14:09:49.773156  [   16.084174] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1243548_1.5.2.4.1>
    2023-08-14T14:09:49.878640  =

    2023-08-14T14:09:49.979841  / # #export SHELL=3D/bin/sh
    2023-08-14T14:09:49.980384  =

    2023-08-14T14:09:50.081466  / # export SHELL=3D/bin/sh. /lava-1243548/e=
nvironment
    2023-08-14T14:09:50.081952  =

    2023-08-14T14:09:50.183022  / # . /lava-1243548/environment/lava-124354=
8/bin/lava-test-runner /lava-1243548/1
    2023-08-14T14:09:50.183865  =

    2023-08-14T14:09:50.186684  / # /lava-1243548/bin/lava-test-runner /lav=
a-1243548/1
    2023-08-14T14:09:50.211486  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a774c0-ek874     | arm64 | lab-cip       | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/64da35b6a24974f5fa35b21c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-14-v6.5-rc4/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.t=
xt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-14-v6.5-rc4/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64da35b6a24974f5fa35b21f
        failing since 27 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-08-14T14:09:46.981738  / # #
    2023-08-14T14:09:48.444486  export SHELL=3D/bin/sh
    2023-08-14T14:09:48.465170  #
    2023-08-14T14:09:48.465381  / # export SHELL=3D/bin/sh
    2023-08-14T14:09:50.351387  / # . /lava-997307/environment
    2023-08-14T14:09:53.810792  /lava-997307/bin/lava-test-runner /lava-997=
307/1
    2023-08-14T14:09:53.831573  . /lava-997307/environment
    2023-08-14T14:09:53.831686  / # /lava-997307/bin/lava-test-runner /lava=
-997307/1
    2023-08-14T14:09:53.927167  + export 'TESTRUN_ID=3D1_bootrr'
    2023-08-14T14:09:53.927384  + cd /lava-997307/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a779m1-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/64da358a888e3d7a9635b21c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-14-v6.5-rc4/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-u=
lcb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-14-v6.5-rc4/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-u=
lcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64da358a888e3d7a9635b221
        failing since 27 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-08-14T14:08:49.472203  / # #

    2023-08-14T14:08:50.550559  export SHELL=3D/bin/sh

    2023-08-14T14:08:50.552334  #

    2023-08-14T14:08:52.040945  / # export SHELL=3D/bin/sh. /lava-11284342/=
environment

    2023-08-14T14:08:52.042872  =


    2023-08-14T14:08:54.762957  / # . /lava-11284342/environment/lava-11284=
342/bin/lava-test-runner /lava-11284342/1

    2023-08-14T14:08:54.765008  =


    2023-08-14T14:08:54.766585  / # /lava-11284342/bin/lava-test-runner /la=
va-11284342/1

    2023-08-14T14:08:54.834953  + export 'TESTRUN_ID=3D1_bootrr'

    2023-08-14T14:08:54.835414  + cd /lava-112843<8>[   29.496553] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11284342_1.5.2.4.5>
 =

    ... (44 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
sun50i-h6-pine-h64 | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/64da3562f97e8f21e135b221

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-14-v6.5-rc4/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-=
pine-h64.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-14-v6.5-rc4/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-=
pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64da3562f97e8f21e135b226
        failing since 27 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-08-14T14:10:03.844020  / # #

    2023-08-14T14:10:03.946134  export SHELL=3D/bin/sh

    2023-08-14T14:10:03.946866  #

    2023-08-14T14:10:04.048270  / # export SHELL=3D/bin/sh. /lava-11284351/=
environment

    2023-08-14T14:10:04.049031  =


    2023-08-14T14:10:04.150518  / # . /lava-11284351/environment/lava-11284=
351/bin/lava-test-runner /lava-11284351/1

    2023-08-14T14:10:04.151619  =


    2023-08-14T14:10:04.168193  / # /lava-11284351/bin/lava-test-runner /la=
va-11284351/1

    2023-08-14T14:10:04.237365  + export 'TESTRUN_ID=3D1_bootrr'

    2023-08-14T14:10:04.237900  + cd /lava-11284351/1/tests/1_boot<8>[   17=
.765046] <LAVA_SIGNAL_STARTRUN 1_bootrr 11284351_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
