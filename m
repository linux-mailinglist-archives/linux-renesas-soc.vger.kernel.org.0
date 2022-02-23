Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C15AE4C098E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Feb 2022 03:45:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236914AbiBWCmX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Feb 2022 21:42:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237614AbiBWCmT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Feb 2022 21:42:19 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AAA6710CA
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Feb 2022 18:35:46 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id z4so18600643pgh.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Feb 2022 18:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=aJ/6kReS8lcLJRpj10uk4W8oCotv+OFbFOzHDj0wXN0=;
        b=IfMWpuK/bFmDot4Hvh1Ois21AHvmCDL0m9P3vcMj5S2Qk5M8T5+bnj3ij2WesYRBHm
         inilsIcBl7cAHYjiDl979geF/PuE3xINAmpsGjDAx8bzKMaB0oxnKNCDjD2Ov8oEgvzE
         Cqt8qZb0aDSbe+chqfZX5masakMB+18FmRSGirdwC39bdmaS77Fi9juHMO9o2mjsL2wF
         qOFN0io/vXvsua9AmL6jQlo5ZHoErhJrxJHy6TmWFcC1NL/7rYirOZ7uHVTm6YzfYqGH
         TbOMyfd7RISUwHcAfPcxMhYVdxfg5A/6cUXiQO3c2Vv94RLALcSBRBrWHGwjQPwqE0vd
         P0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=aJ/6kReS8lcLJRpj10uk4W8oCotv+OFbFOzHDj0wXN0=;
        b=STgS9VRzwKHitwqcCuiAImw3/HVztKZGHbMFuY49oJNbpEbaagCXbw+2K57hdlqoNS
         JAoHqQJfgj9oTtnV6GhPrtFtqeKGGNwpl5yFkjaNkYuimzplMA1knum7XsNJn7ZyvDpD
         eli76Z59+l5L+koQPzjPIE8P7+VnsJylmwuuGOlqDci8cJfqqthVtR/mMO9+syAMBNW+
         P1eZ/fCCj4xRZnD1uz8YDcy0IQSwR29F3J7q7gkJzlgMGqBTCoYGnTOSG/CV/GgS3FiP
         1wmvlk+u3qW1sqdR4Jg8CprOqr/WzurCxv4xoG2Nrqm5UTQxIBi6p9fFyB0UpTwiCsvs
         RZBw==
X-Gm-Message-State: AOAM531LcZD5Ek5z4U9MVFClyGoW+5nrlZXN2I//fFUirY6faSZZcDUW
        H3spGPpkYTvbD7pcmC7Hsj5qUv9r4FJS0m5P
X-Google-Smtp-Source: ABdhPJxrehWB0iJEAb1ozrp7fhMgurl3u5U6NaFMFXQ8aryK8vu/XaKsGblYgsDha7+xdaTHHL4rDQ==
X-Received: by 2002:a05:6a02:106:b0:36c:96dd:8c17 with SMTP id bg6-20020a056a02010600b0036c96dd8c17mr21930971pgb.190.1645583745379;
        Tue, 22 Feb 2022 18:35:45 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b13sm11099793pfl.75.2022.02.22.18.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 18:35:44 -0800 (PST)
Message-ID: <62159d80.1c69fb81.8a633.cba0@mx.google.com>
Date:   Tue, 22 Feb 2022 18:35:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2022-02-22-v5.17-rc1
Subject: renesas/next igt-kms-rockchip: 1 runs,
 1 regressions (renesas-next-2022-02-22-v5.17-rc1)
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

renesas/next igt-kms-rockchip: 1 runs, 1 regressions (renesas-next-2022-02-=
22-v5.17-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-02-22-v5.17-rc1/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-02-22-v5.17-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      77494b5c6a736414fb60a82e47e368b133443306

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  8d0fb9b3f225183fb3276a0e4ae1f8354a3519e8
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  9cb64a757d2ff1e180b1648e611439d94afd697d =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/621586280029c10175c62968

  Results:     79 PASS, 15 FAIL, 142 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-22-v5.17-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-=
kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-22-v5.17-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-=
kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220218.1/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
21586280029c10175c62a0e
        new failure (last pass: renesas-next-2022-02-21-v5.17-rc1)

    2022-02-23T00:53:48.631450  <8>[   44.660901] <LAVA_SIGNAL_TESTSET STOP>
    2022-02-23T00:53:48.669245  <8>[   44.697640] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2022-02-23T00:53:48.702763  <6>[   44.730911] Console: switching to col=
our dummy device 80x25
    2022-02-23T00:53:48.708591  <14>[   44.737915] [IGT] kms_setmode: execu=
ting
    2022-02-23T00:53:48.721029  IGT-Version: 1.26-g9cb64a7 (aarch64) (Linux=
: 5.17.0-rc1 aarch64)<14>[   44.743206] [IGT] kms_setmode: starting subtest=
 basic
    2022-02-23T00:53:48.721358  =

    2022-02-23T00:53:48.723752  Starting subtest: basic
    2022-02-23T00:53:48.727495  Testing: basic 1 connector combinations
    2022-02-23T00:53:48.829139    Test id#1 CRTC count 1
    2022-02-23T00:53:48.835161      CRTC[37] [Pipe A] Mode: 2400x1600@60Hz =
Connectors: eDP-1[49] =

    ... (69 line(s) more)  =

 =20
