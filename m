Return-Path: <linux-renesas-soc+bounces-10454-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C141E9C45FD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Nov 2024 20:37:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A59A6B272CF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Nov 2024 19:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FB3D139597;
	Mon, 11 Nov 2024 19:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="fFFy4KSD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9096C1A2653
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Nov 2024 19:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731353816; cv=none; b=dwA7OG5Rd0pcTFJhBY2mHvLf0AYc/vMesTa2fP/Wqjd1RmH1B/L4vET3bh5t5qh0TuoOdYyHAjOv5fXY8PCmFkohAHxiAGw2HoKnjV//OoR0VuY/pPlzmBwcwvM6WPv0DYmF8xhr+nWxK340VlQRQMzdZHovCsRqXSco6TpV0Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731353816; c=relaxed/simple;
	bh=oEgoXaV9SHDIK0arnUJlgQYvhHcTcawOgy9PFacKRrA=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=c27hCEos/dFoeONSjIZGQbSNaZ2i8R41QXp2QJtq/9OUSuPxKidaUoCN5x4nzwYQY7gk3RZozSgK6H1VVa3KsVpq8ph7ISiZ1NduH6k7r+dOD3TxyDy4DlJuIt18efxPbqLVlA5BiJvQMC0uu2mZgTmXIqTCAxmV+6I03sIVVCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=fFFy4KSD; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-71e61b47c6cso4447607b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Nov 2024 11:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1731353814; x=1731958614; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=imorSnWZ2UXtcUaxkjpVZ1rL+ydEcczfYiRzIbhVAQY=;
        b=fFFy4KSD9Mx0+fz1TVj7RT/Mis2RldHAr1/MDp5SxWWL/jQwbwWo0XzrkS5qwMkQpn
         qUa95EYk7lJySbUthXYaVeKdMLqcV0H2XxaC2PwKwVD0q1xTRVlfCZu3RxlBVT6KdcR9
         Va0hp/NykJgrokyB8TJ9L4/t4gZNIz9Az1pgW6GPufch+Xl6hzo6IvrS1nBM1KVjvhQ3
         lobg7BJitYv/bNx1HJFUuXmQBl2yazSlRZmwd8gmci9xXzI6NlHbNQ8lPFNLwClx7Gx5
         75dI3UoPoAeIsOnzLwHv+S14WadU4fzVgMF/8nWIkJgqlok3Fp6NurPQQ4I3i8vpAHTb
         jTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731353814; x=1731958614;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=imorSnWZ2UXtcUaxkjpVZ1rL+ydEcczfYiRzIbhVAQY=;
        b=SWOJtLHSk8/D8QNeg6bTW3fwIaXIIHUCX2TWxWj50v00VpFGumIdPjQemAR+3LXgYJ
         Y01lJQaR5wzKByIgV2e8MESx4YXz+TaVUjQnLIpimC1O7lrLRQ4TJDCxSkeEAP1mzuro
         y4KaT8ZuY3NYqF6dJfqQIddv26mD3qnWtpxKLgEgE+00SaBrzOKb91QOFUJrot8h8LD4
         cM8oP00wK9Gb3gWIAZCia3ISYKiuzBmcdSYDd/f6TJMUkCXIOSC5MnBIb/Q6caFIiPfJ
         LgrPAEioRvWBMeerS8FOL+4QiSLdKSYo6kdl6sUYOi80zLmwkkdIvx/bqzHUF6ER22/2
         qsyw==
X-Gm-Message-State: AOJu0YxSk6R1nrOeoYf4snGVoMOpDs5Ni65/pB4KduOhaHtdr9jVTg17
	CvOgKYX50MvBCy0t59xP7RYcmGay6yQcRzjdqBHEKFQdgPRkj1sf2rTiEeYQ8aBRAdBrezDXg9v
	8
X-Google-Smtp-Source: AGHT+IGggVEJopAHOqgqWEOPVqq9+Qj9W1+enpW+UW3X+WXmZ3pppcwPkmHWPoX2iu6o7P6Aj6RdIQ==
X-Received: by 2002:a05:6a20:918a:b0:1d6:fb3e:78cf with SMTP id adf61e73a8af0-1dc22b91c6amr20401643637.41.1731353813708;
        Mon, 11 Nov 2024 11:36:53 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72407a18d8csm9872508b3a.149.2024.11.11.11.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 11:36:53 -0800 (PST)
Message-ID: <67325cd5.050a0220.28e0a.76ba@mx.google.com>
Date: Mon, 11 Nov 2024 11:36:53 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2024-11-11-v6.12-rc7
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 33 runs,
 1 regressions (renesas-devel-2024-11-11-v6.12-rc7)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline: 33 runs, 1 regressions (renesas-devel-2024-11-11-v=
6.12-rc7)

Regressions Summary
-------------------

platform   | arch  | lab         | compiler | defconfig | regressions
-----------+-------+-------------+----------+-----------+------------
imx8mp-evk | arm64 | lab-broonie | gcc-12   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-11-11-v6.12-rc7/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-11-11-v6.12-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      19db22ddf56f0a2c3593f072225c8f9b4a0cb26d =



Test Regressions
---------------- =



platform   | arch  | lab         | compiler | defconfig | regressions
-----------+-------+-------------+----------+-----------+------------
imx8mp-evk | arm64 | lab-broonie | gcc-12   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/67322cf8d25ffae602c8686c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-11-11-v6.12-rc7/arm64/defconfig/gcc-12/lab-broonie/baseline-imx8mp-evk.=
txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-11-11-v6.12-rc7/arm64/defconfig/gcc-12/lab-broonie/baseline-imx8mp-evk.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67322cf8d25ffae602c86=
86d
        new failure (last pass: renesas-devel-2024-11-04-v6.12-rc6) =

 =20

