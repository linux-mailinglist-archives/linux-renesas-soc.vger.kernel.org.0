Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BDF946956F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Dec 2021 13:08:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237534AbhLFMLk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Dec 2021 07:11:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242912AbhLFMLj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Dec 2021 07:11:39 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 529DEC061746
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Dec 2021 04:08:11 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id f125so10282327pgc.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Dec 2021 04:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=L7IegJ6qX2YCX5ohugIJ/L3gwh59w3A9Zm1q56QP8Us=;
        b=1LvEFWzHV/1sm71/ss27kuCnRI3JbhnProg8J59R3go3uMgVQ61APigimpErIvT/30
         dfcn8KF4Ci15Mz/0WWgXIN6ODyT2gfkz2Ak8vFU8DlV6UAsclpZUBIk/uu4pQ2GadTfD
         ayVZXoQxKLlubrsCUJgl5HZ8UwLhxPRTywnSnY52VfpdR+owoq6ArYn7C6/ucuhtQ3U/
         ByIUmmDN6lXuAnggX0mq5I8HRtV3RN/F8tUI9pk6EWERjvLFFwcQnNjT2tsMkZ9dRJzg
         1b+VoRQL6mdpKHXBcafku8ggNjeelVh1vTDA0TW1S5bsmTDM/+iaKPHW31ac+bJ1BNue
         PMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=L7IegJ6qX2YCX5ohugIJ/L3gwh59w3A9Zm1q56QP8Us=;
        b=s/1q+nIlyOZqP1RTJk66zIabLJcF7PoyMTLdKqhzX3nxT4pY0Xmt5/dOy4RLThJo+A
         I02pUMnQ2v+e+q4itjaD3yvUH+ZOd28dDyu0qVZUqSk/dRxmmVio53k8yTe03FLqZpBX
         /0SPL+n4LchCLt/N1bmtmGD3NKHPth3rb5vMBXYw38IhJmBJ6crp3VCZ2VcwsZ7rfKXO
         1gd3BZZGXmEndu/23MDyc1CiiC0cZJEAm6GzzvAEXE9J1VMJlUVCU2iZXgWoOP0ahA7U
         ie1PcQ/og/daNwb+KaOVJq2vvZahKSUgagk70IUw2OW3BAcNuftqtWFsSsHWzDTJefgw
         aZ5Q==
X-Gm-Message-State: AOAM532To3jTjqNSYlQ64KWb80M29b2aZxa1/CpWqPB/MC5IrlRIbOig
        lf3Nyr8DPFcsQgwlyUjx8Jw3C+7lz7l0YIwO
X-Google-Smtp-Source: ABdhPJyk6j6we4xuGkbxTUTxW2vyQXLNKttrP8Fp9qtLFGRB+HdmvaCuEDhr2XvACOWmKAb8qDIpyA==
X-Received: by 2002:a63:461c:: with SMTP id t28mr6287381pga.171.1638792490693;
        Mon, 06 Dec 2021 04:08:10 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i193sm11970910pfe.87.2021.12.06.04.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 04:08:10 -0800 (PST)
Message-ID: <61adfd2a.1c69fb81.5a0f0.2837@mx.google.com>
Date:   Mon, 06 Dec 2021 04:08:10 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-12-06-v5.16-rc4
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master igt-kms-rockchip: 1 runs,
 1 regressions (renesas-devel-2021-12-06-v5.16-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 1 runs, 1 regressions (renesas-devel-2021-=
12-06-v5.16-rc4)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-12-06-v5.16-rc4/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-12-06-v5.16-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      8feef3cda1f4673737514cb20366eeeb69cc0be2

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  8d0fb9b3f225183fb3276a0e4ae1f8354a3519e8
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  bf11f87c27ad1cec3e60bd31c23080d19aa093f3 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/61adee78020f08fe701a9495

  Results:     79 PASS, 15 FAIL, 141 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-06-v5.16-rc4/arm64/defconfig/gcc-10/lab-collabora/igt-kms-rockchip-r=
k3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-06-v5.16-rc4/arm64/defconfig/gcc-10/lab-collabora/igt-kms-rockchip-r=
k3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20211126.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
1adee79020f08fe701a953b
        new failure (last pass: renesas-devel-2021-11-30-v5.16-rc3)

    2021-12-06T11:02:28.657535  <8>[   44.918743] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dinvalid-set-prop RESULT=3Dpass>
    2021-12-06T11:02:28.665001  <8>[   44.930552] <LAVA_SIGNAL_TESTSET STOP>
    2021-12-06T11:02:28.701727  <8>[   44.966167] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2021-12-06T11:02:28.724440  <6>[   44.988498] Console: switching to col=
our dummy device 80x25
    2021-12-06T11:02:28.728288  <14>[   44.995137] [IGT] kms_setmode: execu=
ting
    2021-12-06T11:02:28.741564  IGT-Version: 1.26-gbf11f87 (aarch64) (Linux=
: 5.16.0-rc4 aarch64)<14>[   45.000237] [IGT] kms_setmode: starting subtest=
 basic
    2021-12-06T11:02:28.742125  =

    2021-12-06T11:02:28.743918  Starting subtest: basic
    2021-12-06T11:02:28.748412  Testing: basic 1 connector combinations
    2021-12-06T11:02:28.832024    Test id#1 CRTC count 1 =

    ... (72 line(s) more)  =

 =20
