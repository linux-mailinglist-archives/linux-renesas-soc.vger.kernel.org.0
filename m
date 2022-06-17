Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED34D54FCD7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jun 2022 20:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235515AbiFQSTh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jun 2022 14:19:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230477AbiFQSTg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jun 2022 14:19:36 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CACC92F01E
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jun 2022 11:19:34 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id b12-20020a17090a6acc00b001ec2b181c98so3672089pjm.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jun 2022 11:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=PmQkSQfCgCX7Zcx6jNYwGmJZv++3ojmfJYdCAz8MW8Y=;
        b=A+90+e0GROCeZRp1sgZIwn45pYIxDf0eV0Wrxtw6uneGGMF7bjeaZaU1pBm4BN+w1l
         upaVWCZe24rle6D63IFGbUdgdqNkZwNnm5H5qy2M4y4j5MzAuVYmdBkIRkrv70OKTWo2
         6Y9JQxlQlLlkwjM06CoMW7G3qQB7dYZEFbANGUESZH1C3SfoDgAxxt5x+ATOD9CTVGUd
         7GlDbi6wHlWPfDblv/Z1xio0GhcyYx3w5NFAmKRHGnGYG7A1DWb5MaOO2iiC+hlqyS41
         I5Uwu+kdZDPCMa13/SJOcQD1cUtZMBe0gHunh/sYCk9BDxHAQsc1qWQJZbYhxrKTLW8y
         DYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=PmQkSQfCgCX7Zcx6jNYwGmJZv++3ojmfJYdCAz8MW8Y=;
        b=1tJz7RZJnewHS8rDms2Z0k5LfASQSCYb37e7bOAdxVSt2SC7jPXs/bt587ILwpbKz4
         vTtrj1ArO0l7z4tY2BiM6JkpZF8hDGuIYTQt2fO7gsWUN+dlXdJ6Gysoi0o0fd4bLbLO
         aK8GfPODlJ0vctvoaSzb+o5ShSY1CDP3892AQHnZjSclqh0MGbqhpKA9PB7BP7/iSSW7
         uonhpwkqR0JYMREmmYjnEKnA1bWMXoK0pPP+nc5D1iThwn8hZm6EApt+tkr/X2NLGkLD
         0Ku6GBE14CIKOgevIerlPf+bCyMxQWqbc1yyZT21NxZXj66lc2e9lbz1uYGecuICyIJe
         MpTA==
X-Gm-Message-State: AJIora8pj5NZIPc8Q4nJoHzqqHw9lareMVkeyaIT6gDgt4DOJXkhPj7R
        ztZMZeJFJxnmYwvdZHAw4O8reWm1Op0yTZz6UPo=
X-Google-Smtp-Source: AGRyM1u/+Um3n5/zJv0lTHX8cp4IRbCpN7ldSb7M6A8NWBkm7yxK4saQiwsoy1gBjH8ymfWUSSj78A==
X-Received: by 2002:a17:90b:4f4b:b0:1ea:9f82:44f with SMTP id pj11-20020a17090b4f4b00b001ea9f82044fmr11943744pjb.92.1655489974101;
        Fri, 17 Jun 2022 11:19:34 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q11-20020a056a00084b00b0051bc3a2355csm4102269pfk.64.2022.06.17.11.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 11:19:33 -0700 (PDT)
Message-ID: <62acc5b5.1c69fb81.89768.5bda@mx.google.com>
Date:   Fri, 17 Jun 2022 11:19:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-06-17-v5.19-rc1
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next igt-gpu-panfrost: 2 runs,
 2 regressions (renesas-next-2022-06-17-v5.19-rc1)
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

renesas/next igt-gpu-panfrost: 2 runs, 2 regressions (renesas-next-2022-06-=
17-v5.19-rc1)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =

rk3399-gru-kevin  | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-06-17-v5.19-rc1/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-06-17-v5.19-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      64d15244c4805618b3bfc0886094481e9ac91762

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  f83ad09dc04c9f918ee8836bac9d88dac5de6745
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  0189ca288f7188e60f5eda356b190040bf8ec704 =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/62acc398f25cfd2bc7a39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-gpu-panfro=
st-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-gpu-panfro=
st-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220610.0/armhf/rootfs.cpio.gz =



  * igt-gpu-panfrost.login: https://kernelci.org/test/case/id/62acc398f25cf=
d2bc7a39bce
        failing since 10 days (last pass: renesas-next-2022-05-05-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
rk3399-gru-kevin  | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62acb86f9f273e6a37a39c60

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-=
gpu-panfrost-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-=
gpu-panfrost-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220610.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/62acb86f9f273e6a37a39c63
        new failure (last pass: renesas-next-2022-06-07-v5.19-rc1)

    2022-06-17T17:22:46.378190  IGT-Version: 1.26-g0189ca2 (aarch64) (Linux=
: 5.19.0-rc1 aarch64)<6>[   40.203604] Console: switching to colour dummy d=
evice 80x25
    2022-06-17T17:22:46.383248  <14>[   40.203688] [IGT] panfrost_submit: e=
xecuting
    2022-06-17T17:22:46.383330  =

    2022-06-17T17:22:46.397334  Starting subtest: pan-unhandled-pagefault
    2022-06-17T17:22:46.405852  <14>[   40.231970] [IGT] panfrost_submit: s=
tarting subtest pan-unhandled-pagefault
    2022-06-17T17:22:46.512921  (panfrost_submit:349) CRITICAL: Test assert=
ion failure function __igt_unique____real_main65, file ../tests/panfrost_su=
bmit.c:178<14>[   40.344833] [IGT] panfrost_submit: exiting, ret=3D98
    2022-06-17T17:22:46.513545  :
    2022-06-17T17:22:46.527312  (panfrost_submit:349) CRITICAL: Failed asse=
rtion: syncobj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_=
NSEC), 0, NULL)
    2022-06-17T17:22:46.528062  Stack trace:
    2022-06-17T17:22:46.533048    #0 ../lib/igt_core.c:1819 __igt_fail_asse=
rt() =

    ... (13 line(s) more)  =

 =20
