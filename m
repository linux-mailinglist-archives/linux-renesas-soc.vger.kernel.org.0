Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E54356699B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jul 2022 13:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbiGELeH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jul 2022 07:34:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiGELeG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jul 2022 07:34:06 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DD97167D4
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Jul 2022 04:34:01 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id o15so7396421pjh.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Jul 2022 04:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=3kOkmcFS21RKal+dSwZUdiQ89jEGQ/K55ae/EQ9eDN8=;
        b=JoPUMsjSknYmLm+Jh8Pf+0LhB5Sfp8Iw54aQGdwkzebp3tCpivvkZcgu5WXo/uMvxj
         Ewwfq8ivqPMpAUFoddR/IFB+SUNbamVK1mCpvg9GbUOIkZZOZcSrlFIAeey1yzm5vbV6
         HdEzrIGNIND0aqdjWPMLt5NO1D5chC62UaO5C6xYrYxuM0Z2DFQDAF3CwZIMlVpRdns9
         HuiUAWCn2uRNwDb4H25NTRNJKl98sje1GvPEV8sovemCH+HwUG477EEc3on2vKccrmQU
         1xFqLP2QFSBxryUBLKLPfWz6KR5cIS0M4M4Qjpf6tni4zcaHTbUT5IjdU6wp6m9pfcJN
         x9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=3kOkmcFS21RKal+dSwZUdiQ89jEGQ/K55ae/EQ9eDN8=;
        b=iTrFyeTiKn8dPxNqhMvA9fNnNssDnh/HyNJOq1lSoJR7j5YfpMg2jbrsGuVb7FgaHF
         5/M6E6cWaK9tPDlmrp9QU8Qi6XbLrPQQgKq0RMHfaWcGcgMZpprDRjxH7RPMp5xSUn1J
         hj8bwaqy2aCXelJhJ30SwWqeYPfhM0thT94RLmsT4v4goZrZJTQpb5C22wSnO9aLtyyh
         buNK4sbuIEUxa7mlHG0lWcD+KWUX7wRhuGR0TGmZC6+4TfZVhm/L6+mMGsHh3gzfii2o
         Lg9iIWhcYYKYbHXgT/xmc1x6D3cSNWaSEaz1BPmhJQ6JJZXqDcyNF3X1jlRgQPW+ZUPU
         fGJg==
X-Gm-Message-State: AJIora/pqcwBY1y9H7PR3/o6/P7JY1pJQW8fTavUJIOUQzlY1RYCGPzb
        wvKmQa3BYg61Oo3MUibK5+VVvC3oUisywxq1
X-Google-Smtp-Source: AGRyM1teQkKB/u8ziG6cVKYKVtgkoM5+wfhQxALOf8+7X8iVnZT2WlZPyaybrnHb9est9SmMgiSS3w==
X-Received: by 2002:a17:90a:1943:b0:1ef:8146:f32f with SMTP id 3-20020a17090a194300b001ef8146f32fmr16099285pjh.112.1657020839997;
        Tue, 05 Jul 2022 04:33:59 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a2-20020a170902ee8200b0016bf185d234sm1484410pld.2.2022.07.05.04.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 04:33:05 -0700 (PDT)
Message-ID: <62c42171.1c69fb81.8d3fe.25e0@mx.google.com>
Date:   Tue, 05 Jul 2022 04:33:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-07-05-v5.19-rc5
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master sleep: 7 runs,
 2 regressions (renesas-devel-2022-07-05-v5.19-rc5)
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

renesas/master sleep: 7 runs, 2 regressions (renesas-devel-2022-07-05-v5.19=
-rc5)

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


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-07-05-v5.19-rc5/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-07-05-v5.19-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b83d3c70c208b5154097ddfcf4be9a802b12966e =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/62c40e85ac9e3f3980a39bf8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk328=
8-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk328=
8-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/62c40e85ac9e3f3980a39bf9
        failing since 0 day (last pass: renesas-devel-2022-06-29-v5.19-rc4,=
 first fail: renesas-devel-2022-07-04-v5.19-rc5) =

 =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/62c4157808846f0c2ea39bf6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-tegra=
124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-tegra=
124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/62c4157808846f0c2ea39bf7
        failing since 42 days (last pass: renesas-devel-2022-05-17-v5.18-rc=
7, first fail: renesas-devel-2022-05-23-v5.18) =

 =20
