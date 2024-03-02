Return-Path: <linux-renesas-soc+bounces-3394-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DCF86ED97
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Mar 2024 01:48:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 490071C213AB
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Mar 2024 00:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4614615B3;
	Sat,  2 Mar 2024 00:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="r4QoIM0O"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA0A10E5
	for <linux-renesas-soc@vger.kernel.org>; Sat,  2 Mar 2024 00:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709340504; cv=none; b=JKB9KQQU3/eDulKT4EmoK2VRYMQRi1Fh75bzO/LS0U1Gwf/9WDAbJhRmwSlUBtmGtMrJgwg3MJcbowam2UAwCZF6JKdj2z/TyuomFiy/N7xX63hwJptTHrBAkpD+Lv+7kQgsKQ56SxBemlWBxf5z7Z3WNfpto3HC14tMmaVv1F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709340504; c=relaxed/simple;
	bh=YCZe67HmGIygaFGynl9V9JkZwOgJgmpWB0jb9IhOKhE=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=lahKBl/5Q5s5tskBQC7QYPk6IcCE9au/q3451u+r4h49u8wWKDZhJNS6h015CdiD8E4THsJxA7PStTSEJAes44sjAYFCGvBYq1wjPTHp0lkGCz3SSdO4n1EoBg8HKS1ZjlON/w/hqHf9XdFkj/D7pm4HdPu3cy4bo/lcRMTba24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=r4QoIM0O; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5ce6b5e3c4eso2013789a12.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Mar 2024 16:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1709340501; x=1709945301; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o/+mGjrj+ObLymZsalao619NALLOorC2zI+7oigouZE=;
        b=r4QoIM0OKGATe+ppVmQ8TRCz/+OY86/e9T19iEiewmuewpI889squTrdT/gb4xR60/
         oI5v/zuN7IScYlgyr17UjHNzDmmmDVgrd1RL/Cp2NmARwsWOQ22ILCghotJ2GFqruDJy
         ggq2R0cBL5BmfSahRZMsc71vdV1bWw1oWaebY4f/3KbK1iQw63mdE67/iENfesjg8RdX
         Q7MN6MeeS3d4HjT5Xxx/CCSV5xNzq9OorLQIuUUQpdUSieMqqfIB/q75Qi9cNXe2fqR3
         x2LFrzX/kO3/bYkmE1tbNBe6uNPr5IGyu2HU7G7JXmc6mrlp19RhV5Ha1rET2lv/XUI3
         G/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709340501; x=1709945301;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/+mGjrj+ObLymZsalao619NALLOorC2zI+7oigouZE=;
        b=HraWj88MJOk9Jeh31ZV7g99vNWYccoqcvIKeIFIMhtd2NnFRiCC9QhvjTtul0TzNrQ
         k13dGrNellAKY3vWWdCiev4NiSdDYGkpg8B15mH6KzYAMTybtgi+tFBKE+d08yID/0NG
         dduF3HLcd5RJB1MrulrTLTcBcXVHVCzkKqhhrUjFLSB17t/BMxSWu9zOg8xPLR+OrCk6
         7Eqdi+28mEEm+6zZCYc4XGJYqeleD15Pgle0W6iFKW6NqXqG5kv5UC9f5yWU9NCxbuY/
         c1rvGQ0z0pbNY+srAWCpAKf35FSwuH3CjoNPdmqsJAw6Jx5QJR4wPBmEDWuJ3O20pjGn
         uo5g==
X-Gm-Message-State: AOJu0YzoMjd+ildlsCxvJ68keQ5541j5Ab/3qKXL9lHELMs8gcNOa9Cf
	PMDBUD4rf8YhWUojRa5eLe00G0eDYnj8dvq7GcilDuar/6V2KxNBePD5mPgw5JGfRehbdnZ9mKi
	Chhk=
X-Google-Smtp-Source: AGHT+IHWBQYPMF6HCWyNJjynZfqyIzvNIv8lubQJ61p9uiAFLGUlZbDuaoliFu/kVj17yu1Yogbyiw==
X-Received: by 2002:a05:6a20:2d0a:b0:1a0:e157:9c9d with SMTP id g10-20020a056a202d0a00b001a0e1579c9dmr3541103pzl.51.1709340501238;
        Fri, 01 Mar 2024 16:48:21 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id m2-20020a170902db0200b001dcf91da5c8sm234604plx.95.2024.03.01.16.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 16:48:20 -0800 (PST)
Message-ID: <65e27754.170a0220.d2069.18f8@mx.google.com>
Date: Fri, 01 Mar 2024 16:48:20 -0800 (PST)
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
X-Kernelci-Kernel: renesas-next-2024-03-01-v6.8-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline: 25 runs,
 1 regressions (renesas-next-2024-03-01-v6.8-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline: 25 runs, 1 regressions (renesas-next-2024-03-01-v6.8=
-rc1)

Regressions Summary
-------------------

platform         | arch | lab             | compiler | defconfig          |=
 regressions
-----------------+------+-----------------+----------+--------------------+=
------------
imx6dl-riotboard | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2024-03-01-v6.8-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-03-01-v6.8-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      01fdf7d6f1504ba6a93e7d8eacb27d45dc995325 =



Test Regressions
---------------- =



platform         | arch | lab             | compiler | defconfig          |=
 regressions
-----------------+------+-----------------+----------+--------------------+=
------------
imx6dl-riotboard | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/65e24129ae106e8248637012

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-03-01-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6=
dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-03-01-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6=
dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65e24129ae106e8248637017
        new failure (last pass: renesas-next-2024-02-23-v6.8-rc1)

    2024-03-01T20:57:03.494162  + set[   15.155052] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 1031199_1.5.2.3.1>
    2024-03-01T20:57:03.494302   +x
    2024-03-01T20:57:03.600240  / # #
    2024-03-01T20:57:03.701636  export SHELL=3D/bin/sh
    2024-03-01T20:57:03.702151  #
    2024-03-01T20:57:03.802960  / # export SHELL=3D/bin/sh. /lava-1031199/e=
nvironment
    2024-03-01T20:57:03.803403  =

    2024-03-01T20:57:03.904200  / # . /lava-1031199/environment/lava-103119=
9/bin/lava-test-runner /lava-1031199/1
    2024-03-01T20:57:03.904839  =

    2024-03-01T20:57:03.908204  / # /lava-1031199/bin/lava-test-runner /lav=
a-1031199/1 =

    ... (12 line(s) more)  =

 =20

