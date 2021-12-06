Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 523CC46956E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Dec 2021 13:08:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242917AbhLFMLj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Dec 2021 07:11:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237534AbhLFMLj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Dec 2021 07:11:39 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06BEFC061746
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Dec 2021 04:08:11 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id g19so9961643pfb.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Dec 2021 04:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=p8LCSR/fC6r4CUkLcOyO32cTl99azoD1rf7Sizf7wsA=;
        b=xPnu3Ld3Dmi7+mJeFZ5+4LsLPcrYprawbB4J8OQOnfCwknF+1lfcvwmv/Y16Xmyb7E
         Bx30E8Z9J/WnvPiJRjd41RGbEjX8JlfvqscBJ30NHZnWMW94bvwSiUOk41VfRpIYo6M1
         lpvgmrVUEuK5oJIE+eG8J7n7m3JH9HbBGKG3szOaw+3RLSJU2njgnJC20Ry441r5wf03
         vbHQga34KYCBHlQtw7ZIaRS8OjrwH3leI/bzorc0hHE6sRIXGaPWr8O5Vy0x0q613RnQ
         +0bJjbugRL11A20NTXz1XuZ99DQnQFLpnMKVAqpaJNdsF77Qq04/vz4M2Z6i1ALqXtXZ
         8+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=p8LCSR/fC6r4CUkLcOyO32cTl99azoD1rf7Sizf7wsA=;
        b=kbC+npba3r6XGOzj2QfG5+Hp5kIUvTMy+t8CvRehwQSgmI6VQ1cAfmdptAqZCk0CNS
         07pkfh34yudY9nTBj2YEJZNMzmApMP8Ub+3qtA4r9TEGvig7U+TBb+YwIWPTmPoTPeXh
         8mbTgw+VJ7ZiHScuwb4P10hn6Ysm4lbtCIz2qFDOXo6E7+dXXb132PiEjmbVxOXhTEjz
         IbOahJWjJNVp8MvSEso1K3W6dM3PjqHrwWne0nsSckbTrdWoWZnAKCs45T5GJAOyNt/U
         Y+EU4gUbHaAD9D7VwJUEdbCJD2SO9eBbcKH2VOkUABKNqHD71IqYK+27MSilvtbF3Bgt
         G/Mw==
X-Gm-Message-State: AOAM530cz0SzRZ59A6mbE2O/Y8RMtu3J/T/q6K0Z1Uas7YugpUNEBpV9
        4PIbF5MsyHZeEgYGLL+PtzGz2pqw9/yLor1W
X-Google-Smtp-Source: ABdhPJx3M4RokGuWONDw0mqlXTNlV3mEHfRB+nBc9WjRZtZSW6nJxBIUtlRoOC+Gm5byWYbTmlBNXQ==
X-Received: by 2002:a63:6b48:: with SMTP id g69mr17984053pgc.169.1638792490330;
        Mon, 06 Dec 2021 04:08:10 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d17sm11803241pfj.124.2021.12.06.04.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 04:08:10 -0800 (PST)
Message-ID: <61adfd2a.1c69fb81.fcb54.ffb0@mx.google.com>
Date:   Mon, 06 Dec 2021 04:08:10 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-12-06-v5.16-rc4
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master igt-gpu-panfrost: 1 runs,
 1 regressions (renesas-devel-2021-12-06-v5.16-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-gpu-panfrost: 1 runs, 1 regressions (renesas-devel-2021-=
12-06-v5.16-rc4)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-12-06-v5.16-rc4/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-12-06-v5.16-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      8feef3cda1f4673737514cb20366eeeb69cc0be2

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  8d0fb9b3f225183fb3276a0e4ae1f8354a3519e8
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  bf11f87c27ad1cec3e60bd31c23080d19aa093f3 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/61adeef019f6b4db211a9496

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-06-v5.16-rc4/arm64/defconfig/gcc-10/lab-collabora/igt-gpu-panfrost-r=
k3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-06-v5.16-rc4/arm64/defconfig/gcc-10/lab-collabora/igt-gpu-panfrost-r=
k3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20211126.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/61adeef019f6b4db211a9499
        new failure (last pass: renesas-devel-2021-11-30-v5.16-rc3)

    2021-12-06T11:06:35.012826  <6>[   23.934638] Console: switching to col=
our dummy device 80x25
    2021-12-06T11:06:35.017937  <14>[   23.941325] [IGT] panfrost_submit: e=
xecuting
    2021-12-06T11:06:35.023992  IGT-Version: 1.26-gbf11f87 (aarch64) (Linux=
: 5.16.0-rc4 aarch64)
    2021-12-06T11:06:35.033861  <14>[   23.954184] [IGT] panfrost_submit: s=
tarting subtest pan-unhandled-pagefault
    2021-12-06T11:06:35.037786  Starting subtest: pan-unhandled-pagefault
    2021-12-06T11:06:35.154999  (panfrost_submit:340) CRITICAL: Test assert=
ion failure function __igt_unique____real_main65, file ../tests/panfrost_su=
bmit.c:178<14>[   24.074686] [IGT] panfrost_submit: exiting, ret=3D98
    2021-12-06T11:06:35.155514  :
    2021-12-06T11:06:35.168624  (panfrost_submit:340) CRITICAL: Failed asse=
rtion: syncobj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_=
NSEC), 0, NULL)
    2021-12-06T11:06:35.169997  Stack trace:
    2021-12-06T11:06:35.175030    #0 ../lib/igt_core.c:1745 __igt_fail_asse=
rt() =

    ... (15 line(s) more)  =

 =20
