Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB9B9566A2F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jul 2022 13:51:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232519AbiGELv5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jul 2022 07:51:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232527AbiGELv4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jul 2022 07:51:56 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9661F17A85
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Jul 2022 04:51:55 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id z1so4994947plb.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Jul 2022 04:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=psyDrVPPHtdxgGFVkD5Kmf7iCTUoWZ8sNcBeyRbtCeU=;
        b=72IiB9IDjPy4R5fPssJPKat7EAaf3ac9fnm9WQyzYU0R8CptmzrpJmoaDenImFAmjd
         TCJGivLy0Bi+hx1u3JD40d6elLec5BDpxgNfxbC6lpmqC32h2r+YnGABaaLoSWeV4MYv
         IC7qL48A0L225j4y+G1n1NgLtxK/R5+k9sms0ZE85RYaBNC8dy/YJWU6ge9OH8JPxC49
         hcK/+0ky0Jt9eH2KVFFOBAUgxlZHpCrkbBSvXenYFWQPj8w57jKRqLlICN/BsK9Mk0Tw
         RDzUfS/g46hfFG2EQ7ybTsnbfXDdcSqbnt5NJphU08CnZNhhcVLWKZlCKxYSN25hPQEq
         MZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=psyDrVPPHtdxgGFVkD5Kmf7iCTUoWZ8sNcBeyRbtCeU=;
        b=UyEvdUKykKUcdq7yV1pNd1neM9fmUHX6Hfu2hDC1rjufRu3IGI9vxSNUGaBq/vDLIr
         TdaKnZnUn1Ev03ZSrf/ojtl0F4mcGNg6CKjx7j+ut9bwkmU3LYjyhxsDVtQqcGmY268l
         9CClfRO+fV6DAJ/iQx5bEo7O9kudLaQZjDLpcxOoABwlk8e2Y0+KCK6fzljS8dEbWKzl
         /mWyLgMFItyqO8qD1+jBSv9l8hxC+aJbMXi5UtO9FkQM8ia80vg0Ei5123DrEUyDfZ9y
         UmvgfmwhV6ykdnzjDaeYBMydv4PliWtFjxEHkFVtpZENVGIFaiYQWycEDuJcOfF7fz52
         daCw==
X-Gm-Message-State: AJIora/GhRBsHRGRXgyLtVhSLlZzd70Uk9Cyxy3HhtIE0dDm+j9vVjn0
        Sp8qHtPz5LunkBYanAjmMc4fG0QMKEnIzg==
X-Google-Smtp-Source: AGRyM1uNe3AhsWpJ+UWo+ft2kw/2jSomccv4KFglm9KSJNzTKlJUAGaUI4p91tETBfxV140pB+bxHQ==
X-Received: by 2002:a17:902:b7c4:b0:16b:e3d0:c0fe with SMTP id v4-20020a170902b7c400b0016be3d0c0femr10391923plz.98.1657021914822;
        Tue, 05 Jul 2022 04:51:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h10-20020a17090a604a00b001ec9dce6f10sm12276952pjm.38.2022.07.05.04.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 04:51:54 -0700 (PDT)
Message-ID: <62c425da.1c69fb81.f4d0b.1505@mx.google.com>
Date:   Tue, 05 Jul 2022 04:51:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-07-05-v5.19-rc1
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next igt-kms-rockchip: 2 runs,
 1 regressions (renesas-next-2022-07-05-v5.19-rc1)
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

renesas/next igt-kms-rockchip: 2 runs, 1 regressions (renesas-next-2022-07-=
05-v5.19-rc1)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-07-05-v5.19-rc1/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-07-05-v5.19-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b7d295b5ef2e2985496b2a3b9c4594189db6bbb0

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


  Details:     https://kernelci.org/test/plan/id/62c423b9858db88a67a39bcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-05-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-kms-rockch=
ip-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-05-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-kms-rockch=
ip-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220624.0/armhf/rootfs.cpio.gz =



  * igt-kms-rockchip.login: https://kernelci.org/test/case/id/62c423b9858db=
88a67a39bd0
        failing since 27 days (last pass: renesas-next-2022-05-05-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =20
