Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4FF7379B12
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 May 2021 02:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbhEKAKD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 May 2021 20:10:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbhEKAKC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 May 2021 20:10:02 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FA2DC061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 May 2021 17:08:56 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id s22so14482833pgk.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 May 2021 17:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=3AVrIz1mFeA4xc5Pjs5cPdCzHbmbJb9eY8xBZBShsQc=;
        b=x+W3kEdHVs7dmOykQFefYEZpfrGrRJLxuzhU0dsmzgQtAeUIzEjnxm5Seq3NjUwuQf
         kjJG6j5lRjttIwrAFbYawVor0BSq8qAS2O58+NYyve+ClKIdBBOIVZEsQSZe8aISZuxn
         H7H4JIA/okOk2VaJgc7mWQJDnEil78UXER+ongJFZvYeoU6IFeBZV1E3bTfABmleYJkq
         WOkHIW0I+CrscyKKZqh2LD+EpELOf+XjXnW/jQg/5oY1jdVASyyhTZpEMYSD/4vMLzvE
         0e1sD6NYDUpmkXB3l68sf4Pf5wxiSu61MYzwNRfjsPBfwFB/ERt258L5MMfZbgA8MsOt
         /jmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=3AVrIz1mFeA4xc5Pjs5cPdCzHbmbJb9eY8xBZBShsQc=;
        b=CbGXq1WaNNFweANBi7JIq7ncPTSF+pz29P8ZxpeO5YVTHV5Ltk/8SrmttbFNFVYus4
         +n0Zfm8KfmPl21rGm9AGIMROLYQFdxqK+VSeqP7PWdzY39/kzcBefYmxjARrrGYnPY44
         9T30UJ6XKyLAP22AlOhKENTppEiCFCSvXOV1qvnBAhBapd2GUnpAvwEFgrP/MB4D11Dp
         kWwMPKB2jLd5mDIbEOTq5hawXpf6hsnkRmuz3Mu5z4/ychz8Hkzl6OCDANDstpBESkWx
         BuHiV+A+G8lNOLn/myvRzSLf4ZntIR/EDAbJ5HHjanxT4RLvmJ17naqOdNJkGpIWIo51
         imWQ==
X-Gm-Message-State: AOAM5322zKxjlofQQy2lKGPPFtfoumLRlwNVw8nvHCbI64YeXKTUnGvU
        UH6PtO+Zc//7f02ol17E3mYGnCzwhQTxayKk
X-Google-Smtp-Source: ABdhPJzeHoSPFJ548BBJhSOTcQ1j9qesI2aLXbn0mlDZpB/csS5xYW7+N7LfhpaqQY4Ii87SvEhs6A==
X-Received: by 2002:a62:528e:0:b029:1f5:c5ee:a487 with SMTP id g136-20020a62528e0000b02901f5c5eea487mr26952160pfb.7.1620691735982;
        Mon, 10 May 2021 17:08:55 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e24sm9195995pgi.17.2021.05.10.17.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 17:08:55 -0700 (PDT)
Message-ID: <6099cb17.1c69fb81.119d2.cbb9@mx.google.com>
Date:   Mon, 10 May 2021 17:08:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2021-05-10-v5.13-rc1
X-Kernelci-Branch: next
Subject: renesas/next baseline-nfs: 12 runs,
 1 regressions (renesas-next-2021-05-10-v5.13-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 12 runs, 1 regressions (renesas-next-2021-05-10-=
v5.13-rc1)

Regressions Summary
-------------------

platform   | arch | lab             | compiler | defconfig          | regre=
ssions
-----------+------+-----------------+----------+--------------------+------=
------
dove-cubox | arm  | lab-pengutronix | gcc-8    | multi_v7_defconfig | 1    =
      =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-05-10-v5.13-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-05-10-v5.13-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      213494b51d07b798e12651aaa9e24d8e0acf90e0 =



Test Regressions
---------------- =



platform   | arch | lab             | compiler | defconfig          | regre=
ssions
-----------+------+-----------------+----------+--------------------+------=
------
dove-cubox | arm  | lab-pengutronix | gcc-8    | multi_v7_defconfig | 1    =
      =


  Details:     https://kernelci.org/test/plan/id/609995a87b6631a9896f5475

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-10-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-nfs-=
dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-10-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-nfs-=
dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0503.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/609995a87b6631a98=
96f5476
        failing since 13 days (last pass: renesas-next-2021-04-02-v5.12-rc2=
, first fail: renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276) =

 =20
