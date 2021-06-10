Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 868703A3806
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jun 2021 01:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbhFJXpc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 19:45:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbhFJXpb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 19:45:31 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EFF4C061574
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jun 2021 16:43:34 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id h12-20020a17090aa88cb029016400fd8ad8so4874009pjq.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jun 2021 16:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ilCaxnDD1wEqC2fSP0aYojOkGfqRaYBN+kjn35k7Cb0=;
        b=Fxs/lv2EzF1BJ6+btNd92WD5zzM2P2RQye0DeCyzGQHLJkZOYbf7X2eoOOAUgBn+oU
         RRkHU6dwEbvY1VXhLU6ENQY3iO7vwInxNSwGt8C9iGRsFYNDoayVI9wzg3sDLRtAaZ/H
         jv/B3GMXkC9zVph2NywYp+c5mNlX4ZaOAvCSzm3YTkT0+rjhySMKfx1hMfnxT9a6hKMS
         8xLm1v3st+oZNY7QDZO7/nZEYqoyjTZZDtOSa2FDXBg67dm1hBDGV8xOH2BAAYQRPKCU
         xPisr3pA2Ih0hL+gSJCw0pqgts8V3/Hr+TsyZHuKSWCN+Cv4O5Sw369elxE1MrHjefL9
         XgVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ilCaxnDD1wEqC2fSP0aYojOkGfqRaYBN+kjn35k7Cb0=;
        b=QurnZy2IIMw9T4G93sJhcwmfzPQVWe4M5LxLcUOg3jMUhciYmwWVI77/Q9zNHhID3p
         prpDWD7BVBX84hE4TC2nSvr35wVR/qBXeJsZqMgQVv3DlSP4PCgXwrlcqc3/pEf9SoWW
         gdSOS+Y4u6iBV1+qbKqMx0qA4m+AibzaJbF+9A0kBfxdwT4jVczrXAcSrU0IRpwflL7H
         3TXmLfaG5if4xwFopqsuU0K6OIFBE7kqA2TRCJ8wC97mvXBmTjg/tvTcG4qif9nU2Org
         XHmKcdYIfAwsjPu0JBHwrQfL3Ru7ArBDhuCc8EtxdQ7xEfnF3cVDN1jYuIJxRJ1j3M2V
         hvxQ==
X-Gm-Message-State: AOAM530FJbqdcIh3N861BeX2xZIDFR2jgFrwxibysHK644PDDAgfqLCF
        YsnaoJd6Qe2SXKSiMrj/uQtiuwJpQEnlXeXa
X-Google-Smtp-Source: ABdhPJxXB3VEu+DKgj7HMfXx5itK4nf2iKet8HkNsJLJTSjwoPNzX6oCqmwjda8QsHmlfzNB//nXdQ==
X-Received: by 2002:a17:90a:c485:: with SMTP id j5mr6032635pjt.87.1623368613876;
        Thu, 10 Jun 2021 16:43:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q13sm3345405pff.13.2021.06.10.16.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 16:43:33 -0700 (PDT)
Message-ID: <60c2a3a5.1c69fb81.ed69b.b86d@mx.google.com>
Date:   Thu, 10 Jun 2021 16:43:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-06-10-v5.13-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next ltp-ipc: 6 runs,
 1 regressions (renesas-next-2021-06-10-v5.13-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next ltp-ipc: 6 runs, 1 regressions (renesas-next-2021-06-10-v5.13-=
rc1)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-8    | x86_64_defcon...6-=
chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-06-10-v5.13-rc1/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-06-10-v5.13-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      23df6d1f09712871dfba619729a8a165f147c17e

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  9dcbf4e96a41ac69842e705d4dea51fc8e7b0860 =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-8    | x86_64_defcon...6-=
chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/60c28e9635972bfab00c0e05

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-06-10-v5.13-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora=
/ltp-ipc-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-06-10-v5.13-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora=
/ltp-ipc-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210520.0/amd64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/60c28e9635972bfab00c0e=
06
        new failure (last pass: renesas-next-2021-06-07-v5.13-rc1) =

 =20
