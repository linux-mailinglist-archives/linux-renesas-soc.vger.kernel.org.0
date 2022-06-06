Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E417B53EEBF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jun 2022 21:41:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231130AbiFFTlB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Jun 2022 15:41:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232343AbiFFTlA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Jun 2022 15:41:00 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16DF210547
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jun 2022 12:40:57 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id b5so12911224plx.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jun 2022 12:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=y6EGVCM0xwPHWMsN0FWXShKfVGEtj+htzoJ0AMkKmWY=;
        b=JZY37X2K2FX2FiiToOlzcoXfnOhE4UlKjptJfnOaaQXhuPTynovx0LqiyyGAPUEHxs
         gHFapdjaIDQ/Tn0qD4AKt+MZZCiJReKyLdDaogob/2l+HscxBVtc9CyuYsoYco9NOqU9
         l4ReOaWl4QMjHkiICchabzvIPnNtrhPxF73DQvJ2DAu4Vq7+1UsmzMYnk51l9oMyFHNg
         qLFP8c5fMcYOpHwgmaiK2hgHbg8bSGv4n7NIai6Z5Z4SUf2XA0bu/3jBimjqU4N4sCdC
         6VPjUwRI+46HXjbAlaNbfO2tALvOEPAstJ+7L2pPXSIbBcEWloT4qtt4Y7zpWe/cbSEF
         uAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=y6EGVCM0xwPHWMsN0FWXShKfVGEtj+htzoJ0AMkKmWY=;
        b=FoLQ9dbvVKHwiJt1BlD7xQBMaZ+TBXqV4OLE+tMwNNTXsOF08CGfDC+vVC/DLi6MJS
         EG3s0pqFDbY1VXNb66edFnMdkwx0eptWkVTazHK2A/5UX05LN1Yh/GvDF4yu5q9NdjIv
         QtMbNq81UWyqmrBgQ0gj+oSp7/gnlJWSi0NEoaLZ2RVPNATjrS/49ADd6o24593FUemk
         FFBBEfl8lfEW9toZDFifiLBo2JD4T8EwCw19/aaYV36GyYTtTVfiC4DXV98p0E6MWtpB
         MZ1+v3hl1TPIyjm5icpc8vRRLWOUtJo6zIdPeY3U9JKhqF+nPoRWhu5v3M9HqKqVX3ru
         KPfA==
X-Gm-Message-State: AOAM531TVK7aTrjrB53UXOCvNcn9jY+Id918pi4K5nN/qjG9GVuagTOt
        55bAw0aYejr99aoTfoXjrn02cQyPZnIosRBe
X-Google-Smtp-Source: ABdhPJxhyTy/48mUumtNqzdATgMwVah40HY79Hv1vYrTCs07wzjwky6bx+VvVYs1KE9xrx4WnPj27g==
X-Received: by 2002:a17:903:44c:b0:164:113:a433 with SMTP id iw12-20020a170903044c00b001640113a433mr25197998plb.163.1654544456199;
        Mon, 06 Jun 2022 12:40:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a10-20020a056a001d0a00b0051be2ae1fb5sm6907048pfx.61.2022.06.06.12.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 12:40:55 -0700 (PDT)
Message-ID: <629e5847.1c69fb81.25b56.f2dd@mx.google.com>
Date:   Mon, 06 Jun 2022 12:40:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-06-06-v5.19-rc1
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master igt-gpu-panfrost: 2 runs,
 2 regressions (renesas-devel-2022-06-06-v5.19-rc1)
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

renesas/master igt-gpu-panfrost: 2 runs, 2 regressions (renesas-devel-2022-=
06-06-v5.19-rc1)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =

rk3399-gru-kevin  | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-06-06-v5.19-rc1/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-06-06-v5.19-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      997b2d66ff4e40ef6a5acf76452e8c21104416f7

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  f801b07a60740425604d6563e5dc399375108bc4
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  edb1a467fb622b23b927e28ff603fa43851fea97 =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/629e4f3ef4eea0270ea39be1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-06-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-gpu-pan=
frost-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-06-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-gpu-pan=
frost-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220603.0/armhf/rootfs.cpio.gz =



  * igt-gpu-panfrost.login: https://kernelci.org/test/case/id/629e4f3ef4eea=
0270ea39be2
        new failure (last pass: renesas-devel-2022-05-23-v5.18) =

 =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
rk3399-gru-kevin  | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook | 1          =


  Details:     https://kernelci.org/test/plan/id/629e44d1255c91452fa39bee

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-06-v5.19-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/i=
gt-gpu-panfrost-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-06-v5.19-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/i=
gt-gpu-panfrost-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220603.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/629e44d1255c91452fa39bf5
        new failure (last pass: renesas-devel-2022-05-23-v5.18)

    2022-06-06T18:17:29.521668  IGT-Version: 1.26-gedb1a46 (aarch64) (Linux=
: 5.19.0-rc1 aarch64)<6>[   41.271960] Console: switching to colour dummy d=
evice 80x25
    2022-06-06T18:17:29.521782  =

    2022-06-06T18:17:29.527146  <14>[   41.272058] [IGT] panfrost_submit: e=
xecuting
    2022-06-06T18:17:29.531665  Starting subtest: pan-unhandled-pagefault
    2022-06-06T18:17:29.539217  <14>[   41.285321] [IGT] panfrost_submit: s=
tarting subtest pan-unhandled-pagefault
    2022-06-06T18:17:29.644739  (panfrost_submit:343) CRITICAL: Test assert=
ion failure function __igt_unique____real_main65, file ../tests/panfrost_su=
bmit.c:178:
    2022-06-06T18:17:29.657862  (panfrost_submit:343) CRITICAL: Failed asse=
rtion: syncobj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_=
NSEC), 0, NULL)
    2022-06-06T18:17:29.659742  Stack trace:
    2022-06-06T18:17:29.664171    #0 ../lib/igt_core.c:1819 __igt_fail_asse=
rt()
    2022-06-06T18:17:29.667396    #1 [<unknown>+0xc7b71c78] =

    ... (9 line(s) more)  =

 =20
