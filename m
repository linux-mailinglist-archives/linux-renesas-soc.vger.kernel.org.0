Return-Path: <linux-renesas-soc+bounces-1230-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB6D81DAC1
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 24 Dec 2023 14:02:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3670A1C20CE2
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 24 Dec 2023 13:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8750B5663;
	Sun, 24 Dec 2023 13:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="FWKRdUJ+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5E4566B
	for <linux-renesas-soc@vger.kernel.org>; Sun, 24 Dec 2023 13:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-28b6218d102so2485419a91.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 24 Dec 2023 05:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1703422970; x=1704027770; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YAEtO9ar7Sy8oSs8kY/BFskOkuHatih1S0UFegsfGPo=;
        b=FWKRdUJ+iyL1AR9g4jBXP/w0c1NqQyooZT6swrP/u+jRNF6d0Cgq1EA8D6IZH2J8qG
         x9Ox8AKy2qW+0h17bBG7cQ2zGK/eC+Ms11R2GpmPnpgTrJjv9rkFxXofzSGzmEyhrXH3
         XOuICgTr4qeHj743piZEmo/wmHhp6krthmMm0Pvm2PojmU+d9OCFJo3YXdM8JRFa6YIL
         R9MEzqYDZIISwTGcpBY//wN11kmp3Mnb1yRqk1//zduDVVqnWuyMOPfcOww7hr8wobhh
         fRGUJkhCjTEZhYp+geFsT+N77QFr14109JT3Ref6BXPXzxNOJauKMBNHe0JR/b8SnIZu
         gSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703422970; x=1704027770;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YAEtO9ar7Sy8oSs8kY/BFskOkuHatih1S0UFegsfGPo=;
        b=u0E7+03AE4UoAlXNr6YAkpsQn1UixoT7Bi7/86gNb5K0pwIt8CHJZPQPt8r6SxpGUL
         i0kdhiPzcB90FdOPLLN3wTqFqMoO/r1v1NxR4zS+VlhMN8U//pTif5ymcwqs5oqSJEZQ
         36gg/QlwAmHWuRbErSPNdrCXfiHrL1pprgJT9OQ4xzj4Esp9mnqKIRSPgQqzx4MzdQKj
         83xtLuwOAieV+EWggQEuMnLzStdgEVcsyKTAVZXoHhGb4t/dz0XxW1pQNtMp1GKgzwhI
         gMI9V13jrA2bVDGn6daefFIm1AIEOMmscExvB9as2QfMoXuZ9/0LFO1TbT2sI3EfhNpz
         PF2w==
X-Gm-Message-State: AOJu0Yz2+bsHW5LnLybX46BC6LI6p6ArzBliBQtwxNtR/YG/u0FuMvhI
	Octr18xYTisa6fBYP52gG4XjBbICSM0fCj1/FBxdSFG8MZs=
X-Google-Smtp-Source: AGHT+IEWwkuco76/s4irvDkAvoA2QJXInzZP8buJ96WtggyPLZoN71uZqxPkkaSCuNvpjCz8ksv08A==
X-Received: by 2002:a17:90b:1244:b0:28c:3e39:2191 with SMTP id gx4-20020a17090b124400b0028c3e392191mr553102pjb.62.1703422969804;
        Sun, 24 Dec 2023 05:02:49 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm4954161pjb.33.2023.12.24.05.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 05:02:49 -0800 (PST)
Message-ID: <65882bf9.170a0220.bb62d.d690@mx.google.com>
Date: Sun, 24 Dec 2023 05:02:49 -0800 (PST)
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
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2023-12-24-v6.7-rc7
Subject: renesas/master ltp-ipc: 7 runs,
 1 regressions (renesas-devel-2023-12-24-v6.7-rc7)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master ltp-ipc: 7 runs, 1 regressions (renesas-devel-2023-12-24-v6.=
7-rc7)

Regressions Summary
-------------------

platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-12-24-v6.7-rc7/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-12-24-v6.7-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      db69966489aabddb179fc8aced341e2a4283c272

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  3f0b2176930cf15a26597e28abf4356050136bbe =



Test Regressions
---------------- =



platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/658820cc3b696b0631e134ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-12-24-v6.7-rc7/arm/multi_v7_defconfig/gcc-10/lab-cip/ltp-ipc-beaglebone=
-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-12-24-v6.7-rc7/arm/multi_v7_defconfig/gcc-10/lab-cip/ltp-ipc-beaglebone=
-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20230623.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/658820cc3b696b0631e134=
ed
        new failure (last pass: renesas-devel-2023-12-18-v6.7-rc6) =

 =20

