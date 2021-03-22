Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 546A43443F6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Mar 2021 13:59:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230362AbhCVMzu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Mar 2021 08:55:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231271AbhCVMxR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Mar 2021 08:53:17 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A53B3C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Mar 2021 05:53:16 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id e33so8560913pgm.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Mar 2021 05:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=lR5GEV2jeLGA3OcF54er6iTkEUls56JYoryQHJ10wBo=;
        b=SP17s6D4BEc38gAROhSCrjLSmyJkRyrNoO0KkR+2rewku2Eei3oert+u0kwpico+q6
         IwrpJEMA0Mf645NEaaMdrwGIVMGfxjFZN+U6BSkvoUV891Oc8BPDoEvDgwi28PQfax+J
         wJqyE3v9MRaWPDaDnPKAzh1OfEVl/A+HjePQlqW9nQ8dH4M4gpXahxAFb/gMxB07bcML
         cpDXaDeelPXNc8RxyiecfVOKlIExzefCiMUzipjXhavrBdZXRPnZa4eqqa4aS/iBioxc
         fdap/1+MeDDcDqw2IRcKleket+W/KbS9+H7EA++sFuAvvMhhRE6tKMKfIPxylme24vw8
         eb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=lR5GEV2jeLGA3OcF54er6iTkEUls56JYoryQHJ10wBo=;
        b=fcV7hdURNDMCcA2SsAHNNMktTr5glnaskz9hdjoX219D17kab9hP2Tw7IYXJSljM7G
         LRH6NQK1ALpgFnBHjgBt5kR0Cs1AcEFR/PfxpW0o1EJFRsewP5Sd32yh6xAYtqdH8yR9
         t0b+QSRtN/+7I+HxsJvkWzH7xxJMuGSSPnyj3AUd8wQzF5aIEpm5hoxNF48xScoMncVe
         lFi9vk0yna55QQGfCAvISB6x0aebOUbeN+YW6uYxXxJbqmDINvqM7iK3i0vkU7WcCi8q
         WOA0dV206C/275EUGJ5TttpYphQetC1P7OEV3DNlWOFkgilNukU37tX2yrXPz/qCILBw
         TXjQ==
X-Gm-Message-State: AOAM532ii2d+AP3bR6/yEGk0G/LWXZL10iXujtDVoo7+Y9mF3bfPyaNf
        GCILdK86ui/NG97KWR6dCjBxLxdoQlP0rA==
X-Google-Smtp-Source: ABdhPJyhDp0v4TPDYxTbxx0+8UZuvTdJjDWGmRRVBzX+GGSjF+FEwmJ4LykkPKwCcVkhqc8XZjCW/A==
X-Received: by 2002:a63:141e:: with SMTP id u30mr23031131pgl.31.1616417596033;
        Mon, 22 Mar 2021 05:53:16 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id cv3sm14745658pjb.9.2021.03.22.05.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 05:53:15 -0700 (PDT)
Message-ID: <6058933b.1c69fb81.ac0e1.2936@mx.google.com>
Date:   Mon, 22 Mar 2021 05:53:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-03-22-v5.12-rc4
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master cros-ec: 2 runs,
 1 regressions (renesas-devel-2021-03-22-v5.12-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master cros-ec: 2 runs, 1 regressions (renesas-devel-2021-03-22-v5.=
12-rc4)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig | regressions
----------------+-------+---------------+----------+-----------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-03-22-v5.12-rc4/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-03-22-v5.12-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      98d704ec88d32a3ece2e35f14ee85c45fe9d5d9d

  Test suite revisions:
    cros-ec-tests
      URL:  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/cros-ec-tests.git
      SHA:  e4c91962f6e19466c1e43629a2c6cd04ff012e06 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig | regressions
----------------+-------+---------------+----------+-----------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/60588212bcf4afbf1faddcc0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-22-v5.12-rc4/arm64/defconfig/gcc-8/lab-collabora/cros-ec-mt8173-elm-=
hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-22-v5.12-rc4/arm64/defconfig/gcc-8/lab-collabora/cros-ec-mt8173-elm-=
hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-cros=
-ec/20210315.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/60588212bcf4afbf1faddc=
c1
        new failure (last pass: renesas-devel-2021-03-16-v5.12-rc3) =

 =20
