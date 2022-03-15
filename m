Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B31964D927F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Mar 2022 03:16:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231442AbiCOCRW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Mar 2022 22:17:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237208AbiCOCRV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Mar 2022 22:17:21 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3BDE45AD6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Mar 2022 19:16:10 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id q13so15063235plk.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Mar 2022 19:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=0sxk8f9NFYbwyROgC/BZFsjWS6cblPI3D384Yu3gv2M=;
        b=OuAntHD0yIcoeDNGzEE8jvf3cNnhdR9uksttHGzyuW/E/Q6ZxkL3LBLmH2vMOe9mtM
         932CVjKVFDfpF5jtILEgjBs7LLALKYMlHGH1qFAtxShv2k7EzXh378UhWy2bGFkBhwAD
         d3+VhKXFwckIy2XGOJ7kqELme6AMpsAmluo0bSSN+IsyeZ4pQrmq78TrRMDDHjMI3PJ+
         ql5dyYxJPrjyh/c5YUvfzEbYquANgNCaxwUlxswUQ7wj8H3RFhTh00/7VrAJfHGFdcnh
         YiBfvJs5tiDyToWGfB+tV2On6l1UW/hJ8BiPoYe47JSHv1XfeAeJiMiyPPJNgOOtBtWO
         DW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=0sxk8f9NFYbwyROgC/BZFsjWS6cblPI3D384Yu3gv2M=;
        b=LZCtF+7RREJ+pRwAoOK2TzBTRnJcPbLmFvawVljEM3s/dQ0E+LcZra40iEZouG8OiI
         zkgX+ifXg+51mvrHwMe0swjUetnAS7d8luIZJ0j06fdBFSYPS09nFshMaFhF2+hUXO/m
         stfhD9JIHpASixICau5o/OoquPmXqkawqyQNZV9+A3FjnqzoMMARVazEmUksSyPVtIMY
         aWSFJfCdtNerXl3KspvXgZAAAlmt70f/0rHC09z4EKRbCS3jcVaReX0a6LD09HjJTgK6
         fWRS3tMjcI7ExJuQpPaxq68hFqAdFeYzxaTqPHZj2djR5CJzo2hOEEJF6HyeSQH/I3G2
         CokA==
X-Gm-Message-State: AOAM531Aq9+PD5iEHlewS9ZBwHHqBi44BTBX6nK8vAqRNSy6+ZM4cssj
        LGoEe0isQk77L0pm7xjSsEj0nMTNJAIstOS1FZU=
X-Google-Smtp-Source: ABdhPJx+gghRWZ4hUoqBN7TNB+kCre60cXDFXoFH172jhcxJqmLeeb0SQytFRTC6giz7KQR6rVLl0g==
X-Received: by 2002:a17:90a:faa:b0:1bf:b996:42c0 with SMTP id 39-20020a17090a0faa00b001bfb99642c0mr2079566pjz.197.1647310569995;
        Mon, 14 Mar 2022 19:16:09 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z72-20020a627e4b000000b004f70cbcb06esm20899445pfc.49.2022.03.14.19.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 19:16:09 -0700 (PDT)
Message-ID: <622ff6e9.1c69fb81.4dd92.66a3@mx.google.com>
Date:   Mon, 14 Mar 2022 19:16:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-03-14-v5.17-rc8
Subject: renesas/master baseline: 242 runs,
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

renesas/master baseline: 242 runs, 1 regressions (renesas-devel-2022-03-14-=
v5.17-rc8)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-03-14-v5.17-rc8/plan/baseline/

  Test:     baseline
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


  Details:     https://kernelci.org/test/plan/id/622fbdd985dde3d798c6298f

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-14-v5.17-rc8/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-14-v5.17-rc8/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/622fbdd985dde3d798c629b5
        failing since 6 days (last pass: renesas-devel-2022-02-28-v5.17-rc6=
, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-03-14T22:12:25.416437  /lava-5879348/1/../bin/lava-test-case
    2022-03-14T22:12:25.427449  <8>[   33.853676] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
