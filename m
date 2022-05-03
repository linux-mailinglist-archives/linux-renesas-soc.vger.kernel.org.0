Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1611E518724
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 May 2022 16:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237319AbiECOuV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 May 2022 10:50:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232623AbiECOuU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 May 2022 10:50:20 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C216201A4
        for <linux-renesas-soc@vger.kernel.org>; Tue,  3 May 2022 07:46:48 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id w5-20020a17090aaf8500b001d74c754128so2454639pjq.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 May 2022 07:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=G+4oq2//P4l9lmQAI6Ffhs4i+UEf3c34TCtlhdVgcoo=;
        b=zWAM2KWK1rCUuF2x8+NdiJI7YBLrIH5ARKLafvy6+C4hmB4sAqA0f6/U9H95Li3NZG
         bTMISV/Lhc0zzDk8Cyz2ldil3ByQeQbRwqrlv2E7Tmt8aPdkWcSxfTNlH3FmZocYg9X/
         P42nUNQVVrx6z6L9lT88Tw1Ffc9zv+z9NTuynw7g9MgL/I3HYwUGfVvHX8ZiIleDgtbe
         S996Pw3CuC9WO6+6sO2bmlKyCTF7bCeyWKu7XoA7l3s2w4bCYCoLKM7+CuhsdwN/QfQd
         UuErxAwjD7zkRe3GFx5RBo3czjSZ5zRrMtBffieGgAPM3QLGg6ItlEXnJ7+wEKpydzFP
         xpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=G+4oq2//P4l9lmQAI6Ffhs4i+UEf3c34TCtlhdVgcoo=;
        b=w27aMUdf87KMzeyEShkh+Hc1ULW69e/R4K5gVVtiBetG0XVhFmIyfUc1a8M1H/DHmH
         9Q/EQopCWQMMYI7k5KRp3tWbVuR178bo/HOgcLjrFGb9yPKYkN2+8MQYGUXdnrPlXi02
         abebexiGaUbONimapfQPcGIPnUGWKU4IEgUO//zdmnMlaNPyobSoRqLAkzGF+vEx3sJW
         irVON9FckaGIMozay6Ld68iqIOWh6MoSeYpAE32UtP0Ycko2/QmblzCyrVQWKpp/Jt3q
         F0ZD3xNwN0LHxzEByiHMZVIALy5uhv54tAxqUeIIVgpiUuixIg8s6u9W6pvApnJiQB3N
         LTOA==
X-Gm-Message-State: AOAM5327B+WR0GPXPLiO49NUN0YrZ6cl7E4CuHFfScXo3r41hL2CRLxT
        ZrbhnI14OK4keTARDN/LRFTRy1SNrjxf0UVwMic=
X-Google-Smtp-Source: ABdhPJzD3a1w9MpSaRd7fBpdkSfiTta6LELLw7VAg4Fqod7mNuy8AsgBSkHWmlHrTYYWiR+4uWJ/ag==
X-Received: by 2002:a17:90b:4d0c:b0:1d9:aee3:fac1 with SMTP id mw12-20020a17090b4d0c00b001d9aee3fac1mr5160505pjb.15.1651589204498;
        Tue, 03 May 2022 07:46:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f1-20020a170902ff0100b0015e8d4eb2bbsm6427920plj.261.2022.05.03.07.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 07:46:44 -0700 (PDT)
Message-ID: <62714054.1c69fb81.b4810.fa1d@mx.google.com>
Date:   Tue, 03 May 2022 07:46:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2022-05-03-v5.18-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 306 runs,
 1 regressions (renesas-devel-2022-05-03-v5.18-rc5)
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

renesas/master baseline: 306 runs, 1 regressions (renesas-devel-2022-05-03-=
v5.18-rc5)

Regressions Summary
-------------------

platform   | arch | lab          | compiler | defconfig                    =
| regressions
-----------+------+--------------+----------+------------------------------=
+------------
jetson-tk1 | arm  | lab-baylibre | gcc-10   | multi_v7_defc...G_ARM_LPAE=3D=
y | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-05-03-v5.18-rc5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-05-03-v5.18-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      1446b22ccdefd16ccef5ba375037418bae2fee53 =



Test Regressions
---------------- =



platform   | arch | lab          | compiler | defconfig                    =
| regressions
-----------+------+--------------+----------+------------------------------=
+------------
jetson-tk1 | arm  | lab-baylibre | gcc-10   | multi_v7_defc...G_ARM_LPAE=3D=
y | 1          =


  Details:     https://kernelci.org/test/plan/id/627110af32ef9e60f7dc7b42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-03-v5.18-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-03-v5.18-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/627110af32ef9e60f7dc7=
b43
        failing since 3 days (last pass: renesas-devel-2022-04-13-v5.18-rc2=
, first fail: renesas-devel-2022-04-29-v5.18-rc4) =

 =20
