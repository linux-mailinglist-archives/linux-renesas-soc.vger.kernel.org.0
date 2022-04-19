Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05A0C507BAE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Apr 2022 23:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347335AbiDSVKJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Apr 2022 17:10:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345084AbiDSVKJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Apr 2022 17:10:09 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A0E932041
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Apr 2022 14:07:25 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id bo5so9539823pfb.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Apr 2022 14:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=5rMotp3gxRK94vbSSCHnuzBQ209JG1E9g+bElXbcNEA=;
        b=rviq2JbVxd20U8U7lKxlo8kB4zmDykqf2IUJ+dsb7umGmOg+7TSAlHZKl9Mzo2avqg
         HdXutyIT4huGGxqZnwbSoEP9LuXnZ7tMwAao+XsZcwCujdsZmpRv5pZGtr+ibTKNpaG9
         cUx99L737blmHXhLvcHVAEFFXE3ZZTj1j8ly3l0UBDWuSpjHV/FYI97moF47+Y9TkAae
         +6moozVoKKr/X+igU3pJzLpiNBWejZS3WjBEP80bIFZBchnF5x6kxe9EusfwdEa7WCsc
         Tn0j2k+/Qc/DLPgT8amCgYvelE1+3xHWSzmm7+Xyew9Zz14OS+Wu0ctzcqce+wP0+QHM
         cLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=5rMotp3gxRK94vbSSCHnuzBQ209JG1E9g+bElXbcNEA=;
        b=ral5Z8vaOtC/vdlbSNEPGeaUlSnBCR2SN2b+ea6lQXIcMLvmBoSp0zj/nhG/JTWCPF
         HP4ryLaIE1WAZisiV5291QvoY5nbn2zwZFwYXDoLbrCOiBZ9b0WcfTlfiYLAvwzpCLkt
         m3kWUOM43KuyImkFEXFMbNM9+6yoc0Pj0VbcBwZcwM3F6pBovt0nQoXJH4i4MkbRuWpm
         4PLpmaPMEAsjzli/fY4Q6u2xjKrApZ9xNIBd7AJow6vq4BGTWxNlGWteWfskrH0bIh87
         xqfxzGOcPnU+1oYLXfYtLRZ9914UWrRO4fkyXeYzMZk7FTDatfuvBfT0XvVIn3pTCqe9
         8GWA==
X-Gm-Message-State: AOAM531I2t3VwKswyZb2CnRWFywaOTfEsuonHyiGHpm34IKkN7cu8mKq
        3InWU6QbASHCo1qKKG0gEOsAQU+fv1Cs6Y6i
X-Google-Smtp-Source: ABdhPJwBZ/mlGmZaa4tlkogyG1GyLqPLNf9O3okIqXJsi4PaKl18VNNA+7MmA9EIRIhNHNb6zRTsVw==
X-Received: by 2002:a63:d347:0:b0:39c:d7d5:77fc with SMTP id u7-20020a63d347000000b0039cd7d577fcmr16206668pgi.201.1650402444611;
        Tue, 19 Apr 2022 14:07:24 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z15-20020a056a001d8f00b004fda37855ddsm16448187pfw.168.2022.04.19.14.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 14:07:24 -0700 (PDT)
Message-ID: <625f248c.1c69fb81.e0ffa.751a@mx.google.com>
Date:   Tue, 19 Apr 2022 14:07:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-04-19-v5.18-rc3
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 422 runs,
 4 regressions (renesas-devel-2022-04-19-v5.18-rc3)
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

renesas/master baseline: 422 runs, 4 regressions (renesas-devel-2022-04-19-=
v5.18-rc3)

Regressions Summary
-------------------

platform                   | arch  | lab          | compiler | defconfig   =
    | regressions
---------------------------+-------+--------------+----------+-------------=
----+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre | gcc-10   | defconfig+de=
bug | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | gcc-10   | defconfig+de=
bug | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre | gcc-10   | defconfig+de=
bug | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie  | gcc-10   | defconfig+de=
bug | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-04-19-v5.18-rc3/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-04-19-v5.18-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      88d9eae5ac50c26359f4e04de8d576b1c0a14475 =



Test Regressions
---------------- =



platform                   | arch  | lab          | compiler | defconfig   =
    | regressions
---------------------------+-------+--------------+----------+-------------=
----+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre | gcc-10   | defconfig+de=
bug | 1          =


  Details:     https://kernelci.org/test/plan/id/625f0a117123c32ba3ae073c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-19-v5.18-rc3/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-19-v5.18-rc3/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/625f0a117123c32ba3ae0=
73d
        failing since 63 days (last pass: renesas-devel-2022-02-08-v5.17-rc=
3, first fail: renesas-devel-2022-02-14-v5.17-rc4) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
    | regressions
---------------------------+-------+--------------+----------+-------------=
----+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | gcc-10   | defconfig+de=
bug | 1          =


  Details:     https://kernelci.org/test/plan/id/625ef9b94b7fde8b70ae06ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-19-v5.18-rc3/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-19-v5.18-rc3/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/625ef9b94b7fde8b70ae0=
6bb
        failing since 63 days (last pass: renesas-devel-2022-02-08-v5.17-rc=
3, first fail: renesas-devel-2022-02-14-v5.17-rc4) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
    | regressions
---------------------------+-------+--------------+----------+-------------=
----+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre | gcc-10   | defconfig+de=
bug | 1          =


  Details:     https://kernelci.org/test/plan/id/625f0a9d82a98dada2ae06ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-19-v5.18-rc3/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-19-v5.18-rc3/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/625f0a9d82a98dada2ae0=
6bb
        failing since 63 days (last pass: renesas-devel-2022-02-08-v5.17-rc=
3, first fail: renesas-devel-2022-02-14-v5.17-rc4) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
    | regressions
---------------------------+-------+--------------+----------+-------------=
----+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie  | gcc-10   | defconfig+de=
bug | 1          =


  Details:     https://kernelci.org/test/plan/id/625ef9ba052f52ecfbae067e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-19-v5.18-rc3/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-19-v5.18-rc3/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/625ef9ba052f52ecfbae0=
67f
        failing since 63 days (last pass: renesas-devel-2022-02-08-v5.17-rc=
3, first fail: renesas-devel-2022-02-14-v5.17-rc4) =

 =20
