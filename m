Return-Path: <linux-renesas-soc+bounces-10262-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 424139BA6CA
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 Nov 2024 18:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFE0A281FC4
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 Nov 2024 17:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679F070800;
	Sun,  3 Nov 2024 17:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="ulZoJiCP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9145E4D8A3
	for <linux-renesas-soc@vger.kernel.org>; Sun,  3 Nov 2024 17:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730653244; cv=none; b=kIKfRK8dKwHRxdYoSP7K9DKMQmvrTZhNqQ8/1fQITjVXZ61qP5mY/YA0fLOJSrw83WIQup2HAqK1txbSvHh9iSCoAzK3CHg4NcSjQJ6AP2HxswKp5R2q0zoW7hiBE8LwsU6DyovHhASCDFx7HhNE/86OLS89920sqQAwgL8LJ2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730653244; c=relaxed/simple;
	bh=VuHxFbdF0Z7CvnUi+P5zrxxXgErdsTQmWC5Yijuy/VM=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=JsCiHzgblPBoEn4Jw/eOawywlJS/k/jxb8FeyG9Vco457n+owpRCLRouracYie5GOsy941fUMQQty0hf3RVURHOpodyizh0TjOo/adU6nowTa89GgvwwGTFT6K6DVxG6kY3/KfklvdtK0cg1p3xpA/QhG1vwI1g+emccMayFxVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=ulZoJiCP; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71e4e481692so3333197b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 03 Nov 2024 09:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1730653241; x=1731258041; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IJ0PVKhvO2aLpVG2AkzB4D4QBjXp/fdlsnTli4Z9S24=;
        b=ulZoJiCP+PREex68gmiRpwC1ktc6NCdymlLkApqsdDyTcKOu9rB1YevoWULNmWWU0q
         Uo2vqJsO9cXn0q4B5jnwhgbMZaEDtt5prKXgiArIl1s320D9zAHnitB4jxLdDwVgfUDo
         Kinjv4+hkkP6uNEKt03qidEPrM+n+2m0WOEzxPXqQhcZyE4peFPutBvnUuLsKh8LJafq
         cJ97MXfxqGuYLSs2sygmJZA2IBWlbr/SwhwMrpEmv4v+Joipxk5yb3ZqUw/Z58WH+TnZ
         u9m3JZXFKetDYUl8/7GOHmSp1JlfsApU7qsqHJq15R9LSHlyKhzD1thucSF12cm+R87w
         b9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730653241; x=1731258041;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IJ0PVKhvO2aLpVG2AkzB4D4QBjXp/fdlsnTli4Z9S24=;
        b=h4mAv1TGwPTkCRUkaKDWqGd49K4QXzMzygqcmRif+OFTgIaGZjLmlAtL4NoZROotJV
         OQw6jRbJH2j9hieAcNk/jMjcK22jxFXvxATdDMz5PecGNmy/Uez8mSP6B9UVMzAqOoM1
         5P1pLnB8DLGr574E4gzZioaCpSrNIrk+VmsDbNEjW7zaKzlp7z+P7mF46NnLNsX02CBw
         Bm5S3ILwgZVxN8Lmdm5Mabr2qBngdrnwZUqRxwWRKcKA+mcQt30L9qiEMUhpFiHTJo06
         TLIB8ta/xSIVIxbuu4Jz5N7NckuhtT42ueBPZBVhUj0Yx1j00T38mt3K2eKwpBoSwD4O
         HLuA==
X-Gm-Message-State: AOJu0YxxFwZDbuHIbvPTy3GLYmo8Kib4Eyeu9QfErCbRkK2grBQZh+dJ
	16KFO0M+DZVoO35ByUaTPSGcxmGvJD8UlqVEdxlDsK/PaQvpgbC1aGzm/vxKPKyxUe854+ixUMv
	n
X-Google-Smtp-Source: AGHT+IEuyaS+Hb2mwKLUIWE9bT9Ac1UAkc6d0i956CDB3FU4n3ozqYg0rqUMOKp5vo5xZ7RQ6zCFag==
X-Received: by 2002:a05:6a00:1817:b0:71d:f7ea:89f6 with SMTP id d2e1a72fcca58-720c99b5ca0mr15448831b3a.18.1730653240681;
        Sun, 03 Nov 2024 09:00:40 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc20f655sm6028465b3a.95.2024.11.03.09.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 09:00:40 -0800 (PST)
Message-ID: <6727ac38.050a0220.1c5247.76f8@mx.google.com>
Date: Sun, 03 Nov 2024 09:00:40 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2024-11-03-v6.12-rc5
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 36 runs,
 1 regressions (renesas-devel-2024-11-03-v6.12-rc5)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline: 36 runs, 1 regressions (renesas-devel-2024-11-03-v=
6.12-rc5)

Regressions Summary
-------------------

platform       | arch  | lab     | compiler | defconfig | regressions
---------------+-------+---------+----------+-----------+------------
r8a774c0-ek874 | arm64 | lab-cip | gcc-12   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-11-03-v6.12-rc5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-11-03-v6.12-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      92e48eb66023988ab2d952e07541882b54fc76b2 =



Test Regressions
---------------- =



platform       | arch  | lab     | compiler | defconfig | regressions
---------------+-------+---------+----------+-----------+------------
r8a774c0-ek874 | arm64 | lab-cip | gcc-12   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/67277ed6d8d240afeac86963

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-11-03-v6.12-rc5/arm64/defconfig/gcc-12/lab-cip/baseline-r8a774c0-ek874.=
txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-11-03-v6.12-rc5/arm64/defconfig/gcc-12/lab-cip/baseline-r8a774c0-ek874.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67277ed6d8d240afeac86=
964
        new failure (last pass: renesas-devel-2024-10-14-v6.12-rc3) =

 =20

