Return-Path: <linux-renesas-soc+bounces-3678-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B197B877E94
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Mar 2024 12:04:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E316F1C208EE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Mar 2024 11:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46888381DA;
	Mon, 11 Mar 2024 11:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="o23a738s"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D6717578
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Mar 2024 11:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710155059; cv=none; b=p62XkFimGV+VZnNmqcyW9t3I9TJSjqtk3EB+4av5U6G+sJ9aAKTZcFwmGTyH21lRKxy5G+4WwXLZvqbRxONV2fhD4Wy5gGhrCD89HyvSfJ+BY3F0I/QxtgduHaxpNa36ZMmnoc4muGJtANVtEBfVapsFfEgTCMr0lPf15026EBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710155059; c=relaxed/simple;
	bh=93G4yp3KBsmyAVT6dHOIQW7jnxJPbmafVWk+MDCan5I=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=hPT7837rVW/l10RoNJVCJrUGqgsBsgAzWzLO82QeFV3a0iFTPNQvNblj/oJrlmPKq9vL/qCjWFbTcksmQr1GHGdsfekg4tPYh4T0FK6UP/igabamjHMBxm+IvP4YXK81D3nzvh6r4j/k6ahuJafnbg1uKqToxCayvtkqE6oYlOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=o23a738s; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6e66601f082so2470881b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Mar 2024 04:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1710155056; x=1710759856; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gBFzcEyBLMTUH5pIrgmZn1OmjYFwDV6A9SUkKEqruCo=;
        b=o23a738sW8406tNQ86U57LqV2oCnz3MWHSSt7xF00AtoJidl+QyX5jlKYwFOTYO9IQ
         DIcc4SzoweLcB7BiZdus5cB/1/bCML2FF5KznyVf1vUdy16mBsqkybYdliW092FkKrsP
         0PJHbYyDLEpCYfV9YXB5ZZXg/stdYlSjhufL6NK4vlhXszpv6V+pbxFt1m4wK2S9jkxq
         rewieD0RyhedRavzsNf4Cv0eI31osWEZEOWB52CviUzoKPBNX93Dd+suf5tEIuiotGyP
         +JrGR5jSDVJhuzbkW1cKZfmuIviwzO4FKtBm6uyHQ5f8DgpL2nmLFxUTyoJo9FK0I0pD
         hayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710155056; x=1710759856;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gBFzcEyBLMTUH5pIrgmZn1OmjYFwDV6A9SUkKEqruCo=;
        b=jTcrGrk5WJC6DDu4RC41JHOhQyxnZgQXbUq6lTI0e9r5J3OZK/u8usCxXG3t5I9m+z
         gMnk45sfW7NC79Sy2VOxPMimSl1fPo0wNw7ExlPjnb5/P8p8ulsm8ICyrDF5cNHjnPQv
         TLyDItI8eieg6JspizS2iJ4TpKiCnkhg2Wp5vIn7ZEQTEmfIX6wdEbf4YUkpOdF8IWz2
         UQGBu3RZzEcNSAAp7ZZhskqybUmT1pOo6QkDwzwwFdwFpVJ0VAErH7naQCON3iVCi9/Z
         KLR/br1AXds8WdlRpwD4PHJ+m4ZLX1u+A8/Bq4Xuu9ArPGg+ph3NKPtwwgACZ+aZQ+vp
         CD+w==
X-Gm-Message-State: AOJu0YwYuip5FPgpabsXcFxYdmpKO2TpDByzNL1BRy0JQ7VerfbYhT38
	lH11K+GMlovT65a8KyBlN9K+ZND4Ck4fxL0fht/S4KpvIhTiTLZ7tj08Ky0bLpin5VNR2AfbuVY
	bjiA=
X-Google-Smtp-Source: AGHT+IHBsCvnx5OVQdrhthk80EAV9QuO3jwRgo5LuOZqVPhvYrPRztJNxn4SVGq0CnWE8vHqRqxxgA==
X-Received: by 2002:a05:6a21:394b:b0:1a1:6866:5256 with SMTP id ac11-20020a056a21394b00b001a168665256mr4839839pzc.37.1710155056292;
        Mon, 11 Mar 2024 04:04:16 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id j25-20020aa78019000000b006e2301e702fsm4058242pfi.125.2024.03.11.04.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 04:04:15 -0700 (PDT)
Message-ID: <65eee52f.a70a0220.1c7e9.95e5@mx.google.com>
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
Subject: renesas/master igt-gpu-panfrost: 2 runs,
 1 regressions (renesas-devel-2024-03-11-v6.8)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master igt-gpu-panfrost: 2 runs, 1 regressions (renesas-devel-2024-=
03-11-v6.8)

Regressions Summary
-------------------

platform      | arch  | lab         | compiler | defconfig | regressions
--------------+-------+-------------+----------+-----------+------------
rk3399-roc-pc | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-03-11-v6.8/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
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


  Details:     https://kernelci.org/test/plan/id/65eedae18fc44c81544c42db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-03-11-v6.8/arm64/defconfig/gcc-10/lab-broonie/igt-gpu-panfrost-rk3399-r=
oc-pc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-03-11-v6.8/arm64/defconfig/gcc-10/lab-broonie/igt-gpu-panfrost-rk3399-r=
oc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-ig=
t/20240129.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.login: https://kernelci.org/test/case/id/65eedae18fc44=
c81544c42dc
        failing since 35 days (last pass: renesas-devel-2024-01-31-v6.8-rc2=
, first fail: renesas-devel-2024-02-05-v6.8-rc3) =

 =20

