Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19FF44FC949
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Apr 2022 02:32:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241399AbiDLAeR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Apr 2022 20:34:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbiDLAeQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Apr 2022 20:34:16 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D062025594
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Apr 2022 17:32:00 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id j17so14551510pfi.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Apr 2022 17:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=KC8ebLTBENOzlne8HbgkqSc//ItRFrhL/tyLrtD+o2M=;
        b=wjcH0Kjo2MVxwR5gJnjiTTfz/EcdjuApWBnrNUGVhGAeg/7+VVJo/yaiWFHYxgIYTt
         /PK+XLsOWpIj4QMwF6x6D9HREaPWUVURs9Ii6pcMWuQk9pasCmA64TYFPn0gDFxN6Fw/
         0Rr3bnBnBQpmy7hWG4vozxHN1pxsSAeoEA7HOKYHyj2vkZr86lTys03QtVk469AygwoQ
         dBvWJ5dAFKFE+l3WmEVtmxv4mYjc0bLwhr2jBhDc7DpJ18FeR3oCe4TUbCQOdD0JQ/9G
         B1wSHc0dUzIxLNoNJHEKjzeWQ8ft+nnYd/IwZDBRYBEHDl+SNpwpkGdr3GkWZ7Cqhfyq
         Mw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=KC8ebLTBENOzlne8HbgkqSc//ItRFrhL/tyLrtD+o2M=;
        b=MyTj921D89n5lh5LgV0NSYGxdbb0T8FDDwyPhMyTlhKJe/1BdqY7WGGsl55czXkpC1
         qhMDRMWe7pZxP2HlKpsQL1sAbHbPtN+L3XjyLQ+sDejtuit5Ttzll4pYPkppWfiR6Iws
         358EVlOo7SeZ1r3rXP0yl5oGoebTQjdd8eTHHbJ6UgEGTKhUQyfHgf1EP6OU3jJRVHX1
         UEKZXD+jDed0mA15CCQsbz3KHlM8JOlW0OLplCqT1yoQKkmtNxG67PcChq7Dw8r6POrZ
         o7QFM5pQ34eZ9V+tf/K+DowfbohDiOA0ULu7dXidAsIrpg7Q2sn5e362NuBLcJl/RGe6
         mHdA==
X-Gm-Message-State: AOAM530ZefJ4S6+9iJpefrPCQ2Hk5tA09rQcDzKHe8hGjswqaPGmjO2q
        9spe8l+RhJFiDBm1gf/lGYTZt/biOGYRNQuY
X-Google-Smtp-Source: ABdhPJyXDUA75BeDcu0vpcIOt1dY0yqW/XwQ7BlqRClCfIELQcG4UI4u7d70HH6Zw0LxWyJyLYmt5A==
X-Received: by 2002:aa7:943b:0:b0:505:70bd:61ab with SMTP id y27-20020aa7943b000000b0050570bd61abmr1910772pfo.58.1649723520207;
        Mon, 11 Apr 2022 17:32:00 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g3-20020a17090a708300b001c7e8ae7637sm619222pjk.8.2022.04.11.17.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 17:31:59 -0700 (PDT)
Message-ID: <6254c87f.1c69fb81.f3b8d.243f@mx.google.com>
Date:   Mon, 11 Apr 2022 17:31:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2022-04-11-v5.18-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next igt-gpu-panfrost: 1 runs,
 1 regressions (renesas-next-2022-04-11-v5.18-rc1)
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

renesas/next igt-gpu-panfrost: 1 runs, 1 regressions (renesas-next-2022-04-=
11-v5.18-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-04-11-v5.18-rc1/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-04-11-v5.18-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      18b3b4968658b20ca316d07f1223223ab92cb072

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  85393adb12ad6277b21b885f11a3b94ef2d531db
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  50f7bc405cc1411f57855ed23322c6c4d2510b58 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6254aa0ec55b6fd20bae06d0

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-11-v5.18-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-=
gpu-panfrost-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-11-v5.18-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-=
gpu-panfrost-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220401.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/6254aa0ec55b6fd20bae06d3
        new failure (last pass: renesas-next-2022-04-04-v5.18-rc1)

    2022-04-11T22:13:21.924599  <6>[   23.104630] Console: switching to col=
our dummy device 80x25
    2022-04-11T22:13:21.930850  <14>[   23.112036] [IGT] panfrost_submit: e=
xecuting
    2022-04-11T22:13:21.937720  IGT-Version: 1.26-g50f7bc4 (aarch64) (Linux=
: 5.18.0-rc1 aarch64)
    2022-04-11T22:13:21.954185  <14>[   23.132064] [IGT] panfrost_submit: s=
tarting subtest pan-unhandled-pagefault
    2022-04-11T22:13:21.958087  Starting subtest: pan-unhandled-pagefault
    2022-04-11T22:13:22.077278  (panfrost_submit:351) CRITICAL: Test assert=
ion failure function __igt_unique____real_main65, file ../tests/panfrost_su=
bmit.c:178<14>[   23.254424] [IGT] panfrost_submit: exiting, ret=3D98
    2022-04-11T22:13:22.077610  :
    2022-04-11T22:13:22.091266  (panfrost_submit:351) CRITICAL: Failed asse=
rtion: syncobj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_=
NSEC), 0, NULL)
    2022-04-11T22:13:22.092592  Stack trace:
    2022-04-11T22:13:22.096443    #0 ../lib/igt_core.c:1756 __igt_fail_asse=
rt() =

    ... (10 line(s) more)  =

 =20
