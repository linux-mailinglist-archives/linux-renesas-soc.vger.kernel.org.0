Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DADF4C53B6
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Feb 2022 05:45:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbiBZEpf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Feb 2022 23:45:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbiBZEpe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Feb 2022 23:45:34 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99A6B2A7B0C
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Feb 2022 20:45:00 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id j10-20020a17090a94ca00b001bc2a9596f6so6628067pjw.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Feb 2022 20:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=HhKihqWFDOOw6DH7CCBXbZgUr89FqLm/R+3JxQm9Mnk=;
        b=4WSfkFx4iYa0unp9p4emObQwOI4urunJ2xf3mMs+y7sFo0lgi4pHpYYB6VasUYYAu+
         05hqxtWxzsD7hoq5urbLwBnEbbz6cMAun0xYwMbwsy24L/AJ6t3SjR7lqsUNHxek0PkI
         kb4tc5y+tZgn+X2pkH1D2UGztEyUBjGYecuDqdXT34zJMo5XQjfAeVqJn/0Jj2MIWjMM
         MWKvGSh9eUW17IeUVuaovXs6A9zbuXs1bskxuE8DjKkf42dCTgUywwY7ieh7hC4+KUtK
         qTF1/BjHhKM6xIDnanT9yOS++rWREF8lQeUJf9taGM7vdEgiXOHXvdTHuOMGpLUwZIU4
         dWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=HhKihqWFDOOw6DH7CCBXbZgUr89FqLm/R+3JxQm9Mnk=;
        b=hA5QNkSFPgRmuIWjwM0P99tTZNsJaMjLqkSQnnd74U+46v4ySPojBMpookdr29Y/5B
         GNfAQlsbtz/OoWUXxl8daYegwgOBbOKBFBbgO7gWz3i6JEg1OpHoLF88HOc/NPNsxfBw
         W6hA7P4lrvRELg01hmyIrZT9aOop+zd9dIib+xDiz/4PuA5C6Xu1Rkrt4+1BZOPWdW2g
         SodqU3CMDg5Koqwwm9+SVpOYkyqKwYiK7KuweZNqRgUMrF9teHfq/8do+cQ1YIOxw6Rr
         VBp7VwZwSkkS3JoDl4rpd+UtqBdYez4uA2BJagWk+f65ItUEiTTs8jDpmyVKmwPu0Z42
         3jdg==
X-Gm-Message-State: AOAM532En2DHzkZ9KzzKVslHQa8lDI+vbFdstPxHgM/DqR/4B3ZXCbKI
        7LpubY4yYd41pkeiElZ/scHihu5lT5gR9ZjOtbI=
X-Google-Smtp-Source: ABdhPJydxin3FJ5rx2AOUJJoFjSGjyFoFoQpLa9rVKlbVnfs+F8rIRhXVUiMr4UlnywLcI32Vgjrpw==
X-Received: by 2002:a17:903:8b:b0:14f:c971:527c with SMTP id o11-20020a170903008b00b0014fc971527cmr10602526pld.0.1645850699919;
        Fri, 25 Feb 2022 20:44:59 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u15-20020a056a00124f00b004f12b8c81ccsm4934562pfi.75.2022.02.25.20.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 20:44:59 -0800 (PST)
Message-ID: <6219b04b.1c69fb81.7c70f.e3f5@mx.google.com>
Date:   Fri, 25 Feb 2022 20:44:59 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-02-25-v5.17-rc5
Subject: renesas/master baseline: 253 runs,
 1 regressions (renesas-devel-2022-02-25-v5.17-rc5)
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

renesas/master baseline: 253 runs, 1 regressions (renesas-devel-2022-02-25-=
v5.17-rc5)

Regressions Summary
-------------------

platform        | arch | lab           | compiler | defconfig              =
      | regressions
----------------+------+---------------+----------+------------------------=
------+------------
bcm2836-rpi-2-b | arm  | lab-collabora | gcc-10   | multi_v7_defc...MB2_KER=
NEL=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-02-25-v5.17-rc5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-02-25-v5.17-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      33f7c4e932578eddccd9218b72990a1ef248eb07 =



Test Regressions
---------------- =



platform        | arch | lab           | compiler | defconfig              =
      | regressions
----------------+------+---------------+----------+------------------------=
------+------------
bcm2836-rpi-2-b | arm  | lab-collabora | gcc-10   | multi_v7_defc...MB2_KER=
NEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62198315ce10f2231dc629b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-25-v5.17-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-25-v5.17-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62198315ce10f2231dc62=
9b9
        failing since 102 days (last pass: renesas-devel-2021-11-02-v5.15, =
first fail: renesas-devel-2021-11-15-v5.16-rc1) =

 =20
