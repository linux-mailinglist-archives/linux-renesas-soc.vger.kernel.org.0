Return-Path: <linux-renesas-soc+bounces-1032-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92137812AD2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 09:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AB96282667
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 08:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2CAB2575A;
	Thu, 14 Dec 2023 08:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="S6ZoO9bb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B15DA10A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 00:54:51 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6d9f069e9b0so5259326a34.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 00:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1702544090; x=1703148890; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fLFglZ9e1RKUtaKmPnm871Io9auK9S5sIp+tLIqIPm8=;
        b=S6ZoO9bbBN4Mnft8RXowfkC5j/Z02Z7ZF5OebzI/3K6WGeHUsHV864sqq38Cbk3Oes
         i8xjwgLayMD14K5Cm8HnCvCgAFVh2kQCU/ZO2xosbyH1Wve7LzL1Ho5kCIG7l6P/2PS1
         +b2gJ2/Tl03LOunrkZ9f7mnFFL+6DTr7bk6lihFKkDo6dEeoNxVqyYC+Mnth102B/D33
         K3NNtcxeLoGT/34wuCGo+dT5Q/9OIGuO5sUWfMuvcscSbQ2Y2CMNtBcUlBcqIkvSN2Oy
         VRc33LMvFobInHAChIkrRl18jphyNJ4mRGYofUbYSD4KvVJ7Mb/w+fsRT9GMFvVqk9nr
         HWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702544090; x=1703148890;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fLFglZ9e1RKUtaKmPnm871Io9auK9S5sIp+tLIqIPm8=;
        b=qtq5P7TAXPh8L8gWmT9IWmUpArIwot4j4m1doCBC1Q+0VbiKuPxlqtSS9moO1vlmpg
         yLQ6VoGVC6SF+gdMRBsFMsTy6yntB42dYnDKczmgIIcYycSxYvknBpnSxOU6OdMTH0X4
         NOKLHsXyK/37/X61HvNPuWQCu3qzB0x3csgiAnGuGfai1xPwFws/1C4rwh+d5XKcqgQY
         nqTHXpYDlxD8hsxFWXKZCI2N+EV37FIMx/cN81EL3HVKe4cjccSPv3XtzcwPXBwT9EOm
         MfHWwcDjFv0GPpTAeJmK5P8UWrmiEzgRnp8mJq+2Ecc0NO3B2mcZ0YILnsU95t1VgqCW
         V2ZQ==
X-Gm-Message-State: AOJu0YygYjuHpAK0s+h2SdHV56ouhC0iViumfJQnmNYiuVbLRDnzkxjZ
	gNL0Hrfc1NVuziNy60uvPt+tNDLtjsCTBW7mf6xk1Q==
X-Google-Smtp-Source: AGHT+IEQpbEWt10lqLIaSE2Nu5ffvRUIK4HxQWMpaUuZHHwspRPquvmztFyGnQ2+ukzDH3Hp7yGvvA==
X-Received: by 2002:a05:6358:708:b0:16b:f704:15a0 with SMTP id e8-20020a056358070800b0016bf70415a0mr9794932rwj.8.1702544090390;
        Thu, 14 Dec 2023 00:54:50 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id nc4-20020a17090b37c400b00285545ac9d2sm12305973pjb.47.2023.12.14.00.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 00:54:49 -0800 (PST)
Message-ID: <657ac2d9.170a0220.9d5dd.54ab@mx.google.com>
Date: Thu, 14 Dec 2023 00:54:49 -0800 (PST)
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
X-Kernelci-Kernel: renesas-devel-2023-12-13-v6.7-rc5
Subject: renesas/master baseline-nfs: 21 runs,
 1 regressions (renesas-devel-2023-12-13-v6.7-rc5)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 21 runs, 1 regressions (renesas-devel-2023-12-=
13-v6.7-rc5)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig | regressi=
ons
------------------+-------+---------------+----------+-----------+---------=
---
rk3399-rock-pi-4b | arm64 | lab-collabora | gcc-10   | defconfig | 1       =
   =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-12-13-v6.7-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-12-13-v6.7-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      1e74160baa46ca7c62ff5587ac23167e5c5e2316 =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig | regressi=
ons
------------------+-------+---------------+----------+-----------+---------=
---
rk3399-rock-pi-4b | arm64 | lab-collabora | gcc-10   | defconfig | 1       =
   =


  Details:     https://kernelci.org/test/plan/id/657a92f81866a93126e1347a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-12-13-v6.7-rc5/arm64/defconfig/gcc-10/lab-collabora/baseline-nfs-rk3399=
-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-12-13-v6.7-rc5/arm64/defconfig/gcc-10/lab-collabora/baseline-nfs-rk3399=
-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/657a92f81866a9312=
6e1347b
        new failure (last pass: renesas-devel-2023-12-11-v6.7-rc5) =

 =20

