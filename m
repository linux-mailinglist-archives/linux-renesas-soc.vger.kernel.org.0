Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACA854A735B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Feb 2022 15:39:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236060AbiBBOjs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Feb 2022 09:39:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbiBBOjr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Feb 2022 09:39:47 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEC97C061714
        for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Feb 2022 06:39:47 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id s2-20020a17090ad48200b001b501977b23so7044208pju.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Feb 2022 06:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=GQyk9CMcFfduaDxJyXr4VWcS50jGSfuiSCXRn1W62zk=;
        b=WUcouh/BcG9mv7+d5nsC4SNgpMpMtTNwCRgPPbYNqJU4g61cniF1LrPWJw2V/7o3n6
         vIe8e7vHRk1QQvTc426a/JfUdcDj6X5rbjUJbLUYIwVSclyeDh/qfYzA5ih32JA9Co5S
         8YBGgsm3IEfDFu2cm7IhCZn57YH91qBPdDgD7abpGw5E55AzAq3NAg5OAfGvXnRqo+j/
         op3Fw6MTuZdLFI4tX2dI+kCyXiw3vH4AbYqCLhSpaGBUvYF8BTtsaQiCSMFKIMdFlI0A
         ING10Pt2WuvwCfrCtMiNmUEIUkNp+kWIXpD1xdx11yPiDMoOjeGuwTSdRwcFx5gZpl55
         JUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=GQyk9CMcFfduaDxJyXr4VWcS50jGSfuiSCXRn1W62zk=;
        b=QqkWv3Fhj2C7fk8BeJjmZZ5qsXk2DjCL7B+4itfZlbKa86ovY6T20A465kbh1HjytD
         INjIZSPVLbBzaComtpQVjGBgphWIabkWuRVQK/PcT3ijFOjeMEmwsNp6dFtdPU51a1bN
         uxIfVm1N6sMuxqUNiumJ6+IbxTgUXAUTWPolLtxWjDk7aSmHRQFTMNQFKERVAvuWc1sT
         aimYWx860fSfiAByIwExS0rcJTIa59nhtS8DW6XmkHeeWkyjV+keOnF32IZD5+NmYOaZ
         09BYKbZ0S37r4Favs07Dx3c5kXFQq5leCItLApkd0aVAbbVGBWa4w5srEhry+/JkPyxA
         O8Ng==
X-Gm-Message-State: AOAM532c6j0fMt1v1SXjztqq+fLwdy8iFs8SeKzkp8LBlbZrbjUX75qb
        cI4VulKkya1NI1xyUmTtFUjRfbyoKhKI5Tcg
X-Google-Smtp-Source: ABdhPJxQLZHdNpMZeyQdNciArNeoZgcxAOl5XKtRDNqB/hxBKzG3zn9Npb4qVmUmfqIfE6sGPcEoew==
X-Received: by 2002:a17:903:124f:: with SMTP id u15mr30996042plh.15.1643812787233;
        Wed, 02 Feb 2022 06:39:47 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d16sm25505904pfu.9.2022.02.02.06.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 06:39:46 -0800 (PST)
Message-ID: <61fa97b2.1c69fb81.8a58e.1cdf@mx.google.com>
Date:   Wed, 02 Feb 2022 06:39:46 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2022-02-02-v5.17-rc2
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
Subject: renesas/master baseline: 377 runs,
 1 regressions (renesas-devel-2022-02-02-v5.17-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 377 runs, 1 regressions (renesas-devel-2022-02-02-=
v5.17-rc2)

Regressions Summary
-------------------

platform        | arch | lab           | compiler | defconfig              =
      | regressions
----------------+------+---------------+----------+------------------------=
------+------------
bcm2836-rpi-2-b | arm  | lab-collabora | gcc-10   | multi_v7_defc...MB2_KER=
NEL=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-02-02-v5.17-rc2/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-02-02-v5.17-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      3e49e95eb7db25785124b3ea8ed31fecee9381fc =



Test Regressions
---------------- =



platform        | arch | lab           | compiler | defconfig              =
      | regressions
----------------+------+---------------+----------+------------------------=
------+------------
bcm2836-rpi-2-b | arm  | lab-collabora | gcc-10   | multi_v7_defc...MB2_KER=
NEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61fa62741cc00c02725d6ef0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-02-v5.17-rc2/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-02-v5.17-rc2/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61fa62741cc00c02725d6=
ef1
        failing since 78 days (last pass: renesas-devel-2021-11-02-v5.15, f=
irst fail: renesas-devel-2021-11-15-v5.16-rc1) =

 =20
