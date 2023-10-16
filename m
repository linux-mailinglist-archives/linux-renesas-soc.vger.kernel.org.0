Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5A9A7CACEE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Oct 2023 17:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232985AbjJPPGT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Oct 2023 11:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233620AbjJPPGS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2023 11:06:18 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DEDAB9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Oct 2023 08:06:16 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-35749078a59so18995135ab.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Oct 2023 08:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1697468775; x=1698073575; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=89GNZU07+MPCfx12bkJe+5J5oMVlez4DqC+TZn9tPJY=;
        b=v6fZXy6+42V1C0Aj/6mPOKJ4hWXIC7acWqGB+HG6JrBEDJbgxqBj0ev1hGnhrz5ZhM
         Lkpw4T39Ch2bZ8CuiJJafaVwXDwwUtKvpsAHomjbawXXsXFc2zLEnGR9EPE4MGGmRdXw
         83YkS2m4HgxmR6qc4KgQVaJ+RXCNEIthaEWmahCkMrNR2YmxOY7doFP+lYW7u0C6OrIF
         6IPYJxfnPEK7WGG9D6mo0xUGgi4T1pmlFLkgXcGvqCkxdSZKZp/wfursMKHyFA7bYny6
         adXJEppV1lCOtMDQQ2qcAUi1by+FYL1ZjfUyFwU/2r5dbKyPgdcId6yIxwf9h/Kb/zcE
         aXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697468775; x=1698073575;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=89GNZU07+MPCfx12bkJe+5J5oMVlez4DqC+TZn9tPJY=;
        b=NZ/bLp5ISq2EHlbvNTXZKxK7RsE+wzRoRx+CKWQGlwU+nuwp6ri5ahvsr+ofWke5Ek
         m/P1P+y4d5VbscN1GEphWT0cpw6RqyA3aEaGshL0dxVCCCB7tu5emDePoC+NtNlwWgsw
         MSZAi9awBDl5zgauuD5236VgNQiJ4VwEjxZYqXrcb5JhixQHagtw0bQb+LoRqTmrjS+a
         VNWrmETNV0IZMe26Sut2T7R8gDv+BmRM1m3la9RdhvoUTI2jZ1cvwprTclpmDQ2hnQYg
         i9q5UFqa46smt/Jt8f7ynJ9J3HtPrJPqkTJICGUnscdAcG5F1449Jb9VFSM8w561G+nk
         ohaA==
X-Gm-Message-State: AOJu0YxZTJrZWvJVbVD3L8d2sLDDITvqRfxHKXiFPfZDEj9+i54YLM5J
        L1jH78U2qBbp4GAojHQi6kW573ordAJpPfOu8D61fA==
X-Google-Smtp-Source: AGHT+IErNv3spkxTRAPqEYCwXDUZtAWajkef0GaPP4pNGl6Ru9ugNdzBIRZMvA1laXGErxnvS9mIHQ==
X-Received: by 2002:a05:6e02:1ba1:b0:34f:4632:4e09 with SMTP id n1-20020a056e021ba100b0034f46324e09mr47119216ili.23.1697468775530;
        Mon, 16 Oct 2023 08:06:15 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id j15-20020aa7800f000000b0068aca503b9fsm18324408pfi.114.2023.10.16.08.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 08:06:14 -0700 (PDT)
Message-ID: <652d5166.a70a0220.b64c2.34be@mx.google.com>
Date:   Mon, 16 Oct 2023 08:06:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2023-10-16-v6.6-rc6
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 48 runs,
 4 regressions (renesas-devel-2023-10-16-v6.6-rc6)
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

renesas/master baseline: 48 runs, 4 regressions (renesas-devel-2023-10-16-v=
6.6-rc6)

Regressions Summary
-------------------

platform       | arch  | lab           | compiler | defconfig | regressions
---------------+-------+---------------+----------+-----------+------------
imx8mp-evk     | arm64 | lab-broonie   | gcc-10   | defconfig | 1          =

r8a77960-ulcb  | arm64 | lab-collabora | gcc-10   | defconfig | 1          =

r8a779m1-ulcb  | arm64 | lab-collabora | gcc-10   | defconfig | 1          =

rk3588-rock-5b | arm64 | lab-collabora | gcc-10   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-10-16-v6.6-rc6/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-10-16-v6.6-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      8c53d0da87207beab143a2e4160d18730e9645bc =



Test Regressions
---------------- =



