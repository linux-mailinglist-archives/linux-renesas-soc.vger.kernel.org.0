Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 859E04792F8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Dec 2021 18:41:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236228AbhLQRlZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Dec 2021 12:41:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236210AbhLQRlZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Dec 2021 12:41:25 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F329EC061574
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Dec 2021 09:41:24 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id g13so2883869pfv.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Dec 2021 09:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Kv69NO7lCNvuSd8lfgtioDAAOmPscjoimF1p8XMMIjg=;
        b=biGMcKzaacBnf/MSWr9/IRMkezX6ajzCd/efCbcok8VqtqCt+FBIWOw8njeYqzMx2X
         B9S04nVAqTyTjLDLbSsG3L1yGDCvzQIrUSRCqOX7o+f5l15aSRyTmSjVK3aJzqF70tln
         Csevi+Emn8YFuepST54b7CKKLIntNI1Wfim533Ynju+SlX5xslX//4SekqYj6aRPYdAc
         blbwDqr94Mmqn+of/sB2pcSli4tOL0tWBxp4P8vYY6MeMVoP0fgh1KVpunDBcDYnjDro
         C9Xxdj252Bp+SjiMLCC/xYPcRB7cxmkAUFQOz7W0lOin7D3X/LwA4/WEvMbo4Vcl0K36
         zogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Kv69NO7lCNvuSd8lfgtioDAAOmPscjoimF1p8XMMIjg=;
        b=Rv8bUV7kJLtbSlBoJC58hXbskWOph6kzwWGYNTfIIAf9RtkttjPLUyuooZhOHxkqg5
         kVQutNPLzmIqJVYca1CKTwLIT7an6VZwWp8BpvzS7dDCdVYtABrZRGZGKMtWAMJ9RMu0
         pbrMweDhtsa/bQa5ZEVOMpBnai+tM91IXZUwyoxkDsZtr2h40oT6Fp+Bfl5Q9fBHur4q
         3Hn7ZBvsVfafaSsGJPbQZ+7XZbGRMBbzedOkaRDim4zcKpG3HwHqS1qnhEhgAtjFKXwd
         rEotYp0Uc2pQ+5bEpHsGzPstQC/rGiVxElT/g9Fjp7oPvIzCNyKaVh38JlwwQ9jXYbNl
         9row==
X-Gm-Message-State: AOAM533MW71u+qjRi4wVgfam4oEFI0voeUKIQzLXffdH47xNeP/5HAih
        rvmKJvCV6YxdCv2WdE88ItvcP9TAaFZdl6jF
X-Google-Smtp-Source: ABdhPJxetsjN3cZ9wEwkcfnQxxBBANtCnsnbHdxog6NrVa9o8D3HkU1LveBjvj/3+lZ03AUzcVgmBw==
X-Received: by 2002:a63:fe06:: with SMTP id p6mr3677701pgh.621.1639762883941;
        Fri, 17 Dec 2021 09:41:23 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k20sm4830972pfk.111.2021.12.17.09.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 09:41:23 -0800 (PST)
Message-ID: <61bccbc3.1c69fb81.80ab0.d57b@mx.google.com>
Date:   Fri, 17 Dec 2021 09:41:23 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-12-17-v5.16-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 53 runs,
 1 regressions (renesas-devel-2021-12-17-v5.16-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 53 runs, 1 regressions (renesas-devel-2021-12-=
17-v5.16-rc5)

Regressions Summary
-------------------

platform            | arch  | lab          | compiler | defconfig          =
          | regressions
--------------------+-------+--------------+----------+--------------------=
----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+CON...OMI=
ZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-12-17-v5.16-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-12-17-v5.16-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      9aa3a08281f795eec94a1d7ee8c48ed7dec31a7c =



Test Regressions
---------------- =



platform            | arch  | lab          | compiler | defconfig          =
          | regressions
--------------------+-------+--------------+----------+--------------------=
----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+CON...OMI=
ZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61bc942fb1f77956293971af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-17-v5.16-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ba=
ylibre/baseline-nfs-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-17-v5.16-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ba=
ylibre/baseline-nfs-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211210.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61bc942fb1f779562=
93971b0
        new failure (last pass: renesas-devel-2021-12-16-v5.16-rc5) =

 =20
