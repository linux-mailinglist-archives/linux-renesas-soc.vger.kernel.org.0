Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3458566A2C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jul 2022 13:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232524AbiGELvz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jul 2022 07:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231634AbiGELvy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jul 2022 07:51:54 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00053175A8
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Jul 2022 04:51:53 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 145so11154390pga.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Jul 2022 04:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=V5ZFYer0wMbpz40zzgqcuYyWk0atINHLpWhcmh7Ka/s=;
        b=8CJ+vrPJxppOHcC2cqaDxrMnXjq8YKVqAR3ysJ1F72CjkhsKfQRpOjxxrx6khwuKqr
         1vcgD5viHsds6zy+bfHmtGRyrCnK2v4aM4J/d+EGUR1ZZAu9f3S3L4RHLRpo+F3GaOMk
         C0MSKP76qQQ/YLhJ6svBOiOX0a7zMa01JJwCElZJy5K+U4de8PoQLGGcdmFI+hBWayTh
         2zrv0GR2wPAz2FVpTllNSqoPD6O+l13XxBEzeNtQ2Ddql6eDFrEzelQnsU5w7UK7Lgrr
         t13MffqmZC37KXTLEKNLuWa96yKAKZRiLqsT9hoj3CtVvfb6BEW87dsDlYoUG5giBodX
         d5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=V5ZFYer0wMbpz40zzgqcuYyWk0atINHLpWhcmh7Ka/s=;
        b=sKMPCS19JJ3PUbH8ojCwVB/Cr4hG4lBXgZF4+3lDnwMnf1SbpEzzb2hLCP5EYLgkW8
         C0nwczyzEWwovcaEVtf7N8XgxjMFVMjs/Xpg8YpRX/aSPXOtMdVdKqjczYT6iOedUgEt
         Ia/NQtnRilRMdC/tL0X41F+R7UWpjXr7aN9tK47z+u2xLeNNfCP2LZEgx8K7KEin8DMH
         Fk7T1dq5VYHRN5plwP1R1HmtQyP0EeiW4fJ/MmRss4Mg3fNjlxPr0Isey5GvhEgvH6Le
         HfJ4TF+opRwdupkodbKFagtxVEKQjc5IEbSomSQQovwv6cqc4wf0Enx46h7VLp60u6dF
         fDqQ==
X-Gm-Message-State: AJIora8t1zEfUG7mSKlr5CPZjnll03Pr3GZ/c3/KNrdNcPCDJkG11WSp
        Xpb8Rkn8xuuVZUpX3Yp/WP7bVUyWcxD/5bxo
X-Google-Smtp-Source: AGRyM1tgkXMDcGFyzOId5Tno8AyeY+DEe0EF881R+2GY8teyyvif/TcvfLnwPbQ3Fq1jxlPIP6f/EQ==
X-Received: by 2002:aa7:8054:0:b0:528:9ace:a78a with SMTP id y20-20020aa78054000000b005289acea78amr1440173pfm.49.1657021913314;
        Tue, 05 Jul 2022 04:51:53 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h14-20020aa796ce000000b005281d926733sm9978042pfq.199.2022.07.05.04.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 04:51:52 -0700 (PDT)
Message-ID: <62c425d8.1c69fb81.c28c7.de71@mx.google.com>
Date:   Tue, 05 Jul 2022 04:51:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-07-05-v5.19-rc1
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next cros-ec: 10 runs,
 2 regressions (renesas-next-2022-07-05-v5.19-rc1)
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

renesas/next cros-ec: 10 runs, 2 regressions (renesas-next-2022-07-05-v5.19=
-rc1)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =

tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-07-05-v5.19-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-07-05-v5.19-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b7d295b5ef2e2985496b2a3b9c4594189db6bbb0

  Test suite revisions:
    cros-ec-tests
      URL:  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/cros-ec-tests.git
      SHA:  86181a7fbd379fc42314c450740d2cea8cdf04c1 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/62c424848cd829598ba39bd6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-05-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-ec-rk3288=
-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-05-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-ec-rk3288=
-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220624.0/armhf/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/62c424848cd829598ba39b=
d7
        failing since 27 days (last pass: renesas-next-2022-05-05-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/62c41f6b270bbbb15da39c12

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-05-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-ec-tegra1=
24-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-05-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-ec-tegra1=
24-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220624.0/armhf/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/62c41f6b270bbbb15da39c=
13
        failing since 27 days (last pass: renesas-next-2022-05-05-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =20
