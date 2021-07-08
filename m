Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 577A43C1A5C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jul 2021 22:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbhGHUL3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Jul 2021 16:11:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbhGHUL2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Jul 2021 16:11:28 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A510EC06175F
        for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jul 2021 13:08:46 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id v7so7495602pgl.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jul 2021 13:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=q1haWfmNESQnSCqVUkVaTY13QaCzU8IQOo/iSFw+ZyA=;
        b=1qMDXPBmPXli8UY7msdf5oaj2ZCex6+lfYGnKwDBCKUTTfUHMt8nZbMBi47tmalH3a
         FNW6+BNXgD/+dqEQ/Yl6wxoBYzf+Z+AlrrpLQCTcS3kcNQ1tTW5dJw+HyIRd5/1KIp4a
         NQFxQxf18gL9bE2u0BjHY7yV0LmLHsctO8DeaZLE827oBK2fiVWnh9+WqR9U2nTovlVQ
         jD4nNS3Wqm4cXli2rksTAA5+yl7CdQoY92PHwimJkMG7LQhnPhnUSblyWBfdvneCf085
         YqSTsXMKDT4JDqJAqanTsNXJ7lSytR88w4B0zFGO/2VFUMsgQp1Vc9RfhOjbmIJroE2O
         nAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=q1haWfmNESQnSCqVUkVaTY13QaCzU8IQOo/iSFw+ZyA=;
        b=HvnITswWNKlRqsQlMmWwrrXQ/DSyIuEGrCG831EkXNEq/bfx4wD4osHdiUx/1A8tek
         AjnRHtfd75f8bo9vfOY4tic/0J07+bdBKzQVojjmYxzAaVvqhE9/g2WS6dEPDlDFSYKu
         6EMlV7o/QuWmrwBSCxj7YU/x7sTvBatMR21F9GypXEoL1ud/xU0uDA9jnubDvDzdnqWo
         ouVKtw5cI/gfxpzqJKylOmcsIXlcpeTT+8OL8Ets5IsB2fqY5z8RIPLYl87XPeVSY235
         z+o9iRTHlDIwaQC/n0Wi1Ng4sJfcVEkfHRU7KpV+p3WqcdhuSB+jvUlxhtwaOYy/+DzP
         tD7A==
X-Gm-Message-State: AOAM532F0NRezLsz0U+lKbOXVlKBkM319woWnrIWGIxf/zPaiKIM5nES
        iqGWCQIMguHmtf5Gx5RGm+W3M4sGMvWGhp3K
X-Google-Smtp-Source: ABdhPJztdRJQXva8MNsaD0I+MS/+OyLn/HneoVwHh6LwhHrl5Fp3HFOwE9yQ5qfIXhcDIT41Qc1QsQ==
X-Received: by 2002:a63:d709:: with SMTP id d9mr34237970pgg.337.1625774926110;
        Thu, 08 Jul 2021 13:08:46 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p12sm3778451pfo.94.2021.07.08.13.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 13:08:45 -0700 (PDT)
Message-ID: <60e75b4d.1c69fb81.cecf.b647@mx.google.com>
Date:   Thu, 08 Jul 2021 13:08:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-07-08-v5.13-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next ltp-ipc: 10 runs,
 1 regressions (renesas-next-2021-07-08-v5.13-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next ltp-ipc: 10 runs, 1 regressions (renesas-next-2021-07-08-v5.13=
-rc1)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-8    | x86_64_defcon...6-=
chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-07-08-v5.13-rc1/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-07-08-v5.13-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      eb9ec119eee98db6f908226234823a0fef906cd6

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


  Details:     https://kernelci.org/test/plan/id/60e747d54284f5b9be11796a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-08-v5.13-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora=
/ltp-ipc-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-08-v5.13-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora=
/ltp-ipc-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210520.0/amd64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/60e747d54284f5b9be1179=
6b
        failing since 27 days (last pass: renesas-next-2021-06-07-v5.13-rc1=
, first fail: renesas-next-2021-06-10-v5.13-rc1) =

 =20
