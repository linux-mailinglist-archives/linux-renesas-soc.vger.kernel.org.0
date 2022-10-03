Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0FE55F31D6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Oct 2022 16:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbiJCOSF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Oct 2022 10:18:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbiJCOSA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Oct 2022 10:18:00 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E3284CA38
        for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Oct 2022 07:18:00 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id v1so9802333plo.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Oct 2022 07:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=FE3x9oWjgQIhSjemNwQPCWN71EcG+DAcFtRM70fXPVU=;
        b=UPThKiYQjLsktCzXpsVkbUVL4FS7IixqZLbK0SAiPs5uwW+Tb2j2/SNaYhtLye5xAP
         HDd9Xj+OhMmzwOSA6TFuHHrjD2ZCuSW2AyMq31gvPxr1fo9++tSSWijNse5/0EWZn0KQ
         6wtWl8qmTQLnKu1+6rQHfheGd5p8yKIDzZRROBD0ZXZsGB/CkbHORqZoUrapxMeHhJ6U
         w65RrZInLpGBCaQmIyKO0JoV1SMZ1JBiNIVUFNCQbPFs1bdI8RhkKBVoHNZvutO5RH3m
         KKO5d6hbulOa7/cjz3ZTHly5fV+6cDZy2zfifXzfhNpQwTMK1o+PngPuB7TCcd5RSotT
         gjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=FE3x9oWjgQIhSjemNwQPCWN71EcG+DAcFtRM70fXPVU=;
        b=xpser+tVnt9JN87b5Bs6qSSy5JiSbqHT1fMgt3BxraPjTc/LxCCcpWxlfHT2oDsKpu
         o9vPtqtR2vg/vRzvB6vE4ZB48j7/cPfAtwSbjkQOiKgUYqULJ4P3wEyCOV1oFYszDDdX
         1BdsoxbPbUb2UDMajacwmsQyAuipMTS9gbJyWuKeH6NptlNnouXvn3Qqe3458H03udFy
         fK72O1pwrfjMxVXHmVPRl6dk6igGfsvFP900GQYIImsUENKQmTHwUyUKOPIdquLwzj+o
         d+LRC3hMYMw8rNYKNdja61BEDM4ma2sw8E0BE301kSOq7kQMuQlH5WY+giaQHDLWdk+b
         C/Rg==
X-Gm-Message-State: ACrzQf3vZa+XJzauB6pRXU2jzHQxMCk7vkcDGeUkL0qRp+dipNEPXEJ9
        J6LxxZutYaKshZPMOiNL4iPj9uRIfyooEwosac0=
X-Google-Smtp-Source: AMsMyM774GjNje/nLL3cfVXmMPmPj6Sqp6td7E6zoL1SsmtFXPoO4ZOgkIYhA6oK3XJ54TNag9lv/g==
X-Received: by 2002:a17:902:e884:b0:178:2065:5c29 with SMTP id w4-20020a170902e88400b0017820655c29mr22795857plg.114.1664806679478;
        Mon, 03 Oct 2022 07:17:59 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n9-20020a635909000000b00439f027789asm6703446pgb.59.2022.10.03.07.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 07:17:59 -0700 (PDT)
Message-ID: <633aef17.630a0220.fb21c.b360@mx.google.com>
Date:   Mon, 03 Oct 2022 07:17:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2022-10-03-v6.0
X-Kernelci-Report-Type: test
Subject: renesas/master igt-gpu-panfrost: 1 runs,
 1 regressions (renesas-devel-2022-10-03-v6.0)
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

renesas/master igt-gpu-panfrost: 1 runs, 1 regressions (renesas-devel-2022-=
10-03-v6.0)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-10-03-v6.0/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-10-03-v6.0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f0dbcd134f5abcdd4e2ad16bc81a158b2a23e2d9

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  474894ed17a037a464e5bd845a0765a50f647898
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  dcb1d7a8822e62935f4fe3f2e6a04caaee669369 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/633ae3943d4559d437cab607

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-gp=
u-panfrost-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-gp=
u-panfrost-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220923.1/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/633ae3943d4559d437cab610
        new failure (last pass: renesas-devel-2022-09-27-v6.0-rc7)

    2022-10-03T13:28:47.818455  <8>[   26.854475] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpan-submit-and-close RESULT=3Dpass>
    2022-10-03T13:28:47.857768  <6>[   26.895925] Console: switching to col=
our dummy device 80x25
    2022-10-03T13:28:47.862871  <14>[   26.902982] [IGT] panfrost_submit: e=
xecuting
    2022-10-03T13:28:47.868956  IGT-Version: 1.26-gdcb1d7a (aarch64) (Linux=
: 6.0.0 aarch64)
    2022-10-03T13:28:47.885974  <14>[   26.922457] [IGT] panfrost_submit: s=
tarting subtest pan-unhandled-pagefault
    2022-10-03T13:28:47.889664  Starting subtest: pan-unhandled-pagefault
    2022-10-03T13:28:48.005957  (panfrost_submit:349) CRITICAL: Test assert=
ion failure function __igt_unique____real_main65, file ../tests/panfrost_su=
bmit.c:178<14>[   27.042003] [IGT] panfrost_submit: exiting, ret=3D98
    2022-10-03T13:28:48.006273  :
    2022-10-03T13:28:48.019838  (panfrost_submit:349) CRITICAL: Failed asse=
rtion: syncobj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_=
NSEC), 0, NULL)
    2022-10-03T13:28:48.021541  Stack trace: =

    ... (15 line(s) more)  =

 =20
