Return-Path: <linux-renesas-soc+bounces-5781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 676458D8409
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2024 15:34:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 989AD1C20492
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2024 13:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D38EB12D1FA;
	Mon,  3 Jun 2024 13:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="L6rGJAEr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091C015C3
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Jun 2024 13:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717421690; cv=none; b=CgKj6XJOCpxYtfjdMSQqOHU+NqXo3S+GYol8YrCtUNDXctdCx3kW4+rak6/IB3CG+DWYYDdPZ6AjICWB74G8/z3EEWI9Yp76tRPBvJ0/hnYtsKjgDfUHYrKMISOa+ebRug6tjQIaXP0CFgUrACYGFKMlU28Ma6zOujeRKv/Omd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717421690; c=relaxed/simple;
	bh=PvMSkocfLlTbR1T92kb5CDqLJssOJo+QWclOz/FEad8=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=YWN8w0w9HaCKBFdWN01bkEcMW+lDBEO9eliM4xMzmgi7orPIwR2ioxEiRegh07Vp1fPLzrSrR/7rtn9+Q6v/tictr4NBonkfhe2aHtPilCD0DXPRTnVGcXuoPfGkwsnrXaA1NOWWBsWFVFD59jQ+26mQoyQ6SF/sxebF1JwWqA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=L6rGJAEr; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7026ad046a2so736792b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Jun 2024 06:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1717421688; x=1718026488; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=er3ibGLChmAoKAR+XkOR8XDCcSFqKG7Rbslm/e5holI=;
        b=L6rGJAErviJMZWKtSUcdxuuvPwwi8vVp81gxVODoSkmz9/kPMALsZbSsdqJwEifqU1
         yCBSgeMfrE3mYnzU7UyOWBYx8pSPY2mNqhICqqiu5PLXUp5AhfObcmAzouvKd0Duw9VQ
         IlLY0SMTHsTYydHInewcwzd+xXd7KbpuXFqJIpEHy5X+KVhf6gJkrb/Io1Ix5eaO1R6Z
         TjThZP7agN/lYuSveZFJgFqKDfBpTxbwZyJV7CpEjGMxmrvmnj0NNDrfRrdLRmUcFllA
         Liz4YaJdzM54dirSq4XAmw98PoYNa2FuiRC2GNlbkKG5F6OfQGycPDyn0DqFS5Eh1bxc
         d5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717421688; x=1718026488;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=er3ibGLChmAoKAR+XkOR8XDCcSFqKG7Rbslm/e5holI=;
        b=hC3Ipy+n6l2BcbGz9I2ODCc5mxyZ/MnsnhJzrmJXl6NKn54AQAO3uGEJEqiXj76TXb
         xPunPGbOWxVjywl0+fpMFpjsLyzL8KhDWWr+6WO+EhI/hkeS/MIMFlarWgwbmEK9QRNS
         9NrwHXdIDx0VTZDWYiF4KjIH8RVrvhjwmrNEX1GbuzlMsd4tvWoe62y4deauZhA9KO+M
         f1xNHq4dR7AJs9EtWXLVUTkaXtELPH+9kEGOPlm1rHiI4vtYNu5fPsMC47SOCz5IUEVN
         dYdeWNcqPWVPqCurSK/fqN2byRu7XXlaSae3AlyNNtxuUVQ6zW6IcWZbEKs2wCbUWH0b
         f0YQ==
X-Gm-Message-State: AOJu0YxXDUCqXm36vxm9czP7vkHiR8hLYAY8XpHHCDCBbwBC75Nar9u5
	/oYCBb1+dPCc+uINRrgOtcwrfVpxe/8gFlk5yWJh7Zbyhc+O1EyGg6IH7l3sK1CGL4sUUMrIEV9
	b
X-Google-Smtp-Source: AGHT+IGsqkpOD+4Hf6Khhl0xr/4XLbwQ8Xk8pHPzkDmPWcwpt4WEkbZR6YDqJvOAyG0UgFOXVMiYaw==
X-Received: by 2002:a05:6a21:3393:b0:1b0:106e:89c3 with SMTP id adf61e73a8af0-1b26f17bdd3mr10080591637.9.1717421687707;
        Mon, 03 Jun 2024 06:34:47 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70243d06433sm5294744b3a.107.2024.06.03.06.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 06:34:47 -0700 (PDT)
Message-ID: <665dc677.a70a0220.321c5.ca3a@mx.google.com>
Date: Mon, 03 Jun 2024 06:34:47 -0700 (PDT)
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
Subject: renesas/next baseline: 58 runs,
 1 regressions (renesas-next-2024-06-03-v6.10-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline: 58 runs, 1 regressions (renesas-next-2024-06-03-v6.1=
0-rc1)

Regressions Summary
-------------------

platform   | arch  | lab         | compiler | defconfig | regressions
-----------+-------+-------------+----------+-----------+------------
imx8mp-evk | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2024-06-03-v6.10-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-06-03-v6.10-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f86b864474e417c53c64c4b33ca4e1192aea03a3 =



Test Regressions
---------------- =



platform   | arch  | lab         | compiler | defconfig | regressions
-----------+-------+-------------+----------+-----------+------------
imx8mp-evk | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/665d96327f260ec3e77e7081

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-03-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-06-03-v6.10-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/665d96327f260ec3e77e7=
082
        failing since 5 days (last pass: renesas-next-2024-04-22-v6.9-rc1, =
first fail: renesas-next-2024-05-28-v6.10-rc1) =

 =20

