Return-Path: <linux-renesas-soc+bounces-3066-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6305485EEB6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 02:37:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D09D11F210B6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 01:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4ECE80C;
	Thu, 22 Feb 2024 01:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="hkRMZs9d"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23E314287
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Feb 2024 01:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708565816; cv=none; b=RDQCtsa2ux8+9ik/GDjTWF/Id2LKaI5gqSArAJ7TwSKi7cEbin4RXSbN9PDHwMu07rfGixoAZZmMWFv4tyOkSOR+SHa3w36012MCgApqM55u9sVXkoUWaQkbzuF/3M1J5XT2LFncJqe1AmTc6c+IYSizH5nL2Tncr6GZHLDJAAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708565816; c=relaxed/simple;
	bh=f7CTNfcKaZH1xaQHdgQ4Ae6q34zxaXFcFPFV69K5glc=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=csUEWGD20624RXirzILKM9ubIvPS/jnfIDyln0mojkwDk4RaB7O7hkNHXWijINEvliAQA71vV0259xCaFurU+M89NbOi5IE+VL7GM4a4tPGwNWqVSJ4F15nfDLLL7p540gsNxxBlCW581MjQz6sNppd0H2mx/chbXTpeokkBZP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=hkRMZs9d; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6de3141f041so5154038b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Feb 2024 17:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708565814; x=1709170614; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W6GbpEvyozPbe0VdvbbUWKJli2gtLt0XlrpoKjLNdlk=;
        b=hkRMZs9d8IIEXmQUlc56pUM8LydaulrzTihhA5Z5e39yR2odbDDTe0gvoGTVLTz3v9
         hYgmNCRpv0ZeL584wHe19RubqhgJGjN1KbMlgTkXv0R8knwKAv8eGUV6/DiPjZlo8+yS
         9aXoXDISYEfbZrtIOQc/+0moCWwfNf+WnHzfKbIvJLnwX7UhXfIXdGxWQa9OE0EjS9hZ
         B6LrXp8Aufdy/BeSTg9zwW+4K1PabBka2hycUR4zkb5OVmNOu38ogImJSqoMM1XAQl7D
         f2F9WUK+IA9XXsLd/TtDVCXLP6alRfzisEAc+47cOFp33hxHibSr0zL5eW9ZM2p2Zu8O
         48nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708565814; x=1709170614;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W6GbpEvyozPbe0VdvbbUWKJli2gtLt0XlrpoKjLNdlk=;
        b=UyFKjTp0oBDhdHPeNPug8kh3BFLbm1JQWif0veKXT6ipwPR/Me7mSuId0MO0MlP5l8
         mBxq41MIJckhEnBtJCVBzXxlXtAWS8fs9UpoN+7O27p3DuHkAmYciFz98BfrF2bBirI4
         VV6O7qaL3iNAv4mplAnaUa+L+SkZQbBUupIupd9NZxApGvD4Gc7W+qJ2xgW/Fe/XvEv0
         agKxF5sZiee0OA+p6lArN7iL8Wmdmoi9JFKc9S57k/LRcAF9Qls4ovrd/evysG6r7EuL
         9vD35StxKTeZQY/j5WgnA2h7W4B2xCbHUhjPdDt1FX2pdLksvvX3faUDdsKeZ4tXCbHW
         YzAw==
X-Gm-Message-State: AOJu0Yz64Dy77Q3bZOfDjBFEsdAoNYc9lHQGQBGSUcxzRiP84PAUxkwI
	MnxlFvhoJcrbXHwLfEOb9mnzKB3DSvMqlAIAtd1CmQmjK1Yw+yO/j/X84hScw9JTHwo3gYHBjhi
	fLX0=
X-Google-Smtp-Source: AGHT+IFnQj7l95o2sBLIcTi+a78iVycqa/mRlzndJDc7wIIKHVzdjqb3nF+JFGzcbICh5WDGZF4Dpg==
X-Received: by 2002:a05:6a00:80d4:b0:6e2:de02:598e with SMTP id ei20-20020a056a0080d400b006e2de02598emr11650673pfb.33.1708565813793;
        Wed, 21 Feb 2024 17:36:53 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id h2-20020a62b402000000b006e45c823660sm7396210pfn.122.2024.02.21.17.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 17:36:53 -0800 (PST)
