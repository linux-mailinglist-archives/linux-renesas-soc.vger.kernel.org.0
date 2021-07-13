Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CACB53C67B0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jul 2021 02:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233835AbhGMAyo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Jul 2021 20:54:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233545AbhGMAyn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jul 2021 20:54:43 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85DCDC0613E9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jul 2021 17:51:54 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id t9so20097677pgn.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jul 2021 17:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=KDDtplmW7GzXZbkzsaJ5lV4QFzqvMk8w4vnE20Mi6dQ=;
        b=L1PAHcW7QwhpOadY/I9l4KhbaU41l4vVWw2++vr8vvO602O2/5Npa69O0IZVN4ulb6
         SNAoS8hA47sKMryHQFiTNpKLRcudnCk+UhLOYuNCCf6S/97bgdmdXbO1/llFVKA6Oh0u
         gk3dP4fXZS7PBgV33L+gh1OM2NH9gMfEqfZ0zgyHlsZ0MFy8JNJUjGcHcTlw3a6kIfLF
         VLCRepbDTJcETmcqEiRBnKOjkDN4vOaQQG2uR43s4TEJFKE8uUye/6PNWyqtqxx540Gt
         mWLfRmg76wpy2JgwLGscDxypCB4BtyzoT2L9Lrz9A+RS0JmsgnWSfbG/CRm/I7oroM7P
         AD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=KDDtplmW7GzXZbkzsaJ5lV4QFzqvMk8w4vnE20Mi6dQ=;
        b=hSKjsZTrvP0NNWWmPNIrlrieeVSutA5o1kPV+uinqjlMReL1G/yQ6dEwcApOlivrt+
         Dt5x9FtaHSJ+ShwA0J7yMZzYetyat2xXLxgyc5lAvohXfIEfc4w8G3ayVsmoWTeX8s7g
         ryznWZggQyDbORCfCWII8DIh7VKbupX87m4+dfMDfx8wJzNn6PwUoQuVJ1uVafjOon7d
         fyXexifpIt2Yr0ZFqHZlwBcT+BluZiCqs08E25/m5MwCyLfrts0eUT89UTGRXQJUNLmE
         dmIJ4AtpbAB6uMA3iygjpEjGv6WWcN/82GPL0v/N7g3t3Qzu8DcmBqc7f6SHHzXSxujo
         Kntg==
X-Gm-Message-State: AOAM532vZq81VkXMtwm4vPkkNGS5sKVsm8MnIIuHvwGhG9IAHOe7unGc
        Fxyn3BUiy4AEoz+RxCqO46ou8cMfCYwzxHap
X-Google-Smtp-Source: ABdhPJyEU+A1Rl2Ok+GT2myrIpBR91DL90oEjGXvuJWrOXF6zW6WVXi84a1w/fGiYUARgcJH47xBLQ==
X-Received: by 2002:a63:f751:: with SMTP id f17mr1717717pgk.373.1626137513961;
        Mon, 12 Jul 2021 17:51:53 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h20sm17894187pfn.173.2021.07.12.17.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 17:51:53 -0700 (PDT)
Message-ID: <60ece3a9.1c69fb81.45911.5a22@mx.google.com>
Date:   Mon, 12 Jul 2021 17:51:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.14-rc1-17-gcd117793e1ac
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next ltp-ipc: 11 runs,
 3 regressions (v5.14-rc1-17-gcd117793e1ac)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next ltp-ipc: 11 runs, 3 regressions (v5.14-rc1-17-gcd117793e1ac)

Regressions Summary
-------------------

platform         | arch | lab           | compiler | defconfig             =
       | regressions
-----------------+------+---------------+----------+-----------------------=
-------+------------
beaglebone-black | arm  | lab-collabora | gcc-8    | multi_v7_defc...CONFIG=
_SMP=3Dn | 1          =

beaglebone-black | arm  | lab-collabora | gcc-8    | multi_v7_defconfig    =
       | 1          =

beaglebone-black | arm  | lab-collabora | gcc-8    | omap2plus_defconfig   =
       | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/v5.14-=
rc1-17-gcd117793e1ac/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   next
  Describe: v5.14-rc1-17-gcd117793e1ac
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      cd117793e1ac66174038470d85471fa4d9e226b9

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  f631c87593cc624848c5b9521727d912a0b00b4c =



Test Regressions
---------------- =



platform         | arch | lab           | compiler | defconfig             =
       | regressions
-----------------+------+---------------+----------+-----------------------=
-------+------------
beaglebone-black | arm  | lab-collabora | gcc-8    | multi_v7_defc...CONFIG=
_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecd044dee087d1e211798a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/ltp-ipc=
-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/ltp-ipc=
-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210709.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/60ecd044dee087d1e21179=
8b
        new failure (last pass: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform         | arch | lab           | compiler | defconfig             =
       | regressions
-----------------+------+---------------+----------+-----------------------=
-------+------------
beaglebone-black | arm  | lab-collabora | gcc-8    | multi_v7_defconfig    =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecd440ee7ae94f58117987

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/multi_v7_defconfig/gcc-8/lab-collabora/ltp-ipc-beaglebone-bla=
ck.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/multi_v7_defconfig/gcc-8/lab-collabora/ltp-ipc-beaglebone-bla=
ck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210709.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/60ecd440ee7ae94f581179=
88
        new failure (last pass: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform         | arch | lab           | compiler | defconfig             =
       | regressions
-----------------+------+---------------+----------+-----------------------=
-------+------------
beaglebone-black | arm  | lab-collabora | gcc-8    | omap2plus_defconfig   =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecd7eef5bafe2594117971

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/omap2plus_defconfig/gcc-8/lab-collabora/ltp-ipc-beaglebone-bl=
ack.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm/omap2plus_defconfig/gcc-8/lab-collabora/ltp-ipc-beaglebone-bl=
ack.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210709.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/60ecd7eef5bafe25941179=
72
        new failure (last pass: renesas-next-2021-07-08-v5.13-rc1) =

 =20
