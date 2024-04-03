Return-Path: <linux-renesas-soc+bounces-4260-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B92C8979B9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Apr 2024 22:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73C2AB2487F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Apr 2024 20:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72084155A30;
	Wed,  3 Apr 2024 20:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="piD3SjaV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26B1155A29
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Apr 2024 20:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712175647; cv=none; b=lro1Oty8qSnpZdGYbQsS2JljfoJ0GoaNwiOr55eMg5JtD1PUuvqHjftlfVsN3rdOZBelLLLEYLb7KkGyr8vYYMEg1gWSXCIfvoZP2myhK10atVcn9XyMj8dil3CSgftqtT+rjemQys15vbKZD7jIZQQIJo/AmouTJ4vfPdkRQUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712175647; c=relaxed/simple;
	bh=ITRAj6XL1/BhylHUaBni7k6k7lEaeW3Fc4GQPQtvopI=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=ae8ZdxFDz6WqoGETN1AMi5OAelQkAeGv3r10AS0O7ixUWnTDyvlkJ/VQgVFd2UpVHeRVrTZwGMuKAQRzQrnLyrtCvx5RfTJP3LWIqY96HNDgVTq93y1DuTygxhj1TmMl1cCCi+M8BLGlA9z9ml5a8YCbyu3pl33XwEgsbwd75ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=piD3SjaV; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1e034607879so1808145ad.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Apr 2024 13:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1712175645; x=1712780445; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m/ucDApWvTtatjm7rOmUJ+Z22DnvGzjPaJJJzWn/wuA=;
        b=piD3SjaVZej7QZcbKzBHQ5EYcnQZPyaSL/d7IG7OtZVlD/OKNamwy4ZJ4pPTbd51S7
         YClVGJf8ZWD4x+ZYHOSg/ma3UsxwFRDWzNEeHSnN6FcNeJSStg3pt99OuxNeVTEbagMa
         i8EToMG4gzZKSfzpf/GcgUxWQsLN7E7pRfl1niynBDIGjXfMQ1Dkvhhb84e1rBl935xp
         6Did+tEMbTmyWtT9aXxbAyGRPvZp2i0qy2M3vsqtzaJ5ryH5FdruQ9oTi7hJCHiZBXF7
         b76qEpTCQt7Tf7CBNyj/XQv6fxXeTMbmoqVS5KT2lPB6NIJ0PkCcBQGzOPdpLUjySftc
         +XKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712175645; x=1712780445;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/ucDApWvTtatjm7rOmUJ+Z22DnvGzjPaJJJzWn/wuA=;
        b=lqRjVRLqcpewKdRtFphpLupweBKL4GKZlLEOkGIsxfrivhoE7xm8/UbPazgvY5qghO
         j7wZd/gAPPEubrWbRzUZY+8QziK3JSN712NTnzob/OLIioLM3MlUerWY1LJLpx+xM8jQ
         3SoPy/Os6wNXWmeDoL8ii5taJI8xDK9uqpcrPkDCWfIlRfFbjglT8yiEwVrxiIPP2D8q
         Xl5NzEHz0Zgck3GCFwrX4ONV3X+cu0SRzgTrgrbM5hxCYrg2HwuT07H7fyYGXZ6TQTl2
         ECnNABxqY7n0sBiAKOWLzZHl+XPXeuD+6Rm95qfXQgRJzfgEl9LG36S59iqTjTZZ/tjJ
         Nu0Q==
X-Gm-Message-State: AOJu0YxcpHb4lpd/dMZmN5BdtkCQ9mpeW+Sf1uw0POsx/3SsCiFbceJ3
	Y5cRAXEVsgZnCVTOQyplM9jxz54kr0zYCyr6nT/MdXEJM9L4ubqngzxe0IRbkbUt9lYnLOgo7kq
	4dmQ=
X-Google-Smtp-Source: AGHT+IHiaU4Bt5nO62vgLYyLS/SXtLqMqV0ozTGkbyER8iP4tJerN7GPl+i7poAhgfKnQhcRZvwnPA==
X-Received: by 2002:a17:902:cac2:b0:1e0:b883:a122 with SMTP id y2-20020a170902cac200b001e0b883a122mr296700pld.46.1712175644686;
        Wed, 03 Apr 2024 13:20:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id az3-20020a170902a58300b001e1071cf0bbsm13772479plb.302.2024.04.03.13.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 13:20:44 -0700 (PDT)
Message-ID: <660dba1c.170a0220.33ac8.6968@mx.google.com>
Date: Wed, 03 Apr 2024 13:20:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2024-04-02-v6.9-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline-nfs: 21 runs,
 1 regressions (renesas-next-2024-04-02-v6.9-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline-nfs: 21 runs, 1 regressions (renesas-next-2024-04-02-=
v6.9-rc1)

Regressions Summary
-------------------

platform              | arch  | lab         | compiler | defconfig | regres=
sions
----------------------+-------+-------------+----------+-----------+-------=
-----
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig | 1     =
     =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2024-04-02-v6.9-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-04-02-v6.9-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a31e004a082c9eb21f465a657a1fc56c85e74e6d =



Test Regressions
---------------- =



platform              | arch  | lab         | compiler | defconfig | regres=
sions
----------------------+-------+-------------+----------+-----------+-------=
-----
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/660d8a17412957539d4c438e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-04-02-v6.9-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kbo=
x-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-04-02-v6.9-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kbo=
x-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/660d8a17412957539=
d4c438f
        failing since 72 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1) =

 =20

