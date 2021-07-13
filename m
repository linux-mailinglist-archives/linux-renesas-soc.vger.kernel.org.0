Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A2623C67AF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jul 2021 02:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233834AbhGMAyn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Jul 2021 20:54:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233545AbhGMAyn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jul 2021 20:54:43 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AE84C0613DD
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jul 2021 17:51:54 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id n11so11139201pjo.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jul 2021 17:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=RoziM9Gt4C8eCc/GWO03nJlXbCt3zg1Vovbx/adQrpQ=;
        b=IQAkWP1gkI3fM52JI+o6fN4XKcXXhR+qmYumxoYyn6VV4leYCayJMokRNVvqU817VF
         0qDI62R8AR/aqOpN3cnBBG6BcyQR5K6NR7ZIxsZlWHYMw600rwFXGzlYgLL2MY90t9cd
         +jhkJ7RT/9cPGewtPHXrsZwu9mPkfCQfZwffkvnRwQqY1l9MCtDKkkmJjdKrgmOWcp7K
         vyYm6B5Ycs7yzo05nVba67UhL69Pw+2SRTXew2TT4n7vcY9IEgSJuwaXVuPV7OZFBL8Q
         wf6Cvaj+o9J4oW47svqlfiaeK3DHhPDMBBD8BzrBi3sLT9piB5wxOdf1u3+SeTf0FCCa
         f2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=RoziM9Gt4C8eCc/GWO03nJlXbCt3zg1Vovbx/adQrpQ=;
        b=ZMBcCY9znP4/N4uvOMN0LHrDnMKBzfcKV9yF5RoQnsEavYMC419wYxrSqdg+bPtj4x
         4qrZXv50+l5JkcsLU8xLTWaRMSQG7xQ3Im0SRm4cjBgOF7DJ78UCK9EzCateducDTHhK
         lfdUQKs1ZOMvm6MABRgTZXoj1ym62bon9atUgwlpBbpeyYbP7ZGJxi+sg9pOpyLd2lbI
         0xD6DtGj+LAA6r/OgJo3e1nnp8EEDNgCUmvXbyKpQSKsDYm6OHg/FSDlLFir762dRMWL
         K5pI7jD7u8RQt+tDnVy7k9ZL0KSZyxXSa+PZNec2XmqTZGqQmkNmKdnujJO6KPWiq2NM
         qqwQ==
X-Gm-Message-State: AOAM530lM9bD+HL4FDGTIqsvVeDErq8tTQjANGRwI6X7luQ/WqXJE6qd
        pPGVmyzvakmeLkfgXA49qytSYQ9IyXC+znIL
X-Google-Smtp-Source: ABdhPJwpxJzwhNaenGeTufmrtNjcj6NfkyxHvmxnkevAYZPN6sHUwxkwllJv/zezFC7dHxsGrq6+IQ==
X-Received: by 2002:a17:90a:e284:: with SMTP id d4mr16545236pjz.126.1626137513637;
        Mon, 12 Jul 2021 17:51:53 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o3sm581430pjr.49.2021.07.12.17.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 17:51:53 -0700 (PDT)
Message-ID: <60ece3a9.1c69fb81.44e8.33bb@mx.google.com>
Date:   Mon, 12 Jul 2021 17:51:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.14-rc1-17-gcd117793e1ac
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next igt-kms-rockchip: 1 runs,
 1 regressions (v5.14-rc1-17-gcd117793e1ac)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next igt-kms-rockchip: 1 runs, 1 regressions (v5.14-rc1-17-gcd11779=
3e1ac)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/v5.14-=
rc1-17-gcd117793e1ac/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   next
  Describe: v5.14-rc1-17-gcd117793e1ac
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      cd117793e1ac66174038470d85471fa4d9e226b9

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  9cef5dee3cd817728c83aeb3c2010c1954e4c402
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  cd63c83e23789eb194d38b8d272247a88122f2f6 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/60ece258aff42cd34911798f

  Results:     80 PASS, 14 FAIL, 141 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk3399-gru-k=
evin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.14-rc1-17-gcd1=
17793e1ac/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk3399-gru-k=
evin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210709.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-ts-continuation-suspend: https://ker=
nelci.org/test/case/id/60ece258aff42cd349117a16
        new failure (last pass: renesas-next-2021-07-08-v5.13-rc1)

    2021-07-13T00:44:30.529888  <6>[   79.218310] Console: switching to col=
our dummy device 80x25
    2021-07-13T00:44:30.536166  <14>[   79.225734] [IGT] kms_vblank: execut=
ing
    2021-07-13T00:44:30.551118  IGT-Version: 1.26-gcd63c83 (aarch64) (Linux=
: 5.14.0-rc1 aarch64)<14>[   79.231997] [IGT] kms_vblank: starting subtest =
pipe-A-ts-continuation-suspend
    2021-07-13T00:44:30.551414  =

    2021-07-13T00:44:30.555603  Starting subtest: pipe-A-ts-continuation-su=
spend
    2021-07-13T00:44:30.630472  Beginning pipe-A-ts-continuation-suspend on=
 pipe A, connector eDP-1
    2021-07-13T00:44:30.661662  [cmd] rtcwake: assuming RTC uses UTC ...
    2021-07-13T00:44:30.668464  rtcwake: wakeup from \"mem\" using /dev/rtc=
0 at Tue Jul 13 00:39:28 2021
    2021-07-13T00:44:30.681269  <6>[   79.371255] PM: suspend entry (deep)
    2021-07-13T00:44:30.685661  <6>[   79.375644] Filesystems sync: 0.000 s=
econds =

    ... (126 line(s) more)  =

 =20
