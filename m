Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE68172C52D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jun 2023 14:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236657AbjFLM4k (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Jun 2023 08:56:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236659AbjFLM4W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jun 2023 08:56:22 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30FC92954
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jun 2023 05:55:22 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-650352b89f6so3242606b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jun 2023 05:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1686574497; x=1689166497;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r8cHyPMNJWbikxgFUQBKGYfq+lFATuWbQCO3UnWzw0w=;
        b=VV17nI/qi81F+NXpZOhTSM4ITwljDVyMJ/7UteAI1Xo/mTpEE2oT0sKVfX0CSFCuwx
         y3GcpAHyH46I2zSqI2GGG/YxMF9XBQZDuUpDx1tSLUCvmfqwzZiEEYSNwuFYYx2XsFCC
         3oNzTqvgQeAZgQF/Bhdl6HUta5FSQX+lGa+Zf4wccDnE+wQMyOSNYyj7M1x2PNzy7zOV
         61G7CVmXhjZr4z/xdaqcADry7UVYiEGJShtEbf6hhcXrvPX5ls1LBI5RJ8hUsXrQ9Hdo
         vRqzRtyCJ0IUtzg5ljH9kg+pBDZRqk40yJunoVkKpC4lfD/b3hCqyhgSdHWPxnkC850d
         N4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686574497; x=1689166497;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r8cHyPMNJWbikxgFUQBKGYfq+lFATuWbQCO3UnWzw0w=;
        b=CatoibpyAlJFw5tajnMcVgEWVmwKAlQa3JTygvI2ZfMXe+WLwYlZt4+ScjmLSm2GcO
         VoVUQHvLneqAXFiXiQPyfV0cnjtyy987V52PCDGXheBesZ9c3crKSOBpqkuRfp2SrrNt
         xsdGCxjRw6njqdNMIe2hvTWrNAaKqOXwEgpjohd7UAXgW+AZsmwyI4NzCpNINnce+LVA
         GnsvHju5LPHsC8ba2755wjAIJ3fSOxJXCOXqGtJfPsk4664GpifSAsJIYNomeXoTpX2G
         zk+hqZzyhSvr2Dj8Efpe07BRyojtQShfQH1zV+YUx+02XQs9BOKoye5IDZSoNVaMtTw6
         ruMw==
X-Gm-Message-State: AC+VfDz3W78M6UWafb/WAa53BvKjYJQDlYkrzyvmj7BySA9OuAt7oQiJ
        oiSDSw15nyVjx618phcvvRTS6wctKWVGGrH0qJY7YA==
X-Google-Smtp-Source: ACHHUZ7buDWKiJIfG6C0QuB41GTo8fZYCSMeOg7EnfQdIPGU2M46OX84hJqgWK39F3KKKTtK7hItnw==
X-Received: by 2002:a05:6a20:96d1:b0:118:5d5a:f218 with SMTP id hq17-20020a056a2096d100b001185d5af218mr8252655pzc.12.1686574497020;
        Mon, 12 Jun 2023 05:54:57 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id s6-20020aa78286000000b0064ceb16a1a8sm6730887pfm.33.2023.06.12.05.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 05:54:56 -0700 (PDT)
Message-ID: <648715a0.a70a0220.5441f.c45a@mx.google.com>
Date:   Mon, 12 Jun 2023 05:54:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2023-06-12-v6.4-rc6
Subject: renesas/master sleep: 8 runs,
 3 regressions (renesas-devel-2023-06-12-v6.4-rc6)
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

renesas/master sleep: 8 runs, 3 regressions (renesas-devel-2023-06-12-v6.4-=
rc6)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-06-12-v6.4-rc6/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-06-12-v6.4-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      eec974413697190538e69788efc6048763f9b64e =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6487034d9a3e99d32d306344

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/sleep-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/sleep-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/6487034d9a3e99d32d306345
        new failure (last pass: renesas-devel-2023-06-06-v6.4-rc5) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/648704f1c330196e37306145

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sl=
eep-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sl=
eep-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/648704f1c330196e37306146
        failing since 20 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-22-v6.4-rc3) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64870623c0c604a62e306131

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sl=
eep-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sl=
eep-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/64870623c0c604a62e306132
        failing since 33 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =20
