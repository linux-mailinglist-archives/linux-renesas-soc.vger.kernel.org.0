Return-Path: <linux-renesas-soc+bounces-4257-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85192897921
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Apr 2024 21:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45511B2783E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Apr 2024 19:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 958841401C;
	Wed,  3 Apr 2024 19:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="29BZVjet"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DA6524DC
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Apr 2024 19:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712173165; cv=none; b=ADiLavKg1Be+ufR5Yrpa4McKSFcnDsnswBdNhLQ63bEekltiOznofrSufQKd3nxJn9yTndom+M4Q/kksqp8IaILwMTJXfmnW5d2bl/sknMTYaVTAsl+awVKfvdVD7ftXoVjKV/rIGEASQBAlK7YSjzTqGZQp/2pj87sUcV97TA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712173165; c=relaxed/simple;
	bh=hxhzwntv3AAxddjsIFsCCUjSvEA0vDAVlQdmfZnUA3g=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=qz+e9JnVaoCnq/upS9+pTHoUH8s7tUh46JWfxWhQj62QK2E3SXGyWt6hffo+88IHXwdsIBJXEwYQOVxQ4ViGXH5Kaw/11aw2Jkl+f4UujQueuq+B/O/bXMt5Yrn4w7S6fmEYfjHjaJ1dpZxp/lBIxHFizbXLivglV8MI/dnaRy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=29BZVjet; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5a7bbafb8c0so162493eaf.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Apr 2024 12:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1712173163; x=1712777963; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uIqXAn9sAz1DQYjLCAOu2v9YGRXPyi3XMfoKV6N34ro=;
        b=29BZVjet6ENTnlB7c1qqipkYq+6mmuk9vGnyQWcA26Q2EO9ehPRFKmwT1SfKQ0cfEu
         PmLRgf7B6C2yIlhENqayl2LeNMbVgPXVkIxrt4zD2ssYxT4warhwQcU4/LiqZXhOktDW
         VGLmxbXIokYOtxLBK/9oXqtH2a6IwKBim157+J7KrGimPDQdo0XvI+8J33paHTY2CXiN
         ZJRsZCM76MZYSVvRDthxot8fIiJw0bnStEG49VCIHo14XPHHBLca3GDtlxWgxBwDnTuh
         4McG86VkXVs2jMtbswv7Y51K9BHpqN/zLs1KQ6G1f4HkpelyfkCmq4BnanE+XN0y3GSO
         7xzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712173163; x=1712777963;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uIqXAn9sAz1DQYjLCAOu2v9YGRXPyi3XMfoKV6N34ro=;
        b=HYpU9/cEQ8ZYCTjOsc7fuVQBxqk/24q+a6R2Ci18sSOEbPwlT4KQPzRyRn7lF0UjlF
         JlvopUAErtMlYDsfHRzuZMcwfEgXFJk9OPmD0iENwSJKIt9zTTh0nMh28p68UiRpW03u
         K0l9xTXrrOie4xMeBR9wFJhUgfQasg6J5ESMETNtIPu/Ks/veTiOGaxiZAp6CZkfNH0a
         GhEgf9BKjtUkMLH71+on5S2ep1WtnTGmFMH1xqhWsNni5GdVI9sgSVeQ4tKqxwmtKFrK
         pde5qir6hcuvZbfdWj2S7l6+HCWSaLi+BPnfrB8FxMoh023vhize8J9kRNQ/7DIeAwh+
         swZA==
X-Gm-Message-State: AOJu0Yxks5VRdFa/FW/1T9TGrfH2dbiZGSL7KVhD1ZB4fjrqHR+xop2H
	aI4kSrIijHzUvEmAPe9Iu0FQKxJl28Vvwbbi3FF2Qb3FX2mmeKHz084spbvkwXG8IMD4imuoRgQ
	xhT0=
X-Google-Smtp-Source: AGHT+IGzTtiXwyj39amZDcbDMD7MgkN2P8bKEvytu9Sb49QjTGz6mwuF2MhK5Z19FbuWaSgl9LGuNQ==
X-Received: by 2002:a05:6358:4681:b0:183:bbd3:ee37 with SMTP id w1-20020a056358468100b00183bbd3ee37mr267484rwl.8.1712173162588;
        Wed, 03 Apr 2024 12:39:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id l198-20020a633ecf000000b005f05c9ee8d3sm11766995pga.93.2024.04.03.12.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 12:39:21 -0700 (PDT)
Message-ID: <660db069.630a0220.28cd0.0cbe@mx.google.com>
Date: Wed, 03 Apr 2024 12:39:21 -0700 (PDT)
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
X-Kernelci-Kernel: renesas-devel-2024-04-02-v6.9-rc2
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 64 runs,
 1 regressions (renesas-devel-2024-04-02-v6.9-rc2)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline: 64 runs, 1 regressions (renesas-devel-2024-04-02-v=
6.9-rc2)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-04-02-v6.9-rc2/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-04-02-v6.9-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      8a5076d03555d412a898f91ba3db257233fc4c83 =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/660d7f00adbaecccca4c42ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-04-02-v6.9-rc2/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-i=
nnocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-04-02-v6.9-rc2/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-i=
nnocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660d7f00adbaecccca4c4=
2ed
        new failure (last pass: renesas-devel-2024-03-12-v6.8) =

 =20

