Return-Path: <linux-renesas-soc+bounces-631-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DABAD803507
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 14:35:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94A42280CC4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 13:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57462250FA;
	Mon,  4 Dec 2023 13:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="djehvIjZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E345B2
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Dec 2023 05:35:35 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6ce403523e5so507501b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Dec 2023 05:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1701696934; x=1702301734; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lxrlAGfqM/8CU5vmWX4/zg57hJUVDiauPt7mhu9KG+Y=;
        b=djehvIjZ87Gct9n+kH1yfIF9Ds6AFYRVCacl8SAEQGW5KUA9XMYuNQP3k/N1S5IZ8I
         YHWq4V2F4S/QBTyyke+WIRZTHG71G1keC6EZW81q7mjNZ/8d7JWdzkgqNIn194z+8BLQ
         50Bva+8x+AH++FarucDU4cFwSNk2sUQjIGoyCuidn6IMrR604yrvmBrWNjSGlhIGGbX8
         mUES3fClaEYOM2cithEx8c402O5LlSgtyqANzNe3Nnx/rJVZePN7syOHAvCMFIG7rDij
         OHaQAoP1Er0FGcBeqvhJwGuv+AeYbZkAwJeQ3hrkz5ajzxyLJD0NlIFBct5Y2ITkYAh9
         68Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701696934; x=1702301734;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lxrlAGfqM/8CU5vmWX4/zg57hJUVDiauPt7mhu9KG+Y=;
        b=d7wMYuhZyDS/jy54fBX5Utwf6LMOtswpQyeZPPiJGCU9C2Ct/2JaDv1ryQLCpcQ9G3
         bfl9GMvO17+c7umMWnsCV8OiBx1JwNR3FpxWPRg3PoIL3RhjFduMye1fSbzDxYFn7euR
         A60jIS/5D0sKNRS3uP5GlTeMRRDjD8IsI+EHXF+U+8h7tQ21d3pMuBSoNnc82FP8KL8D
         g0ZmEs6qTMLB7lcGIUBSohT9dDOxoYhtOC8v0Cy4b/L2eC6BudkJF+sdkai8uMAkBzXI
         +YOeFE6uRTwOUPqdcTmDZTIj1Bof/FXMaEsvrpHspi89HTjFvBgnL0HQRn9ea/RdvXee
         QkzQ==
X-Gm-Message-State: AOJu0YzKg/GphXi8SRdaZV1TEpUKFrb4SbSYLvpR+Ey7E3rTGbPQtzya
	cAS5xHIv1q+tPqRoKdDZuD/RMRR7MNcXrk2oHSKoOg==
X-Google-Smtp-Source: AGHT+IGD4O9B9SXkHXBJnbrfyzDSlEpbKWQIsG5Cxtio5zRHu8WWu0YwC6Zr/tpgzVB4luV45fT/KA==
X-Received: by 2002:a05:6a20:7f96:b0:18b:d207:d84d with SMTP id d22-20020a056a207f9600b0018bd207d84dmr1410229pzj.0.1701696934264;
        Mon, 04 Dec 2023 05:35:34 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id ne8-20020a17090b374800b0028669c66e37sm4441000pjb.21.2023.12.04.05.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 05:35:33 -0800 (PST)
Message-ID: <656dd5a5.170a0220.1c294.9b3e@mx.google.com>
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
Subject: renesas/master baseline: 61 runs,
 1 regressions (renesas-devel-2023-12-04-v6.7-rc4)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline: 61 runs, 1 regressions (renesas-devel-2023-12-04-v=
6.7-rc4)

Regressions Summary
-------------------

platform           | arch  | lab         | compiler | defconfig | regressio=
ns
-------------------+-------+-------------+----------+-----------+----------=
--
kontron-pitx-imx8m | arm64 | lab-kontron | gcc-10   | defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-12-04-v6.7-rc4/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-12-04-v6.7-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      0d6b47644d4f0e784fa633859acc89075fba26cb =



Test Regressions
---------------- =



platform           | arch  | lab         | compiler | defconfig | regressio=
ns
-------------------+-------+-------------+----------+-----------+----------=
--
kontron-pitx-imx8m | arm64 | lab-kontron | gcc-10   | defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/656da5d4b087778c4fe1347c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-12-04-v6.7-rc4/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx=
-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-12-04-v6.7-rc4/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx=
-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656da5d4b087778c4fe13=
47d
        new failure (last pass: renesas-devel-2023-11-28-v6.7-rc3) =

 =20

