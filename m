Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE38B70BE73
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 May 2023 14:37:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231467AbjEVMhj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 May 2023 08:37:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233362AbjEVMhf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 May 2023 08:37:35 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DFABC1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 May 2023 05:37:18 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1ae3ed1b0d6so41391655ad.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 May 2023 05:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1684759031; x=1687351031;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Sz949+7y5jSIXvR/ElrTUK/reNieUBSYppi48QBdyPE=;
        b=UGuUY9Cjb5+X5jYIy9npz4IC+aSiQyEhyKNfoNb5eRyY/74UsX2tsSDBL/JbqTzdUc
         tnjZA1+dz8LXgXykFwIsb4Cxbizq/ng7YtvMB32Zu0aacgJXhHtxRALBMv3yFqkW9fTz
         h8ZDXZp2mBhAgclqgX4m3RVGXtNgXl9vWIzhynBnPmcSFpkQsnmUcRHq0uffUSVs++31
         9I0uYaAvpD8H1TLjMnjwBWxqSoocdCUPs372S/6VJN7RuoxqCQJNqR7Ct3txWeWPwdAR
         hBUioCbGbbjvwG/r22LeMcx3K0wui4nWRFIrS5gQFXEWrq50DVtHMqkYZJrQZVG+S7/r
         2BUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684759031; x=1687351031;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sz949+7y5jSIXvR/ElrTUK/reNieUBSYppi48QBdyPE=;
        b=X8ywDxMRAaDyZ6MfBrcUwIO4DqF2Qkhsyw7Tya5YQjVdBj5SbCX2gv69SEkdTKvMBO
         o6VgkkT/C6WVeu6VPDEPYNjXdN/fGBNWR3LJw3JFyhSwI+rHzj/Afi/t+Ctk7qIlLzdP
         E0pgWQvb717tTqRQpi8PBE894CllBYIQDOEWkEQOPJ0Dj2+fm4cMuwu6wUiyb6LBC1/Y
         UJoWBqwM9kwboCqz9yyF+e+AFI586NCH06dzDVfj3UYu1v96q3xJp6Mb7ixLKtkaiYPX
         N9bQTFzb2EDi2nYncMhY464Fy3YR688wLG2rkUPwzNm3hcrlf5Stl20hxGXbmLYtK5Hs
         YtNg==
X-Gm-Message-State: AC+VfDwIZjwiZg/Tuu5ueknfgGVP3NIu1gKHk9SaIrXp1xlAFjVfAUP+
        D4oaMtOD8EakDe7/TN41VXYajZOxyvJLUrRKTjX0JQ==
X-Google-Smtp-Source: ACHHUZ6de4VrdX9Ha8xZfgcwRlqsK/44kSCpc5MJM7VOmvAbQbNu0UgcAaWsKtlHspY8DUPYs0ZWrA==
X-Received: by 2002:a17:902:cec2:b0:1af:b47e:7887 with SMTP id d2-20020a170902cec200b001afb47e7887mr3631364plg.65.1684759031404;
        Mon, 22 May 2023 05:37:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w9-20020a170902d3c900b001a6d08eb054sm4792089plb.78.2023.05.22.05.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 05:37:10 -0700 (PDT)
Message-ID: <646b61f6.170a0220.7f079.7518@mx.google.com>
Date:   Mon, 22 May 2023 05:37:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-05-22-v6.4-rc3
X-Kernelci-Report-Type: test
Subject: renesas/master v4l2-compliance on uvcvideo: 4 runs,
 3 regressions (renesas-devel-2023-05-22-v6.4-rc3)
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

renesas/master v4l2-compliance on uvcvideo: 4 runs, 3 regressions (renesas-=
devel-2023-05-22-v6.4-rc3)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-05-22-v6.4-rc3/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-05-22-v6.4-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      44b93b667d845927e0168aa763b3a14e93b21a66

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  54893534b1225c03a65b476a134fe2f045c97102 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646b567a2bc2fd604a2e8623

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-v4=
l2/20230512.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.login: https://kernelci.org/test/case/id/646b567a2b=
c2fd604a2e8624
        failing since 12 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646b549949dd1a05602e862c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-v4=
l2/20230512.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.login: https://kernelci.org/test/case/id/646b549949=
dd1a05602e862d
        failing since 12 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646b57192a3f726ce12e85ea

  Results:     1 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-v4=
l2/20230512.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.device-presence: https://kernelci.org/test/case/id/=
646b57192a3f726ce12e85ec
        failing since 12 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1)

    2023-05-22T11:50:35.792242  / # =


    2023-05-22T11:50:35.795362  =


    2023-05-22T11:50:35.902698  / # #

    2023-05-22T11:50:35.906498  #

    2023-05-22T11:50:36.010403  / # export SHELL=3D/bin/sh

    2023-05-22T11:50:36.014734  export SHELL=3D/bin/sh

    2023-05-22T11:50:36.117437  / # . /lava-10409776/environment

    2023-05-22T11:50:36.120879  . /lava-10409776/environment

    2023-05-22T11:50:36.224638  / # /lava-10409776/bin/lava-test-runner /la=
va-10409776/0

    2023-05-22T11:50:36.227595  /lava-10409776/bin/lava-test-runner /lava-1=
0409776/0
 =

    ... (62 line(s) more)  =

 =20
