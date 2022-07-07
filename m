Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D38656A24A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Jul 2022 14:50:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235162AbiGGMuC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Jul 2022 08:50:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234912AbiGGMuB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Jul 2022 08:50:01 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C930227163
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Jul 2022 05:50:00 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id n12so19224222pfq.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Jul 2022 05:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=oil2ViaUuMPLaggH9InuAXs5x46TgF9myybRQZn2iow=;
        b=8De7Ug1re7Bbr4CUOxJOc5Q8yu8pdtwXjrAm0gwQJtNOsD/myuFLQSGQIe1pkfkUod
         3bGjStEaVhmDtDPfLAJeja7xBiJj9KE1Dxo4bIU//pPb+JRrd/brLSzZCTomj+IZUKEi
         Rag2oI0n9MfknFfHpQr9w/KjUYw+JomvF7cwAXjNG0W1Z94ZyOsqAbgUeB1MRAtRoY7a
         owE2vR5v8ztsRW5QBDE0VxNQnEECJvYz5cqcEv6nb63ERqVEHKKj+ql8NFaVNXNghKGj
         LMqSxksujUvubdCXkxEytb6ODNt2xieYV7OarUlyNfuj3q070l+TSgfVFrujJKysT9CW
         43pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=oil2ViaUuMPLaggH9InuAXs5x46TgF9myybRQZn2iow=;
        b=h/G3Piz9DMoMmeDXtCU2VECYYKQLA5yp9cquq8s609OeGube3lv4aFWZgzs//w7rVN
         6vWq68th5IuRHwnh6+QIMl5YLPuqN4LkRGjzyB5p5kzpc5EERmw8nRKNcXBaJTsibltv
         1VI3ioIEjn2oQpUKW8R4Scs0G5oRLWQWv/sMMTESvP0NPR0GTAJjNEGxvW7J75ToJjuv
         7oBAcqQWPM3yvOnBPfqOMUJO90DkT+n0Z0DOguZlDZVUk3srTp5wBJJBEIiS++8cUTAQ
         8NDKkdc4Q8CBwBx142sOxuf1kBiH5UJTUNbzCywxykmEDLqrdEcbu1Ip+t6fk1qjuvUn
         eosw==
X-Gm-Message-State: AJIora/VKtzXXS1N5Bx3lDQeO9LIxAeO3KtF63xfkPNITFYrT9DhLwPQ
        J7cx9IiBc9eLvSpUWB0MnO0v9skl0Ikkr+Vq
X-Google-Smtp-Source: AGRyM1vondhNmwiHFvvEBoKZtsnU2a6nFOWs8K3CQ3KJDBwbVYGxTKcgo8t5Qa5fiG1Wka4HXN6baA==
X-Received: by 2002:a05:6a00:1992:b0:527:c201:ef52 with SMTP id d18-20020a056a00199200b00527c201ef52mr52874782pfl.59.1657198199912;
        Thu, 07 Jul 2022 05:49:59 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j11-20020a170902da8b00b0016bff65d5cbsm4048356plx.194.2022.07.07.05.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 05:49:59 -0700 (PDT)
Message-ID: <62c6d677.1c69fb81.a482f.6623@mx.google.com>
Date:   Thu, 07 Jul 2022 05:49:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-07-07-v5.19-rc1
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next cros-ec: 6 runs,
 1 regressions (renesas-next-2022-07-07-v5.19-rc1)
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

renesas/next cros-ec: 6 runs, 1 regressions (renesas-next-2022-07-07-v5.19-=
rc1)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-07-07-v5.19-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-07-07-v5.19-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b5468cb7909f0068dd977e1f63ea39132098dbb7

  Test suite revisions:
    cros-ec-tests
      URL:  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/cros-ec-tests.git
      SHA:  86181a7fbd379fc42314c450740d2cea8cdf04c1 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/62c6ca2e707e987242a39bf1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-07-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-ec-tegra1=
24-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-07-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-ec-tegra1=
24-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220624.0/armhf/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/62c6ca2e707e987242a39b=
f2
        failing since 29 days (last pass: renesas-next-2022-05-05-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =20
