Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FFCD67D881
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jan 2023 23:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232324AbjAZWfp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Jan 2023 17:35:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbjAZWfp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 17:35:45 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 207CA62240
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 14:35:06 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id 5so3228428plo.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 14:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1yY8xFMviaybBZbR6LUXwM7erkIP07dc7kLH/Cf89gI=;
        b=kZwSLpKLV6Xl0H9B8H4V63RERLtlKifQlpRwEzh04USMS5V9n2/P0QB1zVcYNgl3O2
         kc9G/Dy9FBIn/Qge3gugq86dP2w47nwrLsiMi7Oni0px/+fqc+HzRUZ/ws3mWS32z4/U
         auL3VtagAp9xjL1nSeBHzDnyvGgzhu9d5PaZPIpi0lEz1IUQIgb+iYpAYJd4xrhQ+xcq
         etZtQP25Bg5YCxLLHV9EHQxgL8R3JAgFLHuFWGmOfMq346Ol/3BrwTj6H67ShF1n6Xf/
         AclI7buVeeZSt//pMopTFBgNc7LZI86I0i1Tk2/2nOnOVhGZxRocU4J9TfgNukfGChfK
         tCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1yY8xFMviaybBZbR6LUXwM7erkIP07dc7kLH/Cf89gI=;
        b=nS2HxKICSau+A+NWbNtOmOjqZo8US59zGQl9scTlDGm++YBfTZu3dLu4mu6RJbH0V2
         3aAYAdxTPDdtCAyv4SVE9pxKIBr/KJz8aN7hhKtqc0/k+J+6EiXm6det06RQC7vEx/l/
         8hf2mIJPEyJLfwdvO6O+CCFPqDgOnrpBZd5AFXN0ZOQNe10rABQ02PrBvlVo1gxc78do
         w++Yf14KYe8pYqg5/K/++wMat8SNxQU1YBIsUsHop7rU9eZL4w4hG/o7tkSMYfPy/hPZ
         FUUSkBmbpMl1Goge+Of7mlZxgpo7WIa5dXWYpRsvz91tOWj3yV8uoLRq5vCsDR/dszwL
         TuVA==
X-Gm-Message-State: AO0yUKXkvOqjs3mMBqqGbUXJNR3APixV/A2GnL/q04BTM6xJnFYS00/n
        l9I93I2CwKqrOXOMhgMAbZoLfUEoJiKOIe0JkzGXIA==
X-Google-Smtp-Source: AK7set/j7IFQt3wEHTLP8meUTdvUlETEGAA9tFhodvd+3fRjApoBiVntR2KndkCGARf+XO/1M6NftQ==
X-Received: by 2002:a17:902:ec85:b0:196:cf1:c958 with SMTP id x5-20020a170902ec8500b001960cf1c958mr15458258plg.30.1674772485175;
        Thu, 26 Jan 2023 14:34:45 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u17-20020a170902e5d100b001754fa42065sm1459674plf.143.2023.01.26.14.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 14:34:44 -0800 (PST)
Message-ID: <63d30004.170a0220.8ca99.28ea@mx.google.com>
Date:   Thu, 26 Jan 2023 14:34:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2023-01-26-v6.2-rc5
X-Kernelci-Report-Type: test
Subject: renesas/master usb: 4 runs,
 1 regressions (renesas-devel-2023-01-26-v6.2-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,TVD_SPACE_RATIO
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master usb: 4 runs, 1 regressions (renesas-devel-2023-01-26-v6.2-rc=
5)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-01-26-v6.2-rc5/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-01-26-v6.2-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      635b2020aa8744f7174ce492c342357cb34c9e86 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63d2ed2965d422ea7c915edf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/us=
b-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/us=
b-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/rootfs.cpio.gz =



  * usb.login: https://kernelci.org/test/case/id/63d2ed2965d422ea7c915ee0
        new failure (last pass: renesas-devel-2023-01-24-v6.2-rc5) =

 =20
