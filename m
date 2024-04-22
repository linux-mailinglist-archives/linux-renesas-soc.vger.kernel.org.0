Return-Path: <linux-renesas-soc+bounces-4781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C54D8ACE6F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Apr 2024 15:37:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D92421F21D0A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Apr 2024 13:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A15D13E8B2;
	Mon, 22 Apr 2024 13:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="o8z4Y7JT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DF814F9D9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Apr 2024 13:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713793064; cv=none; b=eSS6Rxpot4Hj9vPLj+8gyu0ya0Ve104Z5ai1tLGzXAcK+7+vTWD8VqY0it2QY6G2SYFDxoCUj31u2L8ThsEhmM2zf4TMRqNN2RYeVg4feq1fgzb42Svel6kaUmIuUqehOmnIg5y+XUC1jGzgFZDdz7Skin3/AeLJtnYPUoEQ/zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713793064; c=relaxed/simple;
	bh=jZspTBr2yB8IcSDZ+Pur/1B2p+w8Cqc8hdMUmxX53Gs=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=NNfEoBENS25Y5i5cGW24nk64miSerVzF3QhkrYbDeYXY2GXYDdv/WcejxT7BZ3z2fFbb6hsgH/dHv6ldhm4ce0N6K5SE3pxJQsFlVQufYL3LLlKpu18ppjlvH0TFxhsaRqij8rAr75/kQMfDdhE1HfROpA0q0ol2L92Qad6PZ2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=o8z4Y7JT; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-60275a82611so138085a12.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Apr 2024 06:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1713793061; x=1714397861; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Vv6YSl8NbDUvevvPQOFKMUlfrrdQaW1HXNZo/2zH6Wo=;
        b=o8z4Y7JTgOHQO0PiOiF2jP3pU4CD7G0m8E4TpfmbGSKv2TmToMjPLKIAj+qBufbTtq
         7EAIhfbwU3+5l7zxTseOrv4qLFQPGrshQFKEjhbYudU1/CnEZfqoTEbiFWeuuTwlqByx
         hvysDFEMiVMMq0EYky6hOvNgHopce321Odo6yaSDl/mwGT30mUbyj7cyN9U58ZdpemMr
         bq/w6PI01660bFWPg+A3NIYRZL3kBMK+I5DkjwYRuKgEnlF2VIphmAxcDUAyZRBc6BDo
         vj9QsmkaIccW7CtnJVEeuKo06ZdqRJSTpXX3ubbC+5gGzS8fJ7ilBTV2QNmWokeOLQfu
         MeTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713793061; x=1714397861;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vv6YSl8NbDUvevvPQOFKMUlfrrdQaW1HXNZo/2zH6Wo=;
        b=a+O3+thoG/LqpG3lAMh0eO1OMt7duOscFUUAkGQE6jDVpW89mVCraNo/Y5/F7AGh7C
         UweHX77ARQIJtEnq2Zc8+scTZqw+G4AQpr0MyujCio7WE06N7NjPd/tR8V0/sAfsFul+
         OpFrVRf5TlRcH17ES7Yq7wWmAtMmPta34mMljNA8LxxRJgROCIR8C79WkoyHBUM2gmk2
         MwJbCeOYr4aDGOM1PJAWtUZRyDrArKTjNBDxVlXMUmyBcroSDV34Ttu0LLAUE6s4nU3f
         XzMl6VvvcSlQXX1Y3BC0Rljj1LDj0dZFoVsbRyXviIg459E4DQYABVB7DWNu8wKb/5Hc
         MvGQ==
X-Gm-Message-State: AOJu0YwD3v6bYiNBM4JZDNPCIahmcMXs7kH8dM89RSbmmdHP1dFi6cB7
	LeMxjDtRvWbaycmzy5prI5OMUU0Zce1gXh9z+6X8QYa49k98kIcnYHdxmZNchEWqov6tQc0kDRa
	C
X-Google-Smtp-Source: AGHT+IFlQUc5L9O9WWA9EZQa52qdsEcZVXGr6AAP3dKYr8IQnQ8XAkqSarEAXf8Jr6vo7kEcCRkUBQ==
X-Received: by 2002:a17:90b:203:b0:2ad:e61b:92a6 with SMTP id fy3-20020a17090b020300b002ade61b92a6mr2449421pjb.6.1713793061514;
        Mon, 22 Apr 2024 06:37:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id nr20-20020a17090b241400b002a81d898f0asm9595961pjb.5.2024.04.22.06.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 06:37:41 -0700 (PDT)
Message-ID: <66266825.170a0220.cddcb.f23b@mx.google.com>
Date: Mon, 22 Apr 2024 06:37:41 -0700 (PDT)
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
X-Kernelci-Kernel: renesas-devel-2024-04-22-v6.9-rc5
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 65 runs,
 1 regressions (renesas-devel-2024-04-22-v6.9-rc5)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline: 65 runs, 1 regressions (renesas-devel-2024-04-22-v=
6.9-rc5)

Regressions Summary
-------------------

platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-04-22-v6.9-rc5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-04-22-v6.9-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      de20c778e68045aceda59ddc45ab00ac5fe7e8d0 =



Test Regressions
---------------- =



platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/66263f3e11884e735d4c42db

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-04-22-v6.9-rc5/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebon=
e-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-04-22-v6.9-rc5/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebon=
e-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/66263f3e11884e73=
5d4c42e0
        new failure (last pass: renesas-devel-2024-04-02-v6.9-rc2)
        1 lines

    2024-04-22T10:42:58.043330  / # =

    2024-04-22T10:42:58.052345  =

    2024-04-22T10:42:58.157503  / # #
    2024-04-22T10:42:58.164513  #
    2024-04-22T10:42:58.266504  / # export SHELL=3D/bin/sh
    2024-04-22T10:42:58.276523  export SHELL=3D/bin/sh
    2024-04-22T10:42:58.378364  / # . /lava-1123070/environment
    2024-04-22T10:42:58.388454  . /lava-1123070/environment
    2024-04-22T10:42:58.490250  / # /lava-1123070/bin/lava-test-runner /lav=
a-1123070/0
    2024-04-22T10:42:58.500389  /lava-1123070/bin/lava-test-runner /lava-11=
23070/0 =

    ... (9 line(s) more)  =

 =20

