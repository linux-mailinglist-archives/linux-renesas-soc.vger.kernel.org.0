Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1C38531372
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 May 2022 18:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237686AbiEWPUW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 May 2022 11:20:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237714AbiEWPUR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 May 2022 11:20:17 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E7525DA71
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 May 2022 08:20:16 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id w3so6778325plp.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 May 2022 08:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=nnGi9OH+NpMtYZXemnxr8M+ZnUeJHrFilm8juTxPCq0=;
        b=im0PgWf+jh+K5ntzeS2XZ+ajpYnfVvClm7F3K5WYxgYcNj7FmTBE4gpm6KtWXpSGoG
         nRJ0S2bxpG48GyKNNVEWQzJ/X/GUwq3o6hPTT0CY9QkFe3dfVP5+dPYOAtYTrXmVWTXQ
         7apQLJzX6HI6zRAf05CDPOWarVTakT1OdEiktXFR/AzVH1OqU0k4gFeQNuZis2Hl/pPC
         FDq+jwzBBuEeL2LaAEK/tx5RC3RUYXVAz8bqm+sukoH4C38zgNHNXalEyMj9iBUrmOQO
         wtxcrDWfMm2W3e25TWqXsX3kwhyNk0SiaZQCP24wPw15VnXdwihJ4qER/BrxqdVWcXtv
         hmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=nnGi9OH+NpMtYZXemnxr8M+ZnUeJHrFilm8juTxPCq0=;
        b=dwSwgC7RklwDulw9b8InQ3s/3B7Dq8sVtKlvviql2n5JSeJlecIfz1lNFqom9P3b5c
         b7S3aFdZJUVihqYZH48HXKMiHxcAfyG42UUxtNHaRlTjmwnyxaf1gloGoSht7fFe+cpo
         WZziK9PPr4YQA/0U65yksojsIQlrbBRhssr8OVJ8Aqof4vxT3FfRxnHVKhiojpsLYsJ2
         4P+xCOZ86s7KNC8M4yBIpuzGvgi2jUFDk7xheuiN89h4Kv+/MgTBIlHXkp4ee3PUjAsA
         pygLezvdoGwn7gvlzfrsGjuf9n0vQjjIFDCHux2uwSY/Jd64Klt/7Fb2/qtYTPt7wR/d
         A1Bg==
X-Gm-Message-State: AOAM531/x47wxlSkikSkNoDKgqy0drnruyAw79kofot/xNiQ7UBRBB72
        gz9czoIODTcHXgKnGtlSUFyeJfMOwk1Vm8MIFfY=
X-Google-Smtp-Source: ABdhPJxs5nh6b+OJ9DPbqz89AJtcZU9mOJf2IBaoMkUl0ne9oYUQgmnB0vMJzPWZkOCNN8Iu6Y6R8g==
X-Received: by 2002:a17:902:e5c2:b0:161:fb68:cd28 with SMTP id u2-20020a170902e5c200b00161fb68cd28mr14744387plf.133.1653319215565;
        Mon, 23 May 2022 08:20:15 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p21-20020a170903249500b00161b3d5e3e4sm5271285plw.304.2022.05.23.08.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 08:20:15 -0700 (PDT)
Message-ID: <628ba62f.1c69fb81.8f93d.c0ba@mx.google.com>
Date:   Mon, 23 May 2022 08:20:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-05-23-v5.18
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master ltp-ipc: 16 runs,
 1 regressions (renesas-devel-2022-05-23-v5.18)
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

renesas/master ltp-ipc: 16 runs, 1 regressions (renesas-devel-2022-05-23-v5=
.18)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-05-23-v5.18/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-05-23-v5.18
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d7344501bd97263caeccbd7a972c0db04024a081

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  17e9ae697a340242c49188ace12a60cd3bc95a53 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/628b989dbd62ea47d2a39bd5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-23-v5.18/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ltp-i=
pc-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-23-v5.18/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ltp-i=
pc-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20220513.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/628b989dbd62ea47d2a39b=
d6
        failing since 6 days (last pass: renesas-devel-2022-05-09-v5.18-rc6=
, first fail: renesas-devel-2022-05-16-v5.18-rc7) =

 =20
