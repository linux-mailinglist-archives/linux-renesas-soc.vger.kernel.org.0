Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E74354FCDA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jun 2022 20:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234434AbiFQSTi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jun 2022 14:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236803AbiFQSTh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jun 2022 14:19:37 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FB252F027
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jun 2022 11:19:35 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id k5-20020a17090a404500b001e8875e6242so4821352pjg.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jun 2022 11:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=tBGNMOgCzExwaTnIQgd7H/S20Qk3mgroJJQapO+I4fw=;
        b=7kJbolL9f9gje2nvRr/CYiPnDleB8exNFKgljTOjOo7DyJHt74EyX5lh3hMV/1/t/x
         dKyiuqSB5ure9h7XFaN41sxM7pwbPB11GA29nCSAbQQCbBDV3aeaUKRowRDAMAjgJNoq
         ukjk7uFJyAmwyVzE1UOpFZFr7XcvIUuiCjjm/MSciaGMITnCKeUKCJizFgPpau+c92XT
         uxQNMrt3BPS0Gz7F3WPCKHIbFTzIAz3OZTJ74+mYl+nqdWpWITaYWY3wcQOg8ajRIFRU
         nbaF9K0+kCAauBb/Q9im+EjAKoR7gdue0OaXIW287is2ZJw5Kt+zNcQa6uNEWnXijZl+
         dsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=tBGNMOgCzExwaTnIQgd7H/S20Qk3mgroJJQapO+I4fw=;
        b=x7nEroISb2w7YtuI2BsOihfHTOIEQPujRj62FsCZL8H+bXOJPAraHDJG+pcKQH7rJb
         dgsOEHT6IXef95bDuA5fgD7S68jXJnt1o6U0j8+kDvaVmEg1s35e2mdnN+FrYeg0GFF+
         aVJbeEPho5dnURKgqU7CSkSaCWgqWK2ImbFmYQkCVRksPJlNA1GZ7ef/OfbUMLyD2QZ+
         8vAGn4mbwEA/LGq6yLHcenjF7i4KZ9qhwaaWrE5cClWhpb+tu5P5K2MI2jKcL7eDjodE
         YW1sGB8eIXkTKr3MI6xCvotYfu9FZfSh/Kg5GXxewoCWr1mwBNNE+UJdbXNgtnDSTvLb
         sQDQ==
X-Gm-Message-State: AJIora+18MHIW02GuKlyLkQTPQX6mHLHu71vrk5kLawmwAuG2s6pdg4a
        GsJF86ZL6rCvHAxckI72D3dpLhpWJrO/7v8brps=
X-Google-Smtp-Source: AGRyM1u+NBVhV4cjZNYiqNL021ZZCj8+AXOEf/Zz6lZG3S06MftMaqrZk3GCHxzA+ezxoEhsnMreRQ==
X-Received: by 2002:a17:903:1209:b0:168:e42f:8709 with SMTP id l9-20020a170903120900b00168e42f8709mr10755752plh.99.1655489974935;
        Fri, 17 Jun 2022 11:19:34 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b21-20020a170902d89500b0015e8d4eb2cdsm3846302plz.279.2022.06.17.11.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 11:19:34 -0700 (PDT)
Message-ID: <62acc5b6.1c69fb81.88497.5cd2@mx.google.com>
Date:   Fri, 17 Jun 2022 11:19:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-06-17-v5.19-rc1
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next igt-kms-rockchip: 2 runs,
 1 regressions (renesas-next-2022-06-17-v5.19-rc1)
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

renesas/next igt-kms-rockchip: 2 runs, 1 regressions (renesas-next-2022-06-=
17-v5.19-rc1)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-06-17-v5.19-rc1/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-06-17-v5.19-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      64d15244c4805618b3bfc0886094481e9ac91762

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  f83ad09dc04c9f918ee8836bac9d88dac5de6745
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  0189ca288f7188e60f5eda356b190040bf8ec704 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/62acc227a2643b8070a39be3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-kms-rockch=
ip-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-kms-rockch=
ip-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220610.0/armhf/rootfs.cpio.gz =



  * igt-kms-rockchip.login: https://kernelci.org/test/case/id/62acc227a2643=
b8070a39be4
        failing since 10 days (last pass: renesas-next-2022-05-05-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =20