platform       | arch  | lab           | compiler | defconfig | regressions
---------------+-------+---------------+----------+-----------+------------
imx8mp-evk     | arm64 | lab-broonie   | gcc-10   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/652d21999262e4d172efd281

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-16-v6.6-rc6/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.t=
xt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-16-v6.6-rc6/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/652d21999262e4d172efd28a
        failing since 34 days (last pass: renesas-devel-2023-08-28-v6.5, fi=
rst fail: renesas-devel-2023-09-11-v6.6-rc1)

    2023-10-16T11:41:52.821625  / # #
    2023-10-16T11:41:53.980665  export SHELL=3D/bin/sh
    2023-10-16T11:41:53.986253  #
    2023-10-16T11:41:55.477407  / # export SHELL=3D/bin/sh. /lava-174299/en=
vironment
    2023-10-16T11:41:55.482853  =

    2023-10-16T11:41:58.192225  / # . /lava-174299/environment/lava-174299/=
bin/lava-test-runner /lava-174299/1
    2023-10-16T11:41:58.198203  =

    2023-10-16T11:41:58.206053  / # /lava-174299/bin/lava-test-runner /lava=
-174299/1
    2023-10-16T11:41:58.235336  + export 'TESTRUN_ID=3D1_bootrr'
    2023-10-16T11:41:58.239283  + cd /l<8>[   33.808835] <LAVA_SIGNAL_START=
RUN 1_bootrr 174299_1.5.2.4.5> =

    ... (10 line(s) more)  =

 =



platform       | arch  | lab           | compiler | defconfig | regressions
---------------+-------+---------------+----------+-----------+------------
r8a77960-ulcb  | arm64 | lab-collabora | gcc-10   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/652d208791786f20b4efcefa

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-16-v6.6-rc6/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-u=
lcb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-16-v6.6-rc6/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-u=
lcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/652d208791786f20b4efcf03
        failing since 90 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-10-16T11:41:51.924366  / # #

    2023-10-16T11:41:52.026400  export SHELL=3D/bin/sh

    2023-10-16T11:41:52.027115  #

    2023-10-16T11:41:52.128547  / # export SHELL=3D/bin/sh. /lava-11790377/=
environment

    2023-10-16T11:41:52.129290  =


    2023-10-16T11:41:52.230752  / # . /lava-11790377/environment/lava-11790=
377/bin/lava-test-runner /lava-11790377/1

    2023-10-16T11:41:52.231983  =


    2023-10-16T11:41:52.248792  / # /lava-11790377/bin/lava-test-runner /la=
va-11790377/1

    2023-10-16T11:41:52.298156  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-16T11:41:52.298667  + cd /lav<8>[   20.335309] <LAVA_SIGNAL_STA=
RTRUN 1_bootrr 11790377_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform       | arch  | lab           | compiler | defconfig | regressions
---------------+-------+---------------+----------+-----------+------------
r8a779m1-ulcb  | arm64 | lab-collabora | gcc-10   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/652d20a79aada543c6efcf5f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-16-v6.6-rc6/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-u=
lcb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-16-v6.6-rc6/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-u=
lcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/652d20a79aada543c6efcf68
        failing since 90 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-10-16T11:40:22.359750  / # #

    2023-10-16T11:40:23.440161  export SHELL=3D/bin/sh

    2023-10-16T11:40:23.441942  #

    2023-10-16T11:40:24.932944  / # export SHELL=3D/bin/sh. /lava-11790386/=
environment

    2023-10-16T11:40:24.934853  =


    2023-10-16T11:40:24.935306  / # . /lava-11790386/environment

    2023-10-16T11:40:27.660629  /lava-11790386/bin/lava-test-runner /lava-1=
1790386/1

    2023-10-16T11:40:27.666630  / # /lava-11790386/bin/lava-test-runner /la=
va-11790386/1

    2023-10-16T11:40:27.732972  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-16T11:40:27.733511  + cd /lava-117903<8>[   28.504007] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11790386_1.5.2.4.5>
 =

    ... (44 line(s) more)  =

 =



platform       | arch  | lab           | compiler | defconfig | regressions
---------------+-------+---------------+----------+-----------+------------
rk3588-rock-5b | arm64 | lab-collabora | gcc-10   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/652d21839262e4d172efcf6f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-16-v6.6-rc6/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3588-roc=
k-5b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-16-v6.6-rc6/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3588-roc=
k-5b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/652d21839262e4d172efc=
f70
        new failure (last pass: renesas-devel-2023-10-09-v6.6-rc5-11-g2f3e3=
edcf49e6) =

 =20
