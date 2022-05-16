Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6B01528A52
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 May 2022 18:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240209AbiEPQ2q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 May 2022 12:28:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230463AbiEPQ2p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 May 2022 12:28:45 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1C603A720
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 May 2022 09:28:43 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id oe17-20020a17090b395100b001df77d29587so1016583pjb.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 May 2022 09:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=3FyS2kujl9i04oDmQTQi7j+BI/3Q15bqBISmJ1rTdL4=;
        b=v+jCcJjffDI9x85q2UAk4pHUeJdzu4xI5zdrTvHna8KMphSfX4MyPiZf9WoOvnrNNS
         lbB7zmqwI5G252xb7YVe4RqCFJjBXTTcjXE3vurGGaR1uhKVgvBI0yOswSOumtNo9+nz
         T4A4PBRPMRoM7cVwXF9CdfKMNrQw9h/QtGJL7rrT2B6C8/06ln6fJ41AEvtdTolTEmiw
         K3RuqNWRKyg20/uW9OSyDi54oIi5O7q7cxkJhS6cjnHOXFobfK8QVmYdTqPrV2nGt5oo
         u/TNZxZB/YIFjLGHGoJGTS9IghWKQ9iwRuDj1hqeKLDsrY2GrY70D7YXvW9RX0ZS9O7K
         dDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=3FyS2kujl9i04oDmQTQi7j+BI/3Q15bqBISmJ1rTdL4=;
        b=Th/J3fRgIt6wC5qSIs9z4/RtSQz41KLxMdwNZFQy0s+BRIDWJd8IDNtFN+B5CShfVX
         icpFeqR96rmSdE0Ecms8gQdNXZQTZDA4ebm/kYHeAWBt+za8UTqrNXpZO4wIDEbAnI2y
         5pVUnm7AdekPdVvXSNbDwT/yBcmHfvs1VFbzvLiFa06g1ZgDvCcgVIt3OGtuuvk5vr9P
         lh1c9TId2ZIFVKv/WcDR/dvdksNrJq3WFR9pDmvL7vKrdMhGKCxQNGmt0Y0VXTPcLEI8
         CM4MdXrQulWGFVmuJu8W6UXod5aVbTS6Ljkeyg7ZwQgdQljARrxpZws1mvLVFeS3w9+M
         UP+w==
X-Gm-Message-State: AOAM5317tOOzArNcU/4Y24itXqdSLZPb29u49sura2gOdz6SxqYpm/BQ
        rAL7PXNvrETppLxz8k/4heyDLdiHJ81N+adig4s=
X-Google-Smtp-Source: ABdhPJxz0OHVK4p5LdRrLa1jxhKduGN9k0MJEvCTO6HbgcYmk5ObLuqHUZ7+O3xOjWgKxwlMhaegPw==
X-Received: by 2002:a17:902:e84d:b0:15e:b0af:477b with SMTP id t13-20020a170902e84d00b0015eb0af477bmr18057106plg.49.1652718523088;
        Mon, 16 May 2022 09:28:43 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id jg10-20020a17090326ca00b0015eb6d49679sm4509184plb.62.2022.05.16.09.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 09:28:42 -0700 (PDT)
Message-ID: <62827bba.1c69fb81.6d505.a436@mx.google.com>
Date:   Mon, 16 May 2022 09:28:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-05-16-v5.18-rc7
Subject: renesas/master cros-ec: 8 runs,
 1 regressions (renesas-devel-2022-05-16-v5.18-rc7)
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

renesas/master cros-ec: 8 runs, 1 regressions (renesas-devel-2022-05-16-v5.=
18-rc7)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-05-16-v5.18-rc7/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-05-16-v5.18-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f35c24489921b1d4963dbb55053b97fb0e53f471

  Test suite revisions:
    cros-ec-tests
      URL:  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/cros-ec-tests.git
      SHA:  86181a7fbd379fc42314c450740d2cea8cdf04c1 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/62826db07bfcda1a378f5722

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-16-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/c=
ros-ec-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-16-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/c=
ros-ec-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220513.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/62826db07bfcda1a378f57=
23
        new failure (last pass: renesas-devel-2022-05-09-v5.18-rc6) =

 =20
