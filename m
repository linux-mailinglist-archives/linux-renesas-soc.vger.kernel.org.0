Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 402133D6B91
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jul 2021 03:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbhG0A7H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Jul 2021 20:59:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233673AbhG0A7G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Jul 2021 20:59:06 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3FE7C061757
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jul 2021 18:39:33 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id e2-20020a17090a4a02b029016f3020d867so2650959pjh.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jul 2021 18:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=po/o6Al5Lzl2f4tER6Q8AG3Y5V4S+6+KsmIGwsZWPjQ=;
        b=ihJM8+8mMYbcyrm/UevrB67G/zrHOrAytElb9Ze1fWJcEH9+IiHnVjoZb8pTjEaXMO
         /M22wXmY+im03HmP1tZXJIH7OKoTJZh9r4Qg34D/utP53aJaLYcvohCiNWBvrkFf6I5f
         FN6a173v1GplYrTY3oKsL/X2BCiVsv1FWCPbQwOSY6lNye2rGZYSJkZNSKd7/jbcvt4P
         nf1MRPGolVd+HsPdhWbZuH/eePafFZnTOAUPJE5PknQQfA4ipCz1rshKZo2VYi4YOoZX
         Q58dt4GOAih549dppyxMlJLMZQthgSQfXndeeONvtgjRJsEmmFvFv8u/0jV8yNOWZpen
         R9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=po/o6Al5Lzl2f4tER6Q8AG3Y5V4S+6+KsmIGwsZWPjQ=;
        b=pFJY3Z5MJWd7ni1Fe6iANjEp1y6NbVh1NB5sbTtz/u4ATD2GJnSP/NukMtPaktDb3Q
         29/NjwIVimuFx7QJTxDwcumZPCvdV0/hjOFP5grMQT582u6+diwQqYHhqLNuDDOX/cXV
         qesdIQ0Ewmvxn6AZZeNsZ08R04QDhJpVmdAqaNr/KRUlv4O57+8Lq4E2vCxGmKI1zBeb
         1eUvjLzRaQUtQ3Sam3djo0JNY4zTMyfV3NYDKPcbgTOlmHCgW+SgO59PsvYSnhIsP7Ky
         0UbQWWWa2TaA2R5EOZWErEEs5tPKNdncoJIGdBboBrH/CtaJu0vUxADfJnLsj77rk1vE
         txrw==
X-Gm-Message-State: AOAM533oabiCknzM+P5clT17mz/IHEUfO1trkahtMLUs8TvTem84Kh+B
        QfV5LOGMMeF+RZnCpeWZ7jAgKXSW4L+eNk7w
X-Google-Smtp-Source: ABdhPJwfeE+5Op9TC5w9RyRCFHyn9FIgtd08EQm7SuqpxMQxmsxyAIQwKrdlbcMEAa5GksabWrpUbg==
X-Received: by 2002:a05:6a00:189e:b029:32b:9f66:dcbb with SMTP id x30-20020a056a00189eb029032b9f66dcbbmr20724101pfh.72.1627349973379;
        Mon, 26 Jul 2021 18:39:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h19sm1337660pfo.161.2021.07.26.18.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 18:39:33 -0700 (PDT)
Message-ID: <60ff63d5.1c69fb81.b1ebb.5cda@mx.google.com>
Date:   Mon, 26 Jul 2021 18:39:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2021-07-26-v5.14-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/next cros-ec: 6 runs,
 1 regressions (renesas-next-2021-07-26-v5.14-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next cros-ec: 6 runs, 1 regressions (renesas-next-2021-07-26-v5.14-=
rc1)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
asus-C523NA-A20057-coral | x86_64 | lab-collabora | gcc-8    | x86_64_defco=
n...6-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-07-26-v5.14-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-07-26-v5.14-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      cecb7cc88302b2e508c6cc1ce7663bba08c96a65

  Test suite revisions:
    cros-ec-tests
      URL:  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/cros-ec-tests.git
      SHA:  e4c91962f6e19466c1e43629a2c6cd04ff012e06 =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
asus-C523NA-A20057-coral | x86_64 | lab-collabora | gcc-8    | x86_64_defco=
n...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/60ff4c000f4430f3923a2f38

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora=
/cros-ec-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora=
/cros-ec-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-cros=
-ec/20210722.0/amd64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/60ff4c000f4430f3923a2f=
39
        failing since 13 days (last pass: v5.14-rc1-17-gcd117793e1ac, first=
 fail: renesas-next-2021-07-13-v5.14-rc1) =

 =20
