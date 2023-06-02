Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B57672055C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Jun 2023 17:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236320AbjFBPHJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Jun 2023 11:07:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236232AbjFBPHI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Jun 2023 11:07:08 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C7141BF
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Jun 2023 08:07:06 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-652d1d3e040so609288b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Jun 2023 08:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1685718425; x=1688310425;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gkMcbSyyvkQgUfWRK2HV2j2NljFUdsZcuD6NJI/zWvA=;
        b=ZKWwAeBNlixLx21zYbpXKjDVFdyX5ri10KstX07FzCeDahOsipVvajvDZwlfkQWI3x
         ykhcqUxyHLVZCpLFl5dYa0FA35V0fAX6jeiEuebAmz8lQR+la4RsMpFBkXT7fSKOYcnH
         W+uAjzVdrd3CTClaJxnCsN7UULLt6WVh2rLkyQg3TcaESShR7fBhzb/5ohbJTZpmmXnU
         Q6U9zKXhgd0RkBNCRwtj7EIaTGCmtPrxJZYalY8jpehG7wwGjeMyZan1ei/lDpUQZ/+w
         hpjOpthgsOUzN/5subgsmKApxA6m3J0S1s3bwFQGGl1qTOG0vbmXDbhVSs22gGCo/RVg
         lOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685718425; x=1688310425;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gkMcbSyyvkQgUfWRK2HV2j2NljFUdsZcuD6NJI/zWvA=;
        b=ZE3qxGnksrBVXDqWs4uy7ZHouHLtzekRHlhjQwU8IFkk6aaKM9981Ed+SssGgDaahs
         2VXjNXV/aJ7vDVxPeo0yVY46/2786R99t7W8AhmQMfHFgfmHf/u6BFiFh65Z18bt8eSg
         Q0+EWG+VDcw5upYNtklo5epBqRabO1ewfLx8OBAY92ic+sHHM1airs9vFknHJrmkrlbQ
         pizAwj3gBwGSht4y5GDFtJEJTALHmM1oAuOuq0L8OaX7mcPNn8D9VTsXjQgi+0+HtS7i
         FPvuUJYXIza8uovaoJCU28l7gxBikETOIQCZVCApncug1ACQIC4Za/Y3085GFEYtEtIo
         txFg==
X-Gm-Message-State: AC+VfDz0/gQ+Lh7RKWkUe0Q51aKYYd4Kior3zfhqkFT3NBLoxdeMWlxx
        1ZqbY9/ewLjjqrdFU1F/MoJcYSpuY4XpOiYmmXNv1w==
X-Google-Smtp-Source: ACHHUZ5ncc6P8DwX5o7kJW+AkIcPbCpEfMhiKQ6G2f4LhVsBABR+C0FgPNVVc7jmuPIbnNEoKeLHhw==
X-Received: by 2002:a05:6a20:ad90:b0:110:b0ab:8798 with SMTP id dd16-20020a056a20ad9000b00110b0ab8798mr8923090pzb.36.1685718425676;
        Fri, 02 Jun 2023 08:07:05 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l184-20020a6325c1000000b0053fbacdaf59sm1334860pgl.69.2023.06.02.08.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 08:07:05 -0700 (PDT)
Message-ID: <647a0599.630a0220.7775b.265a@mx.google.com>
Date:   Fri, 02 Jun 2023 08:07:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2023-06-02-v6.4-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next v4l2-compliance on uvcvideo: 3 runs,
 2 regressions (renesas-next-2023-06-02-v6.4-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next v4l2-compliance on uvcvideo: 3 runs, 2 regressions (renesas-ne=
xt-2023-06-02-v6.4-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-06-02-v6.4-rc1/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-06-02-v6.4-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      256ba57a94d64c7d95e8f620dc8d1299c15fbc35

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  52926c1f2f03aebe34d96056e8380ab07c8f512d =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f6c8f75ab7e9bcf5de25

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4l2-=
compliance-uvc-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4l2-=
compliance-uvc-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-v4=
l2/20230527.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.login: https://kernelci.org/test/case/id/6479f6c8f7=
5ab7e9bcf5de26
        new failure (last pass: renesas-next-2023-03-30-v6.3-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f4f2c2fc65b33af5de3a

  Results:     1 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4l2-=
compliance-uvc-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4l2-=
compliance-uvc-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-v4=
l2/20230527.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.device-presence: https://kernelci.org/test/case/id/=
6479f4f2c2fc65b33af5de3c
        new failure (last pass: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-02T13:55:46.258913  / # =


    2023-06-02T13:55:46.259187  <6>[   20.710294] IPv6: ADDRCONF(NETDEV_CHA=
NGE): enx00e04c6807c8: link becomes ready

    2023-06-02T13:55:46.259252  <6>[   20.719792] r8152 8-1:1.0 enx00e04c68=
07c8: carrier on

    2023-06-02T13:55:46.303759  =


    2023-06-02T13:55:46.404986  / # #

    2023-06-02T13:55:46.406806  #

    2023-06-02T13:55:46.509415  / # export SHELL=3D/bin/sh

    2023-06-02T13:55:46.511415  export SHELL=3D/bin/sh

    2023-06-02T13:55:46.613047  / # . /lava-10565383/environment

    2023-06-02T13:55:46.615349  . /lava-10565383/environment
 =

    ... (64 line(s) more)  =

 =20
