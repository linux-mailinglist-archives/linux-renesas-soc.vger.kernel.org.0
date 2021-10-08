Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60099427231
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Oct 2021 22:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241660AbhJHU1w (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Oct 2021 16:27:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231727AbhJHU1w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 16:27:52 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B481C061570
        for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Oct 2021 13:25:56 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id np13so8414828pjb.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Oct 2021 13:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=oZfW/ID/SncjbWn8luyNOr0MnW9Azq+zY3kUFSWB9yw=;
        b=YYqElCR8jBBxBoCfJMuLgk4D+GReJpQMo5w71I2DqRUXF4s2DDX1CyQjEMWKgKnNRj
         DJnNQbExZqld24V+fKe0NNjFswOaryyG9U0qlV8ucSayUP4/hXI4SE4MekRvPGIG9ZPk
         MqvIsX4eO6bfVPtxc+PUCanGWl5BXCH1UwQ7SAHuzmZD4ZO9FoqYk4BA7ZZNJArfnF0B
         SDF94SX/C41K4IC6eF5x3wBGg0k9IqrSqU7I2dMLtScoiU33DWTUpPTDXPu+UYQwAh0L
         YjS1AoecoNmTcZSMKi9yLCLO5YgtgeI4WdSpRBjDy68RHcn7awVMUmlWQ92xxa8xHizL
         InKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=oZfW/ID/SncjbWn8luyNOr0MnW9Azq+zY3kUFSWB9yw=;
        b=Vb22k/8Jzh6S2UYlDWX5n930piz0beVsv53HAIOiLAiQ3ZqwQ+Mp8H4NKFvweOCySd
         6lqqcV2/XwS3xwzmm6yICgEbQbXGEsGv88ZZ2RwO2FRsUqivwjpQUY6/w8+sD5dYqTJS
         4APEoQo8SGw6Jc2uPAzNOktlyXobAyx/beG7TeLpTUQey4d9ZXqtUXWKpvDB1141t+vg
         MZ+2EtNqCXsg5UyXcz5RWNaSevMrKB4gRVDWv7hweyiN0+ijmp9NhzRDXePKJ1J0+CW3
         YhBfuSF4X0iOHdH4rwlySMbk5NkRFfH+TR6JoPNfuKq/8FyGVMQRS9rI4b9P/ods6vR/
         KRTw==
X-Gm-Message-State: AOAM531jvdaMOxn0c5eB5UpYqcbCHvO4vKHvelIUDKdaDSQnYyqnQ/J8
        MPp1QKGJ9tsJ+eG6OiSU2mYfgtv9EQF2y8DX
X-Google-Smtp-Source: ABdhPJxud8lwCzJ0+/Vl6DFb/UJc0w1HuY4RMKR99xWW50fJ9pV2iZ7Rac/wDPi8vBqBwGxfN0tiLQ==
X-Received: by 2002:a17:902:bd8d:b0:13a:8c8:a2b2 with SMTP id q13-20020a170902bd8d00b0013a08c8a2b2mr11242225pls.89.1633724755766;
        Fri, 08 Oct 2021 13:25:55 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m7sm192248pgn.32.2021.10.08.13.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 13:25:55 -0700 (PDT)
Message-ID: <6160a953.1c69fb81.7443a.0e2c@mx.google.com>
Date:   Fri, 08 Oct 2021 13:25:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-10-08-v5.15-rc4
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master igt-kms-rockchip: 1 runs,
 1 regressions (renesas-devel-2021-10-08-v5.15-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 1 runs, 1 regressions (renesas-devel-2021-=
10-08-v5.15-rc4)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-10-08-v5.15-rc4/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-10-08-v5.15-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      c2a19dc748287f470b9f2117e1b50206988efa8f

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


  Details:     https://kernelci.org/test/plan/id/61609ad125f7150eef99a2f4

  Results:     79 PASS, 15 FAIL, 141 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-08-v5.15-rc4/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-08-v5.15-rc4/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210913.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
1609ad225f7150eef99a39a
        failing since 24 days (last pass: renesas-devel-2021-08-23-v5.14-rc=
7, first fail: v5.15-rc1-564-ge23d26d2dc9a)

    2021-10-08T19:21:07.807581  <8>[   45.115419] <LAVA_SIGNAL_TESTSET STOP>
    2021-10-08T19:21:07.848024  <8>[   45.154372] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2021-10-08T19:21:07.883814  <6>[   45.189579] Console: switching to col=
our dummy device 80x25
    2021-10-08T19:21:07.888579  <14>[   45.196252] [IGT] kms_setmode: execu=
ting
    2021-10-08T19:21:07.901302  IGT-Version: 1.26-g1084c5e (aarch64) (Linux=
: 5.15.0-rc4 aarch64)<14>[   45.201918] [IGT] kms_setmode: starting subtest=
 basic
    2021-10-08T19:21:07.902631  =

    2021-10-08T19:21:07.904635  Starting subtest: basic
    2021-10-08T19:21:07.908299  Testing: basic 1 connector combinations
    2021-10-08T19:21:08.012453    Test id#1 CRTC count 1
    2021-10-08T19:21:08.019334      CRTC[37] [Pipe A] Mode: 2400x1600@60Hz =
Connectors: eDP-1[49] =

    ... (65 line(s) more)  =

 =20
