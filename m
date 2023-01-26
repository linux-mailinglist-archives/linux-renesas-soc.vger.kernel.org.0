Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F000E67D883
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jan 2023 23:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230515AbjAZWfq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Jan 2023 17:35:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232161AbjAZWfp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 17:35:45 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6023B64D8A
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 14:35:06 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id a184so2109924pfa.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 14:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V8F8Fc2+1TOzb3wXwFx5OGXVLinjBLgyCXOWiAfz0d8=;
        b=0TDOYBsluDdQ1mlJ4/VD+k3gEIWcje6LjI0WOnPSB5dnUDieNN6GxPIl9hoCEg5CCa
         HdygaEg1OgOJ72EH+UlDkanxyMq3NsmsiehvHXIbrRbicJTqtUmGnjKToREzULOiV4wK
         T2PNJ2UoSii7sq0UxdUUWpKtudGvS4hMlp7BTjDAyqNQ+yUPIJJKBovEIlzHYHV4b7PN
         +3XiWZtcuiKrOaH2TCEjCd6tNuGM7HE58J9oISjS1wIM7CfGwsqeFxwcmLV+oMrZtYxo
         1c4DCid3+MLCJCY9EkGDUvGlZk8mzi9c9tEIxPT1rDDQiSVmuFZLGQTkdk6/Ikq8svKx
         el5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8F8Fc2+1TOzb3wXwFx5OGXVLinjBLgyCXOWiAfz0d8=;
        b=0coY41oJ7G/aCckmpJoUG1haSJXKSkxEPRvzSU/giiRTiiUa2DscBoNk/jLyPwWSzD
         DoBaYdAeme5PikGHoxPvzLVDYr9WRUDVCyj341MMg+glpcZSCRW0ImqR/4780jbq5n7H
         FhQYkTrGauW+k9juRZAmd39vwN38m+fgPcxqf4ma7CAZoZq7B/SMqTAWyG/8U08tSjaG
         q0gAxR3KXGZGep0W8qE7SisppaYfrXjZyK6l+bJl/Z2sAZ1Ltw2VEw1k9w96Smma59Pg
         3zchfhmwr7OSdiwTZlnqTjIFcj9qCDwcZFWg9oMqoalITldPiieDQmKe3U3Pv5aWFr50
         /dnw==
X-Gm-Message-State: AO0yUKX3g/Pyw396mbe3BXUyJHR6Kbbffe7utW2He8NdCHo249O4bLnB
        JhxJv/Eqmg4Mg2HHLNb/eHJTz4QsA+1pLzNhxNWRBg==
X-Google-Smtp-Source: AK7set+SPvDHOQ34eef1EXi7WMBLPyOWK8+ysfok3wsu39o8eVw7panTKF877twSAAq6o88kMeyweQ==
X-Received: by 2002:a62:19c4:0:b0:592:3bf3:f557 with SMTP id 187-20020a6219c4000000b005923bf3f557mr3874726pfz.22.1674772486067;
        Thu, 26 Jan 2023 14:34:46 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p26-20020a056a0026da00b005855d204fd8sm1369420pfw.93.2023.01.26.14.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 14:34:45 -0800 (PST)
Message-ID: <63d30005.050a0220.33a7c.24d5@mx.google.com>
Date:   Thu, 26 Jan 2023 14:34:45 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2023-01-26-v6.2-rc5
X-Kernelci-Report-Type: test
Subject: renesas/master v4l2-compliance on uvcvideo: 2 runs,
 1 regressions (renesas-devel-2023-01-26-v6.2-rc5)
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
devel-2023-01-26-v6.2-rc5)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-01-26-v6.2-rc5/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-01-26-v6.2-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      635b2020aa8744f7174ce492c342357cb34c9e86

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


  Details:     https://kernelci.org/test/plan/id/63d2ed10a8d832e1ee915f67

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-v4=
l2/20221216.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.login: https://kernelci.org/test/case/id/63d2ed10a8=
d832e1ee915f68
        failing since 2 days (last pass: renesas-devel-2023-01-02-v6.2-rc2,=
 first fail: renesas-devel-2023-01-24-v6.2-rc5) =

 =20
