Return-Path: <linux-renesas-soc+bounces-3068-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B619685EF0C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 03:16:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B32A28367F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 02:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4728814284;
	Thu, 22 Feb 2024 02:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="S4crfrIC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7E5111B2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Feb 2024 02:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708568158; cv=none; b=uJyRSxRAj3emO/a0elvkuwBVIDtDHGNJWicmNzG+0VT7A+/6/W4qhUpuWCenUoeZMLUEU+uUeAYb4496oW0zgC6FEhjRXHcuOhQs9LjyfgN0V4AgmZmobKfwLG5aJe9O3fv8MNn8GgtxU7rTw4XQV54JtgDfpwitTcwGTvBXe3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708568158; c=relaxed/simple;
	bh=ol+8jAWT0udfjUNqVln1jkHDPYi3ZtOQEJ/OOXYbhEA=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Y89pz8KZfaQC624Phhyqoy9GARAzQFc74IWYoS460wMmvnUHegmKwLFOIcLWo9hYrYaXtrroWTNfkO2poBkoNvGp6th+fPU+i/3VyTSv92bQVkL9qFeA3iUmRXWjxyuZKYfji694vVpvxIDSvb1IiZ4F/iOzLEf7IknfiZuVcrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=S4crfrIC; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-59ff33f1018so1659205eaf.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Feb 2024 18:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708568155; x=1709172955; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9o4pv3NJ+7lENEV4M8hGnMZxLakQWM8hkYQvxwdfuY=;
        b=S4crfrIChmlHpgt0aHkFjU3qhwPqdX/quK0pmK/XOFVp8Q3bQpXsLJ5wxjPhqt82xS
         wAew8DvbJxvQd7uiOySZYkLuMv2ngPoxv64ATFZUQuc6nXTqf05sWzIcIV+X4L0CgmhC
         fhIC/KLEKLDGolGwRdeVl9yaRLbKOUqcvEH1FfNr/CyRsOLdHOITPfJvkeGlY7YhX3VH
         DDmBTrvugXSB4KMDEpxI+QrnFtJu9yqA1zvBsGOaKdaU/Yg04wahHB704GqEW8bYBjut
         7O2h5wMtxEaGv8sVNJtoDzTNqP3ZTs2ofqhNYxtCciREmQGEDPpTGiWiNdrik9UNMROt
         IXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708568155; x=1709172955;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y9o4pv3NJ+7lENEV4M8hGnMZxLakQWM8hkYQvxwdfuY=;
        b=Pd1/qpJ8WukvGLj+PdK5flveo0zUcK0rmv6rNuzTEN2W8bJVfKbs1UVSUf+cjxGwUD
         7TEUhKjCKb0Zh4GkqEvTFytVgNmuZNC/l8ZyhWYdQU1EBg1/XJdE21g4LP36SD+USxz/
         RdzbVe2KRS4tiH/txVc64JOQ9ESyAuHViQ3MbHLJyeA5uV5I+wjfia/MRcgR1joRt2OJ
         HRESMk8JlH12vmJDCQ1LHYfRkCIky0JFHNsqkiH69kJUsTk+3EGeBNA6vOrjEN2tcS4R
         TdJLm/0v80zKxDIym2XZWfOtpiCxr9+f/vI0D+3sgcAPjfGRWicf/ptj9JNARr3WEnZS
         sSkg==
X-Gm-Message-State: AOJu0YykQUGcNJLVhHgbkK8wh7hW/7UR/+r9ojiVoTfltYfHuUFb1YjK
	G9QoV2kVKi6wb0eSbo7OZgUM7RhX2O0DTpf0rp+SnGwwvN7y9oTa7zCp5btuqPR0L1C/8qys6oE
	V1No=
X-Google-Smtp-Source: AGHT+IFLzD2zFl6m80cJcawXJydPtzqwpMe0rQjzJ06XryZM2jtRhw8wPc45SoQ82uoUHCE2grtbaQ==
X-Received: by 2002:a05:6358:4883:b0:17b:5a95:9902 with SMTP id pe3-20020a056358488300b0017b5a959902mr4232883rwc.2.1708568155084;
        Wed, 21 Feb 2024 18:15:55 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id bn23-20020a056a00325700b006e0416c42c3sm9690792pfb.198.2024.02.21.18.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 18:15:54 -0800 (PST)
Message-ID: <65d6ae5a.050a0220.11431.1097@mx.google.com>
Date: Wed, 21 Feb 2024 18:15:54 -0800 (PST)
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
X-Kernelci-Kernel: renesas-next-2024-02-21-v6.8-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline-nfs: 25 runs,
 2 regressions (renesas-next-2024-02-21-v6.8-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline-nfs: 25 runs, 2 regressions (renesas-next-2024-02-21-=
v6.8-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab         | compiler | defconfig |=
 regressions
-----------------------------+-------+-------------+----------+-----------+=
------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron | gcc-10   | defconfig |=
 1          =

meson-sm1-s90...libretech-cc | arm64 | lab-broonie | gcc-10   | defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2024-02-21-v6.8-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-02-21-v6.8-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      8da5df713f13e5bc5dfe15948c042e97e57db5ea =



Test Regressions
---------------- =



platform                     | arch  | lab         | compiler | defconfig |=
 regressions
-----------------------------+-------+-------------+----------+-----------+=
------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/65d67e8da44347610c63704c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-21-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kbo=
x-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-21-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kbo=
x-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
240129.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65d67e8da44347610=
c63704d
        failing since 30 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1) =

 =



platform                     | arch  | lab         | compiler | defconfig |=
 regressions
-----------------------------+-------+-------------+----------+-----------+=
------------
meson-sm1-s90...libretech-cc | arm64 | lab-broonie | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/65d6824c003921140b637024

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-21-v6.8-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-meson-sm1-s=
905d3-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-02-21-v6.8-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-meson-sm1-s=
905d3-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
240129.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65d6824c003921140=
b637025
        new failure (last pass: renesas-next-2024-02-06-v6.8-rc1) =

 =20

