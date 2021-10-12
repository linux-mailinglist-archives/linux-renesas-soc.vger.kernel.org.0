Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8C6742AAD9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Oct 2021 19:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbhJLRf1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Oct 2021 13:35:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbhJLRf0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Oct 2021 13:35:26 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFE7FC061570
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 10:33:24 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id om14so159731pjb.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 10:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=zNZPoEvjurJhtiX4csmGPsRfeyyetZDAZcMglElRVEU=;
        b=cn8arNgvQOhlIttE2rLvmqp6TJJhc2aoU6z39YcbKYOADjPmtWZOlMRgqpStRDgq7B
         b1W+1EGMiBfFjMa1GcryUVHBpzOOMFZ1lJ+DCVbMInkupogHkdLRwHiivLMW/HYwY7Lf
         KmkmnrpX7XKiWuvBSmrd9NdAMZlmuCb+s718CFB/J0/ZdNp5ABXhHKJPDE/r6cEviD1k
         ULsJpgrT6y2XNOpuxhds/uzVr+EH5zVe+HPEfY/EXNmeOL2B74BKkOAr5WO+HUn+o3me
         ptjyCfbCukoRMyGiAKilbi176a8oqtB+8Hm8Ysn+dkae9Y0Cmd2tm2rpHs6rYXEvCGrW
         NVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=zNZPoEvjurJhtiX4csmGPsRfeyyetZDAZcMglElRVEU=;
        b=hyQR3lE9d0sGs/Gx0KEeWM77dJ+9jrFyT73Dt3ap7W+2iZB6rBZD2n3S4OqxBmDXji
         FuLSBAw5QdBx1f4rohA/hlbDkK0I/Kx67UwJJxcLJtmXoqEfWP4TMyLYRoNQhe1kknAv
         pb5FkWnEnYl686DZ2nOOnaBp45Ny9ZUgpXZpJ96Cno/H6b2AnZ8QL25iNXZ8v4irMsFL
         ZIp4GEBkLTUOSTfMwbvZ/c/XEcKslHx1kF24DnHrD6rnNWy2ekbYRbL4cy3jD44z3L8q
         Jm7sZrXd24ztsbPE0L2TWlGyx7r8gYiNAevXccXUGBohkiaSEu3h2aKFBqcciuT2E0qM
         N5sg==
X-Gm-Message-State: AOAM531t/xjYOKE/vBvUdJz1Gw3PuQQ/6zK1sRVQws6kKHbzD4hr7JQK
        RO59t1CQ3gaAR73agXWARfATdTAO5vEwOX/Y
X-Google-Smtp-Source: ABdhPJxZpu6VUvWFm/a7cpTJXo7zJzrwcrEVuBjd8790lrd78B7n9ef/RWYeNwVnDZyGV0HyNGqo4w==
X-Received: by 2002:a17:90a:29a6:: with SMTP id h35mr7624421pjd.188.1634060004279;
        Tue, 12 Oct 2021 10:33:24 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id jz10sm3409246pjb.39.2021.10.12.10.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 10:33:23 -0700 (PDT)
Message-ID: <6165c6e3.1c69fb81.529b2.a375@mx.google.com>
Date:   Tue, 12 Oct 2021 10:33:23 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-10-11-v5.15-rc5
Subject: renesas/master igt-gpu-panfrost: 1 runs,
 1 regressions (renesas-devel-2021-10-11-v5.15-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-gpu-panfrost: 1 runs, 1 regressions (renesas-devel-2021-=
10-11-v5.15-rc5)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-10-11-v5.15-rc5/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-10-11-v5.15-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6e602e69ec04a3e0887e4fd9189250b4e7ee7e23

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  8d0fb9b3f225183fb3276a0e4ae1f8354a3519e8
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  b232a092b9e1b10a8be13601acaa440903b226bc =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/6165addc6b758899ee08fab5

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-gpu-panf=
rost-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-gpu-panf=
rost-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20211008.0/armhf/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/6165addc6b758899ee08fab8
        failing since 3 days (last pass: renesas-devel-2021-10-04-v5.15-rc4=
, first fail: renesas-devel-2021-10-08-v5.15-rc4)

    2021-10-12T15:46:29.811955  <6>[   14.362709] Console: switching to col=
our dummy device 80x30
    2021-10-12T15:46:29.812473  <14>[   14.369354] [IGT] panfrost_submit: e=
xecuting
    2021-10-12T15:46:29.824740  IGT-Version: 1.26-gb232a09 (arm) (Linux: 5.=
15.0-rc5 armv7l)
    2021-10-12T15:46:29.830543  <14>[   14.376288] [IGT] panfrost_submit: s=
tarting subtest pan-unhandled-pagefault
    2021-10-12T15:46:29.831060  Starting subtest: pan-unhandled-pagefault
    2021-10-12T15:46:29.943251  (panfrost_submit:289) CRITICAL: Test assert=
ion failure function __real_main65, file ../tests/panfrost_submit.c:179:
    2021-10-12T15:46:29.955753  (panfrost_submit:289) CRITICAL: Failed asse=
rtion: syncobj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_=
NSEC), 0, NULL)
    2021-10-12T15:46:29.970628  Stack trace:
    2021-10-12T15:46:29.971135    #0 ../lib/igt_core.c:1745 __igt_fail_asse=
rt()
    2021-10-12T15:46:29.971579  <14>[   14.525553] [IGT] panfrost_submit: e=
xiting, ret=3D98 =

    ... (12 line(s) more)  =

 =20
