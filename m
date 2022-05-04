Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11D41519314
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 May 2022 02:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244823AbiEDBDN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 May 2022 21:03:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243418AbiEDBDM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 May 2022 21:03:12 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DDE141610
        for <linux-renesas-soc@vger.kernel.org>; Tue,  3 May 2022 17:59:38 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id i1so81548plg.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 May 2022 17:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=DUnnNISreG/FSg8d8J0Aa+eok5CLO9DCmufTX82hvfU=;
        b=UzWutBPXB/VZefdOwSV+EmfMZ4vQznoTGUzlqd/qNJAs4X+LjBq/TZxGTZ/Bj6BUhw
         E+e2Jed24voS0/cz0Z1vNd9ShyiNFgDU/eS5iV5H7Srm/NI9S13YUyftVpNPs+XVsXYt
         dLpfF7YZU+MLDVrwaTWIlaYOrgIIT+bHu1d74cwT0sruRrfAvDl1XSgZzrOS4dlwWwoL
         vYSKy0WloS7SpH8xpr1ZbGr3CXyPZTaymC9pXLGP3e5LwbHGyk2jnupM+t4iwthLz5gK
         qyHW9Guwblc+hrE4WwG9QSGk9yGZ1eLm/SvUPofpAn99hq5qWhkhmlfpCJxw1a6dAHQX
         XV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=DUnnNISreG/FSg8d8J0Aa+eok5CLO9DCmufTX82hvfU=;
        b=cb99j8U/48UIFoGZWg8LffyKBSQgYhTxpQzDAQIwENqEKmyxEMSDoT97nTEJy1tc9S
         ROnYXxb05GEc7/kwAZZGKjs7YodyG2CtLyJ11R5Lomn6HrQGdtJZaL6NMCGgc+ogDnB1
         5+Te4IPHcjTNUgxFD35Nx3PFjalP9lYSGA5aNXZKAcLBaD3OapEY6PA2A9sUWyALRIrq
         2dXppXb4VzEzLZFBBBNkZ4HXoiWEDaoK37GVIlxyKoPrlDqVIxTyMWGRPVTknL0wkc8B
         VJ1kOyPcejdZ3DWEUZtcrREqtkmwerMavq0JXF5d9/ZhTyPBjb7aGYBHHXxIG/K76N1d
         z31w==
X-Gm-Message-State: AOAM530/5gzaFgO5ulk1EcqsccLwufgJli2VgcHlqmekVouHB4hsLgkn
        k/rbaENsoJVEtmmI02lX0iksz1qByc5PUg8NkSw=
X-Google-Smtp-Source: ABdhPJzz9sMB7HypsLlDkO+ybGLrXY6BjA59VDLj0XjoREu4HJK3fl9duUpbuK99praOx1oXrippew==
X-Received: by 2002:a17:90b:502:b0:1d9:a907:d845 with SMTP id r2-20020a17090b050200b001d9a907d845mr7761174pjz.162.1651625977728;
        Tue, 03 May 2022 17:59:37 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y1-20020a1709027c8100b0015e8d4eb29bsm6967071pll.229.2022.05.03.17.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 17:59:37 -0700 (PDT)
Message-ID: <6271cff9.1c69fb81.31a8a.162b@mx.google.com>
Date:   Tue, 03 May 2022 17:59:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2022-05-03-v5.18-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next igt-gpu-panfrost: 1 runs,
 1 regressions (renesas-next-2022-05-03-v5.18-rc1)
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

renesas/next igt-gpu-panfrost: 1 runs, 1 regressions (renesas-next-2022-05-=
03-v5.18-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-05-03-v5.18-rc1/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-05-03-v5.18-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      513cc648e77c3a2a859bc8d69421ac231c72bbf4

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  d95b12e7e3ed6a22f284afbc5d2356365b820ea8
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  e663c55f013489e6dcbb7581bf3769b37375123a =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6271bcd80e74b7df8ddc7b4f

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-05-03-v5.18-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-=
gpu-panfrost-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-05-03-v5.18-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-=
gpu-panfrost-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220428.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/6271bcd80e74b7df8ddc7b52
        new failure (last pass: renesas-next-2022-04-25-v5.18-rc1)

    2022-05-03T23:37:49.684175  <8>[   22.913396] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpan-submit-and-close RESULT=3Dpass>
    2022-05-03T23:37:49.715680  <6>[   22.947619] Console: switching to col=
our dummy device 80x25
    2022-05-03T23:37:49.720012  <14>[   22.954341] [IGT] panfrost_submit: e=
xecuting
    2022-05-03T23:37:49.727557  IGT-Version: 1.26-ge663c55 (aarch64) (Linux=
: 5.18.0-rc1 aarch64)
    2022-05-03T23:37:49.736349  <14>[   22.967395] [IGT] panfrost_submit: s=
tarting subtest pan-unhandled-pagefault
    2022-05-03T23:37:49.740621  Starting subtest: pan-unhandled-pagefault
    2022-05-03T23:37:49.856385  (panfrost_submit:345) CRITICAL: Test assert=
ion failure function __igt_unique____real_main65, file ../tests/panfrost_su=
bmit.c:178<14>[   23.086429] [IGT] panfrost_submit: exiting, ret=3D98
    2022-05-03T23:37:49.857328  :
    2022-05-03T23:37:49.871070  (panfrost_submit:345) CRITICAL: Failed asse=
rtion: syncobj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_=
NSEC), 0, NULL)
    2022-05-03T23:37:49.871707  Stack trace: =

    ... (81 line(s) more)  =

 =20
