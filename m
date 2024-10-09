Return-Path: <linux-renesas-soc+bounces-9632-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E6E9972FF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2024 19:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46918B20A28
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2024 17:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D48D819DF64;
	Wed,  9 Oct 2024 17:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="wxvSKcQb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C972110E4
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Oct 2024 17:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728494865; cv=none; b=N8nN67pcZZ/xFnik4B8AtlEpu4/tHu/zMdylwLsS7IaG3eIyULMToOqcOWFakysIW0xLN6VuV9WUIFrawjFALRWPjxTAoeOb7QeLBpnKf9ka1RDz3XgVc9uUkYnviDfEwuVvnrz1Lp+2axbv0bPFyrcCXxQUvCa60ogPHIWB6rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728494865; c=relaxed/simple;
	bh=z+Pd7IIB3duncHwlBo16QmEG/71UQwt5ZidRhpONQoU=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=pD91uJfAm0T4ryHsqtz2KEA/BBPuV/TmW5UxZ8S7q06nLynCw3bqA7SbxW/eYBhNROk0TjvG9hbjqDlYx62HLU7ZvNybnKJlrX0TR5oF3RjlVOafv3eLuyFPD2weYoJAN7PHIupO4zIcGJz34fDpr6NC8TOSWsTNAgQ5J3VR39s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=wxvSKcQb; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20b7259be6fso79252855ad.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Oct 2024 10:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1728494863; x=1729099663; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KkyLhcG2WOl7gHHZP3VgrFA+cNUdNUrHCRz6ckuyfHU=;
        b=wxvSKcQbCM2TPInqLx1dA5n09HNXHcnT1x8ZUXfgH8qeWCGpRCsdFpC1FSA28gUOEc
         18ETZLEA35DgsfhvarsN7jBegNNtaMWzkWGKz1GjmVTOGBxvNh8rbyXnwWcGQhzhDupW
         ozoFBQd6w8/vCynYAOr4wHt0KHVdgS+6galYjJlq0bXNnJoSlvnfNivjZQu0r10c1D3Y
         CjRNw061J/4XYQIyQ6seJSDvkkPr1vyt17OR1pUx9j1JnCZZtWYC8PwPr0a9KRBydGzM
         w3tOlfmtKe3x2qa3lVO4+q6a3iGeOLzjgwhKFOpZfOZIMKDgnVEe06/gKWLwwIuEcvgP
         KyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728494863; x=1729099663;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KkyLhcG2WOl7gHHZP3VgrFA+cNUdNUrHCRz6ckuyfHU=;
        b=QY3Ynxhunm2XbdWj1RqEjIz+c+7pJyx5eQ7PLyP0RKZ044TzUcbgH9XXb2pEJYML4e
         16Pb+s+qn3pVFrTiy7Z/MzB7GMC0PVi1sV4HIwsAuVtcm2fLO+NGbYrs6Z+6AllQfj5y
         lQ2GAILtM9Hfpm+VzK8cDbBEy7Dzk16I3kuLlmhdcpdVScbAA+SjAZt2VnvP8hyhFV3I
         dpVshVitjKv4djCgnQstQw/2zeWGtivUtXrabY5/fJaaZ7poLRRSoUgL8X0gHg3Y1AkT
         wUP3KZyQIisovkcCGofD+2aFRy/XMs1eg3sbX+ZVGB3zRh495tqq6A3vKamSEfV0GIve
         5pgA==
X-Gm-Message-State: AOJu0YzH3E7S7LeyXo8bv+ElRa96alav80Jfv21AO+v+w8LL4BnRQfSn
	qa9aQ59UpDL9ePjQN6L0Bl6IitWTkSr4JLgmO4XziZeCn7j+VzHSgItaJjz+SoTCnmIgHp//r1n
	Q
X-Google-Smtp-Source: AGHT+IEc8Uoh9bJbrgMeHk2J1Ln804GdFo+yXD35WM/auTe2jAP7rXUlZL5sECkkhyCnD2+loV8AWA==
X-Received: by 2002:a17:903:41cb:b0:20b:b238:9d25 with SMTP id d9443c01a7336-20c6377d1femr60059395ad.38.1728494862821;
        Wed, 09 Oct 2024 10:27:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c801bef43sm1291135ad.283.2024.10.09.10.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 10:27:42 -0700 (PDT)
Message-ID: <6706bd0e.170a0220.1bfe8b.0d6b@mx.google.com>
Date: Wed, 09 Oct 2024 10:27:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2024-10-09-v6.12-rc1
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next baseline-nfs: 13 runs,
 1 regressions (renesas-next-2024-10-09-v6.12-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline-nfs: 13 runs, 1 regressions (renesas-next-2024-10-09-=
v6.12-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab         | compiler | defconfig |=
 regressions
-----------------------------+-------+-------------+----------+-----------+=
------------
meson-g12b-a3...libretech-cc | arm64 | lab-broonie | gcc-12   | defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2024-10-09-v6.12-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-10-09-v6.12-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      8e106607125088f8ed52734eef1cb8866da9660e =



Test Regressions
---------------- =



platform                     | arch  | lab         | compiler | defconfig |=
 regressions
-----------------------------+-------+-------------+----------+-----------+=
------------
meson-g12b-a3...libretech-cc | arm64 | lab-broonie | gcc-12   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/67068e16a5460375f1c8688d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-10-09-v6.12-rc1/arm64/defconfig/gcc-12/lab-broonie/baseline-nfs-meson-g12b=
-a311d-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-10-09-v6.12-rc1/arm64/defconfig/gcc-12/lab-broonie/baseline-nfs-meson-g12b=
-a311d-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/67068e16a5460375f=
1c8688e
        new failure (last pass: renesas-next-2024-09-02-v6.11-rc1) =

 =20

