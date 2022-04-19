Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCB105076AD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Apr 2022 19:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232267AbiDSRkI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Apr 2022 13:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355939AbiDSRkH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Apr 2022 13:40:07 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9504A27CCA
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Apr 2022 10:37:23 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id z6-20020a17090a398600b001cb9fca3210so2594677pjb.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Apr 2022 10:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=KtcV3demk/LeA7h65do2TBHFgit1N40AJp3pIvysV8M=;
        b=Z5R6MlN5ihz15zPlt5EIKm9hKDk0dZj+O09oCHMNzttlWhIrn5LupAHy8Mnh8AgLKK
         RKbMk3haeMfpkGltfm2/OpEUV4auyBeolHvl8tyPmXGJaZ1t/D/sCXAC2IuO46gCvIFn
         Q1e/cD1eL+vHC+KYev6g8mR6aTZdBRKSigQKB17eHcbgnKn6ubgOFe1dfVZSvzDwbOlP
         0wZ0QjY00HpbKL7h7fuwzDz/HTVtte6XemawiHrwf+MP0ankTEJax4lY2xEdMGRU4uxI
         8VTe/coHmJo321cpbMS8yYTNpM8HqnvjuVrc11+PaYVGLhXQhx8L6gG5654BmqKZbBoS
         0Hqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=KtcV3demk/LeA7h65do2TBHFgit1N40AJp3pIvysV8M=;
        b=BxOxK7Y7kxr8+3B9GSPd9/IF8ynfH+QvcT4ZYx7r+5Zzd/iddK4mwiXpJ7zHv0DQIw
         HLGkfQ+U1s7+wXlmQRA9GkfAaNGHS4x6eq/i2fww7iB279U9tTy60WfqfMZ6Dm6SqCaW
         iuIWj+izB2zOAzF4XuIU6r6AvFCUWVLXvNvY9/1wHcxIE2KZR+woz+tJB2buiP/JG9aV
         lV0ubROeoI4DnsOMbFjQft0qkunh0/O8oBkuHGeCVSVv6ReMMXvfsSTk3CBkR9A0yujr
         Q0JYoxLiYtTohHX5TTz/I0HXZbBlxNrjzK+1J//d+WCW1wEdGS/pH8GJn3zCKLJrHDyZ
         PZ1g==
X-Gm-Message-State: AOAM532wtGgZHgOW42t1V2+fRdLLcOPce/sMYW7+1TNjze9q37qHHLPH
        HSwC7ROPNWgPO9u3xJMPakuGmOMBQzjH31YB
X-Google-Smtp-Source: ABdhPJxBDYp3V4GctZ5KJI3qMr2pAZZCkF6dY7zg9VoJvwQgSXBuvBnvviwK3N0gDETsen4a5MjAdQ==
X-Received: by 2002:a17:902:e141:b0:158:e152:adc6 with SMTP id d1-20020a170902e14100b00158e152adc6mr16544137pla.161.1650389842806;
        Tue, 19 Apr 2022 10:37:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id lt5-20020a17090b354500b001cd3a3cfc0fsm16494633pjb.50.2022.04.19.10.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 10:37:22 -0700 (PDT)
Message-ID: <625ef352.1c69fb81.6817b.7608@mx.google.com>
Date:   Tue, 19 Apr 2022 10:37:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2022-04-19-v5.18-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next igt-kms-rockchip: 1 runs,
 1 regressions (renesas-next-2022-04-19-v5.18-rc1)
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

renesas/next igt-kms-rockchip: 1 runs, 1 regressions (renesas-next-2022-04-=
19-v5.18-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-04-19-v5.18-rc1/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-04-19-v5.18-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      fc84df8749fa09bc9407dfbf3c9a67a204a31eb5

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  85393adb12ad6277b21b885f11a3b94ef2d531db
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  33a5adf20dc435cc2c6dd584caa3674c89032762 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/625ee1b9b7657623c0ae068f

  Results:     74 PASS, 15 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-19-v5.18-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-=
kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-19-v5.18-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-=
kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220411.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-dpms-suspend: https:=
//kernelci.org/test/case/id/625ee1bab7657623c0ae06ff
        new failure (last pass: renesas-next-2022-04-11-v5.18-rc1)

    2022-04-19T16:21:14.938093  <6>[  101.099104] Console: switching to col=
our dummy device 80x25
    2022-04-19T16:21:14.944303  <14>[  101.106567] [IGT] kms_vblank: execut=
ing
    2022-04-19T16:21:14.958394  IGT-Version: 1.26-g33a5adf (aarch64) (Linux=
: 5.18.0-rc1 aarch64)<14>[  101.112998] [IGT] kms_vblank: starting subtest =
pipe-B-ts-continuation-dpms-suspend
    2022-04-19T16:21:14.959514  =

    2022-04-19T16:21:14.964545  Starting subtest: pipe-B-ts-continuation-dp=
ms-suspend
    2022-04-19T16:21:15.176340  Beginning pipe-B-ts-continuation-dpms-suspe=
nd on pipe B, connector eDP-1
    2022-04-19T16:21:15.224787  [cmd] rtcwake: assuming RTC uses UTC ...
    2022-04-19T16:21:15.231813  rtcwake: wakeup from \"mem\" using /dev/rtc=
0 at Tue Apr 19 13:54:55 2022
    2022-04-19T16:21:15.245328  <6>[  101.408522] PM: suspend entry (deep)
    2022-04-19T16:21:15.249942  <6>[  101.412907] Filesystems sync: 0.000 s=
econds =

    ... (142 line(s) more)  =

 =20
