Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA8D95AB7A9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Sep 2022 19:41:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235637AbiIBRl0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Sep 2022 13:41:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236668AbiIBRlZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Sep 2022 13:41:25 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75E6EDF4C1
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Sep 2022 10:41:23 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id f12so2490494plb.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Sep 2022 10:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=6AgqB+jGso+MEhEO6Mb/pRAXOon0Dhzhg+XIFIDgOrI=;
        b=EWboV1MEtO3RDXjiFXjsoFqUeYx4j1rsdHnK14fwcZZiIfnnfRolWyyBihSjgz8vCB
         TeBud0nnLSS680MAs+8A8PIeWkWT7/pg9MgwoprTDP6AXoh/ZWpMje69BJoGuK5QMFYN
         A39tyjU9qIcEfJ61gICGaJUq+14M3PBwy5UEVwCqMONvuwmXmVZM56QBXadHnhi+H68m
         gZ9SkL+JSB6llHKC8jMeKAvKxN4hITzzfkFl5afX9tqGiUK3RBiLpFkfmhGVhKkA8zdc
         VqxI2DM2jam+WXU+7Q3HrdzVLmKwxJ9e19PpBYeDGCY0NeSzdRujstDuqS+y2pPmsBQz
         zlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=6AgqB+jGso+MEhEO6Mb/pRAXOon0Dhzhg+XIFIDgOrI=;
        b=mrsEckOmJgJlvsdEV3AMUHH8fEEu1KlaeyR7BPh1dPXtdxRDmaYi2E8hWKHV4N3M6Q
         VLPugEey2n1B7Z5XiC06WvBUggr6M7x1VXLASoHhwHKka7GRFELqRi8GtdPmt7Xnbt0+
         IME+8cbvdXZXYjw6ccFn0yqMc9hOsVQSRmkWQa92YCbbBTi7X8JJZPSHHdPFVkQt9OJ2
         ZSbPaGYNJ/7VSI0LY0Sjoj73fnK1rJXi/pHh8BhAFi4DkZO2R4A2on7LapxtZO3l00Ml
         nbmPRSkBfpGE5YpppLZBeIY3O+hsoAk4z1ANE9tDl86PigwFmy7LyJeklB4sPHyCti6E
         ajBA==
X-Gm-Message-State: ACgBeo0/eVISugUJzyF3meAhPqd8SwAMkEvzJovfNHHGo1/kOi87UEtt
        1kUmQWQgxHvWNHcMEl561p5sFMuof/3xFrO8Hy0=
X-Google-Smtp-Source: AA6agR4MpowvOvGRRmp77y8X+kPpF5vohPm7Woc+knPodsIpYnYBlystWNELqACmYZ+YrL3PYgRRng==
X-Received: by 2002:a17:90b:38c1:b0:1fe:387e:b185 with SMTP id nn1-20020a17090b38c100b001fe387eb185mr6124166pjb.204.1662140482560;
        Fri, 02 Sep 2022 10:41:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g3-20020a170902d1c300b0016d66d49b85sm1879052plb.239.2022.09.02.10.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 10:41:21 -0700 (PDT)
Message-ID: <63124041.170a0220.287be.3989@mx.google.com>
Date:   Fri, 02 Sep 2022 10:41:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-09-02-v6.0-rc3
Subject: renesas/master sleep: 7 runs,
 1 regressions (renesas-devel-2022-09-02-v6.0-rc3)
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

renesas/master sleep: 7 runs, 1 regressions (renesas-devel-2022-09-02-v6.0-=
rc3)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-09-02-v6.0-rc3/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-09-02-v6.0-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      cac9a30c2d54cde55723b592346005941a139ded =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63122f4b437be22a14355669

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sl=
eep-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sl=
eep-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220826.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/63122f4b437be22a1435566a
        new failure (last pass: renesas-devel-2022-08-30-v6.0-rc3) =

 =20
