Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43B964C80A5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Mar 2022 03:01:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbiCACC0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Feb 2022 21:02:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbiCACC0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Feb 2022 21:02:26 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9F851AF1D
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Feb 2022 18:01:46 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id h17-20020a17090acf1100b001bc68ecce4aso799732pju.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Feb 2022 18:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=6scp/01TptMr9XSvpeO3PuQmhEeAwnt6/a1SYwSAyxY=;
        b=KkZGSBdBpAKvvGbMR44dPkcwSK2u7OG6Tu7PegHyYJJNhhF04jJNTntaV9qIDgDdCf
         JvTeuClQPlJW7gXxiGpfiMEBQzN3SDToc930hLr2svwupRUbH6QYVptgbqHtw8n1h/rT
         M4v3ICfYiFkYnsDHwAM/4xUiWGbLL08cu6WgVgVVVsk2EJH5RZWVU/wr92Gwo+Rxrz3t
         xHKaEqGe2UT8I4cSAWbE0Hita402oWhCAruoKwAQ689okh3Aiq/1WB8UZ1ovhAVtEpWh
         oCgj9JRK3L/gXxryhtkaCizjXVKgvjUMRw5U7LLg2b937ZXZBIEtTNv2gwk3EfAhKGZQ
         QdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=6scp/01TptMr9XSvpeO3PuQmhEeAwnt6/a1SYwSAyxY=;
        b=hVdqgCPCXYWn2jriZ6qMrMslLh3XFjHFbprBadZ/tJM9E8rJ0qNFHVEj66G/hkt1dJ
         CS6kznoLC3UVjP7gFS1ih63PGMV2SsxgtO48rUnHiZakg/3De5ADoD/0HiF20ndsbMtN
         4yORgqcEFQU8idKM1lbBqGyAwf4711co3xm+skTfMUhbIe3GGGjjqVTfHB9OfpE1klO8
         /o9H931G6HBkrBb+N6UrTfHW9JomWSQbjOeAqSpydPSLoxO8JidxqBNbILHeV8vsLJAI
         +NSDi6zdyecs8Oi/ecTRuXxdZNjOZmaxtERQ1cwci6je4WOCjrwg0fxO71t4AQ5G6Eio
         D7wg==
X-Gm-Message-State: AOAM531zVwG5UTK4gQYclPWSqYN67Yc2DpbbhqmkfF3nsKvnhmosd/m/
        tEq03MY7ZmMgt6v4ekiRfL/T1LaqauhkRvQTAeg=
X-Google-Smtp-Source: ABdhPJybIeoknhTbdBvn9oDPzC68bmCq5fiixovlI0KoaW46HtLFGaDb2XPQDCP4N1lIzwsimq3iVQ==
X-Received: by 2002:a17:902:ce86:b0:151:825e:8733 with SMTP id f6-20020a170902ce8600b00151825e8733mr1118893plg.127.1646100106190;
        Mon, 28 Feb 2022 18:01:46 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g22-20020a056a0023d600b004c0ef29dd5bsm15016014pfc.107.2022.02.28.18.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 18:01:45 -0800 (PST)
Message-ID: <621d7e89.1c69fb81.cd364.68ba@mx.google.com>
Date:   Mon, 28 Feb 2022 18:01:45 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-02-28-v5.17-rc6
Subject: renesas/master baseline-nfs: 52 runs,
 2 regressions (renesas-devel-2022-02-28-v5.17-rc6)
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

renesas/master baseline-nfs: 52 runs, 2 regressions (renesas-devel-2022-02-=
28-v5.17-rc6)

Regressions Summary
-------------------

platform            | arch  | lab          | compiler | defconfig        | =
regressions
--------------------+-------+--------------+----------+------------------+-=
-----------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig        | =
1          =

r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+crypto | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-02-28-v5.17-rc6/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-02-28-v5.17-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a71d9945241e2e2c40b48a4e45d486664a83354d =



Test Regressions
---------------- =



platform            | arch  | lab          | compiler | defconfig        | =
regressions
--------------------+-------+--------------+----------+------------------+-=
-----------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig        | =
1          =


  Details:     https://kernelci.org/test/plan/id/621d472d517fcb0ee8c62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-28-v5.17-rc6/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-r8a779=
50-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-28-v5.17-rc6/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-r8a779=
50-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220218.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/621d472d517fcb0ee=
8c62969
        new failure (last pass: renesas-devel-2022-02-22-v5.17-rc5) =

 =



platform            | arch  | lab          | compiler | defconfig        | =
regressions
--------------------+-------+--------------+----------+------------------+-=
-----------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+crypto | =
1          =


  Details:     https://kernelci.org/test/plan/id/621d4dbf6fe6e0e382c6299d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-28-v5.17-rc6/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs=
-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-28-v5.17-rc6/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs=
-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220218.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/621d4dc06fe6e0e38=
2c6299e
        failing since 5 days (last pass: renesas-devel-2022-02-21-v5.17-rc5=
, first fail: renesas-devel-2022-02-22-v5.17-rc5) =

 =20
