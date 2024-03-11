Return-Path: <linux-renesas-soc+bounces-3679-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C61877E95
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Mar 2024 12:04:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A17E72811C3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Mar 2024 11:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E1317578;
	Mon, 11 Mar 2024 11:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="rDTLuO1o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFB536AEF
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Mar 2024 11:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710155059; cv=none; b=nPTVtxOCftKNQ8XoSIhV9ynvujWgozsKbLfBT2ItrAKTxd3kraLngoUWs8HjOy9Ljsl0d1cf691haEI3pmTFSrlVufLdAbBnkwjgEv7tahB6g9tD9utTPg3MnI2Eh0gci6wrE4DeB6f9VuC3eZrW1oc8pMaAvfN5xutRfOyx6eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710155059; c=relaxed/simple;
	bh=I8FLot0dNHhEd9qf6LWqWFb2FBnkwnnksUtts3xYLtc=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=kXvCznLwyDyDxhgfrCEnAEk0nvfanCtMFIxUE9kpMn6hEvkiPIKv8vbSyg6J2pRfzC0Se5ZeW6oQ05Y96JdyDFkBKfWaYx7wNY+wwl1eUKBJwJCciqL+e8btSeLhmUKzar/jETg/ZMfMOLNND7dI50z/3ed8q69P6PYHZq4kp4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=rDTLuO1o; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1dd955753edso7785175ad.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Mar 2024 04:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1710155057; x=1710759857; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/adXJI12UNBYLMTjOwh/wfOrcNZ9kXohVdbqRAhfC5M=;
        b=rDTLuO1oIMbU/VpMlH+5UXD4TkHb7YQvHb1j1Ctf2iXKrU/Qwq5waU1EX051N4Acoa
         /8YGnt1BZmuEuPRdHLutUfHKD9h4NXje5EHniCrWOlgsSMUhJeO8/eX+19q6xLIxGtxL
         MbDC0PCGO7N8zf/5S920gIi4Ut+ZQwXv+Z7+vOmmjQv/M5w5niAkMeD7T+vbLv7u9RvD
         45a23jVUpzK0GDUUoCbuzEFC01svwFtZEfmHbA507qIffsdyNeSaB1dOh0nnFsh+9XFZ
         GEfoTe5wVU9lXgJdmuyEGtaooZgnSCrrL2uxZ6HgLOFfnGkQ/NkhXznNkOLFPKYXxe93
         7kVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710155057; x=1710759857;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/adXJI12UNBYLMTjOwh/wfOrcNZ9kXohVdbqRAhfC5M=;
        b=fQyzqXs67o8MUseHnskxIl+wX3VhBnPaaT2uoFPajPNLKKTelnr607d9yl/j3oMTK9
         muVj5uZRihZ2HvfgVxv7eI3mHJJbdzlZhCuxcWtdUrwMnNxelgbE+s0x4t/OKHoq038O
         EQOSHYtrTg8DNP3Uca5VFCCStue3047jkxxJIE3KR9hw8oxUNkcHw7XptnYLBIOKAH+D
         ++rhh1AWNXKscj0QfALDaMGOGzSApUdKQEHBEUGkFNIZYPbUybO/kwOzpQu1S0EA+rk+
         rswpUYsdQPgA8hU2FMOlEwXJWQclrLBBm7kraR+m2UFD8AQNu6cDenkqVstH2bmsVZXv
         FCxA==
X-Gm-Message-State: AOJu0Yw76OxeUcYMBBidgO8jon3aC2sNKdOfPb7sOaq4eP/NYzxOdxxk
	ZlTxZD7tKcwlVDlokDQ0BsCymW9DzRO1+b/Im0+UzGAhP8WukiviVKvfWvHEHfpr9SEjgIRhm+j
	aKuM=
X-Google-Smtp-Source: AGHT+IFRSUev18v2RKw7VD6o6elHkGPdSfnCAtPYx6ZVd57gjYd7UHtI7SFODYjJ4uIf/M5F4v73wA==
X-Received: by 2002:a17:902:ea01:b0:1db:cb13:10f1 with SMTP id s1-20020a170902ea0100b001dbcb1310f1mr7051885plg.19.1710155056601;
        Mon, 11 Mar 2024 04:04:16 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id b21-20020a170902d31500b001dcc2951c02sm4405952plc.286.2024.03.11.04.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 04:04:15 -0700 (PDT)
Message-ID: <65eee52f.170a0220.7ad14.a272@mx.google.com>
Date: Mon, 11 Mar 2024 04:04:15 -0700 (PDT)
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
X-Kernelci-Kernel: renesas-devel-2024-03-11-v6.8
X-Kernelci-Report-Type: test
Subject: renesas/master igt-kms-rockchip: 1 runs,
 1 regressions (renesas-devel-2024-03-11-v6.8)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master igt-kms-rockchip: 1 runs, 1 regressions (renesas-devel-2024-=
03-11-v6.8)

Regressions Summary
-------------------

platform      | arch  | lab         | compiler | defconfig | regressions
--------------+-------+-------------+----------+-----------+------------
rk3399-roc-pc | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-03-11-v6.8/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-03-11-v6.8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6e60eab20a8f0eebadd576a31d449c6b503c4013

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  75254bf2390c10644ffb35a90fc8f18f196f9f0c
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  0830aa737c4447599d9cd5cf3d2c759e8fc73569 =



Test Regressions
---------------- =



platform      | arch  | lab         | compiler | defconfig | regressions
--------------+-------+-------------+----------+-----------+------------
rk3399-roc-pc | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65eed98b7a56dc7cb74c436d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-03-11-v6.8/arm64/defconfig/gcc-10/lab-broonie/igt-kms-rockchip-rk3399-r=
oc-pc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-03-11-v6.8/arm64/defconfig/gcc-10/lab-broonie/igt-kms-rockchip-rk3399-r=
oc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-ig=
t/20240129.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.login: https://kernelci.org/test/case/id/65eed98b7a56d=
c7cb74c436e
        failing since 26 days (last pass: renesas-devel-2024-01-22-v6.8-rc1=
, first fail: renesas-devel-2024-02-13-v6.8-rc4) =

 =20

