Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3D9480537
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Dec 2021 00:05:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233913AbhL0XFa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Dec 2021 18:05:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232415AbhL0XFa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Dec 2021 18:05:30 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DB36C06173E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Dec 2021 15:05:30 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id r16-20020a17090a0ad000b001b276aa3aabso6533582pje.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Dec 2021 15:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Nnzk/F1p14yWqd3SmqLrB+1yZXGKMqHbAdSoq5ou7lc=;
        b=VC5wEhbS772M5BWP3FN1rYWX3kBVZ2hhBn49b7jcjc+k62Ntk0lj0KwlQuHzh/T5NY
         OW04tjm3VFd/e2G28nNNnvXO0OUksTN2D2eexQPkPiy2+qdqAMmTWeqWg+q9wHw/nKtd
         cY6nFq5aJ+S77sl0w4/6XwgkZsG8dtw2G02E12O6Fg/xnj9EUv7Nuefhl4ia0Wk8ixw2
         KAl/eAP0uFhQsEJifC66uU+iVnEU1Uhnk+KV1AQLfyaXp8BpTS9AsMcmC/0+ScH6nlt4
         AtsJHpH6Liy4JxTsZ0FPxXF9R+vDMpmDhlycHgidyMxCCXcHTVjqIMyJeVLBTxtvfx/R
         zgTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Nnzk/F1p14yWqd3SmqLrB+1yZXGKMqHbAdSoq5ou7lc=;
        b=iN32AjpY8ffrjlnoaz68nWmXXbzvb1oeK1AW4lJor0c50MiKanQQ7yYLyryMvPZM4+
         aeoi+vCdYCVardxt7boQk8aCMag4z/sccKnkzpeb9F22wn8pjZ/VqNdLIVlVe456stsL
         DpJQNGTw4R8sHExm4haSNt9BJIL5B44+fkI3uAhWmjNfnGpdLQVHWMZRzh54xle6UWGJ
         5sSfvrhIno4EiP/iSPTqVf4YPDfdVK7bf44ma3L6vlYWabWPqzoKGTVbXWSUF183Jkfs
         wZtQuRrR3TEaZwTNNZ3iosf0tngsbWiukmcMy7riM5L491uulyBMkJ54NMMfl9U/l58w
         Zq5Q==
X-Gm-Message-State: AOAM530rBC7ikj5fMKtOScIYhuQapyL5TGxSn8TzdaKb2Gx8w6r84TcY
        5iN5SnFgSTp383xNxGAesIGzDalBKiDvzhRG
X-Google-Smtp-Source: ABdhPJxSRvM2uTraVea6gancgS60zqE6JcVBEAriDhvYyN6R6m0lQz0meNSMHC989MwnPiDREpEgqw==
X-Received: by 2002:a17:902:e552:b0:148:a2e7:fb29 with SMTP id n18-20020a170902e55200b00148a2e7fb29mr19294227plf.106.1640646329716;
        Mon, 27 Dec 2021 15:05:29 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 185sm95857pfe.26.2021.12.27.15.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 15:05:29 -0800 (PST)
Message-ID: <61ca46b9.1c69fb81.4b08e.07d8@mx.google.com>
Date:   Mon, 27 Dec 2021 15:05:29 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-12-27-v5.16-rc7
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 55 runs,
 1 regressions (renesas-devel-2021-12-27-v5.16-rc7)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 55 runs, 1 regressions (renesas-devel-2021-12-=
27-v5.16-rc7)

Regressions Summary
-------------------

platform            | arch  | lab          | compiler | defconfig     | reg=
ressions
--------------------+-------+--------------+----------+---------------+----=
--------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+ima | 1  =
        =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-12-27-v5.16-rc7/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-12-27-v5.16-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      70c9b40ad59ce28a6c668a48cc12f21ebf81aeba =



Test Regressions
---------------- =



platform            | arch  | lab          | compiler | defconfig     | reg=
ressions
--------------------+-------+--------------+----------+---------------+----=
--------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+ima | 1  =
        =


  Details:     https://kernelci.org/test/plan/id/61ca1558d874bd72b9397149

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-27-v5.16-rc7/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-r8=
a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-27-v5.16-rc7/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-r8=
a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211224.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61ca1558d874bd72b=
939714a
        failing since 7 days (last pass: renesas-devel-2021-12-16-v5.16-rc5=
, first fail: renesas-devel-2021-12-20-v5.16-rc6) =

 =20
