Return-Path: <linux-renesas-soc+bounces-8616-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4FE968BFC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Sep 2024 18:23:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 557CBB2294E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Sep 2024 16:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C4521A2627;
	Mon,  2 Sep 2024 16:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="visEotsf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7C41428E8
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Sep 2024 16:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725294172; cv=none; b=X8WV3iPtn2yy+uM/v1P+gPqXHTShnlXF8JsyF4dyvL25CPDr0qT6GOzEe/KRmu+l3OcqXhXvxMe+cuAyMEnPvahtNsEadeect4a9tYeGanOCHjBvXhT3LLqdBLndO/ksz9QOzqjQpsYopU8UrCBYVTvPnXezsQmM9TaIYFmo9Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725294172; c=relaxed/simple;
	bh=VSBj9zkdTlDwys7I87bQFBsffy7OukJHtqJ2/2Y8tQc=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=NUL7DNAtiVwQYxzvJZ1EfNOkBlszY8C7O6nCVgNHQ160LuUu6FHJLRGiEuxPTNRtiSn/8L1xQLgEQjV31X6w9z2aKNgZaO0wy0qyiMO+2/VftWQXTaTnduv49JGuvNqSGg6i0tZk6Gclh0r48x9HUGH+9ncPgFHoUICNjDKM3KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=visEotsf; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-71423704ef3so3293475b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Sep 2024 09:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1725294169; x=1725898969; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RxnGXTfLwd/3CIk8Zz4v07D9Ad7OaoThpHPUuHYuwdE=;
        b=visEotsf+WQkBSUT4f177chghdixcKbveHjZXafbwlOd3FyBAuTQ2kRcY1ApdI0N8Q
         PwFhk8QgnLtoBzW4k0vsASFx6qZ+kleI25pre6pmpFSJ0icymbi4GFqAV6HxWZiXfSKn
         htQ4VmX8G8T1fKQYZ5pV9sANfUQwt3VOwLKQ9QQYiFYvprM25jbxOQfvKHXRxKxIl85C
         5upRPR7ESXA7tfqwAQryuPGhJsO/7Yy9Rf6kuudXK9I9MumTOdC8oDkjJfH67Gas+cV7
         cTDUFKlV5ZFY1QN/jUS499sV5b93z1G5s0Ez77Ik1oUkztdYp+ukeTeBE69vmP2AZgwc
         J16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725294169; x=1725898969;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RxnGXTfLwd/3CIk8Zz4v07D9Ad7OaoThpHPUuHYuwdE=;
        b=BKxTwR2V/JVzwlO3W5oe5qGa5YAqsjiQpxVT2lzdhP2RR++Cb75MRPX9V2mhOegkto
         WYCZrvxJngWosOFCMkILNyUresmLndLBshwENboq17vzmQfkaxa4h4bvQ9rZce4JxSkR
         JQjns/Tz0KToBPDy3yQG7T59PwN1MY8VmCfAAeg+w0gwZzzrDSGDUm11/rnIdyePXXs+
         N5ZL9CcTq5UjzNdax0DLoHs3HLBpulZ+2RXep+CJx0k9EFzP1ShbRCQC0EVb85ZcggL2
         SBO6s49Km27XTYuJyrCTmxMs/QN87uVX67ymgn6oc6amkTAwZYu/hJS/8b6VVFHdXVfF
         d3YQ==
X-Gm-Message-State: AOJu0YzDSBsxLwexFP9qAkjX2yeYzEGiT+bdLD7hc/XUdeuKRCTvsWdF
	HV1Se2QDNL+GYw91+U47ijjT4j9U/QX9RYnzSWeLRWBqOYrgxWsrEvknXgZNQOm95mRJ33MJXjI
	q
X-Google-Smtp-Source: AGHT+IFdp9GyNYByj8LLVXVklZMuSiteZRdFpzuVgkdbvPios8G4LsNcVNATb2MxVr0puOzqlgXfZQ==
X-Received: by 2002:a05:6a21:e8c:b0:1c0:ede4:9a73 with SMTP id adf61e73a8af0-1cecdee33d2mr11120665637.7.1725294168934;
        Mon, 02 Sep 2024 09:22:48 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e56e4273sm7299704b3a.149.2024.09.02.09.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 09:22:48 -0700 (PDT)
Message-ID: <66d5e658.a70a0220.22746d.835a@mx.google.com>
Date: Mon, 02 Sep 2024 09:22:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2024-09-02-v6.11-rc6
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 33 runs,
 1 regressions (renesas-devel-2024-09-02-v6.11-rc6)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline: 33 runs, 1 regressions (renesas-devel-2024-09-02-v=
6.11-rc6)

Regressions Summary
-------------------

platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-12   | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-09-02-v6.11-rc6/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-09-02-v6.11-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      284f4e0d3f0ba80fe5eb5563807d39c6eec0432f =



Test Regressions
---------------- =



platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-12   | multi_v7_defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/66d5b20e72ef3524a8c86861

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-09-02-v6.11-rc6/arm/multi_v7_defconfig/gcc-12/lab-cip/baseline-beaglebo=
ne-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-09-02-v6.11-rc6/arm/multi_v7_defconfig/gcc-12/lab-cip/baseline-beaglebo=
ne-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/66d5b20e72ef3524=
a8c86866
        new failure (last pass: renesas-devel-2024-08-29-v6.11-rc5)
        1 lines

    2024-09-02T12:39:31.062269  / # =

    2024-09-02T12:39:31.071236  =

    2024-09-02T12:39:31.176252  / # #
    2024-09-02T12:39:31.183125  #
    2024-09-02T12:39:31.300772  / # export SHELL=3D/bin/sh
    2024-09-02T12:39:31.310973  export SHELL=3D/bin/sh
    2024-09-02T12:39:31.412682  / # . /lava-1187886/environment
    2024-09-02T12:39:31.422974  . /lava-1187886/environment
    2024-09-02T12:39:31.524843  / # /lava-1187886/bin/lava-test-runner /lav=
a-1187886/0
    2024-09-02T12:39:31.534851  /lava-1187886/bin/lava-test-runner /lava-11=
87886/0 =

    ... (9 line(s) more)  =

 =20

