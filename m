Return-Path: <linux-renesas-soc+bounces-927-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9340880E5A2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Dec 2023 09:13:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E1511C208A5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Dec 2023 08:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE1C1BDCC;
	Tue, 12 Dec 2023 08:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="m+JJyj+4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C73EC7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Dec 2023 00:12:44 -0800 (PST)
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-58a7d13b00bso3109515eaf.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Dec 2023 00:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1702368763; x=1702973563; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iRFVQhBHztrNDK7e3NBCX6qCTFCSqFKoSW6edwCKgQg=;
        b=m+JJyj+4eBpGk3R8/lcyIi+s6+mnfTLwMs5YN/bYZVt2i+20qRaOmijHiTmxblCakW
         y+egVuy4B5HDdBW5DgEHX2bhutmqPUiMj/3N52V/JbmMdnAOopMvxiQUOCfRxrqTlGZm
         BuQrGlr3BGjqqHFomS1LkI0ovMmaPPYbECx/KJPg5wedsPZIm/SBVucpTfkfvlDR26kh
         XnHiZG7aqtS05FppKW4r6LsBPFKot+u/01Nhqmb7Xkye6iHoWuEELSRskucE3azehpVC
         tZR1Rz6CVHSAcYUtVpA4BIyHUKoHE6EeKAIQ7rnZ0LAnXXw3xWnGnkBFu+9ifEi6E3O+
         /V+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702368763; x=1702973563;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iRFVQhBHztrNDK7e3NBCX6qCTFCSqFKoSW6edwCKgQg=;
        b=PhMYz3axQTYyCrOnV5DS+cY4qs0XEpdy4jDJ2jxOmQZCYrSWNSMoq83zHF9wNIoB6m
         doy4gJjqUmv8u2eDWrAQ1NcwqmgP0a3xhKzqpFAtBeTE5heF6Uau3puTRFoc3xpWvgwB
         XR6uzHnJL5/0gv6h2BrHM2ysT+Yjl+EP0otsV05ep4iNliTiDIzjPCeYnk2EsyquxsI5
         5JSK/vbZWV2Ud81YJV1jHjAxT45EJGSR6/Hh1LLlPRk0+wMUmQCWXBjbp90L7+QkF3B3
         dJ8aa8vvltN4ttGPRS/D0no6s90I5xUxzp7HIUOfC8h5QkvW/dxD/nB9uVWBcVwTAWWr
         QRsw==
X-Gm-Message-State: AOJu0Yx61ODVgbzQXBqi+yab2L15JSTZ7DoV1Zca3Ho35WmEsqOjUa3i
	xegUYMJ6GDlj0TqC2lVBfn3CLwFP8NYAORVSO9wWdg==
X-Google-Smtp-Source: AGHT+IGTDzUOUpZoGRsu3pZB1rKuGSOYecU124DoH1GzeqiLqbREsdhQJWbrbXiJNz77QJljSoj8Fg==
X-Received: by 2002:a05:6358:ce17:b0:170:67b3:6d80 with SMTP id gt23-20020a056358ce1700b0017067b36d80mr6118676rwb.42.1702368763174;
        Tue, 12 Dec 2023 00:12:43 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id x26-20020a62fb1a000000b006ce48a0b7c6sm7562502pfm.109.2023.12.12.00.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 00:12:42 -0800 (PST)
Message-ID: <657815fa.620a0220.dba5f.5cf7@mx.google.com>
Date: Tue, 12 Dec 2023 00:12:42 -0800 (PST)
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
Subject: renesas/master baseline-nfs: 22 runs,
 2 regressions (renesas-devel-2023-12-11-v6.7-rc5)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 22 runs, 2 regressions (renesas-devel-2023-12-=
11-v6.7-rc5)

Regressions Summary
-------------------

platform         | arch | lab             | compiler | defconfig          |=
 regressions
-----------------+------+-----------------+----------+--------------------+=
------------
beaglebone-black | arm  | lab-broonie     | gcc-10   | multi_v7_defconfig |=
 1          =

dove-cubox       | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-12-11-v6.7-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-12-11-v6.7-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      155846af5700613427ba8c67ea1841fdeffe7b96 =



Test Regressions
---------------- =



platform         | arch | lab             | compiler | defconfig          |=
 regressions
-----------------+------+-----------------+----------+--------------------+=
------------
beaglebone-black | arm  | lab-broonie     | gcc-10   | multi_v7_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/6577e695d75c81d5fde13481

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-12-11-v6.7-rc5/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-b=
eaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-12-11-v6.7-rc5/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-b=
eaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6577e695d75c81d5f=
de13482
        new failure (last pass: renesas-devel-2023-12-04-v6.7-rc4) =

 =



platform         | arch | lab             | compiler | defconfig          |=
 regressions
-----------------+------+-----------------+----------+--------------------+=
------------
dove-cubox       | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/6577e5a9584c6e0fd9e13490

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-12-11-v6.7-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-12-11-v6.7-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6577e5a9584c6e0fd=
9e13491
        failing since 28 days (last pass: renesas-devel-2023-06-26-v6.4, fi=
rst fail: renesas-devel-2023-11-13-v6.7-rc1) =

 =20

