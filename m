Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D381253FD7F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jun 2022 13:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241841AbiFGLan (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Jun 2022 07:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242940AbiFGLan (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 07:30:43 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AB2EB0A7E
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jun 2022 04:30:42 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id l20-20020a17090a409400b001dd2a9d555bso15198551pjg.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jun 2022 04:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=SEgE2r20phfH+a+iAm4bMGnJtclCzuMbGIGMDnrSaYU=;
        b=qJQxk+dqcTx2Z7Ff3zp85yo44qq1fpa1duKE9T257g/5/oA3RF0zmyPfYJyg1IGO05
         yHmR6vxhyJc6y5JT8ACGY0BxA+mQK1NAoNbUHUr5bliUvIvlBaTsJESHvwMW1Hey/50z
         MTRiGm2xbXyEEYKa7ulAOMCldjtthtRL5dM7okQlsSnhiczKCWnKhvxB1ModVzXlabEa
         hP6D98S4LHVUKxA1oScbfkuflK0nuNV1dOHTsmzqZImIIvVRy5mDGg9vDsEKuMr74hmB
         +UASA9Zb+TE4KYnHdcdoFU6cx9GjYYV+OuW+RV2bRcR0C7ExBttTyJCGTMqLRllqoQDw
         kMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=SEgE2r20phfH+a+iAm4bMGnJtclCzuMbGIGMDnrSaYU=;
        b=t23pmSIJrW/I+5xmtaZQEeozn20EyECPAA0roakooIFFBvqYW0J7jUOW2TJ9Ljz+SC
         S1/bUE/vW6I32HLKhlaTZ6KaHFacl+HCa1IJ5EW1STuiIxyEToC8HgJJbZuHugtEtsHY
         T8IKYjVBmhIWuoFdhjYzc2co2BnSmEkcbmkUry7eKFfg9y2f2RL/trc75qu5UiPO8vlB
         6VILWFcrBHAdWdcrUi/QYXmrEm9y1cdwcrdd6zwgNV3lBPLTSPb2Q3ZttvVV6N9cKPvW
         cPo1uR/R41+iqRVBDMZJu1q8bF/9fAd42WATCskUdh3gd7PmN0CkbcEkUKLBMYCqcAKA
         q8Aw==
X-Gm-Message-State: AOAM5309UqrAQJ9U2Z2bdElV4UmKYppWniLXTtjGl4nVN4rtQyCMaoRy
        iAFJOS8LLOdCltobeHUGK4sNkY+tzbSlp6x4
X-Google-Smtp-Source: ABdhPJwZg+Jzs6QOClxhv64Bw9tS9/YOLyvdCQeATfkxDuoQAx2oEuNemOc6l70Q+gn7A78EeTmFXw==
X-Received: by 2002:a17:902:f68e:b0:166:4f78:c791 with SMTP id l14-20020a170902f68e00b001664f78c791mr24582330plg.64.1654601441801;
        Tue, 07 Jun 2022 04:30:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j187-20020a638bc4000000b003db822e2170sm12677520pge.23.2022.06.07.04.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 04:30:41 -0700 (PDT)
Message-ID: <629f36e1.1c69fb81.3216b.d1c0@mx.google.com>
Date:   Tue, 07 Jun 2022 04:30:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-06-07-v5.19-rc1
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next cros-ec: 8 runs,
 1 regressions (renesas-next-2022-06-07-v5.19-rc1)
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

renesas/next cros-ec: 8 runs, 1 regressions (renesas-next-2022-06-07-v5.19-=
rc1)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-06-07-v5.19-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-06-07-v5.19-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6f4a1ec70aeccaabaae9ae3860561c6f48965c31

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


  Details:     https://kernelci.org/test/plan/id/629f25b78d3922ce09a39be4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-07-v5.19-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros=
-ec-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-07-v5.19-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros=
-ec-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220603.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/629f25b78d3922ce09a39b=
e5
        new failure (last pass: renesas-next-2022-05-05-v5.18-rc1) =

 =20
