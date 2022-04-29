Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEB3F51479F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Apr 2022 12:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239033AbiD2K6q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Apr 2022 06:58:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239106AbiD2K6p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Apr 2022 06:58:45 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFDFA1A814
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Apr 2022 03:55:27 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id q8so6826263plx.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Apr 2022 03:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=FQzogZuCNJhCq2vHQ/piWCK8bvsMr5l3E7zdHjtvOYw=;
        b=cjh9/ngB3h0UkebVd+SgbqlVAGIb/WYQmJWyKQPw3jcvmWO3CpfZw9GFFr8hIsLZyt
         eK4j+BJJ5H7Roildw//ylRFtmc8Yi2zHfkAM/3N/heEjPdS+Zk1mQ+wIQB03dVJmxzcg
         kCmMkcWMIefmUJWyQqqAMtkwgYZsX3vgjRBGpsm+ZfMB97rY02IBD3mbOXz9OEI/wsgW
         9ikCYW/urzJPnRvZrR39DIKFZ9N9/T4HvsjS+uRAEoNFDmuEmjsDEutvFgi4iMUbyA7f
         CtgUdEmEA4onCn2Q+GYY6pIvVOi8eOV/ZaoSJf8w0dJ/O+ijhnMNJ3SJ1viVmEGjKGSX
         XTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=FQzogZuCNJhCq2vHQ/piWCK8bvsMr5l3E7zdHjtvOYw=;
        b=6N7zNfgBavUtt0pSc3iGQvLCWYE0katxzm2YLlP9QLLMnwZ0n8EcJ5XvhEDq3yk6Tw
         mthZ9DvOhLZ1BUCDpEdObzFp1RQugGMmqQ2aVXWrCAclhhkMdLHYLbjiECVjPONRayRU
         CtqC5+m48IRIlSyFwn5sV/MKubcPf436o1JqxrNlGf8n1LNYuFs0/gKV9afssYYy9k0o
         O10EIaEUBfayUklkMPP7DBmzMhA9EAeAMiV8/VOcaKvGTaDROmA+fbOUvdXeBJG1M/fN
         3dnWDq2Df4clC0w6/elrFTKA7u/gEj//fnTwwyQqnkQiY8uOmUw7qwcgBIJp4Kon+Sma
         l0kA==
X-Gm-Message-State: AOAM533itJKsNsWKuECNe4XPTdtxAvns6f3T7IgurBAnfMjuEpQ7cbXO
        JCt0B+yDwyv5WjChoW+ttMdXixmkkxExobBxTes=
X-Google-Smtp-Source: ABdhPJxEbxzp9dZNzk0iCrGvS/CmLgvTPEs0a+0v4bniD/+emJ9BIVQcaHY9ttYtL7pZB2QKWDoYWQ==
X-Received: by 2002:a17:90b:1a8a:b0:1db:f264:c03c with SMTP id ng10-20020a17090b1a8a00b001dbf264c03cmr3247270pjb.151.1651229727108;
        Fri, 29 Apr 2022 03:55:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t4-20020a628104000000b0050d3ccc653dsm2807058pfd.116.2022.04.29.03.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 03:55:26 -0700 (PDT)
Message-ID: <626bc41e.1c69fb81.cabd5.6c88@mx.google.com>
Date:   Fri, 29 Apr 2022 03:55:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2022-04-28-v5.18-rc4
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline: 241 runs,
 1 regressions (renesas-devel-2022-04-28-v5.18-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 241 runs, 1 regressions (renesas-devel-2022-04-28-=
v5.18-rc4)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-04-28-v5.18-rc4/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-04-28-v5.18-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d9db556ad00ccf278daa20b573c5a0da6800aee6 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/626b8e029b051d131eff946a

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-28-v5.18-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-28-v5.18-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/626b8e029b051d131eff948c
        failing since 51 days (last pass: renesas-devel-2022-02-28-v5.17-rc=
6, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-04-29T07:04:10.561948  /lava-6207070/1/../bin/lava-test-case
    2022-04-29T07:04:10.572881  <8>[   35.247561] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
