Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2864F6BD898
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Mar 2023 20:07:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbjCPTHF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Mar 2023 15:07:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbjCPTHE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Mar 2023 15:07:04 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E609D14215
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Mar 2023 12:06:39 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id c18so2816345ple.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Mar 2023 12:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678993599;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=14Xe6wTuk/hc6NfzYj1/1z4MlM69LX+plgSPqdQzvXg=;
        b=PNa4vVXcOrDvMgrcSocwd6rjtWUAGC8Se0B1r5wXdzllxnWRk0gkbow+EoLMbPyIvH
         G24OHuPbkDCGw1kiqx/KhmmL8+tcHl0HnLFq/msReOikd71AdO2FwwbVXtCLCLE8Ruza
         spZuy6lmrcacBnrtxLPWWXC64j64HhUIWMTL1zEpxZ5bLXa4pqcN1+TKHGQPfqyOqqtX
         +my9AQBGa5TomNUiu2P2YyCpBrdg3DBs5VIiBLnUPwD+3PlREAJqB+gU5WQIyFCXsa29
         sPKaOdPDT2iGEBSNXFfWf9LrZDLVc2UvEJsks+yZaO9G2N4PPKzmLXj5xJiuZjg5UOyC
         Kx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678993599;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=14Xe6wTuk/hc6NfzYj1/1z4MlM69LX+plgSPqdQzvXg=;
        b=tY/VSr0U0ySpiQXhURuIsATxBYicGTew+VtdD3LdWHuD3YDrx+WyPDLAn119TaRKeR
         YGwgRQRvAz2hzDVvr6pEXhv92qCdvUc9ClY37yAeP2d36YiOJ8gm3tmAzqbNplZinvle
         3I8Alhs8SPbFQZsuL0GAGPItqLcG8NtnsH5HoAg2Z8IEvpHNi9UzbPrrZ+oyR5bHJEl/
         bzDQyO72UTjxl73yUcnpGuVdw4QB7GsdWfvpmE6unupBiwC3c/nL+hRuobqC0aYzxzMW
         Xy+EEvmJFmeIPQ8dZ4pc/vDKNDTlTAM/FcMmJTowLgGESWoxdVUd723w8hhqC/pS5fko
         CDwg==
X-Gm-Message-State: AO0yUKWQCgc1BN8pgcBfE/IzU/7YXLFLc/vucLedqA4Lg05xryoWf14j
        OTU41TOYDcM7svEG+qxWsYNZGDRO0Gx/w1j0PMSfNg==
X-Google-Smtp-Source: AK7set+dHepzZC5j+gWf8m4eazJ8WpS/LuBg4Imr3Bwto+cRA1vtz/Zl8Vmp2ENRhU3SqBQQJPRgdg==
X-Received: by 2002:a17:903:2282:b0:1a0:549d:3996 with SMTP id b2-20020a170903228200b001a0549d3996mr369437plh.25.1678993599142;
        Thu, 16 Mar 2023 12:06:39 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902c24600b001a0567811fbsm54962plg.127.2023.03.16.12.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 12:06:38 -0700 (PDT)
Message-ID: <641368be.170a0220.3a38e.0432@mx.google.com>
Date:   Thu, 16 Mar 2023 12:06:38 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-03-16-v6.3-rc2
X-Kernelci-Report-Type: test
Subject: renesas/master ltp-ipc: 26 runs,
 1 regressions (renesas-devel-2023-03-16-v6.3-rc2)
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

renesas/master ltp-ipc: 26 runs, 1 regressions (renesas-devel-2023-03-16-v6=
.3-rc2)

Regressions Summary
-------------------

platform         | arch | lab     | compiler | defconfig           | regres=
sions
-----------------+------+---------+----------+---------------------+-------=
-----
beaglebone-black | arm  | lab-cip | gcc-10   | omap2plus_defconfig | 1     =
     =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-03-16-v6.3-rc2/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-03-16-v6.3-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      051221db2246899aa46144707b31ce26056b42eb

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  46a2581e9f3dbef9024a33189ab307f36ec3c53c =



Test Regressions
---------------- =



platform         | arch | lab     | compiler | defconfig           | regres=
sions
-----------------+------+---------+----------+---------------------+-------=
-----
beaglebone-black | arm  | lab-cip | gcc-10   | omap2plus_defconfig | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/6413554f917794a5bb8c8642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-16-v6.3-rc2/arm/omap2plus_defconfig/gcc-10/lab-cip/ltp-ipc-beaglebon=
e-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-16-v6.3-rc2/arm/omap2plus_defconfig/gcc-10/lab-cip/ltp-ipc-beaglebon=
e-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20230310.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/6413554f917794a5bb8c86=
43
        new failure (last pass: renesas-devel-2023-03-10-v6.3-rc1) =

 =20
