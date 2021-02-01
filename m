Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7666630A662
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Feb 2021 12:21:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233539AbhBALVN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 1 Feb 2021 06:21:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233113AbhBALVM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Feb 2021 06:21:12 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64D2CC061573
        for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Feb 2021 03:20:31 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id q131so11346406pfq.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 01 Feb 2021 03:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ybW6ea4mRu2AEYShPCqMGzBoq6QNNd5EE4ebeNyrTR8=;
        b=rUCCh7haBFLEa7yEewPfQo/Loior4ZwTp3TyevDeL5YD9WhJCxZxIgRrj7AvmcoW+M
         SFzchYJ5J7KaoC1uDNZV5WGGCVV3PF2frLDdPl/QCk/6qKyu6TXVvVuMW0dG3mK3Ac9J
         LO8QvMBN4fqDSzaFwK91CNfeBn0ofZb3s907BncdnX4v7IBNyZR3QOgmNU3eGtaY1aO3
         KgpBYSIZCUXRYy3o77dbPY0RSxYtspDzbfIHUw8M03eLcS6Qma7f/UoD/+g62YlOyh9s
         3SB+5E8YA2RVHe/NE5o4lnnlOiEXYN2sgGchh1OkQnO1AT76+M7VjyWdPPDXz/3Sw1N6
         zX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ybW6ea4mRu2AEYShPCqMGzBoq6QNNd5EE4ebeNyrTR8=;
        b=UJu1Uni0NS+d6H+r/pjYD7uS4U3dRvfQvKYu6wStWfDUbIS1jIpUa2YeR0NeWGMv0S
         9dW9DEs5veRK5wCY94LetHBdvMBtaluLMHDYxq/WPFCqdz+OpeayEneJUtRVh+qrNO/m
         Vee3hdfTlIdip0uRSqQBmd3oyregYPsxYXfxWhwzw8+CEtM/Fuo77tRGaBxZJ/Y1cHk+
         XbYQnourMNAM0c7dSrI1rd3a6pxUwrMkkOYm3PCxabHkRNOSftpihBQgQYikQd+j2CO2
         b7YpNV5+HYloABxe2GMAbg6xkQMYZDh73sZqWDy07OpPManU5zrgx6ULFC5ytAi2E18+
         B2Yg==
X-Gm-Message-State: AOAM533ctkVs2bYyHB1oZkJEl7oOLQGG5pgwfkUkIl4pcoPfd3WDtQT5
        nARYiWMFHh7sM+ENkBtm2dWxxMWU7mM0eg==
X-Google-Smtp-Source: ABdhPJw3PCCCOcMUTeWWhIKSrcIRHgcWgCXnmyMSddIyEth8jsmiA4UTwOl8KFjG+OoLJFd3WdDv8w==
X-Received: by 2002:a62:5e44:0:b029:1a4:daae:e765 with SMTP id s65-20020a625e440000b02901a4daaee765mr15893694pfb.8.1612178430659;
        Mon, 01 Feb 2021 03:20:30 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id dw23sm7055257pjb.3.2021.02.01.03.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 03:20:30 -0800 (PST)
Message-ID: <6017e3fe.1c69fb81.f57d5.f5ff@mx.google.com>
Date:   Mon, 01 Feb 2021 03:20:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-02-01-v5.11-rc6
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master ltp-ipc: 24 runs,
 2 regressions (renesas-devel-2021-02-01-v5.11-rc6)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master ltp-ipc: 24 runs, 2 regressions (renesas-devel-2021-02-01-v5=
.11-rc6)

Regressions Summary
-------------------

platform   | arch | lab           | compiler | defconfig                   =
 | regressions
-----------+------+---------------+----------+-----------------------------=
-+------------
odroid-xu3 | arm  | lab-collabora | gcc-8    | multi_v7_defconfig          =
 | 1          =

odroid-xu3 | arm  | lab-collabora | gcc-8    | multi_v7_defc...G_ARM_LPAE=
=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-02-01-v5.11-rc6/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-02-01-v5.11-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      45e12c13bdd70bc8d9741ce35e2aa594e986e457

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  3833d44a2ba3773359d3b35a2108af691d75b4f9 =



Test Regressions
---------------- =



platform   | arch | lab           | compiler | defconfig                   =
 | regressions
-----------+------+---------------+----------+-----------------------------=
-+------------
odroid-xu3 | arm  | lab-collabora | gcc-8    | multi_v7_defconfig          =
 | 1          =


  Details:     https://kernelci.org/test/plan/id/6017d15af2e1e62d6fd3e001

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-02-01-v5.11-rc6/arm/multi_v7_defconfig/gcc-8/lab-collabora/ltp-ipc-odro=
id-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-02-01-v5.11-rc6/arm/multi_v7_defconfig/gcc-8/lab-collabora/ltp-ipc-odro=
id-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210125.1/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/6017d15af2e1e62d6fd3e0=
02
        failing since 17 days (last pass: renesas-devel-2021-01-11-v5.11-rc=
3, first fail: renesas-devel-2021-01-14-v5.11-rc3) =

 =



platform   | arch | lab           | compiler | defconfig                   =
 | regressions
-----------+------+---------------+----------+-----------------------------=
-+------------
odroid-xu3 | arm  | lab-collabora | gcc-8    | multi_v7_defc...G_ARM_LPAE=
=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6017dcb56b96c34805d3dfd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-02-01-v5.11-rc6/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-8/lab-collabora/ltp-ipc-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-02-01-v5.11-rc6/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-8/lab-collabora/ltp-ipc-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210125.1/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/6017dcb56b96c34805d3df=
d9
        failing since 12 days (last pass: renesas-devel-2021-01-14-v5.11-rc=
3, first fail: v5.11-rc4-383-g822f1d4bfbf2) =

 =20
