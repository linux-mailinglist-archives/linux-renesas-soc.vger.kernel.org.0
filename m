Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EFB63C79E8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 01:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236545AbhGMXFS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Jul 2021 19:05:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235417AbhGMXFQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Jul 2021 19:05:16 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8E52C0613DD
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jul 2021 16:02:25 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id j199so140001pfd.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jul 2021 16:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=kgwsnQ4zzvNfLr2/W27FfaX1FG+tfby2QIztWJvfQpM=;
        b=FQWvfX4TaacWQRy6kkz5YTYUY6M1kxmzFtNXwbkAQJ4oQCuQI1Xh3XSdKfRvsET06l
         LJXUXEL4PcMdyt0CX7fHZiDZWvdei55OWoF10f+tX4gkzNtl8sEN0bwu+CI3gGsdm75l
         AiyVVcg7tZ10jXmoPZcP69T30ZGcPJKrJ4bxS2L9gR/FN5s+xsaN/wxRZ3OIeIFarBuo
         fFymLzdHy0XjW3QXsubVRx4OxUDvR6t6h+a2ighh/yrRVa4WqmKryrbyvolRGaxq5Vbb
         sqqMP+JwCEVUIMI/gAqRuK5Zglb3/nEWDjLyB+FgXrt1ZGWT/i3wdodaEM/pv3dgfLX2
         Nkag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=kgwsnQ4zzvNfLr2/W27FfaX1FG+tfby2QIztWJvfQpM=;
        b=QKXynMlSRQ1ujq4GgMlJesSDkJD4g5ZacxLS7IWlY5H+5pQ+umrwJ+FEbKRtD/5uMf
         QXdXSUfuwEeKNZHI01wqBGHW1/P1oUST76ndWU8xXKwtbeq/dBC94hj8IHv3JK9PmWN+
         QpIT5Ez1QhKhmbMFeTcrUM7gap9pmd3gr+WcZnhDOSKE8h7bmRs1keSZQWmgPezDX+Es
         EVt6emvOPlWdefE0rdQ49Dq5NpMrsxUPeOqgRDHe+hudPyv6FVgTBdUNACrf6kYYRJ8P
         IchWWBdYZ0IfH4nDEmLtbg3Nvy8QbXtlKyeGSe+McNFv4NN93UocZ7L2PeWKcU0mZeUY
         Kusg==
X-Gm-Message-State: AOAM530Yp+wnDdGveNlFKwjSd6Q+sct4bDh3ZjVA1H0DARDjzinP7Zk2
        taZ4NoP5N4BzSAenQ9jis+k5ZlDJ8/x1eEPh
X-Google-Smtp-Source: ABdhPJz+PlvUn9jMVAyFhU7thS2C3o/8FJE9CSIvf1x0WdeikbDE5xunWALudE5bKmKagYj9qFxn9g==
X-Received: by 2002:aa7:90c8:0:b029:32c:935f:de5f with SMTP id k8-20020aa790c80000b029032c935fde5fmr6883361pfk.79.1626217345193;
        Tue, 13 Jul 2021 16:02:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u24sm211793pfm.200.2021.07.13.16.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 16:02:24 -0700 (PDT)
Message-ID: <60ee1b80.1c69fb81.c427c.1449@mx.google.com>
Date:   Tue, 13 Jul 2021 16:02:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2021-07-13-v5.14-rc1
Subject: renesas/master cros-ec: 7 runs,
 1 regressions (renesas-devel-2021-07-13-v5.14-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master cros-ec: 7 runs, 1 regressions (renesas-devel-2021-07-13-v5.=
14-rc1)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
asus-C523NA-A20057-coral | x86_64 | lab-collabora | gcc-8    | x86_64_defco=
n...6-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-07-13-v5.14-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-07-13-v5.14-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      81b7948a0be3dc48ef04d01b16c08dc3b460bce2

  Test suite revisions:
    cros-ec-tests
      URL:  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/cros-ec-tests.git
      SHA:  e4c91962f6e19466c1e43629a2c6cd04ff012e06 =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
asus-C523NA-A20057-coral | x86_64 | lab-collabora | gcc-8    | x86_64_defco=
n...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee0420bec10514528a93f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collab=
ora/cros-ec-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collab=
ora/cros-ec-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-cros=
-ec/20210709.0/amd64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/60ee0420bec10514528a93=
f2
        new failure (last pass: v5.14-rc1-477-g3c037963715c) =

 =20
