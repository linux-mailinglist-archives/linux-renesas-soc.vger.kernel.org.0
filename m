Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A148E50EA01
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 22:18:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245173AbiDYUWA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 16:22:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245175AbiDYUV6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 16:21:58 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8566F47550
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Apr 2022 13:18:52 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id 2so6655679pjw.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Apr 2022 13:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=qapyQJXPOocliP6lXZfJUOgzSrOPOVWwudM5eUPOBmE=;
        b=R2x7BHYanoECVmTJbWh9D5xy3vXQec1X6ymViOz5s3NcjC8omQU92vvufUidaCdFxf
         dRM1IqgC3elODOcbn+mIkyOoXKEWJXGqjICSBp6m6GFLkbZu4lo3RP6FHANjfMVDM6w5
         6rxF4W9OPy3Wt0EBt45qTTRQcgU6GkPaeo8JWmmf8L8eXSBlDstC+UDWS/mkJ+Ik0akF
         NCVKgMJuo2yZ/SeYK8oHRZ2XxT6EUiuQt5YZ7SFxn29w+VBVdY72fxVtRGZOWA4OYoam
         Orm3yU/iF/fpJHmvkiK4ZxgCKHnOdw0CznQGzykSfxORQbPINp4Aybq7LH4joWMbWAIw
         ltdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=qapyQJXPOocliP6lXZfJUOgzSrOPOVWwudM5eUPOBmE=;
        b=V/h7ulYkRBTK201fOJytopVRTknUeUggpWNH9lGLkmzSPzLOfCZFBTKawPTjySZDcE
         nElMkkX7yfbXYxC7n+Ulg0bUyK/yfLvOQOJD3Wb+ytgrtBdq2DNSPJa45H6hWR7Aq3iM
         5ibCuV7gOhZN6Ft6fU3/uMD/murg+KlMaN9zz5d8JCJNqB4u6ESObpMTA7AXIyQ9uBCa
         kOtmzqpotkaaceSZfTlzyVlw/GYqHQpc0IuvjsmWf/xpAhEtdIp0Sc86rjy+OCMZjrmK
         jKbp4pU9Csul9zuozF403w3iIBbuLXQzvynPDwij7jXu8X/elzd/Zq1gMQ/yTZ78gXUJ
         GIfQ==
X-Gm-Message-State: AOAM533fm3q0GlNqmeU4SZezG6KldVZqM/nGGbp+2TeIkZqNGqGpst75
        JinZaFgFMzWorHcGVFgRL/98dRwz6N901j0gOk0=
X-Google-Smtp-Source: ABdhPJxG6nFYTLhRt+S+kclfW9vmEuSBWavbArWui1p8s7E49FwuD/opcdbchVJ4qqMluIs3fzW2Cw==
X-Received: by 2002:a17:902:788e:b0:158:f90a:b580 with SMTP id q14-20020a170902788e00b00158f90ab580mr19191749pll.12.1650917931670;
        Mon, 25 Apr 2022 13:18:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l13-20020a056a00140d00b004e13da93eaasm12857782pfu.62.2022.04.25.13.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 13:18:51 -0700 (PDT)
Message-ID: <6267022b.1c69fb81.7341f.e096@mx.google.com>
Date:   Mon, 25 Apr 2022 13:18:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2022-04-25-v5.18-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next baseline: 334 runs,
 1 regressions (renesas-next-2022-04-25-v5.18-rc1)
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

renesas/next baseline: 334 runs, 1 regressions (renesas-next-2022-04-25-v5.=
18-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-04-25-v5.18-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-04-25-v5.18-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      36f093d12e3c242cf7d9ef8358c73e2eca6c313d =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6266cd2117af353b1fff945e

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-25-v5.18-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-25-v5.18-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/6266cd2117af353b1fff9484
        failing since 19 days (last pass: renesas-next-2022-02-25-v5.17-rc1=
, first fail: renesas-next-2022-04-04-v5.18-rc1)

    2022-04-25T16:32:24.903708  <8>[   32.556136] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-04-25T16:32:25.923951  /lava-6172952/1/../bin/lava-test-case
    2022-04-25T16:32:25.934509  <8>[   33.587069] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
