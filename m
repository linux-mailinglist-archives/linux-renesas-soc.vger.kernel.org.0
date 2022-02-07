Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43FAD4AC9E0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Feb 2022 20:49:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233259AbiBGTsq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Feb 2022 14:48:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240978AbiBGTpX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Feb 2022 14:45:23 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BF54C0401E0
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Feb 2022 11:45:23 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id e6so14788575pfc.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Feb 2022 11:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Z3BrbGZGyHjORclQD58wYdxyc/B7BnI8j24cXiKHoCE=;
        b=7IurOpNN7PLQXZ+EFcZlrrROQ8gqxFzsb9o9LL/YzePlzQvgrEjI+TYBwlMT/CmUqP
         gXhGm1lwVbxpKeiXOSeikCqVrWLPVoq20v6q0tsadvRxvE/VSBNwDdOPYpheTzAsMRbL
         wQfXviuWq4/lOxrb7p6YorjIllWTmlgFPvtJzbZhBE8WSW1j0p5blx+SpJpKCJ9W6Y/w
         kBkehDuZCjzvt155cXvfEiCTtgCydjRanVBeHd245A7a6yOZ7KpFTmBGBjco2OCPqXbp
         ZkAXJ4h74+mqWKRA8pQ3VHRkPSdb5FC1yTIaKQNQZ4IbmYfeQ/XpZUy6nkJQv7FnPn5N
         Ypmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Z3BrbGZGyHjORclQD58wYdxyc/B7BnI8j24cXiKHoCE=;
        b=EGfeaqmvDGd3gq1bhBYhOibm6yaHmSiiMv5J9HAvzBwGvNnZ0g6GbfVtN88EhhJXO5
         QMIhRymOb84O0m3epNy8Dw+HNldXD8kujq+JeOKXv4h+0/M09nGazj+dLwHTtsRoyRXa
         QDx/SoMMjqdWWjGQsoQeUiUsCHpH4CR8IspQKv3kXgLWlXVkIpdMja6i41zbxq/ioCDX
         F0fKN5jOMjA74VIB7Cm+ekM1iXqJXBBFnTZtrSBTEXhrGBCOO8zjUMgnvRgcT3hMr4sV
         gKXwRsBkeOAAuRWJgNjeOPeBny8yQ84M9VfHhS82RIgaFPMPLSM9R6SnC8lRyWtQe5Ga
         o6Yg==
X-Gm-Message-State: AOAM531Mq9fwcvP6IoL2hV74nm6u2pv222H3eYxVnpuaMVgKZ6Q5I3G+
        7d/3xtLVJVBws0/mox6QrRWCEgEn3z7s2dpf
X-Google-Smtp-Source: ABdhPJyuKAVV52WCHjgGxKCZJx0UtTmCCbOXVQpxyQv/MqjYlcpXVHUsAAQzpFVrU5zfQVPCvb/VxQ==
X-Received: by 2002:a63:8bc2:: with SMTP id j185mr775113pge.198.1644263122696;
        Mon, 07 Feb 2022 11:45:22 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c11sm8648238pgl.92.2022.02.07.11.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 11:45:22 -0800 (PST)
Message-ID: <620176d2.1c69fb81.92853.6281@mx.google.com>
Date:   Mon, 07 Feb 2022 11:45:22 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2022-02-07-v5.17-rc3
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
Subject: renesas/master baseline-nfs: 45 runs,
 1 regressions (renesas-devel-2022-02-07-v5.17-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 45 runs, 1 regressions (renesas-devel-2022-02-=
07-v5.17-rc3)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-02-07-v5.17-rc3/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-02-07-v5.17-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      1473d361292c53a189d07c296105887e45695417 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/620142ca96b1a0d1395d6ef6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-07-v5.17-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-nfs-meson=
-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-07-v5.17-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-nfs-meson=
-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220128.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/620142ca96b1a0d13=
95d6ef7
        new failure (last pass: renesas-devel-2022-02-02-v5.17-rc2) =

 =20
