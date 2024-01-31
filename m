Return-Path: <linux-renesas-soc+bounces-2173-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B57F844779
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 19:50:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B014EB21EC6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 18:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F25E720DEA;
	Wed, 31 Jan 2024 18:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="HBD1z81p"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305D2CA7F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 18:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706727039; cv=none; b=mE168eV49qCrh8MaEHZz2CuLjJta09u2JD8KpdUNEOB4TqO4Yyp4sUjCXPaHjIif8yCtaLTsMY6Ciz3W5JyHo9v21Tll3rAr5s4KBjbM1rkoYcvHg+KX2LcNV+LwzuV78wIOtb72h2/9EKKHTdUegIFi7DJZL9n4/7LEuWTNJMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706727039; c=relaxed/simple;
	bh=4Q8HcwgsLb0u0+mAtSlvJK3dX3LuVmrMp93vx9F4W3Q=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=nU8vS0wKg3j1pa7drGlG3/bAa5p3UDA/VoqpRsBNUT1gC0TUblor595r1/xv5A/Yvxb5TRrjTOqYLBx4YZ3lO1cpi0i7egJX2EOY18HONDCJ+D1sXilyUz0gnQXmXjzzfLnlsO5I19M4J9p8Kucz/juIVhMBE09v1Og1RW5QmvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=HBD1z81p; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6ddb807e23bso41391b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 10:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1706727037; x=1707331837; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XjugOkwGfUBGHKJ3GvInjUoR2oIBKd3IY51NphNZjqQ=;
        b=HBD1z81pbi8HDDflDJB5MeQ1Y/or/PpVIMZ6HKnF9rMKzN1jam5IVWbxXwstWCY6LF
         es3UHJu//Q+RvdzmHiBlx5sTC/bEFWiK2tX1aFogl5EURNz2411bWjbkj0EuwymgRdNI
         iyfF+fVMcDRj7EycHaRVXkxyAwFkegRzB0ZCKWFwRWni15PxX92lPjvECRp36Iy67xYA
         f9XLHopJIukmoOexCOVAQcw9TLzIwQJDvCU47XECKkeOhL3zyrjVL5qQUHCYKV7Een26
         WJ13fByQ6fL8xxvm4RvDkUm/m9YVipTFFC6o/kAh2ajIqYLz1Bcyh5xd9fjt4tM2bPwR
         Savg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706727037; x=1707331837;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjugOkwGfUBGHKJ3GvInjUoR2oIBKd3IY51NphNZjqQ=;
        b=TG7ldeTLy6/Txc+Nw5YPBhWWWdzAhkPFdvDuoKXH2zWsZxcyjVURoQUMI7j3rCCcB7
         HHLgeD6SihKHu8ynDIul6Yp72jJX309h5BjlQAUN2ZctKGd3c5Ggva8o3AUf5FFPhVz8
         RIVztzQDMkQaRiYCrUlznYwoX+GnVdJ1nxF9pETVdGnyt4RsNHweDOE1bb4oN+zeKBbg
         +49iEwJzZZQdGqzBOa1L7Ff5tjVRf/tqB2ge7c0ocey66Ne2lPVPzUrFg7No8pb4cDet
         SRkPyj9ZureAHjkqBz7s2ipOma5v5idhwlqH/U9lmvadU+I0RoZ3FZo0WfNrTecNptPf
         RwFA==
X-Gm-Message-State: AOJu0Yw9l1phcrJGTAeFOP3AvAB4EQKYLxAsvlBQu+0ZIdfT5ibKn0Om
	fwY+gbE/ssPVJ8u2w0Nv/Qqh1Uh6rSzhvrRnDUwz7Cze60giW0AOXfTirKGYQcfoBShxlDmRyZT
	n
X-Google-Smtp-Source: AGHT+IFA68RTF+gOhGySnPxHLCaG1HiTlLCMnjg+dJnUZBOJf/jy/pdl6VoPkZDhfXylbvPjCfLjxw==
X-Received: by 2002:a05:6a21:3403:b0:19c:a0f9:4f87 with SMTP id yn3-20020a056a21340300b0019ca0f94f87mr2215672pzb.9.1706727037029;
        Wed, 31 Jan 2024 10:50:37 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXXZg/n2jTq6fT7Egb32yRTH09CwfR8TX/qCVuYKjD7+VYC8lUMk+sXfPVsZ50CPAoDdEGYxBSbwn/UGMB7jGRDyyMcBMpbsjEEJA==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id o10-20020a056a00214a00b006dd79bbcd11sm10203608pfk.205.2024.01.31.10.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 10:50:36 -0800 (PST)
Message-ID: <65ba967c.050a0220.cd9a6.0702@mx.google.com>
Date: Wed, 31 Jan 2024 10:50:36 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2024-01-31-v6.8-rc2
X-Kernelci-Report-Type: test
Subject: renesas/master ltp-ipc: 8 runs,
 1 regressions (renesas-devel-2024-01-31-v6.8-rc2)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master ltp-ipc: 8 runs, 1 regressions (renesas-devel-2024-01-31-v6.=
8-rc2)

Regressions Summary
-------------------

platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-01-31-v6.8-rc2/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-01-31-v6.8-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      7d7dc8c44825e8fc58f8d9e23b06b9b82183fd67

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


  Details:     https://kernelci.org/test/plan/id/65ba8af320e789d74500a053

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-31-v6.8-rc2/arm/multi_v7_defconfig/gcc-10/lab-cip/ltp-ipc-beaglebone=
-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-31-v6.8-rc2/arm/multi_v7_defconfig/gcc-10/lab-cip/ltp-ipc-beaglebone=
-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20230623.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/65ba8af320e789d74500a0=
54
        new failure (last pass: renesas-devel-2024-01-23-v6.8-rc1) =

 =20