Message-ID: <65d6a535.620a0220.84f7d.9369@mx.google.com>
Date: Wed, 21 Feb 2024 17:36:53 -0800 (PST)
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
X-Kernelci-Kernel: renesas-devel-2024-02-21-v6.8-rc5
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 25 runs,
 4 regressions (renesas-devel-2024-02-21-v6.8-rc5)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 25 runs, 4 regressions (renesas-devel-2024-02-=
21-v6.8-rc5)

Regressions Summary
-------------------

platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
dove-cubox            | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig | 1          =

imx53-qsrb            | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig | 1          =

imx6dl-riotboard      | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig     =
     | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-02-21-v6.8-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-02-21-v6.8-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      8d8825af79e738be6f93a55cfabb93ccfea3a2b8 =



Test Regressions
---------------- =



platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
dove-cubox            | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65d674b6de85bfeecf6370ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-21-v6.8-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-21-v6.8-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
240129.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65d674b6de85bfeec=
f6370ac
        failing since 100 days (last pass: renesas-devel-2023-06-26-v6.4, f=
irst fail: renesas-devel-2023-11-13-v6.7-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
imx53-qsrb            | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65d674b5de85bfeecf6370a0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-21-v6.8-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-21-v6.8-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
240129.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/65d674b5de85bfeecf6370a9
        failing since 352 days (last pass: renesas-devel-2023-02-21-v6.2, f=
irst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2024-02-21T22:09:32.023190  + set +x
    2024-02-21T22:09:32.023337  [   29.963549] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1026915_1.6.2.3.1>
    2024-02-21T22:09:32.132299  #
    2024-02-21T22:09:32.233891  / # #export SHELL=3D/bin/sh
    2024-02-21T22:09:32.234433  =

    2024-02-21T22:09:32.335276  / # export SHELL=3D/bin/sh. /lava-1026915/e=
nvironment
    2024-02-21T22:09:32.335722  =

    2024-02-21T22:09:32.436488  / # . /lava-1026915/environment/lava-102691=
5/bin/lava-test-runner /lava-1026915/1
    2024-02-21T22:09:32.437071  =

    2024-02-21T22:09:32.440316  / # /lava-1026915/bin/lava-test-runner /lav=
a-1026915/1 =

    ... (13 line(s) more)  =

 =



platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
imx6dl-riotboard      | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65d674b4de85bfeecf637095

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-21-v6.8-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-21-v6.8-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
240129.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/65d674b4de85bfeecf63709e
        new failure (last pass: renesas-devel-2024-02-20-v6.8-rc5)

    2024-02-21T22:09:33.029201  + set[   28.371331] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 1026914_1.6.2.3.1>
    2024-02-21T22:09:33.029345   +x
    2024-02-21T22:09:33.141758  / # #
    2024-02-21T22:09:33.242903  export SHELL=3D/bin/sh
    2024-02-21T22:09:33.243354  #
    2024-02-21T22:09:33.344125  / # export SHELL=3D/bin/sh. /lava-1026914/e=
nvironment
    2024-02-21T22:09:33.344596  =

    2024-02-21T22:09:33.445345  / # . /lava-1026914/environment/lava-102691=
4/bin/lava-test-runner /lava-1026914/1
    2024-02-21T22:09:33.445928  =

    2024-02-21T22:09:33.448804  / # /lava-1026914/bin/lava-test-runner /lav=
a-1026914/1 =

    ... (12 line(s) more)  =

 =



platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig     =
     | 1          =


  Details:     https://kernelci.org/test/plan/id/65d6756883f367cfc9637025

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-21-v6.8-rc5/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-21-v6.8-rc5/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
240129.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65d6756883f367cfc=
9637026
        failing since 30 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1) =

 =20

