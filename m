Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C557B4BEEA0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Feb 2022 02:14:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237346AbiBVAxJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Feb 2022 19:53:09 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234068AbiBVAxJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Feb 2022 19:53:09 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD5ED55AA
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Feb 2022 16:52:44 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id ck4-20020a17090afe0400b001bc64ee7d3cso833775pjb.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Feb 2022 16:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2NZ+JrqhRirDpAhmpw902lIR3GVXTEPy5lEcSqNLJHY=;
        b=PlOTv1cGIXo3RQJ68Ic/21FooSgLXKWGh+yWar/xKxQUetv4j8JY5CtIAa1A9g/CB6
         rm42L6iZ3jRe5X3jf0fRReOIqKdaKKAMVtg/R0dHs6cog3z3WcFfQOq+hInU90y+JM3C
         ZQ1Ce8YwAgEiDSoBsKlmTZLA4sPwebg5aMuFpGPCXzMDBLATqsFgVdA4nmQBJIqb4aOd
         r9LHfO7/fcTPlAc2/YePA/AaKVykE0a4SOnptr7tYKwInfECN38oJx1s9GZGutsURmCI
         Z1frZDd6FXmXvWFcEX0uaHmU7AmIgMHLO0BQ6bMMxOsFevup8CFBeES69NcbINuZrWRt
         3aPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2NZ+JrqhRirDpAhmpw902lIR3GVXTEPy5lEcSqNLJHY=;
        b=zBDGFwK1bCRCeUwO1f9oyjy1c8Tgg28INVH3Aqwy9G3jg80uYCXYGAwjZ4p3pli/xb
         KmuTGy4WROpQd7GUYrelcyHJVa8Pb6YmY27hANGgVOk8zbuiX8hcuEffnApt6HVVtwsH
         Dd3OUv/2pnhk2YFtqSwEUtYUbVLBLohZDXa7uZie1Bn+FXbI63zBGT3KR07rAvNgDR03
         iy1GLzbO9JyYclWLzkJxfeu7MzemG5/MbDwSC7nIJNZbFiwULYS/QccxeLOJnsDwr8FV
         GKRqi7T2wNBWZhDm6ojlJuIKCIbU+VUHLTBKVqW2lIuhpmvHguU11lQ9Q/+PK2vIjNvR
         2qSQ==
X-Gm-Message-State: AOAM531GEurkxAhNoo/dCP+b+6hIZhcusmQd9YwdEWU/D2Tfik2BCsNE
        kM2pvvUAyaROBVJKTat+xIdRmlZEVTCGVG6E
X-Google-Smtp-Source: ABdhPJz+40xIYbdY3Sf0ahSn6C/U7zdzMQWevbzKsj0nQvGEvmJAg/L5gA5qhYgcRVFATsEoHA2zEQ==
X-Received: by 2002:a17:90a:664b:b0:1bc:72df:54e4 with SMTP id f11-20020a17090a664b00b001bc72df54e4mr486720pjm.10.1645491164118;
        Mon, 21 Feb 2022 16:52:44 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k16sm14943049pfu.149.2022.02.21.16.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 16:52:43 -0800 (PST)
Message-ID: <621433db.1c69fb81.e8506.9e6d@mx.google.com>
Date:   Mon, 21 Feb 2022 16:52:43 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-02-21-v5.17-rc5
Subject: renesas/master baseline-nfs: 61 runs,
 1 regressions (renesas-devel-2022-02-21-v5.17-rc5)
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

renesas/master baseline-nfs: 61 runs, 1 regressions (renesas-devel-2022-02-=
21-v5.17-rc5)

Regressions Summary
-------------------

platform            | arch  | lab          | compiler | defconfig          =
          | regressions
--------------------+-------+--------------+----------+--------------------=
----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+CON...OMI=
ZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-02-21-v5.17-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-02-21-v5.17-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      0817e10d064bafaf1215d6e6d39576b9555cc568 =



Test Regressions
---------------- =



platform            | arch  | lab          | compiler | defconfig          =
          | regressions
--------------------+-------+--------------+----------+--------------------=
----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+CON...OMI=
ZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6214057632d4787c84c6297c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-21-v5.17-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ba=
ylibre/baseline-nfs-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-21-v5.17-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ba=
ylibre/baseline-nfs-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220218.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6214057632d4787c8=
4c6297d
        new failure (last pass: renesas-devel-2022-02-14-v5.17-rc4) =

 =20
