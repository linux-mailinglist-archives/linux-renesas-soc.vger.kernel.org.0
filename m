Return-Path: <linux-renesas-soc+bounces-10275-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E17059BB426
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 13:06:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10261280DE7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 12:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94CEC7C0BE;
	Mon,  4 Nov 2024 12:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Ml3ZuV1g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F2A1B3945
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Nov 2024 12:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730721958; cv=none; b=JyjOkL4oJ03P7FFh3Izw3TQyjB+CoenCx4QxAhe9sRDrcvbmh/PMtcM8BJ9vBtGpmDSDVesTM9l6W3EthwIuDgUrSupLvaGWFt9F0kJwoKAa+xo7qQkQF8rxx+A9T8ntJJISoOKHcP3HyEHW2AsUxm5FsevMzoIdIxcJc5uKpUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730721958; c=relaxed/simple;
	bh=qrHvIPJSxR/X+rhQX3EytMrpJ2NT3P81QI4dTPhTcYo=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=h1gKsI14qvzTYBH/f7enJbQSY0z9vxBhowIaVuMZuORemht1TmkGiVkyu+A2qT/p6/tfTlis005uBI7f0Zh2gmsUlEXSMsPNZZWafOPbM+jSAhNRq5hGbcgnp1eFdX7MGmJoTCUEO4Ew0oDe354KUMBWlbSdeOEavx6kaqNR2FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Ml3ZuV1g; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-71e79f73aaeso3385957b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Nov 2024 04:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1730721955; x=1731326755; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DQKDLlffdZk828gPsmEvGWlj9tOJA3hPacOMg+A1PUI=;
        b=Ml3ZuV1gsyTboyCVBkz78FVoekGvm4ctyxAZcSkdvza+1mweP0/g13OsQAGM6UYkrJ
         0yATaHFoNy17prms6aZVybw8y4hTUOc/YqsqC47KrQ1omLzyQ2/4gu17ioghJzkNIoWU
         6ElDtdZIjTZw2GazXai5U56bKausic6gg7Jx9lG1oFddAYsoDo+ny8Zd2IB8TniFtFzJ
         rrDm4inrLRG2AgbTwSe/N0YWvAZiQ/wh60bSLCC7w9cbGLJRig2OsB4QI0nhx/KdJ9X9
         vTdm7dyB+W/fVPRi9hFlSscvO3YOHMKdxzhdbiJTROfBg4UEkLUMudnvvDHDuGSp82vc
         LnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730721955; x=1731326755;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQKDLlffdZk828gPsmEvGWlj9tOJA3hPacOMg+A1PUI=;
        b=MUzNqKZLlS/GZcnakg3EIjMgYOstphyzbZzrDJ76OzqYJ3uZZR9TJAgRaYsbNIe3FZ
         FbCJwtx6uWYfJqTkejuAAkI4ZWF30859x11VsZVsBq6DOQ+FkPlkE5tEyL05saLkHLom
         mJaHEK2rhuJjF9oWyqv0ZNkWODVTGlWyB2Dt2DuW04E05kV9CODAbeLG2OqxU7bh1RK9
         uBM7JZP+17kGAJfLnjYEN/hX9UPmwcEgciL9n1Kxm4ybJQ9A9YUx5eIFNzXIZPtGlRiZ
         qsGQR8OSFbvpOmD5iZmgIcZmDlX68LfEdb+khRbcwYEmwC5hwJfjFBqiPf0m1V8F+E4v
         VGcQ==
X-Gm-Message-State: AOJu0YxcmwPu6ESg2IH0Z+6ICH6oPJVYuWrS2VcAir80R+QHkIaMicWl
	Dey6gCyyT92blV56w8tp8dw4tLvopy/qt2rmQPqE68BwycfthLlIMfE//TbdlGGDjgc2lgwa/uf
	N
X-Google-Smtp-Source: AGHT+IHmojKEYlKxT0oLoG0QWqWru2hk6d4QdOB/IgaqTzLLuPba7C5i1XRvhcHQh6GLbX8+61HCGA==
X-Received: by 2002:a05:6a20:c6c1:b0:1cf:9a86:6cb7 with SMTP id adf61e73a8af0-1d9a83d5671mr42832352637.20.1730721955610;
        Mon, 04 Nov 2024 04:05:55 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee45a13178sm6814166a12.90.2024.11.04.04.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 04:05:55 -0800 (PST)
Message-ID: <6728b8a3.630a0220.362916.954c@mx.google.com>
Date: Mon, 04 Nov 2024 04:05:55 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2024-11-04-v6.12-rc6
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master igt-kms-rockchip: 1 runs,
 1 regressions (renesas-devel-2024-11-04-v6.12-rc6)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master igt-kms-rockchip: 1 runs, 1 regressions (renesas-devel-2024-=
11-04-v6.12-rc6)

Regressions Summary
-------------------

platform      | arch  | lab         | compiler | defconfig | regressions
--------------+-------+-------------+----------+-----------+------------
rk3399-roc-pc | arm64 | lab-broonie | gcc-12   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-11-04-v6.12-rc6/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-11-04-v6.12-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      27f400806fc5ab96d9293d245d821fb0ba4ee6a3

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
rk3399-roc-pc | arm64 | lab-broonie | gcc-12   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6728ae53596b9f9809c86862

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-11-04-v6.12-rc6/arm64/defconfig/gcc-12/lab-broonie/igt-kms-rockchip-rk3=
399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-11-04-v6.12-rc6/arm64/defconfig/gcc-12/lab-broonie/igt-kms-rockchip-rk3=
399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-ig=
t/20240313.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.login: https://kernelci.org/test/case/id/6728ae53596b9=
f9809c86863
        failing since 33 days (last pass: renesas-devel-2024-09-16-v6.11, f=
irst fail: renesas-devel-2024-10-01-v6.12-rc1) =

 =20

