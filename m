Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D93AE355010
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Apr 2021 11:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244906AbhDFJhB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Apr 2021 05:37:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244891AbhDFJg4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Apr 2021 05:36:56 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8034EC061756
        for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Apr 2021 02:36:46 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id s11so10013291pfm.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Apr 2021 02:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+4EAC4fWhpiubiKlagiE+jaThCW/u8eVvHiArnKe9VY=;
        b=k4H8dW3PU+X6EcPBWenX4IHgdyaKyeyBu0IYZ8Xq19wp6VMGnMayVWsnL/zUiOdyTT
         OOHgND54ppXrGYCjNbrRMHi5xqtIiBTLeYCfS9MN8Opou2Nm378p4g2lGy4DLChSu3wN
         BlYaXihQ/bLdJ910zDG1Jg480HhotjP6qmijjObpEyINkiXbMgnVVVj1UmT10JsXQwyF
         u4LKQBJT9Oblt52v5CQ2ufX9YoR8A62/YcnXx/R2d2WZzwr4ZsI9X/3qZG6UhoREiFTA
         PfspCjiBlartkhZMzWPTqlfW2cRKDsh/IQlIftTEiwGXXsPq1obE2kLUmZ5LYKliC6Li
         ff+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+4EAC4fWhpiubiKlagiE+jaThCW/u8eVvHiArnKe9VY=;
        b=gET8mizjvJA4FS603JIvdDxXLh8/gSQPFMLZAcRrJy0TisVK6tqT5bOg+ZnughzT1H
         wZoceAhAUbQwRZzltIBZ7g/8xfaUqrMy5Fm3cEoljvJyZJDTC5OOsSYKbyhKGR4RpnuF
         QI5sWdyuuhMIlgeKdysCxCkQOOZu9sWZgf1xOc8g1jrFjWZ7EIhYNM0BhtFGwZZaeRns
         b7anfMwrT0IsdkSyXkn1cyZn15URQCJUBz+XWz9MjNmmRzG2nFrYzOFx3FoaEgKKC/y2
         fir5VMVo1BBklePPkWvGJx+eZRoUBsA2KqnRK4MvfBLG1KgUe7usrWFARf2p0eCqWnca
         3mrw==
X-Gm-Message-State: AOAM530jRYGPR4+qIuROlbB49+xgCGUuKG5am380xl8RclxbXuClqm9V
        9HFF/1Sj+SNXbnEFLFJTP0WaClkCX7hJFA==
X-Google-Smtp-Source: ABdhPJy+G5NnUhHKKgTEZ9UKZC19UWp4/Itb2kcPfOWTzoxWhu02TSy2sS22HmW0R60w8BUU+S4Ftw==
X-Received: by 2002:a62:cfc4:0:b029:200:49d8:6f29 with SMTP id b187-20020a62cfc40000b029020049d86f29mr26245245pfg.45.1617701805744;
        Tue, 06 Apr 2021 02:36:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l1sm8264331pgt.29.2021.04.06.02.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 02:36:45 -0700 (PDT)
Message-ID: <606c2bad.1c69fb81.3f94b.469d@mx.google.com>
Date:   Tue, 06 Apr 2021 02:36:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-04-05-v5.12-rc6
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 19 runs,
 1 regressions (renesas-devel-2021-04-05-v5.12-rc6)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 19 runs, 1 regressions (renesas-devel-2021-04-=
05-v5.12-rc6)

Regressions Summary
-------------------

platform                  | arch | lab          | compiler | defconfig     =
  | regressions
--------------------------+------+--------------+----------+---------------=
--+------------
sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre | gcc-8    | sunxi_defconfi=
g | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-04-05-v5.12-rc6/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-04-05-v5.12-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ea0aa7f2e67d781466efc1f9867e42062aa6e685 =



Test Regressions
---------------- =



platform                  | arch | lab          | compiler | defconfig     =
  | regressions
--------------------------+------+--------------+----------+---------------=
--+------------
sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre | gcc-8    | sunxi_defconfi=
g | 1          =


  Details:     https://kernelci.org/test/plan/id/606c1bcad2bc4f8c9ddac6e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-05-v5.12-rc6/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-05-v5.12-rc6/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0324.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/606c1bcad2bc4f8c9=
ddac6e3
        new failure (last pass: renesas-devel-2021-04-02-v5.12-rc5) =

 =20
