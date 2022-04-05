Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F39384F54FA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Apr 2022 07:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235289AbiDFFX0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Apr 2022 01:23:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1587791AbiDFAKX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Apr 2022 20:10:23 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E35714F101
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Apr 2022 15:34:42 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id fu5so844657pjb.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Apr 2022 15:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9VXwo8ysy1lBV0wmvpzqmbuAPRLfDzjuz6gm3NlbIVc=;
        b=a0l2phJgnfwT2gX5VBBBZy5XNbTwBW7lhNh/LrUqwQIRd6b2p8MRxAYqASLyi5qJig
         LwSERxWfwIiwZfv+wjVf/sZwTg/2DRPbJdfOwsdq1erw6WVmP2ggstHt0iHzbGJvUcuN
         0JFxovzNTlwG9GU2Q1pE0Ua2VqkYXrNRs+XiTUM98NQ2SiFMphNtXlmQIjfu3tGp3Hjx
         v2bfS9+fJI5whYBSKkTAOOkADTJMhPSp+d7nPnehKOP4ovURRPDE1erpw7Rjmm9S5nzo
         pp9l5I54rwi7WC3mnBx6D+RP0p3BBOrAWK+wyKBDWf0RtxsFcvgY7Q+95tvxPNpYAi27
         isnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9VXwo8ysy1lBV0wmvpzqmbuAPRLfDzjuz6gm3NlbIVc=;
        b=3Qez8kgyBPCCjcMe4zGBNhCL4IEudyeAMHPwm2YWffpfXLwOVjLU281PrT2WhEvcjI
         gBFmZgZUXTv2XbTm/c+5nUUx+JoKtzz5gKWvAyD/bYiDXZ5UJ886heQLFh2tBpVyAF1O
         uBsvRckiVqZtqPelh4kfqrzgfWmFG3dEKvAqrfy4ylrWypkrDEh4Q8GlHls9If0xVm7O
         4lDyHvd5e4CnvIHgSaztyHPvK3FmFhGds+T9S9ORdFYthjPOj3UlAUMwgKJKYLLPfspL
         Xe+nxz7MojUf7IS05LtnrRcKLRXTA6prezmiN6B4eWIsTGa9/xM69/5BDMu9PLuGczgV
         oy/w==
X-Gm-Message-State: AOAM533W1wjcWStJZnnnpTym/au9ToxY6zkME8xRW4QK3UDcyrSjZK3/
        LSkFvlLPbGQx95anHhMIeelihEhlU81pKQgqKuk=
X-Google-Smtp-Source: ABdhPJwcrzGz7M8BCwmUfT8h8yv59t9IDr2AUE65SxcQH5eMrL52an6QFZsJxuHsA7UDF256/HTgsw==
X-Received: by 2002:a17:902:e802:b0:156:96aa:206d with SMTP id u2-20020a170902e80200b0015696aa206dmr5518386plg.102.1649198081752;
        Tue, 05 Apr 2022 15:34:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y11-20020aa793cb000000b004fb597d85b2sm16570084pff.160.2022.04.05.15.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 15:34:41 -0700 (PDT)
Message-ID: <624cc401.1c69fb81.adddf.c456@mx.google.com>
Date:   Tue, 05 Apr 2022 15:34:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2022-04-04-v5.18-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline: 174 runs,
 4 regressions (renesas-next-2022-04-04-v5.18-rc1)
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

renesas/next baseline: 174 runs, 4 regressions (renesas-next-2022-04-04-v5.=
18-rc1)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
meson-gxl-s905d-p230       | arm64 | lab-baylibre  | gcc-10   | defconfig+c=
rypto           | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug            | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug            | 1          =

rk3399-gru-kevin           | arm64 | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-04-04-v5.18-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-04-04-v5.18-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      eee41de7440d0f559567f48dd5920f8155247174 =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
meson-gxl-s905d-p230       | arm64 | lab-baylibre  | gcc-10   | defconfig+c=
rypto           | 1          =


  Details:     https://kernelci.org/test/plan/id/624c8e7fea29fab40cae06d1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-04-v5.18-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-=
gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-04-v5.18-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-=
gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/624c8e7fea29fab40cae0=
6d2
        new failure (last pass: renesas-next-2021-11-19-v5.16-rc1) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug            | 1          =


  Details:     https://kernelci.org/test/plan/id/624c8fa03a1bef3edcae0693

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-04-v5.18-rc1/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-04-v5.18-rc1/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/624c8fa03a1bef3edcae0=
694
        new failure (last pass: renesas-next-2022-02-08-v5.17-rc1) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug            | 1          =


  Details:     https://kernelci.org/test/plan/id/624c8f8cc0182e4984ae073a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-04-v5.18-rc1/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-04-v5.18-rc1/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/624c8f8cc0182e4984ae0=
73b
        new failure (last pass: renesas-next-2022-02-08-v5.17-rc1) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
rk3399-gru-kevin           | arm64 | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/624c8d842b76f86ed3ae06ae

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-04-v5.18-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-04-v5.18-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/624c8d842b76f86ed3ae06d0
        new failure (last pass: renesas-next-2022-02-25-v5.17-rc1)

    2022-04-05T18:42:01.749533  /lava-6030980/1/../bin/lava-test-case   =

 =20
