Return-Path: <linux-renesas-soc+bounces-4783-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A6A8ACF23
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Apr 2024 16:17:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C86BB231ED
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Apr 2024 14:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75FAB15099E;
	Mon, 22 Apr 2024 14:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="1iY15uy5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F370B22625
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Apr 2024 14:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713795456; cv=none; b=JmDm7OaMxvQEZK5dfuRC91pyTVCLVJSjR0Z4vokgtmuL0q+TuOMe+Hcqmu8l5f/HPifGeCpQyy078kv62wdnJSdvzovJ3zK/KDVDLeF6UwVth3SHeQy3Qk94xSc2KimEXdcXHr2IVN/fGo9EGdgvqa3/sVS0IapOLkSK1dgroEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713795456; c=relaxed/simple;
	bh=eAtqZ84jlznpa0WrR6QnMPggL51pSW0LBtN8lhTIeQQ=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=jr6/N7cCODwhfhR4qIL9hUn0zwqZqMBiWZ8tOaU6g0oAOPtqk/wXlO7ubrJv3CSgDmHZdmeqpxtRneD0flFGNrRxZjeEbzy5DBfhb/hbgme4jMigBOAMXkpBzkhqsuTYt8CuDaBHYJlh4v2Jlv3+EhLkq8eTY2SCD3FC3fAW6z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=1iY15uy5; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5f415fd71f8so3314606a12.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Apr 2024 07:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1713795454; x=1714400254; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fStPXTicZdRFJO8wVPI2ZLlZdjogeCQaJeei1qh3qAI=;
        b=1iY15uy5lBZX2Cooz7ThUu9y8q72wxtLVuHqkVprLjST2MDTbm6A4tWWFMU1HnCt1G
         8WscbH66NrW7wbpVXPpZMX7HU7NnGf1Qkujp9GZMk9/ZQUchg6eh8SrqJHuPo159ssAX
         4wxeZ+/TSAIUhRRXxfdPe0EThdyuc2kciK2V24EG8Fak9T0an2JuyLPVGpHtb/4X3A2c
         2MZwL9qmS5F0uUXRX7MFXQrc224mujtsBs7B/ddSTFK2XF3nSDWkx7cGHm5pnaZG2dm0
         jxrrixuqL8f9ZCPXg85c8EsMir2BImREsbiTDiGO7oNdJZqFpD7txzzkn0oXJtLnR0pO
         85oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713795454; x=1714400254;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fStPXTicZdRFJO8wVPI2ZLlZdjogeCQaJeei1qh3qAI=;
        b=TxzH2xwATS3IwWOCdRujg9Bb9FCotkIRxQd7nNrlEI5fNBq9RcviyYjjwUvFzMWbLg
         1WGFS3Yh15ox53alZIClSMb7TFMIzdj0mng/2nfnCLu5dHB99+h6yA2FRb2F6eReX4nt
         w5MYOMg5UWjbK7QGiDK5QVGk305RGpifV8f1QQlCRCiJJr22xCc+fHKEOC7u3qKr7HW8
         2QFZOhQ+611+qj7zlFaTZerz8XX+ZxUmvYlcDyPUAb2Varmw8FPCwcV0p+MFWJ8dFBPP
         YPco7U8cMplroZm65k52Ni5EgtNsHYH2bkI+zotduPoftFOlb6XxHrBWM/AMVioqQReb
         DQoQ==
X-Gm-Message-State: AOJu0YxZu/VqXS8SWyyiG4caP0V1aPh+4N3uSJWTERzaPCpoNq/AQHwh
	AD9JGi7fASPyQet6XcFN8U4rSCndy2NSyLFDWgIl5GMrTfFdb1z6t0b6B1dvX+4Lwlnm9No719r
	/
X-Google-Smtp-Source: AGHT+IHQyz7PqzYnCLRtxL18bRja4OBztC5eRTt3ignwFXsO5N3L+LxZsfjg4LaECWtKL17higDtvg==
X-Received: by 2002:a17:90a:c390:b0:2ac:24ed:c930 with SMTP id h16-20020a17090ac39000b002ac24edc930mr8477860pjt.35.1713795453824;
        Mon, 22 Apr 2024 07:17:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id nr20-20020a17090b241400b002a81d898f0asm9659195pjb.5.2024.04.22.07.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 07:17:33 -0700 (PDT)
Message-ID: <6626717d.170a0220.cddcb.f7e0@mx.google.com>
Date: Mon, 22 Apr 2024 07:17:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2024-04-22-v6.9-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline-nfs: 24 runs,
 1 regressions (renesas-next-2024-04-22-v6.9-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline-nfs: 24 runs, 1 regressions (renesas-next-2024-04-22-=
v6.9-rc1)

Regressions Summary
-------------------

platform              | arch  | lab         | compiler | defconfig | regres=
sions
----------------------+-------+-------------+----------+-----------+-------=
-----
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig | 1     =
     =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2024-04-22-v6.9-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-04-22-v6.9-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      9ac9686acef835b00b38ca81c59d48cff33bccdd =



Test Regressions
---------------- =



platform              | arch  | lab         | compiler | defconfig | regres=
sions
----------------------+-------+-------------+----------+-----------+-------=
-----
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/6626414b0dc1148ac14c435d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-04-22-v6.9-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kbo=
x-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-04-22-v6.9-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kbo=
x-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6626414b0dc1148ac=
14c435e
        failing since 91 days (last pass: renesas-next-2023-11-28-v6.7-rc1,=
 first fail: renesas-next-2024-01-22-v6.8-rc1) =

 =20

