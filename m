Return-Path: <linux-renesas-soc+bounces-3680-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D1B8780BA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Mar 2024 14:34:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A654B20DEB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Mar 2024 13:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7069F4120C;
	Mon, 11 Mar 2024 13:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="uuof6qRj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A1141211
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Mar 2024 13:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710164059; cv=none; b=Vs/aprI7lzhFBTUPPD/qtHlH4DWJQicR34NMKQlCTu/yyBM5w/llnIrqxUVUzHKOY35I+r8pdjua66f/1lmeudqf4wnuKqCKsBYNs+y4cMeI2l+rUn3jIVX+R2sHvTxJR+FuhFaagZgH0tBEEfc5c5swdpplw7rWqkRaEmgIrSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710164059; c=relaxed/simple;
	bh=8pQBcInyAu4UxgaUoR17vnq+utatNoTfyrzmFhka1wM=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=pmSHYYbPUfnwE/D1iZCKuB9MhYHas+O1R2QT8ngtjmjKpaJ6jTlXXXNC0K83w7ig3ciCpzouQREkkFF2UpE/Wy3bmxMRvrl0hj+bP2LM0FSp3bGYP0i/iIgg1RhxIM6JIm7oLHTDlSylJlCkLMwU7Bkjb6AAQgWioob9IBqd6p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=uuof6qRj; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6e676ea4e36so2031186b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Mar 2024 06:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1710164056; x=1710768856; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bWyLXnxOBe38ptcZ9x+6CaTCDNXun++ZW4Zk9FLAckY=;
        b=uuof6qRjf/jSn2GXcUKlSNw9DDQalmYUkl+Hx/sDALO2rJ1/NpFwqGpcDlSsOckD1R
         Ng71ks0pNpF0gOfJ9b7YD6+vbBsRQ1nuR8NCvNKeho0eKAECEOCYmsyoBd96tFeFpTMv
         GDoNeVyilW14EqEVUBDMnvtha30XFMR1ZLU25IU9Mv0T1KGuOdcNHk08c9Zl5TuCSA63
         fVqtEn4V/rnMOxfuiyhbp1Nf78WpQUw7uK0Qqn8MY9XBuDt7XnamYrAKGsSV7+YeUFBQ
         NCfQPqgY34m+g1jGmy+lw/3ZHVPjsK/z3rnHkqN9Og0fmSsfOgLQSOoSdiHNR7kVmNqn
         5u6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710164056; x=1710768856;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bWyLXnxOBe38ptcZ9x+6CaTCDNXun++ZW4Zk9FLAckY=;
        b=c4/Y5B56wJULEIyiWR5V864C6OZB7v8V2uZjDsJJepzO2DO7QlDMz9wSVzCJJXTBDe
         9o7TrArTQT/M/IPQxodyvu4PSJbWK7nriAny+AI6Id1A1CVDIVUI68Y1iwjbVOuVQ8VF
         nEXlCP/MCx5BMgGE7VCET0a7+PdL9SnO3HBJaczizl7Njl8fHE79uG1Py3Ipq6Rc2Vay
         ynajp/nvQBVZNTDk+fXbrdmQTc08DdGtsoNcOqXUUN8vzXdHSJqarnYjVhc0Qx+eFiDk
         puk0FQNqWrWuo6iaT+XFAr54sCk08hiUrZF2fVE7GdL0CFfkd97rAlTinbSvfYZOYmpV
         qf3Q==
X-Gm-Message-State: AOJu0YwwyqLe1SJUJURbjYijcQfU/HL42YESD2SRqKkeaavtXUwF5bIa
	QWt1Y2EZUorjWJAzAiwQAqkRJsNxZE5eTvHCOGIzvubWDQDm0+1D8iohYDts/K4e9ZDxLQRvGX6
	g9kY=
X-Google-Smtp-Source: AGHT+IGS4nPb8/PGo+it9RF98b3sqibzanMZq4KbGsTmqB4FP3jNYPnpMhjEwDgJU1AYHbfVi8I9WQ==
X-Received: by 2002:a05:6a21:819f:b0:1a1:45d5:ef4b with SMTP id pd31-20020a056a21819f00b001a145d5ef4bmr334078pzb.61.1710164056583;
        Mon, 11 Mar 2024 06:34:16 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id q4-20020a170902dac400b001dd8d7d4a5csm3112602plx.90.2024.03.11.06.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 06:34:16 -0700 (PDT)
Message-ID: <65ef0858.170a0220.92917.6e12@mx.google.com>
Date: Mon, 11 Mar 2024 06:34:16 -0700 (PDT)
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
Subject: renesas/master baseline-nfs: 26 runs,
 2 regressions (renesas-devel-2024-03-11-v6.8)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 26 runs, 2 regressions (renesas-devel-2024-03-=
11-v6.8)

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
sas-devel-2024-03-11-v6.8/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-03-11-v6.8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6e60eab20a8f0eebadd576a31d449c6b503c4013 =



Test Regressions
---------------- =



platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
dove-cubox            | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65eed5c7b71afd0da64c4313

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-03-11-v6.8/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-nfs-d=
ove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-03-11-v6.8/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-nfs-d=
ove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
240129.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65eed5c7b71afd0da=
64c4314
        failing since 118 days (last pass: renesas-devel-2023-06-26-v6.4, f=
irst fail: renesas-devel-2023-11-13-v6.7-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig     =
     | 1          =


  Details:     https://kernelci.org/test/plan/id/65eed83b3a820cf30c4c42e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-03-11-v6.8/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kbox=
-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-03-11-v6.8/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kbox=
-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
240129.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65eed83b3a820cf30=
c4c42e4
        failing since 48 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1) =

 =20

