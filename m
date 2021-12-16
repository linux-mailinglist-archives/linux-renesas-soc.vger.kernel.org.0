Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB120477DA5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Dec 2021 21:32:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241240AbhLPUcK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 15:32:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236123AbhLPUcJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 15:32:09 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1227C061574
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Dec 2021 12:32:09 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id k64so324145pfd.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Dec 2021 12:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Q/YE5hPGnfhSVUcG8nOoWhj1ihnxA6JI2qElUSzJNu4=;
        b=NtRfWNriBItlo0gSzDHKFd59nSgelfI8XR9tM55iSSQLWcnyTPqsnqIh9WgjcUIj21
         qxCAzS9a7/6HmuvzmPW8QI+TjFzlT+z3/7ONWMbD5bAXY44j1W2/XFm7xIzpfR4DNGtE
         0gMJMEr4HZMsWezWl9pfQi81ig9FshJzw4zMvRkUehNW1xGhDj0etd3zboLzpaicyW8m
         w6mW4EPqYayb0mhPz07dUZ9FbGd0AqqarzQGIHQfk/i1mYq3xaYhIa6mDVvPgb2Dhy5U
         w94vCLrVCTaLjml/Pi8EmtVeXJBUil3h+oiHZSTQ/zx+opVg40bPMAjEDx0S7vDFu7I/
         qIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Q/YE5hPGnfhSVUcG8nOoWhj1ihnxA6JI2qElUSzJNu4=;
        b=bdRuyl9lMIzmgBkdh7N7pzR61no/CqczkBmNeFXozNx0RLiigzz/xUK990Z/Tmk+Aj
         OmzojlSC6zUOT5E2vqWgRcMKDQ6PwriHyrocmj074C7QuQgpoIbtAx8RaHYGB6bP2Hp+
         ri7r1gUtXs41O+Gq7l1sz+CdpqtjHtpKokG4q9XfJoSiwmqZMCEchdf+XPn44KK9UKtz
         DxPTBPTT+NIfKzCQDnPcJKFBfWVBDzCBUF5Glx9TF6xCtHtvn8hGGru3jggXhRXTDYVQ
         JjLq2+BrEVcLWD4BVkO9Ur7U0U9GDfJO0a2GnS8BM1yhapiKNx7kmm7tKu241D7AmkRr
         ECHw==
X-Gm-Message-State: AOAM531pJmm5aLCl+t98DzWfU/QmOKNTOFPVzUWKsAOBCj+dc2Z0FL6s
        EylxH15Z/J9N0fPPrO23er92RY29/V8+8Epk
X-Google-Smtp-Source: ABdhPJyoIQOzhtyKVluEggO7Vbb981OQ05wnneOLOwoE52eWyL+ZnT25BL1akyLZCAyQpTcNSerLUg==
X-Received: by 2002:a63:5d61:: with SMTP id o33mr7186510pgm.341.1639686729075;
        Thu, 16 Dec 2021 12:32:09 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k16sm7538246pfu.183.2021.12.16.12.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 12:32:08 -0800 (PST)
Message-ID: <61bba248.1c69fb81.c763b.4056@mx.google.com>
Date:   Thu, 16 Dec 2021 12:32:08 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-12-16-v5.16-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 66 runs,
 1 regressions (renesas-devel-2021-12-16-v5.16-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 66 runs, 1 regressions (renesas-devel-2021-12-=
16-v5.16-rc5)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
| regressions
-----------------------------+-------+--------------+----------+-----------=
+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig =
| 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-12-16-v5.16-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-12-16-v5.16-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b33e75b3e597788be243c04aba22d39431b9ecfb =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
| regressions
-----------------------------+-------+--------------+----------+-----------=
+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/61bb69cc269537d5e639713c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-16-v5.16-rc5/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-=
g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-16-v5.16-rc5/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-=
g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211210.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61bb69cc269537d5e=
639713d
        new failure (last pass: renesas-devel-2021-12-14-v5.16-rc5) =

 =20
