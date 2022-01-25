Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E79849BC8C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jan 2022 20:58:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231218AbiAYT6z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jan 2022 14:58:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231205AbiAYT6r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jan 2022 14:58:47 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7E73C061749
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jan 2022 11:58:42 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id my12-20020a17090b4c8c00b001b528ba1cd7so3906548pjb.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jan 2022 11:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2PereS9d5DrGLC39Yz3gEJ6MdR9y1ke9BsTm1b25fgk=;
        b=gbnodVpauDGIZUdpd3QYiq2aNnehRigNRAY9ou8tkI+b0+3D3yhocHQpzZAH4ujgiA
         6csFjXRQhHRkq+DKJOurRI5WH6mxbva4+3G+61K3nBWv7Ci1wVij+ILZIpWrFPweZwzK
         AiSRDLdeH29a8ZkGSqu6VcMlkTPhgKKzJsnLbkXEMVEhv5A89EeMIMINDxkzYW6gRz87
         rXbtZv05KTtpOVoH8B5MK4R4lBbrEr7Np/m61K+/rL/Vmr3Zs1d/9MH2nofvxB+ohbfS
         TRqQy/Xoq0hyP3i5QCj9hOvBPtlLabkM1vW/hbOZU3DJ4xWlyvKS0ZLPxgRPllkYVPVm
         uCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2PereS9d5DrGLC39Yz3gEJ6MdR9y1ke9BsTm1b25fgk=;
        b=QOKFGMZEWK5KnpSrXqLD4Vut1ip27K7TF7PgGCg//xLU/PqHl7IhrbCBfuz0vWmYG1
         GAI3KlwjqIIlDg6crHJ6aahWP6iBdSg95wnRYJztiGBqJD5+2fO4yNSRhVK8SwrMIujp
         wfL534aB2WkeZ1J7XgBUSVeOAlx/FkXjxTyOhCZfZs5o5tiyULUEnUDHUyrxjdLfkLur
         2BwOjoh/RLRKwyti5gF+KSywn2p1aSOWKtrqFWj9C/G+iHN9RV2xqyZajHBLUxOFQyB6
         EC8gHD4xPpMILPIJ/CD0K6GjcSR0pe+558euljVcLWGDdSKAJ3kmFnPBcVDbWm8ZIoMj
         SvWw==
X-Gm-Message-State: AOAM532F6V8JIgMY6ej015nmXYqFqWVFOa8dHO4g4vSqNqMXfQe+BS/1
        R2Qg6TiPgKaPNzH3gfSy396WcdFxCIch6EI2
X-Google-Smtp-Source: ABdhPJxCkx+hkLZnPrvIhO8znMfZo/+Q81NR+tkTs1cyKS1w6k8hkz7tswF0IZSt3Uqn90K2hMypzA==
X-Received: by 2002:a17:902:e84b:b0:14b:4aa7:6198 with SMTP id t11-20020a170902e84b00b0014b4aa76198mr11860740plg.10.1643140722197;
        Tue, 25 Jan 2022 11:58:42 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id bj26sm9392457pgb.81.2022.01.25.11.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 11:58:41 -0800 (PST)
Message-ID: <61f05671.1c69fb81.b7e25.9036@mx.google.com>
Date:   Tue, 25 Jan 2022 11:58:41 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-01-25-v5.17-rc1
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next baseline-nfs: 51 runs,
 1 regressions (renesas-next-2022-01-25-v5.17-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 51 runs, 1 regressions (renesas-next-2022-01-25-=
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
s-next-2022-01-25-v5.17-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-01-25-v5.17-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      1d26428af3fa29a0ab6986cee5a0ed32ea43e975 =



Test Regressions
---------------- =



platform            | arch  | lab          | compiler | defconfig        | =
regressions
--------------------+-------+--------------+----------+------------------+-=
-----------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+crypto | =
1          =


  Details:     https://kernelci.org/test/plan/id/61f0241bce3a903705abbd20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-25-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-r8=
a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-25-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-r8=
a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220121.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61f0241bce3a90370=
5abbd21
        new failure (last pass: v5.17-rc1-18-g925b6371c834) =

 =20
