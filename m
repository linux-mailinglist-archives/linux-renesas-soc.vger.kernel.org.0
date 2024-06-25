Return-Path: <linux-renesas-soc+bounces-6743-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 988BC916957
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 15:49:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D1F3282235
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 13:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABD0F15FCE7;
	Tue, 25 Jun 2024 13:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="r/bqMI5m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D7017C98
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jun 2024 13:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719323337; cv=none; b=qpYOXB56U7jn0EmBOoO8sD9s9ixheqHSUbM6nODkigGMGDZZzuLtlAx+ckstyDfhmAqdIevyGc52AhrJYnql3pgE1oLy1GAH8JMEBxHyfdhn09HU7QDzC/QWJvzWkWrqzXhqIs5/llLHj4PqcgJh9H4pMimCPOfowMDi4XyAUGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719323337; c=relaxed/simple;
	bh=h8pWXRhOm0cCMASsmP1zGQBFuzsYdLp7Mr9qQAJ7LkI=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=np8nDYNHUqv9Zbjyi7OlarhIPfHH6TYAQKQGQIxXv5s1zjY6IbBpjyt1pjSd/k/sap2u9aefO+8e6X/0QkRslPgOZx4ZZerkr5/psattiYQjqMRdHsUK3MvGibiALcwQya9cLaHpIJPZKVuTTXMJbtvsb8TTe0FiwKgJ0OsCeWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=r/bqMI5m; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-371c97913cdso25584155ab.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jun 2024 06:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719323335; x=1719928135; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s+najxJPn9oytzqDBWZHBpUwJjUebwMCxl+qq5X22Io=;
        b=r/bqMI5m8mf2HynbilI0hECi1ClhBon9vbl3jPDIjowQ0QVU8Wm+uJ2EIldz5HVPbW
         3DVOmAYkVkmFGK6qlj7jRMT4iZxuhqCeQIY4rmAdB/Y+DRuP1Ws3+/qLjSQCxxRXSWN+
         hw90C0UUhwuRF1VAMKIQdHWOh7UtLUN5SxNZiaWvaO6inHh0OPwHrgIixu4R4eAzSztC
         TyAadpdLnTxa3oQYM2LWSy6jov8WIANdoieyNSE9UyNOWEdeMGOzW4POcyIDqMpYF/qK
         DNIPrN/c4Zp48OATrPEpd0E2GUo+4mh/YKXVgMwaX18ZWfRn4wlSzOFsEdJdsiUuY49u
         +vYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719323335; x=1719928135;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+najxJPn9oytzqDBWZHBpUwJjUebwMCxl+qq5X22Io=;
        b=HoznOTKDc9jzIJIWRRw+jEK071GYAvNMUU1L/6GITtWOquOYYxnvKzHkZGs5WlZT8N
         QHv+iJRELvffROUKQeQ4WxewKFBWs7BuDdvno6w59WUvIw9xZbbcD0kkvrjRL+lAQ9Qa
         yBSAl4Xdv6yOm2EgCYyqz56Wuf6vmocEy3C+4tMaiUuYnYEkWSb4DGgfIbb+xSoOeP1l
         7TRz1yvh4bqCkX8uyJ93wq35Frmc4AyN1t94n87xkhbAlJ1a3N+EGEiYfagH08CnorFB
         CSTCvJxzvbkmkPmnI4r8/0yZVtb72MhLCm2yTlsNh7Tk1DfsIoh0+SU8XH2iNbWJS9HV
         e1Cg==
X-Gm-Message-State: AOJu0YxPu7NGHBbmz2+Hx05zBxSi66RZKzBMBMlBQgqWUaKL0rTyvVuG
	RvaOzV4SQu1lCA7HrwvkhXa0DwyyqsLfme3R+3xdSLGzQNV1hGniOf65pSpImNljBipoGHZD7rO
	K
X-Google-Smtp-Source: AGHT+IGPqFcp+a7TG3zB7YjRd8f2kn9qsJlcGUy4rHFO2OcOke1YF1q+XJOvMnUDnH3sNRi7jgmUiQ==
X-Received: by 2002:a05:6e02:1a23:b0:377:1655:cec9 with SMTP id e9e14a558f8ab-3771655cfe9mr2027585ab.18.1719323334869;
        Tue, 25 Jun 2024 06:48:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-716ba7a12e0sm7003128a12.60.2024.06.25.06.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 06:48:54 -0700 (PDT)
Message-ID: <667acac6.630a0220.d3d96.20c6@mx.google.com>
Date: Tue, 25 Jun 2024 06:48:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2024-06-25-v6.10-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 19 runs,
 1 regressions (renesas-devel-2024-06-25-v6.10-rc5)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 19 runs, 1 regressions (renesas-devel-2024-06-=
25-v6.10-rc5)

Regressions Summary
-------------------

platform              | arch  | lab         | compiler | defconfig | regres=
sions
----------------------+-------+-------------+----------+-----------+-------=
-----
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig | 1     =
     =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-06-25-v6.10-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-06-25-v6.10-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a2cd07d05e9c0f9c6b389c3314e180f9abf3eece =



Test Regressions
---------------- =



platform              | arch  | lab         | compiler | defconfig | regres=
sions
----------------------+-------+-------------+----------+-----------+-------=
-----
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/667a9afaf4bfbf624d7e7154

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-25-v6.10-rc5/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron=
-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-06-25-v6.10-rc5/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron=
-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/667a9afaf4bfbf624=
d7e7155
        failing since 155 days (last pass: renesas-devel-2024-01-08-v6.7, f=
irst fail: renesas-devel-2024-01-22-v6.8-rc1) =

 =20

