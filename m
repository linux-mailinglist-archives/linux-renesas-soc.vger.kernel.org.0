Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18FC166887A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jan 2023 01:34:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231345AbjAMAeB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Jan 2023 19:34:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233365AbjAMAdq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2023 19:33:46 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8909D6144E
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 16:33:45 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id v23so16960774plo.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 16:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gOjtuFlHn/MSiCzh66FtM8WbKreD2njP7mXqQQ+d+Jc=;
        b=xWt1+j+OVyTevuafM85/8N6zcOW8tXMW4UDVRHSG95uLM8iMRdLwL+hNyNpoLwb5Ez
         SD2lynbdWu64lPleLL1IlL5ydqanZziV/NjetQs0toHZliMNoJExiu4tcQrGJfYsbhjl
         NdM1gaYhmi/3UmwtMf5FO/fGOvoZjLt/np58PUBgjMPiXUlykKIqR6nizHhz4515NhJt
         QD3p1Ya8ae8hMGjFR2q93yKuIAPckBcep1egPjZuZ2UbWbAM3MKc8urPqxkx4hP7D4PK
         MO3U5WYHTtR3Zoa2+tAL3KNS0YF0IDg7MOeaE8i773BZdacL7mDb+HFRJSbHUr0u6rZN
         l/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gOjtuFlHn/MSiCzh66FtM8WbKreD2njP7mXqQQ+d+Jc=;
        b=iWEHQTrVOuOXkhMJlgV8kWGw3YbIsytqEe0oJLk6EylMIq4L2bqJJ1DyDWGHVQGn4H
         F7dcPnBcfnxlBXoViX9e4qGTTavx83z5ePENQ9WjIgSkmKKtaIomJfVDdD8S/cyN8N+Y
         +xEtTUkATao+LuYgEJQ+WlDJoEl1Z24HodeT6nDqsVLYF+6YgzWt97QR6oZc4R2m7hkt
         5tCMGY5Bkiymv0yqHb8o77dEXexdWPM27W77pKrk7yE0N7hJ46f3Ww8L1RtnelVtuC11
         gWSDMS2xFClxeV/iEbZPGe3OzDkRTuZw43Ll3wGfL5Oj5fLjo78uj9APw3tQrB9PN102
         TvfQ==
X-Gm-Message-State: AFqh2kp84ERWLwdVkQ4e82js1o4QVkbTSKXdp56RAOTrUC/94cW/teYw
        Pq0cnYgohJmZ1JQftFhzmEWW7VlgRafURnWp7NrtKg==
X-Google-Smtp-Source: AMrXdXt2ESgoxPJmupQs6ZpLjntJCMfVxTiBgMhsUtG68eWTp6LdoDlMEV1treE5e0aC1aEtl9AuxQ==
X-Received: by 2002:a17:90a:5206:b0:226:bcbe:dfc0 with SMTP id v6-20020a17090a520600b00226bcbedfc0mr30146970pjh.27.1673570024803;
        Thu, 12 Jan 2023 16:33:44 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id oj11-20020a17090b4d8b00b001fde655225fsm522055pjb.2.2023.01.12.16.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 16:33:44 -0800 (PST)
Message-ID: <63c0a6e8.170a0220.5cc53.0266@mx.google.com>
Date:   Thu, 12 Jan 2023 16:33:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2023-01-12-v6.2-rc3
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 217 runs,
 4 regressions (renesas-devel-2023-01-12-v6.2-rc3)
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

renesas/master baseline: 217 runs, 4 regressions (renesas-devel-2023-01-12-=
v6.2-rc3)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...eb=
ook+amdgpu | 1          =

imx6dl-udoo        | arm    | lab-broonie   | gcc-10   | imx_v6_v7_defconfi=
g          | 1          =

imx6q-udoo         | arm    | lab-broonie   | gcc-10   | imx_v6_v7_defconfi=
g          | 1          =

r8a7743-iwg20d-q7  | arm    | lab-cip       | gcc-10   | shmobile_defconfig=
           | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-01-12-v6.2-rc3/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-01-12-v6.2-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      5268d311d704e178f1b4c5afcf0ca9073238412b =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...eb=
ook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63c06ee4ba9917fc211d3a5a

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-12-v6.2-rc3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-12-v6.2-rc3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
3c06ee4ba9917fc211d3a69
        new failure (last pass: renesas-devel-2023-01-09-v6.2-rc3)

    2023-01-12T20:34:21.956443  /usr/bin/tpm2_getcap
    2023-01-12T20:34:21.983670  ERROR:tcti:src/tss2-tcti/tcti-device.c:286:=
tcti_device_receive() Failed to read response from fd 3, got errno 14: Bad =
address =

    2023-01-12T20:34:21.992333  ERROR:esys:src/tss2-esys/api/Esys_GetCapabi=
lity.c:307:Esys_GetCapability_Finish() Received a non-TPM Error =

    2023-01-12T20:34:22.000098  ERROR:esys:src/tss2-esys/api/Esys_GetCapabi=
lity.c:107:Esys_GetCapability() Esys Finish ErrorCode (0x000a000a) =

    2023-01-12T20:34:22.005194  ERROR: Esys_GetCapability(0xA000A) - tcti:I=
O failure
    2023-01-12T20:34:22.007508  ERROR: Unable to run tpm2_getcap
    2023-01-12T20:34:23.003235  ERROR:tcti:src/tss2-tcti/tcti-device.c:286:=
tcti_device_receive() Failed to read response from fd 3, got errno 14: Bad =
address =

    2023-01-12T20:34:23.012321  ERROR:esys:src/tss2-esys/api/Esys_GetCapabi=
lity.c:307:Esys_GetCapability_Finish() Received a non-TPM Error =

    2023-01-12T20:34:23.022357  ERROR:esys:src/tss2-esys/api/Esys_GetCapabi=
lity.c:107:Esys_GetCapability() Esys Finish ErrorCode (0x000a000a) =

    2023-01-12T20:34:23.026997  ERROR: Esys_GetCapability(0xA000A) - tcti:I=
O failure =

    ... (49 line(s) more)  =

 =



platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
imx6dl-udoo        | arm    | lab-broonie   | gcc-10   | imx_v6_v7_defconfi=
g          | 1          =


  Details:     https://kernelci.org/test/plan/id/63c06dab34743f57761d39ce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-12-v6.2-rc3/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6=
dl-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-12-v6.2-rc3/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6=
dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c06dab34743f57761d3=
9cf
        failing since 122 days (last pass: renesas-devel-2022-07-05-v5.19-r=
c5, first fail: v6.0-rc5-843-g94f27a9ea269) =

 =



platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
imx6q-udoo         | arm    | lab-broonie   | gcc-10   | imx_v6_v7_defconfi=
g          | 1          =


  Details:     https://kernelci.org/test/plan/id/63c06d5fe5935b2c081d39f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-12-v6.2-rc3/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6=
q-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-12-v6.2-rc3/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6=
q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c06d5fe5935b2c081d3=
9f8
        failing since 122 days (last pass: renesas-devel-2022-09-02-v6.0-rc=
3, first fail: v6.0-rc5-843-g94f27a9ea269) =

 =



platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
r8a7743-iwg20d-q7  | arm    | lab-cip       | gcc-10   | shmobile_defconfig=
           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c06d38e8adbb22511d39c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-12-v6.2-rc3/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-i=
wg20d-q7.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-12-v6.2-rc3/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-i=
wg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c06d38e8adbb22511d3=
9c4
        new failure (last pass: renesas-devel-2023-01-09-v6.2-rc3) =

 =20
