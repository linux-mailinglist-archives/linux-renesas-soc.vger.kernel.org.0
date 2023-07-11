Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76A6674E28D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jul 2023 02:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbjGKA2E (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Jul 2023 20:28:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjGKA2D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jul 2023 20:28:03 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69D62FB
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jul 2023 17:28:02 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-55be1ce1669so2539443a12.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jul 2023 17:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1689035281; x=1691627281;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zl0I3JKCIEDBCoINy12kCTZfQyQ0yCbi92QaPSWGJEM=;
        b=bN72tJuDbglDn2YJ9pTmoImrGC/wCvUHaUvu7v/A5zEJ0QqAETCGKD9BUvUrrdIzjp
         woLAoaIp+bfGaIRaWGbp4ub/5tMYaaEfkJWQUW+V1cTekz7iW5hlQQAhURMnXsgsmd4W
         RitD0xaAIWBhZ9mFU4riHDotez4F5uKMoLHz5Fm8XNoXYg6hKbYjoiKCNWKAQOwvlEY3
         bQG9N2QLyb50k5K8Kz9JmP1E/wYRq0yCg3R+3rCWpqNEDTB2vJZa1/i9obIsIPrYpAyH
         toxZM9u/enwWIi95QldpipVFrBAiuyGcFhRmlM3QB4SI7FsQVzB3263NcrzQC0i/1SLq
         sZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689035281; x=1691627281;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zl0I3JKCIEDBCoINy12kCTZfQyQ0yCbi92QaPSWGJEM=;
        b=UFHWAwrYHOEWj9EUhttFwjQV7U1LwImK6BztopPqgPMQH4uqKu0Qbh0B0pO83PomUZ
         0dFCq+1CjdEVMv1fMpxyxw8o3r9OoQgbnS9tatyBHUbL5aDNV6dCuXgMXjSn0dPDNFln
         UNTtVNw24TkrH51yuVrkIpVB72JAAqgs07GXFDsOMcwtsLgnoCY0lPhmQd6qIi5tHb6D
         tVjs1stx0Vi9otr7ZufTDZt6CdWou9iWTZ6zccBdk82xOMBYG1KKfmUQwi+Hg3QGrKDc
         fyVKC2A1NF+ratDAMF7vSzERVvlggo44sBr/B4uTL7K6+Cpc7Ns4z3mfFSSMp/HXah15
         tlPg==
X-Gm-Message-State: ABy/qLYfRsUzEAqLQ2ks3yeeTaa4vzN++t063XIKc6dIx7sCAb8c4qem
        lU2ea+1Iyicofbs5hlelvISCYorVEFKA21TBBzckQg==
X-Google-Smtp-Source: APBJJlFOHDNjGVgYbNtwzSaXAnHJaJ01DdJ3+XUUupnq8iDEMnOcJo1ax1r2zO+OCBWTvjnho5rIIw==
X-Received: by 2002:a17:90a:f3d8:b0:263:76e8:b66f with SMTP id ha24-20020a17090af3d800b0026376e8b66fmr10533229pjb.30.1689035281266;
        Mon, 10 Jul 2023 17:28:01 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id cm3-20020a17090afa0300b002630bfd35b0sm6951697pjb.7.2023.07.10.17.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 17:28:00 -0700 (PDT)
Message-ID: <64aca210.170a0220.187d8.db1b@mx.google.com>
Date:   Mon, 10 Jul 2023 17:28:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2023-07-10-v6.5-rc1
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
Subject: renesas/next baseline: 35 runs,
 2 regressions (renesas-next-2023-07-10-v6.5-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 35 runs, 2 regressions (renesas-next-2023-07-10-v6.5=
-rc1)

Regressions Summary
-------------------

platform           | arch  | lab         | compiler | defconfig | regressio=
ns
-------------------+-------+-------------+----------+-----------+----------=
--
kontron-pitx-imx8m | arm64 | lab-kontron | gcc-10   | defconfig | 2        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-07-10-v6.5-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-07-10-v6.5-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b74c024d8fc777c36dfb2aa02aed3f7dc4e4bd81 =



Test Regressions
---------------- =



platform           | arch  | lab         | compiler | defconfig | regressio=
ns
-------------------+-------+-------------+----------+-----------+----------=
--
kontron-pitx-imx8m | arm64 | lab-kontron | gcc-10   | defconfig | 2        =
  =


  Details:     https://kernelci.org/test/plan/id/64ac712c9fce4db86cbb2a91

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-07-10-v6.5-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-im=
x8m.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-07-10-v6.5-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-im=
x8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ac712c9fce4db86cbb2a94
        new failure (last pass: renesas-next-2023-06-06-v6.4-rc1)

    2023-07-10T20:59:14.228110  / # #
    2023-07-10T20:59:14.330334  export SHELL=3D/bin/sh
    2023-07-10T20:59:14.331067  #
    2023-07-10T20:59:14.432643  / # export SHELL=3D/bin/sh. /lava-370596/en=
vironment
    2023-07-10T20:59:14.433370  =

    2023-07-10T20:59:14.534830  / # . /lava-370596/environment/lava-370596/=
bin/lava-test-runner /lava-370596/1
    2023-07-10T20:59:14.535920  =

    2023-07-10T20:59:14.555939  / # /lava-370596/bin/lava-test-runner /lava=
-370596/1
    2023-07-10T20:59:14.598633  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-10T20:59:14.610907  + cd /lava-370596/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/64a=
c712c9fce4db86cbb2aa4
        new failure (last pass: renesas-next-2023-06-06-v6.4-rc1)

    2023-07-10T20:59:17.007750  /lava-370596/1/../bin/lava-test-case
    2023-07-10T20:59:17.008169  <8>[   17.809627] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-07-10T20:59:17.008463  /lava-370596/1/../bin/lava-test-case   =

 =20
