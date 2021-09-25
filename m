Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C00A6418122
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Sep 2021 12:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241034AbhIYK6Z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 25 Sep 2021 06:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233380AbhIYK6Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 25 Sep 2021 06:58:25 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F41E4C061570
        for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Sep 2021 03:56:50 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id k17so11168901pff.8
        for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Sep 2021 03:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Jihi9rSN/rTtBAzPODlo0PBl3PSOfE2AuKvwzsc0TwU=;
        b=U3wPeaaWk46Evj+aEP5XBo+/AdzwzpybY1qfa3kbFhVeemSk1GsKCPbuNS6W7emdtY
         7u/zbsgisjHixfum82Rw+emma+fFF/CZWOvK2DsfEoZ8CScn534wLA9B66KtiiSQTu7X
         Q4EPzsIDCvnJZ/zj7N0Zg7YTCEtATsn1JDsY0jbslO90cuYNovffP48lBVh/jlEqphW9
         gftX/CipXglqw44B+QTAfdu3A8WdYEt5SAudXyM/KDJ1xnnKdCzMo2u/iT67Qf6YJkZ8
         p+/YkQyzXOEx/o8QtrqEteuhIIjf+A8zYIXODGh6ncj4fJyNdJRScOj2Cbk280ZZs+IP
         Cixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Jihi9rSN/rTtBAzPODlo0PBl3PSOfE2AuKvwzsc0TwU=;
        b=MjpI1/jW6wSC0M0Md+kcfPxJqQo+vUP1E3DoRluLinb72+EopUFw/zuZNMldC4SveY
         lYumIcspGn0iFO1R66SFe1HaMaijeiwopO7iaEvEjZ1M/c3IaLSMoPP/zEReBnkhNojj
         8fflpHczaucxCc0wusXtReyC4Z0AbjzJ/VPmMcwVbffhCQyS1qD2ES1IOkPSSC+petiA
         f16tMTd+PwRkfI37iyNTXTqAoiaK2t2MLPWQfsxNk08rA1zqzDOh9oTjuesVNFRhHHMW
         2aJoPzzMiB3hRXrTckHBOnkJoUUaKkYI35VSCgUj9FucDgpJFr8gtC1mZLV7ppM/tDl4
         ppzg==
X-Gm-Message-State: AOAM5333KJSSr47YMBuUIwVLBkYwNhdg2TZ6065Xw0v+67355rHsau18
        9KrmcRx5OrvtfOsid65+7jvSF/y4FryIagF8
X-Google-Smtp-Source: ABdhPJzz0aWau0nnUr9DOIFqjgYKSucvCN2Y22xs1PZjmoJ9+CGEe7I7UhYlK6bTUr+lrJerW0hU5g==
X-Received: by 2002:a05:6a00:16c6:b029:32d:e190:9dd0 with SMTP id l6-20020a056a0016c6b029032de1909dd0mr14040372pfc.70.1632567410260;
        Sat, 25 Sep 2021 03:56:50 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f144sm11574901pfa.24.2021.09.25.03.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Sep 2021 03:56:50 -0700 (PDT)
Message-ID: <614f0072.1c69fb81.129b8.3b0a@mx.google.com>
Date:   Sat, 25 Sep 2021 03:56:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-09-24-v5.15-rc2
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master cros-ec: 5 runs,
 1 regressions (renesas-devel-2021-09-24-v5.15-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master cros-ec: 5 runs, 1 regressions (renesas-devel-2021-09-24-v5.=
15-rc2)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-09-24-v5.15-rc2/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-09-24-v5.15-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2c0b11dd6f8ce5c74e91b71a38505ae9088bf68c

  Test suite revisions:
    cros-ec-tests
      URL:  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/cros-ec-tests.git
      SHA:  86181a7fbd379fc42314c450740d2cea8cdf04c1 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/614ee56a2a6422ba9d99a2fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-24-v5.15-rc2/arm/multi_v7_defconfig/gcc-8/lab-collabora/cros-ec-rk32=
88-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-24-v5.15-rc2/arm/multi_v7_defconfig/gcc-8/lab-collabora/cros-ec-rk32=
88-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-cros=
-ec/20210913.0/armhf/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/614ee56a2a6422ba9d99a2=
fb
        failing since 11 days (last pass: renesas-devel-2021-08-23-v5.14-rc=
7, first fail: v5.15-rc1-564-ge23d26d2dc9a) =

 =20
