Return-Path: <linux-renesas-soc+bounces-2410-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BEA84C181
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 01:49:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FB0A1F24902
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 00:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54CD7BE4D;
	Wed,  7 Feb 2024 00:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="muMlXw3Q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2288F55
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Feb 2024 00:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707266958; cv=none; b=RN5oCwT/OOpXs7zQWnAnMZ8kS10s9wSVcNjq+2tXgDf/auVyB/napdwMoluoCG+vHFvizwEOVceOWwjDLjXeOPjZRmh9hcgXy4/0IlzPrVcU7MffgiXrT8b7Gz1pia1yeTBnDSl/pd9lGLf6hrr+fkWqIKH7Bc6Amgfd0bALCAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707266958; c=relaxed/simple;
	bh=vIdwhufOqO1j61rDdCdGVO5E9i3RBPC5S4m3tCPoh0k=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=IcPM1ETZXXTSu5dl67z8U19KudVG9WjcsueA5AJ47VvudlpqI1qNkRremVPq2o1CH/8WtA2cY9Q2t1FuWg9xZTUL1XvPbngvYW/3ULr5SpkkC09pKXaJB7sSmhwM9PGVX3Dl/Tc/6UAcpOf2qVD0ZrOw9nNFFHSgCthtDumXopI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=muMlXw3Q; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6da6b0eb2d4so115442b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Feb 2024 16:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1707266955; x=1707871755; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WdDHAqKGxbyzKHbBAAhkjB7VYuS8lBr9QYYzWdvgWho=;
        b=muMlXw3QWEZU3+zpjHWHQXMkDyrIJzTwPUKH+uyNb0fwbUwy2iWIZgjWxHrLm+uxQ1
         hE+nja7LiY2fUNlXDjqK1H/U0ryeCLVo8i4Q+23wBAWNSOT7OsnD3DDE02Hci6zxyVCg
         vcmw04sBMWNZTc15RPx1IggTdJ+1vht4Bw1ydd6+r1wPykFk/19XsGmIh+QdXyOCqU77
         poq8KU8jRPKBqhEDLVL+kWf6GymoukMdqgTetUlyiFCivIhQVlr5cXJqHEWIjx38oJnq
         VeumeXABcQ+kwd7nf9s0a9YJbUmestdn7437zJERem+MGlSZCqIYxg+6no90WLoDHAw9
         gtOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707266955; x=1707871755;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WdDHAqKGxbyzKHbBAAhkjB7VYuS8lBr9QYYzWdvgWho=;
        b=iQELsG38Z6etfK6qW8IZ5SGYPNDdOHFHyeMfReEaFOSpjZzaiiLe0hhS1lQE3cSxF5
         RDL+FSBakAryDAB1LVtZ7rO3vlXuM7UW5P6t44+JSdRe/zJrAL4/dB4u1NWj/ZTDFcs/
         bdrmD1QST3S4m/rt9Ld853BwFIa1HkV3TtE5E3wLhKhcvHgaEMFTRnDPumHDipxDym7L
         5/6RtxGVgLF9Ookdlub69WHsIgMN6UQ7cuIs3v2n9P6gh0y7EJZ+LYbrYXvOREHECSlI
         kNHZebopBKMXtZYHWP+JsSlr6BAGEo6b0fDyoqpjAzhwjzy0GGR+C48UV2AnKMfRnv/r
         UYHg==
X-Gm-Message-State: AOJu0Yy3+JZfpBXMXNc63vKlDmBJg5q7IydZZcEku7XVp4fG+6CmpuZo
	DjTFG+ekqOz80vzDlwOwZI7qVrEbNR5jUu3qlaVLoo/nxXfw6gVujy+poeS5RGeWSzD82MbwzNQ
	b
X-Google-Smtp-Source: AGHT+IGerY9oRRnAgYjBznfXA8LLLFdpGPkBg9EesZuWeAnkMxEH5EEiAi0uncHJRV98ekCEWMlwXw==
X-Received: by 2002:a05:6a00:be9:b0:6df:fb02:c618 with SMTP id x41-20020a056a000be900b006dffb02c618mr1144556pfu.14.1707266955493;
        Tue, 06 Feb 2024 16:49:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVuH3vPFViWLzdBY1TO57zmHhRof1mrv1cgyKqOjyACUrPpCwtSP/9ERY62PXwP2kZlFSrmOKkiLbgypXwf2HFDs6WZ52iu0fRTSQ==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id j20-20020a056a00235400b006ddb77d443asm111302pfj.209.2024.02.06.16.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 16:49:14 -0800 (PST)
Message-ID: <65c2d38a.050a0220.6acfb.06f4@mx.google.com>
Date: Tue, 06 Feb 2024 16:49:14 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2024-02-06-v6.8-rc1
Subject: renesas/next igt-kms-rockchip: 1 runs,
 1 regressions (renesas-next-2024-02-06-v6.8-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next igt-kms-rockchip: 1 runs, 1 regressions (renesas-next-2024-02-=
06-v6.8-rc1)

Regressions Summary
-------------------

platform      | arch  | lab         | compiler | defconfig | regressions
--------------+-------+-------------+----------+-----------+------------
rk3399-roc-pc | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2024-02-06-v6.8-rc1/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-02-06-v6.8-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      91487349a9c3f75c983229f900978df1d14e7ff2

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  75254bf2390c10644ffb35a90fc8f18f196f9f0c
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  0830aa737c4447599d9cd5cf3d2c759e8fc73569 =



Test Regressions
---------------- =



platform      | arch  | lab         | compiler | defconfig | regressions
--------------+-------+-------------+----------+-----------+------------
rk3399-roc-pc | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65c2c75fccb5b852d28e1f00

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-06-v6.8-rc1/arm64/defconfig/gcc-10/lab-broonie/igt-kms-rockchip-rk3399-=
roc-pc.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-06-v6.8-rc1/arm64/defconfig/gcc-10/lab-broonie/igt-kms-rockchip-rk3399-=
roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-ig=
t/20240129.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.login: https://kernelci.org/test/case/id/65c2c75fccb5b=
852d28e1f01
        new failure (last pass: renesas-next-2024-01-31-v6.8-rc1) =

 =20

