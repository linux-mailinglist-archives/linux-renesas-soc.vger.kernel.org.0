Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C166B611671
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Oct 2022 17:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229455AbiJ1P42 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Oct 2022 11:56:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbiJ1P41 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Oct 2022 11:56:27 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47F4B8C010
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Oct 2022 08:56:26 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id f193so5229342pgc.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Oct 2022 08:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AeH13w67ztufic8cVAe9ZRZiVmqV3zzfZdVFF+LgJlk=;
        b=1zYK7c+JRswEYdbn9rCmXsi5QSRX5gY6HN8+807VDsxln8OSWt0ZuC0AnYooaNySdE
         5LjJXAAUsV7/l94CYZyjmvbmTtFFRWl7nxWaB9RuXv7UkcrRagazXNzFFvyqi97aOoXl
         b7OsFIxWreqYrSQX5MobQ+t3DZ21X6EdlXCmAKQIvQr1BKDmrUOOPL2LoCXW/Bx3HZjE
         JepfhLSE5p/lo5kvqz5l//e0jPDSRuOYyqOlbqMMnyhH6V9ml/BJs0ZEnMsEsXO5YhCz
         tgGqlqtuSFbFWXUlEWpIGwDLr7o0zqfov8cT1hkkfY8MbvuhYOq0oPJJNu2HCokguyhT
         aXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AeH13w67ztufic8cVAe9ZRZiVmqV3zzfZdVFF+LgJlk=;
        b=hJgjd23ISjdmonNVp8d5deOJ38dlb87RSadJug7j1sYuHwM3bW0p1+iLD477j2p58t
         bAmd21OpSjki4qsQJdqNRB/zT9zuELHBeZwdNFCb3u24lEJcmnXLeKCM00va4iaX4Rzh
         4Vnegu3KKIzrffSQ71Qm0gXv8loAF4JpLqWP7fvkAxnJpTgtgFR/lEvotY15pdJVLqu8
         5xPhblLOpduupIwwdRO3aY4WTbKvuEu3aS2ZpEWhPodxoAEkmaONXbBKquoeGOj7qqCG
         6aXS9RxRwaZ/xa4xY7eij4Rexs8qSRz8AuZGVOb55fGs85EefdQeWeSipFe017RmAMoO
         TOjQ==
X-Gm-Message-State: ACrzQf39JkOYrH3R55EFcwVd1QTSPuTeiMxDZaDeKGJpy7mJTnVA3agx
        DXadr4lxWy2H3VeHW7RBW902gZIDI/IJlJbW
X-Google-Smtp-Source: AMsMyM5NC66XYst8OKgp0PTQgNg0cbc3u1HyCmtA6Kwj8GBD+ktFAIy18syiXZHreoQD7fGvTqUk9w==
X-Received: by 2002:a05:6a00:1acd:b0:56b:8181:d78d with SMTP id f13-20020a056a001acd00b0056b8181d78dmr34187606pfv.50.1666972585446;
        Fri, 28 Oct 2022 08:56:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l5-20020a17090a150500b001efa9e83927sm4408469pja.51.2022.10.28.08.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 08:56:25 -0700 (PDT)
Message-ID: <635bfba9.170a0220.e0601.9194@mx.google.com>
Date:   Fri, 28 Oct 2022 08:56:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-10-28-v6.1-rc2
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master v4l2-compliance on uvcvideo: 2 runs,
 1 regressions (renesas-devel-2022-10-28-v6.1-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master v4l2-compliance on uvcvideo: 2 runs, 1 regressions (renesas-=
devel-2022-10-28-v6.1-rc2)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-10-28-v6.1-rc2/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-10-28-v6.1-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      e3ee6a5b11b04ae5efa890cdfe9c94b77e36f136

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  f86484524f326bbf5c16d4bb485bfb8bd22cb6d0 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/635beb40979ce482e1e7db4e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-28-v6.1-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-28-v6.1-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-v4=
l2/20221024.1/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.login: https://kernelci.org/test/case/id/635beb4097=
9ce482e1e7db4f
        new failure (last pass: renesas-devel-2022-10-24-v6.1-rc2) =

 =20
