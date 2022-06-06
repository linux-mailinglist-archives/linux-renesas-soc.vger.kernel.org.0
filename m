Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA2F753EEC1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jun 2022 21:41:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbiFFTlD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Jun 2022 15:41:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232602AbiFFTlA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Jun 2022 15:41:00 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E79746B095
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jun 2022 12:40:58 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id gd1so13656719pjb.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jun 2022 12:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=/AFt/hB4jfAWwBLDkOgcTwYLI88aFN5UAuTpziZJ3yM=;
        b=5sO10HG1hCT7/uajz8pnlaC4Z7SJ74aCrkj1C4ERc2I4WWAdMDAtzYWubmrDS1ghc+
         e8GhsKf1w3FrKSpwIs8fqFnJ1C4ld4lVcIgEhmkKvv9iFgFgEmO9eNErxqQBPO13ymZh
         isaM0dFUHDYl/tUGn2QmPivx9929E+jzzycRR9sSh3Lr3dbkIXR2LUbJQhYxdqq1wh9J
         ez5UjmlS1YKTdYy+mJOvWfXIqtWiRwiAqrCrkJ7zXObfOA1oRYnwuOehKbHi0vOkmPJN
         u+GP9nWZEWVGTH7OmajD1ZUQfQiWzpuw0osCuTJhi3vYy0nWKxgt77WpWGSCCxHcILHq
         QubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=/AFt/hB4jfAWwBLDkOgcTwYLI88aFN5UAuTpziZJ3yM=;
        b=6NY34iFW/33EutK2mFhCsk2DScvlKPs/ZaFCBGfZhRaFzmSq2J9Hc4zuohLe7HULTI
         3yn4XzD+I3/D0qV8+egbaztEqaiO2327gHRAVmtUsmEOHANimYSxUdbRcAZWdm4NfOhh
         /Ao2qv31wp2+mmzm948IMyFX03XJSUOEoiNYtL2NDIK6LulTgh/xUxJqU/aOsuZ/vrsx
         X8n1BFGP/weGpcPi6IiTvd/lQFg2s9ke63ABK4GjpFl9D+boeKeRv2Xm2p/3i7yUrJRi
         6oEka4qh4e8py6Ip0G1CyOWZVvMSp5POnH9Lu6x3wlc+q0a67wVA7mNqP9RHcIzv1vqU
         DXqQ==
X-Gm-Message-State: AOAM533+ifPpmq6FrpAlqr5+EWV4OpNnNPnsG1FaK8Z0GFSNAnF2wtOl
        AeE37AUu5scI3Fy83Xio45GqTwMeRIpOwxjo
X-Google-Smtp-Source: ABdhPJzwYBEIlpq+J0gpvbZSAfTa/51yZQBxcM9ZzjF2tDUedslUpCrkI+WQcdqTmq0DMhkItMiGww==
X-Received: by 2002:a17:90a:1c02:b0:1e0:df7:31f2 with SMTP id s2-20020a17090a1c0200b001e00df731f2mr64149136pjs.222.1654544458084;
        Mon, 06 Jun 2022 12:40:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id bg13-20020a17090b0d8d00b001e08461ceaesm12956511pjb.37.2022.06.06.12.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 12:40:56 -0700 (PDT)
Message-ID: <629e5848.1c69fb81.b0983.e8a1@mx.google.com>
Date:   Mon, 06 Jun 2022 12:40:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-06-06-v5.19-rc1
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master igt-kms-rockchip: 2 runs,
 1 regressions (renesas-devel-2022-06-06-v5.19-rc1)
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

renesas/master igt-kms-rockchip: 2 runs, 1 regressions (renesas-devel-2022-=
06-06-v5.19-rc1)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-06-06-v5.19-rc1/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
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



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/629e4b45c13887beb8a39bec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-06-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-kms-roc=
kchip-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-06-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-kms-roc=
kchip-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220603.0/armhf/rootfs.cpio.gz =



  * igt-kms-rockchip.login: https://kernelci.org/test/case/id/629e4b45c1388=
7beb8a39bed
        new failure (last pass: renesas-devel-2022-05-23-v5.18) =

 =20
