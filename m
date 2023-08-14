Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D5E177BF59
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Aug 2023 19:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231430AbjHNRxK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Aug 2023 13:53:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231793AbjHNRxF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Aug 2023 13:53:05 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEE4E124
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Aug 2023 10:53:04 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2680eee423aso2470576a91.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Aug 2023 10:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1692035584; x=1692640384;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lKqFfmtNwLHTdRU85NiXvbaVocwbf85LtFXqiYzL2ms=;
        b=IZss9vweeujuDnb+siqvEwgTX2fNxXL/wV0rOfP8RtVCiMMxcgg/H5KeXJgYy5boX0
         HqevsGmX+01LXl2LGFkdxnFx9BiSGhnehHjZJ2N4Af0kklwsj0k0Z/i6jRElz0s5XM0w
         V78J7N2J4m0WTaIg89YMqmhkqC4JBGAb6DXYRe6ipECKCJVLDAep1uaXYPmBjU8F332X
         h4WA/juFlvToE4Yth7Q46cIpRSWdy/ITM3Ks6H1Bfc0/+1A75INFuV6CZiX623zyqH29
         jlwKWimQ/M//bkO6wl6ULQBuUMMW2Gq9h8r/oUdfS7/BBnqX/JrqDwqySphUV78KYlwP
         n1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692035584; x=1692640384;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lKqFfmtNwLHTdRU85NiXvbaVocwbf85LtFXqiYzL2ms=;
        b=X0ske409si/nztVBSEOg7n+Se9mSHPvrGQFTPQ5iQYws3+9dFuC7hF1sQD+y33VMrU
         TBjVtxMheWru6r12rxMIgCjArNoHmlGs1JP6O9P+SeWexqS5cWsPjTY0O3+CIXr9ZWQd
         14Wj3u4I0lcURqS/6Vh3g3lP1r0oo+YeyaCTswdlGM3pSAepk4Htdp6U/TNHs3wCyUti
         ICXBBBCga2xXGvHG5Omx2L0AdGUfSVnXzdgpN6GpU3jUoPFrcPByeKlw288uWlIZuBGr
         5DQmrDo/cDGEYN0c7gAqbVW/zofb5KGOMInJNtHu+dWxVPA8A6ZiW0xl/gDpRQgI9FKR
         /SDg==
X-Gm-Message-State: AOJu0YyGOuQuKt/52XR7T7+JF8gV0tTAQ1yr+tff1YoSEWLNxRvyp1nI
        kXgVoOwRnUNuA+LHWEZ6XWxItOEyzorEMFlQrxd9Xw==
X-Google-Smtp-Source: AGHT+IFvCLhOUp009TkxEITzWHAu4rYvrNE+lnL41jyCi5P9JhEEjRJfvxipZrDFsmX/aB+zdyYlMQ==
X-Received: by 2002:a17:90a:7027:b0:263:3b44:b0cd with SMTP id f36-20020a17090a702700b002633b44b0cdmr7006447pjk.44.1692035583635;
        Mon, 14 Aug 2023 10:53:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 17-20020a17090a005100b002609cadc56esm8910738pjb.11.2023.08.14.10.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 10:53:02 -0700 (PDT)
Message-ID: <64da69fe.170a0220.46f63.0441@mx.google.com>
Date:   Mon, 14 Aug 2023 10:53:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2023-08-14-v6.5-rc4
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline-nfs: 4 runs,
 1 regressions (renesas-devel-2023-08-14-v6.5-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 4 runs, 1 regressions (renesas-devel-2023-08-1=
4-v6.5-rc4)

Regressions Summary
-------------------

platform                 | arch  | lab     | compiler | defconfig | regress=
ions
-------------------------+-------+---------+----------+-----------+--------=
----
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-10   | defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-08-14-v6.5-rc4/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-08-14-v6.5-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6b779d56ab44b3b21cc3ef91a626d1b2a32bb24c =



Test Regressions
---------------- =



platform                 | arch  | lab     | compiler | defconfig | regress=
ions
-------------------------+-------+---------+----------+-----------+--------=
----
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/64da3583cfb19c292a35b1f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-14-v6.5-rc4/arm64/defconfig/gcc-10/lab-cip/baseline-nfs-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-08-14-v6.5-rc4/arm64/defconfig/gcc-10/lab-cip/baseline-nfs-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/64da3583cfb19c292=
a35b1fa
        new failure (last pass: renesas-devel-2023-07-11-v6.5-rc1) =

 =20
