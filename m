Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C53879BBEB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Sep 2023 02:13:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241646AbjIKVRq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Sep 2023 17:17:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243306AbjIKRE2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Sep 2023 13:04:28 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F288121
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Sep 2023 10:04:23 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-565334377d0so3976678a12.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Sep 2023 10:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1694451862; x=1695056662; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3ERMsK/4TG+fKEiXovnaT9sPUFyk2w0UmP+j73QcqWs=;
        b=ECxBg03BPyWWN9zQkdWwJrsz/6Zshvrk+RafT1Qpuig0lDny8dND6Y7x4L3OeYp0k9
         dg7NqSxAPHO3w/nzEv34vok/Ua9PuFo4EWLwsxeZ7qrAwH2/zM6mFsaBq8V/B0FIPu1a
         Gv3q8P/enqKBBwxSv/0JLWUhY/VCBX2D9FA+s61woqYndAWCeHFocy4AhI//pAjchTU2
         Qt1l0FPDVTv3Kjy5K8pHAVXjT6Gup8e7yfRDscit1oGNrnvTSFUoNpDNnIqCKphJFUAz
         H5DwUaIj2a9tZoajusUcVi/m9NIGa/1btZcZroqPkpvDKXcAFXnhtkIdXg3V8qU5snYQ
         44Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694451862; x=1695056662;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ERMsK/4TG+fKEiXovnaT9sPUFyk2w0UmP+j73QcqWs=;
        b=HC5zbUOU6yMRhS3tpHg4xT3WC5l4PK/F89bR2RPpNYRKwTRsyg9MQhuLVargqnIXhf
         SRo2e5OzMRezphbNoAfL3mMojljAe27Z9KmWJqKjOqgfAa7/cSrai1e87wnvUNPqPsXX
         SPWkGCdCU8RL4ljGJBYwdG16WJdG3m7UB1stRBeHBE1wfTQikJtYvkchZspBPXgdFDmu
         gb52Ce6EDXzy+LLRVyaOaodPMfd5zDg3Nowe2ilFH1XcTOZ9VbIvTXmDP6VU/IKFAcb1
         DJ3oAulWPzCNIGYtuyRB8NCiDiEealn2fKKjm8QOgqsRL9Ig5eeNlvGeH6IchEhtxEgQ
         Ckdg==
X-Gm-Message-State: AOJu0Yww6mCKQEYdvEkC8qPLjAVNBHNGPIGarXdUFDNtlcGH9U/53mf4
        MDkPWElaig2glWPMdlQrxNgbu1+bwIl9DPTsY4Q=
X-Google-Smtp-Source: AGHT+IGJUm8Z0ox7H2+ScItq7WrkmPibdFLxQlIkJncNPojc15yHg+gXNu/KAxBLiVHaaKRyeqJuDw==
X-Received: by 2002:a17:90a:c38d:b0:26f:4685:5b53 with SMTP id h13-20020a17090ac38d00b0026f46855b53mr10470580pjt.28.1694451862124;
        Mon, 11 Sep 2023 10:04:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 2-20020a17090a000200b0026309d57724sm8263322pja.39.2023.09.11.10.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 10:04:21 -0700 (PDT)
Message-ID: <64ff4895.170a0220.fa23b.4d22@mx.google.com>
Date:   Mon, 11 Sep 2023 10:04:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2023-09-11-v6.6-rc1
Subject: renesas/next baseline: 48 runs,
 3 regressions (renesas-next-2023-09-11-v6.6-rc1)
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

renesas/next baseline: 48 runs, 3 regressions (renesas-next-2023-09-11-v6.6=
-rc1)

Regressions Summary
-------------------

platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a77960-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =

r8a779m1-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =

sun50i-h6-pine-h64 | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-09-11-v6.6-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-09-11-v6.6-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f1f80f16cf65fdebcb57c299435019a932d50a6a =



Test Regressions
---------------- =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a77960-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/64ff17ca633861d9e6286eaf

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-11-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb=
.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-11-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ff17ca633861d9e6286eb8
        failing since 45 days (last pass: renesas-next-2023-07-11-v6.5-rc1,=
 first fail: renesas-next-2023-07-27-v6.5-rc1)

    2023-09-11T13:40:10.082875  / # #

    2023-09-11T13:40:10.183341  export SHELL=3D/bin/sh

    2023-09-11T13:40:10.183447  #

    2023-09-11T13:40:10.283908  / # export SHELL=3D/bin/sh. /lava-11494956/=
environment

    2023-09-11T13:40:10.284039  =


    2023-09-11T13:40:10.384540  / # . /lava-11494956/environment/lava-11494=
956/bin/lava-test-runner /lava-11494956/1

    2023-09-11T13:40:10.384720  =


    2023-09-11T13:40:10.396736  / # /lava-11494956/bin/lava-test-runner /la=
va-11494956/1

    2023-09-11T13:40:10.450313  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-11T13:40:10.450390  + cd /lava-114949<8>[   20.450488] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11494956_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a779m1-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/64ff17e427f8283a7f286d72

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-11-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulcb=
.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-11-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulcb=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ff17e427f8283a7f286d7b
        failing since 45 days (last pass: renesas-next-2023-07-11-v6.5-rc1,=
 first fail: renesas-next-2023-07-27-v6.5-rc1)

    2023-09-11T13:36:28.063512  / # #

    2023-09-11T13:36:29.143270  export SHELL=3D/bin/sh

    2023-09-11T13:36:29.145138  #

    2023-09-11T13:36:30.635627  / # export SHELL=3D/bin/sh. /lava-11494948/=
environment

    2023-09-11T13:36:30.637516  =


    2023-09-11T13:36:33.361448  / # . /lava-11494948/environment/lava-11494=
948/bin/lava-test-runner /lava-11494948/1

    2023-09-11T13:36:33.363553  =


    2023-09-11T13:36:33.373098  / # /lava-11494948/bin/lava-test-runner /la=
va-11494948/1

    2023-09-11T13:36:33.432836  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-11T13:36:33.433316  + cd /lava-114949<8>[   29.492770] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11494948_1.5.2.4.5>
 =

    ... (39 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
sun50i-h6-pine-h64 | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/64ff17c7633861d9e6286ea1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-11-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pin=
e-h64.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-09-11-v6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pin=
e-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ff17c7633861d9e6286eaa
        failing since 45 days (last pass: renesas-next-2023-07-11-v6.5-rc1,=
 first fail: renesas-next-2023-07-27-v6.5-rc1)

    2023-09-11T13:40:20.273549  / # #

    2023-09-11T13:40:20.374022  export SHELL=3D/bin/sh

    2023-09-11T13:40:20.374145  #

    2023-09-11T13:40:20.474626  / # export SHELL=3D/bin/sh. /lava-11494946/=
environment

    2023-09-11T13:40:20.474735  =


    2023-09-11T13:40:20.575245  / # . /lava-11494946/environment/lava-11494=
946/bin/lava-test-runner /lava-11494946/1

    2023-09-11T13:40:20.575490  =


    2023-09-11T13:40:20.587000  / # /lava-11494946/bin/lava-test-runner /la=
va-11494946/1

    2023-09-11T13:40:20.659020  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-11T13:40:20.659190  + cd /lava-11494946/1/tests/1_boot<8>[   17=
.011472] <LAVA_SIGNAL_STARTRUN 1_bootrr 11494946_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
