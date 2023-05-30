Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1291715D44
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 May 2023 13:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbjE3Lbn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 May 2023 07:31:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231387AbjE3Lbm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 May 2023 07:31:42 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BCE010D
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 04:31:37 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-51b4ef5378bso3801084a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 04:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1685446296; x=1688038296;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dASwW71x/cK+0q/yj8Jpx/YvcbuBUe/MraPBh6/Cz/A=;
        b=rqslGAn++MuGB08MlRrcvFnzP1sCmAq8rW63RjBtfnqQ12BZYqocnTyKnemdI5EQaT
         fw/q4HOIgMGa1zXTw93OQYiIvc8actpq09Mxw0Hh/hVweiwzkXN7jqao2JqoVb2AmhXT
         Ao26yM3MbBGZLbeJAj6v+7NX5d9gB+hxkAH6U+eqz9JkaYdri0I5hMVI1/nnOJVvyDv1
         4J8k9Oir7ymUcSh1nQwG1etLHkZp2k8qqaxQWGdDjbgtefT7Q2YtshMhbpcKXo6QZaug
         SkCvFKE7jGjozEwTQBIHbgJ6tCz6m02N07cmaORZ5UiwbBsvf9Mw2yRaWysSQOKJVRgB
         LawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685446296; x=1688038296;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dASwW71x/cK+0q/yj8Jpx/YvcbuBUe/MraPBh6/Cz/A=;
        b=QmGQBaRw8EO4MvUCnQZXWMAF1NXssarxxYUjViQL7Rv2PJJ7bSqW8QMdwYg5061Wh6
         1G6Ivk2bw++e8X3yn31RFAt1Mu1nvVPuYLE+WqmQdpB8SpkUbntPohlamui8grYyEwXK
         JewmTtG51BsGYlWiATVOnkJ/JE5zC6UqQChKFLz0KFU8wRBcwi1WD7s5by8YP0iqPQTA
         BlP2rgPd2Xnb/Hg0cAgaT+tGj9TCu4NFS5Hw3ijGx7pDWEQm1keODvi1W+jkMkkdPZtm
         w4BrRgc7+E30VI2ZGfeXfSzI5SBFgK9zusppXkqeMLWjPBCy8+NNO0XgmrS2zWSgePlz
         RVcA==
X-Gm-Message-State: AC+VfDzZ0bDhR952I8FLD23655qgQHoSnhP6/sAC0F0t76kDOjgNOs6b
        dTkGA4hhwUM21vc1ewEwK7eG4wjarEvY1C8FY7w0Lg==
X-Google-Smtp-Source: ACHHUZ77CdrIJRM61mWMT3WvzKL1o89/qqxVcHtARXwQ2KcF0pUSeahL1E0vKD0aiQBcQ+FoedNYzQ==
X-Received: by 2002:a17:902:ce91:b0:1aa:d545:462e with SMTP id f17-20020a170902ce9100b001aad545462emr2361397plg.13.1685446296082;
        Tue, 30 May 2023 04:31:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t8-20020a170902b20800b001ae0a4b1d3fsm10049170plr.153.2023.05.30.04.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 04:31:34 -0700 (PDT)
Message-ID: <6475de96.170a0220.57b7d.25bf@mx.google.com>
Date:   Tue, 30 May 2023 04:31:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-05-30-v6.4-rc4
X-Kernelci-Report-Type: test
Subject: renesas/master usb: 2 runs,
 1 regressions (renesas-devel-2023-05-30-v6.4-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,TVD_SPACE_RATIO,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master usb: 2 runs, 1 regressions (renesas-devel-2023-05-30-v6.4-rc=
4)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-05-30-v6.4-rc4/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-05-30-v6.4-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      520bf28625c74fdd976c6c37fb519ccad1cef65b =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6475cbf2319dc1814a2e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/us=
b-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/us=
b-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/rootfs.cpio.gz =



  * usb.login: https://kernelci.org/test/case/id/6475cbf2319dc1814a2e85e7
        new failure (last pass: renesas-devel-2023-05-22-v6.4-rc3) =

 =20
