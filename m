Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 471F945994E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Nov 2021 01:47:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbhKWAuG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Nov 2021 19:50:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbhKWAuE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Nov 2021 19:50:04 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53C31C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Nov 2021 16:46:57 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id p18-20020a17090ad31200b001a78bb52876so659943pju.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Nov 2021 16:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=bNtok5PylMPNa4bdsOkWr+q07uSM4OaLr9HPYP7G/eM=;
        b=z+SpH154ylcKEBQWOGPRNntxPS007NZYdncbHeuyVRqayggukktZtqxFrMtLe+GFla
         RJ30PvU6+HFcYJ529O21BnoS2WnAvYaqD23PmWERsZ3yhbwyDjrAP0IaJjm8ICGJWlyQ
         iaqXJweAnv3Wp5yPx5hLTMt7/jfCmaYJ2T/gNNaqNTBMnrmDbQRCl9XEP8R6q3bNFw/w
         n845aZX/tTKC4NK5W8iHpkhCMlm+oGtrUg2/dTQGYSQT7Zxm3iRX1PiqNXszzmLbUej8
         +SB5raDv2EHyQNdXHchLCJFkcf3SSl8Xx6MtikCW8Vn8o3gKYwambYLSemMQohxp3fTS
         AGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=bNtok5PylMPNa4bdsOkWr+q07uSM4OaLr9HPYP7G/eM=;
        b=hQioF4PBFfueoHCc8DjTO+am6qqwOgXZXZe3pI/UjG4hAkaZH0vugn6x4Z6PjsiFGC
         /oP33jGbeZwhBj1dQwTTqUIiJ8S5odt1BBrebG0TceJvo0QS4larAySSPL15K6+tuzzQ
         CNxGGzlvpu5EJ/modHsLy5wKiExs6GhTHDi/SYS35uublejWxspHHmIYdC1FW/DGchjl
         YArReRerNHkJcYvnkdeOG6AGuHXV2dFR73c9kb185ZjF4PV/8N2e2kfVeuaFqb4U1kOT
         VqahUm9kbUsh/s7uUNirOXTWqyqoe38WyyLswuEiep8QRQWgo4TuCIrxwj6L4qHgrMMZ
         vErQ==
X-Gm-Message-State: AOAM533JYf/Ze1NcByTM/4HTjc3dJXGPMvB8QHxP8gTmgZdA3fCCC8pF
        K99i1u+o4W42TP9ZQXB6n5GWDEP2XcNimx73
X-Google-Smtp-Source: ABdhPJwTjdV6Cjka4YhZY1ZXKUO8AqNoGYsP9CzHFPqF7cJpZN46HfPbUdu7NvbRNAe1rjIXV6C40w==
X-Received: by 2002:a17:90a:eb03:: with SMTP id j3mr1349074pjz.149.1637628416749;
        Mon, 22 Nov 2021 16:46:56 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a12sm19140664pjq.16.2021.11.22.16.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 16:46:56 -0800 (PST)
Message-ID: <619c3a00.1c69fb81.2c53b.9689@mx.google.com>
Date:   Mon, 22 Nov 2021 16:46:56 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-11-22-v5.16-rc2
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 400 runs,
 1 regressions (renesas-devel-2021-11-22-v5.16-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 400 runs, 1 regressions (renesas-devel-2021-11-22-=
v5.16-rc2)

Regressions Summary
-------------------

platform             | arch  | lab          | compiler | defconfig     | re=
gressions
---------------------+-------+--------------+----------+---------------+---=
---------
meson-gxl-s905d-p230 | arm64 | lab-baylibre | gcc-10   | defconfig+ima | 1 =
         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-11-22-v5.16-rc2/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-11-22-v5.16-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      76e8eb89ce81234e80daca68c8ea9523696bf0d5 =



Test Regressions
---------------- =



platform             | arch  | lab          | compiler | defconfig     | re=
gressions
---------------------+-------+--------------+----------+---------------+---=
---------
meson-gxl-s905d-p230 | arm64 | lab-baylibre | gcc-10   | defconfig+ima | 1 =
         =


  Details:     https://kernelci.org/test/plan/id/619c17219c5a114c12f2f01a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-22-v5.16-rc2/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-=
gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-22-v5.16-rc2/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-=
gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619c17219c5a114c12f2f=
01b
        new failure (last pass: renesas-devel-2021-11-19-v5.16-rc1) =

 =20
