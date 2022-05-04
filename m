Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8C355195FE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 May 2022 05:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230258AbiEDDdQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 May 2022 23:33:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230263AbiEDDdN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 May 2022 23:33:13 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 172A2D71
        for <linux-renesas-soc@vger.kernel.org>; Tue,  3 May 2022 20:29:39 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id t11-20020a17090ad50b00b001d95bf21996so4095062pju.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 May 2022 20:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9PuNGjbKbffInvf6ydf4LP8tx5xIUmVRj6N/8l0KZ58=;
        b=4ysn1xWsQHKoLgg2qzRAcVU/Ug3Oz1p3yD9TnNwNEbutzZK+xh0sDLrtnZIZ872P6a
         ukl5hSidI2SWlAGYebA5M7USH8EYcfsWMYGs97JXHRK0PjFoecs7WriQ1dxCBep1Y/Jc
         qY0vB+HRkLz3cspp4M9gMc/KbPmNF5acHadvOxQe8DfnEUwo/utBQfFwCct6eoZ7c1xM
         X+n/EGBzhgYFYpEAlsXw6THRRys9JF9FTLax0FF2/FWD11kMwAdnNJZWIFj7DTs3hBIb
         qst6YAsMiQ1RrDz0j5Ah+FBBuyWI42aPqMqDJ0xqJjpqXQ/OtIk/iix0KJ657pYyHcol
         g+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9PuNGjbKbffInvf6ydf4LP8tx5xIUmVRj6N/8l0KZ58=;
        b=4d/oQq47LFGH6WC7K9nXwzJe5uxPvklS3PX+LYtxpVpNapVcKckJSOhmiKmssessSX
         /boiYt5elxfaNiRDKoCdl5j7eDMXQsrv5NPRq2DXv9fZOl6JykP7GBbzN8l0DEdWt5T4
         pMrsB4VKrGvP48MmbY0OUQltkQ8K4r/1r0H9JV9O7bGA2uFvKKzImk27EHKH53CnsGNu
         +XBBtmnOhOYIGrgb2I3YceEAY+s6byh13/lD0KDt2sGmNb3tC509AeqbsJ60ts9hdoJv
         Gk1MrBlsy90CJTyqdd6VVXgf1kQrDB5zMN4uL9Pr+i3zHyc/SY4Rbb0TFkmQN8YD3OSk
         ujHw==
X-Gm-Message-State: AOAM532eyRlUC3svkdSWVMqRgk4hgQvDctZ2J9wKuO+Z8Dvs1yeBAULj
        p+YYcwfz5htX5008Zn0+iNoLcFg7pHdDQkvfyxQ=
X-Google-Smtp-Source: ABdhPJygMNiP9M1bkcWEcG+WTkhb6nLk4gfAEtPy/vdEKKSMJ40xsDSKKJd/MObS8Uh0S3noC3xF4A==
X-Received: by 2002:a17:902:ab04:b0:156:1517:411a with SMTP id ik4-20020a170902ab0400b001561517411amr19603341plb.128.1651634978478;
        Tue, 03 May 2022 20:29:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d6-20020a655886000000b003c14af5060bsm13624632pgu.35.2022.05.03.20.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 20:29:38 -0700 (PDT)
Message-ID: <6271f322.1c69fb81.a1aee.1f42@mx.google.com>
Date:   Tue, 03 May 2022 20:29:38 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2022-05-03-v5.18-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next baseline-nfs: 32 runs,
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

renesas/next baseline-nfs: 32 runs, 1 regressions (renesas-next-2022-05-03-=
v5.18-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-05-03-v5.18-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-05-03-v5.18-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      513cc648e77c3a2a859bc8d69421ac231c72bbf4 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6271c04d0d871d7268dc7b4e

  Results:     82 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-05-03-v5.18-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-05-03-v5.18-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220428.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/cas=
e/id/6271c04d0d871d7268dc7b74
        failing since 28 days (last pass: renesas-next-2022-02-25-v5.17-rc1=
, first fail: renesas-next-2022-04-04-v5.18-rc1)

    2022-05-03T23:52:28.689285  <8>[   35.486803] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-05-03T23:52:29.729580  /lava-6255064/1/../bin/lava-test-case   =

 =20
