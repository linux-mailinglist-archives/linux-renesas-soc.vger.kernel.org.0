Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FCB5566A2E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jul 2022 13:51:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232526AbiGELv4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jul 2022 07:51:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232519AbiGELvz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jul 2022 07:51:55 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32A13175A8
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Jul 2022 04:51:55 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id w185so7575601pfb.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Jul 2022 04:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=OaVFtIA/emMPrrXVh6Cq24LiRe2ndnRc/Em7l7xtqoU=;
        b=gHbWwSaR9CaEivdIvENkWw8I0y0gvMM05hSTBLSEEaLc85G8KBQciOyP/Yi2MUoN6w
         NMnFyHIBU4jUoyQ5JRPheu9iHc22WOKegHOB4YV4zHW8b0cBTs69gfQ+rgJoMYWnTDMq
         RgNeZlf0QdjEgKKVlpvgrHOsZy90saRobEDA9YBcjk1xb5pwegXUq92QgMn8JK6Pzdbk
         ncHBvzZLp4VSA/TL1eTyAx/PvZplfpFPV3S7BtsutdQIfZHZMHwVgBWsEMB30HNRycOl
         d/RiSDJpBlSHBr0CN94KOf94/mIoNcpJ3BHORvz+3Ouu2k0q3tT+7rSRctw/5qhonKMn
         X71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=OaVFtIA/emMPrrXVh6Cq24LiRe2ndnRc/Em7l7xtqoU=;
        b=AkuUmo/uOS5Ae/l0mpD8+V4hCGT3u+Q+pn2+NHZjZfBvctp2KpSwArsK6TP4D3e8Uc
         otVvrJFclsJDXixAvdTAlNveHbQm2BKJEZqXefn+b+ty2RjSYt6faWf1LxSYN9M79RW3
         8IXcr2joF5nwZIbCKKiUk5z6Ox3pK6TzHqv8E4k8+AOIpIDU7n27sJi3JceNoBcPquEu
         pTw29ylWB5XXqMZksYEfgmgsruV6jjmoERPtOPtX2/meA9qyNUoc1RctZL6j8J9Xawqa
         3xj2wkoUX+kL3ZdNyVJa/GL5njAb56i0fi8CraAjhpvUcDoSHoAS+3bXxSvWkm6LK03P
         Epbg==
X-Gm-Message-State: AJIora9/kLhIUgDaPe8SrbeKKiGalrfHWg48oz60QwxKgfxEilgNPke8
        dfKBIjbvgUUQCes9owggE6/V2gt5BSlmfZjk
X-Google-Smtp-Source: AGRyM1tmLRbqER+np1oshSusnFQLQF7LK5ZN8twHNWu/HCcTXzJBafmyxtd/3aEKlIvI5pYtC2zItA==
X-Received: by 2002:a63:82c3:0:b0:40d:3b63:a806 with SMTP id w186-20020a6382c3000000b0040d3b63a806mr29637492pgd.75.1657021914512;
        Tue, 05 Jul 2022 04:51:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id jb14-20020a170903258e00b0016bf10203fbsm1559919plb.12.2022.07.05.04.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 04:51:54 -0700 (PDT)
Message-ID: <62c425da.1c69fb81.95775.23e9@mx.google.com>
Date:   Tue, 05 Jul 2022 04:51:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-07-05-v5.19-rc1
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next sleep: 9 runs,
 3 regressions (renesas-next-2022-07-05-v5.19-rc1)
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

renesas/next sleep: 9 runs, 3 regressions (renesas-next-2022-07-05-v5.19-rc=
1)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
mt8173-elm-hana   | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook | 1          =

rk3288-veyron-jaq | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =

tegra124-nyan-big | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-07-05-v5.19-rc1/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-07-05-v5.19-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b7d295b5ef2e2985496b2a3b9c4594189db6bbb0 =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
mt8173-elm-hana   | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62c4133a56a50f7f37a39cb5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-05-v5.19-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/slee=
p-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-05-v5.19-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/slee=
p-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/62c4133a56a50f7f37a39cb6
        failing since 17 days (last pass: renesas-next-2022-06-07-v5.19-rc1=
, first fail: renesas-next-2022-06-17-v5.19-rc1) =

 =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/62c4232716506c17d5a39be7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-05-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk3288-v=
eyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-05-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk3288-v=
eyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/62c4232716506c17d5a39be8
        failing since 27 days (last pass: renesas-next-2022-05-05-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
tegra124-nyan-big | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/62c41dffa4be1fa76ba39be6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-05-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-tegra124=
-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-05-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-tegra124=
-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/62c41dffa4be1fa76ba39be7
        failing since 27 days (last pass: renesas-next-2022-05-05-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =20
