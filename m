Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC863624BFC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Nov 2022 21:36:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231958AbiKJUgc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Nov 2022 15:36:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232115AbiKJUgQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Nov 2022 15:36:16 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DB5E45A1D
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Nov 2022 12:35:57 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id q1-20020a17090a750100b002139ec1e999so2899801pjk.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Nov 2022 12:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ocl+JTHj0ecDGsS9LjttjlQWp+5buwAm4EocpEkH+0g=;
        b=nAmpO/wCuWyfaMMVOrRr01ztMAHr6xQYxfg9+vvAaQrehaMzdkDIJQa3CooMX76DDg
         ZKGMe942NT3IF5NGOXRU2DZbmiGiXHn7AK8XuXmBMIfD+vzWHu7Hz1bBXibJfAz+3d2u
         M5ZPjmWDHnUutnoCcOObfUs2r832/xSN+gz2espfI9eTlxUe/HNmHd+2U3ITcybGy/82
         2p3E3M5JEtpdryxhODwksSORkqTkP3jMCR+skxm4g2BSD/sKNb1X6tdMreAD5rdFxnwA
         6IX3wr+G+vyP7ZQPgZdduYX/6CtaisWEnZMbbIWtgzIuab96ajy2qrjDAAXSbSWUx9cC
         334g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ocl+JTHj0ecDGsS9LjttjlQWp+5buwAm4EocpEkH+0g=;
        b=Q955YUUC1CnqO+oql2l+wEf3NVS0KOBNan6D6XiFqpL6EDqh8imTGNxxpC/WT8qvhX
         JdDylercqa8+kS6oTZE3P3O9+uxDnJedadY69JqKlvORWxjscsmbnEPpM3rl+s3Ol5YP
         0fshoWWEQPoelhzaIAtvpPr1Ct+Rd/JduYPFQOPbrhVuKWgo2BwnKivfAWlcCRSR/rnn
         w7shuy+5AgH9Frv7rZPtpmUSHNOR/NvecQwub1axXH6iiJiN5aSCNVRNnprdBgUBa5RG
         JSE848CHv5troNpbAQLUEPf4j7McZaQpgsNn29jZftjB/hxZKU8qfPoZAlXUMs8LO1Vi
         hO3A==
X-Gm-Message-State: ACrzQf3Y7eleoshcP5jmLzSnv/fPmhbOuf2OoWyAAWqYhOTQRyt1M8Lm
        3CzBh2BEEBtEJqe1/Po/w8O3uBZwNkb/rw+o5+I=
X-Google-Smtp-Source: AMsMyM6wIGh8KWugNHH9S3VBipgbFWsI6b6MVt0k+UZhaNuOkyA1XlKjyKaCT1d4lLQERMrPf4OqUg==
X-Received: by 2002:a17:90b:4b4d:b0:213:193a:dc84 with SMTP id mi13-20020a17090b4b4d00b00213193adc84mr2006095pjb.2.1668112557022;
        Thu, 10 Nov 2022 12:35:57 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l12-20020a170903244c00b0017f592a7eccsm75575pls.298.2022.11.10.12.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 12:35:56 -0800 (PST)
Message-ID: <636d60ac.170a0220.aef11.02f6@mx.google.com>
Date:   Thu, 10 Nov 2022 12:35:56 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-11-10-v6.1-rc4
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master igt-gpu-panfrost: 1 runs,
 1 regressions (renesas-devel-2022-11-10-v6.1-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-gpu-panfrost: 1 runs, 1 regressions (renesas-devel-2022-=
11-10-v6.1-rc4)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-11-10-v6.1-rc4/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-11-10-v6.1-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      35f5248b8c44355d69637ca0ae3fc3fbfc8aa2d0

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  82b2b1e8987c182d14fcaf5a3a3b8ee1b4d5e1df
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  9eff5fba09403bf1df3a1edd655b66fa1b60de2e =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/636d4fe6505a750076e7db5a

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-gpu-panfrost-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-gpu-panfrost-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20221024.1/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/636d4fe6505a750076e7db5d
        failing since 9 days (last pass: renesas-devel-2022-10-28-v6.1-rc2,=
 first fail: renesas-devel-2022-11-01-v6.1-rc3)

    2022-11-10T19:24:17.117859  =

    2022-11-10T19:24:17.185756  <6>[   34.973587] Console: switching to col=
our dummy device 80x25
    2022-11-10T19:24:17.191771  <14>[   34.980711] [IGT] panfrost_submit: e=
xecuting
    2022-11-10T19:24:17.198033  IGT-Version: 1.26-g9eff5fb (aarch64) (Linux=
: 6.1.0-rc4 aarch64)
    2022-11-10T19:24:17.206726  <14>[   34.987909] [IGT] panfrost_submit: s=
tarting subtest pan-unhandled-pagefault
    2022-11-10T19:24:17.207212  =

    2022-11-10T19:24:17.210931  Starting subtest: pan-unhandled-pagefault
    2022-11-10T19:24:17.329251  (panfrost_submit:347) CRITICAL: Test assert=
ion failure function __igt_unique____real_main65, file ../tests/panfrost_su=
bmit.c:178<14>[   35.114568] [IGT] panfrost_submit: exiting, ret=3D98
    2022-11-10T19:24:17.329825  :
    2022-11-10T19:24:17.342953  (panfrost_submit:347) CRITICAL: Failed asse=
rtion: syncobj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_=
NSEC), 0, NULL) =

    ... (24 line(s) more)  =

 =20
