Return-Path: <linux-renesas-soc+bounces-1186-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B167F817D4D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Dec 2023 23:33:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 408ED1F22F4F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Dec 2023 22:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16CCB129EFB;
	Mon, 18 Dec 2023 22:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="x4B7XEBB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4711D1FAB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Dec 2023 22:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3ba52d0f9feso1674353b6e.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Dec 2023 14:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1702938803; x=1703543603; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BKGJ1aRP0pwwStnjfjxkdnKamsshTYp3dmb+oKsbgjc=;
        b=x4B7XEBB4KZ4sEf6STisHU87QR7jSfyczzzL07ZOOmVnumVL4IdfPwBLnFYbFUN2Q8
         g5UKQ5GfJykW9x2F5XkV33+GjwtjULanaRFs7GL/R89SIGqFbMbgRj4j1R6QBPfhbwrE
         wAiEP1xOyGRCqrMvHiBokAuvKpz9fPdyuYjm7U6uTKZksoxSFkfCAELWb5pA/tXnxH9k
         PuBlku38ZDWRcIOen4KvfnXT0lY7gP103A4u1m4EuZAWhKsE3EzjLJ05yiCcpOYsx4oV
         qHF+1pmOJ1a+v6byFxpNrsXON1R3UX4V3w6i4sOs7MQU5xIQ/XnMh+1YTyp+d430cUk1
         NS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702938803; x=1703543603;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BKGJ1aRP0pwwStnjfjxkdnKamsshTYp3dmb+oKsbgjc=;
        b=c24Aa4BYeOiFnpXfo+l2wLcOBuqbcPZmTkmqcPPYFPqXQ9N+tJIDn2eli3bsPhMK7u
         v8S2t5XJH+TMgy1DvsRvUkGA/tbCRZT6M7hPopm9p6UvKgMM5vlRYbojMuww9eyT0kni
         KD6f4KVFMKO0J5f4FgRUqdHaeDYTDI0P2qaQmerdD4txpeHsloL2BDwIcY5iAcdnjqAb
         3uu7gN8R+KYbs7XO2nPkXd7W15OMPIFwNpOVGISDTkSZmkFyCkV6BfnAjHlBNr9lhUAb
         vVE9SyKsxX3aOJTEK9EwvBeRocSdHQ0YpDgU4gC81cYZBCzXtN6lGw9tH5NScdCH1PWt
         N+MA==
X-Gm-Message-State: AOJu0YzeJC2Um4H3YGF4TIiPIb2yZo8Y0aifig32zMud+U0JZp523rVQ
	cymWBlEoLFtvIs/01kb7A6kQMB7JK41OjOKNzN8=
X-Google-Smtp-Source: AGHT+IFTlD+5SAkB7A8aNTK3DLNuM/zKPqROUqe+tX9BA1zWPc5bhLMmUx/PSyWAoUntlGWCuH1orA==
X-Received: by 2002:a05:6808:2dcc:b0:3ba:f4a:4310 with SMTP id gn12-20020a0568082dcc00b003ba0f4a4310mr20323573oib.11.1702938803007;
        Mon, 18 Dec 2023 14:33:23 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id w190-20020a6362c7000000b005cd8866cccesm3559252pgb.27.2023.12.18.14.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 14:33:22 -0800 (PST)
Message-ID: <6580c8b2.630a0220.1ddfe.8e2c@mx.google.com>
Date: Mon, 18 Dec 2023 14:33:22 -0800 (PST)
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
X-Kernelci-Kernel: renesas-devel-2023-12-18-v6.7-rc6
Subject: renesas/master baseline-nfs: 21 runs,
 1 regressions (renesas-devel-2023-12-18-v6.7-rc6)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 21 runs, 1 regressions (renesas-devel-2023-12-=
18-v6.7-rc6)

Regressions Summary
-------------------

platform   | arch | lab             | compiler | defconfig          | regre=
ssions
-----------+------+-----------------+----------+--------------------+------=
------
dove-cubox | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig | 1    =
      =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-12-18-v6.7-rc6/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-12-18-v6.7-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b68ca22afe86db36f59f8bfe7b72b5fbda26187b =



Test Regressions
---------------- =



platform   | arch | lab             | compiler | defconfig          | regre=
ssions
-----------+------+-----------------+----------+--------------------+------=
------
dove-cubox | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig | 1    =
      =


  Details:     https://kernelci.org/test/plan/id/65809813f51b0d3e48e135a9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-12-18-v6.7-rc6/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-12-18-v6.7-rc6/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65809813f51b0d3e4=
8e135aa
        failing since 34 days (last pass: renesas-devel-2023-06-26-v6.4, fi=
rst fail: renesas-devel-2023-11-13-v6.7-rc1) =

 =20

