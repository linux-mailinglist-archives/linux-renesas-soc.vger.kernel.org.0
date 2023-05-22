Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AED7F70BE72
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 May 2023 14:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231232AbjEVMhh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 May 2023 08:37:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231467AbjEVMhc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 May 2023 08:37:32 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF6DACD
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 May 2023 05:37:09 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-64d3578c25bso3653828b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 May 2023 05:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1684759028; x=1687351028;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JKRKNvskCZwQMubbm6zbpNqFiLZg/bay/axlbsMoDrs=;
        b=V/6ZiruSudb/d0a5WH/P0S6X5P24NSdClVv18eTYhPFgGnG//ssKhIpBBd/rg/JXw1
         h94YfkGY/4GzmLzOCIhpqwP2+nGM5r3kEtaPYbi7UoHBD644rvtDAaHusgxkOrI3EQct
         Dqa3WsHh9ZpMjIPFp2s6qab9tge8rKzEgI1rygZPJyfN5wk3krUiom9jhsDPpoO++mDA
         RPF8+bRw6G4+yktvuwdN/Sh1mv5qyM9I98yLTSvbZch4IVkjgoSi4uMDvTqNFICvH+xX
         O/PBO5P3n97168C9E1IddKvoEix7ppz3IdiAEYy6lLc1XC77VbQQZhcT6f6XflD54/9a
         Vh/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684759028; x=1687351028;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JKRKNvskCZwQMubbm6zbpNqFiLZg/bay/axlbsMoDrs=;
        b=gAuRLtR1zyeUs1fi4WOAfJZplchmhk0Z2sKe9+lAZuKJa1OSV5TEGzlBH5PudxvIu/
         FHzo5wTVYRHKF0/LAHfNTUI1C62TpSxjvumgd8onodIMwhibhuxFsWnMZKAgoMT0fBL2
         tyAyoqKfNgAe2zWUvYG4TfyjkSs9XbrOx3VWBGtkKlHGiCdqfm2bePpesHEFkoCJ1fhs
         nYczY4liSpJ0dNvOWFK9lU+prJpjJ0tLtrAmgNxabOeoib86WDoT5tkDLdqdebYEk0P3
         NTsbnbSzp84q5ib6UV5mQ1T8iFHXhd8Cl1iqgw0BbBXWPyOHKlW7tNSm4HWo/JmrpqKH
         4gEQ==
X-Gm-Message-State: AC+VfDy/NJgDRUdeGIXTq/UAYJYUfCrbh+w/TmnQt6Ny8I9/pIgjYVt/
        vS/NDpy0JF2GWXdccmfM3OAqCyQDrlDVEtZ5kDZ4Tw==
X-Google-Smtp-Source: ACHHUZ6Idm6Q0CmbPqwVjYNePm32F9hc1i2HO2QzmqHUf97umXdIvL7GFKFp9jCFfcak/s4JIiGVTg==
X-Received: by 2002:a05:6a20:440d:b0:ec:8f81:e9f7 with SMTP id ce13-20020a056a20440d00b000ec8f81e9f7mr13637612pzb.16.1684759028608;
        Mon, 22 May 2023 05:37:08 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t9-20020a63eb09000000b00502e7115cbdsm4399701pgh.51.2023.05.22.05.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 05:37:08 -0700 (PDT)
Message-ID: <646b61f4.630a0220.ecf79.6f0b@mx.google.com>
Date:   Mon, 22 May 2023 05:37:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-05-22-v6.4-rc3
X-Kernelci-Report-Type: test
Subject: renesas/master igt-gpu-panfrost: 3 runs,
 2 regressions (renesas-devel-2023-05-22-v6.4-rc3)
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

renesas/master igt-gpu-panfrost: 3 runs, 2 regressions (renesas-devel-2023-=
05-22-v6.4-rc3)

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


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-05-22-v6.4-rc3/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-05-22-v6.4-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      44b93b667d845927e0168aa763b3a14e93b21a66

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  98e1db501173303e58ef6a1def94ab7a2d84afc1
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  a482779488f11c432d7ddcb1980691ab1603f356 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646b57931892a581722e85ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-gpu-panfrost-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-gpu-panfrost-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20230512.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.login: https://kernelci.org/test/case/id/646b57931892a=
581722e85ed
        failing since 12 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646b54e11c46b2ebd22e8635

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-gpu-panfrost-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-gpu-panfrost-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20230512.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.login: https://kernelci.org/test/case/id/646b54e11c46b=
2ebd22e8636
        failing since 12 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =20
