Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AFC0478F3E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Dec 2021 16:11:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238069AbhLQPLZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Dec 2021 10:11:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238068AbhLQPLY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Dec 2021 10:11:24 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B51EFC061574
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Dec 2021 07:11:24 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id z9-20020a17090a7b8900b001b13558eadaso4337102pjc.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Dec 2021 07:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=EWKgG6vxEJMgl+SWfrYd3vB5mrqJmowp8E6sOE2C2uQ=;
        b=XgTbghKpwdbNe1p4cBZsyFYTkWJIitssyaC0NHYcajgP1ZzD8CgeERqt5BVZg4/+7P
         k59w7A3x9UspSSp7vjnW2R7sMMWhkZTC8eubTBFrd4+zFbJgH8yGAPGsUBIKScaQtNEF
         NLPiCSwhUF/0ssZDvzRRJ/Jzg7Y70+UDFOcUBjJb9VOhuudq3Td09QmrFEyMrxqBA/Rr
         hqTWnRc2uqj+BnFHK8k2x+KxOVwLLPKB4nWa1J9aQNHKpDriwEgDwezWmq8p0oiq1n5L
         Np/5Xg3bCf86SJNQLBJZl5HeglfSpDro9D9n7kEF7tZ2aDRY0foKLWCi3UJ86T0uR8by
         /nmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=EWKgG6vxEJMgl+SWfrYd3vB5mrqJmowp8E6sOE2C2uQ=;
        b=xyixTh60zMwmOnV9pGXXLF35fjqiV7VmKlEpZzQ8j14o+IDtsaB3wd4nSkDW/5kOyk
         Rp4NtXzLAjNTUyV1K0C9omGYhY2lBSL4mxpFEw1bhp5wt1jde6vv4lFh/DrxAN6gEjHJ
         FSrttAvDrW+Y/pnuX3CLKAkuQmhMaoJZEuM7E//2Yo8EskvtgSVyw9xnRFcQN3ByFX+R
         wxSQq7WB2C3H7eKD+gKOm7kXKQSsSMfkr3aSuoCuaX6S9P8hLxu01qUr/9f6txAmRdyQ
         IC9sSuzYph0n1nx0ewzi9efux76J8pxvV5zgCXnTi+f9YF2HPcRcYCHmM6eJfUcZTbkW
         n6oQ==
X-Gm-Message-State: AOAM532QRhY0/j18BHtPY6OtfAFYzkCs+rfN3IozhKhLH4AfT4EeL3FY
        foFUFgpL4p9vBYyTbxSQQ7vUjn+L++CWyJQx
X-Google-Smtp-Source: ABdhPJxkPxiAFU3h3udHqRtaJI21w7+68Cc3BFxFSdkgtOqChmVojYg9sSr/CENLS80eVOaF1lnFjg==
X-Received: by 2002:a17:90b:3ecd:: with SMTP id rm13mr4306698pjb.157.1639753883994;
        Fri, 17 Dec 2021 07:11:23 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id oo13sm9665588pjb.25.2021.12.17.07.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 07:11:23 -0800 (PST)
Message-ID: <61bca89b.1c69fb81.33eb3.9c1d@mx.google.com>
Date:   Fri, 17 Dec 2021 07:11:23 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-12-17-v5.16-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master igt-gpu-panfrost: 1 runs,
 1 regressions (renesas-devel-2021-12-17-v5.16-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-gpu-panfrost: 1 runs, 1 regressions (renesas-devel-2021-=
12-17-v5.16-rc5)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-12-17-v5.16-rc5/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-12-17-v5.16-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      9aa3a08281f795eec94a1d7ee8c48ed7dec31a7c

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  8d0fb9b3f225183fb3276a0e4ae1f8354a3519e8
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  136258e86a093fdb50a7a341de1c09ac9a076fea =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/61bc98f2929e40994d397138

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-17-v5.16-rc5/arm64/defconfig/gcc-10/lab-collabora/igt-gpu-panfrost-r=
k3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-17-v5.16-rc5/arm64/defconfig/gcc-10/lab-collabora/igt-gpu-panfrost-r=
k3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20211210.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/61bc98f2929e40994d39713b
        failing since 0 day (last pass: renesas-devel-2021-12-14-v5.16-rc5,=
 first fail: renesas-devel-2021-12-16-v5.16-rc5)

    2021-12-17T14:04:16.569248  <6>[   23.952242] Console: switching to col=
our dummy device 80x25
    2021-12-17T14:04:16.575591  <14>[   23.959463] [IGT] panfrost_submit: e=
xecuting
    2021-12-17T14:04:16.591279  IGT-Version: 1.26-g136258e (aarch64) (Linux=
: 5.16.0-rc5 aarch64)<14>[   23.969139] [IGT] panfrost_submit: starting sub=
test pan-unhandled-pagefault
    2021-12-17T14:04:16.591605  =

    2021-12-17T14:04:16.595594  Starting subtest: pan-unhandled-pagefault
    2021-12-17T14:04:16.710110  (panfrost_submit:337) CRITICAL: Test assert=
ion failure function __igt_unique____real_main65, file ../tests/panfrost_su=
bmit.c:178<14>[   24.090815] [IGT] panfrost_submit: exiting, ret=3D98
    2021-12-17T14:04:16.711387  :
    2021-12-17T14:04:16.724513  (panfrost_submit:337) CRITICAL: Failed asse=
rtion: syncobj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_=
NSEC), 0, NULL)
    2021-12-17T14:04:16.725736  Stack trace:
    2021-12-17T14:04:16.730450    #0 ../lib/igt_core.c:1745 __igt_fail_asse=
rt() =

    ... (14 line(s) more)  =

 =20
