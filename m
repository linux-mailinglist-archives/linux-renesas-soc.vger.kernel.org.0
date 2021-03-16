Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D97433D31E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Mar 2021 12:35:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237171AbhCPLey (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Mar 2021 07:34:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237200AbhCPLeW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Mar 2021 07:34:22 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF93C06174A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Mar 2021 04:34:21 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so1277305pjv.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Mar 2021 04:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=H5eDN6gIvndzK0pxFoYqz7uv/7jjygGj4wyfXcfd3d4=;
        b=0kNslzxrxZerDvY9TOm1kMYH1PY83KRYaz1CAwW+fF/DCG5esKlvr32nZJ+5BBxtc/
         4luydV7oW0RNj1e0hIjrCE8j3fLwDW1S3WrqqOEdGwsBM1hPxF3g03G7fpUS1V9uRVaG
         M+EPbDbN+T3YiyDNzj58acfBUW7aD96FXv+yxUVd5O20fyLrKSN9Rp7SmctrwoLGrTyl
         05QBTa+wFM6bVuWZlfYdYm/W0uPQ5tK6XpyUQdc5AoIn+vmrBpZ13XAF9QocVVN73n2D
         4KAvQsuq5wWSw/6ctLp9CdZumh72f8WGyUZ/jjMwyywBlOBmCZQuS3nst4SHqF+MKF5S
         PzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=H5eDN6gIvndzK0pxFoYqz7uv/7jjygGj4wyfXcfd3d4=;
        b=mDtleQ3h5rpo5WxUHvwB/HPnZqFVEkvvPsyE1ZL8eAlbW4coMqQkHm9+hSE22ihA+o
         PT44rb55gUwVZWtDJYRIPMzq3qdC9oEYwHkFi3uKo6ddIbsVC9B8eoAvl53HHaMunKqi
         kCtn3C7mKt9esgZvUH7CF3wxQrkrbu0Gfg8p1Gn3Isml/knj41YAc1/jGWljJbL6bC4x
         PrRC6Ki9idK/gMxoyy6WlIIw787RP/uKifjiKJ+Zd207Mmrda827p1D8GE6VKuIy+5jQ
         93lwc6WLeLVGQ7aJThm2h5HzB8hDQlrfgjBhxTEFFkm80k34rIeQwbm6F3VmuDpwMRv5
         LMmw==
X-Gm-Message-State: AOAM533IR5MA37mqgwg5ik8eK7wzNhWftTNRt7cj8sYEBeogfHnoLhLP
        70LtLG4aTc0eImx+p0/u5j7t+uxOR5znFw==
X-Google-Smtp-Source: ABdhPJwHiqHqfrJObAVhiYn1nZu/d2osDz4V2enETLXCaVY7jpj/d3qXOxuISQpVlmXr637HM29srQ==
X-Received: by 2002:a17:90a:67cf:: with SMTP id g15mr4401234pjm.208.1615894460416;
        Tue, 16 Mar 2021 04:34:20 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id bb24sm2785277pjb.5.2021.03.16.04.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 04:34:20 -0700 (PDT)
Message-ID: <605097bc.1c69fb81.dd522.71e2@mx.google.com>
Date:   Tue, 16 Mar 2021 04:34:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-03-16-v5.12-rc3
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master ltp-ipc: 16 runs,
 2 regressions (renesas-devel-2021-03-16-v5.12-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master ltp-ipc: 16 runs, 2 regressions (renesas-devel-2021-03-16-v5=
.12-rc3)

Regressions Summary
-------------------

platform   | arch | lab           | compiler | defconfig                   =
 | regressions
-----------+------+---------------+----------+-----------------------------=
-+------------
odroid-xu3 | arm  | lab-collabora | gcc-8    | multi_v7_defconfig          =
 | 1          =

odroid-xu3 | arm  | lab-collabora | gcc-8    | multi_v7_defc...G_ARM_LPAE=
=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-03-16-v5.12-rc3/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-03-16-v5.12-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      0f7f46c3ad4c7155aaa1d7077afdab5b3e9f7a9b

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  c4f669f13106862b6d8be38adf7825ae00ca7ac5 =



Test Regressions
---------------- =



platform   | arch | lab           | compiler | defconfig                   =
 | regressions
-----------+------+---------------+----------+-----------------------------=
-+------------
odroid-xu3 | arm  | lab-collabora | gcc-8    | multi_v7_defconfig          =
 | 1          =


  Details:     https://kernelci.org/test/plan/id/60508b05dbb513b33eaddd40

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-16-v5.12-rc3/arm/multi_v7_defconfig/gcc-8/lab-collabora/ltp-ipc-odro=
id-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-16-v5.12-rc3/arm/multi_v7_defconfig/gcc-8/lab-collabora/ltp-ipc-odro=
id-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210208.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/60508b05dbb513b33eaddd=
41
        failing since 60 days (last pass: renesas-devel-2021-01-11-v5.11-rc=
3, first fail: renesas-devel-2021-01-14-v5.11-rc3) =

 =



platform   | arch | lab           | compiler | defconfig                   =
 | regressions
-----------+------+---------------+----------+-----------------------------=
-+------------
odroid-xu3 | arm  | lab-collabora | gcc-8    | multi_v7_defc...G_ARM_LPAE=
=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/605091ef4b7f72272daddcbf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-16-v5.12-rc3/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-8/lab-collabora/ltp-ipc-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-16-v5.12-rc3/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-8/lab-collabora/ltp-ipc-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210208.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/605091ef4b7f72272daddc=
c0
        new failure (last pass: v5.12-rc2-394-g4e589d84c742) =

 =20
