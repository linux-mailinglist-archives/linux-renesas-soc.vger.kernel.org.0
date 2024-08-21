Return-Path: <linux-renesas-soc+bounces-7965-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4480695938C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2024 06:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0965B2176C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2024 04:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE5BA157A61;
	Wed, 21 Aug 2024 04:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="IxcNAMxP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF83B3D8E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Aug 2024 04:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724213378; cv=none; b=IEqdTnBI6f/+tM/KCXd+dlLS+CHv8olz1yXKPiKpzGD8E79o8rCE2X0fPRg5v/I7ddPYfWfyCZ4NiSTixBKZKqsKjNfGgYWQo2+FVQCOkqwkh6doy8HQ8nAWqvpE4Je4oJ+WnUXY/YJGgYZm06Nodv/UvO9n/Os/4wENxpu0tEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724213378; c=relaxed/simple;
	bh=pj66DI/0tv2pfOFn/e/eex+WPrUEkvlDo7HLZNck0vg=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=GoVtTq734P/0dxi8NDTFyALDJ32Znm30u/BYrJJnb86jSorm1U6J3u6PC4HZfEdancFGHYq2UNHCdGEA57vhH0JQuDrfe/qLlNZaBmbG3ohCHGzVzmfPF/K0HEPhaoy6Zd9HYAOpG5/I1fZvRi/0R+PT3/7UuoHGpjrwZbrs0YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=IxcNAMxP; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-201ee6b084bso52315435ad.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Aug 2024 21:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1724213376; x=1724818176; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Vf7O7pZoQlxWo/VepAkvoZXOdRZI+y706UdwB+ByUtU=;
        b=IxcNAMxP3P49HGHdrHiR7kMzaYyejs6yvkPvHSCrrqqbjhef7z6JWiQs5GAG7wSFV5
         w4nP98XiDzH/Y/NTorbwrwzLxJWafNZj0S7jDV1PzzxnALgI6WHlAGR2ZwUoS9x7hn72
         FTj3Zw4RrSOX7YKPuwUSbdNbogF8Myy3oN9BV7AUI7GPv3QUIu/Jx2P/oKXva8fKl8zF
         8djt1XRYKc5UDEY1vT6R71NHsjWvCHVziWazdbfVMfpOSkbURKMiO7kwUHC3cf5tlCAV
         vGh0/cdF9Ov3iqxA+jg55wpdf0fYCUSZoLBy8mNgXPORd7eJW9BVKiyLrbOcIa4o4FIX
         Go6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724213376; x=1724818176;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vf7O7pZoQlxWo/VepAkvoZXOdRZI+y706UdwB+ByUtU=;
        b=sCyd6nBekDRzRIaHxpyHVp23qTCCeVp8pEf75FDvJuKpur3CrTUXq2JKcd64kQhJrU
         G5uoV6SnMVXc4nHUOCGx6e2lNx4ghOQLvawoEqvUG+vtptEn1gc5V0appvcqFnXETGFf
         0/VmgowL8aAlhiMylz4wN8hP9j/s1SzqoLATn3oLsSr0DXltgv8kRBvmi2k5w8VFXm7e
         9eBLJrPexDX0Vv4MV8IAMttXqrQ1AszuHfK0sTU+won361s162+lnInaTJUvCuDCBRH+
         e3aKl83Nw2HBrGh1vlgOZX79WFoiq0L8DJeVN3WBx0beJJIZSAtqRuPGVZydZ/M378Q8
         pHIg==
X-Gm-Message-State: AOJu0YySLJ5jzcjbT690mEA+SeAj3LkdTJsnXkMspWV7dr7OWm9wt4Vp
	dCZjNT/Cje/ht+QZGIgmUtVh7MaeU+Y1//JkuE8+JPsh1y4MKPTiwH5UgQIJayyN7V32+PsRVkP
	x
X-Google-Smtp-Source: AGHT+IGuw3QJsfp2ZKP8qymAZ6X6LLiF3zPRGYPO2aOaSySba0bcbtfGJdcT0B/kZxyjCRZivFT5XA==
X-Received: by 2002:a17:902:e809:b0:202:3dcf:8c38 with SMTP id d9443c01a7336-2036808f87bmr12295745ad.44.1724213375482;
        Tue, 20 Aug 2024 21:09:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f02fa4a7sm84723725ad.38.2024.08.20.21.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 21:09:35 -0700 (PDT)
Message-ID: <66c5687f.170a0220.1213a2.e4e9@mx.google.com>
Date: Tue, 20 Aug 2024 21:09:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2024-08-20-v6.11-rc4
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master ltp-ipc: 5 runs,
 1 regressions (renesas-devel-2024-08-20-v6.11-rc4)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master ltp-ipc: 5 runs, 1 regressions (renesas-devel-2024-08-20-v6.=
11-rc4)

Regressions Summary
-------------------

platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-12   | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-08-20-v6.11-rc4/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-08-20-v6.11-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      836408375f15719e115457f340006a37eb6f88e6 =



Test Regressions
---------------- =



platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-12   | multi_v7_defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/66c564a4ecb384e8e8c86856

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-08-20-v6.11-rc4/arm/multi_v7_defconfig/gcc-12/lab-cip/ltp-ipc-beaglebon=
e-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-08-20-v6.11-rc4/arm/multi_v7_defconfig/gcc-12/lab-cip/ltp-ipc-beaglebon=
e-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-lt=
p/20240313.0/armhf/initrd.cpio.gz =


  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  cbc2d05684ad86b779252500498d17f718b84915 =



  * ltp-ipc.login: https://kernelci.org/test/case/id/66c564a4ecb384e8e8c868=
57
        new failure (last pass: renesas-devel-2024-07-30-v6.11-rc1) =

 =20

