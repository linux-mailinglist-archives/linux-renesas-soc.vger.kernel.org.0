Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC82E4FFD7B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Apr 2022 20:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235649AbiDMSK1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Apr 2022 14:10:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234701AbiDMSK1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Apr 2022 14:10:27 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E5514CD6F
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Apr 2022 11:08:05 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 32so2503156pgl.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Apr 2022 11:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ZoIWTbvlrlgk519FBjW6jz3rRM3smE+iX8Px1L8Sz6A=;
        b=K4dopO6ZaE/ZG0SZY5WMTMEYRsLrM+RT5UYX6Qmob3iSlMqMK+iZSABwnHUyNhrSgW
         cViZ7AFuccQf1zXr+eZzWlhhdZNQfZxNgN0UI05uFDtWHWGHj95tchKzEXdb5WlA5Ul8
         QGAo6hA+G/kwSKJwazBjpmaH5H1TXXFHOIrUPzopg7xmSKCJBzNdKZHYLyCDPmtJ1FUY
         HWPSavOn8RlCXmr5DctxIN6zwtbH3crC6xkzTfGxN2ThUxE0HSq8vCcfryleKE5/lRrg
         2pPMQOaJ8FnJ+ZR1fPxraIHOf/8AyEPPBYJPB1k/v//7HZbtZ1QIpaCsetzbhSgZEfbb
         QenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ZoIWTbvlrlgk519FBjW6jz3rRM3smE+iX8Px1L8Sz6A=;
        b=Wb+0CzR8kxDQjpUDQxKVBB1G4qcZihYkJc2mOmFqJ8E/85NIeQd5hQIuYtTXMB5Zjt
         1u4aHBAw4870sRzTSNfMVwGj5MJ1ybNxOTSU7AIEcdXFNd5UInRDja301oeqvh66UpEc
         lxy6/CNDmAuFcp60B5uTy07JGWwEEdlOSUHYdSQ/gzxkef+HjJAppkc3oeQrk4h3eEfl
         55t4fl0fJBiTZ1Nptr1t3sMkg3ro96TrBnoRBUSk9YKTuJTAvWUikD/0OUovApcnrFPg
         ojL96xWL8EnxPxmfzvLvLSx8kSZPikMJ3KbPD8g+Q/QqOopGCW0cMoF/zFCCDMFFJEt8
         rW3Q==
X-Gm-Message-State: AOAM533TCdrXmVqFlaJ7rSlRv+QSR8/qYRhvDcLG1qHn5izNOrrxicUV
        HiUu1AwuqvqEDOCtQLn9O1eaAzFZsd2XMXRJ
X-Google-Smtp-Source: ABdhPJy6ouRmlny/Z0mkOENzd+XxeioP0TWaRLl1KcQ3dju2NxlSYaeWtgnMEB7VBavgvze0XK4YwA==
X-Received: by 2002:a63:6e04:0:b0:398:409:2928 with SMTP id j4-20020a636e04000000b0039804092928mr36277774pgc.250.1649873284488;
        Wed, 13 Apr 2022 11:08:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h18-20020a63c012000000b0039cc3c323f7sm6553360pgg.33.2022.04.13.11.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 11:08:04 -0700 (PDT)
Message-ID: <62571184.1c69fb81.9b3c6.19fb@mx.google.com>
Date:   Wed, 13 Apr 2022 11:08:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-04-13-v5.18-rc2
X-Kernelci-Report-Type: test
Subject: renesas/master igt-gpu-panfrost: 1 runs,
 1 regressions (renesas-devel-2022-04-13-v5.18-rc2)
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
04-13-v5.18-rc2)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-04-13-v5.18-rc2/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-04-13-v5.18-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      83f3d1f783134ab640a936201ad287ae8570cec3

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  85393adb12ad6277b21b885f11a3b94ef2d531db
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  50f7bc405cc1411f57855ed23322c6c4d2510b58 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6257033c023dbf8abfae06a9

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-13-v5.18-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/i=
gt-gpu-panfrost-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-13-v5.18-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/i=
gt-gpu-panfrost-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220401.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/6257033c023dbf8abfae06ac
        new failure (last pass: renesas-devel-2022-04-11-v5.18-rc2)

    2022-04-13T17:06:57.157411  <8>[   24.217419] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpan-submit-and-close RESULT=3Dpass>
    2022-04-13T17:06:57.190240  <6>[   24.252549] Console: switching to col=
our dummy device 80x25
    2022-04-13T17:06:57.194669  <14>[   24.259240] [IGT] panfrost_submit: e=
xecuting
    2022-04-13T17:06:57.201677  IGT-Version: 1.26-g50f7bc4 (aarch64) (Linux=
: 5.18.0-rc2 aarch64)
    2022-04-13T17:06:57.220183  <14>[   24.281581] [IGT] panfrost_submit: s=
tarting subtest pan-unhandled-pagefault
    2022-04-13T17:06:57.224579  Starting subtest: pan-unhandled-pagefault
    2022-04-13T17:06:57.342002  (panfrost_submit:342) CRITICAL: Test assert=
ion failure function __igt_unique____real_main65, file ../tests/panfrost_su=
bmit.c:178<14>[   24.402138] [IGT] panfrost_submit: exiting, ret=3D98
    2022-04-13T17:06:57.342751  :
    2022-04-13T17:06:57.356328  (panfrost_submit:342) CRITICAL: Failed asse=
rtion: syncobj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_=
NSEC), 0, NULL)
    2022-04-13T17:06:57.356827  Stack trace: =

    ... (10 line(s) more)  =

 =20
