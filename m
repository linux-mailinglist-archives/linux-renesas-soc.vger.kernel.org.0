Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45D462D99D1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Dec 2020 15:26:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729497AbgLNOXa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Dec 2020 09:23:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730520AbgLNOXR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Dec 2020 09:23:17 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD517C0613CF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Dec 2020 06:22:36 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id lb18so6331892pjb.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Dec 2020 06:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=7mRQ/GQ5dGthwMfMQKTtZsDmdHEkE5BtorpY3BBCm1U=;
        b=YwcpUCevQlrKYVALbeb/cHktmvAnBG93CJQjRld0bC4jC1qGAn41J+NulNZqz8iaUk
         rL0lNvaoH5iXDhtdyiR6xMHgby27GhVMfcasjxkjmz+Qmcdm4wB2xVSCj4zARqge/WCU
         PEU56b4YofgJPkGR7kV3u6jnxEBOCvM23S2DdTPNJ2PuTp30iwN3rOq08xD44eYvgVpf
         Yg033h3rvwpimR9MplUOO2eutape+05s3OlAIiopuJ41ywJU3TbGzk/HHrphaU/L3qUq
         FnRopSD97o3WDXfAMqJ6T4Bn8mRz+gVhyHw9b8MwWzAbCMsTODBKD07UoZ+TsufG395o
         d9NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=7mRQ/GQ5dGthwMfMQKTtZsDmdHEkE5BtorpY3BBCm1U=;
        b=pxy9eL4bgLrWLlA2yROHM2aEZbulFon0F+sFDMly0sXUTqI+YfSrZiXYjSPyoEUQZT
         mvJPCMZC+Lf07sH333XwrGWyCc1dIY1z6BQqQYH7HQUOSTLo73eFslm8BTC5ZbYqqjNe
         nZm42zcUQnjk4e0yygGFEuFoBiPUvTwBdNhmIV/tpc5QIEWlE9igFjU41c9BB7NraYAC
         P3m2JFs1zaMRx/bA8emrRG9LUarInXuyYG/ca2OA1VeEAEU8uoAiV4T39eicYTqfdJlm
         4ClD9TUDRaZxuugLTJbcIcfanlU8g4nQd6N/EAuW9gEOd3dV/OiTC/hkTngUPfEh8eJ/
         Dnpg==
X-Gm-Message-State: AOAM532B3qcqvU/qdULoxtqt6TAtEN0VSXB9YJLuD+CSzhNJ6ccEoojE
        tLiMn6C4B+2T4oIqRLbJtSLsWarO54HfiA==
X-Google-Smtp-Source: ABdhPJyVTk+nurjuFkCnXV4DApJmL7/1+WmozxrRFvYmfBwTeav5yCJp9SxrO7ACQC3aBOKHohEeCQ==
X-Received: by 2002:a17:90a:7f05:: with SMTP id k5mr25973016pjl.103.1607955755786;
        Mon, 14 Dec 2020 06:22:35 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q23sm20818392pfg.18.2020.12.14.06.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 06:22:35 -0800 (PST)
Message-ID: <5fd7752b.1c69fb81.8cbe9.a5c8@mx.google.com>
Date:   Mon, 14 Dec 2020 06:22:35 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2020-12-14-v5.10
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 14 runs,
 1 regressions (renesas-devel-2020-12-14-v5.10)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 14 runs, 1 regressions (renesas-devel-2020-12-=
14-v5.10)

Regressions Summary
-------------------

platform                  | arch | lab          | compiler | defconfig     =
     | regressions
--------------------------+------+--------------+----------+---------------=
-----+------------
sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre | gcc-8    | multi_v7_defco=
nfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2020-12-14-v5.10/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2020-12-14-v5.10
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      c308f63de590dadc2c668e9d347da00b0fa76ade =



Test Regressions
---------------- =



platform                  | arch | lab          | compiler | defconfig     =
     | regressions
--------------------------+------+--------------+----------+---------------=
-----+------------
sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre | gcc-8    | multi_v7_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd748ae1a0675c3eac94cfc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-14-v5.10/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7=
i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-14-v5.10/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7=
i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2020=
1130.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/5fd748ae1a0675c3e=
ac94cfd
        new failure (last pass: renesas-devel-2020-11-23-v5.10-rc5) =

 =20
