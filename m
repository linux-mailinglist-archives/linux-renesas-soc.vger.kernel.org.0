Return-Path: <linux-renesas-soc+bounces-5567-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9768D2742
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2024 23:48:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 068721F2501B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2024 21:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C635826AED;
	Tue, 28 May 2024 21:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="uQZIlKgu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3176A1DA23
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 May 2024 21:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716932915; cv=none; b=LBpqYSovCL33W7p057vmPQ8QzG7UUsMDkYUg47fUxh3Ox9yGxpPfUwSwaMAKUmH8sf5RXYIhh971tOQAyruuGxBglsI5xll5Y5T9YXoqA9cN4AevWjs10jf/uzrKItUD/Qj0aqBgIFFn9PPc/Uo/hrp7yGB+yfG52+3lxCuasBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716932915; c=relaxed/simple;
	bh=PlxXSqJB+uZLpg7W4BImx+GDuPowp9MYgpBgmOBOR6g=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Zwhdn7AtbWdYiOqnLuyqv4CpOhm5kXzBEiJw74YzZrWSz3SM9ZZCeUHDtSu2qeWlkoXkB13vMfuI4eublMGBLwKRtD9i85vWwS3wFOvJlBCzOHsKYm3DjO7MelS+uk3ElqCGpIPzUoD0tDxaoYRcyIE2V32ND2sdTXROXRHS2kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=uQZIlKgu; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f4a52b9589so12409415ad.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 May 2024 14:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1716932913; x=1717537713; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0e8Rsorlse9pieH8SbPZuz1H76Iq0lrQQiwCLcxKMs8=;
        b=uQZIlKgu94t+NWN+HnBalv0lqF5CNLr8mRLHhitzOEmtW2i6ofck15RETPK7ZbQDa0
         vYKTGmkr1Xhja0j66/8nnpQp7lff2G/lslgNnhmHMOKHt9rfEpV1eF85OQyufUJ71v8H
         guSF+p54WTWAgwGncPVWC2JjcsGq/3R/DHlfhmy3CTfeAxq278I2Zj3hYIe7PKBJgYdQ
         4a7FnscVwcAt2YhMJlx46JFVe2BcTeUamMuJcwYRsfpd94d8Q/tBlAG1edDwGZw+aVbb
         b1ojHVACDy/d4OeHbiKV/DDpXXbaUsxde5vTLLVbpm7HBWkdvuEzogK0bcTvhpiMbKdU
         HL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716932913; x=1717537713;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0e8Rsorlse9pieH8SbPZuz1H76Iq0lrQQiwCLcxKMs8=;
        b=pKHhommWgQsdduc5vszPPIHtVu4pwiNf0iQO/cgCneamxZH2F4MAcxN2f/i4fjWQ+K
         Ndht8Kb85YAaayOmnhO42VbiWmj8+cxzYiRi5mTbZIj+T91wJe+PH0VkgKmbeVt/o9WO
         qHBl9Kc+LaCyqx1HhH7rAv6NeeGUijASQVxpb761Q+5Z6y1+dXSIRCt9SdXHfE6nmOS6
         9Rijna38G+uoRFVFksMPwGGf+UW77weNTpH4ESLMCHvKssxFAFlXhn0sgTrcSGV43VEG
         Cavq90CQjJTXy4N0IMgHKBUj6/vCXVPZZmV41gSW2ojKNCEW0CHjzLc2ptXAXb/WPkrB
         brYw==
X-Gm-Message-State: AOJu0YwmSBjejThVTIQJrH5ueZfxP0TR/JQR43dpL8AmkfyrWpWKstPC
	CFeamMGneV36kJ3KWOD3idKZgz+8XTO0hiuPLgvY1fWSZsqQGuuLN32IIYNg+SrnAw4K7wsu9TA
	a
X-Google-Smtp-Source: AGHT+IERBoxqFnK1s8Ub9bo7A9q/pzKI8DK9MlN8B//C4XiZzMR/WQ7YW1zBc+LRJ2ZQzsGHI6Yt7A==
X-Received: by 2002:a17:902:ecce:b0:1f2:f761:c3c with SMTP id d9443c01a7336-1f4498feb95mr179107485ad.68.1716932913144;
        Tue, 28 May 2024 14:48:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c797b5bsm85238815ad.69.2024.05.28.14.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 14:48:32 -0700 (PDT)
Message-ID: <66565130.170a0220.fb7f3.5c59@mx.google.com>
Date: Tue, 28 May 2024 14:48:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2024-05-28-v6.10-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 11 runs,
 1 regressions (renesas-devel-2024-05-28-v6.10-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 11 runs, 1 regressions (renesas-devel-2024-05-=
28-v6.10-rc1)

Regressions Summary
-------------------

platform              | arch  | lab         | compiler | defconfig | regres=
sions
----------------------+-------+-------------+----------+-----------+-------=
-----
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig | 1     =
     =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-05-28-v6.10-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-05-28-v6.10-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6aaacd8306f5346a58086f9665a1e5b8c693a835 =



Test Regressions
---------------- =



platform              | arch  | lab         | compiler | defconfig | regres=
sions
----------------------+-------+-------------+----------+-----------+-------=
-----
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/66562262f590f41a0a7e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-05-28-v6.10-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron=
-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-05-28-v6.10-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron=
-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/66562262f590f41a0=
a7e706e
        failing since 127 days (last pass: renesas-devel-2024-01-08-v6.7, f=
irst fail: renesas-devel-2024-01-22-v6.8-rc1) =

 =20

