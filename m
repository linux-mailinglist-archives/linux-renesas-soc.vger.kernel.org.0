Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB7464A5840
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Feb 2022 09:06:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235293AbiBAIGc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Feb 2022 03:06:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbiBAIGc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Feb 2022 03:06:32 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18CF8C06173D
        for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Feb 2022 00:06:32 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id q63so16381296pja.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Feb 2022 00:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=L41aHlixwe9moFv5grqiUdz9Lq/t0ZiaP0QYhhGk1gM=;
        b=erPCXImgM1DDcqiY0QrN8vMxI+FrBlXlqWyXuO2BDZQAfjaJ9xM59NY5Or6NQMmj3Q
         B0h6sVBE6rlvFjgoQBe7rge4l0Z57dIlDx09XNL+FtaNaQ6ZgRW9ILmWA7PF8MC47hsT
         TyOrtaKtkkyW1SmHjzP314vvyWyVe8zqIrCL8aoPHf+EzlAwiiD2iDjq9W9eoDrPBoEu
         h450ANuWM6MQVgMLErAAMC+9V/vDy7mkb/HFRLRIXAg5A1uStSxE3Aw40tiHhcbfwAFy
         6ZCDZz9DeHAz99RjPFlb3CCZSqzLMVsYbBVQcu6LHHwqbGMDs1C0BEkyjjw2hwWcNjiq
         ikQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=L41aHlixwe9moFv5grqiUdz9Lq/t0ZiaP0QYhhGk1gM=;
        b=zuexy19+EqPod60Tq+JxXwg/mckBm3i+yGQNwSDyufor23HPa/SqzCP7qf6MZph595
         XcKB4GSN83BU+uRfyJS4COGcKvP8eLUNDOe1WcXW7B3nqnSviCdwIsGWBpexw3fEJA40
         XmgkUp03Gp4gzwEEXQW/Qs+7EuraBdmA4Y6yssibcu8na+xN5rfhZW7i34N0yGCNyUao
         wHqNJAp9YJZdV/w4W1NK8cDrP83wQ+VeIl/LNGa4fG7lLNy5aEg3TJbbX2IdVP/WiU2k
         rBM2AWKsbLYuawe4rOQzc8U8SFfqQYT7Q99dxK+ex09W/0JpSbOcO2QLQxzH1nVjC5rx
         Qmbw==
X-Gm-Message-State: AOAM533pWy74dX7kpewWA9FWdQ5J4h2KO/KWL6C5QiRI5kk9V4jqUoL1
        X/BAxL7HM+hH1l8g02jXMbExkqpd7dLbQp3C
X-Google-Smtp-Source: ABdhPJwG6ZsjeRIDkKunKM3KPdjOXOpXmO9t5CEyQJnAOiUfIyrd6C0P5RV7mXlBfe6utkJK/Ck5rw==
X-Received: by 2002:a17:903:249:: with SMTP id j9mr24587627plh.145.1643702791439;
        Tue, 01 Feb 2022 00:06:31 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j18sm21699629pfj.13.2022.02.01.00.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 00:06:31 -0800 (PST)
Message-ID: <61f8ea07.1c69fb81.c2369.a09c@mx.google.com>
Date:   Tue, 01 Feb 2022 00:06:31 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2022-01-31-v5.17-rc2
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
Subject: renesas/master baseline: 399 runs,
 4 regressions (renesas-devel-2022-01-31-v5.17-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 399 runs, 4 regressions (renesas-devel-2022-01-31-=
v5.17-rc2)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
bcm2836-rpi-2-b  | arm   | lab-collabora | gcc-10   | multi_v7_defc...MB2_K=
ERNEL=3Dy | 1          =

fsl-ls1043a-rdb  | arm64 | lab-nxp       | gcc-10   | defconfig            =
        | 1          =

fsl-ls1043a-rdb  | arm64 | lab-nxp       | gcc-10   | defconfig+CON...OMIZE=
_BASE=3Dy | 1          =

imx6ul-14x14-evk | arm   | lab-nxp       | gcc-10   | imx_v6_v7_defconfig  =
        | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-01-31-v5.17-rc2/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-01-31-v5.17-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      3aa8ba88974022cbe2386cf2cd1b93d7244301b5 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
bcm2836-rpi-2-b  | arm   | lab-collabora | gcc-10   | multi_v7_defc...MB2_K=
ERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61f8c05c3d8c13e6ba5d6ee8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-31-v5.17-rc2/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-31-v5.17-rc2/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f8c05c3d8c13e6ba5d6=
ee9
        failing since 77 days (last pass: renesas-devel-2021-11-02-v5.15, f=
irst fail: renesas-devel-2021-11-15-v5.16-rc1) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
fsl-ls1043a-rdb  | arm64 | lab-nxp       | gcc-10   | defconfig            =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/61f8b5799191ab813d5d6f22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-31-v5.17-rc2/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls1043a-rdb=
.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-31-v5.17-rc2/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls1043a-rdb=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f8b5799191ab813d5d6=
f23
        new failure (last pass: renesas-devel-2022-01-25-v5.17-rc1-11-gba94=
d205dc711) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
fsl-ls1043a-rdb  | arm64 | lab-nxp       | gcc-10   | defconfig+CON...OMIZE=
_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61f8c2f7f23784f31d5d6efc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-31-v5.17-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nx=
p/baseline-fsl-ls1043a-rdb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-31-v5.17-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nx=
p/baseline-fsl-ls1043a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f8c2f7f23784f31d5d6=
efd
        new failure (last pass: renesas-devel-2022-01-25-v5.17-rc1-11-gba94=
d205dc711) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
imx6ul-14x14-evk | arm   | lab-nxp       | gcc-10   | imx_v6_v7_defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/61f8b4ccdb11297a535d6f46

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-31-v5.17-rc2/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-=
14x14-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-31-v5.17-rc2/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-=
14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f8b4ccdb11297a535d6=
f47
        failing since 3 days (last pass: renesas-devel-2022-01-11-v5.16, fi=
rst fail: renesas-devel-2022-01-25-v5.17-rc1-11-gba94d205dc711) =

 =20
