Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73FEB4BEE83
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Feb 2022 02:14:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234068AbiBVAxM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Feb 2022 19:53:12 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:59116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237951AbiBVAxK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Feb 2022 19:53:10 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAD7D55AA
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Feb 2022 16:52:46 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id v4so16744063pjh.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Feb 2022 16:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=cCqQkktrec9x+SmhqAepi9A6OtQOk2om+kzhMQbxaqw=;
        b=PAOG3a1PcM3mkJVF8NFfDEKgiwqoQJAzzJHmPnZ7bSAgCkLauErb8183K5SUKvH7h4
         cgAIscR8LNAMMg2M8ep9uLRSMel6dhlYfDL0xAfRE3WAGqaUi06p7Q+GltzTzU5LaC3S
         ZYgDUWSETf51O0pSa3/PCE79OoXWMZyEZXh5rn9V/oYKnYth+TpgOApxyDZOKW7SRvu2
         l2XMoEn41wAY3nGbYIMs7ducUx8gYYa8AfmvSyF5f1N+fjZ/7Eyup+MK5dR96ZaN20bQ
         qGf8dWA/B6oyrOzpX6d53Lszmg/cRqt7llM3EHxbe/SMv7fkQOXRLsz+78udaus121wA
         8NRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=cCqQkktrec9x+SmhqAepi9A6OtQOk2om+kzhMQbxaqw=;
        b=tyfddRXk8zHhT3WFN3zTKMyVBMHYrSxfxCyhXtreuEkfQzjnbz+axhdqxNlbsWD1nd
         OoOH0RPDeNe7EF2eZ4pPnn3LwmKS8e63IwPzMtwaZAgfzX6CagO3eNP6SUaeScSe9eqD
         horiq+IpsPTls261LgTFxo7WTvUQ6fWkiVc5M02hUPNRDqMONQfFGyrJ7OvOzDJIkz59
         M6FLrQtlWjS9m3upTs09Dm/CTrVt1QZgNVflFkKw8SIV+XjmqxQre2Ygakil4qBDV5p9
         HY+U8U2L/sML7gE20haioX7cCRn3q+JPIYxVnlLurYgzvtWAlpsQgbhmyJoNQWGsW9+J
         IvgA==
X-Gm-Message-State: AOAM532rPB8bc6nwR93J1lS0QIZjIzlcW2PES+Z8yWXkxJKmSxA2iGb7
        Nds4oyasu9voY3oT0yRt+NkUVYlscWii1IJQ
X-Google-Smtp-Source: ABdhPJyDyaZVft1F7xf8qjunK02X7Dtm5Ie1Xc7AjS3FPNlH7BvnR7N4SY0bvxwEQyVouGel71QJ1g==
X-Received: by 2002:a17:90a:c252:b0:1bc:52a8:cac8 with SMTP id d18-20020a17090ac25200b001bc52a8cac8mr1471211pjx.61.1645491166092;
        Mon, 21 Feb 2022 16:52:46 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q13sm14994548pfl.210.2022.02.21.16.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 16:52:45 -0800 (PST)
Message-ID: <621433dd.1c69fb81.bc34a.a1e6@mx.google.com>
Date:   Mon, 21 Feb 2022 16:52:45 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-02-21-v5.17-rc5
Subject: renesas/master baseline: 266 runs,
 1 regressions (renesas-devel-2022-02-21-v5.17-rc5)
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

renesas/master baseline: 266 runs, 1 regressions (renesas-devel-2022-02-21-=
v5.17-rc5)

Regressions Summary
-------------------

platform            | arch  | lab          | compiler | defconfig          =
          | regressions
--------------------+-------+--------------+----------+--------------------=
----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+CON...OMI=
ZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-02-21-v5.17-rc5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-02-21-v5.17-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      0817e10d064bafaf1215d6e6d39576b9555cc568 =



Test Regressions
---------------- =



platform            | arch  | lab          | compiler | defconfig          =
          | regressions
--------------------+-------+--------------+----------+--------------------=
----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+CON...OMI=
ZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/621403f8989ee7dfadc62977

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-21-v5.17-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ba=
ylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-21-v5.17-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ba=
ylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621403f8989ee7dfadc62=
978
        new failure (last pass: renesas-devel-2022-02-14-v5.17-rc4) =

 =20
