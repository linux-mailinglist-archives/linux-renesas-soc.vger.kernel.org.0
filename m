Return-Path: <linux-renesas-soc+bounces-5771-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7CF8D8084
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2024 13:05:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 093192846C5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2024 11:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A8F7E0FC;
	Mon,  3 Jun 2024 11:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Z9lTOE2u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2915783CC8
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Jun 2024 11:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717412690; cv=none; b=L9yGUW0J62mg86bJ3UKdgCBVdic0id+ZBJT30egP/ZZf+BEGDSTdwE1f+RGnA3fm+QthxZ1yojiHPPNwEDzJE2NlUX/GVlZhefWICrFM5EMrI16hEVMeqKvIyh79CfsJrK0e1oRD6lDH0bBTu9yLqe1PCfb3E9FcXq/BSHU470o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717412690; c=relaxed/simple;
	bh=TWxRmdekRbNEhcI0VIO8ML1AR9lY7YJ2Yylul7HV6OA=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=mgeUsMUorxEsBToHOh7hhAgJukRB9sND/p6096E+keTJSJnUf7mjA0oj4LuRSqlK9zxWJ3Hp72g/EZEx/JaToj6ExklADyjBfErHUgBgxT2yL4WEwu7MMEMiFYryT6HTuvE3GM51UVvN5Y0UfgicBk0pKhdp212r6x33VzYohdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Z9lTOE2u; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70249c5fb36so2115511b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Jun 2024 04:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1717412688; x=1718017488; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4AXgS7gIdCfoYRjudpoTTUJ7ji93vDOR8+Q0YSNcslI=;
        b=Z9lTOE2uA+zUrBTUgKqZGHWX8ZN/WROjFV0emfNedA1Lfn/eqZBYprnmQN5/V3ayO1
         wZSLHGa3iUSjk++s2C0icaWv+CsQ8Vg4tnXSdHHYI33XW5KKLFQB+EaUNHucbGRL2Q8g
         wt169oETBje9UFf214tteqnKOMnBdA/g1VeeVx0uujjqq2LFLk52Q8saaKg0iUYOj+0D
         pK+vSsEYCn51zmWKejbiBUrHadEEvubiXFx4JbKm4RPTscBlhcNR0hMDezlw6Qr6lqo8
         y6fkKI/TcWKOIenQhM3JLVqSPOaXSwNJ/SN8xWS3nZeqAC/GYlbA04058qV9zG3AbIqm
         PNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717412688; x=1718017488;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4AXgS7gIdCfoYRjudpoTTUJ7ji93vDOR8+Q0YSNcslI=;
        b=ArX4wKjoenc4rRXX+s94LfFDvJHsFsdLvSpswMJlSKPljyIb4UYwYZ0TGkEDF3ff4W
         5XnhrWuRStlJP4ttQHk+W4r23h2ODEHiLYXWUyQvdIjnG2gcHcvTNMiRKuHuHLfnS5fP
         8BZK39GOpUkxadgz3vORzj1qBiykChD0TxSXpDc6IYwaD78oprPGBqPyCwf3W9YDJdSo
         l5PoYFeRPha2snU4LMo7nn7vIvQ+8/YBAjA3JNmlZlpvUpGs3/022uGTukwpzUg+OdwF
         x84rFGOqPaUR2e6nZBziwhLKh3n9X6XLlsENJiVV7OmDbZ9UepViqQxBTaYB52D+vW77
         vksg==
X-Gm-Message-State: AOJu0YwBdHoZEC4HLKXgLN7IDbq0BC4rcoJ4XtdfK6Gkx5RvlXK/ppYo
	tWqHtvj3mmnjbeVOt+8262ehSz7T/ANEet9tg8qLJENvUOxwycroVrase2b/RZ7vZgpYV9nFJWP
	l
X-Google-Smtp-Source: AGHT+IH8EVFByIn9VRRYOfU6aTXzVUDcgqU7nRFFbpOsV2XVhmhz5bVA2cSOD4uW+6/QKf6b0WykZA==
X-Received: by 2002:a17:902:ce85:b0:1f6:7d0c:e932 with SMTP id d9443c01a7336-1f67d0d148bmr24995715ad.34.1717412687837;
        Mon, 03 Jun 2024 04:04:47 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63241d315sm62075685ad.293.2024.06.03.04.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 04:04:47 -0700 (PDT)
Message-ID: <665da34f.170a0220.39edcf.ee9d@mx.google.com>
Date: Mon, 03 Jun 2024 04:04:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2024-06-03-v6.10-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next igt-gpu-panfrost: 1 runs,
 1 regressions (renesas-next-2024-06-03-v6.10-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next igt-gpu-panfrost: 1 runs, 1 regressions (renesas-next-2024-06-=
03-v6.10-rc1)

Regressions Summary
-------------------

platform      | arch  | lab         | compiler | defconfig | regressions
--------------+-------+-------------+----------+-----------+------------
rk3399-roc-pc | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2024-06-03-v6.10-rc1/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-06-03-v6.10-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f86b864474e417c53c64c4b33ca4e1192aea03a3

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  c8f327ce9cb504a6c2185487d576be3d5254556a
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  a44ebfe43edc96acab22a19b6a8850eef9202eea =



Test Regressions
---------------- =



platform      | arch  | lab         | compiler | defconfig | regressions
--------------+-------+-------------+----------+-----------+------------
rk3399-roc-pc | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/665d9a29ceab212fc47e70d4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-03-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/igt-gpu-panfrost-rk3399=
-roc-pc.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-03-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/igt-gpu-panfrost-rk3399=
-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-ig=
t/20240313.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.login: https://kernelci.org/test/case/id/665d9a29ceab2=
12fc47e70d5
        failing since 117 days (last pass: renesas-next-2024-01-31-v6.8-rc1=
, first fail: renesas-next-2024-02-06-v6.8-rc1) =

 =20

