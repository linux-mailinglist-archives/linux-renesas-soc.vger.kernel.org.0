Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 066E87B5825
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Oct 2023 18:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237910AbjJBQfK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Oct 2023 12:35:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237799AbjJBQfJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Oct 2023 12:35:09 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D000B3
        for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Oct 2023 09:35:06 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-690d2e13074so13286529b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Oct 2023 09:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1696264505; x=1696869305; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4TYrrK+9QyxPVh08xk8ugYlX0D+fFdB0h8UIsneEKlw=;
        b=NImXfvhisRwRyCp8GJXxmJRUyoDg86K1cZ7vxCKyD0SpsvQkvD0Id41iXYynf/FKuH
         SkQJ0iyU+hkNFtVcJz0EkyModUf/7IT+Eq1ciq1rz2Wq6bsDy8FFCd63uQH5xMJlRtQ5
         xG8xhohw+bsk7MTI/KEYCnjE033CyS9Hl98ZkA3fAdAXQidtzRmwnGzBL5wFkJMLiEv+
         xH92LDGlobReC790TBy692CiQady8n70sGYEbBTyxNsXVy78ScxKX7UqPhppLgt9hHAd
         zF48IJg724QsE3FvWn2guYkZjaDx8PwuAFEKKQzfPKCCK/Ni7fnR/P0iXGiKqq/m7zuw
         FXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696264505; x=1696869305;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4TYrrK+9QyxPVh08xk8ugYlX0D+fFdB0h8UIsneEKlw=;
        b=WnVmGD9A8IynCmWV5O6O2LhGqGIpN831EjYs+0CYebF47/+z4PvhSBfyy78+N7SA2i
         NuSl0laLotX+8skzVMkzMyQgAyUFyNiEDiieWkf3Fa67SEdbGuijIU/PWIR1U0vzFliJ
         iZ7MOjQOI67zk3xlux1ycK+kIDA8amIToS615tyeBnBvNm4+z8T46JsMrhtKcKZcXzqX
         kIPf8A1bbkdKghCneHXI70kM2WXlD/JWdYV2tkJuFDwcYfv49COweo2cwY+dq4i1Erud
         no2N2jZuASfHptkWviXU7M6VswuzwqPpCrLy8ii3tNtDIJDxu6tWaO+gGUWF4DFG+kct
         y+Xg==
X-Gm-Message-State: AOJu0YwW04kcoFzPxU5ScuVvO737GC6PYWNI6Nx5c8fXnBdRzlhQFdwO
        4KWiiX/vKg3UKgobIBwoNF5cCUvr+opnGv/gvT8Vcw==
X-Google-Smtp-Source: AGHT+IGKJGsUCTAit395dRvI3RREDRjDp0YlxEwXQwnGfJcwNzodEPw+RLB+lqQtJI1Y7kIq3ZKjQw==
X-Received: by 2002:a05:6a00:15c7:b0:68f:da2a:6370 with SMTP id o7-20020a056a0015c700b0068fda2a6370mr13230296pfu.13.1696264505094;
        Mon, 02 Oct 2023 09:35:05 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id fk3-20020a056a003a8300b00690daae925bsm19754992pfb.51.2023.10.02.09.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 09:35:04 -0700 (PDT)
Message-ID: <651af138.050a0220.53c37.5310@mx.google.com>
Date:   Mon, 02 Oct 2023 09:35:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-10-02-v6.6-rc4
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 49 runs,
 4 regressions (renesas-devel-2023-10-02-v6.6-rc4)
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

renesas/master baseline: 49 runs, 4 regressions (renesas-devel-2023-10-02-v=
6.6-rc4)

Regressions Summary
-------------------

platform                 | arch  | lab           | compiler | defconfig | r=
egressions
-------------------------+-------+---------------+----------+-----------+--=
----------
imx8mp-evk               | arm64 | lab-broonie   | gcc-10   | defconfig | 1=
          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | gcc-10   | defconfig | 1=
          =

r8a77960-ulcb            | arm64 | lab-collabora | gcc-10   | defconfig | 1=
          =

r8a779m1-ulcb            | arm64 | lab-collabora | gcc-10   | defconfig | 1=
          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-10-02-v6.6-rc4/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-10-02-v6.6-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      e7f4ce54899fc69930f8d28194311678b5e3d64b =



Test Regressions
---------------- =



platform                 | arch  | lab           | compiler | defconfig | r=
egressions
-------------------------+-------+---------------+----------+-----------+--=
----------
imx8mp-evk               | arm64 | lab-broonie   | gcc-10   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/651aeff082778bdb5c8a0a55

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-02-v6.6-rc4/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.t=
xt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-02-v6.6-rc4/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/651aeff082778bdb5c8a0a5e
        failing since 20 days (last pass: renesas-devel-2023-08-28-v6.5, fi=
rst fail: renesas-devel-2023-09-11-v6.6-rc1)

    2023-10-02T16:29:12.734207  + set<8>[   27.022865] <LAVA_SIGNAL_ENDRUN =
