Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89D064528D9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Nov 2021 04:57:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236720AbhKPEAY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Nov 2021 23:00:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236690AbhKPEAW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Nov 2021 23:00:22 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9240CC076B32
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Nov 2021 16:40:31 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id gb13-20020a17090b060d00b001a674e2c4a8so1281389pjb.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Nov 2021 16:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=5ZCdyn2jyhC8j4x3jckUTfrI8ZbxBwMWbPqyk9uq45g=;
        b=ts9+WvhXOrC0Vj6RiDjlbrGalfa6sjabUWnUbaxAiAonn0KlFF2GbK/Yw6fCvgXt2b
         op0JdMKgglPWAsqkImlGRT3fKaUb+g+LbeIU2MUmqCDa3/Bv00zEgZ+F8UndwF3ZNaQ8
         xskr2EWqa+Y7CyALb+tk3YKynGetAYB875cE4ylNCrv8s1wYb3vdQ8Sp7enW9/Y91L6L
         VigtUwwTj5wtTsnBQviFjaIn8bWPyjT1xKGwIbohFj2sJG2bEfFiux+1sbH14KPncfRY
         U/4ac7WHiHVRIEEpQ8nsyQwgAWBx/ds+E4Y7MLhUnoJeDzdwfpLxFTMit+5CPw5SepEw
         RBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=5ZCdyn2jyhC8j4x3jckUTfrI8ZbxBwMWbPqyk9uq45g=;
        b=qiHYvD4G81F5BwOnoC/4BZHpUqmSJU6quv+O0MjPCKUg18ZpTY6TPCRcccxp9I2emm
         HJ98HpfwiPwt3zupAiGTTJEOCc16+c3n9ZruqXU+KnmsXqG9p3OMiqHSvkqGrL3WnZzD
         RLGxbM+OhQpaqOmcK9Z8WHj+AS50RAOL0dJMuVlyXXZAecUsYffaaAuhOYG48c2g28Rf
         BDXstHmkxrQZpts33jCmbRvH4nwqc03GWsQmjFhZMIfAEtdkXyhoaj7OHigyS8P0G5OK
         wk4WHx8/ZW7h1hsu1h4aZLO+1d/HMHCNOD/fAsDTIZTQ4PSkaGwoEyBBymbHpDLpjLFd
         bw4Q==
X-Gm-Message-State: AOAM533QCJ2mT3bLyNaGT/TYbG9BfMopmg3S5/kfwVVDIc90jCppkq4I
        YkDgbbGk35uc5IJfJcNdGuwOFAiMlIbxERhO
X-Google-Smtp-Source: ABdhPJzycXFSEubdgTnnD7uAZqiZ5K7+X65KEZ3rV+vzKph6bXf0xoRPcUGFH7dDAsT41YDjH2udSQ==
X-Received: by 2002:a17:90b:380e:: with SMTP id mq14mr71536477pjb.74.1637023230982;
        Mon, 15 Nov 2021 16:40:30 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id me7sm467831pjb.9.2021.11.15.16.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 16:40:30 -0800 (PST)
Message-ID: <6192fdfe.1c69fb81.1dc73.23fa@mx.google.com>
Date:   Mon, 15 Nov 2021 16:40:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2021-11-15-v5.16-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline-nfs: 57 runs,
 2 regressions (renesas-next-2021-11-15-v5.16-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 57 runs, 2 regressions (renesas-next-2021-11-15-=
v5.16-rc1)

Regressions Summary
-------------------

platform   | arch | lab           | compiler | defconfig                   =
 | regressions
-----------+------+---------------+----------+-----------------------------=
-+------------
odroid-xu3 | arm  | lab-collabora | gcc-10   | multi_v7_defconfig          =
 | 1          =

odroid-xu3 | arm  | lab-collabora | gcc-10   | multi_v7_defc...G_ARM_LPAE=
=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-11-15-v5.16-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-11-15-v5.16-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      17fc0a96f4b49440c8f494f996de7ca33086036a =



Test Regressions
---------------- =



platform   | arch | lab           | compiler | defconfig                   =
 | regressions
-----------+------+---------------+----------+-----------------------------=
-+------------
odroid-xu3 | arm  | lab-collabora | gcc-10   | multi_v7_defconfig          =
 | 1          =


  Details:     https://kernelci.org/test/plan/id/6192eee0daa6b2edd03358e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-11-15-v5.16-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-nfs-o=
droid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-11-15-v5.16-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-nfs-o=
droid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1112.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6192eee0daa6b2edd=
03358e2
        new failure (last pass: renesas-next-2021-10-18-v5.15-rc1) =

 =



platform   | arch | lab           | compiler | defconfig                   =
 | regressions
-----------+------+---------------+----------+-----------------------------=
-+------------
odroid-xu3 | arm  | lab-collabora | gcc-10   | multi_v7_defc...G_ARM_LPAE=
=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6192f0d5cc4f382935335919

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-11-15-v5.16-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-nfs-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-11-15-v5.16-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-nfs-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1112.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6192f0d5cc4f38293=
533591a
        new failure (last pass: renesas-next-2021-10-18-v5.15-rc1) =

 =20
