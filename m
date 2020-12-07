Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2317A2D13F4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Dec 2020 15:47:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgLGOqb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Dec 2020 09:46:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbgLGOqb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Dec 2020 09:46:31 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1868FC0613D0
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Dec 2020 06:45:51 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id f9so9590837pfc.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Dec 2020 06:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ZqZunlqmnFaGiOUiM/tlMDM87hkGFMXE8fqLh/nI+Yw=;
        b=le/a6SZCGJ3O6fel4ZMfJmvm2he13USrs/VuP5cZ69RsanFqcB8kICwCUE52ubt7Os
         1yW/p9ysBvIJk8l8heOjF7wqc0RzW8gqkN9nNzxEnwkT1s5+KtEveE60h+kbLk4pP0Cq
         wcNYsEQZN0TeCy2u+WBQ+4289VlyoBvLRT+PyV6NkXEb85fa/MMmTWAuHTypYjJCLB9n
         nVXnQlv8vuHn+C0PgRFB1fQBvp8UNoy7RUhCj0bx0sq30wqKnxOumhPLD4EHlml5aKY0
         T2mwysQD86DQjaErvGfRP0GUqDIMiiDowY5+SSP4o89wBHfgj/gzN+V0vPM2tebm/w/x
         grSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ZqZunlqmnFaGiOUiM/tlMDM87hkGFMXE8fqLh/nI+Yw=;
        b=TfLjFBl2w3IUyTnv7cs6gyzXfq0XZn9KERZsVCtJ+2x9IjdklsDcYPqeddTrH2Th8U
         PF03EFPQEI9JuBVpj8exOJJdt6KyY26PjrNahQFusHJuFqoVwK1ZVILWs74RG2eom0aK
         zS+TYu5dtda6lxipuZV9hiASMwVX4wWZxjcn5jhFsG3hxIgyq2cOX8dfBIVc+YjD98+b
         7ALVCAOALwAZClRbr4Hteiq6l3RPZJ8DoHh3s+RUJW0CiCv/bE+Ou6r4MCmcq3ily6GC
         CTJDD8EOVb1rGxIH2Hcv7neeU9Gh1IYBu1pI+QC+H8u2sOYFADGyWBCbs/x7Tg92lQJD
         iQPw==
X-Gm-Message-State: AOAM532y75rDL7xFDBXbHgts4BHgdbhKIHTvdSmMIgPvwwWcnLVXuWho
        LcJrG9gfxK9kQ+/bGzbVfIUld46jraNbPw==
X-Google-Smtp-Source: ABdhPJwjdK2Ctf0zKaRP4nCASzMLApWBcf6KG3brlrJ2cJMjTSSn4gDgbe+NWvsX4yUugUn0EEY6WQ==
X-Received: by 2002:a62:7c0a:0:b029:19e:3d57:ab8b with SMTP id x10-20020a627c0a0000b029019e3d57ab8bmr1076097pfc.31.1607352350230;
        Mon, 07 Dec 2020 06:45:50 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z25sm12337401pge.66.2020.12.07.06.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 06:45:49 -0800 (PST)
Message-ID: <5fce401d.1c69fb81.7eb3b.b2ca@mx.google.com>
Date:   Mon, 07 Dec 2020 06:45:49 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2020-12-07-v5.10-rc7
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 30 runs,
 2 regressions (renesas-devel-2020-12-07-v5.10-rc7)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 30 runs, 2 regressions (renesas-devel-2020-12-=
07-v5.10-rc7)

Regressions Summary
-------------------

platform                  | arch | lab           | compiler | defconfig    =
      | regressions
--------------------------+------+---------------+----------+--------------=
------+------------
odroid-xu3                | arm  | lab-collabora | gcc-8    | multi_v7_defc=
onfig | 1          =

sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre  | gcc-8    | sunxi_defconf=
ig    | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2020-12-07-v5.10-rc7/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2020-12-07-v5.10-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2de1408b9f24558d68c4f09341fb124b7d12f78b =



Test Regressions
---------------- =



platform                  | arch | lab           | compiler | defconfig    =
      | regressions
--------------------------+------+---------------+----------+--------------=
------+------------
odroid-xu3                | arm  | lab-collabora | gcc-8    | multi_v7_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/5fce11df7e4737ef2ac94cda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-07-v5.10-rc7/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs=
-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-07-v5.10-rc7/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs=
-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2020=
1130.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/5fce11df7e4737ef2=
ac94cdb
        failing since 6 days (last pass: renesas-devel-2020-11-27-v5.10-rc5=
, first fail: renesas-devel-2020-11-30-v5.10-rc6) =

 =



platform                  | arch | lab           | compiler | defconfig    =
      | regressions
--------------------------+------+---------------+----------+--------------=
------+------------
sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre  | gcc-8    | sunxi_defconf=
ig    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fce12156696631edcc94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-07-v5.10-rc7/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-07-v5.10-rc7/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2020=
1130.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/5fce12156696631ed=
cc94cba
        failing since 19 days (last pass: renesas-devel-2020-11-09-v5.10-rc=
3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =20
