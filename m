Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EDC34FCF22
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Apr 2022 07:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231317AbiDLFyr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Apr 2022 01:54:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241477AbiDLFyq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Apr 2022 01:54:46 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9CB033E9F
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Apr 2022 22:52:29 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id k14so16265132pga.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Apr 2022 22:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=QiIZRXDglMLKg46GDx+CICa+7PnrswCzRqxWcld7Nnw=;
        b=YTx4KbRZpZ7FCaQL039buFoqVDNPxHySx0nmsVq/4MGhlIRIFuxy2Wg14CEJpGrgCG
         h/kIV9C2OzYQZwRvZLrfzXkE8U3J3nWGYCy9XBf9ZbY75TY5Qfo38pmSeG21AjkyY6lT
         K+PaUgXo2LSffqRnk8XjeXTdPGAh+DAsyQ2PVf1EPKhlwer+bFzzhYA2/Q4E1blglCoD
         zrK1Wzr3EBz+YUsu6+BPEvLXg87amJo1GbX4RuhI/hM+0frbUManuwDNV/DHRb47lN3M
         nhawYsmt5DXuQBB/NR2oSUdDDS6NUT2vl0cxyB2sUcKxc1yV1VJccNMiroyF1n0kCI/F
         UmZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=QiIZRXDglMLKg46GDx+CICa+7PnrswCzRqxWcld7Nnw=;
        b=sGPQs1e/ZSoGpF8rUFjB/Ko1hGdvwVtjff3t/SO2NSy1AuiiFDI0OsGLlDraZm++ws
         JLQkL+yXoUPYy8z2cNRcpa3kRG8SPyflR47trBNziOolQ+nZ8707RvBnnSroVt6gCokZ
         5yr/gq/EQJc0AHM8IN2MDVGmCUAKprXI0aco08IE9rPau/DOH3Pz5MRejj0G3ZpeOibl
         Tx5+auujqei4TrWfn3xrnazFJpXxFvEqOL1E9/bu884DUYZ6krGLC977qT0BbdJjArfc
         +LSSlVe6Vh+fyLxEo17V5O33VjPrdIZeBadvFuwa04iQQOGVRMmxTaZ8U9aKTF48/4Tw
         xanQ==
X-Gm-Message-State: AOAM530hMYov7hN922UODgbZ+4lal6qN3FKfPmjNFYjfThjOx3CkMMBI
        hMKtdZrKvKs1jIoDgQRNDpRL6KhZhi67S82Z
X-Google-Smtp-Source: ABdhPJxPCeWnP0p9TKxZuAUHrRySott2Erb3pS1Q71ks3e+65qykGlO90k8G5u80zt4L9PURdQDE1Q==
X-Received: by 2002:a05:6a00:238f:b0:4f7:78b1:2f6b with SMTP id f15-20020a056a00238f00b004f778b12f6bmr36481770pfc.17.1649742749012;
        Mon, 11 Apr 2022 22:52:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i2-20020a17090a138200b001cb6512b579sm1273370pja.44.2022.04.11.22.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 22:52:28 -0700 (PDT)
Message-ID: <6255139c.1c69fb81.d8d48.48f0@mx.google.com>
Date:   Mon, 11 Apr 2022 22:52:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-04-11-v5.18-rc2
X-Kernelci-Report-Type: test
Subject: renesas/master ltp-ipc: 11 runs,
 1 regressions (renesas-devel-2022-04-11-v5.18-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master ltp-ipc: 11 runs, 1 regressions (renesas-devel-2022-04-11-v5=
.18-rc2)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-04-11-v5.18-rc2/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-04-11-v5.18-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ea5bee24e7143e88663f6497f6f9defd9ae0f77a

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  163cca9acb71d06492836a667a53554ceec37639 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/6254f0c4c34920bcceae06d4

  Results:     8 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-11-v5.18-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/l=
tp-ipc-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-11-v5.18-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/l=
tp-ipc-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20220401.0/arm64/initrd.cpio.gz =



  * ltp-ipc.pipeio_1: https://kernelci.org/test/case/id/6254f0c4c34920bccea=
e06dd
        new failure (last pass: renesas-devel-2022-04-04-v5.18-rc1)

    2022-04-12T03:23:13.562610  / # =

    2022-04-12T03:23:13.564742  =

    2022-04-12T03:23:13.666105  / #export NFS_ROOTFS=3D'/var/lib/lava/dispa=
tcher/tmp/6069398/extract-nfsrootfs-op_kt91t'
    2022-04-12T03:23:13.668425   export NFS_ROOTFS=3D'/var/lib/lava/dispatc=
her/tmp/6069398/extract-nfsrootfs-op_kt91t'
    2022-04-12T03:23:13.774011  / # export NFS_SERVER_IP=3D'192.168.201.1'
    2022-04-12T03:23:13.776042  export NFS_SERVER_IP=3D'192.168.201.1'
    2022-04-12T03:23:13.878548  / ##
    2022-04-12T03:23:13.881689   #
    2022-04-12T03:23:13.984630  / # export SHELL=3D/bin/sh
    2022-04-12T03:23:13.986986  export SHELL=3D/bin/sh =

    ... (301 line(s) more)  =

 =20
