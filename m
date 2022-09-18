Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03B205BBEA1
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Sep 2022 17:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbiIRPWS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 18 Sep 2022 11:22:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbiIRPWR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 18 Sep 2022 11:22:17 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09D44E0D7
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Sep 2022 08:22:16 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d82so25782237pfd.10
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Sep 2022 08:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=QmTyGtCAJpMVVlpno/1M6cxJvzL+Gw3ZmPNtyw2uOeE=;
        b=IeHnDq5cSN08kE4Bf+QpyU4wOjGo+iui+zkXFGb0HUPsTMRHlKskK/RBzqwdybd6eG
         LLVBfo0G/eNG6t2t1kfZgsCg0/RklUTIvHJdnuOvCnnhD7mpoY15W9t7/B6oxJhFzE2E
         YFugxyVJnHhM7qVmC4NB4PkU+l5+q9pnEm8I6OZSgj9Nbw2AKZqUOHLeFTi/3POrqQGk
         uiYBQtsJa2qtSmmxneFssayb7Cdl+mi0FP9nKk6L2dtCo60mDAO/itXFFKvsHIp/53Tr
         +EsgV3y362B1PoClt2ly4phOuuCdmzzYoo9+VMpe7WUKFpBk/MQblYnPyScuPMtvdPhJ
         2I+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=QmTyGtCAJpMVVlpno/1M6cxJvzL+Gw3ZmPNtyw2uOeE=;
        b=YZbkgDGttEL9GW9Ps8h0dUH21NNXPr91mtqVJLwwziQznY5Zm/FpoNEubhwoiV5e2w
         IjZlIENb8+ywthjz4DuBTn/76KMID1cQ52yUIz2pF75i6SD4s+l6ArN81Rj2NG4uB411
         STU1UocOU1oPUepqyjmpXLveqfyu7pajA1gFjEDCXr74VX+GXEn3G0gMdbyDW0owGbLe
         y9sN1pafrbhK2AnvxIR+l58t52Zpp+Gvxzl/ehRysNkLOPY/weZr4yBO464tkSnG8n62
         o75xPuyVez9b71EaDhPI1GQuSA5xpHIbC5kAgSgANsLgmyP8+IwBGZhXF3zWVSHWSKm1
         9EcQ==
X-Gm-Message-State: ACrzQf3n018T9CL0A5fl7+YClGOLYDISFy4dEX+aKSNmgpJ1A+xeXOUY
        bt1bW+Aew3iLHpxNhjwRx/S7Kh38tsAxoIOaCpw=
X-Google-Smtp-Source: AMsMyM5Zbyx5q4VIl86dXwhGK3px+0Frz9LckeXU0ZqwV+rjZYiMQGgAS6suJ7p/+50CK34YoUQD0Q==
X-Received: by 2002:a05:6a00:2402:b0:52c:81cf:8df8 with SMTP id z2-20020a056a00240200b0052c81cf8df8mr14353117pfh.60.1663514535369;
        Sun, 18 Sep 2022 08:22:15 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w14-20020aa7954e000000b00535e950aa28sm18349434pfq.131.2022.09.18.08.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Sep 2022 08:22:14 -0700 (PDT)
Message-ID: <632737a6.a70a0220.1b6bf.ffab@mx.google.com>
Date:   Sun, 18 Sep 2022 08:22:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-09-18-v6.0-rc1
Subject: renesas/next igt-gpu-panfrost: 2 runs,
 1 regressions (renesas-next-2022-09-18-v6.0-rc1)
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

renesas/next igt-gpu-panfrost: 2 runs, 1 regressions (renesas-next-2022-09-=
18-v6.0-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-09-18-v6.0-rc1/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-09-18-v6.0-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2918d1d088b5c12f5449318fd4a0230455fa5752

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  d4bb19e2c49de32a01cef56ad739cc10e9afd237
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  1298b5f0e1b3e010657ffba41d2e775fab028e08 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63272863a391bad798355667

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-18-v6.0-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-g=
pu-panfrost-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-18-v6.0-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-g=
pu-panfrost-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220826.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/63272863a391bad79835566a
        new failure (last pass: renesas-next-2022-08-30-v6.0-rc1)

    2022-09-18T14:16:51.003256  <6>[   24.967003] Console: switching to col=
our dummy device 80x25
    2022-09-18T14:16:51.009115  <14>[   24.973715] [IGT] panfrost_submit: e=
xecuting
    2022-09-18T14:16:51.015822  IGT-Version: 1.26-g1298b5f (aarch64) (Linux=
: 6.0.0-rc1 aarch64)
    2022-09-18T14:16:51.033529  <14>[   24.995446] [IGT] panfrost_submit: s=
tarting subtest pan-unhandled-pagefault
    2022-09-18T14:16:51.037975  Starting subtest: pan-unhandled-pagefault
    2022-09-18T14:16:51.155737  (panfrost_submit:347) CRITICAL: Test assert=
ion failure function __igt_unique____real_main65, file ../tests/panfrost_su=
bmit.c:178<14>[   25.117078] [IGT] panfrost_submit: exiting, ret=3D98
    2022-09-18T14:16:51.156547  :
    2022-09-18T14:16:51.169265  (panfrost_submit:347) CRITICAL: Failed asse=
rtion: syncobj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_=
NSEC), 0, NULL)
    2022-09-18T14:16:51.171155  Stack trace:
    2022-09-18T14:16:51.175561    #0 ../lib/igt_core.c:1819 __igt_fail_asse=
rt() =

    ... (9 line(s) more)  =

 =20
