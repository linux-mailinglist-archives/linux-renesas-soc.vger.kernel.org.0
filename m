Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 889255609F2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jun 2022 21:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbiF2TGv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jun 2022 15:06:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbiF2TGu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 15:06:50 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FB7B1F632
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 12:06:49 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id x138so13279383pfc.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 12:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=s6pppYCg+xN6yU5OXcSWeZaVEFtlYPN+hBOePn639pU=;
        b=eaCJ8wx05ND+baOlNNJvIVYTYZo449HqYbVsv8iqv8wIMiPYufZQoBYbeMiebJV6N6
         faX0diAkXLiWuFJBE6nAL4gmIkVF+PauAG0QZtPPg/pWM+75Lrmd93JXfYGvwN70SWP0
         Gkf7XO5RxHdR8iJFbEgSw0TunCvKLyaJLmdmVC+1lnr/BJX7FV4luw2VaHsdzKZmjKlT
         TTp1SrAvu/8zZefdEkcje52JIeHI2gXE3bPVgFXLO8XKLRxWwbP1M9WzKVXOj0RKQ7pX
         T/aBCTtNeyG/Ri/7RITRZqUKcJwk5G7W9HYuMXUNyDN/NoOeNQ5WBb7qwMdkYT41EFAh
         KQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=s6pppYCg+xN6yU5OXcSWeZaVEFtlYPN+hBOePn639pU=;
        b=WFlTwrh9Cy8xeVgTVUo6B/7Q5Z9qpGoDBLvMYjG1QssWxvhsYe9NBVUgFd7Zo05LH8
         2j6Ab3rQEW5QA4pyOin70vfiAgoiB8b9+xNbpBeJ7Y/pwTTvoWLm1EiWGnI08nOQnX5O
         eevB1iHofYp/Qt5CzmqYok/CB3Lnil+/R1vJ06Q4FPzcCnpb3LEnvAh6v7VsDvA2uB/E
         LlaCJpiKYPfUW/QF3i3kiy2txl9ob1i9TyExrgW0oUwUUn2nQXMlOqF5DasYRABIXsAl
         uX28l1KQv5k2F9AFK/af+WFCLafWojNoOtY0hHmv0g0GCFaDeQpZZqMTez1DfY1no+hY
         VSFA==
X-Gm-Message-State: AJIora+9ROiXJ69XORiQSNw8+CeVF3nJW2xulK2BOQkmq/ZJuLK4+k8K
        ydkRUPlzSHPucnFahi5zbvILNk4rV9tpHC5549A=
X-Google-Smtp-Source: AGRyM1tr7ljFToimJI6gt9Ea8CoUhLIoathaALoNVUR1OLC1x5st7pKgyd1rbI2MgkurLSAwJHhhyA==
X-Received: by 2002:a63:2a4e:0:b0:40c:6ff9:9978 with SMTP id q75-20020a632a4e000000b0040c6ff99978mr4102500pgq.447.1656529608920;
        Wed, 29 Jun 2022 12:06:48 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t2-20020a1709028c8200b0016a3248376esm11660183plo.181.2022.06.29.12.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 12:06:48 -0700 (PDT)
Message-ID: <62bca2c8.1c69fb81.c8246.0c1c@mx.google.com>
Date:   Wed, 29 Jun 2022 12:06:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-06-29-v5.19-rc4
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master cros-ec: 9 runs,
 1 regressions (renesas-devel-2022-06-29-v5.19-rc4)
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

renesas/master cros-ec: 9 runs, 1 regressions (renesas-devel-2022-06-29-v5.=
19-rc4)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-06-29-v5.19-rc4/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-06-29-v5.19-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      33401641a5eb2a82fb3eeeb71752594b1d8016bc

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


  Details:     https://kernelci.org/test/plan/id/62bc989926b5b2967aa39bea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-29-v5.19-rc4/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-ec-teg=
ra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-29-v5.19-rc4/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-ec-teg=
ra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220624.0/armhf/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/62bc989926b5b2967aa39b=
eb
        failing since 37 days (last pass: renesas-devel-2022-05-17-v5.18-rc=
7, first fail: renesas-devel-2022-05-23-v5.18) =

 =20
