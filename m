Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C474566985
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jul 2022 13:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbiGELd0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jul 2022 07:33:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbiGELdX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jul 2022 07:33:23 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0A4E326
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Jul 2022 04:33:21 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id f12so1484920pfk.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Jul 2022 04:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=lPALLguPQoqjy4QNdqRsGlP2qW7N++pax+VAvkhGw1I=;
        b=dcY+FP8QcJyc6MjZAXtP7PmoOzpS4VLxf2DKjyAnuvI+Yx76KSs95lCmRZqxrIWsGN
         IVj/x9s7eAYOXGioNq6hFNzR/AB0WPheuGFm6TFr0FTd5HFyRWnYT638x2+btO+xkjp4
         z0cFPC8Qll5zvgOQj7JheKXzFfkKKRdfze3dfXUqD4q9nqXz3MB7mCLLHf/Tq9HA92zC
         h40FE/ggE1ydgsz6/IHKrx0mAZ/bddSpITaJf8o7+uda1h8+VgRE/jpwi6WJmA7Fc+ct
         zBZ8OLh6ITpoUlAU2HzBTgu71Fro3DDsYG0ZJMSK1+0GUpWnwbMOUYkfsCuzFMlnMhCC
         Fg3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=lPALLguPQoqjy4QNdqRsGlP2qW7N++pax+VAvkhGw1I=;
        b=oue/F1sumI1WPOg7KRY7WgdysxXoj6awJtP7VJq/0eg0l2kFQVjq+TZ2x5E/1so2aC
         0Cmwa93dN4sJt3/++DttEz471FgTdUCbk0W5IIQok87MH5uZBdg7JMG7UZKYFrUMAmy+
         TF8K214IhDxJCRkv9PW63whr9o9eZQbAeSqdSIk0eF+hLkDzKVdGZ4gue4YhhZsl5McZ
         YGXT/zungZ9M5eDUekkoxUT+EVLUC3zJ/Y9qmId/IeGPYikOfy7+yu9Hgn+YgHvORo5T
         w2YBe1219j0NQMH+CNpH5k4fYMhGS3UyjKBZ/zhiJnhi0TK1z94uGqkc7imaNn08IiEu
         mV/g==
X-Gm-Message-State: AJIora8y8fQPi0fAnyQWWuqJpztfS1zNuzxbSgNF2o5uG6wHsmVX0khu
        MElBbEx3iS3Lb3qCfArcE9729lGIIxvqgbhg
X-Google-Smtp-Source: AGRyM1tqHo9c8Ul7ZAh9iqZgUIGZ6AEFqXBDAnKsgDnF2FEZoSAbwZp+j6LVeQAVQmgkXCUUNnBnhQ==
X-Received: by 2002:a05:6a00:15d2:b0:525:79c8:d4cb with SMTP id o18-20020a056a0015d200b0052579c8d4cbmr40041420pfu.23.1657020801289;
        Tue, 05 Jul 2022 04:33:21 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n12-20020a654ccc000000b0041175e3ad46sm12628442pgt.32.2022.07.05.04.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 04:32:59 -0700 (PDT)
Message-ID: <62c4216b.1c69fb81.57906.2144@mx.google.com>
Date:   Tue, 05 Jul 2022 04:32:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-07-05-v5.19-rc5
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master igt-gpu-panfrost: 1 runs,
 1 regressions (renesas-devel-2022-07-05-v5.19-rc5)
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
07-05-v5.19-rc5)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-07-05-v5.19-rc5/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-07-05-v5.19-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b83d3c70c208b5154097ddfcf4be9a802b12966e

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  f7828dc180ba3427b5e405fab25e9846c07322bc
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  02153f109bd422d93cfce7f5aa9d7b0e22fab13c =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/62c40fdce78000cb7ba39bce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-gpu-pan=
frost-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-gpu-pan=
frost-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220624.0/armhf/rootfs.cpio.gz =



  * igt-gpu-panfrost.login: https://kernelci.org/test/case/id/62c40fdce7800=
0cb7ba39bcf
        new failure (last pass: renesas-devel-2022-07-04-v5.19-rc5) =

 =20
