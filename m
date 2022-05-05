Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 353B951C56D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 May 2022 18:51:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347815AbiEEQzU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 May 2022 12:55:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbiEEQzT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 May 2022 12:55:19 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A22D145ACA
        for <linux-renesas-soc@vger.kernel.org>; Thu,  5 May 2022 09:51:37 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id iq10so4734507pjb.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 May 2022 09:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Ib3a0Ja9LTTyssRGL5XLii1S8sJusfuyJ8doc6lbZwc=;
        b=2MOmPd6sg8XG74veDzma4fpLOGRMiNRWZ4pKP63nmJERPivfhUv56pK78hXeGOwITO
         Up/pxUd9FrUYIo+aUCwFDdyDwmsfJEtPD00BqNEHwpBswsefFM7rUCHNxvNEqVevGSXR
         sluUK+ixIg8v0H1Wlz9jpNi/vKBdhm4BaEyfI0tNJpOQbSumbFavVfVNz9y1cbIw15mo
         pzthw8Lw4KKzKMVpMgRsiZLa63gw9SQ5ia9BQZtkEGs9Z0RK5LGK4H/e5p+sWFC1atnK
         7SCNl1ibdF/WBxFZw3WDW1UQeBUdUX6LRv2NeYTYpz+Vd4087bwW0KeGG16mgEzkuZSz
         YU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Ib3a0Ja9LTTyssRGL5XLii1S8sJusfuyJ8doc6lbZwc=;
        b=34G0agbuUUisygfckoXa0PVJOvONDLglODBBwUoQ0TrezKAZfeI2k9d3hO+NMAqjM8
         MrDiZPwNsqXJhRfDCbleQURyZ4EC9eUt1uI3L5uHK9fd5ySNUEUKgj1y43PcJn1z9zBk
         aw9uDbgUyr2CpH9JJMHpvUXDnv2MDaVndApZK7wozDxZov0QIaBSkmviQQ67Xw4H8Wz2
         qhrFSggUwWqhTMU+maNmLmtwLi3BhoIqMCIkd99AqfgLdOrySmpJmItgMj9jF3OJsIOu
         dlov/EGNRnkl68Jp3ZkGMjBYL6kZOrQmwaEBUnRbK88Io717vZIc4/5lqCHiFkEO1UF/
         zccw==
X-Gm-Message-State: AOAM5338fCRLoUe4YXsWDKWnx3exPLrhyi3nK4Df5MKXuuYX9CnophbA
        wAWuq9Jw2Tnheyr8U9hQ9mPUcUQTOEOMsmh+3Dg=
X-Google-Smtp-Source: ABdhPJyMYJaeBqgB/eS+l2Qs2rDzbYe9Rdu1jBAjQxiZt7qlgpl75REycJkVJn8vNHIriuPyYYZF2A==
X-Received: by 2002:a17:902:ab52:b0:15d:2592:eb93 with SMTP id ij18-20020a170902ab5200b0015d2592eb93mr28644952plb.154.1651769496871;
        Thu, 05 May 2022 09:51:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m20-20020a63ed54000000b003c2677c9c9esm1471201pgk.67.2022.05.05.09.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 09:51:36 -0700 (PDT)
Message-ID: <62740098.1c69fb81.7469d.3059@mx.google.com>
Date:   Thu, 05 May 2022 09:51:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2022-05-05-v5.18-rc1
Subject: renesas/next baseline: 487 runs,
 3 regressions (renesas-next-2022-05-05-v5.18-rc1)
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

renesas/next baseline: 487 runs, 3 regressions (renesas-next-2022-05-05-v5.=
18-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
imx8mn-ddr4-evk  | arm64 | lab-baylibre  | gcc-10   | defconfig            =
      | 1          =

panda            | arm   | lab-baylibre  | gcc-10   | omap2plus_defconfig  =
      | 1          =

rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-05-05-v5.18-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-05-05-v5.18-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d51e220c34ad3ba0cdc5237674386886fb842169 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
imx8mn-ddr4-evk  | arm64 | lab-baylibre  | gcc-10   | defconfig            =
      | 1          =


  Details:     https://kernelci.org/test/plan/id/6273d504a2dee4ccd88f5717

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-05-05-v5.18-rc1/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-e=
vk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-05-05-v5.18-rc1/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6273d504a2dee4ccd88f5=
718
        new failure (last pass: renesas-next-2022-04-25-v5.18-rc1) =

 =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
panda            | arm   | lab-baylibre  | gcc-10   | omap2plus_defconfig  =
      | 1          =


  Details:     https://kernelci.org/test/plan/id/6273cf418aa79d82b68f574c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-05-05-v5.18-rc1/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-panda=
.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-05-05-v5.18-rc1/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-panda=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6273cf418aa79d82b68f5=
74d
        failing since 23 days (last pass: renesas-next-2022-02-24-v5.17-rc1=
, first fail: renesas-next-2022-04-11-v5.18-rc1) =

 =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6273ccae7838e493378f5741

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-05-05-v5.18-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-05-05-v5.18-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/6273ccae7838e493378f5763
        failing since 29 days (last pass: renesas-next-2022-02-25-v5.17-rc1=
, first fail: renesas-next-2022-04-04-v5.18-rc1)

    2022-05-05T13:09:52.938714  <8>[   32.673861] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-05-05T13:09:53.961435  /lava-6275617/1/../bin/lava-test-case
    2022-05-05T13:09:53.972461  <8>[   33.707408] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
