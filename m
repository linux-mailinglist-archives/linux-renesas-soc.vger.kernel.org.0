Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD407B072B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Sep 2023 16:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232163AbjI0OmW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Sep 2023 10:42:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232123AbjI0OmV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Sep 2023 10:42:21 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 533EEF4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Sep 2023 07:42:18 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1c09673b006so82651485ad.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Sep 2023 07:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695825737; x=1696430537; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xDEqtz22XU0LwFiUfP5yp9DTEvOzzf9NB6lp3iKgL8A=;
        b=AyMUfSM9v1oeJbrrM67rFHavhkeVfZ1ACwlgzX5PSR/IBMznOBYMbRIcD+6z+2NbGO
         xrOeP2yfiT8ryvy3kGTYqXJWv73RA9YvbIUrncAXFltJPsXATVRDDxiZEgfJQfiI9cat
         QBejRyUKkAgaoBblElHr33oEuTWuUSQX2t19MsSW6pxnScY8O3Mwy735sJs2oBicDaFz
         LweM5fRvApzGJhf1leu4bYfiVaZzIDf3FnUgXPr/JEdgJLla4g5UlIpbIWL0osm6yOBX
         ZYC/sHv84On46PMIM5cGYwzCBPyofTYlVZSZLABtv+1mLiF3BmfSJvzCukqIycZ2MJpM
         aVeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695825737; x=1696430537;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xDEqtz22XU0LwFiUfP5yp9DTEvOzzf9NB6lp3iKgL8A=;
        b=IoC2nrxF1P/YZMyNYMDi1UqRipskpLHxRUZmLO7sMzlwXp0cVJEcIcWbWvcef30WcO
         lx/dvGfaAfWj5NbOXb3KxOpcuXUOwww898cBwNDJFYwDiRbv+exqopuvqsGNmWFwwV7f
         N5pQcO53GSgP7dtOHSdUiF29SRJmF9PQbHa72V5Ef+FekvtIkxFnhIoYT4BSfB2rIknj
         BpmAuWevJVthGix6+oK1WsHqbp9iSkkuX5T/QTaIKRlhJOoQ8OrSMlEDRpNy3qdZtpoe
         Nv9SrB+thplw+gJHdOvyh3DccZ30+0guTvrhjhGJSQZ3clsm6AIClq8ddjiX/GjuyWdj
         0ybg==
X-Gm-Message-State: AOJu0YyS2tk3fjailbEZIl+Lp+kTGyaSaqJBTV3Eehxi+8qdJJaklZfr
        6cKDnYwwPU53bNqJ5UG28oyX0pxeXVIelS2F2uDijQ==
X-Google-Smtp-Source: AGHT+IEqrHqQIKU2E1OOFhQnFVqTCH0gQ2tr8nXdoPYVvoZe+Kw4nmdQUi3P3OaW+6Qb4Xr2BYc7UA==
X-Received: by 2002:a17:902:d4d2:b0:1c5:9d28:b2bb with SMTP id o18-20020a170902d4d200b001c59d28b2bbmr1980129plg.33.1695825737233;
        Wed, 27 Sep 2023 07:42:17 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id b8-20020a170902d50800b001bf11cf2e21sm13096203plg.210.2023.09.27.07.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 07:42:16 -0700 (PDT)
Message-ID: <65143f48.170a0220.77c10.5242@mx.google.com>
Date:   Wed, 27 Sep 2023 07:42:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-09-27-v6.6-rc3
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 50 runs,
 5 regressions (renesas-devel-2023-09-27-v6.6-rc3)
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

renesas/master baseline: 50 runs, 5 regressions (renesas-devel-2023-09-27-v=
6.6-rc3)

Regressions Summary
-------------------

platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
imx8mp-evk         | arm64 | lab-broonie   | gcc-10   | defconfig | 1      =
    =

r8a774c0-ek874     | arm64 | lab-cip       | gcc-10   | defconfig | 1      =
    =

r8a77960-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =

r8a779m1-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =

sun50i-h6-pine-h64 | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-09-27-v6.6-rc3/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-09-27-v6.6-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      8ef2954909a55f94e5eb8777c18c1d8b0678e3e7 =



Test Regressions
---------------- =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
imx8mp-evk         | arm64 | lab-broonie   | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65140e94df91a68ef48a0b69

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-27-v6.6-rc3/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.t=
xt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-27-v6.6-rc3/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65140e94df91a68ef48a0b72
        failing since 15 days (last pass: renesas-devel-2023-08-28-v6.5, fi=
rst fail: renesas-devel-2023-09-11-v6.6-rc1)

    2023-09-27T11:14:06.368726  <8>[   28.270903] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2023-09-27T11:14:06.376063  + set<8>[   28.280472] <LAVA_SIGNAL_ENDRUN =
