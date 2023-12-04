Return-Path: <linux-renesas-soc+bounces-632-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BD3803508
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 14:35:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC244B209C2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 13:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87CC6249ED;
	Mon,  4 Dec 2023 13:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="IRhxhBuq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9299FF
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Dec 2023 05:35:35 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so2409364a12.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Dec 2023 05:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1701696935; x=1702301735; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p6oZw573CWPNcp8EmXcHMxxhDD+DeTIZO9n0s9aBbbw=;
        b=IRhxhBuqczgjSMmEakWoMDmZIYKgs53i0MireOt+TGdc5dNS+3s3Fcl0e7T5gYOx3k
         Wa3iUH0jrkmaJ8TKALMu1umPBTAjsz+KMPW4bnHesUo+xLof9VgOhPvSiWaPVvy4+EmC
         o5WXU67WsIqdiE7Z4WyiJEi/CFqImO99SInaCor2d/y2S8ZCNrc7S+AAD/iflq8hb0Gl
         OREwk0wRhCBXFBJxv8H1KeBH+p+SqBVjpHislU6cOyU2+3ZDxOrPMtPBG7s7wQ1ErQjY
         SEpcDIcebFJzh4spMHLumTLkvp10Y1gCoK6oD8shNUdAEAxYCWYnKKtIAueEfBw/B/9A
         FcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701696935; x=1702301735;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p6oZw573CWPNcp8EmXcHMxxhDD+DeTIZO9n0s9aBbbw=;
        b=BYImcbCiZGUjN2B1sDlAwLM0BMbkVbzogETlPKZJLr8JfRDhGB85n6lcnVcBnxtOlG
         jHG26Ro4s41XA2ZspGqvYgltL1vqcCrfjnE4Bzo+PDTtRD80bg8EP5thyPwkUiIJ+T18
         Do9iM0XZGxxnd2zAFMVkkIFekAQQoDnSXti1EnHHGRtH/Z6l5jujjXknm98dLGXYENyZ
         uADu+vFCm9mX0+KyjPQr4F/ylc4deVYL+hT9C4Ug/xI2JXJHccUk1wSmjlS0J4o+7YrV
         WHO36bqVr2rIf6wVSARPpan8QCqMKS3VasCZIZdn12GcrBpW0xp4rZp/98a9EzsZfTOr
         bMJw==
X-Gm-Message-State: AOJu0YzKMkSXbDzmldec5KOF7eZ797zh1LHxf86lpAs5SnYvmjTa9XFV
	N8TRFpmIF0mK7JsE/F8ggLUSA/+/z8UHaJqey3VwNg==
X-Google-Smtp-Source: AGHT+IHDA+PvvXayIjwCUR1dlSEkzwqrqHaMbpINRsXjSGhIOtmfe+0Pwojv9jlWncNzKfL7cKeQlw==
X-Received: by 2002:a05:6a21:2711:b0:18f:97c:8a3f with SMTP id rm17-20020a056a21271100b0018f097c8a3fmr4263245pzb.106.1701696934713;
        Mon, 04 Dec 2023 05:35:34 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id u17-20020aa78491000000b006cb94825843sm7618045pfn.180.2023.12.04.05.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 05:35:33 -0800 (PST)
Message-ID: <656dd5a5.a70a0220.ab86c.4bf1@mx.google.com>
Date: Mon, 04 Dec 2023 05:35:33 -0800 (PST)
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
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2023-12-04-v6.7-rc4
Subject: renesas/master baseline-nfs: 21 runs,
 3 regressions (renesas-devel-2023-12-04-v6.7-rc4)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 21 runs, 3 regressions (renesas-devel-2023-12-=
04-v6.7-rc4)

Regressions Summary
-------------------

platform           | arch  | lab             | compiler | defconfig        =
  | regressions
-------------------+-------+-----------------+----------+------------------=
--+------------
dove-cubox         | arm   | lab-pengutronix | gcc-10   | multi_v7_defconfi=
g | 1          =

kontron-pitx-imx8m | arm64 | lab-kontron     | gcc-10   | defconfig        =
  | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-12-04-v6.7-rc4/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-12-04-v6.7-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      0d6b47644d4f0e784fa633859acc89075fba26cb =



Test Regressions
---------------- =



platform           | arch  | lab             | compiler | defconfig        =
  | regressions
-------------------+-------+-----------------+----------+------------------=
--+------------
dove-cubox         | arm   | lab-pengutronix | gcc-10   | multi_v7_defconfi=
g | 1          =


  Details:     https://kernelci.org/test/plan/id/656da31977a7e66b9de13479

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-12-04-v6.7-rc4/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-12-04-v6.7-rc4/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/656da31977a7e66b9=
de1347a
        failing since 20 days (last pass: renesas-devel-2023-06-26-v6.4, fi=
rst fail: renesas-devel-2023-11-13-v6.7-rc1) =

 =



platform           | arch  | lab             | compiler | defconfig        =
  | regressions
-------------------+-------+-----------------+----------+------------------=
--+------------
kontron-pitx-imx8m | arm64 | lab-kontron     | gcc-10   | defconfig        =
  | 2          =


  Details:     https://kernelci.org/test/plan/id/656da6397db7651e9ce13552

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-12-04-v6.7-rc4/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-12-04-v6.7-rc4/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/656da6397db7651e9ce13559
        new failure (last pass: renesas-devel-2023-11-28-v6.7-rc3)

    2023-12-04T10:12:52.948883  / # #
    2023-12-04T10:12:53.051102  export SHELL=3D/bin/sh
    2023-12-04T10:12:53.051807  #
    2023-12-04T10:12:53.153102  / # export SHELL=3D/bin/sh. /lava-401631/en=
vironment
    2023-12-04T10:12:53.153818  =

    2023-12-04T10:12:53.255269  / # . /lava-401631/environment/lava-401631/=
bin/lava-test-runner /lava-401631/1
    2023-12-04T10:12:53.256405  =

    2023-12-04T10:12:53.302415  / # /lava-401631/bin/lava-test-runner /lava=
-401631/1
    2023-12-04T10:12:53.510021  + export TESTRUN_ID=3D1_bootrr
    2023-12-04T10:12:53.513119  + cd /lava-401631/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline-nfs.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id=
/656da6397db7651e9ce13569
        new failure (last pass: renesas-devel-2023-11-28-v6.7-rc3)

    2023-12-04T10:12:57.540043  /lava-401631/1/../bin/lava-test-case
    2023-12-04T10:12:57.595009  <8>[   22.531747] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>   =

 =20

