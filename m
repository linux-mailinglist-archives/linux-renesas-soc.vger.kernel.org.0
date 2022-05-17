Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8990B52A0CE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 May 2022 13:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345566AbiEQLzj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 May 2022 07:55:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239440AbiEQLzi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 May 2022 07:55:38 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E1A74667F
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 May 2022 04:55:37 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id o13-20020a17090a9f8d00b001df3fc52ea7so2182745pjp.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 May 2022 04:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=RlepMiPuAVonZgviS80Tf3krO22PqqCiyJEWYLfV07E=;
        b=Ybnp8Kxt6ASWvfbuRGgVnXrR11vcbpIzo5amP9k0dcL1InBuzI8O9GCgT5NR3QIdI2
         GqgKQ7vj5qPD1pOy7YMY8dd8sbT316K/ZlmIF71mKP5j+DaR62HtPS9INo8WB+qL2JpS
         qtZ+xibvfn/C7KCukiSQBd0VLKQWOWpNpWkMybp5IxIpwe1rnN+PF7lnz8LAqKHZq6Ya
         6oT18GSuZQIUP/m1PyB20YiFWBkKI4oNv9cjpHSxcpx246qyDufwmWCsSImYnF3N0KT+
         1IoSEfHjhTyhxYlkkAtNHBD+vIoW+jOapEJxvF1l+joOCpW+7oKQHrP65+5+A+Gc5Wug
         vaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=RlepMiPuAVonZgviS80Tf3krO22PqqCiyJEWYLfV07E=;
        b=7EzoO1q7dZ6pDBpX8sHSuOehJ3mB8x33VX9KzUE79UqE90932eoTF4fOkNq4FAYyew
         dX7XJokEwyL86TjsjxOY4SGjiSoouHb90yyVGyE2GtVrJrWbmZmEXyW+K2pNeoDWG56j
         h1Nw7EIiPE18GcrWDWi9OSVvTzG1yOb7y4xj5SZFSkQ9f8NiDhBfPTeLWahvjhasN1dD
         +isq3517taw9HurCPhWR8qwRpG7eOkDY77DDNT7YFpgqDawgExslLcWTci4XE1cMSFtF
         LcKlYvQzfqQyJkqFNOsJG+oKL/aGBLxmOv/to0eb3qXX0Ti42XuKjay5he0uszrpCW1x
         dTgg==
X-Gm-Message-State: AOAM531RTQ4moJQmOexOdKIuerp+1xxTizGnZk8OGXWA7M3HFUvc196M
        Yv08f+Kn/l8Mbr5woUnW9BM0C8YqF0/ZQpeqmTk=
X-Google-Smtp-Source: ABdhPJx1IOmLgsTXNPbaAJ1MpW96GaDfWRf9lrNg74xOXIDqMwZZA6KVu68HWTYcpACeobP8WjqV+w==
X-Received: by 2002:a17:90a:760d:b0:1df:6423:d0b9 with SMTP id s13-20020a17090a760d00b001df6423d0b9mr8633405pjk.33.1652788536625;
        Tue, 17 May 2022 04:55:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 193-20020a6214ca000000b0050dc76281ecsm1133056pfu.198.2022.05.17.04.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 04:55:36 -0700 (PDT)
Message-ID: <62838d38.1c69fb81.27531.201e@mx.google.com>
Date:   Tue, 17 May 2022 04:55:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-05-17-v5.18-rc7
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master cros-ec: 8 runs,
 1 regressions (renesas-devel-2022-05-17-v5.18-rc7)
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

renesas/master cros-ec: 8 runs, 1 regressions (renesas-devel-2022-05-17-v5.=
18-rc7)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-05-17-v5.18-rc7/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-05-17-v5.18-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6bd98cbba53cd9f63aaf4d82982dff95c824b92a

  Test suite revisions:
    cros-ec-tests
      URL:  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/cros-ec-tests.git
      SHA:  86181a7fbd379fc42314c450740d2cea8cdf04c1 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/62837b535db56e3355a39c05

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-17-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/c=
ros-ec-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-17-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/c=
ros-ec-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220513.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/62837b535db56e3355a39c=
06
        failing since 0 day (last pass: renesas-devel-2022-05-09-v5.18-rc6,=
 first fail: renesas-devel-2022-05-16-v5.18-rc7) =

 =20
