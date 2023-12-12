Return-Path: <linux-renesas-soc+bounces-926-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 478E680E5A1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Dec 2023 09:13:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8C9A1F215A3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Dec 2023 08:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A22AD1B271;
	Tue, 12 Dec 2023 08:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="u+ZSmU0M"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2960CF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Dec 2023 00:12:43 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-5c66418decaso2598183a12.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Dec 2023 00:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1702368763; x=1702973563; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UDxlPZCXZwKbJgIYo8CPOe6rYVlMlUcLuVPJRyyWVEE=;
        b=u+ZSmU0MryX3cGrk3y61WAGscKAK2Shl+KzBYZN+PatAeTrvZJOO8Q0lvBKmOvoX0j
         TwfRwv67QZxxtjevFukEk6GkT/oKfM74gGXJjzEPmYlfYj1tswjikdHO5nukJ52gz8d2
         PRp6laNIEm818hUU4vagtATzXTU4XUGfKZApPxjlcNXU8BNzv9E1sHZ22LgYAKDFNcGl
         rj9JM5m7rVUum8FJtrivRiK5RUeobzHjSOmlTvMih5UOhQ4HV2Louu0YjI7UdNQ2RMRq
         UCQ/rqiE4nIfIPeu5DSWUhGGKg5OMtir77Eo8MrxnSVQ+jowIyIb07oxthIGCzPUvkHt
         g3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702368763; x=1702973563;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UDxlPZCXZwKbJgIYo8CPOe6rYVlMlUcLuVPJRyyWVEE=;
        b=LOOTvg2iUYA+lJ9rtaPu5fXviW7hZOEotXZIgPQWgnovCXR3PBobfePngvRqKnyhGk
         N8n19XvrOVOqisff+DJP8mDqFWCLiuKYUuTkY8Y3+UYUT5AHuxMShFWyPyCt2081U6bZ
         IbCcRbu/STmq6o23v82JKCi7o63va1UUVb6ARoWLRCGnbEeQavrkNoIrl8bgvGN9qJV4
         kREVYU09/XrbP89fFpjQ3WpDvADPj8hXl/nRZ5N/ym4GWjtdE6SywcmfH8sTk0dqtxRo
         ojklK7RZrynBXtMFNVnJoPvGhVIEg92Fi5yT5qViTa0K9zBkxP8A6idZHoRm2A4yX+d5
         XJgA==
X-Gm-Message-State: AOJu0Yx/X2v9cG5dL4MRYsyYuOVocdKjbK6hS5R6w4W7R47DbJySMpKE
	mzGIP7E7GI4cIrV3xKziOQeUn0rX/+wgMYePWpTodQ==
X-Google-Smtp-Source: AGHT+IEBLmRMSGIzZpvd9BrxmmgEqRNH5fx1/ZoSNSIQzryuJ8aI0F400J4AP5jogoArsZGwzLqfpw==
X-Received: by 2002:a05:6a20:1012:b0:18a:b5c3:55db with SMTP id gs18-20020a056a20101200b0018ab5c355dbmr2412544pzc.50.1702368762732;
        Tue, 12 Dec 2023 00:12:42 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 11-20020a170902c20b00b001ce664c05b0sm8015849pll.33.2023.12.12.00.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 00:12:42 -0800 (PST)
Message-ID: <657815fa.170a0220.27d4e.73a8@mx.google.com>
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
Subject: renesas/master baseline: 61 runs,
 1 regressions (renesas-devel-2023-12-11-v6.7-rc5)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline: 61 runs, 1 regressions (renesas-devel-2023-12-11-v=
6.7-rc5)

Regressions Summary
-------------------

platform         | arch | lab         | compiler | defconfig          | reg=
ressions
-----------------+------+-------------+----------+--------------------+----=
--------
beaglebone-black | arm  | lab-broonie | gcc-10   | multi_v7_defconfig | 1  =
        =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-12-11-v6.7-rc5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-12-11-v6.7-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      155846af5700613427ba8c67ea1841fdeffe7b96 =



Test Regressions
---------------- =



platform         | arch | lab         | compiler | defconfig          | reg=
ressions
-----------------+------+-------------+----------+--------------------+----=
--------
beaglebone-black | arm  | lab-broonie | gcc-10   | multi_v7_defconfig | 1  =
        =


  Details:     https://kernelci.org/test/plan/id/6577e60140cd0dc3f3e13530

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-12-11-v6.7-rc5/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-beagl=
ebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-12-11-v6.7-rc5/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-beagl=
ebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6577e60140cd0dc3f3e13=
531
        new failure (last pass: renesas-devel-2023-12-04-v6.7-rc4) =

 =20

