Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB1259D0CA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Aug 2022 07:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240352AbiHWFvn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Aug 2022 01:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240350AbiHWFvb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Aug 2022 01:51:31 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EDC15F11D
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2022 22:51:14 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id f17so6329474pfk.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2022 22:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=KfL32Iif3cvA91W2G4stx6NtsZEQlQmQKKcZM5NoGR0=;
        b=zeudOUfe3B8DAaKhjnlghA3luvp+WcWR6QD90V/I+l8auCogJZag4YMs7Q5LiPsefz
         SzYr6jpUMX0y7CMungieyVWNKHgtlL4/z+JaEE66dMKOt8uNoj/xdWCp1Xq0VQC6t9Eg
         kNu6OVMW+XGMo8VRqnM8/RsuCdtg2phNG1taw2lG1JbFwFAivc+dxz4JZm0xZ5evSY56
         ZrYMgSbTuc/qs4P5D2c1GzBXTZ79ApVQBIEVVC+KVAfrKognrI8oSZ9qxSz24tuJj2lc
         6TE+RrsgcdsU8bVlSD9xxdZxvVMclTtNm8hoYZwCcUGC0l2nvehUWK9kxRM0Lhq8Hq07
         0ISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=KfL32Iif3cvA91W2G4stx6NtsZEQlQmQKKcZM5NoGR0=;
        b=BrUoIC7O/7ZEgJ8F3HSq72udClHlZ9liHNqQ+MTWoJ0JQtOEzGpRXFufi0C5McSC1N
         2UNgj3mLU6w6uvwqszSFod8TtWY2PtKDFJGAFHAbJAdsU60ZxzDPPdFnFNv6JL+lBlxu
         81YA5Li8SjvN5tEqTSM01/o+e+An/6Qpgk7nb07T0voB/M0X8DPQqh0qo/dNQfdJxdQt
         5HgqLC/8B50/HNHOhj3fgnLHoybjzsLTl+/aBhXhFBr/fq2VN6EHgRsa/J3ysz27HYah
         aDeouD3X5AZ9PcxR5oQ74qkez+yQnwUXVIzO1YOUdHrHIPtB+EB+HMHJ8U8/y4VhXyme
         2q5Q==
X-Gm-Message-State: ACgBeo3E8YWGJ2kpcCizqxeACZvW4SRTTAUuoAgNnHFY4Y+jvZQummWj
        sgl+B8taxKLQkOk8BkQF8zVErwYMlpEJIYtR
X-Google-Smtp-Source: AA6agR7PaSYf353/FIM+g/LvL/1lsxzz7iOJgiDgfDGDXynTFK7rmuSE8gxLmPgYEh471B0O//DjFQ==
X-Received: by 2002:a05:6a00:139d:b0:536:50f0:d295 with SMTP id t29-20020a056a00139d00b0053650f0d295mr13845154pfg.8.1661233873501;
        Mon, 22 Aug 2022 22:51:13 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n12-20020a170902e54c00b0016d773aae60sm9519356plf.19.2022.08.22.22.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 22:51:13 -0700 (PDT)
Message-ID: <63046ad1.170a0220.ab5af.12af@mx.google.com>
Date:   Mon, 22 Aug 2022 22:51:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-08-22-v6.0-rc2
Subject: renesas/master ltp-ipc: 9 runs,
 1 regressions (renesas-devel-2022-08-22-v6.0-rc2)
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

renesas/master ltp-ipc: 9 runs, 1 regressions (renesas-devel-2022-08-22-v6.=
0-rc2)

Regressions Summary
-------------------

platform         | arch | lab     | compiler | defconfig              | reg=
ressions
-----------------+------+---------+----------+------------------------+----=
--------
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig+ima | 1  =
        =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-08-22-v6.0-rc2/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-08-22-v6.0-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      0b923c18404277346b012fab71a5bf981e8ad927

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  bccfa7395fce4accfd30cbf7196c0a6e8db37728 =



Test Regressions
---------------- =



platform         | arch | lab     | compiler | defconfig              | reg=
ressions
-----------------+------+---------+----------+------------------------+----=
--------
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig+ima | 1  =
        =


  Details:     https://kernelci.org/test/plan/id/630468ce675c8f9b3735566f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm/multi_v7_defconfig+ima/gcc-10/lab-cip/ltp-ipc-beagle=
bone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm/multi_v7_defconfig+ima/gcc-10/lab-cip/ltp-ipc-beagle=
bone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20220812.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/630468ce675c8f9b373556=
70
        new failure (last pass: renesas-devel-2022-08-11-v5.19) =

 =20
