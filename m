Return-Path: <linux-renesas-soc+bounces-316-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 455CD7FB53A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 10:08:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 010D1282325
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 09:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6BF0374D8;
	Tue, 28 Nov 2023 09:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Sf3AcOT5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84CA61B8
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 01:07:55 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1cf8e569c35so33508795ad.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 01:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1701162474; x=1701767274; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s/Fu1qAhAsmPwxhLqt7LGcUZxTOhzkhzts5V0uRRvq8=;
        b=Sf3AcOT591OGrJlUK2t1flidgNyZA3cN9Wh3wM2VdDiOrenzwRDEisEboUUfpAgUWu
         hiH6w8Z1fAVLUGhYBxeCMlJyl077Qim+eC0lK8ElYCzJtBGQsE7Qe4n4JFKFZIKKWTCA
         mkAtrivdvbCsa73qGKhGx4EMrnxyVsFS69CdVYtaaOIZs/NMUz6fCxobqWtkaGoUg1su
         RVxqATJjQSf0HKbmQ47w3LlPXYMsGGzv2k36rOVi8eRaA+I0IK4hQP7r3hY6M4rdtZ4s
         KJOw19q9nrrgjvSMGSMLrxUZrnN+FBpH0c86oVvGiTf2NSZq721da15ACSz5P7ZZK7QS
         oE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701162474; x=1701767274;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/Fu1qAhAsmPwxhLqt7LGcUZxTOhzkhzts5V0uRRvq8=;
        b=w0kuHRaTlNWYBtJFY54z6hK/sBZ1S/uqEvDzQ5REcDPSqNP0+ArPuy52ejCxLbqKQZ
         cttLpKiTh7YpX4ZsdvsjI/1Nc6a0y1nuyubHDl/A2XstAjdUdxMBL5p8EvLPp+rEkCDM
         GkeP0a7ES4MoEQ7xkMz6garKXXn3TwdZDrEKbdLldPOd7dSgo7dk52LfERi31ZVBSh9g
         blxIZKxwgLLscNxiY5VPimXDvnDgyCsw8uIfs64ERknqSMvsrOQDGtD9Zm0TNPErrU9F
         pbfWiWXWUmbmzMN7byRj+HYoIdk3g/CjjQ3jo22Y98FkXSCY6wm+Q2+j19Yq4hCqD0Q8
         M/SQ==
X-Gm-Message-State: AOJu0YzI6xo+ygj/eqI/rkF2idoabTqqdNzlkfJabBU+SjHtEyntV1W1
	6kMxZli4IYVKafyfudyARo+1IYjk7n+4vVSz1/E=
X-Google-Smtp-Source: AGHT+IFVB/bOXDhsyx6aoai0qqLxisoI1s8uBJmw+YoTRRLTk6lnCzHuaxym3xlXXjIfB3QkJ99gMQ==
X-Received: by 2002:a17:903:11c8:b0:1cf:5760:43f9 with SMTP id q8-20020a17090311c800b001cf576043f9mr15848899plh.64.1701162474312;
        Tue, 28 Nov 2023 01:07:54 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id jd12-20020a170903260c00b001bdb85291casm9739458plb.208.2023.11.28.01.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 01:07:53 -0800 (PST)
Message-ID: <6565ade9.170a0220.58255.77ff@mx.google.com>
Date: Tue, 28 Nov 2023 01:07:53 -0800 (PST)
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
X-Kernelci-Kernel: renesas-devel-2023-11-27-v6.7-rc3
Subject: renesas/master baseline-nfs: 22 runs,
 1 regressions (renesas-devel-2023-11-27-v6.7-rc3)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 22 runs, 1 regressions (renesas-devel-2023-11-=
27-v6.7-rc3)

Regressions Summary
-------------------

platform   | arch | lab             | compiler | defconfig          | regre=
ssions
-----------+------+-----------------+----------+--------------------+------=
------
dove-cubox | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig | 1    =
      =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-11-27-v6.7-rc3/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-11-27-v6.7-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      beabd6ea98fb86ef053f9a25b8f3bdf91bef4be1 =



Test Regressions
---------------- =



platform   | arch | lab             | compiler | defconfig          | regre=
ssions
-----------+------+-----------------+----------+--------------------+------=
------
dove-cubox | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig | 1    =
      =


  Details:     https://kernelci.org/test/plan/id/65657bfc49b0ad2fbf7e4a89

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-11-27-v6.7-rc3/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-11-27-v6.7-rc3/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65657bfc49b0ad2fb=
f7e4a8a
        failing since 14 days (last pass: renesas-devel-2023-06-26-v6.4, fi=
rst fail: renesas-devel-2023-11-13-v6.7-rc1) =

 =20

