Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 063B753EEC2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jun 2022 21:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbiFFTlD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Jun 2022 15:41:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232619AbiFFTlB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Jun 2022 15:41:01 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A709540A32
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jun 2022 12:41:00 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id y187so13769899pgd.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jun 2022 12:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=CRr3bduEr4J/D4vadWUQCTo6iJTKov3Ud6BzF9q7xoU=;
        b=zoPnofuqPt7CM4GRSfQDu4S6OLfTz3o3rSJWJy3VSs/NbLL3vylfqb/LxKcFAf3PCG
         7V57X7UsR8izUalUFLOxP/ElA78BJAf09f2KuRxLIxV4YWsflUm7V24YDjwDrGFCvtoC
         jiq84bmI2sScdKurk40tvqEQRt4YE/gddbSPpg3wz+FnC/gbBtKAgfOS3iDmzzKOBgKC
         YWuTPwg6KU8HEeIgNxXBXW2w43+b5upCLidCPENXifrS7kX1Na6M/WSGssARy263ym++
         RWrH2ybUaqBFegvHHYIi3ESArafgiLl20rhnLWaNXgiRP0aNYC6B9KVnuxtTmNzDxMpZ
         ug1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=CRr3bduEr4J/D4vadWUQCTo6iJTKov3Ud6BzF9q7xoU=;
        b=PZscOTKoCgn3wTq6OXsBDfGnFYHxoPmZbQJCmwgah1ih575qYWguA35pQEKlmhJg9A
         t7MiD+wYHTehd4PFIOgXLCpTEyWvTJfFERCMnbtxYRDbmfsOLzlhHyAu+fJL+2Piw7W+
         8PfuvUWC85Ge0cw+pkO9uEfFb3JsK4CY1KkatUQallOjGxsUPGOnonJMGQzrKkn5fEc4
         fisebrADgtPd3JoUqcASY89LAZSpj2SzQACnWIcgdP5q9mZ2PSnpg7gNRPWFdJgNNDpS
         6gHKNUJJ2xcfTAyXUqOU4CUz11Om9DxtMWaxmoBu/xaxAnPRqwOa89/yQUaYnVRh5H90
         8YKw==
X-Gm-Message-State: AOAM532wTl8w0b0SghXMhlBWAyWPg6lSS7YovFS0BKP3QF5JNqinJ5yx
        clAZr3nuA5FovBIE0HDcbint7BXuRkhkk1R7
X-Google-Smtp-Source: ABdhPJz9nTCTiqFN/bNZN5Wn5J5ku0TrnawhObsxOGOAuCeHhy8a9aD7s6eirxitfb+haNDya5lnRg==
X-Received: by 2002:a65:4188:0:b0:39d:2197:13b5 with SMTP id a8-20020a654188000000b0039d219713b5mr22279857pgq.368.1654544459894;
        Mon, 06 Jun 2022 12:40:59 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h1-20020a655181000000b003fbaae74971sm10999742pgq.72.2022.06.06.12.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 12:40:58 -0700 (PDT)
Message-ID: <629e584a.1c69fb81.f5b8f.8b04@mx.google.com>
Date:   Mon, 06 Jun 2022 12:40:58 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-06-06-v5.19-rc1
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master usb: 4 runs,
 2 regressions (renesas-devel-2022-06-06-v5.19-rc1)
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

renesas/master usb: 4 runs, 2 regressions (renesas-devel-2022-06-06-v5.19-r=
c1)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =

tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-06-06-v5.19-rc1/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-06-06-v5.19-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      997b2d66ff4e40ef6a5acf76452e8c21104416f7 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/629e4b1520b9fc0785a39c1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-06-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-rk3288-=
veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-06-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-rk3288-=
veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220603.0/armhf/rootfs.cpio.gz =



  * usb.login: https://kernelci.org/test/case/id/629e4b1520b9fc0785a39c1e
        new failure (last pass: renesas-devel-2022-05-23-v5.18) =

 =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/629e47454c64c29765a39c0f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-06-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-tegra12=
4-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-06-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-tegra12=
4-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220603.0/armhf/rootfs.cpio.gz =



  * usb.login: https://kernelci.org/test/case/id/629e47454c64c29765a39c10
        failing since 14 days (last pass: renesas-devel-2022-05-17-v5.18-rc=
7, first fail: renesas-devel-2022-05-23-v5.18) =

 =20
