Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 863D6679D6A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jan 2023 16:27:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234846AbjAXP07 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Jan 2023 10:26:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233174AbjAXP07 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 10:26:59 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C63122DEC
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2023 07:26:58 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id g23so15019503plq.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2023 07:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GbP71oQCXIPRlP5JPuYoQerlXNHcWVOBk5SW9TorEus=;
        b=pz80GFETjIjPDT4jvKNqYXAZvEYTQBLyTo02ewOrt6KS3I92m3Hy4HlL+2SDwpovW6
         P2z4ywcysgnCoFBuVafQy6kieP6Xg2FkL45/nqqDso/+DssLQxH6/wfc8UBh3+wFD3Wj
         jWIXZghaP/VPsaOfTRnl8AkrG82IhsMZFeVPMboUHp3TxwdJed6KuZ/pOIDIh/kzugR6
         ItdyjI9BrtTQd3GgXOkBjDt05JB6MuWPzr8zNVQlImuq6Pk/knbn6S1wKkclV64dFscP
         U25Uyv6lvNMOLnEAZrt0/bd+JvkTnaoyq5TSO64fhViDSxiQX2jF+4R24/akR680jYVf
         532w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GbP71oQCXIPRlP5JPuYoQerlXNHcWVOBk5SW9TorEus=;
        b=3ujHN6ZZnOdaueyMPPdWSboYk89ZUc+VIxIIQ/0ypKf2YOny2PrtAklEmsfOY8y4J6
         Fqo6yzzOxzyC3szF/U1uw1YnbGE1Cc4eIDmR6YTkHhvr7Ybk/CdoEIlnr9tTNcgm5B0u
         K70ampxdbi+FdWPbCtawHyjjw6mXixdygIIxM6Ro5MRiFIwGQpqWq8chrMUzKn/YwOA6
         SLE0K3trDhTKjlAht5C3SS1DQVRuctPHfhppykUilyZsmrWv3lTywOQAgJolV0hhcj5s
         6SLB12PfcoLAGlwyiIGY7SyYegA6EdqY5l4GnI8RMFPY7YOJqH0ZIllMWxLwj5ZvUIdx
         xHDQ==
X-Gm-Message-State: AFqh2krqmeKsjS/B/WthYzRhhcSeJ/fQhGGbeAdPlSCXULB75S/mNnA4
        Dt7KKIaWNf99cwVs+cNJii7lJlj1oHIhMBOsVpg=
X-Google-Smtp-Source: AMrXdXt81iqL9GsDPxjf79NRPwQUQedlWyclBjhS4fThhs7oXqGoxeOk27/kjYulCv/u6uDHyySHEA==
X-Received: by 2002:a17:903:22ce:b0:194:d4d1:2928 with SMTP id y14-20020a17090322ce00b00194d4d12928mr25805539plg.50.1674574017486;
        Tue, 24 Jan 2023 07:26:57 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j12-20020a170902690c00b0019605d48707sm1800278plk.114.2023.01.24.07.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 07:26:57 -0800 (PST)
Message-ID: <63cff8c1.170a0220.3e704.2eaa@mx.google.com>
Date:   Tue, 24 Jan 2023 07:26:57 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2023-01-24-v6.2-rc5
X-Kernelci-Report-Type: test
Subject: renesas/master v4l2-compliance on uvcvideo: 2 runs,
 1 regressions (renesas-devel-2023-01-24-v6.2-rc5)
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
devel-2023-01-24-v6.2-rc5)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-01-24-v6.2-rc5/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-01-24-v6.2-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f23ed7e4efa3e68c99d217f9dc00fc689c7e661d

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  2a982f825cb772419a7fe122c277d461cef346f8 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfe6458bb922ed7e915ebb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-v4=
l2/20221216.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.login: https://kernelci.org/test/case/id/63cfe6458b=
b922ed7e915ebc
        new failure (last pass: renesas-devel-2023-01-02-v6.2-rc2) =

 =20
