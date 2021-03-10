Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 468C6334148
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Mar 2021 16:17:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbhCJPQ1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Mar 2021 10:16:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230270AbhCJPQJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Mar 2021 10:16:09 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02551C061760
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Mar 2021 07:16:08 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id 18so12256105pfo.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Mar 2021 07:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=HGm/MayWxZCP1RnfvCWQZqca96i2ON5qBlp40QzjyOk=;
        b=N0H/w/BJ35X9ocUUyj8d+qNP9aEXlG6h9/zB5IyTxG9nfRK9Y3f8lQpabx5miUQ/fW
         snait6ac4ZspfgNBv9hu1tgkoEQGpNj3CcglVmKJIGBpXQwOAy4A5aW07tv6ibWtaPhj
         5D6wuFJ+XhLm9NGEyQAMl7afyrPEMcMeY6UNVXEKBddHOyNomIl/jAcyVUteGFTJYw6O
         Vzpda8GrRJVwRZK5hpCVnIOiJ6/Kh/YOiBFjUBBl0dmJwOq9GRwxbpr7ZTQCQtdHFuAE
         kGsXRv8tEGNqs+aAWM65QpOnaXiK+5y9v2Pw5buMTGk+5u5YDgqfGPWQRMolo/RlCD8K
         I1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=HGm/MayWxZCP1RnfvCWQZqca96i2ON5qBlp40QzjyOk=;
        b=gD4MAUKwOzUXXOE9DXZX/rXbSLOF4ycRENzhgsab9DCCUvwv05SQMsQtJ/nOL0SZO7
         R6D7KeZ51Svu8tGfyKBJqtHdQw1C0gKtX8J+xw1HX2C1KKqyartfiNYmUKdO1T8RWkRw
         yIw63mfiFts6cSyGEuxzReTYsSwBsXk3qLf/4beSBAh4utaoihegeQ0Ce8hEKrpOlqXp
         yBk60rdar92fAvV+F6yPL9Zs0Yv65L9mrU0rxQIm7fTodtANoQ2g6h1PgZutg0ORZZCK
         ikak8ctrTCLONZMLtokkTa3s9l53omEe8k+8vR8NBN88/M5EEYMakjGEgfSHh15iQMcJ
         Q7Jg==
X-Gm-Message-State: AOAM532NO1LIQ8NHkf9ZtnpDRXccTKgobVqS6ninEaN2MrztqcFCVZZY
        2lPYnr1FjRrOlGz2i/ttseREWgWEYP2Gj39H
X-Google-Smtp-Source: ABdhPJzqVL36D+NM098Ff8OSTeOhrGoyUP4bGz/Jdr+7vLpkly2Y6N4CSoA8VLZmgcb4CQaZVKLghg==
X-Received: by 2002:a05:6a00:a83:b029:1ed:55fc:e22a with SMTP id b3-20020a056a000a83b02901ed55fce22amr3281518pfl.45.1615389368281;
        Wed, 10 Mar 2021 07:16:08 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v27sm14972434pfi.89.2021.03.10.07.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 07:16:08 -0800 (PST)
Message-ID: <6048e2b8.1c69fb81.9d616.3e6e@mx.google.com>
Date:   Wed, 10 Mar 2021 07:16:08 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.12-rc2-21-g604bd2d4786e9
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next baseline-nfs: 12 runs,
 1 regressions (v5.12-rc2-21-g604bd2d4786e9)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 12 runs, 1 regressions (v5.12-rc2-21-g604bd2d478=
6e9)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/v5.12-=
rc2-21-g604bd2d4786e9/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: v5.12-rc2-21-g604bd2d4786e9
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      604bd2d4786e902a90a56db9427d5563bdf8c529 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/6048b3ea984f3468feaddcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.12-rc2-21-g604=
bd2d4786e9/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-rk3399-gru-kevi=
n.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.12-rc2-21-g604=
bd2d4786e9/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-rk3399-gru-kevi=
n.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0301.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6048b3ea984f3468f=
eaddcb2
        new failure (last pass: v5.12-rc2-14-g6f56f6c26099) =

 =20
