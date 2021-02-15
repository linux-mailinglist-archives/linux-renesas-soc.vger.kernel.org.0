Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 166D431C410
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Feb 2021 23:31:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbhBOWbl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Feb 2021 17:31:41 -0500
Received: from mail-pl1-f175.google.com ([209.85.214.175]:41579 "EHLO
        mail-pl1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbhBOWbk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Feb 2021 17:31:40 -0500
Received: by mail-pl1-f175.google.com with SMTP id a9so2330630plh.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Feb 2021 14:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=JCR5JYXlZoQ/vIxUyJ/fbM80/l2Bt655KLTgusRVLAI=;
        b=wQIqYI0IoSsHNKYRdYqnmFmizR9ko95+UYz273THCGn+TrFoWTyANfz04iNTVMYMGZ
         FSl8BM3bE6X+b0JKChJZX495NK8aq57/2eQsm2OSDuRfXqWy8ag02pNiuo8DZTB40pk1
         PpqcBwGpB+KaMKvSY2rlpkG/PtviTJRWDNMpxZ9C+nV8Pqn2Du7gk0kNbn2ch2pF08uv
         3ImCFoma+5TbIWJC4RReEwQNiNg/rVsgvh3DTPY1n1oL2jqZdEHHAqwNAv5IJ7ercTZd
         ATCwITVqA64UQ9X8FfMI/kWU71FkhJaNivPYR5ZJKwtYvEcM/6AyjGapbqMg0lG1FFZc
         vyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=JCR5JYXlZoQ/vIxUyJ/fbM80/l2Bt655KLTgusRVLAI=;
        b=TH/2VNZ0WgzJFXH7xbDSoVr/Bd5fHoG3CuLVV+8p1LHgEcbRdgJhg/cwhMDesm82M2
         qMAnD1H98C64c2ltCuyi+IYgCNDMNgEBT3rOWxxX3Ceh+gunkro7+3z+TIeWx8cQmpeY
         kMz41+Hmvh94vvwEQmHByzyaqweNHJ2NVLHRC6hvcrSf8C5neEOLGmdpc0wfSlg60U50
         JoDI3rehL2Pv+yBPepIchsM8dT5466UUTXXFsOl/nE86qj0hs3zaNNMGVMbsjHSg4ehR
         yLxIQXnaeseoUwoua7iT2OZ1r64o8j+SFD5lI0X4Y2xGnZRBOBSpuU65oFYX60+IjGWY
         9ozg==
X-Gm-Message-State: AOAM5317hdxhKtq+CIzSdb8bPFt81HmLfd89etAB39UO6//JnpJon5UD
        ++dn0QPofLhhFtqSd/Ev2w2D1PtjmeveMQ==
X-Google-Smtp-Source: ABdhPJxwt5wlmF/dtiOZZ6zNz5OAwLM4bvb5NoXoQUuaZ4Ta7AdV4p+WgrAUNppjd8+Vlloq3vuElg==
X-Received: by 2002:a17:90a:9105:: with SMTP id k5mr952550pjo.148.1613428199206;
        Mon, 15 Feb 2021 14:29:59 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id gk17sm480380pjb.4.2021.02.15.14.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 14:29:58 -0800 (PST)
Message-ID: <602af5e6.1c69fb81.c402b.152a@mx.google.com>
Date:   Mon, 15 Feb 2021 14:29:58 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-02-15-v5.11
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline-nfs: 26 runs,
 1 regressions (renesas-devel-2021-02-15-v5.11)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 26 runs, 1 regressions (renesas-devel-2021-02-=
15-v5.11)

Regressions Summary
-------------------

platform       | arch  | lab          | compiler | defconfig | regressions
---------------+-------+--------------+----------+-----------+------------
meson-gxm-q200 | arm64 | lab-baylibre | gcc-8    | defconfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-02-15-v5.11/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-02-15-v5.11
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      33c184d73b47952c64d3d29e808fb4b5379d5046 =



Test Regressions
---------------- =



platform       | arch  | lab          | compiler | defconfig | regressions
---------------+-------+--------------+----------+-----------+------------
meson-gxm-q200 | arm64 | lab-baylibre | gcc-8    | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/602ac1049cc32da4e2addcd9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-02-15-v5.11/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-gxm-q=
200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-02-15-v5.11/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-gxm-q=
200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0215.2/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/602ac1049cc32da4e=
2addcda
        failing since 20 days (last pass: renesas-devel-2021-01-04-v5.11-rc=
2, first fail: renesas-devel-2021-01-26-v5.11-rc5) =

 =20
