Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 572B150000F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Apr 2022 22:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235198AbiDMUk1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Apr 2022 16:40:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiDMUk0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Apr 2022 16:40:26 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 624954D601
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Apr 2022 13:38:04 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id j17so3000104pfi.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Apr 2022 13:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=EdBxg7b9HlHSsKnAzntuoEHv6NTYD8rrK4Ro1m3Tfc0=;
        b=arau7R88jljXr1eCzAoEmVLzLgWUToVYaIepx2HH1s/U/4pAY5HxmpVsnIocOqy8fl
         rbRmuu9iT53FbTBo8qjkhXVD4Z/B0bwHH0DoJU88Cm2oWjpHr/qOGfuZzxClxX8tO9+1
         URCEOngSGE3xjsWtl40VHPFeNFjS87tX5n7GPfQD74gc+cJlIVwej6jgvg/jGlt+saJ2
         vf5s/MI3yuwIGD9h6J6qCiS7kqzq+5b9WMiT33xeYp+ZWQb9JR7nS1VfQpsKT+kJFL6O
         hmc5E6s3L+MD5LPRPyUYFwwzlHt43UpkGPvUWrUnwkuiOJ0Zlq7+waz4B+OjHLBs64+G
         ss2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=EdBxg7b9HlHSsKnAzntuoEHv6NTYD8rrK4Ro1m3Tfc0=;
        b=wJBpwgtNnVLXHVnoWQN2pP+tuY7MH/TOHr5w3nSXjPR+2h1lZ96Rds+gnJmxUHVCZT
         9XrVUmNZbOryUonVK1jQTkizQ1Rai9XKWYosYIiPJi7NMgZqTf4yQOtY2+cuqn9V7cmd
         pH+ZhW/wzS0LTdafzjMCHiFbJGqhfZh1IrrB4o0+NNGMvESIU0tFGfws1pqv9Yzy5mUC
         2liZKY3x4RMA9/4fw8SqHTw1ohI37G6Qhm03/SP28gWEQHT+Qwb9T9qv8lBwQnFRlT4Z
         B2QkvhYkJX9x3ZuJ6A6SxEGJWx4Ty5kCHvYoqCano1V3ckafZOa6qAaTLQbMb0DgvXwu
         pTKg==
X-Gm-Message-State: AOAM532g9khU78xIZ46Gv+TJd2DWcpDjfiLmHgATSKc9XDII1Kkvk67m
        yxweL/1h9VIhgdXZYsD7IyK6QqnQVqWthRCH
X-Google-Smtp-Source: ABdhPJzlyWXJKyGwwtsZ5u4EfYYRHyTCBi7rDfMrz/IumVseRqanbOFnp0M14dxbpUJA0lp9HgXN2A==
X-Received: by 2002:a05:6a00:890:b0:4f6:686e:a8a9 with SMTP id q16-20020a056a00089000b004f6686ea8a9mr522862pfj.83.1649882283711;
        Wed, 13 Apr 2022 13:38:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p10-20020a056a0026ca00b004fb44e0cb17sm44167722pfw.116.2022.04.13.13.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 13:38:03 -0700 (PDT)
Message-ID: <625734ab.1c69fb81.a8167.3ae1@mx.google.com>
Date:   Wed, 13 Apr 2022 13:38:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-04-13-v5.18-rc2
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 59 runs,
 1 regressions (renesas-devel-2022-04-13-v5.18-rc2)
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

renesas/master baseline-nfs: 59 runs, 1 regressions (renesas-devel-2022-04-=
13-v5.18-rc2)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-04-13-v5.18-rc2/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-04-13-v5.18-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      83f3d1f783134ab640a936201ad287ae8570cec3 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6257048b1623169b80ae0685

  Results:     82 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-13-v5.18-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-13-v5.18-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220401.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/cas=
e/id/6257048b1623169b80ae069f
        failing since 36 days (last pass: renesas-devel-2022-02-28-v5.17-rc=
6, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-04-13T17:12:34.049492  <8>[   38.750727] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-04-13T17:12:35.095133  /lava-6080240/1/../bin/lava-test-case
    2022-04-13T17:12:35.133493  <8>[   39.834605] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
