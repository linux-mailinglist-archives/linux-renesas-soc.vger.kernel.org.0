Return-Path: <linux-renesas-soc+bounces-305-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8265A7FB0EA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 05:24:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BDB7281830
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 04:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1E9EEAD5;
	Tue, 28 Nov 2023 04:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="PTgAkmUc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2FF21B8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Nov 2023 20:24:41 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2858ae35246so2628381a91.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Nov 2023 20:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1701145481; x=1701750281; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g20s/zz6sPm/Q8kV1V/OpcGXyMwWuEHFvGOdLPyT25o=;
        b=PTgAkmUcq7tUl/HfwD6gGwrW//x1Ezho9OV5cQosajCiMpDsrt1ytYXr7QU5dTxLV7
         95kcuKwvy+7CxYiUce+l7rwl38r1kzzzz9IF4cnyweygpf7uWD1jfKel/JUxSLoEWZ42
         ac3vawP5d/XcDLTgOa396tG25K3J287l4+D+pbxPONRXAopC94Rb+IicQDZ3V1kUfcDV
         4pC8vfPJbVD8Mjo5J0dzv5r04lmdKZbRhOBNj99iWZIBxSVkl7EiXHyZoLCxbpsb0iUC
         SWdpo/AwtcjNMFlChy9Nl6HE0mtSX0QJYU7ooENvYp4nSxh8mRtKy1gX5CGay4gBKpFr
         2I6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701145481; x=1701750281;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g20s/zz6sPm/Q8kV1V/OpcGXyMwWuEHFvGOdLPyT25o=;
        b=VVGqa7EIloXRHeofhzxf1DkUvtGTayPHJO6aE3bqfpLHL+aNzFENBTptoNAni/m3jI
         Hi2DYxGwWmf3HClO8j/5ahb+77znAOzi6BdZYZrOk2FRfxxJX8TNIf7IcfejrgEEHKFM
         9BmX6mlu2vvrTw52VBElzUrkVq6mfo4xvKXHXdbF9wHa9CfroOf4GDMiZSAnNE5gxlf5
         +rN800IxmIGFUNVT5Mj9P62YXDC07kBTuOZtaa8h3Wi6wGiUFbc37pbbPsOPNlLwA2g1
         Z9rK55LP9u5cZWM4J2uXLUECokfeED/k9jdClzOcpOApNKm0AslJ4+m1f0HZFKP4Xg6A
         Lm4w==
X-Gm-Message-State: AOJu0Ywq3AcmnrOKgrz1Sz6YR+GUHqkWc0E8N7qFodhjb2KlyK/Hlj7R
	u///rrQ9YpQLVW9bTv4xGhLblkbqypN3+2UsPCs=
X-Google-Smtp-Source: AGHT+IHSQqjgGjY+9mzNVdBmLKAGGR3Wa9msMMpJ+V36B+NLdhX5kHIM2GKj7+wqfSOP4t0cz2C25A==
X-Received: by 2002:a17:90a:195e:b0:285:8cb1:7f48 with SMTP id 30-20020a17090a195e00b002858cb17f48mr12330885pjh.30.1701145480720;
        Mon, 27 Nov 2023 20:24:40 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id fw13-20020a17090b128d00b002839d7d8bf3sm6709720pjb.55.2023.11.27.20.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 20:24:40 -0800 (PST)
Message-ID: <65656b88.170a0220.83b6d.0615@mx.google.com>
Date: Mon, 27 Nov 2023 20:24:40 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2023-11-27-v6.7-rc1
Subject: renesas/next baseline-nfs: 20 runs,
 1 regressions (renesas-next-2023-11-27-v6.7-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline-nfs: 20 runs, 1 regressions (renesas-next-2023-11-27-=
v6.7-rc1)

Regressions Summary
-------------------

platform   | arch | lab             | compiler | defconfig          | regre=
ssions
-----------+------+-----------------+----------+--------------------+------=
------
dove-cubox | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig | 1    =
      =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-11-27-v6.7-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-11-27-v6.7-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      c11a6389476fe497dae665415cf10a42b81dcc61 =



Test Regressions
---------------- =



platform   | arch | lab             | compiler | defconfig          | regre=
ssions
-----------+------+-----------------+----------+--------------------+------=
------
dove-cubox | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig | 1    =
      =


  Details:     https://kernelci.org/test/plan/id/65653a47a12e0519c47e4aad

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-11-27-v6.7-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-nfs-=
dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-11-27-v6.7-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-nfs-=
dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65653a47a12e0519c=
47e4aae
        new failure (last pass: renesas-next-2023-06-06-v6.4-rc1) =

 =20

