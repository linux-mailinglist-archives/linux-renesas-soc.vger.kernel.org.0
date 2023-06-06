Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE6C1723FA7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Jun 2023 12:35:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233068AbjFFKf1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Jun 2023 06:35:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236956AbjFFKew (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Jun 2023 06:34:52 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7E5110D2
        for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Jun 2023 03:34:43 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-39a523e8209so3243048b6e.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Jun 2023 03:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1686047682; x=1688639682;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=J+hFaWI3/J/fQSP3P70DmGflh3e0kaoVOXYKLYnW+Ys=;
        b=jAjcEytsO0yquzN+DX2fDRYlkXA7GAICYYj9xFzZvvb02eN4ErhXidzMsNbpwU+89N
         AXkf1t1RqmE4SUKLKYEFd4xK9Tt6Gb1BzJcbddyjK1M6AZb3OHBX2CVG/WOz9Piz6zt6
         rcbFsL18ivsxMYoBdekAIU3Kt19KBgoW644qhNjzDdxo3vSgdSzBWziqvNtyZZ4Iq14r
         J1g0ZqAJPKGaEHVDAOQAAqQ+xHPoveVGfmhUM2SNDkUTFFaG1wWlebvM3mblX53Dus9T
         ZKrNqwWzuQBHteB6/wdmpNW9LmrwaBIa6wppsJFxZ1bQrReEJzfPPve+/xaOLyawmvcC
         tSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686047682; x=1688639682;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J+hFaWI3/J/fQSP3P70DmGflh3e0kaoVOXYKLYnW+Ys=;
        b=BkwRho/jLWr1seKnslluyCmrtE5FJ3PuWlc1iCJXVc0CTsYejbeiFkAnJyXhKDrK3I
         vQFxyaTywSKJ5vFwrXPcvZ94f2dT6laif7KBL/vpkQ+bj2kcTxZSJ3uhC3A+D2pc7k6X
         jlGMXozuyvO+R2zIKTrHNNdYU1GQdmNLIo37VBBGGHQpp4340bA9is+HD/RQlt2vxMz2
         ZuWYaRxNd1mCuGtoy3aHHovVmbw3WNS7v/xBvMir76nRfHunOV4PmmVNJYnik8OCjwBL
         2qdj4nOSb5DsN0Vci8Hn3CJu0U3LzFZ8vgje6+N0saBAvMdw/uKwmFQE858oKByiyBIQ
         JMkg==
X-Gm-Message-State: AC+VfDyrikFteIZ+OMNDbhhgOsVRJbTTFOJosj7/0Mit98wy6FTwTu/5
        1lsuOAWxI9w/dTyeoBN3i8K5W1XHULCRIegAif21Pg==
X-Google-Smtp-Source: ACHHUZ67nL2TIHTqpWEWlvSUhCaqpA6K8EhNodaglj3GNcljBPUFTgTwZiucrdP/+FsF/zsEhUpZuA==
X-Received: by 2002:aca:910:0:b0:39a:bbd5:c0b7 with SMTP id 16-20020aca0910000000b0039abbd5c0b7mr1006736oij.53.1686047682558;
        Tue, 06 Jun 2023 03:34:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b8-20020aa78708000000b00640ddad2e0dsm6566408pfo.47.2023.06.06.03.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 03:34:42 -0700 (PDT)
Message-ID: <647f0bc2.a70a0220.d55d8.bdbc@mx.google.com>
Date:   Tue, 06 Jun 2023 03:34:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2023-06-06-v6.4-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next igt-gpu-panfrost: 3 runs,
 2 regressions (renesas-next-2023-06-06-v6.4-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next igt-gpu-panfrost: 3 runs, 2 regressions (renesas-next-2023-06-=
06-v6.4-rc1)

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


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-06-06-v6.4-rc1/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-06-06-v6.4-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      7762defcdaf029da668d5af3304d3d940d43199e

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  98e1db501173303e58ef6a1def94ab7a2d84afc1
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  766edf96979bf13a10c9985c007f2baca5c9e308 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef7333bf51659c8f5df5d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-g=
pu-panfrost-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-g=
pu-panfrost-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20230527.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.login: https://kernelci.org/test/case/id/647ef7333bf51=
659c8f5df5e
        failing since 3 days (last pass: renesas-next-2023-03-30-v6.3-rc1, =
first fail: renesas-next-2023-06-02-v6.4-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef72c3352824409f5de98

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-g=
pu-panfrost-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-g=
pu-panfrost-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20230527.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.login: https://kernelci.org/test/case/id/647ef72c33528=
24409f5de99
        failing since 3 days (last pass: renesas-next-2023-03-30-v6.3-rc1, =
first fail: renesas-next-2023-06-02-v6.4-rc1) =

 =20
