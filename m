Return-Path: <linux-renesas-soc+bounces-3109-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D9F85FC65
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 16:31:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73E941C22502
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 15:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA346134CDC;
	Thu, 22 Feb 2024 15:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="glZHWHaM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370AD14C5B5
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Feb 2024 15:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708615897; cv=none; b=dupY+IhRU+Zz/xJrq9UyRVzW6lPYB6gY8iW0JTFFrgdKrCtRdfrUo1MvfzJ2AF4O5QStcCngjflNAf1khQLgWsApVNtlV4uuGNLXm6cUTF9HR6HkBL+yKZZA8rfQzP+zYXqZYVdhZm20yI8r24p9HTQi7sbPhhe9vcG/PxqVXNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708615897; c=relaxed/simple;
	bh=NL7m8X032UwePSKYjLtjZOUC3e2khSHt94CgZxSnIXE=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=HQNs/r0zs7yOEz34NMzYfhKEYFBrSmD2KoS1sJRaYBof6zbItXMcP4XGebyERH0R/DLM1eepoxdH6YQ2W+tg/Se9ELM1xaSTK6ghFFLWCVaZpWvFanNA/WvYOURY7yJCb7t+ufNc5t+Gm5C47bcbOpvQytXXK7YjZco/o9kmTho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=glZHWHaM; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d93edfa76dso53418275ad.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Feb 2024 07:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708615895; x=1709220695; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dbSaFwn42lAIr32FIElr8k1znTtP/8VnNbSqAJ6OO68=;
        b=glZHWHaMCeEOKJkW1VAsl9OJA00bNX6JLVKP0O5SQzuhWyfsDrKeicjXNo7McpHPa7
         aOLCGyzobjxo925FG/LEduU5SIwDKO3YyRZ6T7bvuRUdLMrh7I3Xt52eN3Uf/hkbXKyw
         n/WYrINpHYX4hJEP2Ufr1MT5PuvufLXtSQH6hohRzQ7GHQGC5gKaP50PHM+F1lPU2PIp
         F7oL6RFU3gnp/3+Cjin3kO9hws1HtVdryqQe8Ar4kPWntgMxG7UDNgvdgzzSZURF5BJ5
         v42pt+IfqliJng/QANgD/sALuxKAk4+2Ls1Dcn6+qMVU4yKlUfs+N1b6/9p2u/ZdbqJF
         7B0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708615895; x=1709220695;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dbSaFwn42lAIr32FIElr8k1znTtP/8VnNbSqAJ6OO68=;
        b=ACvAPTdVaHoHsUOc+TRspE3Blf45TBHkm4dAO2KOfeE1qOnr/6Mw19vs+gmG2dz0fc
         T6V9weg8CN3HXGDSLSciwbb9XgX5zFxwYuVM3kIcp3hQQ5yMOnXrB1GzTDs1Qmab45YD
         zBDIOvC+HQZBNpHxHlVb7JWOLckdP2na72Y+Wt95r/2fUr5U4to7JBZ+fKyvvu1UjrnN
         YG+AKxYNmI0Ejd6TnEBPo440U7o3LTTq5Q5R5vtf3j74ouOeQPJdPMsxFDhDmPTA6ekH
         r50M+jL8DfS16wfdh5P+Nh3drEzqSq4WqtlOh1YdQ3WxvxS5gocS4cUjxJyZ390VAg2i
         f3pw==
X-Gm-Message-State: AOJu0Yx+98Ws6diSI8bPZecXMVcNXerzHgf5t6JUgQtJp3sei77JgIvt
	rV/dyfoK9dPbeFwPhqKVYfMMSMvR3MyHc3lnkmqVcQzkgIViQ7cI0CUR68LehEjg1ziv1A3Rlbb
	S
X-Google-Smtp-Source: AGHT+IEgMIv2gL3Aatar1mwdCFXhkuOhg+VM/OejHTlFjUKPHyiXi8D9zGL6uAVojkH0+MX9zWIuUQ==
X-Received: by 2002:a17:903:986:b0:1db:db5e:6712 with SMTP id mb6-20020a170903098600b001dbdb5e6712mr17626693plb.58.1708615865032;
        Thu, 22 Feb 2024 07:31:05 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id y9-20020a17090264c900b001d9a40f50c4sm10356753pli.301.2024.02.22.07.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 07:31:04 -0800 (PST)
Message-ID: <65d768b8.170a0220.a397d.1ea5@mx.google.com>
Date: Thu, 22 Feb 2024 07:31:04 -0800 (PST)
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
X-Kernelci-Kernel: renesas-devel-2024-02-22-v6.8-rc5
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 23 runs,
 1 regressions (renesas-devel-2024-02-22-v6.8-rc5)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline: 23 runs, 1 regressions (renesas-devel-2024-02-22-v=
6.8-rc5)

Regressions Summary
-------------------

platform   | arch | lab             | compiler | defconfig          | regre=
ssions
-----------+------+-----------------+----------+--------------------+------=
------
imx53-qsrb | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig | 1    =
      =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-02-22-v6.8-rc5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-02-22-v6.8-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d93b156af0b8c2afc4cad503eb2be252797d5e42 =



Test Regressions
---------------- =



platform   | arch | lab             | compiler | defconfig          | regre=
ssions
-----------+------+-----------------+----------+--------------------+------=
------
imx53-qsrb | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig | 1    =
      =


  Details:     https://kernelci.org/test/plan/id/65d7359c3c2627cbcc637012

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-22-v6.8-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-i=
mx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-22-v6.8-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-i=
mx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d7359c3c2627cbcc637017
        failing since 387 days (last pass: v6.1-rc8-929-g112502470f50, firs=
t fail: renesas-devel-2023-01-30-v6.2-rc6)

    2024-02-22T11:52:38.503686  + set +x
    2024-02-22T11:52:38.503834  [   13.438363] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1027368_1.5.2.3.1>
    2024-02-22T11:52:38.611037  / # #
    2024-02-22T11:52:38.712099  export SHELL=3D/bin/sh
    2024-02-22T11:52:38.712503  #
    2024-02-22T11:52:38.813229  / # export SHELL=3D/bin/sh. /lava-1027368/e=
nvironment
    2024-02-22T11:52:38.813645  =

    2024-02-22T11:52:38.914447  / # . /lava-1027368/environment/lava-102736=
8/bin/lava-test-runner /lava-1027368/1
    2024-02-22T11:52:38.915019  =

    2024-02-22T11:52:38.918418  / # /lava-1027368/bin/lava-test-runner /lav=
a-1027368/1 =

    ... (13 line(s) more)  =

 =20

