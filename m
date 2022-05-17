Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0C8552A0CF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 May 2022 13:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239440AbiEQLzk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 May 2022 07:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242695AbiEQLzi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 May 2022 07:55:38 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3A8F4C41B
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 May 2022 04:55:37 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id qe3-20020a17090b4f8300b001dc24e4da73so1700421pjb.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 May 2022 04:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=tiwMuDzRW/vbMIXPfnSKlrwvEsA4ENrqNrP3JuP5OPY=;
        b=uOVDWVn+Pf80pkKU3FS4grh4fjoN7xXTfQowSPT3YNQAfiorvL3wuGPKQB7D9JrkT3
         f/xCz3RMwUg52sLX5ErZ5IddufxtqhlX9Jn6oDuHKY0lf/NP4aQUqsN1oMkCVboQEiCV
         9m84hhangs0w7vJqDF2R104xggyDvdT6a8QwLqmRc1gJUFbbSDPHE1IKtTC6CToUV1Lh
         CqFMGG7Wi3mzoHaHxt75rqw8F+hsBOWdAQGBJiyjaOvt3zgL4fI/NDI5PxB2W+HQNZf/
         0vxs1el7u08EY1MTW2UTqW8jn+S6GH1syoiiBNVw80zAWU5ZWcvTqdeBmL7z5+2LpauJ
         Es5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=tiwMuDzRW/vbMIXPfnSKlrwvEsA4ENrqNrP3JuP5OPY=;
        b=jkGHNZtSklNzZVi82puHABcR0s1kc/eZAwJoRIlLhIovUx0UOwfiBwLteau3ZvWCoA
         UwYIMutmgK3/tt8/u9DtZsGwurBnrjUGQn9HlIa0cLl8lsfsr49FzHupM3lP66f0TLfc
         oNs0YO+rx2ALcl8tOw/QMvBLmq2fvClWVZ3uyH95/Rvn58EOsUrsEVllyOfB5Azfz47+
         nPOJmbQRGOr1E1YlePZmitP+dggbt6IMHbVgUX2fpIwv74PqwBwK/Wkp93GP0Nc4CaYz
         0MLbFByTtlZ0+rVtzomjji1vJ91q7La52c7CEm2L/rWOvzL0GQVMZGRBXo+W9/Mmx8ND
         asDg==
X-Gm-Message-State: AOAM533KuS676Bgy7WyrbumTRmPbXoCYd6T76QzcCf4GQke92SbiXSVF
        xVBiXFYTDwca6b1CVWNVsMhAAJJdGfBkuY6LvGw=
X-Google-Smtp-Source: ABdhPJxbR+G5WQNfsjtIx3CRXSd73kyQHEwMa65+54Kc5TjH3jauHaQT+hU7fKvQDQYZROVFj8kEEQ==
X-Received: by 2002:a17:90a:a393:b0:1d0:e448:811d with SMTP id x19-20020a17090aa39300b001d0e448811dmr36134299pjp.97.1652788536900;
        Tue, 17 May 2022 04:55:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r15-20020a63ec4f000000b003c14af50610sm8519918pgj.40.2022.05.17.04.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 04:55:36 -0700 (PDT)
Message-ID: <62838d38.1c69fb81.c9aac.4e75@mx.google.com>
Date:   Tue, 17 May 2022 04:55:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-05-17-v5.18-rc7
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master igt-gpu-panfrost: 1 runs,
 1 regressions (renesas-devel-2022-05-17-v5.18-rc7)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-gpu-panfrost: 1 runs, 1 regressions (renesas-devel-2022-=
05-17-v5.18-rc7)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-05-17-v5.18-rc7/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-05-17-v5.18-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6bd98cbba53cd9f63aaf4d82982dff95c824b92a

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  ae6d81da2093b139ece952913f8f00dcc26ce7b9
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  c815c94f0ceb33ae852622538f0136cf44c5725d =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62837ceaac9b5cb360a39c61

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-17-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/i=
gt-gpu-panfrost-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-17-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/i=
gt-gpu-panfrost-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220513.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/62837ceaac9b5cb360a39c64
        new failure (last pass: renesas-devel-2022-05-16-v5.18-rc7)

    2022-05-17T10:45:48.017553  <8>[   24.667352] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpan-submit-and-close RESULT=3Dpass>
    2022-05-17T10:45:48.050009  <6>[   24.701997] Console: switching to col=
our dummy device 80x25
    2022-05-17T10:45:48.055360  <14>[   24.708684] [IGT] panfrost_submit: e=
xecuting
    2022-05-17T10:45:48.062689  IGT-Version: 1.26-gc815c94 (aarch64) (Linux=
: 5.18.0-rc7 aarch64)
    2022-05-17T10:45:48.078883  <14>[   24.729337] [IGT] panfrost_submit: s=
tarting subtest pan-unhandled-pagefault
    2022-05-17T10:45:48.083812  Starting subtest: pan-unhandled-pagefault
    2022-05-17T10:45:48.201270  (panfrost_submit:345) CRITICAL: Test assert=
ion failure function __igt_unique____real_main65, file ../tests/panfrost_su=
bmit.c:178<14>[   24.850406] [IGT] panfrost_submit: exiting, ret=3D98
    2022-05-17T10:45:48.201606  :
    2022-05-17T10:45:48.214925  (panfrost_submit:345) CRITICAL: Failed asse=
rtion: syncobj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_=
NSEC), 0, NULL)
    2022-05-17T10:45:48.216090  Stack trace: =

    ... (10 line(s) more)  =

 =20
