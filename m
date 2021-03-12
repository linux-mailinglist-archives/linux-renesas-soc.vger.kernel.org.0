Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8C7338C11
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Mar 2021 12:56:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbhCLLzv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Mar 2021 06:55:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231979AbhCLLz3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Mar 2021 06:55:29 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D6E6C061761
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Mar 2021 03:55:29 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id s21so5048247pjq.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Mar 2021 03:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=VEiB4v8LI3dupq7FdkhDMUIxAg5EvR9GdCtZ+ITyAPg=;
        b=CCZnShC4EfavOQHZhv6x6SOiQn7/OWuW4A3R4/eJLRvf6zpoIV8zkVyc2pPWhdzaat
         yWod6IDcKwUyNSB8a8w3+rSZfS6f5dMzobpliEri+hkDRDd/nObTL9bW2wgsqYbfOFOH
         7TWkHVX8iIBhfFfUHFSIKMFlvL9LoadyeZNEsTrAn5WEzOjUccLq2pWhCPYMc4QCAQrJ
         IGjh522z4xTgmWOIJpItqTCTuQw4Dm4XKafVBwP9Z/eRseYCuhRGr+3+91IWgfv66gYm
         R0oJL+U/FDRZxifAHRwGXNtDZNNYtAmOkvCnmRT7EV0jw85s+yNSeu4LWm3ZL7m/omHS
         uxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=VEiB4v8LI3dupq7FdkhDMUIxAg5EvR9GdCtZ+ITyAPg=;
        b=EIGLEH9v6Siz8CCQXo8w7vkjS8MM6kfR7gMO5cZaOR58zeyj+VV6laEk4rHCleKZC1
         BAFPfAn9Sl873XeHov18B2zpuUPHoSFaLqZxzBDwPu3jXq58FVlEHfV1GBN4O+2ge46v
         mYjknWsvs6cael5F0/Lnmy5hwu/25Q5WCz9vSk8TB3cDnsiVxBlbgOnhqT/jF8hKgEaN
         6B01NOD/PfO6NxMp1gTOjZoGw5HD7NsO63f/DojcaqREl84ebkHpvTrvB1WJYYsEc5rT
         IBvGAvMM19zuTlgNUekWk76wT/XPYLI2VHNj5uLc4EJbC2GIGSQNkZJGc7FQzFyriLEK
         Fb9w==
X-Gm-Message-State: AOAM533ARmrc6sX6Nwidd55AHIVW4+jI1mq+O0F9OG64XQpnA98eGmtU
        JWaT3wKxhh1B9GfsRGSnwQNLU180gu7nww==
X-Google-Smtp-Source: ABdhPJzaaNtS3nYOocIKuNCNBA9kD5HZo3devuR1aH6n2Agh1pgAJN2Is9vv1suD3NZz2Ebkop0gCA==
X-Received: by 2002:a17:90a:d903:: with SMTP id c3mr13943621pjv.27.1615550128810;
        Fri, 12 Mar 2021 03:55:28 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y4sm5317753pfn.67.2021.03.12.03.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 03:55:28 -0800 (PST)
Message-ID: <604b56b0.1c69fb81.ddad8.e1b6@mx.google.com>
Date:   Fri, 12 Mar 2021 03:55:28 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-03-12-v5.12-rc2
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master sleep: 3 runs,
 1 regressions (renesas-devel-2021-03-12-v5.12-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master sleep: 3 runs, 1 regressions (renesas-devel-2021-03-12-v5.12=
-rc2)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-03-12-v5.12-rc2/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-03-12-v5.12-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6ca7a993828c498b3c9b53e42709da961712a99d =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/604b48115fcb4b408faddcc6

  Results:     12 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-12-v5.12-rc2/arm64/defconfig/gcc-8/lab-collabora/sleep-rk3399-gru-ke=
vin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-12-v5.12-rc2/arm64/defconfig/gcc-8/lab-collabora/sleep-rk3399-gru-ke=
vin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0301.0/arm64/rootfs.cpio.gz =



  * sleep.rtcwake-mem-5: https://kernelci.org/test/case/id/604b48115fcb4b40=
8faddcce
        new failure (last pass: v5.12-rc2-402-g439caa20adad) =

 =20
