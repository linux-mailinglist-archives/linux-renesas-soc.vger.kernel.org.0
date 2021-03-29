Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B778A34D95B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Mar 2021 23:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230362AbhC2U70 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Mar 2021 16:59:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbhC2U7T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Mar 2021 16:59:19 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5D56C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Mar 2021 13:59:19 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id k8so1047038pgf.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Mar 2021 13:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=UOTSvs6Y/M2RCC5q3gx90aUO295bazC+gijpfwrOASw=;
        b=XwKdWs2CZVf6ePy+jlMgtw71I/qbrpPcVQSbgYnISZ7V/Rn+x5YmkKHNGIWJTXw4F5
         cJe+lU3oiTHWA0pXBM+3uZxVFNEYysgBbRYDUWukT+C7agk/MUAxblEy4WkLmvCqI/mQ
         zAthtluCcB6Ljs5SPTqhUL6fKggun+ZY8nL6CbgN+RyHM3rf8nCbS7FqfRoFgZsyswGc
         B1PwqzE2y/p148JC61J3uujG6OdOe8w5uDfQ9q64zlKkY7u1SHiq9parwocjIUOCxewB
         iojuyRjt/fN9/l6j1Qrb5qnqhXDbpZQyuaapRLGtz5fHzvpVZRuvFpgdWmieKUd++vwi
         LPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=UOTSvs6Y/M2RCC5q3gx90aUO295bazC+gijpfwrOASw=;
        b=UXWVsbxqPo/VMkcho6TZ77ldQ479FUnIrRZc5Kw+Fff/N7mbHNUxbWxUjRbGvdqygp
         o5Fs35kMlkJgDA4ZOkpriojPJWEd8gAJ/QF2XJrtEhhmkb95IuHNAn5GV2XFJBEUy3sv
         41BPA6+5bGcsWh+9ts51FyuGmzrwttBeMMTvPNPM/QzpA1J2Iir56SCc57zHGTpUpvqz
         9/JaW8RSSZbP6cqB5pk9TcTAOMoC4Sd0pu18vDMsLboj/fFiUwoHnZHCCuet9Z4hImiQ
         semaOefotgkH7ou3OlYe3rzT2xyhdbOt+c7CHkGRdu63XMjQU+UXbHD6S9yeIAVcX1y0
         DrUQ==
X-Gm-Message-State: AOAM5329pYpAvx02aBXntdflZfsmv4CrmWYkILxyYYIu7s0ubBopJTlO
        4QBQktK6k3nSb3eIcUNOtZUaO083yVLlEw==
X-Google-Smtp-Source: ABdhPJz+kIyGTCaEtlTP28aZuamG9XgkMPrvW0r8kCP3jueO7+uZfU1pRgDMeD+LxiNruhsSSNg2Aw==
X-Received: by 2002:a63:5a4f:: with SMTP id k15mr25636789pgm.246.1617051558817;
        Mon, 29 Mar 2021 13:59:18 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ds3sm447097pjb.23.2021.03.29.13.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 13:59:18 -0700 (PDT)
Message-ID: <60623fa6.1c69fb81.9d704.10ea@mx.google.com>
Date:   Mon, 29 Mar 2021 13:59:18 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-03-29-v5.12-rc5
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline-nfs: 17 runs,
 1 regressions (renesas-devel-2021-03-29-v5.12-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 17 runs, 1 regressions (renesas-devel-2021-03-=
29-v5.12-rc5)

Regressions Summary
-------------------

platform                  | arch | lab          | compiler | defconfig     =
     | regressions
--------------------------+------+--------------+----------+---------------=
-----+------------
sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre | gcc-8    | multi_v7_defco=
nfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-03-29-v5.12-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-03-29-v5.12-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      bb48e88392ae845729086cf17d765fd2a3a60f2a =



Test Regressions
---------------- =



platform                  | arch | lab          | compiler | defconfig     =
     | regressions
--------------------------+------+--------------+----------+---------------=
-----+------------
sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre | gcc-8    | multi_v7_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/606211befb287beca5af02e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-29-v5.12-rc5/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-=
sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-29-v5.12-rc5/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-=
sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0315.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/606211befb287beca=
5af02e4
        failing since 7 days (last pass: renesas-devel-2021-02-15-v5.11, fi=
rst fail: renesas-devel-2021-03-22-v5.12-rc4) =

 =20
