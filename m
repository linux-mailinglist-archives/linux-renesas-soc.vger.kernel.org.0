Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF163A3993
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jun 2021 04:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230422AbhFKCPi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 22:15:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231312AbhFKCPi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 22:15:38 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE7F4C061574
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jun 2021 19:13:27 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id d5-20020a17090ab305b02901675357c371so4922205pjr.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jun 2021 19:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=z/ALr6NQ9hVdd2PovPRjDwNA7I+bJeWvdYRT7Kpbx1c=;
        b=gxQPrlAjKcm5ZJeWH9cno/1DhXdObf1XazqzI0huBCrx6BQKWn3xm06ph4evmVmzEl
         g24uJb1QMWAMcnhM6zU1wRwze1BRjMR72kDM5PVsaFbKmox4KkDDakt0h3nngoMW0jVE
         XgVVHZvNgHiTKzmSvF0iyIEPJzeb+RXfP17Oh/HWZONmgBO+fVj9IVSAAQKdWTkVb2t5
         pt+GPLrUxeC/Ov0E1bpHnwzlxbHBwL7qak2+Dfj4WMh0eUrWqMhPCl0gMAXcy6P4IdPP
         J/hJDqBGoMPUZrk2v2jn/5+Z70HMPAHBQY1FrsegJiaSLGc4qHlPc2jwltT8HjbD9NMC
         WO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=z/ALr6NQ9hVdd2PovPRjDwNA7I+bJeWvdYRT7Kpbx1c=;
        b=Amve859bWNyit9j17bOP24//Fpkw/HoBtthMeXilwS8pLLU1nN6dXQLOaFp9wTdemO
         6FXcigjtjwJQf44TBizc9BuX0CbQpVBQ/+w2ktKJGRBPc2RfcL2t+U7P+n+vBgh9G8nr
         e+aJm6Y4F32Q/hzlpbvyEWaj1iQ9ZuoxF9CKg1v98s30GR35KU3VbulHtkxsuTC7Rx9Y
         1yIkGUrsOTG4TWcSpcsrzFkzpfksnJD5v2nDu/p2xWrP0k0Z6bB4cnftdjCws91pbzSu
         YZ7xtq819hkFQ7V0iee0ej1ixuv4WGpToybjMwgry3GSDostMa+TuRl0tpKZcusWpCVs
         helg==
X-Gm-Message-State: AOAM533QkewLdhtTEt1RvTe/8XgNiKrDpWQ9bQY17V8TFBGZDgoDa3Uw
        jpd6pJYovt6vtxyv5dgANGkq+Lmj3R8/6c56
X-Google-Smtp-Source: ABdhPJxJwG6rAVG9D5r1+phbTaccPgNaM0/W1X6yyACRTrlNV4HyJnUJMXovMaEMkmFxGZnWWIMgrg==
X-Received: by 2002:a17:90a:4503:: with SMTP id u3mr1953019pjg.210.1623377607174;
        Thu, 10 Jun 2021 19:13:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g11sm3641963pgh.24.2021.06.10.19.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 19:13:26 -0700 (PDT)
Message-ID: <60c2c6c6.1c69fb81.ae42f.c4a7@mx.google.com>
Date:   Thu, 10 Jun 2021 19:13:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-06-10-v5.13-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next baseline-nfs: 36 runs,
 3 regressions (renesas-next-2021-06-10-v5.13-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 36 runs, 3 regressions (renesas-next-2021-06-10-=
v5.13-rc1)

Regressions Summary
-------------------

platform                  | arch | lab             | compiler | defconfig  =
        | regressions
--------------------------+------+-----------------+----------+------------=
--------+------------
dove-cubox                | arm  | lab-pengutronix | gcc-8    | multi_v7_de=
fconfig | 1          =

odroid-xu3                | arm  | lab-collabora   | gcc-8    | multi_v7_de=
fconfig | 1          =

sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre    | gcc-8    | sunxi_defco=
nfig    | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-06-10-v5.13-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-06-10-v5.13-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      23df6d1f09712871dfba619729a8a165f147c17e =



Test Regressions
---------------- =



platform                  | arch | lab             | compiler | defconfig  =
        | regressions
--------------------------+------+-----------------+----------+------------=
--------+------------
dove-cubox                | arm  | lab-pengutronix | gcc-8    | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/60c28cb7e010d8b5c90c0e15

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-06-10-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-nfs-=
dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-06-10-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-nfs-=
dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60c28cb7e010d8b5c=
90c0e16
        failing since 44 days (last pass: renesas-next-2021-04-02-v5.12-rc2=
, first fail: renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276) =

 =



platform                  | arch | lab             | compiler | defconfig  =
        | regressions
--------------------------+------+-----------------+----------+------------=
--------+------------
odroid-xu3                | arm  | lab-collabora   | gcc-8    | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/60c2c56f10b6aede340c0dfa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-06-10-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs-od=
roid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-06-10-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs-od=
roid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60c2c56f10b6aede3=
40c0dfb
        new failure (last pass: renesas-next-2021-06-07-v5.13-rc1) =

 =



platform                  | arch | lab             | compiler | defconfig  =
        | regressions
--------------------------+------+-----------------+----------+------------=
--------+------------
sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre    | gcc-8    | sunxi_defco=
nfig    | 1          =


  Details:     https://kernelci.org/test/plan/id/60c2c3c4ec06f5bcc40c0e13

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-06-10-v5.13-rc1/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7i-=
a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-06-10-v5.13-rc1/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7i-=
a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60c2c3c4ec06f5bcc=
40c0e14
        failing since 41 days (last pass: renesas-next-2021-04-02-v5.12-rc2=
, first fail: renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276) =

 =20
