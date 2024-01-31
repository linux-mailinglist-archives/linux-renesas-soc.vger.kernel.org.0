Return-Path: <linux-renesas-soc+bounces-2180-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CC28449E5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 22:24:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0943284BD9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 21:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08AF13B2BF;
	Wed, 31 Jan 2024 21:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Vb3cgzzi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA80438FB5
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 21:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706736066; cv=none; b=J5696IrHwimpyf3T4ERuqsYiRVlqCxglk8ePQhp3plzuOMqfIzw0oxBo2i7pw+vBsm8JkVkkKSrFcVopuMM7/33AvxQ9Y6wZUq7bIem/Tdc+9KI1bg8NiLtWQsknVXocMt9mh7OB6o/wReL7u9bNBBGUPZ3NnIPwgsIkBnHeWMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706736066; c=relaxed/simple;
	bh=lC/1okSTBrRGrQNh+NeFiE7XG6yzLKA6ZCoxb9aRb04=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=M4NMVAJdHjvydykUoxA/3/lIXEUvJwHB4we1mCYhwWbj5XemJg3All5EdzGT0nhQGW6nL/sZcd5Cph2EFriqF1oBEu3Sm/MuUtJX9+V+Ry23fhJT+ILGmJuVsPidHkudAi8USot5DX/tAMQx3CVFTw5fzE4uZCcOf/q6uYNoDEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Vb3cgzzi; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d932f6ccfaso1889365ad.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 13:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1706736063; x=1707340863; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Po7ZCZbbKN0YG1GqQFdSLg8aai+kU+WvytTmgAWjwk4=;
        b=Vb3cgzziz78bonH4oBNDRpASbyaT1vYpnHOAoUXwGWJsXTWp/rkJztCbItRP9cSkQ8
         hVr65pBWGqM8yQJXSTXh6D5hxSYqCSmXj1Ap8aDvGylJHJ5WrjZNbvlpqcF/P+5KxzKW
         zwHMPbI80BT4dnW2wP74w/kZva1Rtmgm8s1ky7w76IKMe26emQu+Xqs+iobUClb9H6pe
         6LTd1BNZP8yXW2/dD8bfD7sWV7JAoyCLdRKBh4cVEWmJwTHtQIkkpe3b6CkTvcv9A4yg
         pc9ynV81LBTdz19ahWyoPJ34NrzBbrnwavqKV52ACLLnS2PDAFch3/66i7yoldoGdTKQ
         lVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706736063; x=1707340863;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Po7ZCZbbKN0YG1GqQFdSLg8aai+kU+WvytTmgAWjwk4=;
        b=vxQQ7CykqGv+ank5QhY1GEVtSYpMAvJJG52aQ85NuWYJli3ophRmEQ+MydH5pdOM19
         0j+zjHrwACIF7FIZVPLbIfOLS2i7GcuL3Qj9jHfMe+nzDoFulO63RvXG/ZYpIesH2Bgc
         1plikNHFx48G2Yb1GiR3q0RJwT8KxC0mjUOuL1QWxDe+f3MGQTS7RbutGmcBOdcupEH8
         HmyeEHcfFte1Y4k/ahBt7z6vtgG2h4M8IXxgs5/JHDA0u4+WXKZmd1qG9QnJ+Otj0MaO
         8CCGQr3bQIJmy8gMCC3u4d21XUDWfgRXVsIiR9u1RlpvbcOVEKr+7F2TuZC6uQ+9FCeR
         jQgw==
X-Gm-Message-State: AOJu0YxNxtrmcM5HPNuz518682zGp+9iBRDIgvtKXjDJrO6LTXwooZ3L
	OvyyjfGID53jMw79lyfFMGt0He+alEnthcBFhuUV0FzBh/O52pijiuq4HIh1M0lPCXWaSo809CC
	p
X-Google-Smtp-Source: AGHT+IHm9NoHJTwVazPWWWIFk+dr/PCRo57EU2x+PfypCIXwoka9O20kO46Ru0Qjzuxd0oSPhonRwA==
X-Received: by 2002:a17:902:ec8f:b0:1d4:14a0:bf66 with SMTP id x15-20020a170902ec8f00b001d414a0bf66mr3519720plg.23.1706736063543;
        Wed, 31 Jan 2024 13:21:03 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUPum0m+zP3gFPFBytW6OzdQvqFgjl7ObWwfW9G9gDfCRb130rNTd+gyWQNfyNmFuvTvVttPyCkQtgzHx7n/vuWnhYcxO90A7PZxA==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id kr12-20020a170903080c00b001d8f82c61cdsm4879453plb.231.2024.01.31.13.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 13:21:03 -0800 (PST)
Message-ID: <65bab9bf.170a0220.161c6.1937@mx.google.com>
Date: Wed, 31 Jan 2024 13:21:03 -0800 (PST)
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
X-Kernelci-Kernel: renesas-devel-2024-01-31-v6.8-rc2
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 22 runs,
 2 regressions (renesas-devel-2024-01-31-v6.8-rc2)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 22 runs, 2 regressions (renesas-devel-2024-01-=
31-v6.8-rc2)

Regressions Summary
-------------------

platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
dove-cubox            | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig     =
     | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-01-31-v6.8-rc2/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-01-31-v6.8-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      7d7dc8c44825e8fc58f8d9e23b06b9b82183fd67 =



Test Regressions
---------------- =



platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
dove-cubox            | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65ba894a73768ef4d300a03b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-31-v6.8-rc2/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-31-v6.8-rc2/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65ba894a73768ef4d=
300a03c
        failing since 78 days (last pass: renesas-devel-2023-06-26-v6.4, fi=
rst fail: renesas-devel-2023-11-13-v6.7-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig     =
     | 1          =


  Details:     https://kernelci.org/test/plan/id/65ba89f415e7cc638000a042

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-31-v6.8-rc2/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-01-31-v6.8-rc2/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65ba89f415e7cc638=
000a043
        failing since 9 days (last pass: renesas-devel-2024-01-08-v6.7, fir=
st fail: renesas-devel-2024-01-22-v6.8-rc1) =

 =20

