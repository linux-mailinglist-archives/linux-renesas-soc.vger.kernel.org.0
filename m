Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCA3F42A3E1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Oct 2021 14:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235922AbhJLMJh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Oct 2021 08:09:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236300AbhJLMJa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Oct 2021 08:09:30 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D4C8C06161C
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 05:07:29 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id t11so13364954plq.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 05:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=69RWyl+tnaz/SumIMotYFG9nxDwl690/Ae5AAKiaXFM=;
        b=rzzH9RxOUr3AyeOGv6GgTBROuWI1v8p0hnj5DJtiasTpanlffI887LDtNQa3XLmKNq
         WgvSKEwp3D/Z21Tg29PdMxGoV9XzzaAW5NeI/Z211MlPHZDMvDyjcy+XMdXuZn4sdnnu
         lfVPeyjwnr65lqUef0vWY/3y5tY9v7NSJbJygAqpAqAwhm3ReRhblO8uiRn8waF+EIpc
         YIIdspdVhhpKSOFr6BPorzt1EMpUod66pOMHiLs7PwquBMd4N00SthRQ3QanA8SY+MM7
         CwvxERYkl5XvQJUz75C8WjPODer1y+zjsS3cLvsXwM2xy/n/cm1xF95VAMk2/6rHqBH0
         KnRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=69RWyl+tnaz/SumIMotYFG9nxDwl690/Ae5AAKiaXFM=;
        b=U5WCQGEtZSisN84+sfguTwKxQnXyo5lC900PEvSN2E8E5eSubq46uPeH4//q76MhzK
         8e1Ne8xL2v1et8eSST58KZwYSsWCqzAXVBx4ePi9DH45n08BKktDLrpWsDicG3xDxkZV
         k4O6B3Q7/EMflOoFDJsGUDDR3aZr9oA9JGRw85E0O10Lz1KKALquEGiRy5oe0IptI5XU
         PZBruPb17Jb6qXtqjw7ySOXy2Fu3AslK/NjR+oTBnmPtKrIDOQefUsS+g3w3NUuGXjuh
         KQF+vl2W0NpUk65qRkxTa1QypNXf/elOO8l8zHFwWqjC3i4qDdRiRwuBsOpYVHJ3PsJW
         QNbg==
X-Gm-Message-State: AOAM530piUzMRHAWxX0yK2vw+YwyJyfP1AEC8pSvrr61bTig8+OPt1o4
        JseJwQBsgah2Z9caK53YoKvvqwd7QnE20tFJ
X-Google-Smtp-Source: ABdhPJyVyRGVtLZjpTkz4qSxM/CGO11g+c5yaA0ZTFb472saxSKWfruFYAu0+M3d6xPWgUdRHGUaqA==
X-Received: by 2002:a17:90b:1d04:: with SMTP id on4mr5553459pjb.68.1634040448652;
        Tue, 12 Oct 2021 05:07:28 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x10sm11190068pfn.172.2021.10.12.05.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 05:07:28 -0700 (PDT)
Message-ID: <61657a80.1c69fb81.c4371.eefc@mx.google.com>
Date:   Tue, 12 Oct 2021 05:07:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-10-11-v5.15-rc1
Subject: renesas/next igt-gpu-panfrost: 2 runs,
 2 regressions (renesas-next-2021-10-11-v5.15-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next igt-gpu-panfrost: 2 runs, 2 regressions (renesas-next-2021-10-=
11-v5.15-rc1)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-8    | multi_v7_defconfig |=
 1          =

rk3399-gru-kevin  | arm64 | lab-collabora | gcc-8    | defconfig          |=
 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-10-11-v5.15-rc1/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-10-11-v5.15-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      321d106e70eb261bd55bee08d881cbd5468d9d64

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  8d0fb9b3f225183fb3276a0e4ae1f8354a3519e8
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  b232a092b9e1b10a8be13601acaa440903b226bc =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-8    | multi_v7_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/616567f41a3f599bb108fab9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-gpu-panfros=
t-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-gpu-panfros=
t-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20211008.0/armhf/rootfs.cpio.gz =



  * igt-gpu-panfrost.login: https://kernelci.org/test/case/id/616567f41a3f5=
99bb108faba
        failing since 20 days (last pass: renesas-next-2021-08-10-v5.14-rc1=
, first fail: renesas-next-2021-09-20-v5.15-rc1) =

 =



platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3399-gru-kevin  | arm64 | lab-collabora | gcc-8    | defconfig          |=
 1          =


  Details:     https://kernelci.org/test/plan/id/616566447e8824630508fab3

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/igt-gpu-panfrost-rk339=
9-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/igt-gpu-panfrost-rk339=
9-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20211008.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/616566447e8824630508fab6
        failing since 20 days (last pass: v5.15-rc1-39-gcbbd8f16ae1c, first=
 fail: renesas-next-2021-09-20-v5.15-rc1)

    2021-10-12T10:40:54.972194  <6>[   23.538741] Console: switching to col=
our dummy device 80x25
    2021-10-12T10:40:54.978520  <14>[   23.546158] [IGT] panfrost_submit: e=
xecuting
    2021-10-12T10:40:54.984901  IGT-Version: 1.26-gb232a09 (aarch64) (Linux=
: 5.15.0-rc1 aarch64)
    2021-10-12T10:40:54.996895  <14>[   23.561945] [IGT] panfrost_submit: s=
tarting subtest pan-unhandled-pagefault
    2021-10-12T10:40:55.001698  Starting subtest: pan-unhandled-pagefault
    2021-10-12T10:40:55.112251  (panfrost_submit:348) CRITICAL: Test assert=
ion failure function __real_main65, file ../tests/panfrost_submit.c:179:
    2021-10-12T10:40:55.118709  (panfrost_s<14>[   23.682441] [IGT] panfros=
t_submit: exiting, ret=3D98
    2021-10-12T10:40:55.130650  ubmit:348) CRITICAL: Failed assertion: sync=
obj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_NSEC), 0, N=
ULL)
    2021-10-12T10:40:55.132762  Stack trace:
    2021-10-12T10:40:55.137249    #0 ../lib/igt_core.c:1745 __igt_fail_asse=
rt() =

    ... (17 line(s) more)  =

 =20
