Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8669133D56A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Mar 2021 15:05:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235894AbhCPOEc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Mar 2021 10:04:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235866AbhCPOEU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Mar 2021 10:04:20 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84224C06174A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Mar 2021 07:04:19 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id nh23-20020a17090b3657b02900c0d5e235a8so1520407pjb.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Mar 2021 07:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+y6MIYaf46MOas4hS2JA8z5/wC1pmF2a3vXyAkGxVTE=;
        b=C9KVIQJigqSHXBunqo+a5RD71xAL80dosDTSjr//vJmIPVgOHul6AJ9FpnJISgbegf
         +4uX87pZZY8r2TeMB6dUvVJLPiXd+p/fchZ4JxENOgVKbpYSg2CqaF7vJlg7z4NBBea9
         tBChu9QcJw3Eb2CoxKN/Qfl9lC4IHFhFdc5CvQpJqj9vAUS4uUUnqWofgKKPncBnK6Qz
         E6aSDc2Tmv9rEN73QpM57Qg4CcjQHAv+jX8vpY/MHxhCsDvtN+lFLEpsC9V0hYqyLdyR
         dGfVl/MbFRgWiE3xZaiPuFvN/375lfUSYS6kTMaTdFJDQ5e24uABX+FYALY3sj4XSIct
         r1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+y6MIYaf46MOas4hS2JA8z5/wC1pmF2a3vXyAkGxVTE=;
        b=pMj0G0M0I4FJi9P2N+Yp4kCJUwM8IT0YaKPmABPhIigfmk2ka92ROzbee7mnHjpnij
         6xIf5cpAb8DCSRn3LGjMnSeyQyqc2+6Wk4Zz7LVPrWcQ4VHgWJ/AuDSBtQJ9FLRVJUyN
         NY9pf1CIyO4F13VNAC75kGpyvD68MwAZdF3Glpd+vk6P9empTxzsE6SnJvaETNtqG0CT
         eDXPMKd+hjPdq9l6LrIIZ/3z+MqBzxGKxFBS0G4DF/+zTr7h2tOl4R/uwUnIvcpm6Sw9
         OPn1ZFNkESmjrkXs/udx07Cu5wyWRP/+8Y0z/hgzvaBW3BAkbzALCdp4eI4cSNBbkU+B
         HKZQ==
X-Gm-Message-State: AOAM533BboH/OjDsSd8jpqma+rVLqk71esh0Hq/Q8JhtwvQhhidcfwrK
        gsQitFqbmlBvUF3IdRmtUOpoJuNiUfFX5w==
X-Google-Smtp-Source: ABdhPJzxaaxMoci2D4gcsA0AR1BtI6snrMT9qUrUXG+k7leLTEXOo7DJFH9GSEVpcWSm0vNHcpuuYQ==
X-Received: by 2002:a17:90a:670a:: with SMTP id n10mr5037515pjj.101.1615903458812;
        Tue, 16 Mar 2021 07:04:18 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n24sm16933165pgl.27.2021.03.16.07.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 07:04:18 -0700 (PDT)
Message-ID: <6050bae2.1c69fb81.4d163.8a4e@mx.google.com>
Date:   Tue, 16 Mar 2021 07:04:18 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-03-16-v5.12-rc3
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline-nfs: 19 runs,
 1 regressions (renesas-devel-2021-03-16-v5.12-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 19 runs, 1 regressions (renesas-devel-2021-03-=
16-v5.12-rc3)

Regressions Summary
-------------------

platform  | arch  | lab           | compiler | defconfig | regressions
----------+-------+---------------+----------+-----------+------------
hip07-d05 | arm64 | lab-collabora | gcc-8    | defconfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-03-16-v5.12-rc3/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-03-16-v5.12-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      0f7f46c3ad4c7155aaa1d7077afdab5b3e9f7a9b =



Test Regressions
---------------- =



platform  | arch  | lab           | compiler | defconfig | regressions
----------+-------+---------------+----------+-----------+------------
hip07-d05 | arm64 | lab-collabora | gcc-8    | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6050889490b5445707addcc5

  Results:     2 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-16-v5.12-rc3/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-hip07-=
d05.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-16-v5.12-rc3/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-hip07-=
d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0315.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6050889490b544570=
7addcc6
        new failure (last pass: renesas-devel-2021-03-12-v5.12-rc2) =

 =20
