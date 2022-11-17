Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8089D62E999
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Nov 2022 00:29:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234710AbiKQX3W (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Nov 2022 18:29:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234999AbiKQX3V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Nov 2022 18:29:21 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F1D31101
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Nov 2022 15:29:20 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id o7so3015553pjj.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Nov 2022 15:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iB97/I5lSk+L7i3ORJF4t35Qjzj/ZKPSE+xW2R2q6a8=;
        b=08wjAP+GaLqsRCGRRnc624RnVK5mOZrisaXozSmUbnRe7k2pFc8ybIA+ZXikIGUu/m
         3eiJRpQtgNxKByt3DA8oe6KitxG+0/FZ8M3XRoq9sHTSSwEx+sD69GJXPHj07ut6Qbzo
         RBMBrAIH4TAsyvc9CAEcAAfGifR0sOwNPNPsQkcwAT7JBnSp9tBt2u5SDzSzZ8Ix1AF7
         5+e4D4r4pq0GLv4rFnx5naueTCQdhsSHkOADGtKXWuwcxwNM4rWqay7y49txvUh8QIiK
         egyo5CcU012ZqpWT7kZWxIWf0HtqH3RQ4PkgA2CDqfH1SqiA5gJ3qbgzMGeMykb2NhvA
         Xggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iB97/I5lSk+L7i3ORJF4t35Qjzj/ZKPSE+xW2R2q6a8=;
        b=VTC/JEjeUWiHCbzHGJRpl3GLEgh5zQKP6XJtML58H5vJfCsWvIH3srzOCubzPrjyef
         AwEpoXxSb+OfPkGG7VyeeyOiyJCkXQUlktxnbIVWNRPdUkOKYSNTGc82tZ0gcvDTTkSv
         oH2gmhi5GmF6FKNLvQ2AjgsWX0g7p50ly3UxtheE8yhx5SW6DpSayGdi2W6ahYynPF3m
         UoxlrUd81hwqIQxaJ5tA0VnMLee5id9cWIdRxDpaMZ84W1+KrgK98X/j7fBgy7jBmvS+
         UezwYCt+CNZRez+xtQ/bnEqtFXkYHySlygcL0BM8v+eNOAcMExjvJwr0BpWpUAxSae3t
         KYiA==
X-Gm-Message-State: ANoB5pkgMSxvw6kbuKPqjSBTZFOmbC5956pYhzDg3M0RccR17lhvV1Hv
        tk7rldAGnkZzBoVNch+n1nz3BrZPuoRx1b0T2Wg=
X-Google-Smtp-Source: AA0mqf6rX1g1qVpXT/xSP6zsUgTw6iWdKCQ/rZGxKLOJDD6lDhay9//tCfg1Q+dRGK20vQ9b7oQULQ==
X-Received: by 2002:a17:90a:9f09:b0:218:6158:b081 with SMTP id n9-20020a17090a9f0900b002186158b081mr5179822pjp.66.1668727759225;
        Thu, 17 Nov 2022 15:29:19 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v28-20020a63465c000000b00412a708f38asm1618186pgk.35.2022.11.17.15.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 15:29:18 -0800 (PST)
Message-ID: <6376c3ce.630a0220.3237d.2b31@mx.google.com>
Date:   Thu, 17 Nov 2022 15:29:18 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-11-17-v6.1-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/master ltp-ipc: 23 runs,
 2 regressions (renesas-devel-2022-11-17-v6.1-rc5)
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

renesas/master ltp-ipc: 23 runs, 2 regressions (renesas-devel-2022-11-17-v6=
.1-rc5)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
beaglebone-black | arm   | lab-cip       | gcc-10   | multi_v7_defconfig+im=
a     | 1          =

mt8173-elm-hana  | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-11-17-v6.1-rc5/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-11-17-v6.1-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      882ccb9771f9e9985a9ada17c5e35b4863258378

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  a15eb3cdfa3556203167572e15754f1f59ba26bf =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
beaglebone-black | arm   | lab-cip       | gcc-10   | multi_v7_defconfig+im=
a     | 1          =


  Details:     https://kernelci.org/test/plan/id/6376aa7366389451082abd26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig+ima/gcc-10/lab-cip/ltp-ipc-beagle=
bone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig+ima/gcc-10/lab-cip/ltp-ipc-beagle=
bone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20221107.1/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/6376aa7366389451082abd=
27
        new failure (last pass: renesas-devel-2022-11-10-v6.1-rc4) =

 =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
mt8173-elm-hana  | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6376ad385698bae8bb2abd24

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/lt=
p-ipc-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/lt=
p-ipc-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20221107.1/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/6376ad385698bae8bb2abd=
25
        new failure (last pass: renesas-devel-2022-11-10-v6.1-rc4) =

 =20
