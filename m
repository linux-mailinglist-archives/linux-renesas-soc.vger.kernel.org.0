Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F00C46AC610
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Mar 2023 17:00:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbjCFQAH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Mar 2023 11:00:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbjCFP7v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Mar 2023 10:59:51 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40D3723640
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Mar 2023 07:59:47 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id ky4so10906061plb.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Mar 2023 07:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678118386;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GnLZc9YTYjWVp/+yRCtRaORxIXmEDBl1ZpK9wmvuAbg=;
        b=K3zBvyMXkW3WKjzh+mnRftXH/iqnSm5RuhRA366Je8/cFCFce5wlQRP0Sx1ET9PiUb
         V9DFMe0S29wZw0FbweayEA746+Q8JrFuf5arqEqZ8pMLCLb4NDNVYdj5vqIlgtqQegix
         o6XKzbivXsd6H5CUCGe5cFhxm0Da4kxXsuV12AYuVKfQwULRy8NC54TF/9nsBBPAD1t0
         wRero1kkDrGLbCw/DoKPqyVmugcb2Bl+eDRsXw0Scwduwet2VKNulSIlPGM28XOpuuJ8
         q0/ZbNBU20uGB/7W7w2NLQ80j7mVeOthBxyomj34R5yceZfU+IUYm6MoFc3p/sq7nVPv
         waYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678118386;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GnLZc9YTYjWVp/+yRCtRaORxIXmEDBl1ZpK9wmvuAbg=;
        b=HxGyBmTng2CgQCGtc8XysgNKh4DBHAq9tUV+WNJCLZ7FeeYqv0PP3cnwTbU1aklDby
         DuegC7rXOsoA6c4jWzkRnjuuv+F/xJ9Q+1nUh1npDTQpEyUaY+gRsbgAT/Xq4XLCLVkR
         Stmuxm0ncS1sY2XEk8m3l7mFiD+GSuFSu02BEJdwaIquHCSt57xS2raLcr6nCYZDu6pA
         HLiWxt6XPDQGTone9m/W+SGkcd1LyDG3rRLl/n8pHZAq0xPXtPBidUeQGlgeLpH9XW7s
         olkhvoeJ3C74Hgyt2kg5ZtABv+AZ4WGvN/iQP1Ul52MEhBsL4bDcFyaT4GWsulybUqBa
         ZlNg==
X-Gm-Message-State: AO0yUKXqCDeM16oZKS3qMI8mCFKr0Pi6bogT0GoG+9UUDq4nmFH7tckD
        yWz6LEnqZv6DAkP3rHVK8J+6MyouUPyrTr60eoybjgwZ
X-Google-Smtp-Source: AK7set+QwHaskqYI1dyXMMi3Kp8ogJ6Cbqo8RC/En0XJU9mcrigiSTleS0zDV4WnLKIfKVYfGqfksQ==
X-Received: by 2002:a17:902:ea01:b0:19e:9807:de47 with SMTP id s1-20020a170902ea0100b0019e9807de47mr13657687plg.60.1678118386552;
        Mon, 06 Mar 2023 07:59:46 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id km11-20020a17090327cb00b0019a75ea08e5sm6928814plb.33.2023.03.06.07.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 07:59:46 -0800 (PST)
Message-ID: <64060df2.170a0220.8af32.c3d6@mx.google.com>
Date:   Mon, 06 Mar 2023 07:59:46 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2023-03-06-v6.3-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next usb: 3 runs,
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

renesas/next usb: 3 runs, 1 regressions (renesas-next-2023-03-06-v6.3-rc1)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-03-06-v6.3-rc1/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-03-06-v6.3-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f8f70cfd66498277779fd34bd2266ea83ce3944b =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/6406033d998095c57d8c8641

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-tegra124-ny=
an-big.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-tegra124-ny=
an-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230224.0/armhf/rootfs.cpio.gz =



  * usb.login: https://kernelci.org/test/case/id/6406033d998095c57d8c8642
        new failure (last pass: renesas-next-2023-01-30-v6.2-rc1) =

 =20
