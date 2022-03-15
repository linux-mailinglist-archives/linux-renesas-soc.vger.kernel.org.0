Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 679C74D927E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Mar 2022 03:16:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237199AbiCOCRV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Mar 2022 22:17:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231442AbiCOCRU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Mar 2022 22:17:20 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFCC33ED22
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Mar 2022 19:16:08 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id cx5so16534987pjb.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Mar 2022 19:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=EZ2ZfMREa0lt/FKbVt9sP5UNJSV/vrYWLkAk7ZHfHNA=;
        b=hCKK50Ixi5U6SoCJhu0yd1bbkTBcyZTyaLMXyGfKX4dxlBneebAQSsm6F8XeqoP+wQ
         DrYN17iBr3UavQcV9eWb9NTPbIqQSmZir7N2gJxw6GOqbGgTrbZgNUuTXzMCD2u5PBPD
         uvKGu8qqp6LNmcBwdbSZbVyLwMrw4C+cteLkS7HZIqJcYqa27Yft2XcZbmtnA0ObhSGC
         6no54fc6lSi892cMjB45Qj2YljDmHuOVqtVWBFO+CYh6Iad406RMhOgRNLcXFdPM4Yrr
         H/eMlkUWsth7p4/bbjSDaJ5xbkIDBozqr5+UQPwiQ8VubOAjjhS5N6B1/fNpdjV8Ly+g
         +pUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=EZ2ZfMREa0lt/FKbVt9sP5UNJSV/vrYWLkAk7ZHfHNA=;
        b=G2gNSYEwjDlCy1asAIDxS9wBObC1OoJwCqNqUVzNfi3o5sdzC5swY3wtmAXYqLnQr1
         OYHVmiMjgyRfsIvzwVyjlIbWH2HxksvMYqw2pj+n+WMqvI6kRW5FzkKhKylC16oKdjc/
         5p4l/4TwY6CJiCnbvbJ656HvSyyAVc2jJ5roERGl+JGaky0y+3FIQvs/17dKqT7MWsyK
         B7mSpSqln6aBuVIr6Xs581l8Y5vKsrq4GUSih+3g8NurqCmy0V1yAIv60QWsy6gTpS6E
         sedQLK3YkzVD9P2cyH85TWI/nBeU6gtheef5b+4tHHFlpPjYQ1gLSjHpnXDH9ROyQunT
         sQmA==
X-Gm-Message-State: AOAM530Ci8KMpyY2UbvmVkQqgdu+5eM0WYAFQq9/b/I3qH9pu080ptNF
        nAcou/3yNtwsntUSwg8iO8P1mrPSKhawrqVc69A=
X-Google-Smtp-Source: ABdhPJylhHnKYqX7ZW+/nFOxZakxKdCy8iBmKKdmZfJ2cnP8fVfWrgtW4tlbRjroqBRvATcCmHXpFg==
X-Received: by 2002:a17:90b:1c0d:b0:1c2:71f6:2fea with SMTP id oc13-20020a17090b1c0d00b001c271f62feamr2092564pjb.88.1647310568355;
        Mon, 14 Mar 2022 19:16:08 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l1-20020a17090aec0100b001bfa1bafeadsm794637pjy.53.2022.03.14.19.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 19:16:08 -0700 (PDT)
Message-ID: <622ff6e8.1c69fb81.aa37e.33b6@mx.google.com>
Date:   Mon, 14 Mar 2022 19:16:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-03-14-v5.17-rc8
Subject: renesas/master baseline-nfs: 60 runs,
 1 regressions (renesas-devel-2022-03-14-v5.17-rc8)
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

renesas/master baseline-nfs: 60 runs, 1 regressions (renesas-devel-2022-03-=
14-v5.17-rc8)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-03-14-v5.17-rc8/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-03-14-v5.17-rc8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      1bffc90f0b511234bda84bd62ae16394a7b0a260 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/622fbddd3c7d5f4d4cc6297e

  Results:     82 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-14-v5.17-rc8/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-14-v5.17-rc8/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220228.1/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/cas=
e/id/622fbddd3c7d5f4d4cc629a2
        failing since 6 days (last pass: renesas-devel-2022-02-28-v5.17-rc6=
, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-03-14T22:12:17.625207  [   37.293296] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-03-14T22:12:18.662026  /lava-5879345/1/../bin/lava-test-case   =

 =20
