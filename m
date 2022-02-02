Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F47C4A7033
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Feb 2022 12:43:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232404AbiBBLnN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Feb 2022 06:43:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343971AbiBBLnM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Feb 2022 06:43:12 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BA7BC061714
        for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Feb 2022 03:43:12 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id o16-20020a17090aac1000b001b62f629953so6551552pjq.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Feb 2022 03:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=oLY01fMg5SWJ8ABL0ouydC9QnY3yaFcOjkVnYRz18p4=;
        b=Eo8ram/ckEG8sM38lTYKbsmNOoa14HxEt2342P7T3Td3TWZ/GL36yMGZvqphFEMu0H
         vbfRvft849MN6FeJHgH8Z6sICBzvHaSXYek9ELJ0Tvisa2XfWZdzl6InDLx8kITz2DY3
         nlShTgmFEgGqvOzl/Q6oCxrkilmy++xaLAwMQ0nGVWI2r75+grTObpPkRftYiy7lgpR/
         eY9DfcBVHWImvEijJ0ktM4AQbAIbrRP+QNQGH8f1VzoUPiRNYigWzQz1/3oYEUNfwPZw
         Fd7opsqMeLxy98XQ9I58mrZQFfaz0Jq5OJDpx/MpPQTeyxu9z6Kx0RW9SwVi5V2NZJiU
         FN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=oLY01fMg5SWJ8ABL0ouydC9QnY3yaFcOjkVnYRz18p4=;
        b=QrUlKZ0pn8zsvZ43IoNDhxWxKu5CuJJEudM2TpGMEST64dMuSR+Gdhk1rLVG+Mw+il
         +ieyEo8X3phapu0JJJ28UDZ1NPBp86zX5zzFrJJeRJqdOm5zJd6lOYxXtEJi9cWe6zjO
         T11Qf5OTleFLkSCzD8nq5txhTJU7bX8Lufxoc15Zt6BqhtEpOQEwzoYcCNS1CywR0Cxn
         CvQvW2LmklssJh1RyqsIJ+mubUgrPXm36SmID4D+zoWNqgCrPSD11ZvpEUAXoBtx2IXt
         4xNE14w5gqJFkXfwj50YWoNlTYl78HGdlLQ78OOqP8PlCy6p8MuO3HdwOq/7Z59oWMo0
         jfSA==
X-Gm-Message-State: AOAM532zT+heycjafPRVyozosQQzYwSOsxZWNQ4Apm3xZ+YvwRz6hz9l
        NxU06AOONGE7ZILbMKJ90rGjs0a8zILw/iBI
X-Google-Smtp-Source: ABdhPJwVZGvDuY2/d4elkj8fBlvfnCfdZEhbVMBv/CrrbhNWa1L3A8wkIg7n+sMuQL6R0Oyp8D8vAQ==
X-Received: by 2002:a17:90b:3907:: with SMTP id ob7mr7484876pjb.193.1643802191616;
        Wed, 02 Feb 2022 03:43:11 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id il4sm7231684pjb.25.2022.02.02.03.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 03:43:11 -0800 (PST)
Message-ID: <61fa6e4f.1c69fb81.1eca2.17b8@mx.google.com>
Date:   Wed, 02 Feb 2022 03:43:11 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2022-02-02-v5.17-rc1
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
Subject: renesas/next igt-gpu-panfrost: 1 runs,
 1 regressions (renesas-next-2022-02-02-v5.17-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next igt-gpu-panfrost: 1 runs, 1 regressions (renesas-next-2022-02-=
02-v5.17-rc1)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-02-02-v5.17-rc1/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-02-02-v5.17-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      c3b08f12c71900ef2e92cc8f778f3073afe69f4c

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  8d0fb9b3f225183fb3276a0e4ae1f8354a3519e8
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  ae2eb9e18bc58a4c45f28cfd80962938198dec3c =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/61fa58cd990deb4c9a5d6ef5

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-02-v5.17-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-gpu-panfro=
st-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-02-v5.17-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-gpu-panfro=
st-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220128.0/armhf/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/61fa58cd990deb4c9a5d6ef8
        failing since 4 days (last pass: renesas-next-2022-01-25-v5.17-rc1,=
 first fail: renesas-next-2022-01-28-v5.17-rc1)

    2022-02-02T10:11:16.766089  <6>[   15.713166] Console: switching to col=
our dummy device 80x30
    2022-02-02T10:11:16.766314  <14>[   15.719789] [IGT] panfrost_submit: e=
xecuting
    2022-02-02T10:11:16.778418  IGT-Version: 1.26-gae2eb9e (arm) (Linux: 5.=
17.0-rc1 armv7l)
    2022-02-02T10:11:16.784243  <14>[   15.730511] [IGT] panfrost_submit: s=
tarting subtest pan-unhandled-pagefault
    2022-02-02T10:11:16.784467  Starting subtest: pan-unhandled-pagefault
    2022-02-02T10:11:16.912454  (panfrost_submit:285) CRITICAL: Test assert=
ion failure function __igt_unique____real_main65, file ../tests/panfrost_su=
bmit.c:178:
    2022-02-02T10:11:16.924709  (panfrost_submit:285) CRITICAL: Failed asse=
rtion: syncobj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_=
NSEC), <14>[   15.870293] [IGT] panfrost_submit: exiting, ret=3D98
    2022-02-02T10:11:16.924937  0, NULL)
    2022-02-02T10:11:16.925127  Stack trace:
    2022-02-02T10:11:16.936853    #0 ../lib/igt_core.c:1752 __igt_fail_asse=
rt() =

    ... (13 line(s) more)  =

 =20
