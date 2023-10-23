Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B6617D301B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Oct 2023 12:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbjJWKjG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Oct 2023 06:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbjJWKjF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Oct 2023 06:39:05 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ABA6B6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Oct 2023 03:39:03 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-27d129e2e7cso2157187a91.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Oct 2023 03:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1698057542; x=1698662342; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gN8Sc0h7mxsP4wXuSlVNc0x7rYlIpCA3QUqtVP3mRtY=;
        b=TjoM+4WaPd/PEeTdKHaA6uLKUmWCWJNG8He8gUwuvorB1AQimeDBb+hYHjlsZ8xLL9
         1ay8OU9GrjolDxLNUYuFF2rZHP2FU6Ur3eXZvABOJaeNbtLnoBTLoWDTMb9THTLxD7ci
         1DTNcW4qsCo7HGKY8Wfm3vuV3lt6WteqZprXvXHQsY9Glk8Fp9D7nyr7gQiCy3booqfd
         zgSZaNwPRSiQO1SwVJMLPy+nFYWXNbnKhxQkdbTH5VVKY+/vRO2ndtLVBWq9xGrhMGmH
         9s27M08T7Fu0WY2ukHcw2lamFNx+H4y3oSAItGY81W1WWWCPctoEowrF7/UsXE25tXE+
         mIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698057542; x=1698662342;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gN8Sc0h7mxsP4wXuSlVNc0x7rYlIpCA3QUqtVP3mRtY=;
        b=GcO8WofU/RbrHIryAFPVRM1uiVAJT+GCN/5Ye+oK8H5h0yzKPgrnFVR2jhefMxfRGy
         3t/Zign9pVh+42WWN8hp1oaBapfB+nPmOz6/0MSjZVdkilV2LC8T7LN3z/+nYO4cXhCF
         I+X+d9yUL91gcPDNwmF5hFO3ykFhjS1+/cgGqJTyzBszoiJgyVftxeIsqwerWABGaPyQ
         pKsW7FjsyNYDtuvce7VNhJOjW+129E5kZ7twoQrclxivg9Qd88uFDYr+1HYw2cKMN2zv
         aItKSvhvJJ/rQz/JDRtKHaszlrkwZezoSNaB+Igij1V4uNpQ7q8ntskjRqzn1BZKNM/1
         biyA==
X-Gm-Message-State: AOJu0YyVTP1PtePrwjbUNRwaMxfF1Mom7AsquPBNEM5UUUspoVdaM5xU
        2eyJHJq9NLQE2d9ffBS2L3wcRNR8W89jEKp75b1hew==
X-Google-Smtp-Source: AGHT+IEEzuNc8kfTrGdFCXDzeo9YGmcPAwKma/0gKTq+z0cKmOGnswVIKiSiNyDMc24VBu/p0jxeRQ==
X-Received: by 2002:a17:90a:7887:b0:274:6839:6a8c with SMTP id x7-20020a17090a788700b0027468396a8cmr6189822pjk.6.1698057542537;
        Mon, 23 Oct 2023 03:39:02 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id az7-20020a17090b028700b0027d157e686asm5270939pjb.49.2023.10.23.03.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 03:39:01 -0700 (PDT)
Message-ID: <65364d45.170a0220.deca6.e2a6@mx.google.com>
Date:   Mon, 23 Oct 2023 03:39:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2023-10-23-v6.6-rc7
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master ltp-ipc: 5 runs,
 1 regressions (renesas-devel-2023-10-23-v6.6-rc7)
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

renesas/master ltp-ipc: 5 runs, 1 regressions (renesas-devel-2023-10-23-v6.=
6-rc7)

Regressions Summary
-------------------

platform                 | arch  | lab     | compiler | defconfig | regress=
ions
-------------------------+-------+---------+----------+-----------+--------=
----
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-10   | defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-10-23-v6.6-rc7/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-10-23-v6.6-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      810ad90f451c3b5c359bdd01e1b029ee3e23a532

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  3f0b2176930cf15a26597e28abf4356050136bbe =



Test Regressions
---------------- =



platform                 | arch  | lab     | compiler | defconfig | regress=
ions
-------------------------+-------+---------+----------+-----------+--------=
----
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65364092f9c6ec0450efcef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-23-v6.6-rc7/arm64/defconfig/gcc-10/lab-cip/ltp-ipc-r8a774a1-hihope-r=
zg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-23-v6.6-rc7/arm64/defconfig/gcc-10/lab-cip/ltp-ipc-r8a774a1-hihope-r=
zg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20230623.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/65364092f9c6ec0450efce=
f4
        failing since 25 days (last pass: renesas-devel-2023-06-05-v6.4-rc5=
, first fail: renesas-devel-2023-09-27-v6.6-rc3) =

 =20
