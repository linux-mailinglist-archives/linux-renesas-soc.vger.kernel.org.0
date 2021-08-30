Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A4EB3FBCA5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Aug 2021 20:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231715AbhH3Sqv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Aug 2021 14:46:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230411AbhH3Sqv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Aug 2021 14:46:51 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 656EDC06175F
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Aug 2021 11:45:57 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id q3so9075472plx.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Aug 2021 11:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=nb+y+Haxu6e9BmKTPEM6xTNhcgRgZEQMA6P4vNrdwcU=;
        b=AsYaC2iGB+5dRpIwPO4350n1SbfWHCyxQMrWRITjEzbRAhdPsMTKNI1IxSXTb7eVAP
         BnkHSIwjT4GJOmdo6i5CK1kSmolvWQfK9n2XQ5sHk3nMlgFaJ4n2a1abkqVZuBBBA4CE
         v+e7MiRbBhixN6SW7f5x1m418VBni8JNwwTTcbfs5+p18GqLVk3rHZLFz/505RVoY9dx
         +yQvnH/beHDTxkAQF+Ktxe5KvNqqxjifW7IApYvilrlXAQZgTPvLvaiJTyquLDuG61eu
         vsVYeBZRuhMQcUoYTjC95k4Bx+iSS2TyjT6g14QgC6ofQa7PXjJWdt9eb7FDKBWYyK6a
         Ermw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=nb+y+Haxu6e9BmKTPEM6xTNhcgRgZEQMA6P4vNrdwcU=;
        b=Xb4Sn0STS7CTe6X95twK0K09xiXJLm1BmBN/nr2qSjp7oel8BVo2L0Bdb8bmlOTlx1
         XHAU4l3xsJEdYdECxP8WK9OT4XRIUcWQf2i0sXhtX/fOBrOJ+R7wmHjYSpRdiJvh/gFq
         tlzbehJyF7YMXemTRnFNVFfuAlwydy+B5xj79dadDGY10qgsS6pl2VBUXkBqcjMZDCFc
         1ZGBi+O60hfGhhg1ssMBwCsHOENHblFg5TBmZ8/6HT+tA29U5wkdubomLQ2x7IxTX3cn
         V4mTjkAaxTcqJT2BAih4WHmieLu4komTQQBSjxOJNG1y3SmqcjJPcyF5u44WcrmF0/ST
         tcpA==
X-Gm-Message-State: AOAM533RAziPpjgpeiGGRpUbaCxFA31wkjX9Oxnw+NAhiQ8HBYtnQDF/
        crep7SYjVjAk5m+js89Aah3kFSkzYr/udY+J
X-Google-Smtp-Source: ABdhPJzR2q723qJHF6fURrmiCBz/LmcXFPwRJvDM0KMIECKUioYhnFf9TqZn+HGY/yTNOrccrUsPmQ==
X-Received: by 2002:a17:90a:9289:: with SMTP id n9mr533029pjo.27.1630349156699;
        Mon, 30 Aug 2021 11:45:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h4sm219450pjc.28.2021.08.30.11.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 11:45:56 -0700 (PDT)
Message-ID: <612d2764.1c69fb81.74e6a.0e60@mx.google.com>
Date:   Mon, 30 Aug 2021 11:45:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2021-08-30-v5.14
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 50 runs,
 1 regressions (renesas-devel-2021-08-30-v5.14)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 50 runs, 1 regressions (renesas-devel-2021-08-=
30-v5.14)

Regressions Summary
-------------------

platform   | arch | lab             | compiler | defconfig          | regre=
ssions
-----------+------+-----------------+----------+--------------------+------=
------
dove-cubox | arm  | lab-pengutronix | gcc-8    | multi_v7_defconfig | 1    =
      =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-08-30-v5.14/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-08-30-v5.14
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d137660340411cbf97721b1578583f20a31fd6b2 =



Test Regressions
---------------- =



platform   | arch | lab             | compiler | defconfig          | regre=
ssions
-----------+------+-----------------+----------+--------------------+------=
------
dove-cubox | arm  | lab-pengutronix | gcc-8    | multi_v7_defconfig | 1    =
      =


  Details:     https://kernelci.org/test/plan/id/612cefa9c335604e1f8e2c9b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-30-v5.14/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-nfs-d=
ove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-30-v5.14/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-nfs-d=
ove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/612cefa9c335604e1=
f8e2c9c
        failing since 125 days (last pass: renesas-devel-2021-04-12-v5.12-r=
c7, first fail: v5.12-451-gae657abc971d2) =

 =20
