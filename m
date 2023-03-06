Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 584786AC60E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Mar 2023 17:00:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbjCFQAG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Mar 2023 11:00:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230458AbjCFP7s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Mar 2023 10:59:48 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0C9126875
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Mar 2023 07:59:44 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id ky4so10905891plb.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Mar 2023 07:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678118384;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AX25VNiv+5frJsy1ymjc1ppShpVaFqNCJUmnhYrkGwg=;
        b=5vfoSPFYXRJSEI+xD1ey87F9NWvGDvGqCOK4ATLQ3iZRj8MVQ4epSQblYCGPuYQUKi
         Lcvmm2B0nOWKF5jmcc9Szf3Obp29Rik2PsYeRxUjmkx8XWvLnv3M6mLHxK8YBJroiQeK
         CQlhiajMF9N/AP0KRivjWfhtrKIGRwMhLZsY+4P2vSU7uhNUWziMqmiPO8pPDxZ3/MVD
         D5aiVaWPNfumOSg59+6eGnG+hClW/8Q0MYn67M3zez3HXy1n/xFMPsbIKqYnheiENd9i
         Jn2ThPCJvlCayxccPK4SBtD0fDbJI4gIyVB8B/pdj2CMgYNCVANtrcVXlwhNGpqDBQKJ
         hImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678118384;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AX25VNiv+5frJsy1ymjc1ppShpVaFqNCJUmnhYrkGwg=;
        b=h5FHDmYDs5FCEmyqDr1dwYqWTaXCLF/d34oUVRAi4sk+hnFBu0+JqXdyUNVlcB+eZh
         7cV+EoTchDXf8qwtiUC2cLkPu8fDXUT2N00OaAoKC5cvfJtmleYfVgKaX9mpTPB7eJiX
         FU+x/Y4pDKoljlJNrfTL/t2nWVpXDawtCTvTByiCMml3uwVHfyJiAt7gJwcy5UWHp3gP
         DCf8VILRmKDL4rMJV4QkHc54Sbh3dSt51qvBUDVXj4xpPJbLvgjvHASwxHGXI3YLOH4I
         Z0bd13HvCCQLTiQuFniCjfm7Nl0akMG6JPn9mvga477/k4I9nF9LuFgITnFBonc7iolf
         0AGw==
X-Gm-Message-State: AO0yUKXRwRdMa4byjhxLaqmrWmDrB9VgdMhDtD5Gd6ExMU5taozsH8rq
        qtWknRj5JXRHlghcoCPAmaE9N9Z3Fg5fl59NJ9FctD07
X-Google-Smtp-Source: AK7set8yIWaFRGztnUvqEQ1bRFeJjtfo78QZ32G2qlHnCUyLcXJzOtLX2toGM40Eo5UksaOqwdVEuA==
X-Received: by 2002:a17:90b:1c06:b0:236:76cb:99d3 with SMTP id oc6-20020a17090b1c0600b0023676cb99d3mr12003180pjb.12.1678118384159;
        Mon, 06 Mar 2023 07:59:44 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l3-20020a17090add8300b0022335f1dae2sm6183356pjv.22.2023.03.06.07.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 07:59:43 -0800 (PST)
Message-ID: <64060def.170a0220.51e8d.aa88@mx.google.com>
Date:   Mon, 06 Mar 2023 07:59:43 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2023-03-06-v6.3-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next cros-ec: 12 runs,
 1 regressions (renesas-next-2023-03-06-v6.3-rc1)
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

renesas/next cros-ec: 12 runs, 1 regressions (renesas-next-2023-03-06-v6.3-=
rc1)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-03-06-v6.3-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-03-06-v6.3-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f8f70cfd66498277779fd34bd2266ea83ce3944b

  Test suite revisions:
    cros-ec-tests
      URL:  https://github.com/hardboprobot/cros-ec-tests.git
      SHA:  f6c0dbf63842d5751000c5527808aca38354db55 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/6406027449c9bf96408c8669

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-ec-tegra12=
4-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-ec-tegra12=
4-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230224.0/armhf/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/6406027449c9bf96408c86=
6a
        new failure (last pass: renesas-next-2023-01-30-v6.2-rc1) =

 =20
