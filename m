Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27B517B54AF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Oct 2023 16:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237474AbjJBOFK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Oct 2023 10:05:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237469AbjJBOFK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Oct 2023 10:05:10 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0CC3D7
        for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Oct 2023 07:05:06 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3af64a4c97eso2466613b6e.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Oct 2023 07:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1696255505; x=1696860305; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s4a7IJsLBq2Yf23strgqWm6X9C9GhQHuLYOdMBOqt/g=;
        b=xB+ENd4MGVnM9o42Jqi6RqOfymiOXR32GU+Qf5K81jzShvCkoeyrZ09Zi8RuyNfSz6
         ub6/Ld9MwSubf/T68IvKDhls8R9tXSRS4eCEuILKG7tZS84ShmGdFi6njZ3Fu9JQmBbU
         2V3Vdbwm7OF9QsSr/OdQn0nnvnBnPSDOoKrbSKNTzCz/4NouwfJO6u9H/09MWvdhMlfC
         KtCC91rbZ/qnJaW/vXOr6WLxLkZYgp2EgE70+oX6g2nG7lnD/r+HUbIBB3wDOvXfkrwm
         PxdRLQCdPmfv/FNktVIjWSZOSD6NJXoimkPUgsClRaw0RWuVoVuhJkuPNXX9+PXnEMrl
         OGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696255505; x=1696860305;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s4a7IJsLBq2Yf23strgqWm6X9C9GhQHuLYOdMBOqt/g=;
        b=kusoYJWeujJ6LvF+kRGa18ld0eQftNz710V44R4XHsUeKo+yXioXPdvrs1+RBZpmOX
         bsc8z14lwDKFgXcg08/N9LcViW8lcJ/7bniOR63LBzAFwXOSSAe5IzQwIiNEoe6JAIKq
         ZoL9/ZwEirYZYNWIAi9KRGmMuEVilkVbxrt7Yh6/xmI5gmX6zMO2YjNVPXf3OdwXu00I
         KgUSSuyCObDkt6mJzRbuwTzWiJm0OELf2TnLNmqKo42IhWhQBbOkm9FLmoZpj7yle+Qa
         bwAdpQUT3CPHTBOxj1nj8bJoJQoBx94ftuSknysj+VjHHZLT1AsRHcaxXunELaI10XMc
         5QmA==
X-Gm-Message-State: AOJu0YyBhLNmluTYQs1Ia/6DQLM1RneVEHIXeoDzkINMjoBhV5N2f+Vl
        OzGtid7fkk+WOG0QDQzAxuVxY355czEp1JefMXQqPw==
X-Google-Smtp-Source: AGHT+IFuLVi1GA+Nu3/9Yt4hPudrRW1g+icuBY9f6je853SzVGaIxcyqBABdBZhqcHgJ0PijL/V0mw==
X-Received: by 2002:a05:6808:1582:b0:3ad:f8a7:1485 with SMTP id t2-20020a056808158200b003adf8a71485mr12902543oiw.18.1696255505050;
        Mon, 02 Oct 2023 07:05:05 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id bt20-20020a632914000000b0058901200bbbsm2477442pgb.40.2023.10.02.07.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 07:05:03 -0700 (PDT)
Message-ID: <651ace0f.630a0220.657f1.45fe@mx.google.com>
Date:   Mon, 02 Oct 2023 07:05:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-10-02-v6.6-rc4
X-Kernelci-Report-Type: test
Subject: renesas/master ltp-ipc: 6 runs,
 1 regressions (renesas-devel-2023-10-02-v6.6-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master ltp-ipc: 6 runs, 1 regressions (renesas-devel-2023-10-02-v6.=
6-rc4)

Regressions Summary
-------------------

platform                 | arch  | lab     | compiler | defconfig | regress=
ions
-------------------------+-------+---------+----------+-----------+--------=
----
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-10   | defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-10-02-v6.6-rc4/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-10-02-v6.6-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      e7f4ce54899fc69930f8d28194311678b5e3d64b

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


  Details:     https://kernelci.org/test/plan/id/651ac45aa95fb7b62f8a0a5c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-02-v6.6-rc4/arm64/defconfig/gcc-10/lab-cip/ltp-ipc-r8a774a1-hihope-r=
zg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-02-v6.6-rc4/arm64/defconfig/gcc-10/lab-cip/ltp-ipc-r8a774a1-hihope-r=
zg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20230623.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/651ac45aa95fb7b62f8a0a=
5d
        failing since 5 days (last pass: renesas-devel-2023-06-05-v6.4-rc5,=
 first fail: renesas-devel-2023-09-27-v6.6-rc3) =

 =20
