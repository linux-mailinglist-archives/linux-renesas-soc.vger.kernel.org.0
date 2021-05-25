Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F59D390474
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 May 2021 17:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231975AbhEYPCm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 May 2021 11:02:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234192AbhEYPCj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 May 2021 11:02:39 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88B19C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 May 2021 08:01:06 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id m190so22963680pga.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 May 2021 08:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=/gz/aRmqyd3nVgcTsHG+ypHi1fHjgsjGDeUmzXSLdWE=;
        b=LHbi6SS20WQW6zDfa6vEPB2FdBZBdkcdjl3vc+Mk4k17iPz1UXZ49Ma6k3+1I0k9u+
         x9iCZdWdmghQtXto+ZD4aWde2xd+Qp76Ax+BQ/WeypL5qEseQ+GJ7rpRNqKahPgdTfNG
         krHsm+P19QBNAb66/WGGLU0HfXuC6VmJYzFRyfJJ//E1DL33baptc8SkoYV5hgS9DY8O
         9jkdL1cSPD25Gq14FyWr45XXd30RfUdsCLbzBQpzwFNebwvIJOG3lVk78OVpKcaQ11Mt
         +Xz+vb8aiC+7MV9o+PUXtDH3xYIWPU/LpKdLnBWOI65byy4L8V/Sb3l22evLvgt1JZYZ
         3TxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=/gz/aRmqyd3nVgcTsHG+ypHi1fHjgsjGDeUmzXSLdWE=;
        b=l0g/zUu86CN12T0OmIEv7SoA1uOtiHvFn1E20nKz6PBXoaROGfC9QRYWirvnOka+8y
         ZUDNQPQMZVPvJKBDKkY6ZauoX7rmqRXytX7RPR3uqJHrUMH3woGH0LvSj4Tlh0SL1c6S
         Ej4cNQ4z3ySm1WiEHjhr0Lsr+TwwQSOzUmhor+qkd4idKYYb7NjPUl2PfWXMNRwH+e/2
         u/v4PecBI5g71095pCuw1LI3Bdm7ICzJ0baa2YhhCimmaQ/NTG9Yt0eUhLPhoEejn6Lw
         CJKeRZ0DWyNKEEgbAB4yYVjZjIPuoQlFq4QbftQY/6ukhtEZNwTmJ47uhad5FEONr5u8
         L3pQ==
X-Gm-Message-State: AOAM533cnw02i4XBBEDc6aCYNx+Fg1WcOiD1PRN4xSmQG9WYCx7tQdg/
        cHz/xt5wZJPOvXJza0MO6PWgmtME91KvQvfT
X-Google-Smtp-Source: ABdhPJzX4bjGrAj/paDFM2a/G8MTnnQVqmFBKArk7gU//pa62k6RPWHvOLZFFEeh00u7YAgS3vb1Gg==
X-Received: by 2002:a65:625a:: with SMTP id q26mr12390796pgv.311.1621954865872;
        Tue, 25 May 2021 08:01:05 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r11sm14063222pgl.34.2021.05.25.08.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 08:01:05 -0700 (PDT)
Message-ID: <60ad1131.1c69fb81.6e4a2.df71@mx.google.com>
Date:   Tue, 25 May 2021 08:01:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2021-05-25-v5.13-rc1
X-Kernelci-Branch: next
X-Kernelci-Report-Type: test
Subject: renesas/next baseline-nfs: 15 runs,
 2 regressions (renesas-next-2021-05-25-v5.13-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 15 runs, 2 regressions (renesas-next-2021-05-25-=
v5.13-rc1)

Regressions Summary
-------------------

platform            | arch  | lab             | compiler | defconfig       =
   | regressions
--------------------+-------+-----------------+----------+-----------------=
---+------------
dove-cubox          | arm   | lab-pengutronix | gcc-8    | multi_v7_defconf=
ig | 1          =

r8a77950-salvator-x | arm64 | lab-baylibre    | gcc-8    | defconfig       =
   | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-05-25-v5.13-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-05-25-v5.13-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      1931e709c701ea2913e8714f9658bea8cd5e361f =



Test Regressions
---------------- =



platform            | arch  | lab             | compiler | defconfig       =
   | regressions
--------------------+-------+-----------------+----------+-----------------=
---+------------
dove-cubox          | arm   | lab-pengutronix | gcc-8    | multi_v7_defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/60acdd4938e3cc6a6fb3afbf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-25-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-nfs-=
dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-25-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-nfs-=
dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0503.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60acdd4938e3cc6a6=
fb3afc0
        failing since 28 days (last pass: renesas-next-2021-04-02-v5.12-rc2=
, first fail: renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276) =

 =



platform            | arch  | lab             | compiler | defconfig       =
   | regressions
--------------------+-------+-----------------+----------+-----------------=
---+------------
r8a77950-salvator-x | arm64 | lab-baylibre    | gcc-8    | defconfig       =
   | 1          =


  Details:     https://kernelci.org/test/plan/id/60ace1ea46b2db90d6b3afbf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-25-v5.13-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a77950-s=
alvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-25-v5.13-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a77950-s=
alvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0503.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ace1ea46b2db90d=
6b3afc0
        new failure (last pass: renesas-next-2021-05-17-v5.13-rc1) =

 =20
