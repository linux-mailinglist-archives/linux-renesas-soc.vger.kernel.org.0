Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F09B68C1E1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Feb 2023 16:42:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbjBFPmI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Feb 2023 10:42:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbjBFPlv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Feb 2023 10:41:51 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 427EF2BF03
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Feb 2023 07:40:58 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id j1so6108750pjd.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Feb 2023 07:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bW7aSJLSZ8tycs8Pq8RHHM81WU8PEnYW8JDN3iEmClk=;
        b=Xt7q0Mo4f9ZZpyldSsjYmfb7/VTOeYT+LWE5Ltb3sLHt6lVE+DN8D0A7nfe43gWw41
         3pgG4zoJYGlGMceqNPSIsJpsPSwfj/x6u/odwNhNFlME1CJE6kNDiyDseaFxt5hU8avS
         OuQ3nTcGuhfwyAzwoGz2wGCYIfjLycrI5LpJf5YDXigBIc9ZqGHpsCcChfarXnU4e6yj
         0RslkVRB+lxUMg5w/vqic3IR6njheCH3r+hhh6/hkZYoHpx9mMxkN5w89aN75b0bhFf5
         /BckZWYkchYSyc8e499WczwQhNL837Y20qkHD1xyj4nCxcJDNdMB4oEM0gRh5rUjpiuL
         ESFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bW7aSJLSZ8tycs8Pq8RHHM81WU8PEnYW8JDN3iEmClk=;
        b=C3NMyNHdeXSLXGlLnrauFRLNXWkJZSuBUeeGFlgrrU61mRp1Aq0mQiPBetGj7zRn51
         bGBDpdc1C+Tn93AaCI5P59a+4YRnjFlI6kR6v0O6BWj09CLwqyokJK+Akvb0vlx+MvKg
         1Lvv/48JMOPLuyyTgoGz26whAkDg/bXmAEEKjWFwyuUVAUeC8WWzyfAAIO6RKS/h2H9Z
         0HhGe+y/0YyqwMXAfGQypvKKJ7e8SIOxyEvB/5n9aZOfwOh+3+I/wqHGXrBsdLnTNIq1
         9WB30DmzE4Inqw53xv2A6ybJOsas7aXPMw4CEIXoCss5quOlfMmBt28bb4vJDdJwUgS5
         Js9w==
X-Gm-Message-State: AO0yUKW1Zi40OZddh+8eYRLgpzwWGYPP969y8NbRpuynRiBi1aarEAhS
        8Keg5osGMBVh4qFyXMgrCxRST+3uKzamLVrjgSQ=
X-Google-Smtp-Source: AK7set9YfWfvzCWiCD4pKXU39HthFDpGW8VVHxa6TO++zqIow07xcjOvz0Q75f2uk4OazRqhgajYow==
X-Received: by 2002:a17:903:1390:b0:199:240:74ec with SMTP id jx16-20020a170903139000b00199024074ecmr6536159plb.18.1675698000566;
        Mon, 06 Feb 2023 07:40:00 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q4-20020a170902f78400b00189f2fdc178sm7055549pln.177.2023.02.06.07.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 07:40:00 -0800 (PST)
Message-ID: <63e11f50.170a0220.14e7c.b0f8@mx.google.com>
Date:   Mon, 06 Feb 2023 07:40:00 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2023-02-06-v6.2-rc7
X-Kernelci-Report-Type: test
Subject: renesas/master v4l2-compliance on uvcvideo: 2 runs,
 1 regressions (renesas-devel-2023-02-06-v6.2-rc7)
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

renesas/master v4l2-compliance on uvcvideo: 2 runs, 1 regressions (renesas-=
devel-2023-02-06-v6.2-rc7)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-02-06-v6.2-rc7/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-02-06-v6.2-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      3254c086a1ff58a54773d12eb58e0210601e352f

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  9124a71fb8e79cafc16af32c9a9d1f2a7e59dce7 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/63e10c782d3b8880ea915ecd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-06-v6.2-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-v4=
l2/20230127.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.login: https://kernelci.org/test/case/id/63e10c782d=
3b8880ea915ece
        failing since 13 days (last pass: renesas-devel-2023-01-02-v6.2-rc2=
, first fail: renesas-devel-2023-01-24-v6.2-rc5) =

 =20
