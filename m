Return-Path: <linux-renesas-soc+bounces-924-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4260C80E3E6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Dec 2023 06:42:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF4721F21B6D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Dec 2023 05:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F35156C5;
	Tue, 12 Dec 2023 05:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="is2tLQTh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27DADBC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Dec 2023 21:42:43 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1d337dc9697so2113725ad.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Dec 2023 21:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1702359762; x=1702964562; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6NMYXTBPX8B9YOqIFTJN3eCWbX3tbPZNdfhhEX1wwsw=;
        b=is2tLQThbpLoLh2Pe8OW0jGxwy1/e3IvCzFqsnXgQJr6a/Ivh8DTlRP45T/YGz1TwY
         lDwEv0S4YswRtj44V/XG3rhUuAzweEeOUAH2dqfVdxQJv/5WFMnHLkM8VRaA1KyH4nPB
         5mtisKYpGkF66gtrcKta0L9LpbQeVw39ECvzj+eRs+Pxk7roY687jphChYKUkUHeKFzA
         d2t1puQ8H+VTKpdETjDRS7e153liVYLY6iNxNUN75h2ZY0r0Q4hmGusqms2AE+giSeMd
         EakkZNq1MlP9TqdITKFVkpFaS+KUxyfPT4geJwTSw8Fp5O9HmarLu1synZubUcv/yavz
         YtlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702359762; x=1702964562;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6NMYXTBPX8B9YOqIFTJN3eCWbX3tbPZNdfhhEX1wwsw=;
        b=VnEWR4XA9j0pUXWFhk3xiG8GK7OIQm0lOAqkcurojPNFeSMRG4IH5IaOYQxboOgrAq
         R//PaoLSEQBESrkxEM57m98fz08oKq0MkFTCpgwrhhirsWEqtLiz/aJtrnc/eWAG2dP9
         biaexqL1fI0SQ98RpdasnAB7+99JRjaNk8Cgd2Tjjl45FQUo6lePyLEe0v0cjebT330N
         nxe39qxyxhgrYkdcx3ZDsOH/giW+Keqp9qyo/aOiN9UurtFcF2yv1199Yvojctq1HqaY
         hdAZ43AB398qitNz19/jBgoc8CGmOpmx2j5/H+/ejM6XLocA8uYOJaVMEHbSARFLey8p
         t5zQ==
X-Gm-Message-State: AOJu0YwBEf+vLhzC5X3ZHKmXPTBHah2e/znq+MAjTpkSYPrPPQzDTs4i
	69VcoCHk0Ky98QyQBKu1vSognkJnjZOHZmdBCAg0Rw==
X-Google-Smtp-Source: AGHT+IEjuS0G3MVGiqttfXpiu/3qBvqczWigY992vB1CdQb/3RQviSfIClOiN/O+X5LesAdQdHWhZw==
X-Received: by 2002:a17:902:ed01:b0:1d0:706d:c738 with SMTP id b1-20020a170902ed0100b001d0706dc738mr5147703pld.135.1702359762217;
        Mon, 11 Dec 2023 21:42:42 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id y8-20020a17090322c800b001d1ccb0ac98sm7609832plg.272.2023.12.11.21.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 21:42:41 -0800 (PST)
Message-ID: <6577f2d1.170a0220.e7a82.6a92@mx.google.com>
Date: Mon, 11 Dec 2023 21:42:41 -0800 (PST)
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
X-Kernelci-Kernel: renesas-devel-2023-12-11-v6.7-rc5
Subject: renesas/master ltp-ipc: 8 runs,
 1 regressions (renesas-devel-2023-12-11-v6.7-rc5)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master ltp-ipc: 8 runs, 1 regressions (renesas-devel-2023-12-11-v6.=
7-rc5)

Regressions Summary
-------------------

platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-12-11-v6.7-rc5/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-12-11-v6.7-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      155846af5700613427ba8c67ea1841fdeffe7b96

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


  Details:     https://kernelci.org/test/plan/id/6577eb1f3bb1a06647e134a1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-12-11-v6.7-rc5/arm/multi_v7_defconfig/gcc-10/lab-cip/ltp-ipc-beaglebone=
-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-12-11-v6.7-rc5/arm/multi_v7_defconfig/gcc-10/lab-cip/ltp-ipc-beaglebone=
-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20230623.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/6577eb1f3bb1a06647e134=
a2
        new failure (last pass: renesas-devel-2023-12-04-v6.7-rc4) =

 =20

