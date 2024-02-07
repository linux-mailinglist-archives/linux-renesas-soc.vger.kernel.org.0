Return-Path: <linux-renesas-soc+bounces-2414-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9D084C42F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 05:54:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF8D21C21BDE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 04:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1224915E97;
	Wed,  7 Feb 2024 04:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="ABvHt0Kx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1CF12E74
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Feb 2024 04:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707281329; cv=none; b=fRQnwxYLlVCzqPZgjT71ra2QBpsNHRGqhhwMtZsKW7+3UZg5+quBbRuGFcTLe8YJbxcxw7eN2d+VTXzYLqfj7V3W9J/9whoJVYChSxvWo/jLUN7cAvNze5qlZh1vYUzvUJWuXA1EDFLuzNWU2p+D591i/WgYR+u6tq6xalP0irw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707281329; c=relaxed/simple;
	bh=uWNolKU9Q6QMsH8JevCDf8QgH2Rj2JMwaQIG4FbqsJs=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=XBDQJy26lrLMK5niKTXNAq+CKXwjrZvEp5ikqvRlMyuKLQxvKS1wl632ZQSSoQC2Fk4/sHNYXrL7WGVLTqADGHwyCsllSv3UFtuuDGoNjWkMWx2vcHacvEVZNX5bDfVQZ/qBYXr/qWDN4kisZ4QMp1BQha8eWh9X/JQdimLhmjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=ABvHt0Kx; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d71cb97937so2691775ad.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Feb 2024 20:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1707281326; x=1707886126; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ve1kAgNontDbm4SuGPNkwcan4aw0xp+32w8h3qvS3Y0=;
        b=ABvHt0KxY8nfXuLPa5LcrH/ufwlIkR0Je2AfbR5eVIneRH17FfFW9ftz24m+YpPE42
         AYhr1i8mrzzvkLO4/FHzqpBMJJqG/bOjYeEOuGCEaxaalPzBAZjYvp9y77cjBepx3KHT
         4+0AjjKDEaJ+5lSF0U5eeijdI5BRwclsYiSUL4qFlnifFabzOTId2+cPp0TuZdMU/sVd
         7k+V3NHoReEz4EOB9kVygBf2TUmpj9SGiBdviCIFojoYGayZX3umUZhfd9j4WJj8LhJI
         DcXg8DYO7r4VRKHZU3rVKMwExIoy30uEgJVl247amQoQGuyVsPDsb6qaLeu8rCnk5QWD
         6r6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707281326; x=1707886126;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ve1kAgNontDbm4SuGPNkwcan4aw0xp+32w8h3qvS3Y0=;
        b=YbxjI2CoYiaVyAUxAjChl0mycsooOM8Bhhl4P9rlPAgZdHMXiryC4G6PWbNYzIlZ6a
         kzgvU3AtT50jG3HPU6KVkHuGPhKfh+X7f9LLe1y5pNSjzzYb0y/RjAAmGXe7YrBojaE5
         BvqY2pydmrRHrZ5JgweVu3vD9fZtJojEDljqo8I5iuGnQQsD2eecf+bRBod3r/TiIr6M
         3iSsv0+9aJ7r+NKzK0WAuJX8Dc5sJ9VBvEoeMbfCdBmYKhWW8ldksTrUq4pI5N8Enmxm
         7E1EdCloZXZOF2tLtbdG3Wv2aaWf2q+oT5Pg5qQE5u1JtJTej5lAG50xjQWqKKpP1lk5
         y6WA==
X-Gm-Message-State: AOJu0Yym79PTZKATdOzfePObct+7qC08Kg7yWrHr+29LE+yoV1mAKuUE
	kykCgj9vAW1aZi+LhzKqSFGIxYCRbbp52T3LR87MrNX/Sm5P42HE/M+bptMuPkVOH8boiq7WT/2
	V
X-Google-Smtp-Source: AGHT+IH/bWT6RFF2Cz4W7DAdeDA/fabpPWPkEUKeTFhE+daxpTDidErUcK8D+NemhZozqVrdu6Z67Q==
X-Received: by 2002:a17:902:e84c:b0:1d9:1cb5:558f with SMTP id t12-20020a170902e84c00b001d91cb5558fmr4497088plg.2.1707281325920;
        Tue, 06 Feb 2024 20:48:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXDWb5I7WuCLT2xStt6jHVXyUCMaXZXwE+VLqHQsj8iTnE1pT5QHrHuo05j7vqWlJMIK0rNVlAvwxI8FcpjZDo2TDKet+LhzaORQQ==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id mm14-20020a1709030a0e00b001d7726c4a40sm394123plb.277.2024.02.06.20.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 20:48:45 -0800 (PST)
Message-ID: <65c30bad.170a0220.5268b.1368@mx.google.com>
Date: Tue, 06 Feb 2024 20:48:45 -0800 (PST)
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
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2024-02-06-v6.8-rc3
Subject: renesas/master baseline-nfs: 21 runs,
 2 regressions (renesas-devel-2024-02-06-v6.8-rc3)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 21 runs, 2 regressions (renesas-devel-2024-02-=
06-v6.8-rc3)

Regressions Summary
-------------------

platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
dove-cubox            | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig     =
     | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-02-06-v6.8-rc3/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-02-06-v6.8-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d9725adb75e9a17df52743713a914fb7449ba066 =



Test Regressions
---------------- =



platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
dove-cubox            | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65c2db472d07e12b758e1ffb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-06-v6.8-rc3/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-06-v6.8-rc3/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65c2db472d07e12b7=
58e1ffc
        failing since 85 days (last pass: renesas-devel-2023-06-26-v6.4, fi=
rst fail: renesas-devel-2023-11-13-v6.7-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig     =
     | 1          =


  Details:     https://kernelci.org/test/plan/id/65c2db833a9b050d848e1e84

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-06-v6.8-rc3/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-06-v6.8-rc3/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65c2db833a9b050d8=
48e1e85
        failing since 15 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1) =

 =20

