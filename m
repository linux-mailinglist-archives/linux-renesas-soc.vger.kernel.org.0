Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4A1D73DDCA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jun 2023 13:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbjFZLgw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Jun 2023 07:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbjFZLgh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Jun 2023 07:36:37 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3E14172B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jun 2023 04:36:29 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-666e97fcc60so1340038b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jun 2023 04:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1687779389; x=1690371389;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKzKcOhpXpxpVTZ9b0W78uLOEhvdtpEWYmNoGBWwE6U=;
        b=UHlTibZAYG5y8KkGhKtppTpFdWhBcY2SrmnxFLONo+p+G0ZOeaSREf/RcfAn8CgXN/
         qB75i6HkkXsFh37VKA8OTrlMrWBQ0hu9gK7dFZ6FIWk+BYeeQwcZec5FrX0LJFifXnWi
         olYe8Spzwdj7lZZUcvCI5JmH/Gp67pcObIzCVtgPhykFSjBtUI6jPTXR7r2zE/5y9e5j
         7qWAvLwe7jLR2SIlWdKzEw+ih74t2NafhUYtOfOvDXfjSMTB/uwMF0pe1l8UhWHjn+xH
         NZXfNrMly3UjThebFGkm+jefEBq5rAvhwY/BPf3Rm19EczwsEoXaNXkNQ1XyHpsyemvA
         2cgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687779389; x=1690371389;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZKzKcOhpXpxpVTZ9b0W78uLOEhvdtpEWYmNoGBWwE6U=;
        b=bQY7qGP6cLSPpIayJHpwAvqpQR62H5fzCF2OLWZOUXGsRi9K2KEecaJSRpV3U6/QMD
         ctOIML1AJXk/UcAmChMAMM3OxHUstA26rjWcLMUn0KHAV3AhcSNWc7Bd/H0eKdeY7gLC
         lon+3ZT7bTUmYR/7lWCKBUgnOJTnxcVEwHmnbEDSHjzmYM13Ok8azaPeFrRluh1O54s6
         rhNUmqGtsWQx1srs91f87kdc4mNHU0sJaPvEAQcc0f3/S9qT4zpPzR642TLQ0oaxxkxv
         hVgCRUyGKLXb9OugYu7Sn6n6THcQe+0gbeowTdjuPSwXfXy1iufadratleSifMb0BCBB
         aOUg==
X-Gm-Message-State: AC+VfDx4kCpiUO3G0RhKewLieInLtO+uPiFWBlkYEF4klkiSGKh8rVbG
        mQwZKMrwrRq92yQNvI1lbBfPE8baXCygEI9aB4U=
X-Google-Smtp-Source: ACHHUZ6YEfwtAYV0xSKLGXa8kPFXthK+oTjAj0qzPLfbAByDQlZBt3WShaIsK9Yk7qK8z69lUJls9w==
X-Received: by 2002:a05:6a00:1a88:b0:66a:3b01:2360 with SMTP id e8-20020a056a001a8800b0066a3b012360mr12632472pfv.21.1687779388809;
        Mon, 26 Jun 2023 04:36:28 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id e25-20020aa78c59000000b00675701f456csm2106433pfd.54.2023.06.26.04.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 04:36:28 -0700 (PDT)
Message-ID: <6499783c.a70a0220.efe60.398c@mx.google.com>
Date:   Mon, 26 Jun 2023 04:36:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2023-06-26-v6.4
Subject: renesas/master ltp-ipc: 28 runs,
 3 regressions (renesas-devel-2023-06-26-v6.4)
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

renesas/master ltp-ipc: 28 runs, 3 regressions (renesas-devel-2023-06-26-v6=
.4)

Regressions Summary
-------------------

platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
beaglebone-black             | arm   | lab-broonie | gcc-10   | omap2plus_d=
efconfig          | 1          =

beaglebone-black             | arm   | lab-cip     | gcc-10   | omap2plus_d=
efconfig          | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie | gcc-10   | defconfig+a=
rm...ook+videodec | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-06-26-v6.4/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-06-26-v6.4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      10028679766543b0f6c7b33a01d9b19cf7d35851

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  97c2fdb137a68e1eefed07c900db1a862edcdbf8 =



Test Regressions
---------------- =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
beaglebone-black             | arm   | lab-broonie | gcc-10   | omap2plus_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6499733afe7c2df64c306149

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/omap2plus_defconfig/gcc-10/lab-broonie/ltp-ipc-beaglebon=
e-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/omap2plus_defconfig/gcc-10/lab-broonie/ltp-ipc-beaglebon=
e-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20230609.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/6499733afe7c2df64c3061=
4a
        failing since 13 days (last pass: renesas-devel-2023-06-05-v6.4-rc5=
, first fail: renesas-devel-2023-06-12-v6.4-rc6) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
beaglebone-black             | arm   | lab-cip     | gcc-10   | omap2plus_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/649972de31e30c26c730612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/omap2plus_defconfig/gcc-10/lab-cip/ltp-ipc-beaglebone-bl=
ack.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/omap2plus_defconfig/gcc-10/lab-cip/ltp-ipc-beaglebone-bl=
ack.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20230609.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/649972de31e30c26c73061=
2f
        failing since 13 days (last pass: renesas-devel-2023-06-05-v6.4-rc5=
, first fail: renesas-devel-2023-06-12-v6.4-rc6) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie | gcc-10   | defconfig+a=
rm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/64996b2bee8fd94dc430617c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-broonie=
/ltp-ipc-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-broonie=
/ltp-ipc-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20230609.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/64996b2bee8fd94dc43061=
7d
        failing since 13 days (last pass: renesas-devel-2023-06-06-v6.4-rc5=
, first fail: renesas-devel-2023-06-12-v6.4-rc6) =

 =20
