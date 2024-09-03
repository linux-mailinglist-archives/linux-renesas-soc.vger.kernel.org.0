Return-Path: <linux-renesas-soc+bounces-8647-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5E4969B17
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 13:04:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA9AFB21291
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 11:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A3C31B12CE;
	Tue,  3 Sep 2024 11:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="n67icMkf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65DD1B12C5
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Sep 2024 11:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725361478; cv=none; b=r441IIfFyC11A4WWhBbYSDFvYhF0pB4IQ6h16wz7PXXL0EhIwG7HfebqGYcotP5UKfsdVmoGjKLGpUY0okAXacJPNtERUipEDqRE8wLOAzW0zPcPLpGJ3MOnquKHxdcJVdsbmL/ZwR/brE1Y++XUTEPP4fbQwunBk81ftL21buU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725361478; c=relaxed/simple;
	bh=Hr5hDwit4Fexzz0tuzE3JOrjlPWwXJnqmP8blbpgR9Y=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=mHwuDbtQJgiY+gfQ4MkEdt4mTX4vMnGXpDvmgduP8p8mXNn6OjLmBBGZZHzpeO1ZHR6WNrlCYlwmwmU4xjjCVyF02FkgiJgnawGnmlICizD6xLxFHqnzPdxNslKg8betxJ2CLTAUG9m0j2kav90vSujpRLf/h78ci2rzHE5W1KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=n67icMkf; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20543fdb7acso20367565ad.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Sep 2024 04:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1725361476; x=1725966276; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8BMHJHP+D6XkYCkdBr0QZ9FXQaoU7cUtmpFjdUswiBc=;
        b=n67icMkftB05VBb1ZZeYxuL/wSdmhQXi0RTgXu+IGFAqWCYAZhCBBjbNZUsnMJH8I8
         xdA22/583dqbo9oJt9/eitRNa8zJ0wy/0ZklsTAzQT3dY9EIdFEpFgax591422uqCJmw
         AKCl/oYOli/Ps9hGcKBqOiE2t+f6aJGn98jSb4YGcbTu/2oh+VlMmDUwK87X9TzRSMqN
         XRY62vJTSKDq5AXsgs2grwq4JKw0g/jh1HzJLmaLFZ0/DJL9a/46odiTOM8dF+ix+1RB
         9G3oz/7qNs93d35SJKeU0NBYcotoJ1W4b8NBkwgMifGjJ50XUkcZR0Cx/teQTyB0XAjc
         17dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725361476; x=1725966276;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8BMHJHP+D6XkYCkdBr0QZ9FXQaoU7cUtmpFjdUswiBc=;
        b=rQlY88f6dMQhSGsXoC16ySoqgGxv+IE80jwlawt9GXDlYBfcpgWr8pftfLJ6Gu0gHG
         Ut8RSYEXtVPRXbI6HB1z003wYdn7e8OEFQouqFGYi571O+Gu4h3F2TNavxJOLePiBqmk
         UupCcV5cYWT71T0yUmOebq33AO6uP9636/zmE5srtB0ucoQbutg3gO7VPiASpc8K1fsI
         KmE+qPN6g7gykrZ0yF5124Hip/8Ydt5QBPJHecC1IIO0Mu9gUxZXFWgzw9ozd5+L3EIY
         PrBVeH2O6S9P++Sn3yE3GRf8v5ne95LgqZX0pjpEt2+WmT5JfE0kWTAjgC8tPn3QO1FH
         kw+Q==
X-Gm-Message-State: AOJu0YytpTeLqlQ1IJVDdf6JET9kuk8nW+Qx48rKZBhGsIcRtyYnY2TF
	cN3rT9I4ILAUP9kmoefHxRNQojvTguryuK9AMBt9J6vK6sMtGrN2njOIjovYAZ5L152XaZBH0IZ
	W
X-Google-Smtp-Source: AGHT+IFL063uxaLLct6+kR2lTykPOaKUFnsWvu6f8niXTlmTyn4vdlUzAMQay2J0AT3N/QF3HQMBhg==
X-Received: by 2002:a17:902:f68a:b0:202:ac8:991f with SMTP id d9443c01a7336-2054bce5e85mr56967835ad.26.1725361475413;
        Tue, 03 Sep 2024 04:04:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2068bee21bfsm14673825ad.118.2024.09.03.04.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 04:04:35 -0700 (PDT)
Message-ID: <66d6ed42.170a0220.17cad9.3e17@mx.google.com>
Date: Tue, 03 Sep 2024 04:04:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2024-09-03-v6.11-rc6
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master ltp-ipc: 5 runs,
 1 regressions (renesas-devel-2024-09-03-v6.11-rc6)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master ltp-ipc: 5 runs, 1 regressions (renesas-devel-2024-09-03-v6.=
11-rc6)

Regressions Summary
-------------------

platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-12   | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-09-03-v6.11-rc6/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-09-03-v6.11-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      eb506fd73109d2792435a811247040b2d00f379e =



Test Regressions
---------------- =



platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-12   | multi_v7_defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/66d6e6fbdea08dff7fc868b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-09-03-v6.11-rc6/arm/multi_v7_defconfig/gcc-12/lab-cip/ltp-ipc-beaglebon=
e-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-09-03-v6.11-rc6/arm/multi_v7_defconfig/gcc-12/lab-cip/ltp-ipc-beaglebon=
e-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-lt=
p/20240313.0/armhf/initrd.cpio.gz =


  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  cbc2d05684ad86b779252500498d17f718b84915 =



  * ltp-ipc.login: https://kernelci.org/test/case/id/66d6e6fbdea08dff7fc868=
b2
        new failure (last pass: renesas-devel-2024-09-02-v6.11-rc6) =

 =20

