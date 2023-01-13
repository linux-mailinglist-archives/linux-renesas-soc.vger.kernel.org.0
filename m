Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D4E9668852
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jan 2023 01:21:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233576AbjAMAVa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Jan 2023 19:21:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240147AbjAMAVB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2023 19:21:01 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1E1D2196
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 16:18:23 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id 20so9608329pfu.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 16:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1k5Jv8y3mJilafMtgVv1G0CQ+eBGdsvg2FdWmckgkmw=;
        b=qCR2ovRmwKciXbNeKC9n2UfdOWmT21Xv38/3ZEw3OD13+PAZKQSNoIi0LNseXwyU+I
         WmswU8RHqXMDdazaeGZZt4hNhsuWdLrNYYbqFvpRkh9IWQBwa2q4/sSB/jCydbAID4Sj
         eUGZvHMHUGM4DM89FnXt66pWKtfDXUBO3pCfmWs3l4vD01E+Qdtau/VbtwoIkGD4fF8i
         jSnJcpjqORJ6sFJYOPLT44sNwxAdV7ad31ngY7EA3USpYXizLDJLjCrHbHoc4oaJ3yKs
         PTYKaAvEPCmSenAmSJAUyXSupUYtS0QT3yL5SmOhYlyV5W9Jj+UTtZnPGPrJSfy07PNg
         ZcXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1k5Jv8y3mJilafMtgVv1G0CQ+eBGdsvg2FdWmckgkmw=;
        b=cIaMcpOR1DdOHVKzqOWYFwBgLVEBQcXuE0ywNjNNEj0rntd3ftJ0GxAqJeHB4eth+P
         GRTscXPqx91X9x0hy5ZBm4eoNtSwIZHdgVe9ao7DAvK7bGrB3sQtgM9L6vePWJWRQHd9
         q6Ze0OMBtXwXNx07AjBfcD9USUlgkzqg+etmseBukhaMMETNHd6gdQHkjdeNiqHRq0oe
         hZx3jKndKMqRNhe01tdVaGrn44wS76E8mEAOkgLozpAuSsQQmrDMkx7Lg+LxqzM1iu9i
         3Dj3QlCZvDGpSb43AOVk6eI9zfKhV1tElIjlfN9Esx3bWfa1MNcfYRM/zKxvGS+GW2IK
         Yi2g==
X-Gm-Message-State: AFqh2krpXxYQMquB87ZZDHpZjzfBOqSt2P4fgGigwSUr5GC7FOVCR+5n
        H5RIUs4PkwUwWTuWv8CLRFm2J91ZNx+0L8+vAvL26w==
X-Google-Smtp-Source: AMrXdXvQJ1dyhiCeKx+mZb29JUtX9MEp2kj1AZKm9j+etU6WHKMtCuXhYF3y4UWXEos2n8MZ/3df6w==
X-Received: by 2002:a05:6a00:b91:b0:581:6f06:659 with SMTP id g17-20020a056a000b9100b005816f060659mr78849162pfj.6.1673569102747;
        Thu, 12 Jan 2023 16:18:22 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y22-20020aa78f36000000b00562677968aesm12463995pfr.72.2023.01.12.16.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 16:18:22 -0800 (PST)
Message-ID: <63c0a34e.a70a0220.67448.425a@mx.google.com>
Date:   Thu, 12 Jan 2023 16:18:22 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2023-01-12-v6.2-rc1
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Report-Type: test
Subject: renesas/next baseline-nfs: 78 runs,
 2 regressions (renesas-next-2023-01-12-v6.2-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 78 runs, 2 regressions (renesas-next-2023-01-12-=
v6.2-rc1)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
asus-C523NA-A20057-coral | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...6-chromebook | 1          =

imx6q-udoo               | arm    | lab-broonie   | gcc-10   | imx_v6_v7_de=
fconfig          | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-01-12-v6.2-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-01-12-v6.2-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      1f57de01e0be7bd12dba400abd81d17840768a1b =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
asus-C523NA-A20057-coral | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c06b86c7e5e3a2f51d39db

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-12-v6.2-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-12-v6.2-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230109.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/63c06b86c7e5e3a2f51d39e0
        new failure (last pass: renesas-next-2022-11-21-v6.1-rc1)

    2023-01-12T20:20:01.656140  + set +x
    2023-01-12T20:20:01.662985  [   21.245250] <LAVA_SIGNAL_ENDRUN 0_dmesg =
8692002_1.5.2.3.1>
    2023-01-12T20:20:01.772416  / # #
    2023-01-12T20:20:01.875394  export SHELL=3D/bin/sh
    2023-01-12T20:20:01.876346  #
    2023-01-12T20:20:01.978234  / # export SHELL=3D/bin/sh. /lava-8692002/e=
nvironment
    2023-01-12T20:20:01.979159  =

    2023-01-12T20:20:02.081156  / # . /lava-8692002/environment/lava-869200=
2/bin/lava-test-runner /lava-8692002/1
    2023-01-12T20:20:02.082561  =

    2023-01-12T20:20:02.087612  / # /lava-8692002/bin/lava-test-runner /lav=
a-8692002/1 =

    ... (15 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx6q-udoo               | arm    | lab-broonie   | gcc-10   | imx_v6_v7_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0702eb3a2a5c78f1d3a14

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-12-v6.2-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-imx=
6q-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-12-v6.2-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-imx=
6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230109.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63c0702eb3a2a5c78=
f1d3a15
        new failure (last pass: renesas-next-2022-09-18-v6.0-rc1) =

 =20
