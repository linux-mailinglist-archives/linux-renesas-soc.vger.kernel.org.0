Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 285FE57EAB0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 Jul 2022 02:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbiGWAlv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Jul 2022 20:41:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbiGWAlu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Jul 2022 20:41:50 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD6272710
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Jul 2022 17:41:49 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id o12so5722522pfp.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Jul 2022 17:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=odVpD3NKa+kg83P2IfNqjKphN3MX78eOSbfLabz6ivI=;
        b=HQrJMb1/b4VvBvxkC8a7ydDWjrSmoHNhfDU9i4leePIKlUpehaJNLRFYRM4H1wo/2n
         IQGLlID94nlSsFOQiuz68/djJ/a8I4oFkb+3Vvp2NWAAEsHctf5OfQHGNFo6y0O9g3nn
         p9ZQ/+qUa1Tkr8+HyXgxejxXF6ukS5/iPx5sO6wcRAlY1G0W/mnwNcqRjDKs63fSpN6M
         SZeic2GoL2fSqMGKtN+N6pKvwRxFicpek7tySqjsZzQaxwVZ2JvpKJ3Vy03gH64yTFzF
         fJcVf9DT2Tekox9eq23ir1ArOce+G+699ZqCqchFQJKJuEtlILnCyZURs+AoaTeGJ14V
         gq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=odVpD3NKa+kg83P2IfNqjKphN3MX78eOSbfLabz6ivI=;
        b=GzzXlK3VgBWXnVOgXSgUMmaRSHZ8s1b9sy68kY6KSHCncxh5CH/RNLVC3pCKHUH40V
         zVB+WGPO4tY2rMHU4kFRPPh9dTcGUOGZxrc2csf6rKDvcZsV3p7behZkCcMr3mNEKDzb
         uIw4NE/InP2P9i8MifAW6wo+ZtIFQv4wR+StyZ0TjWknHkLm4mEAxj7FVS2YJzMkZDlh
         BRx9unMR2QH36GmNFjbSM5CpSfPX1SybdnkPh2GdSi4N4tKKeRBIgwmh2QeZUma/5aBu
         QH4FsH5rDZsPKLCIiCcadzC9tcd++B8gXNK8oEnb9AHOh3E5ZzU+SkEGrCxykPHjcfdA
         9PsA==
X-Gm-Message-State: AJIora+XJCOl3kPLXAY2AZKnxzTg4/ruKX2kIvXppwrp1vOX0hsSM3cW
        nECPH9oeZkxz2FIXe42mpnVz0dQmXVNU7NpD
X-Google-Smtp-Source: AGRyM1t/uFEQwZpPX82q4Y5aTG72vO4DM5lcBykfyUB5RgrxHzkfL7k9SUbjuYWlu4N7e1S8GMUjjQ==
X-Received: by 2002:a05:6a00:168e:b0:52b:b62e:ad73 with SMTP id k14-20020a056a00168e00b0052bb62ead73mr2497722pfc.56.1658536909271;
        Fri, 22 Jul 2022 17:41:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i6-20020a17090332c600b0016c0593876csm4429236plr.157.2022.07.22.17.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 17:41:49 -0700 (PDT)
Message-ID: <62db43cd.1c69fb81.c7711.7581@mx.google.com>
Date:   Fri, 22 Jul 2022 17:41:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-07-22-v5.19-rc7
Subject: renesas/master ltp-ipc: 18 runs,
 1 regressions (renesas-devel-2022-07-22-v5.19-rc7)
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

renesas/master ltp-ipc: 18 runs, 1 regressions (renesas-devel-2022-07-22-v5=
.19-rc7)

Regressions Summary
-------------------

platform         | arch | lab     | compiler | defconfig              | reg=
ressions
-----------------+------+---------+----------+------------------------+----=
--------
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig+ima | 1  =
        =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-07-22-v5.19-rc7/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-07-22-v5.19-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      3ddd67eca4592c2e96f8aa938195d645d1f8324b

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  bda92ad659a52d38ac810099f69adff626b064c6 =



Test Regressions
---------------- =



platform         | arch | lab     | compiler | defconfig              | reg=
ressions
-----------------+------+---------+----------+------------------------+----=
--------
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig+ima | 1  =
        =


  Details:     https://kernelci.org/test/plan/id/62db3b6d9c0a61a539daf076

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm/multi_v7_defconfig+ima/gcc-10/lab-cip/ltp-ipc-beagl=
ebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm/multi_v7_defconfig+ima/gcc-10/lab-cip/ltp-ipc-beagl=
ebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20220716.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/62db3b6d9c0a61a539daf0=
77
        new failure (last pass: renesas-devel-2022-07-19-v5.19-rc7) =

 =20
