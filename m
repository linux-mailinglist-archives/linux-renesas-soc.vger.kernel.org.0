Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 184B13A3830
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jun 2021 02:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbhFKADk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 20:03:40 -0400
Received: from mail-pf1-f171.google.com ([209.85.210.171]:45898 "EHLO
        mail-pf1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbhFKADj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 20:03:39 -0400
Received: by mail-pf1-f171.google.com with SMTP id d16so2933544pfn.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jun 2021 17:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=oD5zAA4O29u22zpFrX9fJXyrX80jT9p/I1uHdmLy6qA=;
        b=PYOEitwUaU3IT0WAa2y9GK5lyoZsXNrzHbm16BvVWj6qNklppU8QOv36Tp4QuyEHQj
         qELEbgQtk5In5JkDUWJrPr4Gq8zV0klhErigZHLH8U2EF87WENRLq3fOmo0Yg8dI9q+x
         vj/ptUvml67GRe2NbBGvDt9IC6jWsb/D8leu2IGa5LSBYKWCexdzvDoHiHF3HqJ1qRUg
         DL4gwR7MONF11e7NqxHuMyJ2vv3zl2xfzO3/W73egdTRE5m/XxHBKjS/mSTIBEm5tKul
         oSF2w/j0io/NB+qA4ZuIR7ZiCFv9Ak/Dhe1aYLodlR8ofiJ1kMTQmZrSVuEWNBf0OwNv
         ZYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=oD5zAA4O29u22zpFrX9fJXyrX80jT9p/I1uHdmLy6qA=;
        b=W0+DtdJLOLpbX6CsUDpZ2TmOCijt5GKH0Wzm5j77+eC93cKp2ps5uCo1fbotEN3iYS
         1l7ANRauvXGxLurjrMjaWHtE9AO21D+sSmhERK9vlr5rVm50tEOogV+HatCuAzBcSBrV
         hGwsttxqj43+9RAYq8oe03E0Jqr0l/eGKtCIwpCz+AvW+3iZ2ZVI/Q0kTQM4z88OQaDt
         xyrxQ85hK6g8rxVqDhYhfpSGBgFoHz3IPhkwTTQtJfi3fsK+qB55LkkAzw1I7yO5/Uh4
         bGpTB7GmbjrP1lOxNGqSevydFd0/iK1BGxL+wLbi4Veh5Y9CgAWfQP21DlfKXMTWs0qs
         bGWg==
X-Gm-Message-State: AOAM5321KHMPFOUGDBy7wQK77SI+EMX6rGMvNZ4T7eOx4XOpU0FPjYjY
        XOGEJyTnKT/bxmyl8EiPd7OMrud91F+FHxDB
X-Google-Smtp-Source: ABdhPJwWwaoMg7Xbz0rz/nS+Fl7KZj9njY4GwwkHqFTphReiMKeelnLw1E0f2Jovi4RnwLGifGXvtQ==
X-Received: by 2002:a63:6841:: with SMTP id d62mr843367pgc.7.1623369626160;
        Thu, 10 Jun 2021 17:00:26 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x28sm3310976pff.201.2021.06.10.17.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 17:00:25 -0700 (PDT)
Message-ID: <60c2a799.1c69fb81.d5947.addd@mx.google.com>
Date:   Thu, 10 Jun 2021 17:00:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-06-10-v5.13-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master cros-ec: 6 runs,
 2 regressions (renesas-devel-2021-06-10-v5.13-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master cros-ec: 6 runs, 2 regressions (renesas-devel-2021-06-10-v5.=
13-rc5)

Regressions Summary
-------------------

platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
asus-C523NA-A20057-coral  | x86_64 | lab-collabora | gcc-8    | x86_64_defc=
on...6-chromebook | 1          =

hp-x360-12b-n4000-octopus | x86_64 | lab-collabora | gcc-8    | x86_64_defc=
on...6-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-06-10-v5.13-rc5/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-06-10-v5.13-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6f432b447a92822b48f7e674cec725b179c1fbde

  Test suite revisions:
    cros-ec-tests
      URL:  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/cros-ec-tests.git
      SHA:  e4c91962f6e19466c1e43629a2c6cd04ff012e06 =



Test Regressions
---------------- =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
asus-C523NA-A20057-coral  | x86_64 | lab-collabora | gcc-8    | x86_64_defc=
on...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/60c291ae222844f2350c0df5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collab=
ora/cros-ec-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collab=
ora/cros-ec-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-cros=
-ec/20210520.0/amd64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/60c291ae222844f2350c0d=
f6
        new failure (last pass: renesas-devel-2021-06-07-v5.13-rc5) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
hp-x360-12b-n4000-octopus | x86_64 | lab-collabora | gcc-8    | x86_64_defc=
on...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/60c290fd75da0820730c0e81

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collab=
ora/cros-ec-hp-x360-12b-n4000-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collab=
ora/cros-ec-hp-x360-12b-n4000-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-cros=
-ec/20210520.0/amd64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/60c290fd75da0820730c0e=
82
        new failure (last pass: renesas-devel-2021-06-07-v5.13-rc5) =

 =20
