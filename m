Return-Path: <linux-renesas-soc+bounces-3395-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9737C86ED98
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Mar 2024 01:48:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C4BD282874
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Mar 2024 00:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C3551C33;
	Sat,  2 Mar 2024 00:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="f0w2jgN6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64E510F1
	for <linux-renesas-soc@vger.kernel.org>; Sat,  2 Mar 2024 00:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709340504; cv=none; b=Mvs+rj/fRr84g/DqpwKlpOnhgyT4s2J1R4hWb36URW9W6yl5MqWuLHyv8cAt3oURk3WQG8vB//dgvp4S/0W3/tY9jFxFcGYry1LO7aZbNsBEZwaTtLr9cZcXdPJXvQ0S1su9MZhlrWckIVecW8W+g2GMZe6RO4Xb2BWeGw303dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709340504; c=relaxed/simple;
	bh=QnCsOMluj+z+2+kf2Wv9WL9jdSkH/g3HjOJBNcLtcpU=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=FjwjZuFHVFdnuxwblJ6UAlYfaVZJAG0QSNLsY062Ope8x5cHnnpORItGob0pygaSPKULOk2+u8c+11WCwqdLsX1EKHf9T3W3K3bSMBTiteJz2clY4ddcH9PsQv+rUjwyVqvVqSHFacIbDsqmsC+CsOQqneoSEPYJY3NMq94gRoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=f0w2jgN6; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e57ab846a1so1959387b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Mar 2024 16:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1709340501; x=1709945301; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fJkHijki9wGqB5ZhuCcfLhC8p1uoP6ZtaVknFU7GZMY=;
        b=f0w2jgN6MnJCDZ9E4EG1vW5zBSmOPqKZXO4BuDC2aiv+UJwKBKIy/83FOCEOWiNXPF
         BrHm0MVHw6OpwGFWUpHdAe35lGkwq3uMmpK2p7gZxV8uN3k7tX5BLE9LY8luu68kYh0p
         FyajZKefF0oWynDodHiusqeP4ZWQIOjtRzt/nTrgI5+3IdmKCmydWGzSknRmkqbbGGOu
         KoFLNYMEM8t8zQsgSdTaf6CIsw6Cth+m/JExVxUb7GKei7L6khBpPwMla1TW6ql6Ek5X
         H5XVCdVYABaT/DI3HYaBjlrgQGBxQxne8CZtrxRgIl8/SvBi5O3gOXC3eflNED86yuJW
         TRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709340501; x=1709945301;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJkHijki9wGqB5ZhuCcfLhC8p1uoP6ZtaVknFU7GZMY=;
        b=Kggt+PnXnO+lJgNpWvFg5S4HLY2luGQipuOov/reUDmOtf46bZjYGMwghC6f628wod
         3mkl+s+C8mp3aIqygxwkhJOFxZpGDtsKyWqEvpUTwaVYM74siRJhXitgPEP7x0C2wUbY
         EbjXcnDloW14/VGv+dvhsI3laBd0HtTygDmMUWEmk5csyuocwScrEuw8Lm3v1QaR3Jiq
         bhjWtqpcJWxb91mhBXGEF3wE5Xh4a1GBHlJTHW8KT9i7kpmC9G65GE3EFiR73V3Y0T1g
         b50QcrhchgKK+bRyznp7bmBo4+WfBav8dZQxwWvB5gRjmk1vgvciyvmhzW5zwSc245sj
         6fdg==
X-Gm-Message-State: AOJu0Yx6zw4z6AU4DY/go8HuIBvhhVE96ITchkhLlRvLf1E+X/8X6x1D
	dOVftff0i/DZzJhHVxiP5r/nbMBSLBualqshoZzH3v6e2G4eJFyCOCaUfP93IbQ2boExqtLbfEg
	sKaI=
X-Google-Smtp-Source: AGHT+IE4xhcG5VCRqcRpH90OVt6Cb9+UXN3zS4d1LShR8+K2kAf6KVMTVnXrSpnZR5h9k9sk4u8uzg==
X-Received: by 2002:a05:6a00:a14:b0:6e4:1a29:732f with SMTP id p20-20020a056a000a1400b006e41a29732fmr4066798pfh.12.1709340501635;
        Fri, 01 Mar 2024 16:48:21 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id c11-20020aa781cb000000b006e4362d0d8csm3553516pfn.36.2024.03.01.16.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 16:48:20 -0800 (PST)
Message-ID: <65e27754.a70a0220.ef869.1e15@mx.google.com>
Date: Fri, 01 Mar 2024 16:48:20 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2024-03-01-v6.8-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline-nfs: 9 runs,
 2 regressions (renesas-next-2024-03-01-v6.8-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline-nfs: 9 runs, 2 regressions (renesas-next-2024-03-01-v=
6.8-rc1)

Regressions Summary
-------------------

platform         | arch | lab             | compiler | defconfig          |=
 regressions
-----------------+------+-----------------+----------+--------------------+=
------------
dove-cubox       | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig |=
 1          =

imx6dl-riotboard | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2024-03-01-v6.8-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-03-01-v6.8-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      01fdf7d6f1504ba6a93e7d8eacb27d45dc995325 =



Test Regressions
---------------- =



platform         | arch | lab             | compiler | defconfig          |=
 regressions
-----------------+------+-----------------+----------+--------------------+=
------------
dove-cubox       | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/65e241a1186eca112b637030

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-03-01-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-nfs-=
dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-03-01-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-nfs-=
dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
240129.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65e241a1186eca112=
b637031
        failing since 94 days (last pass: renesas-next-2023-06-06-v6.4-rc1,=
 first fail: renesas-next-2023-11-27-v6.7-rc1) =

 =



platform         | arch | lab             | compiler | defconfig          |=
 regressions
-----------------+------+-----------------+----------+--------------------+=
------------
imx6dl-riotboard | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/65e2418d186eca112b637021

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-03-01-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-nfs-=
imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-03-01-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-nfs-=
imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
240129.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/65e2418d186eca112b637026
        new failure (last pass: renesas-next-2024-02-23-v6.8-rc1)

    2024-03-01T20:58:43.642428  + set[   27.630584] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 1031197_1.6.2.3.1>
    2024-03-01T20:58:43.642581   +x
    2024-03-01T20:58:43.749652  / # #
    2024-03-01T20:58:43.850787  export SHELL=3D/bin/sh
    2024-03-01T20:58:43.851214  #
    2024-03-01T20:58:43.952057  / # export SHELL=3D/bin/sh. /lava-1031197/e=
nvironment
    2024-03-01T20:58:43.952526  =

    2024-03-01T20:58:44.053302  / # . /lava-1031197/environment/lava-103119=
7/bin/lava-test-runner /lava-1031197/1
    2024-03-01T20:58:44.053861  =

    2024-03-01T20:58:44.056909  / # /lava-1031197/bin/lava-test-runner /lav=
a-1031197/1 =

    ... (12 line(s) more)  =

 =20

