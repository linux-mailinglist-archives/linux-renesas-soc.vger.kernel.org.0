Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A57E951479E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Apr 2022 12:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239024AbiD2K6q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Apr 2022 06:58:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239078AbiD2K6o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Apr 2022 06:58:44 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D263193E9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Apr 2022 03:55:26 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id t13so6633926pfg.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Apr 2022 03:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=HYcHI6QLaRQw6R7l9TIVLN2frcmSdkOTpZvjk+IDjzI=;
        b=OqFclAIAoCaID0bxn8a6QUkSObBHfgIy9wYxj5sAIAj6ibynACraltPYvn+bCOG1p/
         ZqD8phf0JQOLCKN/SCcn52ZAOpHoVjMkutOAcH/y79o+Qis61BRHn6GNeqeEKuQ2flS1
         AL87pl6N1AV9WpFuWra25ORhAfh5gKT4R/d1BUFP0pYkZdyLyqAZurCHvUrxf61gODNL
         KEuQK2y1+QjuEQHdEh/C/aUveqcTP8I9xsz/i5FQD35LK5AcTzYI9Ws9pswpPHVbewSz
         b5eSMEQSHve6d7ztFKrrjQMGjVlsN5kQ2UNfKNfbrSIxkyH4+SEzwa/iRKKyt0Bc7Vm5
         aJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=HYcHI6QLaRQw6R7l9TIVLN2frcmSdkOTpZvjk+IDjzI=;
        b=rC9TVYdxghlrfZUvzp7q2hTnNxBn+y/1yDeP/6vv3QwuuEdc2DzIpkW82zwIREkjJl
         Vwgq25iXm1xm9+9tAGFYKwMi69kseGtJ6yDpQPTKmqs/LeUciobW452LLe4ZVTsHsav0
         e1uuDMxEuc1dGd/Jpl5GZKh6g4XW6KLhndFjEt4TjFgqfjPzrSFGHHqWLKQm87pXxiMN
         brXc7Ea4tv+sN4YjGIt78u8sKb6WzDnZcBIlENjZwqjM5fEawzamzBqlXYAEcB70g624
         NMjz2D6AehAfenr5sTEFUfnIw6lcRwwkyoDoHqXVKEY+hQETAHSlOW/FlKCubpajrcv6
         Bbew==
X-Gm-Message-State: AOAM532BRsGbZTAaYvgOtWR41IMNiENNv3Pujw0GnJZ1+ubFTyQeBo4C
        tam8BbV/K+NyThWwq3RdzzSn+XGIWNu29k8zd6Y=
X-Google-Smtp-Source: ABdhPJzqQgVLTlbiPnT6j8pWZbjoEq8E9CzTxnNHr5vkaM9e7YN2VBHoGoEg+GyCDlGaN+H/Q+ESKA==
X-Received: by 2002:a05:6a00:1814:b0:50d:3ccc:653f with SMTP id y20-20020a056a00181400b0050d3ccc653fmr26351532pfa.70.1651229725497;
        Fri, 29 Apr 2022 03:55:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y2-20020a056a00190200b004fa865d1fd3sm2896508pfi.86.2022.04.29.03.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 03:55:25 -0700 (PDT)
Message-ID: <626bc41d.1c69fb81.d2825.708e@mx.google.com>
Date:   Fri, 29 Apr 2022 03:55:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2022-04-28-v5.18-rc4
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline-nfs: 46 runs,
 1 regressions (renesas-devel-2022-04-28-v5.18-rc4)
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

renesas/master baseline-nfs: 46 runs, 1 regressions (renesas-devel-2022-04-=
28-v5.18-rc4)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-04-28-v5.18-rc4/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-04-28-v5.18-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d9db556ad00ccf278daa20b573c5a0da6800aee6 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/626b8e257d5eea07fcff947f

  Results:     82 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-28-v5.18-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-28-v5.18-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220422.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/cas=
e/id/626b8e257d5eea07fcff94a1
        failing since 51 days (last pass: renesas-devel-2022-02-28-v5.17-rc=
6, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-04-29T07:04:49.560846  /lava-6207077/1/../bin/lava-test-case   =

 =20
