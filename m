Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC8F5427230
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Oct 2021 22:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232047AbhJHU1v (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Oct 2021 16:27:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231727AbhJHU1v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 16:27:51 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D8DEC061570
        for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Oct 2021 13:25:55 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id n2so6834950plk.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Oct 2021 13:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=qCExe2D4CedgmMF3/F6ss1nTi/GpDdNqsQP7kaDy478=;
        b=ry+PFivylopPF+qwBXYdO96aZ5dkK7J8owiOGVuKRzc/mGLfck/mtE935vGupLeTiu
         UbxqZoKR9J40sr1zLZGwaiVrw6i451EQHbHmMfnwg3ebahhYtturzU4M97NVSuGh8pFH
         lmeO8FYhl0daqlVxv0DlAa0TqNc6VXPhA+4IrmxDhgLhjL0FU8zQ8P4IRggWU393rOYM
         UWEB4vLOCh0U527FyEDdA7z800YWu121AfGMiqZ1bCnu7tCC/cHvudFy39Blib7JPG6N
         zPEHFdgxsjVlq/7IW/KsZpwV/tKTRpH/8vowTEEqQ2+Pg+ikIMIbF67Dm8PmDHnXzfDg
         IJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=qCExe2D4CedgmMF3/F6ss1nTi/GpDdNqsQP7kaDy478=;
        b=sDIM5PRI9J+XNux9vucq43ioSPazwHU0/vSgDkkde+ZUbxeG++vt1cfDOLfuUq/Qi6
         86Z2AAS3sPoykVziEWNBJrTaw8N5nTLswJAiiqyFusQ0WTjfR15+zaE9RBbewWs/jUYc
         JG3+YxoR+cP6flTzxsMjnI12zTDXXpKZWqUNbWu5sbMoYa4mvLvyr3kXbYkTdZqj9h4E
         vR3vY78ouuPQd3RiXwcpdoAGHvbpBEMQYJHAFAsIEi91v5QL1Fwz7N4qZbzNi+Hwl/oL
         zt3C+uWMEyECaj9TQ0YUYz8kzHfLCk3yZrWegp/YHAsN3pD3IWqEQ56+fkkEHDbsWoK1
         yc4Q==
X-Gm-Message-State: AOAM530c7IT8w4HQ29vLZlKEAAYWX9elFiykyW1Z1opvbjlajZmjy9Ip
        +oXut3/vcPvSZtEE/dNTEr15NeDI6lyf0Bnl
X-Google-Smtp-Source: ABdhPJyEwsasBcoGeg4IDF1Tvr/xzRRE7WafR2MubYcwzu58Up/kwJt8N65GvJxbcXgUOnuKr9u3Tw==
X-Received: by 2002:a17:902:a50f:b029:11a:cd45:9009 with SMTP id s15-20020a170902a50fb029011acd459009mr11739354plq.38.1633724754830;
        Fri, 08 Oct 2021 13:25:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i13sm12598347pjh.0.2021.10.08.13.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 13:25:54 -0700 (PDT)
Message-ID: <6160a952.1c69fb81.f5475.506b@mx.google.com>
Date:   Fri, 08 Oct 2021 13:25:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-10-08-v5.15-rc4
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master igt-gpu-panfrost: 1 runs,
 1 regressions (renesas-devel-2021-10-08-v5.15-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-gpu-panfrost: 1 runs, 1 regressions (renesas-devel-2021-=
10-08-v5.15-rc4)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-10-08-v5.15-rc4/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-10-08-v5.15-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      c2a19dc748287f470b9f2117e1b50206988efa8f

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  8d0fb9b3f225183fb3276a0e4ae1f8354a3519e8
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  1084c5eb74fd0daf8c9b8e83e85f5208c396579b =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/61609b2c5f626c7a8299a316

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-08-v5.15-rc4/arm64/defconfig/gcc-8/lab-collabora/igt-gpu-panfrost-rk=
3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-08-v5.15-rc4/arm64/defconfig/gcc-8/lab-collabora/igt-gpu-panfrost-rk=
3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210913.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/61609b2c5f626c7a8299a319
        new failure (last pass: renesas-devel-2021-10-04-v5.15-rc4)

    2021-10-08T19:25:27.064425  <6>[   22.955949] Console: switching to col=
our dummy device 80x25
    2021-10-08T19:25:27.071604  <14>[   22.963450] [IGT] panfrost_submit: e=
xecuting
    2021-10-08T19:25:27.078171  IGT-Version: 1.26-g1084c5e (aarch64) (Linux=
: 5.15.0-rc4 aarch64)
    2021-10-08T19:25:27.093146  <14>[   22.981305] [IGT] panfrost_submit: s=
tarting subtest pan-unhandled-pagefault
    2021-10-08T19:25:27.096305  Starting subtest: pan-unhandled-pagefault
    2021-10-08T19:25:27.208538  (panfrost_submit:345) CRITICAL: Test assert=
ion failure function __real_main65, file ../tests/panfrost_submit.c:179:
    2021-10-08T19:25:27.216662  (panfrost_s<14>[   23.103365] [IGT] panfros=
t_submit: exiting, ret=3D98
    2021-10-08T19:25:27.227475  ubmit:345) CRITICAL: Failed assertion: sync=
obj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_NSEC), 0, N=
ULL)
    2021-10-08T19:25:27.231958  Stack trace:
    2021-10-08T19:25:27.234270    #0 ../lib/igt_core.c:1745 __igt_fail_asse=
rt() =

    ... (17 line(s) more)  =

 =20
