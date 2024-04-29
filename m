Return-Path: <linux-renesas-soc+bounces-4935-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 498D18B588F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2024 14:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B527B1F24022
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2024 12:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B74132F29;
	Mon, 29 Apr 2024 12:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="YMO/MRBc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB23C157
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Apr 2024 12:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714393881; cv=none; b=OmD72XptdAwn5fkbi3NK1e3bp3FCOCGZ3DdrEkS2ObEFL7Krk5Rn2U7T//r6QVDQ7YSgVS8G2wAta0Fv9kU7+iO1+6UpF2Q5VdMB8pdMS99g6dr/5zacUGqzVx2hf8aeeLz7jRKhL2hXlqWMsiwvwtMmbnE04cZuXmdqH3Z8kq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714393881; c=relaxed/simple;
	bh=RbihemrPQ3d8X0qu4kaD+IyVfGevaBWM8rso60R1q2k=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Uq4QEvO4ZvfIcJVe+W+D2jzlURKjtxiE8+8AMcw8B/dZNIDBrTSPcu6ro1qtl1tPTwGFX7lb5wZeChr9JCX/HMVAFJZo3jOn4eXrElGSUuhAamLXuBgo+uvwsbyMgWCZZm52yezO9D4svY9k9rxqbzG9DhlUQimFQ3tvuRoFe1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=YMO/MRBc; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2a58209b159so3603669a91.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Apr 2024 05:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1714393879; x=1714998679; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zjYSNx+yXhIPqzl3NgqX2JSxY3XU3PjRL5pL1CtQ2DA=;
        b=YMO/MRBcucEc4KVZTDMP7L0Aic6WT158QOPYok/Y167KwVSuX2m9b2FdWcUnnCMW5x
         W4npYAU+czA3SJI68Ps/S2w+RKP5wq+0NxoET77raea1siUXWZZg2wUD8nnDbzfORFuN
         H4SfvF7njMa80mrMCLAYS/ULp/FWvM6thn2KXeEmvVxQeAtVyHiKtmDptBAVus+B3/ZI
         Ieke8obpwwcfdO6cM3hOdLPzOZqMXu0/6LXlzQEICU1GkCdDW2WETKtqt3CrVfW++1hR
         I4cf66Y0a8MdwYvBX8d8z9xGCa3hyVtW18Fjp1Mu0VPXLlGyw9uydfz2c80ceUi08eFS
         zoOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714393879; x=1714998679;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zjYSNx+yXhIPqzl3NgqX2JSxY3XU3PjRL5pL1CtQ2DA=;
        b=DDzxJO6m/tdCxbZGR8lbHAqbWSmyZSy2FsAp5tAjUk65m5tl7Fi0u2LjgRSf3BO47Q
         bCknvDS42jOdL7Lj3b8osjIPx9XEvmcNCcIlKzJW7rAueuevGoACdS+iLiUFFd0G4d+r
         SXbnqlblPnm31IO0FH6150qDRoBBYxwpb2rYrcVT+g+otr3s1vOc9LbfATZYeRHd0HcG
         5e+QekBGqiTBJJzJ+VX4GMhrlDcvQvbmoE5UW1nlggvA9/M6KKoqyOfeiowAciZ5hTj8
         RDuAmLuJb+O6XbfrEq8TyUYhk1d8CEgfOMDsCAOk/QkufMjhQxNXwCw1FIZ4ryiQfFBG
         llKw==
X-Gm-Message-State: AOJu0YwPcS9lRs88wgPlnXbv4+5dUNXymK3K5TpBVFANUJJat75Vam0l
	1vvFGWxftZYcwC3W1c7vFmj7BImv9vr4v2ZmdXlE6HAKokW49spaRoP2CySng3DjB1xS5SNsz5k
	Lz8Q=
X-Google-Smtp-Source: AGHT+IEb2rCWGriS2FlQRCg+W+fWIVvQ6yi+Jj7+9yhJBHuUcqjHzRzbPG2fK0sXUhSrPRH0oW/Tcw==
X-Received: by 2002:a17:90b:3d4:b0:2a6:1625:368c with SMTP id go20-20020a17090b03d400b002a61625368cmr9070206pjb.6.1714393874488;
        Mon, 29 Apr 2024 05:31:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id gn5-20020a17090ac78500b0029f349cc253sm20726024pjb.54.2024.04.29.05.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 05:31:14 -0700 (PDT)
Message-ID: <662f9312.170a0220.ea70a.809b@mx.google.com>
Date: Mon, 29 Apr 2024 05:31:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2024-04-29-v6.9-rc6
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 64 runs,
 1 regressions (renesas-devel-2024-04-29-v6.9-rc6)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline: 64 runs, 1 regressions (renesas-devel-2024-04-29-v=
6.9-rc6)

Regressions Summary
-------------------

platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-04-29-v6.9-rc6/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-04-29-v6.9-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d55c1249af5add856fe96d2f7d3dea96fa61e285 =



Test Regressions
---------------- =



platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/662f64ef03cf90acc74c42e1

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-04-29-v6.9-rc6/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebon=
e-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-04-29-v6.9-rc6/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebon=
e-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/662f64ef03cf90ac=
c74c42e6
        failing since 6 days (last pass: renesas-devel-2024-04-02-v6.9-rc2,=
 first fail: renesas-devel-2024-04-22-v6.9-rc5)
        1 lines

    2024-04-29T09:14:09.948533  / # =

    2024-04-29T09:14:09.956494  =

    2024-04-29T09:14:10.059731  / # #
    2024-04-29T09:14:10.068561  #
    2024-04-29T09:14:10.170669  / # export SHELL=3D/bin/sh
    2024-04-29T09:14:10.180534  export SHELL=3D/bin/sh
    2024-04-29T09:14:10.282319  / # . /lava-1126181/environment
    2024-04-29T09:14:10.292022  . /lava-1126181/environment
    2024-04-29T09:14:10.393863  / # /lava-1126181/bin/lava-test-runner /lav=
a-1126181/0
    2024-04-29T09:14:10.404384  /lava-1126181/bin/lava-test-runner /lava-11=
26181/0 =

    ... (9 line(s) more)  =

 =20

