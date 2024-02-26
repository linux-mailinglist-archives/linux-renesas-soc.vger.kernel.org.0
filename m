Return-Path: <linux-renesas-soc+bounces-3189-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5038679B5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 16:13:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE8DB1C2B1B3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 15:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E8712A149;
	Mon, 26 Feb 2024 15:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="F6gYAqni"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D840612A15C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Feb 2024 14:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708959601; cv=none; b=nphaL51OAmEca7h4t/wfBpCr9K1cW5RzxuRoX3ARBpQPruetQd0TWuu9WdzYZ3Ae0gK2gi+8HUTlr8Fgjl/2uKJ0glMY6XA79zQrPtFztPCj7X2TdUGUsgH+oeNRg0tdY5LL9xmDnC46fWJ1wj+zpEnChMaVZ4jyAz6YMl70QkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708959601; c=relaxed/simple;
	bh=Vdqq8w00tuHNBkhvsIS9kUAdZl93kBJDJw83CcoOFpI=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=b2lKjO+m+9dyBKmJ3qlDeOP3QPiQWrxnpxAJbPAp8iA9CROu6bcMkwROcXTfkLwE7PM/Ys0xHF2N55R4xxOanURTLYFntB06xI2jPL01mrVTT+qvqYr2sjcNI4xYvUd23NMSrRAlrKSHOLoNRBN3qCMoBmw/qwa4cxl6R2Bpgnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=F6gYAqni; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1dc0d11d1b7so23674645ad.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Feb 2024 06:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708959599; x=1709564399; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JEBIc1s2tacahSwWeCn3Na6xZ4WBNFbIuIRte/6GZBk=;
        b=F6gYAqniSmAPC3HK2RSgYQTfRSxrQVfnkpHHsGxnIxsEzBA6+V2lsISJTrB4GShKth
         fch7be+osyKLG/AfIzplIksxlqcJqdjlFTXaf+OhUgH6TUJ9QP5OpZQyucl043iWF5Pu
         c/n/ksKxvwoeBug5wWRoenV8LtgoC5cclDdkBHzVlNNCa9PFjaxpPDmNPNI3FaluovmP
         ViotRhAIntyDtv2MA4HSHTd/CrGi0ItyLc1/UpNrRuy4nTzw6/h6FGUF+kMCK4aiemZW
         4c+23jk88eyDUR4bOk3Whs6Xzk+5pKMBiAIR5xvVEqenGbGcfp2wWndrU3LFWRCnCgIJ
         QzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708959599; x=1709564399;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JEBIc1s2tacahSwWeCn3Na6xZ4WBNFbIuIRte/6GZBk=;
        b=WPbAeupaBvVuskEDFOOk09Mh1BU2JJsAqicrbEOEVv0BhBgPWP5W+HxvHV/V2EJPRy
         x3rfsyHvZEyslTjjbogPOxViU4LqvX+xadrSAKjWwR+UEskFnLEYG47mqhzGSx0DyRA0
         3jgrvOFxeXzsj7IY+oxbw44VaS9LfwboijVpc4VxUk1I9OGJgQoAaTNJH1bSgdM/5Yg4
         PufZVLvbPIfudbjWS1E4LA/9OfFJFvVtNK/Lw97I3jh9P7drnTSpD46cqoPj5jvNh9B4
         LIaPq0HLrpenXQ/eVAyPqNsD10FGxyJQVi2wz+cQHltGcpXxB77zK3mqQd9wFR20/GXf
         qr2w==
X-Gm-Message-State: AOJu0YwzbVf1YmtebCqdB3KLOwEC/QlJz3aqUldOa7ruhk/6/ohQQYSr
	5c6gm2wJquSPpPStaw99Ep5roPkpQ6xGypwRwFTmKek6n/9/V2oBz2WtsgKugQ9kn0WvOJV/XNW
	O
X-Google-Smtp-Source: AGHT+IE6VZceWvRZdtcJySt4oGCallTA8+MbLHxmlRjHuq7MjwMuvbyRyY/XBBWFHUNK+VuU7Cfzmw==
X-Received: by 2002:a17:902:c283:b0:1dc:696d:ec68 with SMTP id i3-20020a170902c28300b001dc696dec68mr5567162pld.21.1708959598735;
        Mon, 26 Feb 2024 06:59:58 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id m12-20020a170902f20c00b001db96ecc851sm4075682plc.112.2024.02.26.06.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 06:59:58 -0800 (PST)
Message-ID: <65dca76e.170a0220.785cd.b016@mx.google.com>
Date: Mon, 26 Feb 2024 06:59:58 -0800 (PST)
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
X-Kernelci-Kernel: renesas-devel-2024-02-26-v6.8-rc6
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 25 runs,
 3 regressions (renesas-devel-2024-02-26-v6.8-rc6)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 25 runs, 3 regressions (renesas-devel-2024-02-=
26-v6.8-rc6)

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

kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig     =
     | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-02-26-v6.8-rc6/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-02-26-v6.8-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      df55710c54e7da1e6dcea88778f12afe8740ff34 =



Test Regressions
---------------- =



platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
dove-cubox            | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65dc75b0bf5242f99a637058

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-26-v6.8-rc6/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-26-v6.8-rc6/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
240129.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65dc75b0bf5242f99=
a637059
        failing since 104 days (last pass: renesas-devel-2023-06-26-v6.4, f=
irst fail: renesas-devel-2023-11-13-v6.7-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
imx53-qsrb            | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65dc759cbf5242f99a637012

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-26-v6.8-rc6/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-26-v6.8-rc6/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
240129.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/65dc759cbf5242f99a637017
        failing since 356 days (last pass: renesas-devel-2023-02-21-v6.2, f=
irst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2024-02-26T11:27:16.249964  + set +x
    2024-02-26T11:27:16.250124  [   29.956913] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1029152_1.6.2.3.1>
    2024-02-26T11:27:16.359504  #
    2024-02-26T11:27:16.460896  / # #export SHELL=3D/bin/sh
    2024-02-26T11:27:16.461428  =

    2024-02-26T11:27:16.562328  / # export SHELL=3D/bin/sh. /lava-1029152/e=
nvironment
    2024-02-26T11:27:16.562918  =

    2024-02-26T11:27:16.663753  / # . /lava-1029152/environment/lava-102915=
2/bin/lava-test-runner /lava-1029152/1
    2024-02-26T11:27:16.664413  =

    2024-02-26T11:27:16.668061  / # /lava-1029152/bin/lava-test-runner /lav=
a-1029152/1 =

    ... (13 line(s) more)  =

 =



platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig     =
     | 1          =


  Details:     https://kernelci.org/test/plan/id/65dc7739c5db8d4fe4637014

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-26-v6.8-rc6/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-26-v6.8-rc6/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
240129.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65dc7739c5db8d4fe=
4637015
        failing since 35 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1) =

 =20

