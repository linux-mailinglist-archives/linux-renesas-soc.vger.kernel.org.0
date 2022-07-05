Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A915566A30
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jul 2022 13:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232527AbiGELv5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jul 2022 07:51:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231634AbiGELv4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jul 2022 07:51:56 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C446B17A86
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Jul 2022 04:51:55 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id r6so6958458pfq.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Jul 2022 04:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Od/FAqv8aRf3OK28VHyYiAykoSzavSxxkTefDIrcpvU=;
        b=T+ECchx3fR/9nBdK/N45tJ2YwbQ0wQYJaql4miUi2we38DqJpl8E0yeGisORpAZtwo
         SWcMtENAFCPm+wC2TaKmOr3khaeo1dymME3ugC6QNZZS2Y7e/yL9uGvorwS07M9Jxqtd
         HxfcGpT35caUdQsAj6kg6O0Wn6RbCon4QyVLTFCPFUfAzvs9+Sq4mMFeYvrpZ2Jt9w+7
         o15XSmoMbu2BlqaGk/LzE7MyFuKE7+0lqJhBjWG0QJu8aDwyF0uYcvG8eCQ6HUoAmacO
         2H3HUR0t+HtciZLUlG/uRG0wEHMPb0Yb49haeWH138L2ceGpM27154Y/T+vpCIzXhcDO
         Q9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Od/FAqv8aRf3OK28VHyYiAykoSzavSxxkTefDIrcpvU=;
        b=Mmm6jAJ1cwiv9smDxIfGZLy3fw7GGMjAe3vTdQlCmerBFVg/6prGyTTqRVpJO3f5Ac
         PuoPjAk/USmBuzjsh1t9FrIkY1ZOM01uKJMhcHo7bPtwxdHT7ZKylQ/4ua+Qf4MxzJXj
         wVOhKrEJdxpkBmt4MM/QFHcnmKLphRaXQYIKXwFnlF49vBYn7IW6e9LNyoh0L+XZslvj
         Uoim3NNxcLLuvX4JaqtY3jWcaEIlbzn/SdN1rBQ746HFnj0E+MPXmS4yJl4/ay9nICb2
         lkcyu0lYJAWYgjhcds7D0hJEim949nGw9RXuAmCexquCKqc7jgTW+UDZ/E+DiZf4L1vD
         EU6w==
X-Gm-Message-State: AJIora/usZ06oMJSg0hHA8xqvfjMXiYAWOXjKDSDWQShOOaPYdLcBPV+
        rhrsMY6u6W6JpSXkx35uphSzi5MlxHTAQip/
X-Google-Smtp-Source: AGRyM1uFsLRdHbmvItRKsSOsdjJJJGgZnQxIoFa97BRNOImFpCqHfoesS3reSTaMQvqD6XvwUqSjmQ==
X-Received: by 2002:a63:8441:0:b0:40d:34a3:b7ce with SMTP id k62-20020a638441000000b0040d34a3b7cemr30192582pgd.292.1657021915163;
        Tue, 05 Jul 2022 04:51:55 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id cd24-20020a056a00421800b005259341029asm19611779pfb.49.2022.07.05.04.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 04:51:54 -0700 (PDT)
Message-ID: <62c425da.1c69fb81.9b7db.ba22@mx.google.com>
Date:   Tue, 05 Jul 2022 04:51:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-07-05-v5.19-rc1
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next usb: 4 runs,
 2 regressions (renesas-next-2022-07-05-v5.19-rc1)
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

renesas/next usb: 4 runs, 2 regressions (renesas-next-2022-07-05-v5.19-rc1)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =

tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-07-05-v5.19-rc1/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-07-05-v5.19-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b7d295b5ef2e2985496b2a3b9c4594189db6bbb0 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/62c42513b72c5aec90a39c2e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-05-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-rk3288-vey=
ron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-05-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-rk3288-vey=
ron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/rootfs.cpio.gz =



  * usb.login: https://kernelci.org/test/case/id/62c42513b72c5aec90a39c2f
        failing since 27 days (last pass: renesas-next-2022-05-05-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/62c4223134c658aec6a39bf0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-05-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-tegra124-n=
yan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-05-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-tegra124-n=
yan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/rootfs.cpio.gz =



  * usb.login: https://kernelci.org/test/case/id/62c4223134c658aec6a39bf1
        failing since 27 days (last pass: renesas-next-2022-05-05-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =20
