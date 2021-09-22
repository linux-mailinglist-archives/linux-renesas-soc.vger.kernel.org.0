Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9179413F25
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Sep 2021 03:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhIVCBL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Sep 2021 22:01:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbhIVCBL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 22:01:11 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D81FC061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Sep 2021 18:59:42 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id f129so1038945pgc.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Sep 2021 18:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=vDr+mxqtFE/MWWtVyirxyKCRf9Pz0TSRElGfrS/1Pzk=;
        b=dDMyoQ6u9iN5lRckbUx28/Yhisl4TEE+Ff0Nlas6R5Wu21bxyVOUpPUFtAal5ogKXG
         MndY4DPxHq3ztlanLy2FmKeq5KxKfQBeTdZxC4UFHDOA4x2mKei8iJLx6DeG/67YmMwQ
         LoAuTlRnzODpCI90+EXpycNr18e32hs+Y3gw9oa1Tr5J4IW6IQH5CuYO5SRX3ieqbIR7
         hft6YHoSwrYPsZZYdHpMXQ9XLf7cz4py9KOe+Wv3dEcOeoIcGdZq33bKjxeKb95LrqZJ
         PHn8oXEEURxlNo9JHjlid+2dyPPMufBc4MsKjF8qn6ZkKN3QvHR3qczq6eLzKNdZqMNX
         cCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=vDr+mxqtFE/MWWtVyirxyKCRf9Pz0TSRElGfrS/1Pzk=;
        b=Sp8P/4zG2V0CUoi5yeOoL6p0Y0vMpbuPgtyM5w+8Qh+MJ8YmykJXZwXR5iguDW0nfE
         /DFYJCZL/8Lxn9POrsnxo2V2XZckYamnzbXQkVCHUy2nlHo4hmF8rl1g89PdR1rXbxg8
         vPYVq2gnDJSsEel5IkHXl9FRvPdpx0HBQOIpPQc9SjjgXX6xXhW6Ztq3Ar0kteK9yNNT
         UEWuu129Yg6PJlbAlkxtbZD6ONBrgNJuTX6P3qsBJeppWxTfGxUdZ18yVTzrVArJsCgS
         DW4oOVyXBj2rDPRZ7hOqK95SsDfW09HjHR+kVP5H1jrrBcax5YMIOovxjtGeT2CplYn4
         KGZw==
X-Gm-Message-State: AOAM530Tzpa4tcgzP/Z0rDSbhq0mLbglgukXEcQX0/1UPQcTaCSJkcT3
        UGR7+Waspl+NvV/372SKawL6kIQ2JK0gTalN
X-Google-Smtp-Source: ABdhPJw7uIuXIaYWgt04VZy/SM2ig8BQor64awKXwUvvzVrmJD5/j4f3fXM98qFbRsMltF7tlkBgDw==
X-Received: by 2002:a62:14cb:0:b0:43e:ba00:c35e with SMTP id 194-20020a6214cb000000b0043eba00c35emr32956133pfu.9.1632275981600;
        Tue, 21 Sep 2021 18:59:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u16sm368747pfn.68.2021.09.21.18.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 18:59:41 -0700 (PDT)
Message-ID: <614a8e0d.1c69fb81.98232.2826@mx.google.com>
Date:   Tue, 21 Sep 2021 18:59:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-09-20-v5.15-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next igt-kms-rockchip: 1 runs,
 2 regressions (renesas-next-2021-09-20-v5.15-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next igt-kms-rockchip: 1 runs, 2 regressions (renesas-next-2021-09-=
20-v5.15-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 2        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-09-20-v5.15-rc1/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-09-20-v5.15-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      41c50f42a51cc8630c6a28e9b26f92d920e91780

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
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 2        =
  =


  Details:     https://kernelci.org/test/plan/id/614a768a07679a754a99a2dd

  Results:     79 PASS, 15 FAIL, 141 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk339=
9-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk339=
9-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210913.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-ts-continuation-suspend: https://ker=
nelci.org/test/case/id/614a768a07679a754a99a365
        failing since 70 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-09-22T00:17:34.996133  <8>[   81.135901] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-A-ts-continuation-dpms-suspend RESULT=3Dpass>
    2021-09-22T00:17:35.028851  <6>[   81.174687] Console: switching to col=
our dummy device 80x25
    2021-09-22T00:17:35.034227  <14>[   81.181822] [IGT] kms_vblank: execut=
ing
    2021-09-22T00:17:35.048781  IGT-Version: 1.26-g1084c5e (aarch64) (Linux=
: 5.15.0-rc1 aarch64)<14>[   81.188095] [IGT] kms_vblank: starting subtest =
pipe-A-ts-continuation-suspend
    2021-09-22T00:17:35.050105  =

    2021-09-22T00:17:35.054308  Starting subtest: pipe-A-ts-continuation-su=
spend
    2021-09-22T00:17:35.138872  Beginning pipe-A-ts-continuation-suspend on=
 pipe A, connector eDP-1
    2021-09-22T00:17:35.169881  [cmd] rtcwake: assuming RTC uses UTC ...
    2021-09-22T00:17:35.176202  rtcwake: wakeup from \"mem\" using /dev/rtc=
0 at Wed Sep 22 00:11:42 2021
    2021-09-22T00:17:35.189527  <6>[   81.337116] PM: suspend entry (deep) =

    ... (129 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
14a768a07679a754a99a383
        failing since 8 days (last pass: renesas-next-2021-08-12-v5.14-rc1,=
 first fail: v5.15-rc1-39-gcbbd8f16ae1c)

    2021-09-22T00:16:44.823757  <8>[   46.260668] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dinvalid-set-prop RESULT=3Dpass>
    2021-09-22T00:16:44.830625  <8>[   46.272731] <LAVA_SIGNAL_TESTSET STOP>
    2021-09-22T00:16:44.878064  <8>[   46.318877] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2021-09-22T00:16:44.916711  <6>[   46.357132] Console: switching to col=
our dummy device 80x25
    2021-09-22T00:16:44.923006  <14>[   46.364773] [IGT] kms_setmode: execu=
ting
    2021-09-22T00:16:44.934798  IGT-Version: 1.26-g1084c5e (aarch64) (Linux=
: 5.15.0-rc1 aarch64)<14>[   46.370065] [IGT] kms_setmode: starting subtest=
 basic
    2021-09-22T00:16:44.935895  =

    2021-09-22T00:16:44.937534  Starting subtest: basic
    2021-09-22T00:16:44.941769  Testing: basic 1 connector combinations
    2021-09-22T00:16:45.062382    Test id#1 CRTC count 1 =

    ... (73 line(s) more)  =

 =20
