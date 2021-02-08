Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D8733133A6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Feb 2021 14:50:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231132AbhBHNsG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Feb 2021 08:48:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230526AbhBHNre (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Feb 2021 08:47:34 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 995C5C061222
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Feb 2021 05:46:08 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id e9so8824622pjj.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Feb 2021 05:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=LBYQ5BrUzkl9ZuAhG+Ujjy94kSROQ7PVBG0kH926X70=;
        b=H89ICK7iD5qUyU9qaSuRHhanvGUICvMKmDHhrEmadbnwSwjw1sPxWYxOlARgLUuTa8
         wHTzstEjI+5CtxmWCVNJ/sGZEn5BV+ETsoOXSFIRmM7leb7H9zeO6P0pwQ+ZylWFu8U2
         Nrj3l5w3LKWocpHGE87I/CCNNIG0mXTI2Kwqnm2NiQuRizFPp0WTMPyC87wA7JnGY+6i
         Es2PBOncVT0DabmdTia0Puo71kboD1ZF8CjK7ll+2k8yWPxw4a6xtIw8Ki5IYBVKpAA5
         quU8GuqZo3i/cE04o240JlA8s9gU37FoR9RQXkM8jDcrmiNdzjtFQOtyP7nmz+n7vYUf
         U/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=LBYQ5BrUzkl9ZuAhG+Ujjy94kSROQ7PVBG0kH926X70=;
        b=oajW4dUzSkMBnjLITjjy5rtt3SCiNapywnUSngoeSqa8Zpf0tNpMIDqXV8iAMpd9F7
         O0sH5bhJkFxMgjIdT/iPI8D3CxoxJdtb2QlC7olG46TBHcbGcAENTU63HDYvsOiJGsCz
         6zQ6/rjJEBeNHWnrLRCNV17WcaxRcDMlIViCRbwIake9COcAYXUDti1qnh3guA9zxueC
         c0Y91nh5b7hk5Be9xtrM4Sj3up8XRYF0RFndDP3646iqERaAbfnt98ePVQuNytdluYWv
         7Wbn5v2gi7hntK2SWAjPukTigDALtYF8uNC0tgIQJ3laxA3NvFAao0wYhp/yYPyZJVj8
         eMNQ==
X-Gm-Message-State: AOAM5336Xy5wqtRAIwVbG0E9jHr9IC0jxrSUwwZpsuSkD+DFRPkr9CzQ
        MY8Wl29WpBdjt6opd6zu6hgThoGALLw3BQ==
X-Google-Smtp-Source: ABdhPJxlduPt6wZ8hx6wGqycWfJNGvDy1Zbpni4Kbv8Zqd2gWzrGnhLxzXNfl7lIFDILHOMf0TZv/A==
X-Received: by 2002:a17:902:9a49:b029:df:fab8:384 with SMTP id x9-20020a1709029a49b02900dffab80384mr16504116plv.37.1612791967877;
        Mon, 08 Feb 2021 05:46:07 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n15sm19054587pgl.31.2021.02.08.05.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 05:46:07 -0800 (PST)
Message-ID: <6021409f.1c69fb81.a8077.99b7@mx.google.com>
Date:   Mon, 08 Feb 2021 05:46:07 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-02-08-v5.11-rc7
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline-nfs: 22 runs,
 2 regressions (renesas-devel-2021-02-08-v5.11-rc7)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 22 runs, 2 regressions (renesas-devel-2021-02-=
08-v5.11-rc7)

Regressions Summary
-------------------

platform                  | arch  | lab          | compiler | defconfig    =
   | regressions
--------------------------+-------+--------------+----------+--------------=
---+------------
r8a77950-salvator-x       | arm64 | lab-baylibre | gcc-8    | defconfig    =
   | 1          =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre | gcc-8    | sunxi_defconf=
ig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-02-08-v5.11-rc7/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-02-08-v5.11-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      1ae0d11b9a943a7e6ced2a899bc9352429da3a44 =



Test Regressions
---------------- =



platform                  | arch  | lab          | compiler | defconfig    =
   | regressions
--------------------------+-------+--------------+----------+--------------=
---+------------
r8a77950-salvator-x       | arm64 | lab-baylibre | gcc-8    | defconfig    =
   | 1          =


  Details:     https://kernelci.org/test/plan/id/60210dea4ea30a21e23abe70

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-02-08-v5.11-rc7/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a7795=
0-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-02-08-v5.11-rc7/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a7795=
0-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0201.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60210dea4ea30a21e=
23abe71
        failing since 7 days (last pass: renesas-devel-2021-01-26-v5.11-rc5=
, first fail: renesas-devel-2021-02-01-v5.11-rc6) =

 =



platform                  | arch  | lab          | compiler | defconfig    =
   | regressions
--------------------------+-------+--------------+----------+--------------=
---+------------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre | gcc-8    | sunxi_defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/60210c080aef8ecab53abe79

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-02-08-v5.11-rc7/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-02-08-v5.11-rc7/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0201.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60210c080aef8ecab=
53abe7a
        failing since 9 days (last pass: renesas-devel-2021-01-26-v5.11-rc5=
, first fail: renesas-devel-2021-01-29-v5.11-rc5) =

 =20
