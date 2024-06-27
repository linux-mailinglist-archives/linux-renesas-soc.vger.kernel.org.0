Return-Path: <linux-renesas-soc+bounces-6848-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 721D591B1C0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 23:56:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1BE4283780
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 21:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5749CA3D;
	Thu, 27 Jun 2024 21:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="1scHLNm6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA77B1864C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jun 2024 21:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719525389; cv=none; b=Xb3l+HNlUP/+C3doPnzdSsbp5wJznbI6umscVd3QNa/DY+PPH/i73vWNNQrAF0Uf4Cgzf46cbIkzYmkFJs0iui9RMVskqRjLTO1UDZyso3u2MxrucjFgt0j2bBYOCoIUKXp8bubVgtyN63liqfDZAXJUtWpFWmwEwbSimIMl4No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719525389; c=relaxed/simple;
	bh=m9Wg+R7iN/4nZoqWOukc4GwxFFM9R5y8B01IXNt28xM=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=G1378Wzq8r4lSUEoLhJqLqC7HXmYcz+RsE05fubD+3k2/K1q22X9C4vb/U1KW+W7V4aUGaOP7QFC9nS0/dSTr1j2w0PxVImugH6/TVkuF1wi7gQUBv0g6vK7XsozTqNRZRSzYH1jqVZLrcLkbydrSGZfH16OUpVyzLLMjBlIinI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=1scHLNm6; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1f480624d0dso71044955ad.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jun 2024 14:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719525387; x=1720130187; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=86M7jXdEnufgRm/djS3a49WjQ6n4aGIQXslsZKi8K1A=;
        b=1scHLNm6VmHNGgxOrVqL/CQWv0azew1o5Z2SNwIWxZnI1ZVAN+GCkOVh9+a/4um2sP
         aLFHHBYlCjchHy84VdsBpIZMSx0iLmAF4qA8TSrWYd3K8/TvV5JBaSP3PrNVK7OY0/qH
         9pnW+Q8RmMiC/TkId9+hsKoKdn34PkVLYYu33Os9NT8c3ZM1yUzG8sE30Gt9Sf0fj+su
         znYyZDZIb7qm9hyAPRv5/tJWayYIGCO8sHcZqhkj1YoDyxqH1NFEY0Ekd/+8VgnRF7fQ
         QncAdHs6t2c7SvNc3tc157dLX00RIouYsPd+EBmy6zRvTSDU1eqgupFXZUUi1vXPK4L2
         r1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719525387; x=1720130187;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=86M7jXdEnufgRm/djS3a49WjQ6n4aGIQXslsZKi8K1A=;
        b=jBXdHp2fqyWxEbLRiuWnLG4vh0B/5BJFzVqr6z6QKkZfn6VQxh7IxYal0WfzjNk5v/
         E+LrvK0eOVx7fB9h2RFDj1etU94gxEUOIryLNJYylFmbPLvnEolEInJPHe8AM+w2ZMDB
         cxvhEFJIam2u+S1mr/y5Zgy3Hcju95nah1yFvkMzJuV4sxgAASu+VnYELZ6z4hW8GT/G
         3AXUeDgT8p3ZZvmEW2udCkrm5SUzBGPzwxP8z0Y2jpw5OqDY9DOlr6tqdFrOfujCZrbU
         oTmNC0m1UzSluToLZHvZiGnatuuqjetfKutCnL9vJGY1EEeTBqcSmgZb185KbCr6dVRC
         w8Rg==
X-Gm-Message-State: AOJu0YzeAn8CZja2q74YHUEftqzT5y8MY6EcWC56+MA9V/c1uzN67vyV
	VRtZ0mIybTE+YVeWCx7PlzTVioAU0zV2eJBZTeGvfiVnJsZyuU+04OwaqcD0a+a0n+XMJRBnjx2
	T
X-Google-Smtp-Source: AGHT+IHgfRFH+qQoXQdeB3kTOoVhzmt5XQsgoGd/yXUB/9k2ST+9SILNSpoqQn4Wsw6gRDvz/uAQLA==
X-Received: by 2002:a17:902:e5c1:b0:1fa:643:f42f with SMTP id d9443c01a7336-1fa23f23f3dmr166282285ad.62.1719525386025;
        Thu, 27 Jun 2024 14:56:26 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10d1fc8sm2437895ad.33.2024.06.27.14.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 14:56:25 -0700 (PDT)
Message-ID: <667de009.170a0220.2c1f5.141d@mx.google.com>
Date: Thu, 27 Jun 2024 14:56:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2024-06-27-v6.10-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 62 runs,
 1 regressions (renesas-devel-2024-06-27-v6.10-rc5)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline: 62 runs, 1 regressions (renesas-devel-2024-06-27-v=
6.10-rc5)

Regressions Summary
-------------------

platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-06-27-v6.10-rc5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-06-27-v6.10-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      0f5cb7e6e3f3042bdc6780d9a4fae9ed2d217834 =



Test Regressions
---------------- =



platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/667db588f14a25112f7e70fc

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-27-v6.10-rc5/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebo=
ne-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-27-v6.10-rc5/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebo=
ne-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/667db588f14a2511=
2f7e7101
        new failure (last pass: renesas-devel-2024-06-25-v6.10-rc5)
        1 lines

    2024-06-27T18:54:46.945477  / # =

    2024-06-27T18:54:46.953510  =

    2024-06-27T18:54:47.058576  / # #
    2024-06-27T18:54:47.065124  #
    2024-06-27T18:54:47.209472  / # export SHELL=3D/bin/sh
    2024-06-27T18:54:47.225386  export SHELL=3D/bin/sh
    2024-06-27T18:54:47.327182  / # . /lava-1157775/environment
    2024-06-27T18:54:47.337283  . /lava-1157775/environment
    2024-06-27T18:54:47.439162  / # /lava-1157775/bin/lava-test-runner /lav=
a-1157775/0
    2024-06-27T18:54:47.449180  /lava-1157775/bin/lava-test-runner /lava-11=
57775/0 =

    ... (9 line(s) more)  =

 =20

