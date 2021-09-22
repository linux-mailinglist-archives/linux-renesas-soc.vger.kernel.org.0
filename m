Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3893E413F23
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Sep 2021 03:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbhIVCBL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Sep 2021 22:01:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbhIVCBK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 22:01:10 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D702BC061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Sep 2021 18:59:41 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id m21so961823pgu.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Sep 2021 18:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=KDdygGy1lU3CQVKADxT8peGwMmx5//1aO75HdKOm3ak=;
        b=JI66+IaaiG5XdfHLXTlZYv7J/LDCDqFrm58pH8SlUa6rUY9mMdXkxfYtrL5Y9t45ax
         DO244inT4C3HYNdYGk/GgxmqvussE9F5dh+Cjjrwzr5yjidXPMIm0o64rj0P+Okbu7gv
         vgTSiZGNRqA88NfqFDPlLZauSV090FVgFgfamXbEIUh7Bk4UmAWGFAnidm7Tug9YYO9B
         dS4ClQMdt1ZddgBSw55Rv3HWaKDxrlHG8ssGaC7cz1g8dVpzLxguTBpu27XmhzLrkVci
         fS2SuMJAVUoMPap/VrWSkRXh2ZTaS6dneIayAOI6WyukV1ZqXkfM+W6bHjl3uf5rj6Z7
         EX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=KDdygGy1lU3CQVKADxT8peGwMmx5//1aO75HdKOm3ak=;
        b=vVAkLLdb9l9OShfT8CL08/4URf4swXhpBpVemhdXQ7eo20xpPWW0L8lKoUXx465K79
         DgC/FCTvgPHtfFhrgk0SDACkAJVcsBmGPjJXOdCEvkZrAvmU/tAyrEPI7PPKZLplX6Tt
         iNBPDxmQXhz0/RMZrTWwboanU1iqEV37lh3kVuKO1zG/xb39j0125F364CU8TZKgWKVw
         vqnYYV/SVPNC9/0yu0xxXs5FwoYJoW3/bSPbPW2nQMuheuxJ0GOdA+GKKlt2ZmOhlDDL
         Skc3RyanAlMFTlFUx7J359i2Hxu6ygde+G7TFS20jjifTiSpf+ni2c7S5a/ckUHgesLC
         MMwQ==
X-Gm-Message-State: AOAM533TvoV789uV6UW2jOEkoKdQfcpRdApUcLgZVhjMf+o2FIl5yF58
        ylxC0Bg9HBnNG6NuF913mLEXgxMoRPdUSw4p
X-Google-Smtp-Source: ABdhPJzItlTLa0kweUVjFboH1woBD6bcVNQbEF0pzBfpJ1VRENfCw5afayFp6QCTRG4FS2GI2GGGig==
X-Received: by 2002:a05:6a00:a10:b0:412:448c:89c7 with SMTP id p16-20020a056a000a1000b00412448c89c7mr32897992pfh.83.1632275981000;
        Tue, 21 Sep 2021 18:59:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i5sm3730503pjk.47.2021.09.21.18.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 18:59:40 -0700 (PDT)
Message-ID: <614a8e0c.1c69fb81.43f68.e4e7@mx.google.com>
Date:   Tue, 21 Sep 2021 18:59:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-09-20-v5.15-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next igt-gpu-panfrost: 1 runs,
 1 regressions (renesas-next-2021-09-20-v5.15-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next igt-gpu-panfrost: 1 runs, 1 regressions (renesas-next-2021-09-=
20-v5.15-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-09-20-v5.15-rc1/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-09-20-v5.15-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      41c50f42a51cc8630c6a28e9b26f92d920e91780

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  8d0fb9b3f225183fb3276a0e4ae1f8354a3519e8
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  1084c5eb74fd0daf8c9b8e83e85f5208c396579b =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/614a77c52020df6b3999a2f0

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/igt-gpu-panfrost-rk339=
9-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/igt-gpu-panfrost-rk339=
9-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210913.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/614a77c52020df6b3999a2f3
        new failure (last pass: v5.15-rc1-39-gcbbd8f16ae1c)

    2021-09-22T00:16:22.023008  <8>[   22.819914] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpan-submit-and-close RESULT=3Dpass>
    2021-09-22T00:16:22.055949  <6>[   22.857226] Console: switching to col=
our dummy device 80x25
    2021-09-22T00:16:22.062041  <14>[   22.863933] [IGT] panfrost_submit: e=
xecuting
    2021-09-22T00:16:22.077203  IGT-Version: 1.26-g1084c5e (aarch64) (Linux=
: 5.15.0-rc1 aarch64)<14>[   22.875824] [IGT] panfrost_submit: starting sub=
test pan-unhandled-pagefault
    2021-09-22T00:16:22.078382  =

    2021-09-22T00:16:22.081118  Starting subtest: pan-unhandled-pagefault
    2021-09-22T00:16:22.192293  (panfrost_submit:346) CRITICAL: Test assert=
ion failure function __real_main65, file ../tests/panfrost_submit.c:179:
    2021-09-22T00:16:22.198795  (panfrost_s<14>[   22.996975] [IGT] panfros=
t_submit: exiting, ret=3D98
    2021-09-22T00:16:22.210985  ubmit:346) CRITICAL: Failed assertion: sync=
obj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_NSEC), 0, N=
ULL)
    2021-09-22T00:16:22.212934  Stack trace: =

    ... (18 line(s) more)  =

 =20
