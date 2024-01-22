Return-Path: <linux-renesas-soc+bounces-1625-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 470B9836113
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 12:20:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7812F1C25961
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 11:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D513CF4C;
	Mon, 22 Jan 2024 11:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="IMVH/Yd6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A781E3C6A4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 11:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705921606; cv=none; b=tLjW8cEV9KiuoxayKbZDKlvM5CjuDEh7s3lHoguMa9uK2t90H1SJM3JaFLNC1KY26zJ588Xzs8cYHCepWd+uWAZdEzd8Sk/ZAHNa6SDNlg+ZLHS8U78JoP+FSAV1u4tUf3C1ksQX1wzfiq6l4Px1hLtgnnp262TtC/nEGfe7dQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705921606; c=relaxed/simple;
	bh=jj2s1aBNp/Abx2Me1RODOee48eegsF6c/t0Yggxpf0A=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=rH6A43rtH7oQNz7nSH+wbtJGbL1YxcJyTW0/H5qQIs05lxGMdFh9eKoSb16YoI/x4HmP7GajCv1UI6aOKUpzNWpjcb2ybN8EJ0SuGSKXK0nTSXO2TWDaILX8CWx2p+S3+UvYVDyys4s/1DYAyg+3OdwG886zWlSrV97gpHwQnSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=IMVH/Yd6; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d748d43186so3646615ad.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 03:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1705921603; x=1706526403; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=feo+9JPygfVxEk7slerf3XPBUUWFosImWm4Q4af3G4o=;
        b=IMVH/Yd64avFBkk8PwhStAxjPQq4vZcWp1xZYAUKjm8YYsbnUMke/TAcW+PoJv5e3j
         ckaQ9nfMTuPH82QZESe8+imETZ5Y5y9sHZ3FHFpFq4tueNXXjB/fT0jx6vcpAaou22Sn
         jrNILf4ByzFfDOGDheIGZuuoAMGIgjUg1D7wti8YKwcTHmq/XpVRbU6V/53eBvW0l4sO
         o7OdaxJoa2LK7fzdbDQ+YTR5QWCIbPicPJ72r0XIMaT5Wty7WTXcBlzkNzqBPTR7DQTM
         uU1rY73AbbLprRo3TrK5nt2FsK8IGDcjTLlw+ZvHNb2TD5S1QWW2Ho9n7rPtGOLTfEmN
         T7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705921603; x=1706526403;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=feo+9JPygfVxEk7slerf3XPBUUWFosImWm4Q4af3G4o=;
        b=kHyNFm/dreCQ4CSWWDkxSBgi1EgGTtf/qvyA7ycN2Gij7n6W4VBH+LGErSkyd2Ow0f
         L6oO3GGa+puh7oU2RDL/dqeQEwtok6r/lTHD3JkejQ1sH+AizeIMKN12/EeL1kP5xgBh
         Wq1SdT58EfjyhPtBnQDKiASxAAvI0K3VS8Nn3MrEl3tIFeFKop6HaPikQNvHP8dL6t45
         yADeOmSI0k5f+gnbRn7/rGaRHJLLIvM/5S9WSCyvhEkIDQpGyF+hcau7NOr3SSYz+6is
         axop/Qk4Z2Gd0saV7canXrixIQSjCY5mAMnA8Onm6xGN/hSX+MCV67pXjzOEUvM7kMy6
         eqcw==
X-Gm-Message-State: AOJu0YzX2dTCN7bkngSFyhpHwW5xjcOJlbgeCFFchWiKBxKnku8eL7Qs
	EdpvsyHA0D9uTsD/9UUd6SeeoyRUse14V9l/YKvwoFouPYuu7Gibe5FsfKnYnUi7OnlTHJnt2/p
	odJw=
X-Google-Smtp-Source: AGHT+IH4pjYS9br2upfqXR4o8o0SXnyejpUNb+VGSACxalCpQkIaVy4ohiTGkdOApi6c1Nhcoy5H6g==
X-Received: by 2002:a17:902:9694:b0:1d7:952:aef9 with SMTP id n20-20020a170902969400b001d70952aef9mr1518435plp.131.1705921603483;
        Mon, 22 Jan 2024 03:06:43 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id q7-20020a170902b10700b001d757aefbeesm1226673plr.305.2024.01.22.03.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:06:43 -0800 (PST)
Message-ID: <65ae4c43.170a0220.4a440.2ba6@mx.google.com>
Date: Mon, 22 Jan 2024 03:06:43 -0800 (PST)
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
X-Kernelci-Kernel: renesas-devel-2024-01-22-v6.8-rc1
X-Kernelci-Report-Type: test
Subject: renesas/master ltp-ipc: 7 runs,
 1 regressions (renesas-devel-2024-01-22-v6.8-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master ltp-ipc: 7 runs, 1 regressions (renesas-devel-2024-01-22-v6.=
8-rc1)

Regressions Summary
-------------------

platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-01-22-v6.8-rc1/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-01-22-v6.8-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a70319e919d665138916eb65e32b00ffdae66671

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  3f0b2176930cf15a26597e28abf4356050136bbe =



Test Regressions
---------------- =



platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65ae42e244c9ef2d6252a547

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-22-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-cip/ltp-ipc-beaglebone=
-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-22-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-cip/ltp-ipc-beaglebone=
-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20230623.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/65ae42e244c9ef2d6252a5=
48
        new failure (last pass: renesas-devel-2024-01-08-v6.7) =

 =20