0_dmesg 146696_1.5.2.4.1>
    2023-10-02T16:29:12.734528   +x
    2023-10-02T16:29:12.840145  / # #
    2023-10-02T16:29:13.999974  export SHELL=3D/bin/sh
    2023-10-02T16:29:14.005529  #
    2023-10-02T16:29:15.498012  / # export SHELL=3D/bin/sh. /lava-146696/en=
vironment
    2023-10-02T16:29:15.503980  =

    2023-10-02T16:29:18.224893  / # . /lava-146696/environment/lava-146696/=
bin/lava-test-runner /lava-146696/1
    2023-10-02T16:29:18.231601  =

    2023-10-02T16:29:18.238434  / # /lava-146696/bin/lava-test-runner /lava=
-146696/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch  | lab           | compiler | defconfig | r=
egressions
-------------------------+-------+---------------+----------+-----------+--=
----------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | gcc-10   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/651ac53732f13d6fc18a0a8b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-02-v6.6-rc4/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774a1-hihope-=
rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-02-v6.6-rc4/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774a1-hihope-=
rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/651ac53732f13d6fc18a0a92
        failing since 76 days (last pass: renesas-devel-2023-06-06-v6.4-rc5=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-10-02T13:26:50.783974  + set +x
    2023-10-02T13:26:50.787178  <8>[   27.397657] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1015884_1.5.2.4.1>
    2023-10-02T13:26:50.894676  / # #
    2023-10-02T13:26:52.358953  export SHELL=3D/bin/sh
    2023-10-02T13:26:52.379867  #
    2023-10-02T13:26:52.380321  / # export SHELL=3D/bin/sh
    2023-10-02T13:26:54.338359  / # . /lava-1015884/environment
    2023-10-02T13:26:57.939780  /lava-1015884/bin/lava-test-runner /lava-10=
15884/1
    2023-10-02T13:26:57.961241  . /lava-1015884/environment
    2023-10-02T13:26:57.961653  / # /lava-1015884/bin/lava-test-runner /lav=
a-1015884/1 =

    ... (27 line(s) more)  =

 =



platform                 | arch  | lab           | compiler | defconfig | r=
egressions
-------------------------+-------+---------------+----------+-----------+--=
----------
r8a77960-ulcb            | arm64 | lab-collabora | gcc-10   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/651ac056bef916abdb8a0b06

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-02-v6.6-rc4/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-u=
lcb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-02-v6.6-rc4/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-u=
lcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/651ac056bef916abdb8a0b0f
        failing since 76 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-10-02T13:10:34.817849  / # #

    2023-10-02T13:10:34.918265  export SHELL=3D/bin/sh

    2023-10-02T13:10:34.918400  #

    2023-10-02T13:10:35.018810  / # export SHELL=3D/bin/sh. /lava-11659784/=
environment

    2023-10-02T13:10:35.018952  =


    2023-10-02T13:10:35.119388  / # . /lava-11659784/environment/lava-11659=
784/bin/lava-test-runner /lava-11659784/1

    2023-10-02T13:10:35.119556  =


    2023-10-02T13:10:35.131888  / # /lava-11659784/bin/lava-test-runner /la=
va-11659784/1

    2023-10-02T13:10:35.185440  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-02T13:10:35.185503  + cd /lava-116597<8>[   19.306221] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11659784_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform                 | arch  | lab           | compiler | defconfig | r=
egressions
-------------------------+-------+---------------+----------+-----------+--=
----------
r8a779m1-ulcb            | arm64 | lab-collabora | gcc-10   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/651ac083593056fde58a0a95

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-02-v6.6-rc4/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-u=
lcb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-02-v6.6-rc4/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-u=
lcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/651ac083593056fde58a0a9e
        failing since 76 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-10-02T13:07:04.500383  / # #

    2023-10-02T13:07:05.577454  export SHELL=3D/bin/sh

    2023-10-02T13:07:05.579221  #

    2023-10-02T13:07:07.067141  / # export SHELL=3D/bin/sh. /lava-11659778/=
environment

    2023-10-02T13:07:07.068970  =


    2023-10-02T13:07:09.790656  / # . /lava-11659778/environment/lava-11659=
778/bin/lava-test-runner /lava-11659778/1

    2023-10-02T13:07:09.793003  =


    2023-10-02T13:07:09.800312  / # /lava-11659778/bin/lava-test-runner /la=
va-11659778/1

    2023-10-02T13:07:09.862526  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-02T13:07:09.863029  + cd /lav<8>[   28.518286] <LAVA_SIGNAL_STA=
RTRUN 1_bootrr 11659778_1.5.2.4.5>
 =

    ... (39 line(s) more)  =

 =20
