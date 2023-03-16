Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A89E56BD84D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Mar 2023 19:43:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbjCPSni (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Mar 2023 14:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjCPSni (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Mar 2023 14:43:38 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2C061BADC
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Mar 2023 11:43:36 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id k2so2760196pll.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Mar 2023 11:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678992216;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vNOie6kwcj7Z7SwuK3r19pQC8LTr9h0poSGgwGacKnU=;
        b=549e0O3hbdrs6RLspS9ZkJl0yxugErRU0zICeI65m4e1w10X67d+AHhjvG1hf3Oegy
         8DO60RAEpPYteaWFO8MFC1fK/T78G0CnnoNs8T7UkUu0L644LYqEPR8trpiLlkQQcgi/
         Y9LbfQD++mn/j0FS+xh7K9R1lonPeA9qy5o+uXQ9znK7B4W2Qmo0uQwU1ld034uCiT/v
         QUcfmcMSLE+zJLmWaarXwP9m7VgB6tZ1dEfRF7Y118MlyEM86MtJbBpaXXTTnInD9Yyl
         z+FqTGZr9RSiqtXIKIHSG1qJNhL/Jd3ozp/kwZnKR4CUy45wA++IBcgjoKxCJkxnARwV
         Wtzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678992216;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vNOie6kwcj7Z7SwuK3r19pQC8LTr9h0poSGgwGacKnU=;
        b=eAkFapE29DFI+GZe8q/IuyEbD4vUQ14owGFsUsl2fedZeWgwOQy5U+Ixid+AB441Fm
         NlWhtvqniwKOrBET5apN6NaIF+XHvpISCqgye1IMCZz8pXnFjAbG2G5lOuFPCXYtPegq
         yilM0oxFP8f7FRrecvECT2xKD09Eo2L9c0tBxzZ+Q+HsisuPShxMxpBSOhAX/ukaNUwt
         Jv0oGBxitttxLVftGYJCLk7yyeWA2IsbKRtFu1Ud58i/IAxnj0tl/udqW/O5hNq6mm05
         KGuOTfPcrMe6C3fM0fy2KBcqLqSvjHcjDCQdYZkZUt/fKK6w9WL6PxakXT+63rr43yMt
         qwkQ==
X-Gm-Message-State: AO0yUKW9mO4zXO/71uqLP0V8rqtlN+hU1la2P4W9GR6KPn9opFj2XJNF
        rC+7lcLCLx7kHAAb3tHbjlqjzhXBie2kfouWf45RFA==
X-Google-Smtp-Source: AK7set+vLcgJh1dNhNCI4vrwriK8VEhDfcc7GT97DBU1PDTLkCmCTI3YY7sI+SKvj/HO/wRHCTmAaA==
X-Received: by 2002:a17:902:d2cc:b0:19d:2542:96a4 with SMTP id n12-20020a170902d2cc00b0019d254296a4mr5930621plc.4.1678992215939;
        Thu, 16 Mar 2023 11:43:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902b28400b001a06b33923bsm32234plr.164.2023.03.16.11.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 11:43:35 -0700 (PDT)
Message-ID: <64136357.170a0220.38fd4.021d@mx.google.com>
Date:   Thu, 16 Mar 2023 11:43:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2023-03-16-v6.3-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next v4l2-compliance on uvcvideo: 4 runs,
 1 regressions (renesas-next-2023-03-16-v6.3-rc1)
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

renesas/next v4l2-compliance on uvcvideo: 4 runs, 1 regressions (renesas-ne=
xt-2023-03-16-v6.3-rc1)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
mt8192-asurada-spherion-r0 | arm64 | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-03-16-v6.3-rc1/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-03-16-v6.3-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      8184e7e383be876199a3be519c067b40143d8ab8

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  c7823a3f5f8846561d91e7ae77fea82fab63fff1 =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
mt8192-asurada-spherion-r0 | arm64 | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6413504cde88a5e1ed8c86de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-16-v6.3-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4l2-=
compliance-uvc-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-16-v6.3-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4l2-=
compliance-uvc-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-v4=
l2/20230303.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.login: https://kernelci.org/test/case/id/6413504cde=
88a5e1ed8c86df
        new failure (last pass: renesas-next-2023-03-06-v6.3-rc1) =

 =20
