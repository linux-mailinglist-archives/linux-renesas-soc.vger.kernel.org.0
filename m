Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5A34528A54
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 May 2022 18:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231895AbiEPQ2u (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 May 2022 12:28:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237865AbiEPQ2q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 May 2022 12:28:46 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C33E83B012
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 May 2022 09:28:45 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id l14so4047164pjk.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 May 2022 09:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=tb1GVFtqkOsq5nmQwHe5FPk8Dec/PcviVGq8X1vUY3Q=;
        b=xlgUKLjHx62yA4WGNkDDFkZYlPi3an7dQOe/A1OIzLcsANNzjaPMZ0Ifs0Jp/zDun/
         pjCUhNzkpNFKXpn3YftgnnTZD5NyNpRX5P2P7TRg9LRu+T0USPldK0odexlDVb2dAlBJ
         RgBZha8IruS2JQpdUUg4yDTU4yYkTmpE55dYrma841sOU+DDMwMbe+IXrXP7I5lxFU+A
         NWUdcL4Cj7BumAgncgYLu/33igf4M1MYfoiezqUOD1Ornh3dt3cZRXz5+Kiow5OE/8xu
         pKVWAcYZvxGNgrSkNNSiIRTwkCI1pTPJldSjEzRrV/NIMxN/x5/q5V+Kkc3VpLL4ackO
         1qAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=tb1GVFtqkOsq5nmQwHe5FPk8Dec/PcviVGq8X1vUY3Q=;
        b=w6X8ewliwGo28wn84XoWiIyAHyRnDsT59jtuwOeWHyUauu7ajPTfQijT25qOzTCOsR
         tMU5Pn3ckNcr69pXJPGoVRBHOT3CX9wdSBX2RmrNbEGK4Fy7c7OHIlXMRClztca0yU77
         Hexfgn/K8FM9PzbxIpxkgFZE/WnmVR21ERxexKIEDtamJpX6jQBk9fHHEmQKiz5qDEF0
         lC3kRSlcrhZ/lSH6U0Biqi/ofsnksBDwu01zHBr+gWNTn48qjdTf3Vl6HfDdHc5qZcye
         DCNZwVcFeOryWOgFClz5iCP2T2w8Wo3dGVrAw4IXemBJYFyhPhbgL9vK6fDNsnz97EwU
         rkQw==
X-Gm-Message-State: AOAM533++lcFKrRxExLsjboBDoFXAmyYEU4G6umxbq1La33y/sH369pU
        MrmvaQ4z/Wdc6sB/PQXkGgXXerLDc3sRp0gG1M4=
X-Google-Smtp-Source: ABdhPJzyg3fA76138F4uHas3Wp+H+1lIaCNfJqF7AotL9POucSjGgVVjr2sqyfcdAQ6n5cu4Zp1aJw==
X-Received: by 2002:a17:902:bd83:b0:15f:a13:dfd8 with SMTP id q3-20020a170902bd8300b0015f0a13dfd8mr18277630pls.87.1652718525201;
        Mon, 16 May 2022 09:28:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w18-20020a62c712000000b0050dc7628166sm7089406pfg.64.2022.05.16.09.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 09:28:44 -0700 (PDT)
Message-ID: <62827bbc.1c69fb81.fbcb0.166e@mx.google.com>
Date:   Mon, 16 May 2022 09:28:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-05-16-v5.18-rc7
Subject: renesas/master ltp-ipc: 10 runs,
 1 regressions (renesas-devel-2022-05-16-v5.18-rc7)
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

renesas/master ltp-ipc: 10 runs, 1 regressions (renesas-devel-2022-05-16-v5=
.18-rc7)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-05-16-v5.18-rc7/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-05-16-v5.18-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f35c24489921b1d4963dbb55053b97fb0e53f471

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


  Details:     https://kernelci.org/test/plan/id/62826db60f21e5385e8f5753

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-16-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/l=
tp-ipc-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-16-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/l=
tp-ipc-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20220513.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/62826db60f21e5385e8f57=
54
        new failure (last pass: renesas-devel-2022-05-09-v5.18-rc6) =

 =20
