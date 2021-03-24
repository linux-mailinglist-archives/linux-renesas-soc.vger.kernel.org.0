Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1C23482F1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Mar 2021 21:35:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238138AbhCXUfB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Mar 2021 16:35:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237807AbhCXUel (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Mar 2021 16:34:41 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ADA1C06174A
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Mar 2021 13:34:41 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id i22so3976798pgl.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Mar 2021 13:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=7RVEF77z/w8sGWzGd1+xbCmROBDNlZ07ohHqnropErc=;
        b=JUrcbq5mAHwHhATTuXVF/NwOGuev8cFg6oWwDeXRflKPxuNHhVrfMTFO8Zljk/lhIO
         JPlfCFZqRFLqnK+9eMiPCWbUNyr0SwNC+NQ8+XYrBgavGIeTQZIn5QeVGkGhPhxBc8UQ
         bije3XZ0X3T+F0DDnGGqGtBiE+/m3lm8cL1KHhDACu8MMkXRSyEsJXs4xLicWenag3a7
         cCUuN1iZ44DXZrnaDis5FqX4zYrMaUXMPoX6LKxOyA6oitSCKcsmWPBhtFutP3THjX89
         bAEBXkRKzc53UMdo7AvI2PQbDqZVKQ7GEhIq5tgOefZstEeTSpLUeCMr7sIh2fmpaUN6
         aytA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=7RVEF77z/w8sGWzGd1+xbCmROBDNlZ07ohHqnropErc=;
        b=IEWNo1U0XajAnzk0Q/TTWvyKrZU9Mf2jEc7cYsTzxOSOk8bLgIYWJIjJZO1fv3iPKX
         M0KxCw0B1Lc2vXr2cS5D5+dTy9YSVoidOJhzRq6S8Hx43EspJgHIYw1GHkzzi13Quilx
         FmqFe7lvaCzT13MUra5mQfT15tYNnSNfzEFea9PROvQ+HH9bNsDcI3fSrnf9wwC4QZIw
         L2lqmisB78XjUYD4w9Ee5PvkJ0X31N45YCKX5/9yr9tQyi7Mm1z0fYNY9x4lIJCwBvDX
         AGR5KejMoKLHQG/QngDn3bpDLZihHtraz+TXcTnzzrTtEtPPCN5sZgwbcpjdALDVCYI/
         QEIA==
X-Gm-Message-State: AOAM532eOOfnOZE3HUhVG/ZShHqrm6FAVwQ663f5QFYY62kMz8CJkNwI
        wN79EuSXOS7xpWtJ1SYBbpgJtsmbRqhUqA==
X-Google-Smtp-Source: ABdhPJx/hlCAk60pwfO9e5kWmjTisZPRuNr8I/PZGk552pMzvm7ict9/h+rDHvIglbt9sBo8X/R34w==
X-Received: by 2002:a05:6a00:8c:b029:1f4:25ee:af4 with SMTP id c12-20020a056a00008cb02901f425ee0af4mr4524148pfj.71.1616618080574;
        Wed, 24 Mar 2021 13:34:40 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y20sm3465949pfo.210.2021.03.24.13.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 13:34:40 -0700 (PDT)
Message-ID: <605ba260.1c69fb81.7d5ff.8d36@mx.google.com>
Date:   Wed, 24 Mar 2021 13:34:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-03-24-v5.12-rc2
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next baseline-nfs: 20 runs,
 1 regressions (renesas-next-2021-03-24-v5.12-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 20 runs, 1 regressions (renesas-next-2021-03-24-=
v5.12-rc2)

Regressions Summary
-------------------

platform                  | arch | lab          | compiler | defconfig     =
  | regressions
--------------------------+------+--------------+----------+---------------=
--+------------
sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre | gcc-8    | sunxi_defconfi=
g | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-03-24-v5.12-rc2/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-03-24-v5.12-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      32b5d4bd9e510c3aa9cc6ff8484f563260ea7104 =



Test Regressions
---------------- =



platform                  | arch | lab          | compiler | defconfig     =
  | regressions
--------------------------+------+--------------+----------+---------------=
--+------------
sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre | gcc-8    | sunxi_defconfi=
g | 1          =


  Details:     https://kernelci.org/test/plan/id/605b8f202247a5cf33af02b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-24-v5.12-rc2/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7i-=
a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-24-v5.12-rc2/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7i-=
a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0315.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/605b8f202247a5cf3=
3af02b9
        new failure (last pass: renesas-next-2021-01-26-v5.11-rc1) =

 =20
