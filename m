Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0B05611721
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Oct 2022 18:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbiJ1QKV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Oct 2022 12:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbiJ1QJt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Oct 2022 12:09:49 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 074D1220FAB
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Oct 2022 09:07:42 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id 192so5146373pfx.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Oct 2022 09:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZx0ULRM9XDMu0Lf0N2j+9JxezZNO738UZy5+Pn1ZFg=;
        b=1HFUL4yrO7uzP6hyzvSLljcQwTeGZiTYe1BrJt/ezJfP/EhtRiCDjSLvahgMn0j8gX
         KzjMpIBda5V18nABkDUVXmDZKegUhko3NERGQrYVJGTPydgTjibbMYVAfEtbQ6e07nrr
         NUHyszJAHKRKvIFOP9t8911lkHd54wsjwLElzwLM4lhOjPuaNa6Kp8bxDGsiKqbFBhi5
         c20Mj8MMT5yIBR4ZKUGvT5gRsDd5rRMZIYb3lrrMGkK8TfHJQj5ujEzEo64UclIQJeo5
         dX4mz3olothTfhn3JJ13TCNHqYUvB6r+NFN1gAll6DFSvjY8Zg0gx/pqm49XU8mF2o7r
         Pt/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZZx0ULRM9XDMu0Lf0N2j+9JxezZNO738UZy5+Pn1ZFg=;
        b=CbiAtD7pd5PetSRnWJ/lahZpMVToH7s7wWtRlTGyTD0OTP1mMj4N5QaP30cuKzFmhp
         R2jP3809fHWwOUBsiGL/vFTExIOlo0cnAD5gNN5RY1bzvQ+CUFcI6s890HPZ/5qy51Qv
         a1UXyWACOF81uIsQHsAiJC/4okBat7DYhnjy5+Sehe7xQupnUNY/Dy2XBUunoETFqMP5
         tW49hFJKOJUzWXrMomlALfsM4o+b8/HETzQQYl5Yi08cMVtARukPRH+1I9qC7Vyp0yN6
         BwQBZfwzHroJcI7co7QbBFEu0OMQhTFkbhBM/tGsFaipmm2oJDDH3b96XhbYfezOMi/Z
         POxg==
X-Gm-Message-State: ACrzQf03Wfu7LGBgv1rxy2S/sD9/bymBJ3lJYZDU3J93Spm5ek9Tgcm4
        HZL67bN2lL1vY2JMvyHDs1e8p9m0Ap2pZgXv
X-Google-Smtp-Source: AMsMyM7UvGXfYdUNlUb8jQqOxdMWk7n5qpPOqfHrQabkn9mWOcHPqZXb8RSmwbKZQnJLAIbrZ/I5bw==
X-Received: by 2002:a63:4283:0:b0:457:dced:8ba3 with SMTP id p125-20020a634283000000b00457dced8ba3mr246304pga.220.1666973261276;
        Fri, 28 Oct 2022 09:07:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l17-20020a170902d05100b001782a6fbcacsm3223378pll.101.2022.10.28.09.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 09:07:40 -0700 (PDT)
Message-ID: <635bfe4c.170a0220.0cf5.64c1@mx.google.com>
Date:   Fri, 28 Oct 2022 09:07:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-10-28-v6.1-rc1
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next igt-gpu-panfrost: 1 runs,
 1 regressions (renesas-next-2022-10-28-v6.1-rc1)
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

renesas/next igt-gpu-panfrost: 1 runs, 1 regressions (renesas-next-2022-10-=
28-v6.1-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-10-28-v6.1-rc1/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-10-28-v6.1-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      4bff929bc882c742102dbb29613c4cf8c0c92fa5

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  82b2b1e8987c182d14fcaf5a3a3b8ee1b4d5e1df
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  9eff5fba09403bf1df3a1edd655b66fa1b60de2e =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/635bf1354b973be27be7db50

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-10-28-v6.1-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-g=
pu-panfrost-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-10-28-v6.1-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-g=
pu-panfrost-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20221024.1/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/635bf1354b973be27be7db53
        new failure (last pass: renesas-next-2022-10-24-v6.1-rc1)

    2022-10-28T15:11:44.139205  <8>[   34.979033] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpan-submit-and-close RESULT=3Dpass>
    2022-10-28T15:11:44.173101  <6>[   35.015186] Console: switching to col=
our dummy device 80x25
    2022-10-28T15:11:44.178698  <14>[   35.021834] [IGT] panfrost_submit: e=
xecuting
    2022-10-28T15:11:44.184901  IGT-Version: 1.26-g9eff5fb (aarch64) (Linux=
: 6.1.0-rc1 aarch64)
    2022-10-28T15:11:44.195547  <14>[   35.035992] [IGT] panfrost_submit: s=
tarting subtest pan-unhandled-pagefault
    2022-10-28T15:11:44.199898  Starting subtest: pan-unhandled-pagefault
    2022-10-28T15:11:44.315289  (panfrost_submit:354) CRITICAL: Test assert=
ion failure function __igt_unique____real_main65, file ../tests/panfrost_su=
bmit.c:178<14>[   35.151610] [IGT] panfrost_submit: exiting, ret=3D98
    2022-10-28T15:11:44.315420  :
    2022-10-28T15:11:44.328439  (panfrost_submit:354) CRITICAL: Failed asse=
rtion: syncobj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_=
NSEC), 0, NULL)
    2022-10-28T15:11:44.329695  Stack trace: =

    ... (10 line(s) more)  =

 =20
