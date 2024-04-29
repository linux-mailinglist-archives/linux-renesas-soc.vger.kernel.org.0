Return-Path: <linux-renesas-soc+bounces-4934-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1B48B588E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2024 14:31:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A82E21F2402E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2024 12:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA3CBA39;
	Mon, 29 Apr 2024 12:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="e20oAjFl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF61C5256
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Apr 2024 12:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714393877; cv=none; b=j/Cwi3NZHfcfPxfOuyb9zhtixLFydMRd5saJlGZe9eB8z/zPkFcHxe0MyrYVlNPxBzhmC/B+DuHhGGN/71KV8GCQr37Gb1g6HDnY+j9E5nsj6p7qNfKX8cOpFmbTIWOkm5+O2bdG8bd5eXMfz1FRxo+ZCzCp9iqsBBQz4GrLDa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714393877; c=relaxed/simple;
	bh=P+H0WzrUwZu/A8aaRaJTmS8788Byv1UEy7CIMfTekMw=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=P78YuLZXTUO9IpMKB06RBplVPn7eli6o189iKEbHjp2KkbNCF3uAVjZGhAt/ZTK/Ubvq0/98pX53wJV3J7ID05m7xKZh+lfwD4oa8BdZWA94lcnBjHDisDbVlfMws7QvtQ1WHC3nUPW7WytmC1QgkdUcdXJXdSXca7nhH3ldOpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=e20oAjFl; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5dca1efad59so3018753a12.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Apr 2024 05:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1714393875; x=1714998675; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7FcPpqzQ9qkMTHiyVWxiY3qJTmv3pW2unW/7SHSsZgU=;
        b=e20oAjFlcJ2RjxtveSK6I3bcFRwYK8EfhVOZpP47zS07MD0l10nq/33T0emd17jVHf
         ExbhnviJdfVaQbKDEFsSNaxxDjRDgZ6ScKXxcg1aIgF0dDgK93B3Dyde89zl7LN6o9Ze
         SbTRvAiH7ACW1AlQg2Siyfp3lzewn8IvxfQN6c2oFxbLlq1M2Cm6MEmuxcABpftQLhz4
         MMrEsrShn7S5U8CP3oBsk2LXPFiRcXHzX0asEmlB2koyxLujyyaJzULY8kFQwWIgvvbJ
         8YZUHHheBfISxdFvZztM+8T2SUbk7XuCodZmN4ceuTPq4hDSigy7Pg45ssAS+edwTpwu
         rJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714393875; x=1714998675;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7FcPpqzQ9qkMTHiyVWxiY3qJTmv3pW2unW/7SHSsZgU=;
        b=MZQB+8WxDWDc8RKGgsHSPo38H0YirYlhuann9mWB46ShrNWbxHNMxYgXUIDCv5aCWd
         tMavldD/vKM49RMj3jbyA76CoBlUE/58aNAojB1j1rg/91kghBZs2LyqtxJJFjZuZdfl
         f9KyuLpfrD4TSPsqqbYQUMdjxCK1MPQiKJ3hZkzSFESLo0dgmt3ic/GUj7UySdMoUh7C
         +oDhmtrI9ykXaSzfEFQV9AOunZsWoOByiv+Om3Uv7BjSsCZOvSh+oZ6u1ZEAchIDL+mf
         lasi6fZz02029QONKkGidrvbti/b2uBYeHybStNlGIXZc4j9g1MworkZ60UZosNdhYA4
         mdKg==
X-Gm-Message-State: AOJu0Yyg752S35VfyVF+BUnHTv6jIDHcPdb7g6KLux1aSqCmota3Odkr
	acijy+CkXBe3cFhInRazT7mPmKgq2Z3P7a6K7RoyCAusaiTQxthVsMvpy9OhmJekSwJM0t//ZgC
	4yHo=
X-Google-Smtp-Source: AGHT+IFfaT7qP8COGf2UwyQbvlsZPvnjf5j+GCeib8KTnSG+rRYYf44eeab07YhvZNkjtwyh20OwTA==
X-Received: by 2002:a17:90a:a58e:b0:2b1:99fd:91f3 with SMTP id b14-20020a17090aa58e00b002b199fd91f3mr2313003pjq.41.1714393874645;
        Mon, 29 Apr 2024 05:31:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id z24-20020a17090abd9800b002a56b3931dfsm18970513pjr.49.2024.04.29.05.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 05:31:14 -0700 (PDT)
Message-ID: <662f9312.170a0220.df6a7.1db9@mx.google.com>
Date: Mon, 29 Apr 2024 05:31:14 -0700 (PDT)
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
X-Kernelci-Kernel: renesas-devel-2024-04-29-v6.9-rc6
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 22 runs,
 2 regressions (renesas-devel-2024-04-29-v6.9-rc6)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 22 runs, 2 regressions (renesas-devel-2024-04-=
29-v6.9-rc6)

Regressions Summary
-------------------

platform              | arch  | lab         | compiler | defconfig         =
 | regressions
----------------------+-------+-------------+----------+-------------------=
-+------------
beaglebone-black      | arm   | lab-cip     | gcc-10   | multi_v7_defconfig=
 | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig         =
 | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-04-29-v6.9-rc6/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-04-29-v6.9-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d55c1249af5add856fe96d2f7d3dea96fa61e285 =



Test Regressions
---------------- =



platform              | arch  | lab         | compiler | defconfig         =
 | regressions
----------------------+-------+-------------+----------+-------------------=
-+------------
beaglebone-black      | arm   | lab-cip     | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/662f666b5780f685104c4319

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-04-29-v6.9-rc6/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-nfs-beagl=
ebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-04-29-v6.9-rc6/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-nfs-beagl=
ebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/662f666b5780f6851=
04c431a
        new failure (last pass: renesas-devel-2024-04-22-v6.9-rc5) =

 =



platform              | arch  | lab         | compiler | defconfig         =
 | regressions
----------------------+-------+-------------+----------+-------------------=
-+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig         =
 | 1          =


  Details:     https://kernelci.org/test/plan/id/662f6356615a86cf6b4c4426

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-04-29-v6.9-rc6/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-04-29-v6.9-rc6/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/662f6356615a86cf6=
b4c4427
        failing since 97 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1) =

 =20

