Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C47B5609F3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jun 2022 21:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbiF2TGw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jun 2022 15:06:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbiF2TGv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 15:06:51 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB57A201A7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 12:06:50 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id jh14so14974621plb.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 12:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=p3HwZ0byqZP7F3C6QpE1OpoI1+KmPgSikgt4N/18biA=;
        b=bDMUN4PTZdT9Naer4n+PUCulJ21ZfCRhrtapB4cJfHE2iUhRITlVBCWivOx1DLoPjF
         ejfoVBVeH2o62DcN6ovdGwnBqTUs9pJMVR876MbBM5HUlsctZlZGPms0HenlBSAtXD1o
         G1XP1TPAtKAwHNQw4qePVSk+DIxrnMJ2sK6ODPhSd0g/srqc4GU8Cq1b26M9eWzx9Qzz
         vsgL8I8h7L7kAh20W/w7FmE97/aqaYX0slePw1AN1tVjoEfrU857yr1y8/PUUZNbnLCS
         qUfgzwuyKtrmUx9Ov94OcuAQflbY/4ytgbt9T21nmRCYz7mA2DsAu1Mh/wy+Mrm3j8eB
         cFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=p3HwZ0byqZP7F3C6QpE1OpoI1+KmPgSikgt4N/18biA=;
        b=4LkEkvgjA7z3z8sYqo79+L+0QMB4+Hgm7kvoByNluDDfT3LDyvgSOIPfSFs/aZSVFs
         xGOVji7G2oPpRwHI5tHveZxQYaNZh9mBdvpqlf8NSa9gQFTb9EZcScM6EIEFT5extKA1
         oJzN0xgyQqYLnmERlJt8q0u3Tilg0C3+xOloHyfdLKyG97O8W1LERvS/emcs2RNmJvB0
         k45RgYvIhboC/6wmubJ6C1f3lHpjy+MRNLSlwspZ5msK1ZIlb25NNpoHeDxozteyDvRR
         UH402aJYpSx4fBgfTZJ3koNe5Vv07z5AkKyxGUYtw0hoc0hTGzXRu8aNQGhrBeKSSgdP
         yesw==
X-Gm-Message-State: AJIora8zl6RXx1HRufi9snr9kygfcl4mgFWwykxof4Lctxod2NcDK2u3
        3vdbZvCDH7b8+gfTw3ra7TPOYiBT2Jbnkobr0Pk=
X-Google-Smtp-Source: AGRyM1sKmSeLd9n99chJ5Q64Sah0X/OVZugY1/SLdszCzC6U2cS11BgU/z8A0bLyqWp/TCTZDanFVg==
X-Received: by 2002:a17:903:1c7:b0:16a:2844:8c1f with SMTP id e7-20020a17090301c700b0016a28448c1fmr10639995plh.30.1656529610215;
        Wed, 29 Jun 2022 12:06:50 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m9-20020a63fd49000000b00408c592db61sm11671755pgj.71.2022.06.29.12.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 12:06:48 -0700 (PDT)
Message-ID: <62bca2c8.1c69fb81.a50e9.0824@mx.google.com>
Date:   Wed, 29 Jun 2022 12:06:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-06-29-v5.19-rc4
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master igt-gpu-panfrost: 2 runs,
 1 regressions (renesas-devel-2022-06-29-v5.19-rc4)
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

renesas/master igt-gpu-panfrost: 2 runs, 1 regressions (renesas-devel-2022-=
06-29-v5.19-rc4)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-06-29-v5.19-rc4/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-06-29-v5.19-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      33401641a5eb2a82fb3eeeb71752594b1d8016bc

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


  Details:     https://kernelci.org/test/plan/id/62bc95bbf2c30c0379a39bdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-29-v5.19-rc4/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-gpu-pan=
frost-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-29-v5.19-rc4/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-gpu-pan=
frost-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220624.0/armhf/rootfs.cpio.gz =



  * igt-gpu-panfrost.login: https://kernelci.org/test/case/id/62bc95bbf2c30=
c0379a39bdd
        failing since 22 days (last pass: renesas-devel-2022-05-23-v5.18, f=
irst fail: renesas-devel-2022-06-06-v5.19-rc1) =

 =20
