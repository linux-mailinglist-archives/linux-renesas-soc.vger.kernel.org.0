Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3AB16D0F44
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Mar 2023 21:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbjC3TsP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Mar 2023 15:48:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230506AbjC3TsN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Mar 2023 15:48:13 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A87381722
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Mar 2023 12:48:11 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 185so891139pgc.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Mar 2023 12:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1680205691;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5bTWXyk5Q4NNWxwzO9QuxglEiFf7V14dNhGEXXyONW0=;
        b=06dCvQJLQx6d07+34Oe6Dd9iBwkBKPmVCbeLNhEKeAK4gAhX5MKh/WIp6rjMk2Luae
         5gYOEcGlUlEC/oNbnHzSqhdIC7khLH73t/f8aiTmdU04sAUZrlccXKw2uhlGPUoRdstu
         DzmSrHQ8qp5tcBP2+AxC8Q+0ygDcz9VLYALmMvHtQ3sthtJGAHB0N03iwWU+ynVNAl3Z
         e5fWeax4wdEdKv+IAeOC2QpRv11f750rbMiD9eMex1jCr20GLYJlB3as9A/I9fFNgJy9
         XA6+HTakPOA8CF41znXvilnv4r0LGQ2CvOw4dXopNVoLcQZiK+eh8ht2YkqAyQodyhNx
         Z62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680205691;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5bTWXyk5Q4NNWxwzO9QuxglEiFf7V14dNhGEXXyONW0=;
        b=y5crQeSZy96guvHfMhTserrlY4bp5Saa0Yxh8b46U4rBzhPw1oF4dDbjyovfWky/O5
         Z8dbyfF/y+H4RxhJuw6AlgPcDOGWX7SufglEoc1EUmKN0p02Z17IOG/F1vijJVupANVn
         4yaVv4DfO2kqJbysZZBD9cxdSTy+H97jJ5tIFerRZAHBzyII3RDC22YNHm3YcWDbbOtB
         HbLoGPfexVWYpxfmZPBQiHjwIlVMnN0aVbhR9fzbDNTKrXGsWIwOyjZfyGv6WaIqCow5
         6PaQu1ULM+hJ3sSG0jpmnGBRpczx0QZD/jTEmVS2/Ncv9o0835tqs0QGXVyfQ9LTORbb
         KVaQ==
X-Gm-Message-State: AAQBX9e9V7QRXWmZs9Egxp8kSubamDW1tEbQdRIj1uCJY7C1D7ZaNzQV
        nU9l3a2VUvb1OaAiH9nQzhnKKCZx2qtCbpsgLm8=
X-Google-Smtp-Source: AK7set9PKZKGyAqCf4OTWRpJma6eI5OsdyyNFnTdzLVA2ZaSQGXFdpgEIO8pxvUPh7azAGuCC09v7g==
X-Received: by 2002:a62:1b05:0:b0:62a:87ce:14ca with SMTP id b5-20020a621b05000000b0062a87ce14camr21996149pfb.32.1680205690894;
        Thu, 30 Mar 2023 12:48:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s13-20020a056a0008cd00b005a91d570972sm174383pfu.41.2023.03.30.12.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 12:48:10 -0700 (PDT)
Message-ID: <6425e77a.050a0220.a6885.0c0c@mx.google.com>
Date:   Thu, 30 Mar 2023 12:48:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2023-03-30-v6.3-rc1
Subject: renesas/next cros-ec: 10 runs,
 1 regressions (renesas-next-2023-03-30-v6.3-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,TVD_SPACE_RATIO
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next cros-ec: 10 runs, 1 regressions (renesas-next-2023-03-30-v6.3-=
rc1)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
mt8192-asurada-spherion-r0 | arm64 | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-03-30-v6.3-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-03-30-v6.3-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2fd5359030e85226294411286259035a9a915ae8

  Test suite revisions:
    cros-ec-tests
      URL:  https://github.com/kernelci/cros-ec-tests.git
      SHA:  f6c0dbf63842d5751000c5527808aca38354db55 =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
mt8192-asurada-spherion-r0 | arm64 | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6425d4a2550805f46462f777

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-30-v6.3-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230324.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/6425d4a2550805f46462f7=
78
        new failure (last pass: renesas-next-2023-03-16-v6.3-rc1) =

 =20
