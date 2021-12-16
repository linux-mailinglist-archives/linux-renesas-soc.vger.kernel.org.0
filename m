Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9C8477A57
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Dec 2021 18:17:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239913AbhLPRRH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 12:17:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233283AbhLPRRH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 12:17:07 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E666C061574
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Dec 2021 09:17:07 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id y8so19973936plg.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Dec 2021 09:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=azZBQBPE6C02RA0P7GywOJVxQ1FdRDp0rTH9pTFQy+g=;
        b=H2sv8XQBZmmsxx06JL7s8eqDKeZgZXU1PQm5xgrNkEEXpnOsFUwvYaDqdfmoKIRIf2
         8wpSO5uIwJ35TKZtNFbIalZQW7cLJSJGVkAJP5Q+GHr/H/qS2p/qzKJe6fimfTEM/Hvg
         3bcJzlV4cSc1jxgDBR/jeKeNWXGDgXd6n0sbvTm5KIUNhT+jIwCcpBcHPZvccPvwHkwt
         rUEwloZgy04Sazrw2ydVXxF6egr3i6JFHMW5mnMZ3ViMFc32tLRA/O4fREDGX5UUBD5I
         Z7FzX6o6MHaJrTOIz9WpInRHcCj9VzrTn0fHidObG7KvZE0XoA3ddzRJ4SGoEruLCBvh
         LaHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=azZBQBPE6C02RA0P7GywOJVxQ1FdRDp0rTH9pTFQy+g=;
        b=eVFNZPmY+GFGW5bk+VDMsTKgU/4mFaAKVGIryR5Jqyu6kYWQj5ozRliQzRFQsPlItY
         BHDEkO4rTO0455k5k+jBZA2WXYkf3Sc8aKmlOtCygJEMSDDYSmF0eNsPD9M5nDHr1GZK
         pi2PEg4YNaN6P1Nt+GZ4JdHwZvwgxJmXkZHXjHOoBOzRgWRQnNnk7FnOAxh8er2q0TOp
         G/qovl5EpmDv42dRvms/C6MifpXkjD7Nm8i0hu6qor88OZHl6gB5CCmaoJ/682CxpGpN
         1xmFFv64PNXJm+geZnnLItAmSWaNf9dN/84G9pVWfXKj4iv5zFS1Wsa/qLsDqxcwDjZa
         lBSw==
X-Gm-Message-State: AOAM533e3KAO2NqHYyOzRWGRl8z690fXGUDXUFIHEDv3eBmmTaXL3mI+
        LxQKA1UIDPqfKFM3FUmwg+SC3NRxcM7vx1Ik
X-Google-Smtp-Source: ABdhPJwwzkgGzJ3IPzaHtPTQmuOULcEpKRqHAZLUtn6cXWSF495By+rp0ajNmXMGKmGNGeIFcIQQGQ==
X-Received: by 2002:a17:902:c40f:b0:148:a668:3506 with SMTP id k15-20020a170902c40f00b00148a6683506mr9370921plk.108.1639675026451;
        Thu, 16 Dec 2021 09:17:06 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p16sm7630550pfh.97.2021.12.16.09.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 09:17:06 -0800 (PST)
Message-ID: <61bb7492.1c69fb81.efb96.3e81@mx.google.com>
Date:   Thu, 16 Dec 2021 09:17:06 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-12-16-v5.16-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next igt-gpu-panfrost: 1 runs,
 1 regressions (renesas-next-2021-12-16-v5.16-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next igt-gpu-panfrost: 1 runs, 1 regressions (renesas-next-2021-12-=
16-v5.16-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-12-16-v5.16-rc1/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-12-16-v5.16-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a155038f641134b0272d26f75d1ab4a805013e48

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  8d0fb9b3f225183fb3276a0e4ae1f8354a3519e8
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  136258e86a093fdb50a7a341de1c09ac9a076fea =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/61bb6312144a824af339711f

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-12-16-v5.16-rc1/arm64/defconfig/gcc-10/lab-collabora/igt-gpu-panfrost-rk33=
99-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-12-16-v5.16-rc1/arm64/defconfig/gcc-10/lab-collabora/igt-gpu-panfrost-rk33=
99-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20211210.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/61bb6312144a824af3397122
        new failure (last pass: renesas-next-2021-11-30-v5.16-rc1-14-g09403=
00f8e1d)

    2021-12-16T15:53:44.148266  <6>[   23.992633] Console: switching to col=
our dummy device 80x25
    2021-12-16T15:53:44.153912  <14>[   23.999864] [IGT] panfrost_submit: e=
xecuting
    2021-12-16T15:53:44.160975  IGT-Version: 1.26-g136258e (aarch64) (Linux=
: 5.16.0-rc1 aarch64)
    2021-12-16T15:53:44.172608  <14>[   24.015298] [IGT] panfrost_submit: s=
tarting subtest pan-unhandled-pagefault
    2021-12-16T15:53:44.176877  Starting subtest: pan-unhandled-pagefault
    2021-12-16T15:53:44.293309  (panfrost_submit:338) CRITICAL: Test assert=
ion failure function __igt_unique____real_main65, file ../tests/panfrost_su=
bmit.c:178<14>[   24.135116] [IGT] panfrost_submit: exiting, ret=3D98
    2021-12-16T15:53:44.293888  :
    2021-12-16T15:53:44.307048  (panfrost_submit:338) CRITICAL: Failed asse=
rtion: syncobj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_=
NSEC), 0, NULL)
    2021-12-16T15:53:44.308494  Stack trace:
    2021-12-16T15:53:44.313424    #0 ../lib/igt_core.c:1745 __igt_fail_asse=
rt() =

    ... (15 line(s) more)  =

 =20
