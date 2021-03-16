Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D46A133D63A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Mar 2021 15:56:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbhCPO4B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Mar 2021 10:56:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237578AbhCPOze (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Mar 2021 10:55:34 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9A89C061763
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Mar 2021 07:55:33 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id x29so22758936pgk.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Mar 2021 07:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=fqRAV5nSAbex8C1/p0csOysrYDkR/ku/OxQYk5iEzSk=;
        b=QyeoQ0Lve8+nCTzqxX9hjKQ3O1RJi1vqw50f5Q+x0OuwVe6HVqkHMaL9S3sHUzWSHo
         aOqJf/+Y5Q0H6pWSAwdx7JR/WpYhxFU6hHgjrRD/KUJNlPONcpnKPg+aPkxAdxE/nAXl
         N4l24saQT1sW8a+n++j/4ElQihkBWqsDXzZ0ktHNDML50BSSKrn405VOeP2rHbVoi0Fo
         YDvVs61lEIDlFxWXhSBkxtEUhIzSu+H9AiVTRVfcNW3y3VVVSEAZzR/FI1Ug6RlSNesP
         ZAqb1TMkqoUWlQaK8wKjtwnd2pItwZKigx95prf/ns348lBb1m2C0fZovD9Rk+285Igl
         B9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=fqRAV5nSAbex8C1/p0csOysrYDkR/ku/OxQYk5iEzSk=;
        b=lnu3sc7YgExMAzwxCccQRUIOiEm+08jEUDhafNajMtifC9RmfWPbDZkxI/NhyAzS02
         zPVD++iuMglc/uDPxlycF2LJWr8M2j/4rvHJa0aKPOUxBpNXyIYejtz7LN7BW0Vx9i7l
         OWRko8kijs+YL1KI9XNpztLnz+3PDdvM/UY+cKS3QcG2/qxZsQNjDWEhCwIi/90rgcKN
         piROnrAzq5wHthzHm6Rp7Q27rHJPfuUVayY3BMSG5xuYlcZp32oowpFiMcs3kCBomR5x
         PxuJ/cRbFrIvpYMLhxNvqxHzTwoCu5Rr3FyjmWUo+6kJ7DyCja/ZgLViixUAFCn1az73
         QXig==
X-Gm-Message-State: AOAM532CpIMzFrJgTxMi4z7ZI28ipr0PVfF/Y0pyu49IxLB6gqZIavT/
        slpomnRNOGwu4lAc18qD4LgCkJ1YVteMwg==
X-Google-Smtp-Source: ABdhPJwPIKLHIu/0rVu89BHo2ZvtiqW3LS+ykAZNW50zq1gIlb93pkxHTu053I7DidId3kJ2qK5ehA==
X-Received: by 2002:a05:6a00:78c:b029:1f5:d587:1701 with SMTP id g12-20020a056a00078cb02901f5d5871701mr15369095pfu.59.1615906533227;
        Tue, 16 Mar 2021 07:55:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id gw20sm3114432pjb.3.2021.03.16.07.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 07:55:32 -0700 (PDT)
Message-ID: <6050c6e4.1c69fb81.f10bc.7a6a@mx.google.com>
Date:   Tue, 16 Mar 2021 07:55:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-03-16-v5.12-rc2
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next baseline-nfs: 20 runs,
 1 regressions (renesas-next-2021-03-16-v5.12-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 20 runs, 1 regressions (renesas-next-2021-03-16-=
v5.12-rc2)

Regressions Summary
-------------------

platform   | arch | lab           | compiler | defconfig          | regress=
ions
-----------+------+---------------+----------+--------------------+--------=
----
odroid-xu3 | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-03-16-v5.12-rc2/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-03-16-v5.12-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ca7b445e2e7b0cd757c5c29249f37baf9ca71747 =



Test Regressions
---------------- =



platform   | arch | lab           | compiler | defconfig          | regress=
ions
-----------+------+---------------+----------+--------------------+--------=
----
odroid-xu3 | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/6050a2723d8f8a1737addcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-16-v5.12-rc2/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs-od=
roid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-16-v5.12-rc2/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs-od=
roid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0315.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6050a2723d8f8a173=
7addcb2
        new failure (last pass: v5.12-rc2-21-g604bd2d4786e9) =

 =20