0_dmesg 135954_1.5.2.4.1>
    2023-09-27T11:14:06.376637   +x
    2023-09-27T11:14:06.485230  / ##
    2023-09-27T11:14:07.650842  export SHELL=3D/bin/sh
    2023-09-27T11:14:07.657006   #
    2023-09-27T11:14:09.155936  / # export SHELL=3D/bin/sh. /lava-135954/en=
vironment
    2023-09-27T11:14:09.161941  =

    2023-09-27T11:14:11.885443  / # . /lava-135954/environment/lava-135954/=
bin/lava-test-runner /lava-135954/1
    2023-09-27T11:14:11.892173   =

    ... (13 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a774c0-ek874     | arm64 | lab-cip       | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65140f3003cab40a308a0ab5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-27-v6.6-rc3/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.t=
xt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-27-v6.6-rc3/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65140f3003cab40a308a0abc
        failing since 71 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-09-27T11:16:45.356232  / # #
    2023-09-27T11:16:46.815907  export SHELL=3D/bin/sh
    2023-09-27T11:16:46.836406  #
    2023-09-27T11:16:46.836653  / # export SHELL=3D/bin/sh
    2023-09-27T11:16:48.789784  / # . /lava-1013649/environment
    2023-09-27T11:16:52.383429  /lava-1013649/bin/lava-test-runner /lava-10=
13649/1
    2023-09-27T11:16:52.404200  . /lava-1013649/environment
    2023-09-27T11:16:52.404330  / # /lava-1013649/bin/lava-test-runner /lav=
a-1013649/1
    2023-09-27T11:16:52.445157  + export 'TESTRUN_ID=3D1_bootrr'
    2023-09-27T11:16:52.497988  + cd /lava-1013649/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a77960-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65140e6464c6929c408a0aa2

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-27-v6.6-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-u=
lcb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-27-v6.6-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-u=
lcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65140e6464c6929c408a0aab
        failing since 71 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-09-27T11:17:45.349188  / # #

    2023-09-27T11:17:45.449704  export SHELL=3D/bin/sh

    2023-09-27T11:17:45.449858  #

    2023-09-27T11:17:45.550330  / # export SHELL=3D/bin/sh. /lava-11627257/=
environment

    2023-09-27T11:17:45.550462  =


    2023-09-27T11:17:45.650967  / # . /lava-11627257/environment/lava-11627=
257/bin/lava-test-runner /lava-11627257/1

    2023-09-27T11:17:45.651218  =


    2023-09-27T11:17:45.663047  / # /lava-11627257/bin/lava-test-runner /la=
va-11627257/1

    2023-09-27T11:17:45.716800  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-27T11:17:45.716881  + cd /lav<8>[   20.309537] <LAVA_SIGNAL_STA=
RTRUN 1_bootrr 11627257_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a779m1-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65140e78df91a68ef48a0a42

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-27-v6.6-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-u=
lcb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-27-v6.6-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-u=
lcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65140e78df91a68ef48a0a4b
        failing since 71 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-09-27T11:13:54.618882  / # #

    2023-09-27T11:13:55.694866  export SHELL=3D/bin/sh

    2023-09-27T11:13:55.696175  #

    2023-09-27T11:13:57.183357  / # export SHELL=3D/bin/sh. /lava-11627256/=
environment

    2023-09-27T11:13:57.185117  =


    2023-09-27T11:13:59.900488  / # . /lava-11627256/environment/lava-11627=
256/bin/lava-test-runner /lava-11627256/1

    2023-09-27T11:13:59.902568  =


    2023-09-27T11:13:59.914296  / # /lava-11627256/bin/lava-test-runner /la=
va-11627256/1

    2023-09-27T11:13:59.973473  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-27T11:13:59.973889  + cd /lava-116272<8>[   28.454608] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11627256_1.5.2.4.5>
 =

    ... (44 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
sun50i-h6-pine-h64 | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65140e7764c6929c408a0ada

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-27-v6.6-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-=
pine-h64.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-27-v6.6-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-=
pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65140e7764c6929c408a0ae3
        failing since 71 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-09-27T11:17:57.337239  / # #

    2023-09-27T11:17:57.439307  export SHELL=3D/bin/sh

    2023-09-27T11:17:57.439963  #

    2023-09-27T11:17:57.541209  / # export SHELL=3D/bin/sh. /lava-11627266/=
environment

    2023-09-27T11:17:57.541483  =


    2023-09-27T11:17:57.642182  / # . /lava-11627266/environment/lava-11627=
266/bin/lava-test-runner /lava-11627266/1

    2023-09-27T11:17:57.643370  =


    2023-09-27T11:17:57.645507  / # /lava-11627266/bin/lava-test-runner /la=
va-11627266/1

    2023-09-27T11:17:57.727553  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-27T11:17:57.728079  + cd /lava-11627266/1/tests/1_boot<8>[   18=
.327222] <LAVA_SIGNAL_STARTRUN 1_bootrr 11627266_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
