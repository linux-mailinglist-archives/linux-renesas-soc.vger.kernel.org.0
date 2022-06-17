Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14A3A54FC4E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jun 2022 19:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382893AbiFQRjr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jun 2022 13:39:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234564AbiFQRjq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jun 2022 13:39:46 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 517153F300
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jun 2022 10:39:46 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id x4so4726997pfj.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jun 2022 10:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=sE5FM/MbOg0S6XWHZNOKjwdwMyaH6ZFWxpMxZnF0WrY=;
        b=EyJcQwD1MOl98Fhu8fN/bsbYmShzeNv7FpRZmuELIO3scER0uSvlmvyXnQzfx7uQC/
         +M9V/ardnz+iFtNx0Z/DVeZeznmWI+asyFP7zoda/+MQvfgnIINibYQzqVM/OMn4yGKO
         9/8uYqtt2hXnseCmmshuS9oTVNukIxH4DWkzhPYBjYBSAx/4VtCH6H65lzL6yltOcjkW
         LMyY9NGDir0ZfMNmTEZGJBbKESlG6TweOyNHZ7JxRzjROqtJY5K7r+xa2FLPZzbJn3/M
         s2SDfhYxoA3X28cNfpTNcdYy4MvMH2VWO0TYAoqLt2FSbtcIX4XOQLS1QhF+tpuH6M4P
         5ZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=sE5FM/MbOg0S6XWHZNOKjwdwMyaH6ZFWxpMxZnF0WrY=;
        b=T6NGIi08NgJinR3yQH9U42ttxpSfKWjvWP4BhupJJC3Kfx5h9aTD/iu79ZRAv9tZfp
         CU6MsZwvth/Ot65ZCYYa7I0B/cruLlsBihzg2/a+NFh1l/LlwnndV9ly4BBb/MRQGf3d
         IXOJusSMvI082seaLw3OWPxfwA5or7Y9Ym8CLtm5F9fRyjHK+eS075Kr/lLlk4rHTISK
         OvMcsHvKccHXzasoqfexm7GBNoFE4zE2TZloAeBpYZeX9RimXovItNDsxzyeX9xUKewq
         0npHBJYUgxqN3VXsdnIrQJOl9/c8HGs8jWypYYAUImpbSXhhZrJ7oJT/xsO1r5fC7OoO
         yRJA==
X-Gm-Message-State: AJIora8CeCeey8KaE55fwo+P+1ClBOaUXDV/2i/jZnuwJbqUz5sF30IY
        ZqM56YlGVQn0N4nB0IBXPEcwzA/3LwaEv0uPQAw=
X-Google-Smtp-Source: AGRyM1sHa79SdW5dS9lWLNAB+Ht8JNFn5a6618hQS7DoGlJ0eDT/4ehwS96jAlyTzeMAzBP5/OCiBQ==
X-Received: by 2002:a63:485d:0:b0:3fe:2b87:cef6 with SMTP id x29-20020a63485d000000b003fe2b87cef6mr10200037pgk.2.1655487585673;
        Fri, 17 Jun 2022 10:39:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090264c200b001678960e2ebsm3822796pli.224.2022.06.17.10.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 10:39:45 -0700 (PDT)
Message-ID: <62acbc61.1c69fb81.5fcb3.5699@mx.google.com>
Date:   Fri, 17 Jun 2022 10:39:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-06-17-v5.19-rc2
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master ltp-ipc: 20 runs,
 1 regressions (renesas-devel-2022-06-17-v5.19-rc2)
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

renesas/master ltp-ipc: 20 runs, 1 regressions (renesas-devel-2022-06-17-v5=
.19-rc2)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-06-17-v5.19-rc2/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-06-17-v5.19-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      8ee5150f6442f9872b13f459339f32db2b5084f9

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  e98f9465925434349d0aa6eb71e81b5464e76df4 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/62aca8c0da25582459a39c00

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-17-v5.19-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/l=
tp-ipc-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-17-v5.19-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/l=
tp-ipc-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20220610.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/62aca8c0da25582459a39c=
01
        new failure (last pass: renesas-devel-2022-06-06-v5.19-rc1) =

 =20
