Return-Path: <linux-renesas-soc+bounces-4780-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D66C8ACE6E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Apr 2024 15:37:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFBB61C20A7F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Apr 2024 13:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44CD7502B4;
	Mon, 22 Apr 2024 13:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="NEfuX3mA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCB114F12F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Apr 2024 13:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713793064; cv=none; b=PeCBwulIvmVZaRKSmtizbGN9W5SCcgXBuN071peCbck2lPDT8dnILaOBUqMEoTQ8m0L4SqL7Pufxwktnef2ugCP7V6oe526zyjwEN3eOM5I6PrYSwJo3EXE8XOGINv3zB9SQe5xLPujAcvVMjf28dl0U/NUoTk+rdSw2pR1UAzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713793064; c=relaxed/simple;
	bh=KIYjLmf44jbJwqA2C+VHO/TpyORgt4T1MljwINS+V8o=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=XjqmanUf83wMK/B3qEd3DvFJpZn0ksXVaN76s9CsAH6erOQD+0PMY6eEnqqTXiw81A6LYj2BaYJvNTKxPWTZL7cIJrcgY30uxrCOWz3ydmTA+e5S+LHfuQRo73BggTS5+BI3W7B9gGLDxUg/ZZVd6LtD5O8pe8US/ctqsnN4CEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=NEfuX3mA; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1e3ca4fe4cfso31230215ad.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Apr 2024 06:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1713793061; x=1714397861; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rxIthKxGR4tSPpMqHgglpqA4wbVmShIkiuOL70TqGhs=;
        b=NEfuX3mAoCD2hbCgJa5//tlJYR9rfuenwSFHlCX2hLE0WKi56MaBSXM8NPIlwT+fwO
         C1XGpDGCmSFaGZasdXukLMhouhXOw7UvhYMzwancV8ONBaYm+3W9cjCks2x5QjtUyKn4
         6++svj0CKmCZ1MzQ4FtFu0IuyeIgHNMKXTtRrv8kBnpzUrHV0EioZcZGGL0MgYCjCJN1
         e18u14gYUG3PmLPsJYuCsmAnNlhTgZ1PZBVBHIcTrm5IaXYyeDz9hwOqfFAqmwbeodk8
         tJsLavCy38lkAbi7oSG1Otgaw4blr3uZGWeKaW3PaVW+7GRcWYSPZYdKGBXigwFH0DCj
         4ILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713793061; x=1714397861;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rxIthKxGR4tSPpMqHgglpqA4wbVmShIkiuOL70TqGhs=;
        b=ToAVGbPm61J6Hkqv5KlUhX4bAlPoHUtExuBiv5ZWmJKTJD2pxOZglce1lE8lvmVtHI
         rgzfbLOmOAL34mrSJhXHyUQGrhJtCkJZbePEEByiULnwgZjKENxyqI2Ripex9JLgckCn
         nVMJp+y98wF40eZ6EB3lDzFfcce3Jm9QAWgARefY6YLSHV4v48IvYm+LmjodXcWSrpdK
         xlwXn9tYonrw3lDzskhE8j9OkEPaCl0yBwjqW4hmBWJPFB9xgiVYZMKBEQhwcxht/VwJ
         OoTrX6Tqm6phYfXRxDZ06QRb7937FSXSTbWc2lOG0m7bvu3hVTz0pPFgHhaiagq1HWy1
         Fq7w==
X-Gm-Message-State: AOJu0YxllfCjhX0BHDFRi9DEw5I4zhmOX9bXr9uOUCzdLLW1wCvRZCEZ
	xC7nJc9Rq0rBG4npyL9HDHzuvq/e65kHy9zJo5xUXQIi47IOnZFE+xvhXXESBdA45p0Ws/R8pk8
	9
X-Google-Smtp-Source: AGHT+IGZRV8Au9K9NOZS5fol/7cBQvGORx0eO1sr2Z70vLWvrhFDhOABs2lbRa8Xq/hf/qJSMBTDzA==
X-Received: by 2002:a17:902:720b:b0:1e4:b16e:7f10 with SMTP id ba11-20020a170902720b00b001e4b16e7f10mr9435794plb.33.1713793061308;
        Mon, 22 Apr 2024 06:37:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id kq6-20020a170903284600b001e26b7d3e8dsm8092052plb.266.2024.04.22.06.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 06:37:41 -0700 (PDT)
Message-ID: <66266825.170a0220.9e042.9d67@mx.google.com>
Date: Mon, 22 Apr 2024 06:37:41 -0700 (PDT)
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
X-Kernelci-Kernel: renesas-devel-2024-04-22-v6.9-rc5
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 22 runs,
 1 regressions (renesas-devel-2024-04-22-v6.9-rc5)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 22 runs, 1 regressions (renesas-devel-2024-04-=
22-v6.9-rc5)

Regressions Summary
-------------------

platform              | arch  | lab         | compiler | defconfig | regres=
sions
----------------------+-------+-------------+----------+-----------+-------=
-----
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig | 1     =
     =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-04-22-v6.9-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-04-22-v6.9-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      de20c778e68045aceda59ddc45ab00ac5fe7e8d0 =



Test Regressions
---------------- =



platform              | arch  | lab         | compiler | defconfig | regres=
sions
----------------------+-------+-------------+----------+-----------+-------=
-----
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/66263861272cb28b7b4c4350

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-04-22-v6.9-rc5/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-04-22-v6.9-rc5/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/66263861272cb28b7=
b4c4351
        failing since 90 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1) =

 =20

