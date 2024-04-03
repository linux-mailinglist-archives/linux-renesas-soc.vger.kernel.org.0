Return-Path: <linux-renesas-soc+bounces-4256-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E65F897920
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Apr 2024 21:39:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BA741C21759
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Apr 2024 19:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0658314885B;
	Wed,  3 Apr 2024 19:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="KbVCRUVW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684831401C
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Apr 2024 19:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712173164; cv=none; b=VJxtiHNes2WW+MHYWA8HaHRBy7XiLhO+Kd8Rv6V36QOrJ8dlBLgKoO2iieaunYZirWg0dY3QBwTpdV5LWYdwVoGtJ2hWnKBBUAiNDHEyPMoL0c8InO2SmRgC/CDw+/U+pEW1lo9rHmOhUJOwd6W9fcSDLERcKEdk8elteyZHJXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712173164; c=relaxed/simple;
	bh=remAyCXvzhagyLdSVemwaiBwobKXvESPAABBgteIZT0=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=ZItYaT56Na+6YosEnq5NPIlR6NbNkXSMQXLbjKNFEVkTQnub/mTHxdh7pZNDUphG6W6JWUqU9IEcAmREoB9NJaAeHYLE8E0qBO3YmuuYTNRmxhCneKUQHfhUYYX5aP5pvE2ua7X9q7NGLl2NTyz6bp37fsPy06ApBEj+Hk62R7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=KbVCRUVW; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6e73e8bdea2so161798b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Apr 2024 12:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1712173162; x=1712777962; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ymen0Xz0c64J2WXGQqm1uEajaFEzvWuppUosUp7UrmI=;
        b=KbVCRUVWo4A0H6ega68U8ucJVqFkNfpHWyif9UgCrbVQGTuLMLjXvOc/LgefewvFf4
         svJIhELEtNxC5FfxW/5Cs9iSEMThJZI0vfG5haEOVT68mq/uw2L1PO/SvMoGbdp9H+pG
         md4mtGGJT8dZhy2JtZd80NnW0brg8uiQYQF3ZNMB1G5eWH6+jJ2EoMXJDpwbvSBWGrK6
         WMXVSNijW1PZFaQukye73Rf4Vc9GSUnhSvBF9CkmtL3m2Il/vb7ILWf3eqJ6e1tHt2WQ
         kWxNSmaC+5F0wBzg6EsdV8Crjhh/xt62Cu+xti/F5rq++jCyZIKCDF2S1o7j0ZJGcSrv
         Asew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712173162; x=1712777962;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ymen0Xz0c64J2WXGQqm1uEajaFEzvWuppUosUp7UrmI=;
        b=QsNkltJI8Hnju/P0K2b0BdS8UK/enRV6h/cbFHMh08PqFB9Jy7qZP2ceMSWKaVZOEU
         7wfq8TrSoNRpeWCNx5tWjRloLTd/Rj2LHRvfauocsnWexXd38aJmNmGIv/SPXBBYShLA
         fvrVus8CrQWZ3jNSTwiILYQ2oOdSA6J89l+NAam2Mpfc88jKdX06WpED6Qiozb6QUhHD
         SZmPbTglahqRR2L1+DjFolH/5OXZQSzCxsZq8HTUMqCcfGhuqynemYYwjMvSGTAPbvC5
         KEdw5dv0XvpdxUSl48NqPZW8SABzGIe/uR2ETu3TmxV9/OeXXN4Eyk8pjM++GVCG5cX1
         ZrMw==
X-Gm-Message-State: AOJu0Yxo+e2u9NliEZd7as0hiGkXyjXvuOBx3AJjusKHm5Ei/ROm173T
	4vz19nHX5Dc+NPKZPiqozovH7KWGMN3xABVb6pFWyh7AxE+xFzDx2SaMMuWsZHD4Vljknr1m0kb
	ZRxI=
X-Google-Smtp-Source: AGHT+IGxrgL5hccRaGWr3yi7JtF5S0P9aB+Nb8ootcUksnr2ijw+S8pZpUKuMzbMwvzxiHc+G62kEw==
X-Received: by 2002:a05:6a20:734c:b0:1a7:136c:c940 with SMTP id v12-20020a056a20734c00b001a7136cc940mr711997pzc.17.1712173162222;
        Wed, 03 Apr 2024 12:39:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id i6-20020a170902c94600b001e0b3c9fe60sm13687448pla.46.2024.04.03.12.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 12:39:21 -0700 (PDT)
Message-ID: <660db069.170a0220.6828e.6b5e@mx.google.com>
Date: Wed, 03 Apr 2024 12:39:21 -0700 (PDT)
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
X-Kernelci-Kernel: renesas-devel-2024-04-02-v6.9-rc2
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 26 runs,
 1 regressions (renesas-devel-2024-04-02-v6.9-rc2)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master baseline-nfs: 26 runs, 1 regressions (renesas-devel-2024-04-=
02-v6.9-rc2)

Regressions Summary
-------------------

platform              | arch  | lab         | compiler | defconfig | regres=
sions
----------------------+-------+-------------+----------+-----------+-------=
-----
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig | 1     =
     =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-04-02-v6.9-rc2/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-04-02-v6.9-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      8a5076d03555d412a898f91ba3db257233fc4c83 =



Test Regressions
---------------- =



platform              | arch  | lab         | compiler | defconfig | regres=
sions
----------------------+-------+-------------+----------+-----------+-------=
-----
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/660d8064f37219d0dd4c431e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-04-02-v6.9-rc2/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-04-02-v6.9-rc2/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/660d8064f37219d0d=
d4c431f
        failing since 72 days (last pass: renesas-devel-2024-01-08-v6.7, fi=
rst fail: renesas-devel-2024-01-22-v6.8-rc1) =

 =20

