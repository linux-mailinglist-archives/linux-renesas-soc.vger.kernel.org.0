Return-Path: <linux-renesas-soc+bounces-382-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAF07FC8D9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 22:54:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 914F71C20C1A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 21:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 371CB42A84;
	Tue, 28 Nov 2023 21:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="nGWYjHCg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14CAE197
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 13:54:47 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6c4eb5fda3cso5962248b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 13:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1701208486; x=1701813286; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mgqTaSyUKytg/7yztnhPqs1Bi/McnnQHHQoEsV3COg4=;
        b=nGWYjHCg/Yer/rUY8DlJjKudSQw2d2vp44v7+EeccpbJa/gZACtHvYWe+UkQC8PcBy
         /bMXNqorYd6L+acqmCHiB7vLNlskg2PFdmzcZggOFAbzusqgiovReTdv95kQ6JMyPyFZ
         R550trkAS8QCtpNM+mnr6uJOot7C01DBVPFPrvjf5FAcD7kRM84bn6ZTPqM823GEGb59
         9cIIGaTTaXX7HJ8fXex9ZqSNBHzwoNbNEostt+I/gmv7Eq5GHhnrXae6orq2ppQ0MvUI
         Mno5n7Ulk3yR3325T/0eEGk7x5gmhgy2fjKa6wXHIymFO91IXaBN6rcgW+lmDP2F4QbS
         RwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701208486; x=1701813286;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mgqTaSyUKytg/7yztnhPqs1Bi/McnnQHHQoEsV3COg4=;
        b=T+KWgxGghadIEGqcQJCd1wNzR6drndk84EhWSnoHWcVZXNH230Ie2bAbQUS3Qi2lPW
         ll4nUAOkUproLSzmdqSTSVXPuAXo80scHbETzIGzR6MQ2fOfghxYmaNsWrSK+FCC5V78
         oEnXJCym/5Y2e5pk9I4lfphcRvfMVS7yEsFHn4pLwVtkcLagwoVIrUOmiLpuTli3MMoK
         DZdZldSVtwQIeqN7KR7Q5TR72hfQTMns7OkXG0e7uesx2wFPu2a56GLWuvK19TVB/sn/
         bpae5V/sqKfEU51ehqPK8jTMly3Z/84FMEu9IQb8tyVcQEYSjh6lOnGIY4jeF6bAoz2y
         Ibpw==
X-Gm-Message-State: AOJu0YzheqSywt/cIcfLB6p18jtt0ylaK2+3pFsG/CYZ15Jt7s0H5e3O
	9L+kY7lfrlwp4uWdg8Hs9FZYSElm90qTs5pxXZw=
X-Google-Smtp-Source: AGHT+IEHkRQ5/lV2NhlXDrgUHciD0cphvQ2vWheP03S283AdOb44f/hPwxWmsiqeWGcA/QCjZPLn7w==
X-Received: by 2002:a05:6a20:8e12:b0:18c:f73:6133 with SMTP id y18-20020a056a208e1200b0018c0f736133mr22124521pzj.28.1701208485983;
        Tue, 28 Nov 2023 13:54:45 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id u9-20020a632349000000b005c2422a1171sm9781426pgm.66.2023.11.28.13.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 13:54:45 -0800 (PST)
Message-ID: <656661a5.630a0220.d488e.8cf5@mx.google.com>
Date: Tue, 28 Nov 2023 13:54:45 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-11-28-v6.7-rc3
Subject: renesas/master baseline-nfs: 22 runs,
 2 regressions (renesas-devel-2023-11-28-v6.7-rc3)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 22 runs, 2 regressions (renesas-devel-2023-11-=
28-v6.7-rc3)

Regressions Summary
-------------------

platform         | arch | lab             | compiler | defconfig          |=
 regressions
-----------------+------+-----------------+----------+--------------------+=
------------
dove-cubox       | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig |=
 1          =

imx6dl-riotboard | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-11-28-v6.7-rc3/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-11-28-v6.7-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      273eac6f81f3427b5219f85d46ef26cc78669a6e =



Test Regressions
---------------- =



platform         | arch | lab             | compiler | defconfig          |=
 regressions
-----------------+------+-----------------+----------+--------------------+=
------------
dove-cubox       | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/65662f3b5c5226c6b07e4aa4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-11-28-v6.7-rc3/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-11-28-v6.7-rc3/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65662f3b5c5226c6b=
07e4aa5
        failing since 14 days (last pass: renesas-devel-2023-06-26-v6.4, fi=
rst fail: renesas-devel-2023-11-13-v6.7-rc1) =

 =



platform         | arch | lab             | compiler | defconfig          |=
 regressions
-----------------+------+-----------------+----------+--------------------+=
------------
imx6dl-riotboard | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/65662f2790f34c7e457e4b4e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-11-28-v6.7-rc3/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-11-28-v6.7-rc3/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/65662f2790f34c7e457e4b57
        new failure (last pass: renesas-devel-2023-11-27-v6.7-rc3)

    2023-11-28T18:19:09.238181  + set[   27.394095] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 1011924_1.6.2.3.1>
    2023-11-28T18:19:09.238356   +x
    2023-11-28T18:19:09.344774  / # #
    2023-11-28T18:19:09.446460  export SHELL=3D/bin/sh
    2023-11-28T18:19:09.447094  #
    2023-11-28T18:19:09.548110  / # export SHELL=3D/bin/sh. /lava-1011924/e=
nvironment
    2023-11-28T18:19:09.548575  =

    2023-11-28T18:19:09.649335  / # . /lava-1011924/environment/lava-101192=
4/bin/lava-test-runner /lava-1011924/1
    2023-11-28T18:19:09.649884  =

    2023-11-28T18:19:09.653008  / # /lava-1011924/bin/lava-test-runner /lav=
a-1011924/1 =

    ... (12 line(s) more)  =

 =20

