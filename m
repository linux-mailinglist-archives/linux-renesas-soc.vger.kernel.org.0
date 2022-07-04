Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 984D9565686
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Jul 2022 15:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234129AbiGDNHH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Jul 2022 09:07:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234610AbiGDNHD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Jul 2022 09:07:03 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4BC5DF95
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Jul 2022 06:06:42 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id s27so8879744pga.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Jul 2022 06:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Bbsagg6muK+R3fzekU/EHEYABTeY8iNhwenkN2v9gIM=;
        b=iq4+3iq7aGNH/OYYctZFIuBj2ElGy9aVXNKKCYqRKzIxGo/0NWw0guwf5Tr3Svy9iw
         2NZBQ30bCL2qbnzGs5M1YMhawHvb900rz9YDAOHZIF9p1JAl2Ai56AxusHQxOJhg3yrQ
         BiKeJqywgiiYH00d2Q736PCjdFlM/0K5wAhBfGcL4xkfEh9n5uk7se6sVAPFdtPqzerz
         SC/jEVNBJDcTr9aCvQkXHFpFjtXJvjRgfgooc8jeCTZw58jALNdD2eCYMeUI13T/c6c6
         fcNaCasz8gisoNtBd1pKmlAtg9pwD/fNeNz4384mBSnzDvW5nfY2uXOsLlNfcnprLEaz
         HXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Bbsagg6muK+R3fzekU/EHEYABTeY8iNhwenkN2v9gIM=;
        b=RH1dG6l0Fdt0U6r4OgANeynq9ZkQoa4g03tihoejQTqLyWuvLam5qFH5vVzJLyOZ66
         hY8KrnbpNA+pfACf5SeSPJbKBfhlfO1rinijIznLQ1iuDCVtcLS2X1pVdTdJfIjGPGbQ
         5TDA9NZJf+eG3O8crcdv4cgxnaPPGBNcstDu5wlQKK0PNF2qwj0hjwdKmus2Keb8ZB1R
         1FhKA0KnK4ru8/1tJI4P0WOY7BuubSXeSxK1fsJ0a965ATr0KDkegcJdSSgjfc6Xn+sz
         QXY0Ua+bV200Zp1HTvMhXQdftqUGHkJFd3KSasB19rt/QQwE2BtC4EgNDGzoHH3/zcOs
         YWDw==
X-Gm-Message-State: AJIora8dDa45K+dN202n4o9gWtmxFFnIUz9PutcUO9Mz0EFJdSHQsJEG
        LsSIyVLeIIaZ/oYV+QpFAZZWlWKHXcGk2Z7F
X-Google-Smtp-Source: AGRyM1veCLhH93YSdGo+INVnzguVeo/68rJJWEsbJylnqShw+JLJIbA6ZrWb5Yy2glKHdG5qJzxjTA==
X-Received: by 2002:aa7:9a4e:0:b0:527:c943:54d9 with SMTP id x14-20020aa79a4e000000b00527c94354d9mr34805322pfj.31.1656940002006;
        Mon, 04 Jul 2022 06:06:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902dc8100b00163c6ac211fsm21142437pld.111.2022.07.04.06.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 06:06:41 -0700 (PDT)
Message-ID: <62c2e5e1.1c69fb81.27b27.e26e@mx.google.com>
Date:   Mon, 04 Jul 2022 06:06:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-07-04-v5.19-rc5
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master v4l2-compliance on uvcvideo: 2 runs,
 1 regressions (renesas-devel-2022-07-04-v5.19-rc5)
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

renesas/master v4l2-compliance on uvcvideo: 2 runs, 1 regressions (renesas-=
devel-2022-07-04-v5.19-rc5)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-07-04-v5.19-rc5/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-07-04-v5.19-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      53f4b75e60cf6c4bedcc6638ff37f56eab20dc19

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  ef8c5223b4a5b2610e0dfbdff5257cf96c124f96 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/62c2d6a2219f27ed3ea39bd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v=
4l2-compliance-uvc-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v=
4l2-compliance-uvc-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-v4=
l2/20220624.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.login: https://kernelci.org/test/case/id/62c2d6a221=
9f27ed3ea39bd9
        failing since 4 days (last pass: renesas-devel-2022-06-20-v5.19-rc3=
, first fail: renesas-devel-2022-06-29-v5.19-rc4) =

 =20
