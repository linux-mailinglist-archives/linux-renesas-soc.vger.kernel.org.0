Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71A004AC73C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Feb 2022 18:25:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234680AbiBGRYp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Feb 2022 12:24:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382875AbiBGRPY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Feb 2022 12:15:24 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB9EC0401DA
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Feb 2022 09:15:23 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id d9-20020a17090a498900b001b8bb1d00e7so3580302pjh.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Feb 2022 09:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=1sK+Q5l9KUclAUkvKVogoLmCTImSR/txcifvFD2DKV4=;
        b=e7XcFx+PKXs1NKTS7Rz9RI4E1w0q8w33eY391JLHHwOSSjgAAok1B4jpLswgdGSW+G
         v5UFxZSH0AslMCVygOSeXC8YmzbDCPNzaaxhMwohF9eGydSZogIS+w4YwD0qnavCTpX2
         bAHieMBx54r2iQ3HT3dlMMj5JYLLs43TwnM6JjR4fnWpSDUXB9ygyQVUQTV+EprCaumk
         v+6H+TE/gIzNWrG5+659Yit1oYblwik6hvf7Xv811/zv9vM/f47Fo5gddmdNf38RVdAQ
         MVf9u+EWGzL9LDz/Uz7aqLtt31RJXvIkNYaZEtUYHAvbtQODOuTMSxcBiWVJ1cpiRFkF
         8UkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=1sK+Q5l9KUclAUkvKVogoLmCTImSR/txcifvFD2DKV4=;
        b=rIWMtysb/XxF2IQF4Aj2X3Kffv4XKEBcBIdedAhX3wIDn1yHTIu5kKhsQA/znbkr7O
         LttoETNW/l3BtbDWvTuCwYUy56lcHyDcgaPYB7JsZ2ZLtx6GzQMyoI4YTlOWaqI7BTEX
         vZo8IJmn3Eveqph4cZTqhBwk4IBrvCAS+zPiXX5FKyJ1JebAbPQN67G9ym7vExvkIc5i
         SFx98GS6OGKBWn5hJTcNCXS3BevrEL5JUtEMYD0hWLO3TigQc3BTVzEpgCfc5dD887ZJ
         TFkM1/QK3IsAHORLuXYLYRToS3JpE65xBTezxI++7SxL+vE1A0Th/wo5/bWIZm3a7BdC
         f5Rg==
X-Gm-Message-State: AOAM530rIPT4q+kRtKdbmxHqGJJNEz7GvofDyOkN8zXWR/TePAwqWFSp
        9OzjxDnfpwEcKLIx+JV4oRmUGkUd5gnS9EoS
X-Google-Smtp-Source: ABdhPJxzXeenOUyVi/wqEWHy5S7ZpWSNcj+egLMaEsBUEMXwFN+tYcpECKrU8jTqBc7non7gjwEESA==
X-Received: by 2002:a17:90b:4ad2:: with SMTP id mh18mr19694500pjb.51.1644254123182;
        Mon, 07 Feb 2022 09:15:23 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id hk18sm9900875pjb.41.2022.02.07.09.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 09:15:22 -0800 (PST)
Message-ID: <620153aa.1c69fb81.c88ab.821b@mx.google.com>
Date:   Mon, 07 Feb 2022 09:15:22 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2022-02-07-v5.17-rc3
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
Subject: renesas/master igt-gpu-panfrost: 1 runs,
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

renesas/master igt-gpu-panfrost: 1 runs, 1 regressions (renesas-devel-2022-=
02-07-v5.17-rc3)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-02-07-v5.17-rc3/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-02-07-v5.17-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      1473d361292c53a189d07c296105887e45695417

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  8d0fb9b3f225183fb3276a0e4ae1f8354a3519e8
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  ae2eb9e18bc58a4c45f28cfd80962938198dec3c =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/620147830051d565c75d6ef5

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-07-v5.17-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/i=
gt-gpu-panfrost-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-07-v5.17-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/i=
gt-gpu-panfrost-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220128.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/620147830051d565c75d6ef8
        new failure (last pass: renesas-devel-2022-02-02-v5.17-rc2)

    2022-02-07T16:14:16.573466  <6>[   23.655731] Console: switching to col=
our dummy device 80x25
    2022-02-07T16:14:16.579319  <14>[   23.662979] [IGT] panfrost_submit: e=
xecuting
    2022-02-07T16:14:16.586551  IGT-Version: 1.26-gae2eb9e (aarch64) (Linux=
: 5.17.0-rc3 aarch64)
    2022-02-07T16:14:16.603833  <14>[   23.684988] [IGT] panfrost_submit: s=
tarting subtest pan-unhandled-pagefault
    2022-02-07T16:14:16.608675  Starting subtest: pan-unhandled-pagefault
    2022-02-07T16:14:16.726509  (panfrost_submit:345) CRITICAL: Test assert=
ion failure function __igt_unique____real_main65, file ../tests/panfrost_su=
bmit.c:178<14>[   23.806581] [IGT] panfrost_submit: exiting, ret=3D98
    2022-02-07T16:14:16.727603  :
    2022-02-07T16:14:16.740250  (panfrost_submit:345) CRITICAL: Failed asse=
rtion: syncobj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_=
NSEC), 0, NULL)
    2022-02-07T16:14:16.741540  Stack trace:
    2022-02-07T16:14:16.746338    #0 ../lib/igt_core.c:1752 __igt_fail_asse=
rt() =

    ... (12 line(s) more)  =

 =20
