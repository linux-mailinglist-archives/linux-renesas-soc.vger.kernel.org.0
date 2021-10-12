Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3EA42AADA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Oct 2021 19:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbhJLRf2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Oct 2021 13:35:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbhJLRf1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Oct 2021 13:35:27 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0DADC061570
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 10:33:25 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id ls18-20020a17090b351200b001a00250584aso2417039pjb.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 10:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=v1HZKIbF73EO4nA9BfAzy1cGT+KT+Du6zdgLaRK+Q68=;
        b=QDF+lt+VWQbbo0zlDzdG7s2msQrV0Th3muOVyzM2gSufSG+i36ZU4vSQ2gIz9nAMjm
         zmdJP7hVGQ5PBMax1sMuklumWx4yzf4uTRNgRhOttRzrSDHN16mfWbOIWs1PyIM58D9W
         quCFRS3rfMZpbpWwvMMHLGkPWzv0JC90brgY5+CRAz9kv2w7FvXlnohE2RLy/nWxRU7M
         zBydpCaweeEgMWupaCmH6iQiOglxRp3X0fIjyezsAeqY4tgHiEe7uXhj4jwBtkhP3XDv
         zRNY9FOmgXAgKVOjcc5yJlDYFmCVdovaX2+q5KjD/XIsZuSDnlTNfMzVSEr1JUuij6xA
         jo4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=v1HZKIbF73EO4nA9BfAzy1cGT+KT+Du6zdgLaRK+Q68=;
        b=q5bfCbTu6K8RqUPbQDIP1iJKlesie8e359J+5ij/gSGhqQ4tjZfZEJbKrLtGxTIQTS
         c9SOdWzHmL3E+r7hmqoWp0PGP5Y4c7OfT6UFN1SqUfsclsO82a63e9+uGGxUPEVJbw1J
         tB0SvEjfvVjz/v0fFWQAGtE1tUxbJsBpxFG1oeYih07lOUPEREuRjP/KSpjZNdLBGVke
         H4mc5scoGIEdDS3RIWMgNMRT2CPmHTMw3d9wlzgglMgjB1tC7d6rJSWU7tbvanbeH0F+
         Sv9LKLz8dekEnD/l1S6QMDCVpUhYLiEkGsABMz0PwydfTQ3MagftMfHm3dr/ao7miJdY
         Nlgw==
X-Gm-Message-State: AOAM531VBR2ftprMhmLpa/H3EFv9U9noOzL5aVrTdgQDeo7+p5DmPIil
        Y/0DljhWwKi0OWrzc+liLBOJ8XPubNBr5aT/
X-Google-Smtp-Source: ABdhPJxSgmYY4icKkKGq3MIGqEU4ukL9fonnXHQUIJNkRSJnABfm5Ua3a5tzlvw50Z4n1yHG9mFJoQ==
X-Received: by 2002:a17:90b:3b52:: with SMTP id ot18mr7526612pjb.245.1634060005271;
        Tue, 12 Oct 2021 10:33:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t2sm3386975pjo.4.2021.10.12.10.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 10:33:25 -0700 (PDT)
Message-ID: <6165c6e5.1c69fb81.f68d7.a351@mx.google.com>
Date:   Tue, 12 Oct 2021 10:33:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-10-11-v5.15-rc5
Subject: renesas/master ltp-ipc: 2 runs,
 1 regressions (renesas-devel-2021-10-11-v5.15-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master ltp-ipc: 2 runs, 1 regressions (renesas-devel-2021-10-11-v5.=
15-rc5)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE_=
BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-10-11-v5.15-rc5/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-10-11-v5.15-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6e602e69ec04a3e0887e4fd9189250b4e7ee7e23

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  9ce71152bf21e410c471fd8d7ca43a06abbe7c54 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE_=
BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6165b5c0784ee58d1808fb31

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/ltp-ipc-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/ltp-ipc-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20211008.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/6165b5c0784ee58d1808fb=
32
        failing since 20 days (last pass: renesas-devel-2021-08-23-v5.14-rc=
7, first fail: renesas-devel-2021-09-20-v5.15-rc2) =

 =20
