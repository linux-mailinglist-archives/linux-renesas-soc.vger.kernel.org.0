Return-Path: <linux-renesas-soc+bounces-5773-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA248D808A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2024 13:05:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C29B01F23E01
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2024 11:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ABB382891;
	Mon,  3 Jun 2024 11:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="JrqRYQOD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D511B78C80
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Jun 2024 11:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717412725; cv=none; b=e4Y36DcQnFWtbbfzf4bggNGH7oF/kJT2JNLfOmtTBbJ/mtXcmeS2f63TijmmveOV7gQ2gl7YR+48RBAvKzrUtWHJrdvXjH1ynMGYUeD0qYR6XDPPftx+SLGyVfAjwUpT0E9wap1FwGaPx3pgY5KEIysFZffw+ov8bKyMy7k5JG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717412725; c=relaxed/simple;
	bh=hRdyZ/UQr0icIo7aJcR3BbVN1+/GJ6WE3jJI4awX1is=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=dqQO1Tf0HwSWu3o6/O2N7q/sBPPLNB5/2CHP0XZnmKksrlcNBc7B2IGqW+uR359JB3o5y1lgkmcaeTxnsjRubIqVdGibIWlRvQsfPFiU0HyFXZV9mivHQuF7oO3o6ziHehyQDtWpwPE1w+HuFTKC2bQGWpd5qe3b9J+d5ryq5FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=JrqRYQOD; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6f4603237e0so2716409b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Jun 2024 04:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1717412723; x=1718017523; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WS4FFIanf5+QmbLQVC7GAzG+YYWNwWAAA+oIaY6dhzI=;
        b=JrqRYQOD4jqiBhRzv5lXTetaTX7fAGyMDfO2DwSRTQaFg7zcZMb7nbo3I+D+Xy1Jbr
         ERz224uAJ0jyMb5zR1YG3gyrEa+i1xx/t7CWeIuS9yqGlGPFdKUxbMGBX6hTBsOH4F+F
         kdNovZUbK99QoxONMvqx2LPF97SpPHbEpMbvBdg/875VpIi2yTheIMgMFaM97r3+flwY
         DDB2Mr4m0RwP/T9Fn35wk4zY0jqy+oBk1gCLUw5RSHOtZoXKI3kT/Z/cnVMheZLPnrsL
         9H24Z6poPB3Wreu7XIQqkYiABZkb7gu+eFxqUHbxoohqKW9ZR0NEbRXCZt+plCwBqkKf
         EYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717412723; x=1718017523;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WS4FFIanf5+QmbLQVC7GAzG+YYWNwWAAA+oIaY6dhzI=;
        b=BziY6T/f1QtYSS5Z0cYGr7n9rpodymntXkoj795ySWUhPpZRjUHhjI3xy4eelpoisT
         3YgHqw3CL1wnFonjayAuRpe3nJ+ChevOi6IeDDF1du4R/XjWw1643I3tZPvIV5VqMFvl
         zW1j1bH9Roo/qs+8Ge75MO4yng5fM+5PNrdrMjG4czxnMwcYuLv3QOUZ2/u83g/MsYln
         ExsMU2FjEs7nW6EsoWZM+AqHMikMyw1cFur8IoI8aTOO/GWDHeatlgi+k3TNJBI+CLaH
         KhTDbuqr+RUeDESH9ArvJul06wzAef7HrM+1c9L5BoJGZvY5JIwcggwZ5S6vateScLHS
         J6+A==
X-Gm-Message-State: AOJu0YzNal5MFzG5KR6FmH+GIsp8Tdhg7sOM/9JvqOPNsXsjVjjmpHEO
	O7TGIUjbqpK3UabckpqQeAjlWsqmyVJJY0vHzaXoLfL+O29wysM9tp/8l914Dy+dKVsSJtLeO+x
	S
X-Google-Smtp-Source: AGHT+IGJvGqj5tHNAuzcvUAROLmWUrMRgpYGj3xxNwRo46XCv7jgD05LoiwTkDlV4UkB8SBsEKnyew==
X-Received: by 2002:a05:6a20:7f89:b0:1a8:2cd1:e493 with SMTP id adf61e73a8af0-1b26f296bbamr11016649637.29.1717412722735;
        Mon, 03 Jun 2024 04:05:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6c359564fcfsm5186398a12.75.2024.06.03.04.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 04:05:22 -0700 (PDT)
Message-ID: <665da372.630a0220.1f540.c707@mx.google.com>
Date: Mon, 03 Jun 2024 04:05:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2024-06-03-v6.10-rc2
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master ltp-ipc: 7 runs,
 1 regressions (renesas-devel-2024-06-03-v6.10-rc2)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master ltp-ipc: 7 runs, 1 regressions (renesas-devel-2024-06-03-v6.=
10-rc2)

Regressions Summary
-------------------

platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-06-03-v6.10-rc2/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-06-03-v6.10-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      20cdf993456075f40d0b9dc1ed78a669f7635037 =



Test Regressions
---------------- =



platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/665d961fe2baa23c507e7087

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-03-v6.10-rc2/arm/multi_v7_defconfig/gcc-10/lab-cip/ltp-ipc-beaglebon=
e-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-03-v6.10-rc2/arm/multi_v7_defconfig/gcc-10/lab-cip/ltp-ipc-beaglebon=
e-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-lt=
p/20240313.0/armhf/initrd.cpio.gz =


  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  cbc2d05684ad86b779252500498d17f718b84915 =



  * ltp-ipc.login: https://kernelci.org/test/case/id/665d961fe2baa23c507e70=
88
        new failure (last pass: renesas-devel-2024-05-13-v6.9) =

 =20

