Return-Path: <linux-renesas-soc+bounces-3018-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF0285C7D5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Feb 2024 22:16:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7279928462D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Feb 2024 21:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44A84151CFC;
	Tue, 20 Feb 2024 21:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="nyc+/m2h"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB19776C9C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Feb 2024 21:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708463806; cv=none; b=HWsBkN9oSjm0eO+sR8BPvpQ3XjQZNthn4Z2gbibsQ3/OVtBhY4HXf9CQEEO2yHlRa8MClNS0IqWfGCm2rCXHTvxUkkB5ZiAKd3iL+qpj7RIcplqeyI//9N5TXfpV+uXOa2yewtqsqrOBAhkq4E7mcy5XY64nEApYSu4muZg6qjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708463806; c=relaxed/simple;
	bh=z9u4rTPmZiWbQGA6ThexUyYsR8CwR2r3vRnUmJfPmEQ=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=lNyUmVH1uukIivCr1JMUJvkfkFMcGs+MEYyorJ0p02NnPeOJicPlCUdIyVXycg02RX4SRAhmV9MCvzTTlnDr5dNlm4UmkHhY2/kZX9W6PUGwTbnA9UkC3BfQ/3tsENsy/9CBT6OJEvYTwei/incygQFlRgMmfyY2corncCgPGJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=nyc+/m2h; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6e45d0c9676so1847756b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Feb 2024 13:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708463803; x=1709068603; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=I6NE/kKlByl7n9nLkFmdBdhf2Y9aO3YD8dGQAKvcCXg=;
        b=nyc+/m2h9zqPcN7IFayK0IR2elvIh+5/7bvyN0/lW9nDG9/Ks2bhFR3JYw44cYRDn3
         ZHs6+JWt3EWdZMKwQGYmPfyqid+yPShUkQB9w5R/nAbfpntqlMOSO6WcBpOEXi78VSNY
         G0dEPegLEGAGmcKd0Ppl4/EeklAjnVTW7ye2C/7G3khR0MAirCI9ETVRRlOps0VB6q7l
         GrxTuwPbg/nRmGS+9WOuwR1Gcd7gHqm2ya7TtP0NFUfTlcJUOiHrNyt/db7s2eq9/TGE
         vtVGkc2uvjqkbKcJ4xGfbEG5CeMBOzmNyA25ffEapMhi80jXRjNX1PEPs6jHC3ifCnU0
         Z8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708463803; x=1709068603;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I6NE/kKlByl7n9nLkFmdBdhf2Y9aO3YD8dGQAKvcCXg=;
        b=JK/GatqcvMY0g3QuQ2H3Ikpg0gtWLAPpxtTv6GKF9oBig0qL6PeK797/b8lYNF3r5f
         NZUsHEXBZP4LgqWOOSY98duIGTxR9BvnmQhXyvDiooWDwp4e+9tgweL8KAI8hsoIGLkM
         4UK9oY+mWM24Zgc2whC7ekFWRbdl3Ydf66+ym+TCwmp9Ovf+gh6V/dPc3MYh0hQ8yqf2
         QFmUil5+L/iUW0i/CmZg1FgG0uISVWTmbZCmqmj4ndTus4u5U1dNSaLSSg7Ypn61BfyM
         OH+XwPNvcEWK98fI3enn5CteowZQs5uSP7shSss3rRduWoRjx4b2I8iWkVMS1s7rJ/rk
         C5gA==
X-Gm-Message-State: AOJu0YxAqn62tntpL7ev7MQ1E2quSW32GkyRhty06ndKS7scP2gpiRNF
	SkVm7O+HvJoorwBRmijo0Wz/4Sr5hnzMaG489+SflSRRywb+NcYRFdaYRjlKSAM8gsMPrMDl50z
	/xZU=
X-Google-Smtp-Source: AGHT+IHgIB2Quamir818CMyIJYTj4SCk7ShEom6023ihIOmmBUAXH1WZcKVway1SAfCf5tNW3lsQMg==
X-Received: by 2002:a05:6a20:518a:b0:1a0:6bcc:3ed with SMTP id j10-20020a056a20518a00b001a06bcc03edmr17262855pzf.3.1708463803536;
        Tue, 20 Feb 2024 13:16:43 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id bz3-20020a056a02060300b005dab535fac2sm5953398pgb.90.2024.02.20.13.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 13:16:42 -0800 (PST)
Message-ID: <65d516ba.050a0220.4ad5.143a@mx.google.com>
Date: Tue, 20 Feb 2024 13:16:42 -0800 (PST)
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
X-Kernelci-Kernel: renesas-next-2024-02-20-v6.8-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline-nfs: 22 runs,
 2 regressions (renesas-next-2024-02-20-v6.8-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline-nfs: 22 runs, 2 regressions (renesas-next-2024-02-20-=
v6.8-rc1)

Regressions Summary
-------------------

platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
imx6dl-riotboard      | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig     =
     | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2024-02-20-v6.8-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-02-20-v6.8-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      0c096fb42ae57ad9733eb6c0e0ba8b1d856ddfc3 =



Test Regressions
---------------- =



platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
imx6dl-riotboard      | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65d4e62a4110ac46a06370ea

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-20-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-nfs-=
imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-20-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-nfs-=
imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
240129.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/65d4e62a4110ac46a06370f3
        new failure (last pass: renesas-next-2024-01-22-v6.8-rc1)

    2024-02-20T17:49:04.563809  + set[   28.194440] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 1026159_1.6.2.3.1>
    2024-02-20T17:49:04.563952   +x
    2024-02-20T17:49:04.675455  / # #
    2024-02-20T17:49:04.776574  export SHELL=3D/bin/sh
    2024-02-20T17:49:04.777033  #
    2024-02-20T17:49:04.877718  / # export SHELL=3D/bin/sh. /lava-1026159/e=
nvironment
    2024-02-20T17:49:04.878130  =

    2024-02-20T17:49:04.978853  / # . /lava-1026159/environment/lava-102615=
9/bin/lava-test-runner /lava-1026159/1
    2024-02-20T17:49:04.979436  =

    2024-02-20T17:49:04.982267  / # /lava-1026159/bin/lava-test-runner /lav=
a-1026159/1 =

    ... (12 line(s) more)  =

 =



platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig     =
     | 1          =


  Details:     https://kernelci.org/test/plan/id/65d4e5f9f8565f5c1863701a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-20-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kbo=
x-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-20-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kbo=
x-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
240129.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65d4e5f9f8565f5c1=
863701b
        failing since 29 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1) =

 =20

