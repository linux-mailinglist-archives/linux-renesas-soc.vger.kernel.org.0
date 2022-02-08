Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98A014ADAC1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Feb 2022 15:05:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350961AbiBHOFX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Feb 2022 09:05:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376422AbiBHOFX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Feb 2022 09:05:23 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D2A7C03FED0
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Feb 2022 06:05:22 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id qe15so6862755pjb.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Feb 2022 06:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=gPXlcFCisFk98FdLqfVED5m11NOVaHNEOY+g/ePR+r8=;
        b=OhnBr6eqfcjUsGnsXZG+0oPXiPmMdhCh8inoSFiprVY+RMsooKXZVrxBzi+5duiJsV
         60ejnCu3/xsMnXJnJk68QqxYmh6N6jsn9Q+6tFrcSOInkgmby/pvEQeWltc3sWtVydTy
         56TRJmgl0C25OlBpZANk/hpgDtV3GbfC63L9Gi3e4i9Ap+NMipYo1UbGKT4qiBHF1RW7
         pXtZEhkLcHI9UAJCwO/FV58XEYB1gdqAjaBeYNDu6PgIf6lVO+L9UkdUziMZTN5n8l8N
         8whzz1LmFiKy6DOpirw8/G9BOxg6/oDbPX2Znn4tQ9ficysy3iNKJSNUf5wLC9r8wDbV
         92KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=gPXlcFCisFk98FdLqfVED5m11NOVaHNEOY+g/ePR+r8=;
        b=INvJuNTs3OBB4LalM+245gpMPAHcu8biOEkMKYMdF5Jsvo3kmGAR+499AUblfcwaFw
         cEdCnQTz5dJm1Ynlm0vIvZY1tYnTjS1vMlznqK64oaSK6O7yp9h9JwgZKjrojLooQIgZ
         JH/+DOKdntwQxxoIzr7A0B/NTqsnc4ckrn61DGeGAW1Im+EjZtYoC/I32+Eb+Lv0bOWj
         4Vm4J+pp9LXTOM1hrcCBWv6tW5ajkMiAIb2lxjGbuW7LrLeZfJnzHVoWCQ4sClvIAXDa
         c0K1+MYcpApg8MDgVZIlmqnc5t5ITEoBpIuyIk0q1o9FD2CjNzQ0uzDClt/1eS+bYPyx
         wEKw==
X-Gm-Message-State: AOAM530DeKrjamutrTD/CBOa8sZvarPaOGRoYxy0OkOWJLk+A8d7eUDt
        Yv7RtpmiuuQ/I6332SdbeOaWkLNpz4dAvWpR
X-Google-Smtp-Source: ABdhPJwDPeV9WjCCTD0jUzsSV8AgJtTWIKuTZoMhIYnaNuux2F7A4GqqFgUOELVUQJGuUsYKjVgHKQ==
X-Received: by 2002:a17:902:f651:: with SMTP id m17mr4583252plg.106.1644329121341;
        Tue, 08 Feb 2022 06:05:21 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s11sm17351056pfu.58.2022.02.08.06.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 06:05:21 -0800 (PST)
Message-ID: <620278a1.1c69fb81.c7c93.a4b1@mx.google.com>
Date:   Tue, 08 Feb 2022 06:05:21 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-02-08-v5.17-rc3
Subject: renesas/master baseline-nfs: 39 runs,
 1 regressions (renesas-devel-2022-02-08-v5.17-rc3)
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

renesas/master baseline-nfs: 39 runs, 1 regressions (renesas-devel-2022-02-=
08-v5.17-rc3)

Regressions Summary
-------------------

platform            | arch  | lab          | compiler | defconfig        | =
regressions
--------------------+-------+--------------+----------+------------------+-=
-----------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+crypto | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-02-08-v5.17-rc3/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-02-08-v5.17-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      429683cd533e19e9d252957b958c071b011dd88e =



Test Regressions
---------------- =



platform            | arch  | lab          | compiler | defconfig        | =
regressions
--------------------+-------+--------------+----------+------------------+-=
-----------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+crypto | =
1          =


  Details:     https://kernelci.org/test/plan/id/62023bf553bc8d3a105d6ee8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-08-v5.17-rc3/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs=
-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-08-v5.17-rc3/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs=
-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220128.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62023bf553bc8d3a1=
05d6ee9
        new failure (last pass: renesas-devel-2022-02-07-v5.17-rc3) =

 =20
