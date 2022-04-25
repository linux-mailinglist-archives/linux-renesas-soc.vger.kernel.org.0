Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 380D350E84D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 20:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244404AbiDYSeT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 14:34:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236586AbiDYSeS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 14:34:18 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04263CE1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Apr 2022 11:31:13 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id z30so7668550pfw.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Apr 2022 11:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=YHRCJmC+/wVZ6WC51pW35hLyinybsa4BudQ/ppz6RD0=;
        b=d/yEAx05H1xQiM2P1xrqqJDSYv3tU+XVY8uj0GID28guUa9Rz3tz9T9brIqlb/qirE
         LSzduGC17qaugpvC8t6ApQUBWlRKztUu4p8YKNRqfaP7hntf+SWpB38xazvWEQ5zYyel
         IfcTnKGBCs87ALpAKXwEraIU3KQzoTBd+4afir32sjK7KHHcAztlqFf6Hm0H/qu8bosA
         XoySHsFECruMMDacfqSGPVs6GTQ83xYanxRvgr+t80fxAQAXUmGuBKWVc8oBvBzJQLKR
         6iuHBuS4sQdmEziU6t7QsHGF7dkndOuAACRSPpaHnaNG6+pYJYLw/ngEl6Tq6CuZ/xot
         3dOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=YHRCJmC+/wVZ6WC51pW35hLyinybsa4BudQ/ppz6RD0=;
        b=0N8T0iXx65JBecflRFZgdMLtyvbQ1TXxdiB4sKw8a1GNHeLAL2gq4fWFgHNR14YAlN
         HA93V2HmziDMwkih4itnUnWc6qDUB2CgYK/E1Gh5RNqwNgE/i8fo1Lj2rJnySLfGnmJc
         0gxsyNGIG91m/TwbSXlRF0+TABeDtd9PzU7yGRrjUQ6G9YeyIbRQ+X7qS3C49l0b2lRR
         7lG5PgiIkZcL+JLcGRpQdHcRdoitWpquPsVTvB2UlEaZwrQPrKZG59jfr5aX89ZZvPjJ
         htFmKckf+DFHh6TbhaChWH1RPPEb8S7x86I/FyepcP+MPXkV31bN2mJexsEPllZGwVTE
         DttA==
X-Gm-Message-State: AOAM533f/8FOa8vY/pnlRyks6fpziFHzb7pUR1v1432VTW5w7AXp6JOU
        eEJg1uGY1RuJK0alx6TmjzyvxcswPLnLDTUifAw=
X-Google-Smtp-Source: ABdhPJyJ8t7/B+aYw/4NSrf82GwPKtFqlbCGBkg+VziftpmS4ZmQQ/FbLT3Jyz6Iw0n+9U+ui8w7/Q==
X-Received: by 2002:a63:e706:0:b0:3a9:fb93:2011 with SMTP id b6-20020a63e706000000b003a9fb932011mr16431723pgi.259.1650911472331;
        Mon, 25 Apr 2022 11:31:12 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o34-20020a634e62000000b0039cc4376415sm10287487pgl.63.2022.04.25.11.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 11:31:11 -0700 (PDT)
Message-ID: <6266e8ef.1c69fb81.e48e2.8774@mx.google.com>
Date:   Mon, 25 Apr 2022 11:31:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2022-04-25-v5.18-rc4
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline-nfs: 82 runs,
 1 regressions (renesas-devel-2022-04-25-v5.18-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 82 runs, 1 regressions (renesas-devel-2022-04-=
25-v5.18-rc4)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-04-25-v5.18-rc4/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-04-25-v5.18-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      478f2e469bfe9bc7010e78ab874415b0f8549427 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6266b728492f84b423ff94d7

  Results:     82 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-25-v5.18-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-25-v5.18-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220422.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/cas=
e/id/6266b728492f84b423ff94fd
        failing since 48 days (last pass: renesas-devel-2022-02-28-v5.17-rc=
6, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-04-25T14:58:35.150324  [   38.541250] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-04-25T14:58:36.203701  /lava-6171782/1/../bin/lava-test-case
    2022-04-25T14:58:36.239640  [   39.631268] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
