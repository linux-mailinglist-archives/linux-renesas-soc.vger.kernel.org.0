Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 161BF662AEF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jan 2023 17:14:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbjAIQOh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Jan 2023 11:14:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbjAIQOh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Jan 2023 11:14:37 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3551A10B8
        for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Jan 2023 08:14:36 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id n12so9252766pjp.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Jan 2023 08:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AB7slnWuflc2rdS3D14rOyPG/pVL6IPFV7+iPKnjXgg=;
        b=2jboRAlrjWMAxVSBpgn9yenYoTeusUV7QFAdLoog1AMDSX0bZt6WqVbyU0khv9hEHJ
         6ZMHMQOlTxj23QebSGaX9m1925A0yW2POvrqxj4vbb5/mgDISuJq+u9l7XLAgS5aTnub
         muPEPEpF8VZXDbcrzlc0z8/YgWAuWx9BjeAiit7GUpb6HDkSQreFBvwKrQoTwb3srKfi
         bbCjBIh/JRnQw0Yd31hKmTyatHbsUQ6qBbMlY50NHXATEsTTKEshfvxCZ1At9cnuk+9F
         TPn3B3KJGZV54DML3nldcfg5XtPmgdVs8WJZTYweP6lNLM5uTEi+Yo5ip9qpaQQIATaB
         Nksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AB7slnWuflc2rdS3D14rOyPG/pVL6IPFV7+iPKnjXgg=;
        b=zQUysFVQmZDTNzlYvQZEcytSmIBTIDnxqVzOEv/M3tLlRabJk2/03/Oz3Wl8omlymQ
         97cJqdUY8FWWBto/PQwGBugQLt2lx7644eHj/nR1bMLj6Y13uF4ntYydSyO8GnKKC/Qk
         RvvtTaZaaiopBemnqP+WnczYjwpHfuAHys1aOHa+2liRaXNOijG82FMQ7vExiCsRo5Ye
         vFlKNNkdKcdYk/kby+w1BqoW5X23XSLS7WVYLVcAY8AjhWaCQO2shP8NDpQ3QTBhBPsy
         AI8fqxlPNyU9nUB5enjxVdCzrj8kZJxRsKz+4P9EKz1WutDloWfszT3zcQbpfyoLykWk
         EMaA==
X-Gm-Message-State: AFqh2kqIh6tg9m0SLrWWQMXyrYdufu078jIRHvGjxpyGbcOWkDWxm96Z
        bjGP3P79sryDCijnV+wfkNjvmUcZpgLKcD0Jh2+Bpw==
X-Google-Smtp-Source: AMrXdXt+oisZAWXGQWU/TlsnBG8vctglek9a/inrPx6QH0WikqG6L1RqRjIdHnYTh/Ko//HTDD045Q==
X-Received: by 2002:a17:902:e30c:b0:193:30bc:ed86 with SMTP id q12-20020a170902e30c00b0019330bced86mr3959693plc.48.1673280875420;
        Mon, 09 Jan 2023 08:14:35 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c11-20020a170903234b00b0019277df45a6sm6391231plh.53.2023.01.09.08.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 08:14:35 -0800 (PST)
Message-ID: <63bc3d6b.170a0220.188cb.981f@mx.google.com>
Date:   Mon, 09 Jan 2023 08:14:35 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2023-01-09-v6.2-rc3
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 115 runs,
 4 regressions (renesas-devel-2023-01-09-v6.2-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 115 runs, 4 regressions (renesas-devel-2023-01=
-09-v6.2-rc3)

Regressions Summary
-------------------

platform                     | arch  | lab         | compiler | defconfig  =
       | regressions
-----------------------------+-------+-------------+----------+------------=
-------+------------
juno-uboot                   | arm64 | lab-broonie | gcc-10   | defconfig+c=
rypto  | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip     | gcc-10   | renesas_def=
config | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie | gcc-10   | defconfig+d=
ebug   | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie | gcc-10   | defconfig+d=
ebug   | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-01-09-v6.2-rc3/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-01-09-v6.2-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      84545c94403b4b5a90561c9c97c2c2c00091cff1 =



Test Regressions
---------------- =



platform                     | arch  | lab         | compiler | defconfig  =
       | regressions
-----------------------------+-------+-------------+----------+------------=
-------+------------
juno-uboot                   | arm64 | lab-broonie | gcc-10   | defconfig+c=
rypto  | 1          =


  Details:     https://kernelci.org/test/plan/id/63bc0692cbf911e2534eee32

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-09-v6.2-rc3/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-nfs-j=
uno-uboot.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-09-v6.2-rc3/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-nfs-j=
uno-uboot.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221230.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/63bc0692cbf911e2534eee37
        new failure (last pass: renesas-devel-2022-12-12-v6.1)

    2023-01-09T12:20:13.214107  / # #
    2023-01-09T12:20:13.317081  export SHELL=3D/bin/sh
    2023-01-09T12:20:13.317922  #
    2023-01-09T12:20:13.419856  / # export SHELL=3D/bin/sh. /lava-75699/env=
ironment
    2023-01-09T12:20:13.420649  =

    2023-01-09T12:20:13.522616  / # . /lava-75699/environment/lava-75699/bi=
n/lava-test-runner /lava-75699/1
    2023-01-09T12:20:13.523958  =

    2023-01-09T12:20:13.543449  / # /lava-75699/bin/lava-test-runner /lava-=
75699/1
    2023-01-09T12:20:13.655378  + export TESTRUN_ID=3D1_bootrr
    2023-01-09T12:20:13.701285  + cd /lava-75699/1/tests/1_bootrr =

    ... (39 line(s) more)  =

 =



platform                     | arch  | lab         | compiler | defconfig  =
       | regressions
-----------------------------+-------+-------------+----------+------------=
-------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip     | gcc-10   | renesas_def=
config | 1          =


  Details:     https://kernelci.org/test/plan/id/63bc0fc31ea638aa394eee4f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: renesas_defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-09-v6.2-rc3/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-nfs-r8a7=
74a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-09-v6.2-rc3/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-nfs-r8a7=
74a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221230.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63bc0fc31ea638aa3=
94eee50
        new failure (last pass: renesas-devel-2023-01-02-v6.2-rc2) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
       | regressions
-----------------------------+-------+-------------+----------+------------=
-------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie | gcc-10   | defconfig+d=
ebug   | 1          =


  Details:     https://kernelci.org/test/plan/id/63bc0bc1df2fd252414eee37

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-09-v6.2-rc3/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-nfs-su=
n50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-09-v6.2-rc3/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-nfs-su=
n50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221230.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63bc0bc1df2fd2524=
14eee38
        new failure (last pass: renesas-devel-2023-01-02-v6.2-rc2) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
       | regressions
-----------------------------+-------+-------------+----------+------------=
-------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie | gcc-10   | defconfig+d=
ebug   | 1          =


  Details:     https://kernelci.org/test/plan/id/63bc09a5c0576614e14eee19

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-09-v6.2-rc3/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-nfs-su=
n50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-09-v6.2-rc3/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-nfs-su=
n50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221230.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63bc09a5c0576614e=
14eee1a
        failing since 14 days (last pass: v6.1-rc8-929-g112502470f50, first=
 fail: renesas-devel-2022-12-26-v6.2-rc1) =

 =20
