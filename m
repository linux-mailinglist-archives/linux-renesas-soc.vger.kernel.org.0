Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE42A56697F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jul 2022 13:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbiGELdT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jul 2022 07:33:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230026AbiGELdN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jul 2022 07:33:13 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1595916584
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Jul 2022 04:33:13 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id i17so1724787pfk.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Jul 2022 04:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=0iefyq1lf55y/Hc/gF+yldbtV1CoJZylY2pCBJobSHo=;
        b=0GqyrkzJSpO1dOeHqEB+Sg3EL6H0Opv9I2cVeQmIwD9iFnvJTGHA+tUlT8cYpCaiOU
         +VzZnHism0xvA275jaSlFrMjvO1GU/cjTq/oxlX8Dc8CdXzTqoeRz/nvmtBPP7TZuAZ5
         34er5LWemH0Xvn3uhFo6Y5M598WKlo8BtVzFOod6TkRjt18oY9Nn6NQbuynFqTeS3W7v
         +LzPTHWTk0ppGb3dgOBwLwd4Nc1p6Obl8YFzbcKR4RHynjivNIA1ua/sEw38X4nFDPdG
         YvB5UWebLkPzkop7+PNHgzPGn+rvR+Kn8w25eqVBihgNE2EN3+4X9sPviOaZQ/PxoKPL
         HlsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=0iefyq1lf55y/Hc/gF+yldbtV1CoJZylY2pCBJobSHo=;
        b=PV3mFVd9YlH1POquT8xVwIeQOYxG0ZAENLfd3FbhT1fFicHGjYiTSwYhLigzqZzvDQ
         WMWvovXE3NU3j+Ie5/4bGdVh02aPiW3EbT10CpVl41ikWTszVz/eg2DQyeGFstM/r1ea
         ygmffvdbvXM/DGAKF8/5SkLoEtRpCtbTlFg0Ii6Ie+66smXDe2VRf2ZeEga/o+iHONU8
         rQBXLpe1SkjGi3l2fiZavMpumZ7ITyB2K659GYTGhZgKu6fldwqQ8Lf2rpJ2AOQ5OVw1
         5adb8CnYUnmSy1uU8UtOf+FcSPvjAh6sKDUFrSOiWENMd4vPN7VhSgR/6M35bZJOXxXS
         o7LA==
X-Gm-Message-State: AJIora+A+j8OPtjU/Ru9tDLNc9fnNkhnAQZ13oDCKBeoLIkLc+0GnVv+
        10rLWoHkpkdOIaArtUwY25RL9BzexyTPW1x9
X-Google-Smtp-Source: AGRyM1tkKt6S7CGmeVcoE/uPDVuP2kgs/Eca3//GsMpKcwdaDYfXqVEKtsjFCD84cQQjMJ666z03mg==
X-Received: by 2002:a63:744f:0:b0:412:6f9a:dda1 with SMTP id e15-20020a63744f000000b004126f9adda1mr2655269pgn.195.1657020792685;
        Tue, 05 Jul 2022 04:33:12 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id nn12-20020a17090b38cc00b001ef59378951sm5086201pjb.13.2022.07.05.04.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 04:32:57 -0700 (PDT)
Message-ID: <62c42169.1c69fb81.7f93.6abf@mx.google.com>
Date:   Tue, 05 Jul 2022 04:32:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-07-05-v5.19-rc5
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master igt-kms-rockchip: 1 runs,
 1 regressions (renesas-devel-2022-07-05-v5.19-rc5)
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

renesas/master igt-kms-rockchip: 1 runs, 1 regressions (renesas-devel-2022-=
07-05-v5.19-rc5)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-07-05-v5.19-rc5/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-07-05-v5.19-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b83d3c70c208b5154097ddfcf4be9a802b12966e

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  f7828dc180ba3427b5e405fab25e9846c07322bc
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  02153f109bd422d93cfce7f5aa9d7b0e22fab13c =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/62c413a47b2c313e0ba39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-kms-roc=
kchip-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-kms-roc=
kchip-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220624.0/armhf/rootfs.cpio.gz =



  * igt-kms-rockchip.login: https://kernelci.org/test/case/id/62c413a47b2c3=
13e0ba39bce
        failing since 28 days (last pass: renesas-devel-2022-05-23-v5.18, f=
irst fail: renesas-devel-2022-06-06-v5.19-rc1) =

 =20
