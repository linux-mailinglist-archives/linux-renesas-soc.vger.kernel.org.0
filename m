Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FDE278B4C3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 17:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231777AbjH1PuE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 11:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230252AbjH1Pti (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 11:49:38 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87F5EC9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 08:49:36 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1c0d5b16aacso17196055ad.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 08:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1693237775; x=1693842575;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WD5PDeZoWv80yPKK+abxsGsld8CFUfzD9PFiGVVYDiU=;
        b=ZJD47hUcoG/VF3JSyrhjDNmk8xtWBArfLjNNhTDpKG1ydxUcDv30GVrkG758FJtROL
         m1U5IEbEUiI+1CmAdS6YrvE5yucJfYyTVuzK0LDhFORTw6MOmi0xG7tJR21txEK4JesU
         2+Nkd8EbsABtyQAnDhNku6EHhLJSlxxlQhGVptSGYObbddGYINIclR2/foUbd8dNrIkZ
         tiKzE/zWak/TaYjHBvCrIZWDBzGmpsU1ASP3Ey7nvdSgrRit6wvkzyWtICVqYxQI/Phd
         QATyyMw+GLXFOOeqLJhIkcXii3PRNyOvK7pnh9XoREVJivIsWlvUsHGyog7Sdo28DCwQ
         6BMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693237775; x=1693842575;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WD5PDeZoWv80yPKK+abxsGsld8CFUfzD9PFiGVVYDiU=;
        b=lBiyt3dlLZ1EAhubgBfq6h68lEK+3FuuxlSYvGH1HHwZdJbw6Ey3BmBoZc8PLDO6UE
         yOPbV0K1a7dCMw7lMk9ZulKzqQGKB+zOqOu5d4VqlfVMNXdhphhlNNM1ZkxRnkph72qD
         CUvPptUfzkZ7Zq2LLq7uwZh3WQVllF22vmzGYL3c/nnNxaK5arAMnLvqfuT0khxFIg10
         Pgx31Sqi7xVgiN+VvX97l+HxYhMESuMMjwsOVIiB03DR4j5Wyhm31t/7CKPCct0YBib/
         RR+jONvdrsxeP0G7BsxyaMXrJvWl+9vZgnxB+u+Xpx4G+zdoUl/jhU76sCWTggv2/kXL
         ntIw==
X-Gm-Message-State: AOJu0YwZxfhzoPKZ4lx8CF+/+VkYKTjH87L4odKMxwKzMQQYAGdEkwh6
        ePxK4Lq1LFsE3zH0+qzdHgN+IZT/n5v8JdQ0Pds=
X-Google-Smtp-Source: AGHT+IFwg/7p/+ifi9vB3RdES/ZhjNigdSbpN8xUy3XYSlmB31cNx4DJ/t8cu8zai05G7YzYOgKHog==
X-Received: by 2002:a17:903:22cc:b0:1b9:c207:1802 with SMTP id y12-20020a17090322cc00b001b9c2071802mr22889407plg.0.1693237775589;
        Mon, 28 Aug 2023 08:49:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id e21-20020a170902d39500b001ba066c589dsm3072261pld.137.2023.08.28.08.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 08:49:34 -0700 (PDT)
Message-ID: <64ecc20e.170a0220.17653.4bda@mx.google.com>
Date:   Mon, 28 Aug 2023 08:49:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2023-08-28-v6.5
Subject: renesas/master baseline-nfs: 4 runs,
 1 regressions (renesas-devel-2023-08-28-v6.5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 4 runs, 1 regressions (renesas-devel-2023-08-2=
8-v6.5)

Regressions Summary
-------------------

platform                 | arch  | lab     | compiler | defconfig | regress=
ions
-------------------------+-------+---------+----------+-----------+--------=
----
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-10   | defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-08-28-v6.5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-08-28-v6.5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      08e3979a78878f8514a2b3e826eb22609232b421 =



Test Regressions
---------------- =



platform                 | arch  | lab     | compiler | defconfig | regress=
ions
-------------------------+-------+---------+----------+-----------+--------=
----
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/64ec91c066155e0579286f97

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-28-v6.5/arm64/defconfig/gcc-10/lab-cip/baseline-nfs-r8a774a1-hihope-=
rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-28-v6.5/arm64/defconfig/gcc-10/lab-cip/baseline-nfs-r8a774a1-hihope-=
rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/64ec91c066155e057=
9286f98
        failing since 13 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-08-14-v6.5-rc4) =

 =20
