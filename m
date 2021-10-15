Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED5C542E796
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Oct 2021 06:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233083AbhJOERC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Oct 2021 00:17:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234211AbhJOERC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Oct 2021 00:17:02 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72769C061570
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Oct 2021 21:14:56 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id nn3-20020a17090b38c300b001a03bb6c4ebso6384686pjb.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Oct 2021 21:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=6tIRfe0j3pe76gUBAByQvkzT7ijM53u5lATBzMa8tZg=;
        b=0v1av/s1cjGEt9/YWgMQeLReB4m+OOmUw6nSPRfb7xUosiK1K+Hbp8syigOWTysfht
         67EB+2cpeAcEKkUG4Budea8/yuFKCm1rk8Qn/7O8uUj7Prs6UeVY3GaRUZED2CiF2X8O
         yr9sKWpwWvgpErFzPBPgP1D1rCypSklnQUEJ5jQc//gY/DhK3Mc1WclBnWVITusyeoRk
         wAKhMcylZx4hUabW3H2tdCUjga+vh23HcZIXSpXSb1OyPFDYFQsDUkqzA06BufOlh2VK
         P8jXIqOppnYzDkletQzsrfPEbi7RkUerUai63/GJRIIDsT7CwAlc/j6NXeQs+dLGTERY
         pnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=6tIRfe0j3pe76gUBAByQvkzT7ijM53u5lATBzMa8tZg=;
        b=7qKTVF5XEf1NDba3XTYJxzTBs5em0xJWjU4y7nJlPKo1PHr9SOWfaR7Sr9tt+APQRo
         4iCJfHzWzpJhaafJR9hFeewnJJXIHpAKmonnEJN0TT2Is7BCHbidV2ZIhsrJcEhoSW6K
         OPxQR/szsDSS1eMrURMVCnU7yknWLg4kF6JVAB8a+xmGPxiWhNFCImB1yepAbF8FKs2B
         Jah8UtV1jihXggxLmpY5AKyO+03t6hh0CRpfety6ZAtaC1i1HR9Dvtf37sDUsxbQ368R
         qmP4MFpq7wA2yy3C5BHl01oLQJbZ2uThv9CPbtPadMDtzqnVRe4vVEOpLkIFMDou1Ced
         u6Jg==
X-Gm-Message-State: AOAM533n7edUVai0/jRwkAUoDhgYVNNI77dIwBvexSv7AFYKMlhgzsMT
        aW4wQbx0b2/c5B1Gz8nzHB1Mt4tVvA0Ce2WP
X-Google-Smtp-Source: ABdhPJwDOW1p47NYNHsBKi8g/yBSxXgbj+pdv3ehgfVJ8jgcIiB1fhufRRCxkYNey7QP/wpkQVXxEA==
X-Received: by 2002:a17:90b:3a85:: with SMTP id om5mr11153249pjb.115.1634271295680;
        Thu, 14 Oct 2021 21:14:55 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s2sm10820408pjs.56.2021.10.14.21.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 21:14:55 -0700 (PDT)
Message-ID: <6169003f.1c69fb81.7f2f2.04e3@mx.google.com>
Date:   Thu, 14 Oct 2021 21:14:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-10-14-v5.15-rc5
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 8 runs,
 2 regressions (renesas-devel-2021-10-14-v5.15-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 8 runs, 2 regressions (renesas-devel-2021-10-1=
4-v5.15-rc5)

Regressions Summary
-------------------

platform                  | arch | lab          | compiler | defconfig     =
     | regressions
--------------------------+------+--------------+----------+---------------=
-----+------------
sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre | gcc-8    | multi_v7_defco=
nfig | 1          =

sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre | gcc-8    | sunxi_defconfi=
g    | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-10-14-v5.15-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-10-14-v5.15-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a4201b7c5b9316d0d22476708aea607cdfa47515 =



Test Regressions
---------------- =



platform                  | arch | lab          | compiler | defconfig     =
     | regressions
--------------------------+------+--------------+----------+---------------=
-----+------------
sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre | gcc-8    | multi_v7_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6168ffaf69d7f74b003358f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-14-v5.15-rc5/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-=
sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-14-v5.15-rc5/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-=
sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1008.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6168ffaf69d7f74b0=
03358fa
        failing since 167 days (last pass: renesas-devel-2021-04-02-v5.12-r=
c5, first fail: v5.12-451-gae657abc971d2) =

 =



platform                  | arch | lab          | compiler | defconfig     =
     | regressions
--------------------------+------+--------------+----------+---------------=
-----+------------
sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre | gcc-8    | sunxi_defconfi=
g    | 1          =


  Details:     https://kernelci.org/test/plan/id/6168f9092d7c2196a93358ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-14-v5.15-rc5/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-14-v5.15-rc5/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1008.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6168f9092d7c2196a=
93358ed
        failing since 191 days (last pass: renesas-devel-2021-04-02-v5.12-r=
c5, first fail: renesas-devel-2021-04-05-v5.12-rc6) =

 =20
