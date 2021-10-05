Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F08D6421B15
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Oct 2021 02:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbhJEA11 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Oct 2021 20:27:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbhJEA11 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Oct 2021 20:27:27 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 720CAC061745
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Oct 2021 17:25:37 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id a73so15226883pge.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Oct 2021 17:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=MQSkt5MPBuThDg/wFCbOabUSVHU0vP4SdEgt1MY4Tr0=;
        b=rGOGoK4zjsFSR2K+QVPNEeEO8HnG0tujG0VXXiVvCxbxpPPydRKl1QmP5CbVl15e7n
         UcCNysZUlKoAiSI9xPEFFwsbCJawFRj90aaFcRTFk+iZwh0PaPNHQYnNBU3yyKAfLY0E
         aAlWXmHQ9AYMKvvi9m6O0b4mIgw2SNgqJcUWfBwtdJshe0Pfai2b06Ewmp/FBav7xwHc
         YYTESeHvpLbdwcHv5puYGLk1y2UPKPiLKFIvhVfzrpRegoIUgmUEkFxWFGGH0ndK4o3h
         e7/FEfjcQQBVSh9HYHJa9NyIWoiMAqZcBUkHjonVCahv6X6myHrlSzuKiDrpYeUXe3Sf
         KEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=MQSkt5MPBuThDg/wFCbOabUSVHU0vP4SdEgt1MY4Tr0=;
        b=ESuLCs0BHBGr6OjTfOAAX0svE6U+zFwxhzvPiwjOHGxCHuotTIBjVTgkr6d2XajoFj
         z3BDD5ML/s/e2Z3VlTc13OH9Nr5ii/o1agEBtsdjP71PBJvAwOevAJWrNCxGlGIeEeth
         JOmHSCssCFOXCRSt7moVlp4lxwley2n0Vhrmdmsgp+8vo45MqN07qqMxsPSD65McX6qm
         o4p7Zn0QSqawDiL7iLx1FjTrLUkHcmkibRURRvhAT4eyRUrKX0ThNP8kRc3qK3xzDDSw
         QS0wJCjVAX49Irw8dqQLPNTz5gQNdz6/ItFuDJi1XRwWRPb2lfa3pFtqq0Ahhd3auq+S
         enxg==
X-Gm-Message-State: AOAM533HNtKidVpJlomW75UMSBOa0ijHLRIm2osegysLf65MBmwE5eQ4
        O/nVAD8oXkFbVw2SjL+BTaOsQad1o0yUhFKy
X-Google-Smtp-Source: ABdhPJwxWgo5ggDr2aoEhXsdJjDmAgKrb8lQcGPy3zpxGXq8oQURF8vydShm0ha8wPYmAD+jHtqIEA==
X-Received: by 2002:a65:44c4:: with SMTP id g4mr13427451pgs.254.1633393536677;
        Mon, 04 Oct 2021 17:25:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y9sm15231086pfm.129.2021.10.04.17.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 17:25:36 -0700 (PDT)
Message-ID: <615b9b80.1c69fb81.95f8a.f07b@mx.google.com>
Date:   Mon, 04 Oct 2021 17:25:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-10-04-v5.15-rc4
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master igt-kms-rockchip: 1 runs,
 1 regressions (renesas-devel-2021-10-04-v5.15-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 1 runs, 1 regressions (renesas-devel-2021-=
10-04-v5.15-rc4)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-10-04-v5.15-rc4/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-10-04-v5.15-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      022b9ed809ab70e8e1cac03f6a50d8cb91cf4098

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


  Details:     https://kernelci.org/test/plan/id/615b950f5ec55b31df99a32f

  Results:     79 PASS, 15 FAIL, 141 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-04-v5.15-rc4/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-04-v5.15-rc4/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210913.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
15b950f5ec55b31df99a3d5
        failing since 21 days (last pass: renesas-devel-2021-08-23-v5.14-rc=
7, first fail: v5.15-rc1-564-ge23d26d2dc9a)

    2021-10-04T23:55:42.278107  <8>[   44.701476] <LAVA_SIGNAL_TESTSET STOP>
    2021-10-04T23:55:42.316928  <8>[   44.738665] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2021-10-04T23:55:42.351950  <6>[   44.775327] Console: switching to col=
our dummy device 80x25
    2021-10-04T23:55:42.358242  <14>[   44.782715] [IGT] kms_setmode: execu=
ting
    2021-10-04T23:55:42.370565  IGT-Version: 1.26-g1084c5e (aarch64) (Linux=
: 5.15.0-rc4 aarch64)<14>[   44.788019] [IGT] kms_setmode: starting subtest=
 basic
    2021-10-04T23:55:42.371245  =

    2021-10-04T23:55:42.373493  Starting subtest: basic
    2021-10-04T23:55:42.377169  Testing: basic 1 connector combinations
    2021-10-04T23:55:42.473191    Test id#1 CRTC count 1
    2021-10-04T23:55:42.479870      CRTC[37] [Pipe A] Mode: 2400x1600@60Hz =
Connectors: eDP-1[49] =

    ... (68 line(s) more)  =

 =20
