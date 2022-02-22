Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07BD64BEEB3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Feb 2022 02:14:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237686AbiBVAWX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Feb 2022 19:22:23 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237677AbiBVAWW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Feb 2022 19:22:22 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C5072AFE
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Feb 2022 16:21:56 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id u16so10259665pfg.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Feb 2022 16:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=U1OKqTCOYJD4ivzQ4+3N65pWD5dXw1s2eBayof7lxUY=;
        b=Zl7PWgWjFRgC6vrA3D0pjjJvEWjQ3hgoMcRgcLtWTJmv9KmO5xnTfpYbp0Fq0WRHHX
         eLLbiEmaPfhG6IUKFnhU9xKQJ/LpecMfJEGJihCM7BTDB2wN6XPP0uDrefbEykT0rXWK
         FO18fk9XfpcJSndXxMKb7GzPQfvfAA0Jif5/9cWWhatJY302DTVfyoGmX4fk+cGjbZ0F
         8iZP7rWUvzPH0MS7TXNg6cARRrzvVDg5pQqnyA1DXCTP+2khaqjtp2QQmnxOeXX1u5at
         iEr0nhpcD1MH6Z2j54umMVoFK078cg1vt41nAxSlTVnUI4CwotazxwgRCEJzw8XzDRWY
         PhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=U1OKqTCOYJD4ivzQ4+3N65pWD5dXw1s2eBayof7lxUY=;
        b=lWqCrIH7/fz/dlLPo3WW8f4JJ4Lmh09FzV4kgaIt2WM7/Mai4PhhU8k2HBJj855gYI
         ZVMc3+4gDGlM1GB0At3Tkqwr+fnEretz6FQD93IuhnkdXjOttwiwF1mLSEg9vKcRfUMV
         mz+FYLPEo8EBxuokCj4tQ1My7yd0YcIaFCE4ozGXhe94FRNPi6ttVJzfHg30LHk4/vVL
         zOjJl7kqu0CP7QpWLihjcAN3t+f+Y0PKGO6vRoVn1+AVFltnemJNgW5iTdazJIQwCm2S
         xhkaWyzINjeCybg/uo/j6QH7x4G/I9Wy05tcQqxqgJXO1mLTtUg7UTTQW45V5wcM4w1o
         JCtg==
X-Gm-Message-State: AOAM530AMEgqNljnwaCwhqwjYwVqw+T/bvDJ+lH8y77Sq2VhcmuMbK3/
        ap70czV8RAhpcx0N6JOwNF/8PEqCqg3+LTSP
X-Google-Smtp-Source: ABdhPJzG28s6vzJCnB+X/lhEJM5ZWxHr/YA4chrFSUvHGhGR9U6LM5ZjLxsx9pzzJ+XYV/jaQSyL3A==
X-Received: by 2002:a63:1060:0:b0:374:6edc:7cfc with SMTP id 32-20020a631060000000b003746edc7cfcmr1795421pgq.500.1645489316310;
        Mon, 21 Feb 2022 16:21:56 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id jx3-20020a17090b46c300b001b905570597sm453535pjb.17.2022.02.21.16.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 16:21:56 -0800 (PST)
Message-ID: <62142ca4.1c69fb81.3c3f9.1d8b@mx.google.com>
Date:   Mon, 21 Feb 2022 16:21:56 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2022-02-21-v5.17-rc1
Subject: renesas/next baseline-nfs: 48 runs,
 1 regressions (renesas-next-2022-02-21-v5.17-rc1)
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

renesas/next baseline-nfs: 48 runs, 1 regressions (renesas-next-2022-02-21-=
v5.17-rc1)

Regressions Summary
-------------------

platform            | arch  | lab          | compiler | defconfig        | =
regressions
--------------------+-------+--------------+----------+------------------+-=
-----------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+crypto | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-02-21-v5.17-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-02-21-v5.17-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ee30666d75e27c8e1eb2dd1070527c011c5fbab7 =



Test Regressions
---------------- =



platform            | arch  | lab          | compiler | defconfig        | =
regressions
--------------------+-------+--------------+----------+------------------+-=
-----------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+crypto | =
1          =


  Details:     https://kernelci.org/test/plan/id/6213f0aa31bdd1d95cc6299e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-21-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-r8=
a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-21-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-r8=
a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220218.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6213f0aa31bdd1d95=
cc6299f
        failing since 27 days (last pass: v5.17-rc1-18-g925b6371c834, first=
 fail: renesas-next-2022-01-25-v5.17-rc1) =

 =20
