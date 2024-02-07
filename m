Return-Path: <linux-renesas-soc+bounces-2411-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B8384C258
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 03:18:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2318F282032
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 02:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FA4CDF4E;
	Wed,  7 Feb 2024 02:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="sUJObrac"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7485DDCA
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Feb 2024 02:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707272328; cv=none; b=NOmT/9zRqHDAqQ2OXDJFg2FOUpjvsi7L4AWKx5H5/sU4vA1CggRAty+B9VO/CEKu4bUvKOc4ThgK1sa38e7r/cZ6w9CBBmy/fX1o9rqjGCAYxscF41Vx5lmIafLY9R0r7LY8Y2wI++mnTlNpEYjIjpFpp3JAkuzi6q/6ptt2waU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707272328; c=relaxed/simple;
	bh=xkhRId5r4oqCScrPo2sSK2SXeoF6TJJy4ACkY8t5FBg=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=t0qIfzIIhuSEf1Pzbao9OfEQDyFo7w6K/ggZcRMtblf4KNOGaSdUakhKYWXVVF8aEjxrLOvZlloK4f7XTq8Vh2K8TI2cpMoUnUfEsYSbPBsZevGrsbnV7MR70dU+VeOYPgKzyjhhmkJk+Low92EzHFnu9ZxNybC+K8RtnGPGqrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=sUJObrac; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-21946b0f3f1so100150fac.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Feb 2024 18:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1707272325; x=1707877125; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kxFOOqx0eJuZFsIdwMGbS9E1uZmr+uBpYH/swrBs8kk=;
        b=sUJObracRoqRG907ZtARbw0+a6G4F0CKcWoAoayXI+39lTb73Bfy/X37gvKcOMUJJj
         QsrcApNimuuQ7gAS0nLY6omlwR1jR79xwvHHWURRAeOYfbZB3O+nGeON2Z/J/VxbRlCv
         QadIgAebXdW8BAzHRk68WuuJq4lOKax3feakwMe8aDuk+4KjsXlA0zSL2kiQQ9JIsFL3
         glZl+wllA4o6SeSGhOBQl6VOSYb0D3HCZErsMg6NK/HUbpwh4SCeLA7ynQPpmPAW6Qlj
         htGLehBqtv/qFTKLrZ4QmuUZ8vqPC52SA5+2NHSAZzBc34BA4KTXdFggAGHEuHE25s05
         XO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707272325; x=1707877125;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kxFOOqx0eJuZFsIdwMGbS9E1uZmr+uBpYH/swrBs8kk=;
        b=DW1ArQHISjUjmU2NH0tH+/SJ77WdnBD/3i33Gjm9BsP/HwHV85h4MpE4Suqz9xvP7X
         qIFku35zuANnSFIU8TJ0cO0SImEudUPzwWeBDrMJ1STGCfe9+zKjRc+p185CThW456Zf
         OFoVUY8ySeWLJOL8e8zLHFfiBx4E02WziXpzkau62+2vxyKPBluAg+KQE9cOIVSYA4jG
         ixamyR+crqPuM98pJ6CWL7fIQ94IQxw7vywLdBBKXy0Hk1yN9zxAAfXS86Yqu8n7frX7
         0CN4x/mQVaVUPuK/8/WNyA1DAkJ/DpeVn/m8M3yfcBe5H/BHUeVx0ua9Mp996W5ehGjb
         08XA==
X-Gm-Message-State: AOJu0YzW/jBNOZyPZW3MyO6m7Bs5o29ME2jPrE/UBW9wG3UBM4BLofAE
	2ZLNUsJzaCS3PON6QKld4ehrrTbLaeWbcoe6THhdaBzQGGZG5v7YDPhySCZnRhFcm4vYc5YPQrI
	J
X-Google-Smtp-Source: AGHT+IHoUhjQVNpXbCXZYbAxE24qYDoVm0CJvn3AU9dBedZIyEO45HfvdUUrc47RCofpiNihqARv6A==
X-Received: by 2002:a05:6870:d10e:b0:218:d4de:7fe9 with SMTP id e14-20020a056870d10e00b00218d4de7fe9mr5062864oac.43.1707272325406;
        Tue, 06 Feb 2024 18:18:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUOPvZ/GDF69J0f3jUKIr2pSR5pNcsE5ySNEy5h+LD7BcceYuH/GEMMwI7qIzjrIm8k8o49lAEPRrjRz22iT5O/TyRwoPYU0LSwKg==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id o17-20020a637311000000b005cda7a1d72dsm184637pgc.74.2024.02.06.18.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 18:18:44 -0800 (PST)
Message-ID: <65c2e884.630a0220.32178.09ee@mx.google.com>
Date: Tue, 06 Feb 2024 18:18:44 -0800 (PST)
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
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2024-02-06-v6.8-rc3
Subject: renesas/master igt-gpu-panfrost: 2 runs,
 1 regressions (renesas-devel-2024-02-06-v6.8-rc3)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/master igt-gpu-panfrost: 2 runs, 1 regressions (renesas-devel-2024-=
02-06-v6.8-rc3)

Regressions Summary
-------------------

platform      | arch  | lab         | compiler | defconfig | regressions
--------------+-------+-------------+----------+-----------+------------
rk3399-roc-pc | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2024-02-06-v6.8-rc3/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2024-02-06-v6.8-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d9725adb75e9a17df52743713a914fb7449ba066

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  75254bf2390c10644ffb35a90fc8f18f196f9f0c
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  0830aa737c4447599d9cd5cf3d2c759e8fc73569 =



Test Regressions
---------------- =



platform      | arch  | lab         | compiler | defconfig | regressions
--------------+-------+-------------+----------+-----------+------------
rk3399-roc-pc | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65c2dd9ea09d7c3d318e1e7a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-06-v6.8-rc3/arm64/defconfig/gcc-10/lab-broonie/igt-gpu-panfrost-rk33=
99-roc-pc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
024-02-06-v6.8-rc3/arm64/defconfig/gcc-10/lab-broonie/igt-gpu-panfrost-rk33=
99-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-ig=
t/20240129.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.login: https://kernelci.org/test/case/id/65c2dd9ea09d7=
c3d318e1e7b
        failing since 1 day (last pass: renesas-devel-2024-01-31-v6.8-rc2, =
first fail: renesas-devel-2024-02-05-v6.8-rc3) =

 =20

